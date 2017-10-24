using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System.Data;
using OfficeBook.WebAPI.Helpers;
using MySql.Data.MySqlClient;
using OfficeBook.Data.Service;
using OfficeBook.Data.DataModels;
using Dapper.Contrib.Extensions;
using Dapper;

namespace OfficeBook.WebAPI
{
    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddEnvironmentVariables();
            Configuration = builder.Build();
        }

        public IConfigurationRoot Configuration { get; set; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddCors(options =>
            //{
            //    // this defines a CORS policy called "default"
            //    options.AddPolicy("AppPolicy", policy =>
            //    {
            //        policy.WithOrigins("http://localhost:44350/")
            //            .AllowAnyHeader()
            //            .AllowAnyMethod()
            //            .AllowCredentials();

            //        policy.WithOrigins("http://localhost:44340/")
            //            .AllowAnyHeader()
            //            .AllowAnyMethod()
            //            .AllowCredentials();
            //    });
            //});

            var policy = new Microsoft.AspNetCore.Cors.Infrastructure.CorsPolicy();

            policy.Headers.Add("*");
            policy.Methods.Add("*");
            policy.Origins.Add("*");
            policy.SupportsCredentials = true;
            services.AddCors(x => x.AddPolicy("AppPolicy", policy));

            // Add framework services.
            services.Configure<DBConnectionSettings>(options =>
            {
                options.ConnectionString = Configuration["DB:Dev:ConnectionString"];
            });
            services.AddScopedFromFactory<MySqlConnection, MySQLConnectionFactory>();
            services.AddScoped(typeof(IService<>), typeof(Service<>));

            services.AddMvcCore()
                .AddAuthorization()
                .AddJsonFormatters();

            SqlMapperExtensions.TableNameMapper = (type) =>
            {
                //use exact name
                return type.Name;
            };
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            InitializeDatabase(app);

            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            app.UseCors("AppPolicy");

            app.UseIdentityServerAuthentication(new IdentityServerAuthenticationOptions
            {
                Authority = "http://localhost:44340/",
                ScopeName = "OfficeBook.WebApi",
                ScopeSecret = "1BCB6C91-533F-43EA-9CE4-4A1EE960BA2F",
                RequireHttpsMetadata = false,
                AutomaticAuthenticate = true,
                // required if you want to return a 403 and not a 401 for forbidden responses
                AutomaticChallenge = true
            });

            app.UseMvc();
        }

        private void InitializeDatabase(IApplicationBuilder app)
        {
            using (MySqlConnection connection = new MySqlConnection(Convert.ToString(Configuration["DB:Dev:ConnectionString"])))
            {
                IService<ob_groups> postsService = new Service<ob_groups>(connection);
                if (!postsService.Exists(new { Name = "Office", Handle = "@Office" }))
                {
                    postsService.Insert(new ob_groups()
                    {
                        Name = "Office",
                        Handle = "@Office",
                        Desc = "Office Public Group",
                        Editor = 0,
                        Creator = 0,
                    });
                };
            };
        }
    }
}
