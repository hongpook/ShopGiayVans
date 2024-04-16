using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace doan.Controllers
{
    public class CheckOutController : Controller
    {
        // GET: CheckOut
        [HttpGet]
        public ActionResult Index(donHang dh)
        {
            khachHang kh = new khachHang();
            mapcart gh = Session["GioHang"] as mapcart;
            ViewData["Cart"] = gh;
            kh = Session["TTDangNhap"] as khachHang;
            dh.email = kh.email;


            return View(kh);
        }
        [HttpPost]
        public ActionResult SaveDB(khachHang kh)
        {
            using(var db = new ShopGiayVansEntities2())
            {
                using(DbContextTransaction trans = db.Database.BeginTransaction())
                {
                    try
                    {
                        kh.maKH = kh.soDT;
                        db.khachHang.Add(kh);
                        db.SaveChanges();

                        donHang dh = new donHang();
                        dh.maDH = String.Format("{0:yyMMddhhmm}", DateTime.Now);
                        dh.ngayDat = DateTime.Now;
                        dh.ngayGH = DateTime.Now.AddDays(4);
                        db.Set<donHang>().Add(dh);
                        db.SaveChanges();

                        mapcart gh = Session["GioHang"] as mapcart;
                        foreach(CtDonHang i in gh.SPDaThem.Values)
                        {
                            i.maDH = dh.maDH;
                            db.CtDonHang.Add(i);
                        }
                        db.SaveChanges();

                        trans.Commit();
                        return RedirectToAction("Index" , "Home");
                    }
                    catch(Exception e)
                    {
                        trans.Rollback();
                    }
                }
            }
            // bị lỗi 
            return RedirectToAction("Index", "CheckOut");
        }
        public ActionResult DHTC()
        {
            return View();
        }
    }

    
}