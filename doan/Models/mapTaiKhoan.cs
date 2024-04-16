using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace doan.Models
{
    public class mapTaiKhoan
    {
        /// <summary>
        /// Hàm lấy dữ liệu từ bảng khách hàng
        /// </summary>
        /// <returns></returns>
        public static List<khachHang> getKhachHang()
        {
            return new DbContext("name=ShopGiayVansEntities2").Set<khachHang>().ToList<khachHang>();
        }

        /// <summary>
        /// Hàm lấy dữ liệu từ bảng Tài khoản
        /// </summary>
        /// <returns></returns>
        public static List<khachHang> getTaiKhoan()
        {
            return new DbContext("name=ShopGiayVansEntities2").Set<khachHang>().ToList<khachHang>();
        }

        public static khachHang ChiTiet(string Email)
        {
            try
            {
                ShopGiayVansEntities2 db = new ShopGiayVansEntities2();

                var model = db.khachHang.SingleOrDefault(x => x.email == Email.ToLower());
                return model;
            }
            catch
            {
                return null;
            }
        }
    }
}