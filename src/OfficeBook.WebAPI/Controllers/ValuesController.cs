using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using OfficeBook.Business.Services;
using Microsoft.Extensions.Configuration;
using OfficeBook.Data.Service;
using OfficeBook.Data.DataModels;
using Microsoft.AspNetCore.Authorization;

namespace OfficeBook.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    public class ValuesController : ControllerBase
    {
        private readonly IService<ob_files> fileService;

        public ValuesController(IService<ob_files> _fileService)
        {
            fileService = _fileService;
        }
        // GET api/values
        [HttpGet]
        public object Get()
        {
            return fileService.GetAll();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return fileService.TestMethod();
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
