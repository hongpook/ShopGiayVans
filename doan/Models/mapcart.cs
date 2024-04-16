using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace doan.Models
{
    public class mapcart
    {
        public string maKh { get; set; }
        public string email { get; set; }
        public DateTime ngayDat { get; set; }
        public DateTime ngayGH { get;set; }
        public string diaChiGH { get; set; }
        public SortedList<string, CtDonHang> SPDaThem { get; set; }

        public mapcart() 
        {
            this.maKh = "";
            this.email = "";
            this.ngayDat = DateTime.Now;
            this.ngayGH = DateTime.Now.AddDays(4);
            this.diaChiGH = "";
            this.SPDaThem = new SortedList<string, CtDonHang>();
        }
        /// <summary>
        /// Hàm trả về đúng nếu giỏ hàng không có sản phẩm nào đã mua
        /// </summary>
        /// <returns></returns>
        public bool IsEmpty()
        {
            return SPDaThem.Keys.Count == 0;
        }
        /// <summary>
        /// Hàm cho phép thêm sản phẩm
        /// </summary>
        /// <param name="masp"></param>
        public void addItem(string masp)
        {
            if (SPDaThem.Keys.Contains(masp))
            {
                // lấy sp từ giỏ hàng
                CtDonHang ct = SPDaThem.Values[SPDaThem.IndexOfKey(masp)];
                // tăng sl sp đã chọn
                ct.soLuong++;
                // gắn lại giỏ hàng
                updateOneItem(ct);
            }
            else
            {
                CtDonHang ct = new CtDonHang();
                ct.maSP = masp;
                ct.soLuong = 1;
                // lấy giá bán, giảm giá từ bảng sản phẩm
                sanPham x = DetailsCart.getSanPhamByMaSP(masp);
                ct.giaBan = x.giaBan;
                ct.giamGia = x.giamGia;
                SPDaThem.Add(masp, ct);

            }
        }
        public void updateOneItem(CtDonHang ct)
        {
            this.SPDaThem.Remove(ct.maSP);
            this.SPDaThem.Add(ct.maSP , ct);
        }
        /// <summary>
        /// Xóa 1sanr phẩm trong giỏ hàng
        /// </summary>
        /// <param name="masp"></param>
        public void deleteItem(string masp)
        {
            if (SPDaThem.Keys.Contains(masp))
                SPDaThem.Remove(masp);
        }

        /// <summary>
        /// cho phép giảm số lượng hoặc xóa sp khỏi giỏ hàng
        /// </summary>
        /// <param name="masp"></param>
        public void decrease(string masp)
        {
            if (SPDaThem.Keys.Contains(masp))
            {
                CtDonHang ct = SPDaThem.Values[SPDaThem.IndexOfKey(masp)];
                if(ct.soLuong > 1)
                {
                    ct.soLuong--;
                    updateOneItem(ct);
                }
                else
                {
                    deleteItem(masp);
                }
            }
        }
        /// <summary>
        /// Tính tiền của một mặt hàng trong giỏ hàng
        /// </summary>
        /// <param name="ct"></param>
        /// <returns></returns>
        public long moneyOfOneSP(CtDonHang ct)
        {
            return (long)(ct.giaBan * ct.soLuong - (ct.giaBan * ct.soLuong * ct.giamGia));
        }

        /// <summary>
        /// Tính tổng thành tiền 
        /// </summary>
        /// <returns></returns>
        public long totalOfMapCart()
        {
            long kq = 0;
            foreach (CtDonHang i in SPDaThem.Values)
                kq += moneyOfOneSP(i);
            return kq;
        }


















        /// <summary>
        /// default constructor
        /// </summary>
        //public mapcart() 
        //{
        //    this.maKh = "";
        //    this.email = "";
        //    this.ngayDat = DateTime.Now;
        //    this.ngayGH = DateTime.Now.AddDays(4);
        //    this.diaChiGH = "";
        //    this.SPDaThem = new SortedList<string, CtDonHang>();
        //}
        ///// <summary>
        ///// Hàm trả về đúng nếu giỏ hàng không có sản phẩm nào đã mua
        ///// </summary>
        ///// <returns></returns>
        //public bool IsEmpty()
        //{
        //    return SPDaThem.Count == 0;
        //}

        ///// <summary>
        ///// Hàm thêm một sp đã chọn mua vào giỏ hàng
        ///// </summary>
        ///// <param name="maSP"></param>
        //public void addSP(string masp)
        //{
        //    if (SPDaThem.Keys.Contains(masp))
        //    {
        //        // Lấy sản phẩm từ trong giỏ hàng
        //        CtDonHang ct = SPDaThem.Values[SPDaThem.IndexOfKey(masp)];
        //        //tắng số lượng
        //        ct.soLuong++;
        //        // gắn trở lại sau khi đã cập nhật sl
        //        updateOneSP(ct);
        //    }
        //    else
        //    {
        //        // Tạo một object chi tiết đơn hàng
        //        CtDonHang i = new CtDonHang();
        //        // cập nhật 
        //        i.maSP = masp;
        //        i.soLuong = 1;
        //        //lấy giá bán và giảm giá từ table san phẩm
        //        sanPham sp = DetailsCart.getSanPhamByMaSP(masp);
        //        i.giaBan = sp.giaBan;
        //        i.giamGia = sp.giamGia;
        //        //bỏ vào dsach giỏ hàng
        //        SPDaThem.Add(masp, i);
        //    }
        //}
        //public void updateOneSP(CtDonHang x)
        //{
        //    this.SPDaThem.Remove(x.maSP);
        //    this.SPDaThem.Add(x.maSP, x);
        //}
        ///// <summary>
        ///// Xóa một sản phẩm trong giỏ hàng
        ///// </summary>
        ///// <param name="maSP"></param>
        //public void deleteSP(string masp)
        //{
        //    if (SPDaThem.Keys.Contains(masp))
        //    {
        //        SPDaThem.Remove(masp);
        //    }
        //}

        ///// <summary>
        ///// Cho phép giảm số lượng hoặc xóa sp đã chọn khỏi ds giỏ hàng
        ///// </summary>
        ///// <param name="maSP"></param>
        //public void desc(string masp)
        //{
        //    if (SPDaThem.Keys.Contains(masp))
        //    {
        //        CtDonHang dt = SPDaThem.Values[SPDaThem.IndexOfKey(masp)];
        //        if(dt.soLuong > 1)
        //        {
        //            dt.soLuong--;
        //            updateOneSP(dt);
        //        }
        //        else
        //        {
        //            deleteSP(masp);
        //        }
        //    }
        //}
        ///// <summary>
        ///// Hàm tính tiền từng sản phẩm theo só lượng
        ///// </summary>
        ///// <param name="ct"></param>
        ///// <returns></returns>
        //public long moneySP(CtDonHang ct)
        //{
        //    return (long)(ct.giaBan * ct.soLuong - (ct.giaBan * ct.soLuong * ct.giamGia));
        //}
        ///// <summary>
        ///// Hàm tính tổng tiền tất cả sp có trong giỏ hàng
        ///// </summary>
        ///// <returns></returns>
        //public long tatalOfCart()
        //{
        //    long kq = 0;
        //    foreach (CtDonHang i in SPDaThem.Values)
        //        kq += moneySP(i);
        //    return kq;
        //}
    }
}