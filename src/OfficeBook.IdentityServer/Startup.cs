using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using IdentityServer4.Models;
using IdentityServer4.Services.InMemory;
using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using OfficeBook.IdentityServer.Config;
using Microsoft.AspNetCore.Http.Features.Authentication;
using System.Security.Claims;
using MySQL.Data.EntityFrameworkCore.Extensions;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Configuration;
using OfficeBook.IdentityServer.Services;
using Microsoft.AspNetCore.Mvc;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Mappers;
using IdentityServer4.Services;
using IdentityServer4;


//https://www.scottbrady91.com/Identity-Server/Getting-Started-with-IdentityServer-4
namespace OfficeBook.IdentityServer
{
    public class Startup
    {

        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true);

            if (env.IsDevelopment())
            {
                // For more details on using the user secret store see http://go.microsoft.com/fwlink/?LinkID=532709
                builder.AddUserSecrets();
            }

            builder.AddEnvironmentVariables();
            Configuration = builder.Build();
        }

        public IConfigurationRoot Configuration { get; }
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=398940
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

            //        policy.WithOrigins("http://localhost:44360/")
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

            //const string connectionString = @"Data Source=(LocalDb)\MSSQLLocalDB;database=Test.IdentityServer4.EntityFramework;trusted_connection=yes;";
            //string connectionString = @"Data Source=CVLHyd12\SQLExpress;Initial Catalog=IdentityServerTest;Persist Security Info=True;User ID=sa;Password=sa_123;trusted_connection=yes;";
            string connectionString = @"server=localhost;user id=root;password=root;persistsecurityinfo=True;database=officebook_identityserver";
            //  var migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;


            services.AddDbContext<ApplicationDbContext>(options => options.UseMySQL(connectionString, b => b.MigrationsAssembly("OfficeBook.IdentityServer")));
            services.AddIdentity<ApplicationUser, IdentityRole<int>>()
                //.AddUserStore<UserStore<IdentityUser<int>, IdentityRole<int>, ApplicationDbContext, long>>()
                //.AddRoleStore<RoleStore<IdentityRole<int>, ApplicationDbContext, long>>()
                .AddEntityFrameworkStores<ApplicationDbContext, int>()
                .AddDefaultTokenProviders()
                .AddIdentityServerUserClaimsPrincipalFactory();

            // Add application services.
            services.AddTransient<IEmailSender, AuthMessageSender>();
            services.AddTransient<ISmsSender, AuthMessageSender>();
            //services.AddTransient<IProfileService, IdentityServer4.AspNetIdentity.ProfileService<ApplicationUser>>();

            services.AddIdentityServer()
            // .AddOperationalStore(builder =>
            //   builder.UseMySQL(connectionString, b => b.MigrationsAssembly("OfficeBook.IdentityServer")))
            // .AddConfigurationStore(builder =>
            //   builder.UseMySQL(connectionString, b => b.MigrationsAssembly("OfficeBook.IdentityServer")))
            .AddAspNetIdentity<ApplicationUser>()
            //.AddInMemoryStores()
            // .AddInMemoryUsers(Users.Get())
             .AddInMemoryClients(Clients.Get())
             .AddInMemoryScopes(Scopes.Get())
            .AddTemporarySigningCredential();

            services.AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            app.UseCors("AppPolicy");

            InitializeDatabase(app);

            loggerFactory.AddConsole();

            //Add the IdentityServer middleware to the HTTP pipeline: - Rama Kathare


            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseDatabaseErrorPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
            }

            //app.Run(async (context) =>
            //{
            //    await context.Response.WriteAsync("Hello World!");
            //});
            //app.UseJwtBearerAuthentication();
            app.UseIdentity();
            app.UseIdentityServer();



            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationScheme = IdentityServerConstants.ExternalCookieAuthenticationScheme,

                AutomaticAuthenticate = false,
                AutomaticChallenge = false
            });

            var externalCookieScheme = app.ApplicationServices.GetRequiredService<IOptions<IdentityOptions>>().Value.Cookies.ExternalCookieAuthenticationScheme;

            app.UseGoogleAuthentication(new GoogleOptions
            {
                AuthenticationScheme = "Google",
                DisplayName = "Google",
                SignInScheme = externalCookieScheme,

                ClientId = "976883419931-99qvkd96kf0ursjuoul0vq0vpk6rcvfa.apps.googleusercontent.com",
                ClientSecret = "l60ywCVz-XJospEmXMLtqvEI"
            });



            app.UseStaticFiles();
            app.UseMvcWithDefaultRoute();
            app.UseMvc(options =>
            {
                options.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}"
                    );
            });
        }

        private void InitializeDatabase(IApplicationBuilder app)
        {
            //using (var scope = app.ApplicationServices.GetService<IServiceScopeFactory>().CreateScope())
            //{
            //    scope.ServiceProvider.GetRequiredService<PersistedGrantDbContext>().Database.Migrate();

            //    var context = scope.ServiceProvider.GetRequiredService<ConfigurationDbContext>();
            //    context.Database.Migrate();
            //    if (!context.Clients.Any())
            //    {
            //        foreach (var item in Clients.Get())
            //        {
            //            context.Clients.Add(item.ToEntity());
            //        }
            //        context.SaveChanges();
            //    }

            //    if (!context.Scopes.Any())
            //    {
            //        foreach (var item in Scopes.Get())
            //        {
            //            context.Scopes.Add(item.ToEntity());
            //        }
            //        context.SaveChanges();
            //    }
            //}
        }
    }
}
