using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThuongMaiDienTu_v2.Models;

namespace ThuongMaiDienTu_v2.Areas.Admin.Controllers
{
    public class MainController : Controller
    {
        //Khai báo database
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();
        
        public ActionResult Index()
        {
            return View();
        }
        //Login
        public ActionResult Login()
        {
            return View();
        }
        //Quản lý sản phẩm 
        public ActionResult ProductManagememt()
        {
            SanPham sp = new SanPham();
            return View(sp);
        }
        //Thêm sản phẩm
        [HttpPost]
        public ActionResult AddProduct(SanPham sp, string name, string desc, int price)
        {
            var check = database.SanPhams.Where(a => a.SanPham_Name == name).SingleOrDefault();
            if (check == null)
            {
                sp.SanPham_Name = name;
                sp.SanPham_description = desc;
                sp.SanPham_Price = price;
                database.SanPhams.Add(sp);
                database.SaveChanges();


            }
            return RedirectToAction("ProductManagememt", "Main");
        }
        //Sản phẩm chi tiết
        public ActionResult ProductDetail()
        {
            return View();
        }
        //Đơn hàng
        public ActionResult Order()
        {
            return View();
        }
        //Đơn hàng chi tiết
        public ActionResult OrderDetail()
        {
            return View();
        }
    }
}