using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Code_NhapSanPham.Models;


namespace Code_NhapSanPham.Controllers
{

    public class HomeController : Controller
    {
        ThuongMaiDienTuEntities dataB = new ThuongMaiDienTuEntities();
        public ActionResult Index()
        {
            return View(dataB.SanPhams);
        }

        public ActionResult CreateSanPham()
        {
            SanPham sp = new SanPham();
            return View(sp);
        }
        [HttpPost]
        public ActionResult CreateSanPham(SanPham sanpham, int maSanPham, string nameSanPham,  string desSanPham, float priceSanPham, float PriceSale, int typeSanPhamid, bool salekey, string imageUploader)
        {
            try
            {
                if (sanpham.imageUploader != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(sanpham.imageUploader.FileName);
                    string extension = Path.GetExtension(sanpham.imageUploader.FileName);
                    fileName = fileName + extension;
                    sanpham.img = "~/Content/Image_SanPham/" + fileName;
                    sanpham.imageUploader.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName));
                }

                var check = dataB.SanPhams.Where(a => a.SanPham_id == maSanPham).SingleOrDefault();

                if (check == null)
                {

                    sanpham.SanPham_id = maSanPham;
                    sanpham.SanPham_name = nameSanPham;
                    sanpham.SanPham_price = priceSanPham;
                    sanpham.SanPham_description = desSanPham;
                    sanpham.SanPham_pirceSale = PriceSale;
                    sanpham.Type_SanPham_id = typeSanPhamid;
                    sanpham.Sale_key = salekey;
                    dataB.SanPhams.Add(sanpham);
                    dataB.SaveChanges();
                    return RedirectToAction("Index", "Home");

                }
                else
                {
                    ViewBag.ErrorCreate = "Trùng mã sản phẩm trước đó";
                    return View(sanpham);
                }
            }
            catch
            {
                return View(Content("Dữ Liệu đã tồn tại!!"));
            }

        }
        public ActionResult EditSanPham(int id)
        {
            return View(dataB.SanPhams.Where(a => a.SanPham_id == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult EditSanPham(int id,SanPham sanpham)
        {
            sanpham = dataB.SanPhams.Where(a=>a.SanPham_id == id).SingleOrDefault();

            dataB.Entry(sanpham).State = System.Data.Entity.EntityState.Modified;
            dataB.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public ActionResult DeleteSanPham(int id)
        {
            var delSanpham = dataB.SanPhams.Where(a => a.SanPham_id == id).SingleOrDefault();
            dataB.SanPhams.Remove(delSanpham);
            dataB.SaveChanges();
            return RedirectToAction("Index", "Home");

        }
    }
}