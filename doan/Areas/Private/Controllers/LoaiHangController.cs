using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Areas.Private.Controllers
{
    public class LoaiHangController : Controller
    {
        private static bool isUpdate = false;
        // GET: Private/LoaiHang
        [HttpGet]
        public ActionResult Index()
        {
            List<loaiSP> list = new ShopGiayVansEntities2().loaiSP.OrderBy(x => x.tenLoai).ToList<loaiSP>();
            ViewData["DSLoai"] = list;
            return View();
        }
        [HttpPost]
        public ActionResult Index(loaiSP n)
        {
            ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
            if (!isUpdate)
            {
                db.loaiSP.Add(n);
            }
            else
            {
                loaiSP sp = db.loaiSP.Find(n.maLoai);
                sp.tenLoai = n.tenLoai;
                sp.nhomLoai = n.nhomLoai;
                isUpdate = false;
            }
            db.SaveChanges();
            if (ModelState.IsValid)
                ModelState.Clear();

            ViewData["DSLoai"] = db.loaiSP.OrderBy(x => x.tenLoai).ToList<loaiSP>();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Delete(string s)
        {
            ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
            int rm = int.Parse(s);
            loaiSP x = db.loaiSP.Find(rm);
            db.loaiSP.Remove(x);
            db.SaveChanges();
            ViewData["DSLoai"] = db.loaiSP.OrderBy(n => n.maLoai).ToList<loaiSP>();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Update(string ml)
        {
            ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
            int up = int.Parse(ml);
            loaiSP x = db.loaiSP.Find(up);
            isUpdate = true;
            ViewData["DSLoai"] = db.loaiSP.OrderBy(n => n.maLoai).ToList<loaiSP>();
            return View("Index", x);
        }
    }
}