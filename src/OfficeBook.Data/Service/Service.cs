using Dapper;
using Dapper.Contrib.Extensions;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using OfficeBook.Data.DataModels;
using OfficeBook.Data.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Reflection;

namespace OfficeBook.Data.Service
{
    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    public sealed class Service<TEntity> : IService<TEntity> where TEntity : class, IEntity
    {
        //Since MySQLConnection is a sealed class unable to abstract. Hence injecting MySQLConnection. 
        internal readonly MySqlConnection connection;
        internal readonly string tableName;

        public Service(MySqlConnection _connection)
        {
            tableName = typeof(TEntity).Name;
            connection = _connection;
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }
        }
        public Task<int> InsertAsync(TEntity entity)
        {
            return connection.InsertAsync<TEntity>(entity);
        }
        public long Insert(TEntity entity)
        {
            return connection.Insert<TEntity>(entity);
        }
        public Task<bool> UpdateAsync(TEntity entity)
        {
            return connection.UpdateAsync<TEntity>(entity);
        }
        public bool Update(TEntity entity)
        {
            return connection.Update<TEntity>(entity);
        }

        public Task<bool> DeleteAsync(TEntity entity)
        {
            return connection.DeleteAsync<TEntity>(entity);
        }
        public bool Delete(TEntity entity)
        {
            return connection.Delete<TEntity>(entity);
        }
        public bool DeleteAll()
        {
            return connection.DeleteAll<TEntity>();
        }

        public Task<bool> DeleteAllAsync()
        {
            return connection.DeleteAllAsync<TEntity>();
        }

        public TEntity Get(int Id)
        {
            return connection.Get<TEntity>(Id);
        }

        public Task<TEntity> GetAsync(int Id)
        {
            return connection.GetAsync<TEntity>(Id);
        }

        public IEnumerable<TEntity> GetAll()
        {
            return connection.GetAll<TEntity>();
        }
        
        public Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return connection.GetAllAsync<TEntity>();
        }

        public Task<bool> ExistsAsync(object obj)
        {
            string query = ExistsQuery(obj);
            return connection.QueryFirstOrDefaultAsync<bool>(query, obj);
        }
        public bool Exists(object obj)
        {
            string query = ExistsQuery(obj);
            return connection.QueryFirstOrDefault<bool>(query, obj);
        }
        private string ExistsQuery(object obj)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT EXISTS(SELECT 1 FROM " + tableName);

            if (obj != null)
            {
                var properties = obj.GetType().GetTypeInfo().GetProperties(BindingFlags.DeclaredOnly |
                            BindingFlags.Public |
                            BindingFlags.Instance);
                if (properties.Count() > 0)
                {
                    sb.Append(" where ");
                    List<string> conditions = new List<string>();
                    foreach (var prop in properties)
                    {
                        var key = prop.Name;
                        conditions.Add(key + " = @" + key);
                    }
                    sb.Append(String.Join(" and ", conditions));
                }
            }
            sb.Append(")");
            return sb.ToString();
        }
    }
}
