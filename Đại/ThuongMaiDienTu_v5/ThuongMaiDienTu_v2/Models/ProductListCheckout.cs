//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ThuongMaiDienTu_v2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductListCheckout
    {
        public int ProductListCheckout_id { get; set; }
        public Nullable<int> DonHang_id { get; set; }
        public Nullable<int> SanPham_id { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string Size { get; set; }
        public Nullable<int> Price { get; set; }
    
        public virtual DonHang DonHang { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}
