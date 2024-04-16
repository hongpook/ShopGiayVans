using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using doan.Models;
namespace doan.Models
{
    public class filter
    {
        private static ShopGiayVansEntities2 db = new ShopGiayVansEntities2();

        public static List<sanPham> getColor(string mau)
        {
            List<sanPham> list = new List<sanPham>();
            list = db.sanPham.Where(x => x.mauSac.Equals(mau)).ToList<sanPham>();
            return list;
        }
        public static List<sanPham> seachByKey(string key)
        {
            return db.sanPham.SqlQuery("Select * from sanPham where like %" + key + "%").ToList();
        }
    }
}