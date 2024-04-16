using doan.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Areas.Private.Controllers
{
    public class TatCaSPController : Controller
    {
        // GET: Private/TatCaSP
        private static ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
        private static bool daDuyet;
        [HttpGet]
        public ActionResult Index(string IsActive)
        {
            daDuyet = IsActive.Equals("1");
            UpdateDL();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(string maSP)
        {
            sanPham sp = db.sanPham.Find(maSP);
            db.sanPham.Remove(sp);
            db.SaveChanges();
            UpdateDL();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Active(string maSP)
        {
            sanPham sp = db.sanPham.Find(maSP);
            sp.daDuyet = !daDuyet;
            db.SaveChanges();
            UpdateDL();
            return View("Index");
        }
        public ActionResult Edit(string masp)
        {
            var item = db.sanPham.Find(masp);
            return View(item);
        }
        private void UpdateDL()
        {
            List<sanPham> list = db.sanPham.Where(b => b.daDuyet == daDuyet).ToList<sanPham>();
            ViewData["DSSanPham"] = list;
            ViewBag.btnSP = !daDuyet ? "Duyệt" : "Ẩn";
        }
        [HttpGet]
        public ActionResult Create()
        {
            sanPham sp = new sanPham();
            sp.ngayDang = DateTime.Now;
            quanTri qt = Session["TTDangNhap"] as quanTri;
            sp.email = qt.email;
            ViewBag.hinhDD = "~/Images/New10/h1.jpg";
            return View(sp);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(sanPham model, HttpPostedFileBase hinhDD)
        {
            try
            {
                model.maSP = string.Format("{0:yymmddhhmm}", DateTime.Now);
                model.daDuyet = false;
                model.ngayDang = DateTime.Now;
                quanTri qt = Session["TTDangNhap"] as quanTri;
                model.email = qt.email;
                model.nhaSanXuat = "VANS";
                if (hinhDD != null)
                {
                    string virPath = "/Images/";
                    string path = Server.MapPath("~/" + virPath);
                   //
                    string ext = Path.GetExtension(hinhDD.FileName);
                    string tenFile = "HDD" + model.maSP + "." + ext;
                    hinhDD.SaveAs(path + tenFile);
                    // cập nhật đường dẫn theo domain
                    model.hinhDD = virPath + tenFile;
                    // cập nhật hình
                    ViewBag.hinhDD = model.hinhDD;
                    // vị trí lưu hình sau khi up
                }
                else
                {
                    model.hinhDD = "";
                }

                ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
                db.sanPham.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index", "TatCaSP", new { IsActive = 0 });
            }
            catch
            {
                return View();
            }
            return View(model);
        }
    }
}