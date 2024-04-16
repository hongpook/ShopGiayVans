using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace doan.Models
{
    public class common
    {
        static ShopGiayVansEntities2 db = new ShopGiayVansEntities2();
        
        public static List<sanPham> getAllSanPham()
        {
            List<sanPham> list = new List<sanPham>();
            list = db.Set<sanPham>().OrderBy(x => x.tenSP).ToList<sanPham>();
            return list;
        }
        public static List<sanPham> getSanPham()
        {
            List<sanPham> list = new List<sanPham>();
            list = db.Set<sanPham>().Where(s => s.daDuyet == true).OrderBy(x => x.tenSP).ToList<sanPham>();
            return list;
        }
        public static List<loaiSP> getLoaiSP()
        {
            List<loaiSP> list = new List<loaiSP>();
            list = db.Set<loaiSP>().ToList<loaiSP>();
            return list;
        }

        public static List<sanPham> getSanPhamByLoaiSP(int ma)
        {
            List<sanPham> list = new List<sanPham>();
            list = db.Set<sanPham>().Where(x => x.maLoai.Equals(ma) && x.daDuyet == true).OrderByDescending(z => z.ngayDang).ToList<sanPham>();
            return list;
        }

        public static List<loaiSP> getNhomLoai(int ml)
        {
            List<loaiSP> list = new List<loaiSP>();
            list = db.loaiSP.Where(x => x.nhomLoai.Equals(ml)).ToList<loaiSP>();
            return list;
        }

        //public static List<sanPham> getSanPhamByNhomLoai( int nl)
        //{
        //    List<sanPham> list = new List<sanPham>();
        //    return list;
        //}
        public static List<baiViet> getBaiViet()
        {
            List<baiViet> list = new List<baiViet>();
            list = db.baiViet.Where(x => x.daDuyet == true).OrderByDescending(z => z.ngayDang).ToList<baiViet>();
            return list;
        }
        //public static List<baiViet> getBaiVietByLoaiBV(string loaibv)
        //{
        //    List<baiViet> list = new List<baiViet>();
        //    list = db.baiViet.Where(x => x.loaiTin.Equals(loaibv)).ToList<baiViet>();
        //    return list;
        //}
        public static List<donHang> getDonHang()
        {
            List<donHang> list = new List<donHang>();
            list = db.Set<donHang>().ToList<donHang>();
            return list;
        }

        public static List<CtDonHang> GetCtDonHang()
        {
            List<CtDonHang> list = new List<CtDonHang>();
            list = db.Set<CtDonHang>().ToList<CtDonHang>();
            return list;
        }
        
    }
    public class donViTinh
    {
        public dvt donVi { get; set; }
    }
    public enum dvt
    {
        Chiếc,
        Cái,
        Đôi
    }

}