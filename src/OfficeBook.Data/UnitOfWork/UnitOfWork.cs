using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using OfficeBook.Data.Repository;
using OfficeBook.Data.DataModels;

namespace OfficeBook.Data.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        #region Private Fields
        
        private bool _disposed;
        private IDbTransaction _transaction;
        private Dictionary<string, dynamic> _repositories;
        private IDbConnection dbConnection;

        #endregion Private Fields

        #region Constuctor/Dispose

        public UnitOfWork(IDbConnection _dbConnection)
        {
            dbConnection = _dbConnection;
            if (dbConnection.State != ConnectionState.Open)
            {
                dbConnection.Open();
            }
            _repositories = new Dictionary<string, dynamic>();
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public virtual void Dispose(bool disposing)
        {
            if (_disposed)
                return;

            if (disposing)
            {
                // free other managed objects that implement
                // IDisposable only

                try
                {
                    if (dbConnection != null && dbConnection.State == ConnectionState.Open)
                    {
                        dbConnection.Close();
                    }
                }
                catch (ObjectDisposedException)
                {
                    // do nothing, the objectContext has already been disposed
                }
            }

            // release any unmanaged objects
            // set the object references to null

            _disposed = true;
        }

        #endregion Constuctor/Dispose
        public IRepository<TEntity> Repository<TEntity>() where TEntity : class, IEntity
        {
            throw new NotImplementedException();
            //if (_repositories == null)
            //{
            //    _repositories = new Dictionary<string, dynamic>();
            //}

            //var type = typeof(TEntity).Name;

            //if (_repositories.ContainsKey(type))
            //{
            //    return (IRepository<TEntity>)_repositories[type];
            //}

            //var repositoryType = typeof(Repository<>);

            //_repositories.Add(type, Activator.CreateInstance(repositoryType.MakeGenericType(typeof(TEntity)), dbConnection, this));

            //return _repositories[type];
        }

        #region Unit of Work Transactions

        public void BeginTransaction(IsolationLevel isolationLevel = IsolationLevel.Unspecified)
        {
            if (dbConnection.State != ConnectionState.Open)
            {
                dbConnection.Open();
            }
            _transaction = dbConnection.BeginTransaction(isolationLevel);
        }

        public bool Commit()
        {
            _transaction.Commit();
            return true;
        }

        public void Rollback()
        {
            _transaction.Rollback();
        }

        

        #endregion
    }
}
