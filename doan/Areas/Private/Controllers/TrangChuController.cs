using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using doan.Models;

namespace doan.Areas.Private.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: Private/Home
        public ActionResult Index()
        {
            //quanTri x = Session["TTDangNhap"] as quanTri;
            //if (x == null)
            //    Response.Redirect("~/DangNhap");
            return View();
        }
    }

}