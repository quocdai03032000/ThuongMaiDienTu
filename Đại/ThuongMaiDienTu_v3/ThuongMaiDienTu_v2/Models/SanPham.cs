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
    
    public partial class SanPham
    {
        public int SanPham_Id { get; set; }
        public string SanPham_Name { get; set; }
        public string SanPham_description { get; set; }
        public Nullable<int> SanPham_Price { get; set; }
        public Nullable<int> SanPham_priceSale { get; set; }
        public Nullable<bool> Sale_key { get; set; }
        public string Main_img { get; set; }
        public string Img1 { get; set; }
        public string Img2 { get; set; }
        public string Img3 { get; set; }
        public string Img4 { get; set; }
        public Nullable<int> Type_SanPham_id { get; set; }
    
        public virtual Type_SanPham Type_SanPham { get; set; }
        public virtual SanPhamDetail SanPhamDetail { get; set; }
    }
}
