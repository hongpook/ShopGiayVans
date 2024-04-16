using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class ProductListController : Controller
    {
        // GET: ProductList
        public ActionResult Index( string maloai)
        {
            ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
            int ml = int.Parse(maloai);
            List<sanPham> list = db.sanPham.Where(x => x.maLoai.Equals(ml)).ToList<sanPham>();
            ViewData["DSachSPTheoLoai"] = list;
            loaiSP l = db.loaiSP.OrderBy(x => x.tenLoai).First();
            ViewBag.Pages = l;
            return View();
        }
    }
}