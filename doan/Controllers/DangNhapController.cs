using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class DangNhapController : Controller
    {
        // GET: Private/DangNhap
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string Email, string Pass)
        {
            
            quanTri ttdn = new ShopGiayVansEntities2().quanTri.Where(x => x.email.Equals(Email.ToLower().Trim()) && x.matKhau.Equals(Pass)).First<quanTri>();
            bool isAuthentic = ttdn != null && ttdn.email.Equals(Email.ToLower().Trim()) && ttdn.matKhau.Equals(Pass);
            if (isAuthentic)
            {
                Session["TTDangNhap"] = ttdn;
                Session["user"] = ttdn.hoDem + ttdn.tenTV;
                Session["hinh"] = ttdn.hinhTV;
                return RedirectToAction("Index", "TrangChu", new { area = "Private" });
            }
            else
            {
                return RedirectToAction("Index");
            }
                
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToRoute("Index" , "DangNhap");
        }
    }
}