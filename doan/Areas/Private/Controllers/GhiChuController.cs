using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Areas.Private.Controllers
{
    public class GhiChuController : Controller
    {
        // GET: Private/GhiChu
        public ActionResult Index()
        {
            return View();
        }
    }
}