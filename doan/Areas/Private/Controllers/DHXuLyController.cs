﻿using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Areas.Private.Controllers
{
    public class DHXuLyController : Controller
    {
        // GET: Private/DHXuLy
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="madh"></param>
        /// <returns></returns>
        public ActionResult Delete(string madh)
        {
            try
            {
                using (ShopGiayVansEntities2 db = new ShopGiayVansEntities2())
                {
                    donHang dh = db.donHang.FirstOrDefault(d => d.Equals(madh));
                    List<CtDonHang> ctdh = db.CtDonHang.Where(ct => ct.Equals(madh)).ToList<CtDonHang>();
                    //remove
                    db.CtDonHang.RemoveRange(ctdh);
                    db.donHang.Remove(dh);
                    db.SaveChanges();   
                }
                ViewBag.tb = "xóa thành công";
            }
            catch
            {
                ViewBag.tb = "Lỗi";
            }
            return RedirectToAction("Index");
        }
        /// <summary>
        /// Xác nhận đơn hàng đang xứ lý qua đơn hàng đang giao
        /// </summary>
        /// <param name="madh"></param>
        /// <returns></returns>
        public ActionResult Active(string madh)
        {
            using (var db = new ShopGiayVansEntities2())
            {
                var kq = db.donHang.SingleOrDefault(x => x.maDH.Equals(madh));
                if(kq != null)
                {
                    
                    db.SaveChanges();
                }
            }
            return RedirectToAction("Index");   
        }
    }
}