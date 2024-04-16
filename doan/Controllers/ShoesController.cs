using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using doan.Models;

namespace doan.Controllers
{
    public class ShoesController : Controller
    {
        private static ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Backpack()
        {
           
            return View();
        }

        public ActionResult Clothes()
        {
            return View();
        }
        public ActionResult AllVans()
        {

            return View();
        }
    }
}