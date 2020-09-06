using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;
using SachinM_KCDemo.Models;

namespace SachinM_KCDemo.Controllers.BookAPI
{
    public class BookAPIController : ApiController
    {
        // GET: api/BookAPI
        public IEnumerable<BookModel> Get()
        {
            var model = new BookModel().GetBookList();
            return  model;
        }

        // GET: api/BookAPI/5
        public BookModel Get(int id)
        {
            var model = new BookModel().GetBookDetails(id);
            return model;
        }

        // PUT: api/BookAPI/5
        public string Put(int id, BookModel model)
        {
            var message = new BookModel().SaveUpdateBook(model);
            return message;
        }
        // POST: api/BookAPI
        public void Post([FromBody]string value)
        {
        }

       

        // DELETE: api/BookAPI/5
        public void Delete(int id)
        {
        }
    }
}
