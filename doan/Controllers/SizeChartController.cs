using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class SizeChartController : Controller
    {
        // GET: SizeChart
        public ActionResult Index()
        {
            ViewBag.title = "Size Giày VANS -Cách Đo Size Giày VANS Chi Tiết";
            ViewBag.page = "Size Giày VANS -Cách Đo Size Giày VANS Chi Tiết";
            return View();
        }
    }
}