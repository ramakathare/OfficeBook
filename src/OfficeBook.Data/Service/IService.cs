using Dapper;
using OfficeBook.Data.DataModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace OfficeBook.Data.Service
{
    public interface IService<TEntity> where TEntity : IEntity
    {
        Task<int> InsertAsync(TEntity entity);
        long Insert(TEntity entity);
        Task<bool> UpdateAsync(TEntity entity);
        bool Update(TEntity entity);
        Task<bool> DeleteAsync(TEntity entity);
        bool Delete(TEntity entity);
        bool DeleteAll();
        Task<bool> DeleteAllAsync();
        TEntity Get(int Id);
        Task<TEntity> GetAsync(int Id);
        IEnumerable<TEntity> GetAll();
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task<bool> ExistsAsync(object obj);
        bool Exists(object obj);
    }
}
