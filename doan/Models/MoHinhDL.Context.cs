﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ShopGiayVansEntities2 : DbContext
    {
        public ShopGiayVansEntities2()
            : base("name=ShopGiayVansEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<baiViet> baiViet { get; set; }
        public virtual DbSet<CtDonHang> CtDonHang { get; set; }
        public virtual DbSet<donHang> donHang { get; set; }
        public virtual DbSet<khachHang> khachHang { get; set; }
        public virtual DbSet<loaiSP> loaiSP { get; set; }
        public virtual DbSet<loaiTin> loaiTin { get; set; }
        public virtual DbSet<quanTri> quanTri { get; set; }
        public virtual DbSet<sanPham> sanPham { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
    }
}