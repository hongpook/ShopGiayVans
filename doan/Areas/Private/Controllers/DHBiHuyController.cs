using doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Areas.Private.Controllers
{
    public class DHBiHuyController : Controller
    {
        // GET: Private/DHBiHuy
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
    }
}