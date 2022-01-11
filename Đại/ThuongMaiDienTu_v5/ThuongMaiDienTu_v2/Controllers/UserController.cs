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

        // Index
        public ActionResult Index()
        {
            TempData["ReturnUrl"] = "Index";

            var Product = database.SanPhams.ToList().OrderByDescending(a => a.SanPham_Id).ToList().ToArray();
            var Product2 = database.SanPhams.ToList().ToArray();

            SanPham[] NewProduct = new SanPham[4];
            SanPham[] LikeProduct = new SanPham[4];

            var viewModel = new ViewModel();
            for (int i = 0; i < 4; i++)
            {
                NewProduct[i] = Product[i];
                LikeProduct[i] = Product2[i];
            }

            viewModel.NewProduct = NewProduct.ToList();
            viewModel.LikeProduct = LikeProduct.ToList();

            return View(viewModel);
        }

        // All Product
        public ActionResult AllProduct()
        {
            TempData["ReturnUrl"] = "AllProduct";
            return View();
        }

        // Product detail
        public ActionResult ProductDetail(int id)
        {
            TempData["ReturnUrl"] = "ProductDetail";
            var detail = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            ViewBag.ProductDetail = detail;
            TempData["ProductDetail"] = id;
            return View();
        }

        // Checkout
        [HttpGet]
        public ActionResult Checkout(Account account)
        {
            Cart ca = Session["Cart"] as Cart;
            // Đặt hàng khi chưa login
            if (Session["User"] == null)
            {
                TempData["ReturnUrl"] = "Checkout";
              
                return View(ca);

            }
            else if(Session["User"] != null)
            {
                TempData["ReturnUrl"] = "Checkout";
                
                Account user = Session["User"] as Account;
                
               /* account = database.Accounts.Where(a => a.Account_user == user).SingleOrDefault();*/
                Infor infoccount = database.Infors.Where(b => b.Account_id == user.id).SingleOrDefault();

                ViewBag.diachitinh = infoccount.TinhThanh;
                ViewBag.diachihuyen = infoccount.QuanHuyen;
                ViewBag.phuongxa = infoccount.PhuongXa;
                ViewBag.tenKH = infoccount.Name;
                ViewBag.sdtKH = infoccount.Phone;
                ViewBag.diachiKH = infoccount.DiaChi;
                ViewBag.emailKH = user.Account_user;               
            }
            return View(ca);
        }
        // Đặt hàng ship code 
        public ActionResult OderCod(string name, string email,string diachi,string sodienthoai, string calc_shipping_provinces,string calc_shipping_district,string phuongxa)
        {
            Cart cart = Session["Cart"] as Cart;
            if (Session["User"] == null)
            {
                int aa = cart.Items.Count();
                DonHang donhang = new DonHang();
                DonHangInfor dhinfo = new DonHangInfor();
                ProductListCheckout proList = new ProductListCheckout();
                donhang.NgayGio = DateTime.Now;
                donhang.TinhTrangDonHang_id = 1;
                donhang.PhuongThucThanhToan = "COD";
                donhang.TinhTrangThanhToan = "Chưa thanh toán";
                donhang.Total = cart.Total;
                database.DonHangs.Add(donhang);

                database.SaveChanges();
                foreach (var item in cart.Items)
                {

                    for (int i = 0; i < item.SoLuong; i++)
                    {
                        var sanpham = database.SanPhams.FirstOrDefault(a => a.SanPham_Id == item.sp.SanPham_Id);
                        var sanphamDetail = database.SanPhamDetails.FirstOrDefault(a => a.SanPhamDetail_id == sanpham.SanPhamDetail_id);
                        if (item.Size.Contains("S") && sanphamDetail.S > 0)
                        {
                            sanphamDetail.S -= 1;
                        }
                        if (item.Size.Contains("M") && sanphamDetail.M > 0)
                        {
                            sanphamDetail.M -= 1;
                        }
                        if (item.Size.Contains("L") && sanphamDetail.L > 0)
                        {
                            sanphamDetail.L -= 1;
                        }
                        if (item.Size.Contains("XL") && sanphamDetail.XL > 0)
                        {
                            sanphamDetail.XL -= 1;
                        }
                        if (item.Size.Contains("XXL") && sanphamDetail.XXL > 0)
                        {
                            sanphamDetail.XXL -= 1;
                        }

                        sanpham.SoLuong -= 1;
                        dhinfo.HoTen = name;
                        dhinfo.Email = email;
                        dhinfo.DiaChi = diachi;
                        dhinfo.Sdt = sodienthoai;
                        dhinfo.TinhThanh = calc_shipping_provinces;
                        dhinfo.QuanHuyen = calc_shipping_district;
                        dhinfo.PhuongXa = phuongxa;
                        database.DonHangInfors.Add(dhinfo);

                        proList.DonHang_id = donhang.DonHang_id;
                        proList.SanPham_id = item.sp.SanPham_Id;
                        proList.SoLuong = item.SoLuong;
                        proList.Price = cart.Totalitems();
                        proList.Size = item.Size;
                        database.ProductListCheckouts.Add(proList);
                    }
                }
                donhang.DonHangInfor_id = dhinfo.DonHangInfor_id;

                database.SaveChanges();
                Session["ThanhCong"] = "suss";
                cart.RemoveCartAll();
                return RedirectToAction("Index", "User");
            }
            else
            {
                Account user = Session["User"] as Account;
                int aa = cart.Items.Count();
                DonHang donhang = new DonHang();
                DonHangInfor dhinfo = new DonHangInfor();
                ProductListCheckout proList = new ProductListCheckout();

                donhang.NgayGio = DateTime.Now;
                donhang.TinhTrangDonHang_id = 1;
                donhang.Account_ID = user.id;
                donhang.PhuongThucThanhToan = "COD";
                donhang.TinhTrangThanhToan = "Chưa thanh toán";
                donhang.Total = cart.Total;
                database.DonHangs.Add(donhang);

                database.SaveChanges();
                foreach (var item in cart.Items)
                {

                    for (int i = 0; i < item.SoLuong; i++)
                    {
                        var sanpham = database.SanPhams.FirstOrDefault(a => a.SanPham_Id == item.sp.SanPham_Id);
                        var sanphamDetail = database.SanPhamDetails.FirstOrDefault(a => a.SanPhamDetail_id == sanpham.SanPhamDetail_id);
                        if (item.Size.Contains("S") && sanphamDetail.S > 0)
                        {
                            sanphamDetail.S -= 1;
                        }
                        if (item.Size.Contains("M") && sanphamDetail.M > 0)
                        {
                            sanphamDetail.M -= 1;
                        }
                        if (item.Size.Contains("L") && sanphamDetail.L > 0)
                        {
                            sanphamDetail.L -= 1;
                        }
                        if (item.Size.Contains("XL") && sanphamDetail.XL > 0)
                        {
                            sanphamDetail.XL -= 1;
                        }
                        if (item.Size.Contains("XXL") && sanphamDetail.XXL > 0)
                        {
                            sanphamDetail.XXL -= 1;
                        }

                        sanpham.SoLuong -= 1;
                        dhinfo.HoTen = name;
                        dhinfo.Email = email;
                        dhinfo.DiaChi = diachi;
                        dhinfo.Sdt = sodienthoai;
                        dhinfo.TinhThanh = calc_shipping_provinces;
                        dhinfo.QuanHuyen = calc_shipping_district;
                        dhinfo.PhuongXa = phuongxa;
                        database.DonHangInfors.Add(dhinfo);

                        proList.DonHang_id = donhang.DonHang_id;
                        proList.SanPham_id = item.sp.SanPham_Id;
                        proList.SoLuong = item.SoLuong;
                        proList.Price = cart.Totalitems();
                        proList.Size = item.Size;
                        database.ProductListCheckouts.Add(proList);
                    }
                }
                donhang.DonHangInfor_id = dhinfo.DonHangInfor_id;

                database.SaveChanges();
                Session["ThanhCong"] = "suss";
                cart.RemoveCartAll();
                return RedirectToAction("Index", "User");
            }              
            
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
        public ActionResult Contact()
        {
            ViewData["ReturnUrl"] = "AllProduct";
            return View();
        }

        // Cart
        public ActionResult Cart()
        {
            TempData["ReturnUrl"] = "Cart";
            Cart _cart = Session["Cart"] as Cart;
            if (_cart == null)
            {
                return RedirectToAction("CartNull", "User");
            }
            else
            {
                ViewBag.Currency = GetCart().TotalCurrency;
                return View(_cart);
            }
        }
        public ActionResult CartNull()
        {
            return View();
        }
        //------------------------------
        // Product Child
        //------------------------------

        public ActionResult Test()
        {
            return View();
        }

        //------------------------------
        // HTTP POST

        // Login
        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            var check = database.Accounts.Where(a => a.Account_user == email && a.Account_password == password).SingleOrDefault();
            string ReturnUrl;
            if (TempData["ReturnUrl"] == null)
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
            if (check == null)
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

        [HttpPost]
        public ActionResult AddToCart(int size, int soLuong, int id)
        {

            return View("ProductDetail");
        }

        //Giỏ hàng
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }


        public ActionResult AddToCart(int soLuong, string size)
        {
            int id = int.Parse(TempData["ProductDetail"].ToString());
            var sp = database.SanPhams.Where(a => a.SanPham_Id == id).SingleOrDefault();
            if (sp != null)
            {
                if (sp.SoLuong != 0)
                {
                    GetCart().AddToCart(sp, soLuong, size);
                    return Redirect("/User/ProductDetail/" + id);
                }
            }
            return View();
        }
        public ActionResult DelCart(int id, string size)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.RemoveCartItem(id, size);
            return RedirectToAction("Cart", "User");
        }


    }
}