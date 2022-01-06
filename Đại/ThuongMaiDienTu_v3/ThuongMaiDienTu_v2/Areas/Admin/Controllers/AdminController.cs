using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThuongMaiDienTu_v2.Models;

namespace ThuongMaiDienTu_v2.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();

        //Index
        public ActionResult Index()
        {
            if (Session["admin"] !=null)
            {
                return View();
            }
            return RedirectToAction("Login", "Admin");
        }

        //Login
        public ActionResult Login()
        {
            return View();
        }

        //User Management
        public ActionResult UserManagement()
        {
            return View();
        }

        //Product Management
        public ActionResult ProductManagement()
        {
            return View();
        }

        //Order
        public ActionResult Order()
        {
            return View();
        }

        //Log out
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Admin");
        }
        //------------------------------------
        //------------- Http Post ------------

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            var check = database.Accounts.Where(a => a.Account_user == email && a.Account_password == password).SingleOrDefault();
            if(check !=null)
            {
                Session["admin"] = check;
                return RedirectToAction("Index","Admin");
            }
            TempData["ErrorLogin"] = "Sai tên tài khoản hoặc mật khẩu !";
            return View("Login");
        }
        


    }
}