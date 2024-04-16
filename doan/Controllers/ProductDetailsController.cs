using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class ProductDetailsController : Controller
    {
        // GET: ProductDetails
        [HttpGet]
        public ActionResult Index(string maSP)
        {
            ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
            sanPham sp = db.sanPham.Where(x => x.maSP == maSP).First<sanPham>();
            ViewData["CTSP"] = sp;
            return View();
        }

        
    }

}