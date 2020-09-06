using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachinM_KCDemo.Models;

namespace SachinM_KCDemo.Controllers
{
    public class BookController : Controller
    {
        // GET: Book
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BookList()
        {
            var model = new BookModel().GetBookList();
            return View("..//Book//BookList", model);
           
        }
        public ActionResult GetBookList()
        {
            try
            {
                return Json((new BookModel().GetBookList()), JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new{error = ex.Message}, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Details(int id)
        {
            var model = new BookModel().GetBookDetails(id);
            return View("..//Book//Details",model);
        }
        public ActionResult GetBookDetails(int ID)
        {
            try
            {
                return Json((new BookModel().GetBookDetails(ID)), JsonRequestBehavior.AllowGet);
            }
            catch(Exception ex)
            {
                return Json(new { error = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}