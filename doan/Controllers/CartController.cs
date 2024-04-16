using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using doan.Models;

namespace doan.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        [HttpGet]

        public ActionResult Index()
        {
            mapcart gh = Session["GioHang"] as mapcart;
            
            ViewBag.gh = "khong co gi";
            
            ViewData["Cart"] = gh;
            return View();
        }
        
        public ActionResult MoveSP(string masp)
        {
            mapcart gh = Session["GioHang"] as mapcart;
            gh.addItem(masp);
            Session["GioHang"] = gh;
            return RedirectToAction("Index");
        }
        public ActionResult ReduceSP(string masp)
        {
            mapcart gh = Session["GioHang"] as mapcart;
            gh.decrease(masp);
            Session["GioHang"] = gh;
            return RedirectToAction("Index");

        }
        public ActionResult RemoveSP(string masp)
        {
            mapcart gh = Session["GioHang"] as mapcart;
            gh.deleteItem(masp);
            Session["GioHang"] = gh;
            return RedirectToAction("Index");

        }
    }
}