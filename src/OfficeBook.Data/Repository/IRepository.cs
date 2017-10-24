using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using OfficeBook.Data.DataModels;
using System.Threading.Tasks;
using System.Threading;

namespace OfficeBook.Data.Repository
{
    public interface IRepository<TEntity> where TEntity : class, IEntity
    {
        TEntity Find(params object[] keyValues);
        void Insert(TEntity entity);
        void InsertRange(IEnumerable<TEntity> entities);
        void Update(TEntity entity);
        void Delete(object id);
        void Delete(TEntity entity);
        Task<TEntity> FindAsync(params object[] keyValues);
        Task<TEntity> FindAsync(CancellationToken cancellationToken, params object[] keyValues);
        Task<bool> DeleteAsync(params object[] keyValues);
        Task<bool> DeleteAsync(CancellationToken cancellationToken, params object[] keyValues);
    }
}