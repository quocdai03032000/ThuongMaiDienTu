using System;
using System.Collections.Generic;
using System.IO;
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
            return View(database.SanPhams);
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
        // Thêm Sản phẩm

        [HttpPost]
        public ActionResult ThemSanPham(SanPham sp, string name, string desc, int price, int tyleID, string imageUploader, string imageUploader2, string imageUploader3, string imageUploader4, string imageUploader5)
        {
               if (sp.imageUploader != null)
                {
                var check = database.SanPhams.Where(a => a.SanPham_Name == name).SingleOrDefault();
                    if (check == null)
                    {
                        string fileName = Path.GetFileNameWithoutExtension(sp.imageUploader.FileName);
                        string extension = Path.GetExtension(sp.imageUploader.FileName);
                        fileName = fileName + extension;
                        string fileName2 = Path.GetFileNameWithoutExtension(sp.imageUploader2.FileName);
                        string extension2 = Path.GetExtension(sp.imageUploader2.FileName);
                        fileName2 = fileName2 + extension2;
                        string fileName3 = Path.GetFileNameWithoutExtension(sp.imageUploader3.FileName);
                        string extension3 = Path.GetExtension(sp.imageUploader3.FileName);
                        fileName3 = fileName3 + extension3;
                        string fileName4 = Path.GetFileNameWithoutExtension(sp.imageUploader4.FileName);
                        string extension4 = Path.GetExtension(sp.imageUploader4.FileName);
                        fileName4 = fileName4 + extension4;
                        string fileName5 = Path.GetFileNameWithoutExtension(sp.imageUploader5.FileName);
                        string extension5 = Path.GetExtension(sp.imageUploader5.FileName);
                        fileName5 = fileName5 + extension5;

                        sp.Main_img = "~/Content/Image_SanPham/" + fileName;
                        sp.Img1 = "~/Content/Image_SanPham/" + fileName2;
                        sp.Img2 = "~/Content/Image_SanPham/" + fileName3;
                        sp.Img3 = "~/Content/Image_SanPham/" + fileName4;
                        sp.Img4 = "~/Content/Image_SanPham/" + fileName5;
                        sp.imageUploader.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName));

                        sp.imageUploader2.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName2));
                        sp.imageUploader3.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName3));
                        sp.imageUploader4.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName4));
                        sp.imageUploader5.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName5));
                        sp.SanPham_Name = name;
                        sp.SanPham_description = desc;
                        sp.SanPham_Price = price;
                        sp.Type_SanPham_id = tyleID;
                        database.SanPhams.Add(sp);
                        database.SaveChanges();
                    }
                }
             
            return RedirectToAction("ProductManagement", "Admin");
        }

        //Sửa sản phẩm
        public ActionResult SuaSanPham(int id)
        {
            return View(database.SanPhams.Where(a => a.SanPham_Id == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult SuaSanPham(int id, SanPham sp, string imageUploader, string imageUploader2, string imageUploader3, string imageUploader4, string imageUploader5, int typeID, string name, string desc, int price)
        {
            sp = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            sp.Main_img = "~/Content/Image_SanPham/" + imageUploader;
            sp.Img1 = "~/Content/Image_SanPham/" + imageUploader2;
            sp.Img2 = "~/Content/Image_SanPham/" + imageUploader3;
            sp.Img3 = "~/Content/Image_SanPham/" + imageUploader4;
            sp.Img4 = "~/Content/Image_SanPham/" + imageUploader5;
            sp.SanPham_Name = name;
            sp.SanPham_description = desc;
            sp.SanPham_Price = price;
            sp.Type_SanPham_id = typeID;
            database.Entry(sp).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            ViewBag.EditThanhCong = "Chỉnh sửa thành công!";
            return RedirectToAction("SuaSanPham", "Admin");
        }
        //Xóa Sản phẩm
        public ActionResult XoaSanPham(int id)
        {
            var delSanpham = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            database.SanPhams.Remove(delSanpham);
            database.SaveChanges();
            return RedirectToAction("ProductManagement", "Admin");
        }
    }
}