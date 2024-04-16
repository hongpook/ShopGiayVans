using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using doan.Models;
using System.IO;
using static System.Data.Entity.Infrastructure.Design.Executor;

namespace doan.Areas.Private.Controllers
{
    public class DSachBaiVietController : Controller
    {
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
        public ActionResult Delete(string maBaiViet)
        {
            baiViet bv = db.baiViet.Find(maBaiViet);
            db.baiViet.Remove(bv);
            db.SaveChanges();
            UpdateDL();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Active(string maBaiViet)
        {
            baiViet bv = db.baiViet.Find(maBaiViet);
            bv.daDuyet = !daDuyet;
            db.SaveChanges();
            UpdateDL();
            return View("Index");
        }
        /// <summary>
        /// 
        /// </summary>
        private void UpdateDL()
        {
            List<baiViet> list = db.baiViet.Where(b => b.daDuyet == daDuyet).ToList<baiViet>();
            ViewData["DSBaiViet"] = list;
            ViewBag.btnBV = !daDuyet ? "Duyệt": "Ẩn";
        }
        [HttpGet]
        public ActionResult Create()
        {
            baiViet x = new baiViet();
            x.ngayDang = DateTime.Now;
            x.soLanDoc = 0;
            quanTri qt = Session["TTDangNhap"] as quanTri;
            x.email = qt.email;
            ViewBag.hinhDD = "~/Images/New10/h1.jpg";
            return View(x);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(baiViet model, HttpPostedFileBase hinhDD)
        {
            try
            {
                model.maBV = string.Format("{0:yymmddhhmm}", DateTime.Now);
                model.daDuyet = false;
                model.ngayDang = DateTime.Now;
                model.soLanDoc = 0;
                quanTri qt = Session["TTDangNhap"] as quanTri;
                model.email = qt.email;
                model.loaiTin = "Sản phẩm mới";
                if (hinhDD != null)
                {
                    string virPath = "/Images/";
                    string path = Server.MapPath("~/" + virPath);
                    //
                    string ext = Path.GetExtension(hinhDD.FileName);
                    string tenFile = "HDD" + model.maBV + "." + ext;
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
                db.baiViet.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index", "DSachBaiViet", new { IsActive = 0 });
            }
            catch
            {

            }
            return View(model);
        }
    }
}