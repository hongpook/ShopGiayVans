using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class NewsController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(string duyet)
        {
            ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
            baiViet bv = db.baiViet.Find(duyet);
            List<baiViet> list = db.baiViet.OrderByDescending(x => x.ngayDang).ToList<baiViet>();
            ViewData["DSBV"] = list;
            return RedirectToAction("Index");
        }
        
    }
}