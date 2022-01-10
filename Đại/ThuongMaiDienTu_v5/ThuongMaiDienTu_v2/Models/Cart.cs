using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace ThuongMaiDienTu_v2.Models
{
    public class Cart
    {
        ThuongMaiDienTuEntities database = new ThuongMaiDienTuEntities();
        
        public class CartItem
        {
            public SanPham sp { get; set; }
            public int SoLuong { get; set; }
            public string Size { get; set; }
        }
        public int SumProduct { get; set; }
        public int Total { get; set; }
        public string TotalCurrency { get; set; }
        List<CartItem> items = new List<CartItem>();

        public IEnumerable<CartItem> Items
        {
            get { return items; }
        }

        public void AddToCart(SanPham sanPham, int soLuong, string size)
        {
            bool flag = false;            
            foreach (var item in items)
            {
                var a= item.sp.SanPhamDetail.L;
                if(item.sp.SanPham_Id==sanPham.SanPham_Id && item.Size == size)
                {
                    flag = true;
                    break;
                }
            }
            if(flag)
            {
                var item = items.FirstOrDefault(s => s.sp.SanPham_Id == sanPham.SanPham_Id);
                item.SoLuong += soLuong;
                SumProduct += soLuong;
                TotalPrice();
            }
            else
            {
                items.Add(new CartItem
                {
                    sp = sanPham,
                    SoLuong = soLuong,
                    Size = size
                });
                SumProduct += soLuong;
                TotalPrice();
            }
            
        }
        public void RemoveCartItem(int id, string size)
        {

            items.RemoveAll(a => a.sp.SanPham_Id == id && a.Size==size);
        }

        public void TotalPrice()
        {
            Reset();
            foreach (var item in items)
            {
                Total += int.Parse((item.sp.SanPham_Price * item.SoLuong).ToString());
            }
            TotalToCurrency();
        }

        public void TotalToCurrency()
        {
            CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");
            TotalCurrency = Total.ToString("#,###", cul.NumberFormat);           
        }
        public void Reset()
        {
            Total = 0;
        }
        
    }
}