//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace doan.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class sanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public sanPham()
        {
            this.CtDonHang = new HashSet<CtDonHang>();
        }
    
        public string maSP { get; set; }
        public string tenSP { get; set; }
        public string hinhDD { get; set; }
        public string ndTomTat { get; set; }
        public System.DateTime ngayDang { get; set; }
        public int maLoai { get; set; }
        public string noiDung { get; set; }
        public string email { get; set; }
        public string dvt { get; set; }
        public Nullable<bool> daDuyet { get; set; }
        public Nullable<int> giaBan { get; set; }
        public Nullable<int> giamGia { get; set; }
        public string nhaSanXuat { get; set; }
        public string mauSac { get; set; }
        public string dongSanPham { get; set; }
        public string chatLieu { get; set; }
        public string phongCach { get; set; }
        public string hinhMot { get; set; }
        public string hinhHai { get; set; }
        public string hinhBa { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CtDonHang> CtDonHang { get; set; }
        public virtual loaiSP loaiSP { get; set; }
        public virtual quanTri quanTri { get; set; }
    }
}
