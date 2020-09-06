using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SachinM_KCDemo.Data;

namespace SachinM_KCDemo.Models
{
    public class BookModel
    {
        public long BookID { get; set; }
        public string Name { get; set; }
        public string ISBN { get; set; }
        public string Author { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }

        public List<BookModel> GetBookList()
        {
            SachinM_KCDemoEntities db = new SachinM_KCDemoEntities();
            List<BookModel> lstBook = new List<BookModel>();
            var bookList = db.tbl_Book.ToList();
            if (bookList != null)
            {
                foreach (var bl in bookList)
                {
                    lstBook.Add(new BookModel
                    {
                        BookID = bl.BookID,
                        Name = bl.Name,
                        ISBN = (bl.ISBN==null?"":bl.ISBN),
                        Description = bl.Description,
                        Photo = bl.Photo,
                        Author=bl.Author,
                    });
                }
            }
            db.Dispose();
            return lstBook;
        }
        public BookModel GetBookDetails(int ID)
        {
            SachinM_KCDemoEntities db = new SachinM_KCDemoEntities();
            try
            {                
                BookModel model = new BookModel();
                var bookDet = db.tbl_Book.Where(p => p.BookID == ID).FirstOrDefault();
                if (bookDet!=null){
                    model.BookID = bookDet.BookID;
                    model.Name = bookDet.Name;
                    model.ISBN = (bookDet.ISBN==null?"":bookDet.ISBN);
                    model.Author = bookDet.Author;
                    model.Description = bookDet.Description;
                    model.Photo = bookDet.Photo;
                }
                db.Dispose();
                return model;
            }
            catch(Exception ex)
            {
                db.Database.Connection.Close();
                throw ex;
            }
        }
        public string SaveUpdateBook(BookModel model)
        {
            SachinM_KCDemoEntities db = new SachinM_KCDemoEntities();
            if (model.BookID != 0)
            {
                var bookDet = db.tbl_Book.Where(p => p.BookID == model.BookID).FirstOrDefault();
                if (bookDet != null)
                {
                    bookDet.Name = model.Name;
                    bookDet.ISBN = model.ISBN;
                    bookDet.Description = model.Description;
                    bookDet.Author = model.Author;
                }
                db.SaveChanges();
            }
            return "Book Updated Successfully";
            }
    }
}