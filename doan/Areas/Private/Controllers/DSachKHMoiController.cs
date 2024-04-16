using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Areas.Private.Controllers
{
    public class DSachKHMoiController : Controller
    {
        // GET: Private/DSachKHMoi
        private static ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
        [HttpGet]
        public ActionResult Index()
        {
            UpdateDL();
            return View();
        }
        [HttpPost]
        private void UpdateDL()
        {
            List<khachHang> list = db.khachHang.Where(x => x.soLanMua ==0).ToList<khachHang>();
            ViewData["DSKhachHang"] = list;
        }
    }
}