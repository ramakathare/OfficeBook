using System;
using System.Data;
using OfficeBook.Data.DataModels;
using OfficeBook.Data.Repository;

namespace OfficeBook.Data.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        void Dispose(bool disposing);
        IRepository<TEntity> Repository<TEntity>() where TEntity : class, IEntity;
        void BeginTransaction(IsolationLevel isolationLevel = IsolationLevel.Unspecified);
        bool Commit();
        void Rollback();
    }
}