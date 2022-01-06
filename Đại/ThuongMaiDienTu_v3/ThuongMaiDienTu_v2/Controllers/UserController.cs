using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThuongMaiDienTu_v2.Models;

namespace ThuongMaiDienTu_v2.Controllers
{
    public class UserController : Controller
    {
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();
        public ActionResult Index()
        {
            TempData["ReturnUrl"] = "Index";
            return View();
        }

        // All Product
        public ActionResult AllProduct()
        {
            TempData["ReturnUrl"] = "AllProduct";
            return View();
        }

        // Product detail
        public ActionResult ProductDetail()
        {
            TempData["ReturnUrl"] = "ProductDetail";
            return View();
        }
        // Cart
        public ActionResult Cart()
        {
            TempData["ReturnUrl"] = "Cart";
            return View();
        }

        // Checkout
        public ActionResult Checkout()
        {
            TempData["ReturnUrl"] = "Checkout";
            return View();
        }
        // Login
        public ActionResult Login()
        {
            return View();
        }

        // Logout        
        public ActionResult Logout()
        {
            Session["User"] = null;
            return RedirectToAction("Index", "User");
        }

        // Register
        public ActionResult Register()
        {
            return View();
        }

        //Contact
        public ActionResult Contact ()
        {
            ViewData["ReturnUrl"] = "AllProduct";
            return View();
        }
        //------------------------------
        // Product Child
        //------------------------------


        //------------------------------
        // HTTP POST

        // Login
        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            var check = database.Accounts.Where(a => a.Account_user == email && a.Account_password == password).SingleOrDefault();
            string ReturnUrl;
            if(TempData["ReturnUrl"] == null)
            {
                ReturnUrl = "Index";
            }
            else
            {
                ReturnUrl = TempData["ReturnUrl"].ToString();
            }
            if (check != null)
            {
                Account ac = database.Accounts.Where(a => a.Account_user == email).SingleOrDefault();
                Session["User"] = ac;
                Session["UserInfor"] = database.Infors.Where(a => a.Account_id == ac.id).SingleOrDefault();
                return RedirectToAction(ReturnUrl);
            }
            else
            {
                TempData["ErrorLogin"] = "Sai tên tài khoản hoặc mật khẩu";
                return View("Login");
            }
            
        }        

        // Register
        [HttpPost]
        public ActionResult Register(string name, string phone, string email, string password)
        {
            var check = database.Accounts.Where(a => a.Account_user == email).SingleOrDefault();
            if(check == null)
            {
                Account ac = new Account();                
                ac.Account_user = email;
                ac.Account_password = password;
                ac.Account_role_id = 2;
                database.Accounts.Add(ac);

                Infor infor = new Infor();
                infor.Account_id = ac.id;
                infor.Name = name;
                infor.Phone = phone;
                database.Infors.Add(infor);

                

                database.SaveChanges();
                return RedirectToAction("Login", "User");
            }
            else
            {
                TempData["ErrorRegister"] = "Đã tồn tại Email này! Vui lòng đăng ký lại";
                return View("Register");
            }
            
        }

    }
}