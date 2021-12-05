using System.Web;
using System.Web.Mvc;

namespace Code_NhapSanPham
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
