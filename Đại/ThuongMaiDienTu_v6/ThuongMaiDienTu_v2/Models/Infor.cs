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
    
    public partial class Infor
    {
        public int Infor_id { get; set; }
        public Nullable<int> Account_id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string DiaChi { get; set; }
        public string TinhThanh { get; set; }
        public string QuanHuyen { get; set; }
        public string PhuongXa { get; set; }
        public string BuyHistory { get; set; }
    
        public virtual Account Account { get; set; }
    }
}
