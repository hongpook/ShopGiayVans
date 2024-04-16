using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class SeachController : Controller
    {
        // GET: Seach
        public ActionResult Index()
        {
            ViewBag.title = "Seach";
            ViewBag.seach = "VANS Việt Nam";
            ViewBag.page = "Tìm kiếm";
            return View();
        }
    }
}