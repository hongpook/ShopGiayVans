using doan.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class HomeController : Controller
    {
        private ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
        [HttpGet]
        public ActionResult Index()
        {   
            return View();
        }
        [HttpPost]
        
        public ActionResult AddToCart(string masp)
        {
            mapcart gh = Session["GioHang"] as mapcart;
            if(gh == null)
            {
                gh = new mapcart();
            }
            gh.addItem(masp);
            Session["GioHang"] = gh;
            return View("Index");
        }

        ///--------------------
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(khachHang kh)
        {
            if (ModelState.IsValid)
            {
                var check = db.khachHang.FirstOrDefault(s => s.email == kh.email);
                if (check == null)
                {
                    kh.maKH = string.Format("{0:yymmdd}", DateTime.Now);
                    kh.soLanMua = 0;
                    db.khachHang.Add(kh);
                    db.SaveChanges();
                    return RedirectToAction("Login", "Home");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }

            }
            return View();


        }



        // GET: Login
        [HttpGet]
        public ActionResult Login()
        {
           return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(khachHang kh)
        {
            khachHang ttdn = db.khachHang.Where(x => x.email.Equals(kh.email.ToLower().Trim()) && x.matKhau.Equals(kh.matKhau.ToLower().Trim())).First<khachHang>();
            bool isAuthentic = ttdn != null && ttdn.email.Equals(kh.email.ToLower().Trim()) && ttdn.matKhau.Equals(kh.matKhau);
            if (isAuthentic)
            {

                Session["TTDangNhap"] = ttdn;
                Session["user"] = ttdn.hoDem + ttdn.tenKH;
                Session["maKH"] = ttdn.maKH;
                Session["Email"] = ttdn.email;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return RedirectToAction("Login" , ttdn);
            }
            
        }

        ////Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
    }
}
