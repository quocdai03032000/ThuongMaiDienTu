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
    
    public partial class Type_SanPham
    {
        public int Type_SanPham_id { get; set; }
        public string Type_name { get; set; }
    
        public virtual SanPham SanPham { get; set; }
    }
}
