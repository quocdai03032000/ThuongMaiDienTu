using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThuongMaiDienTu_v2.Models
{
    public class ViewModel
    {
        public  List<SanPham> NewProduct { get; set; }
        public List<SanPham> LikeProduct { get; set; }

        public IEnumerable<SanPham> New
        {
            get { return NewProduct; }
        }
    }
}