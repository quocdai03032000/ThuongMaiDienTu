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
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Web;

    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            this.ProductListCheckouts = new HashSet<ProductListCheckout>();
            Main_img = "~/Contents/images/add.png";
        }
    
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
        public Nullable<int> SanPhamDetail_id { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string StringPrice { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductListCheckout> ProductListCheckouts { get; set; }
        public virtual SanPhamDetail SanPhamDetail { get; set; }
        public virtual Type_SanPham Type_SanPham { get; set; }

        [NotMapped]
        public HttpPostedFileBase imageUploader { get; set; }
        [NotMapped]
        public HttpPostedFileBase imageUploader2 { get; set; }
        [NotMapped]
        public HttpPostedFileBase imageUploader3 { get; set; }
        [NotMapped]
        public HttpPostedFileBase imageUploader4 { get; set; }
        [NotMapped]
        public HttpPostedFileBase imageUploader5 { get; set; }

    }
}
