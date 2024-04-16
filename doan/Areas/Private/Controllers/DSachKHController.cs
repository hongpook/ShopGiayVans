using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Areas.Private.Controllers
{
    public class DSachKHController : Controller
    {
        // GET: Private/DSachKH
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
            List<khachHang> list = db.khachHang.OrderByDescending(x => x.soLanMua).ToList<khachHang>();
            ViewData["DSKhachHang"] = list;
        }
    }
}