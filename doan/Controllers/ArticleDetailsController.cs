using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class ArticleDetailsController : Controller
    {
        // GET: ArticleDetails
        public ActionResult Index(string maBV)
        {
            ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
            baiViet bv = db.baiViet.Where(x => x.maBV == maBV).First<baiViet>();
            ViewData["CTBV"] = bv;
            return View();
        }
    }
}