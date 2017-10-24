using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using OfficeBook.Data.DataModels;
using OfficeBook.Data.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace OfficeBook.WebAPI.Helpers
{
    public interface IServiceFactory<T> where T : class
    {
        T Build();
    }

    //http://www.codeproject.com/Articles/750269/Extending-IDbConnection-and-getting-help-from-Dapp
    public class IDbConnectionFactory : IServiceFactory<IDbConnection>
    {
        private readonly DBConnectionSettings _options;
        private readonly ILogger<IDbConnectionFactory> _logger;
        public IDbConnectionFactory(IOptions<DBConnectionSettings> options, ILogger<IDbConnectionFactory> logger)
        {
            _options = options.Value;
            _logger = logger;
            _logger.LogInformation("SQLConnectionFactory Constructor called.");
        }
        public IDbConnection Build()
        {
            return new SqlConnection(_options.ConnectionString);
        }
    }

    public class MySQLConnectionFactory : IServiceFactory<MySqlConnection>
    {
        private readonly DBConnectionSettings _options;
        private readonly ILogger<MySQLConnectionFactory> _logger;
        public MySQLConnectionFactory(IOptions<DBConnectionSettings> options, ILogger<MySQLConnectionFactory> logger)
        {
            _options = options.Value;
            _logger = logger;
            _logger.LogInformation("MySQLConnectionFactory Constructor called.");
        }
        public MySqlConnection Build()
        {
            return new MySqlConnection(_options.ConnectionString);
        }
    }

}
