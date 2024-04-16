using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace doan.Models
{
    public class DetailsCart
    {
        static ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
        /// <summary>
        /// Hàm cho phép lấy thong tin của 1sp dựa vào mã 
        /// </summary>
        /// <param name="maSP">Mã san phẩm</param>
        /// <returns>Đối tượng lấy được từ model</returns>
        public static sanPham getSanPhamByMaSP(string masp)
        {
            return db.Set<sanPham>().Find(masp);
        }
        /// <summary>
        /// Hàm cho phép lấy tên sp
        /// </summary>
        /// <param name="maSP"></param>
        /// <returns></returns>
        public static string getNameOfSPByMaSP(string masp)
        {
            return db.Set<sanPham>().Find(masp).tenSP;
        }
        /// <summary>
        /// Hàm cho phép lấy hình ảnh sp
        /// </summary>
        /// <param name="maSP"></param>
        /// <returns></returns>
        public static string getImageOfSPByMaSP(string masp)
        {
            return db.Set<sanPham>().Find(masp).hinhDD;
        }
    }
}