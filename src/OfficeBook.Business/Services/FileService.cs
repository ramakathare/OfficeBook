using OfficeBook.Data.DataModels;
using OfficeBook.Data.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using OfficeBook.Data.Repository;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using Dapper;

namespace OfficeBook.Business.Services
{
    public static class FileService
    {
        public static string TestMethod(this IService<ob_files> fileService)
        {
            return "Test Method reached";
        }
    }
}
