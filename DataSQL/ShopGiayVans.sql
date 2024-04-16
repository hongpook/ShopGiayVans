
use master
go
drop database ShopGiayVans
go
create database ShopGiayVans
go
use ShopGiayVans
go
create table quanTri
(
	hoDem			nvarchar(30)			not null,
	tenTV			nvarchar(10)			not null,
	email			varchar(50) primary key	not null,
	matKhau			varchar(20)				not null,
	hinhTV			varchar(max)			not null,
	ghiChu			ntext
)

go
create table khachHang
(
	maKH			varchar(20) primary key	not null,
	hoDem			nvarchar(50)			not null,
	tenKH			nvarchar(30)			not null,
	soDT			varchar(10)				not null,
	email			varchar(50)				not null,
	diaChi			nvarchar(250),
	ngaySinh		date,
	matKhau			varchar(20)				not null, 
	gioiTinh		bit default 1,
	soLanMua		int		,
	ghiChu			ntext
)

go
create table loaiSP
(
	maLoai			int primary key 	not null,
	tenLoai			nvarchar(88)				not null,
	nhomLoai		int							not null,
	ghiChu			ntext default ''
)
go
create table sanPham
(
	maSP			varchar(20)	primary key		not null ,
	tenSP			nvarchar(50)				not NULL,
	hinhDD			varchar(max)				not null,
	ndTomTat		nvarchar(500)				not null,
	ngayDang		datetime					not null,
	maLoai			int							not null,
	noiDung			nvarchar(4000)				not null,
	email			varchar(50)					not null foreign key (email) references quanTri(email),
	dvt				nvarchar(10) ,
	daDuyet			bit default 1,
	giaBan			INTEGER DEFAULT 0,
	giamGia			INTEGER DEFAULT 0 CHECK (giamGia>=0 AND giamGia<=100),
	nhaSanXuat		nvarchar(168)				not null,
	mauSac			nvarchar(30)				not null,
	dongSanPham		nvarchar(30)				not null,
	chatLieu		nvarchar(50)				not null,
	phongCach		nvarchar(20)				not null,
	hinhMot			varchar(max)		,
	hinhHai			varchar(max)		,
	hinhBa			varchar(max)		
)
alter table sanPham add constraint fk_SP_LSP foreign key(maLoai) references loaiSP(maLoai)

go
create table loaiTin
(
	maTin			int							not null identity,
	loaiTin			nvarchar(30) primary key	not null,
	ghiChu			ntext
)
create table baiViet
(
	maBV			varchar(10) primary key		not null,
	tenBV			nvarchar(250)				not null,
	hinhDD			varchar(max),
	ndTomTat		nvarchar(2000),
	ngayDang		datetime ,
	loaiTin			nvarchar(30),
	noiDungBV		nvarchar(4000),
	email			varchar(50)					not null,
	daDuyet			bit default 1,
	hinhND			varchar(max),
	soLanDoc		int		default 0
)
alter table baiViet add constraint fk_BV_QT foreign key(email) references quanTri(email)
alter table baiViet add constraint fk_BV_LT foreign key(loaiTin) references loaiTin(loaiTin)

go
create table donHang
(
	maDH			varchar(20) primary key		not null,
	maKH			varchar(20)					not null ,
	tenKH			varchar(30)					not null  ,
	email			varchar(50)					not null,
	ngayDat			datetime,
	daKichHoat		bit default 1,
	ngayGH			datetime,
	diaChiGH		nvarchar(250),
	tinhTrangGH		nvarchar(50),
	ghiChu			ntext
)
alter table donHang add constraint Pk_DH_KH foreign key(maKH) references khachHang(maKH)
go
create table CtDonHang	
(
	maDH			varchar(20)			not null,
	maSP			varchar(20)			not null ,
	maKH			varchar(20)			not null ,
	soLuong			int,
	giaBan			bigint,
	giamGia			BIGINT,
	PRIMARY KEY (maDH, maSP,maKH)
)
alter table CtDonHang add constraint Pk_CTDH_DH foreign key(maDH) references donHang(maDH)
alter table CtDonHang add constraint Pk_CTDH_SP foreign key(maSP) references sanPham(maSP)
alter table CtDonHang add constraint Pk_CTDH_KH foreign key(maKH) references khachHang(maKH)
go
drop table CtDonHang

--- quản trị
insert into quanTri values (N'Đậu Hồng',N'Phúc','hongpook@gmail.com','000000','/Images/ssdd.jpg','admin')
insert into quanTri values (N'Trần Thị Dịu',N'Trân','diutrann5@gmail.com','280503','/Images/diuTrann.jpg','admin')
select * from quanTri
-- khách hàng
insert into khachHang values ('001', N'Đậu Hồng Phúc',N'Phúc','0394421371','phucdau2k3@gmail.com','Lê Đức Thọ - P.13 - Quận Gò Vấp - TP.HCM','01/12/2003',1, 100,'Khách Hàng','000000')
insert into khachHang values ('002', N'Trần Thị Dịu',N'Trân','0954376654','diutrann@gmail.com','Tân Hưng Thuận','28/05/2003',0, 100,'Khách Hàng', 'diutranxinhnhat')
select * from khachHang
drop table khachHang
-- loại sản phẩm
insert into loaiSP values (1 ,N'Giày Vans Lười', 1 , N'Giày Vans lười')
insert into loaiSP values (2 ,N'Giày Vans', 1 , N'Giày Vans')
insert into loaiSP values (3 ,N'Balo', 2 , N'Balo')
insert into loaiSP values (4 ,N'Túi Chéo', 2 , N'Túi Chéo')
insert into loaiSP values (5 ,N'Ví', 2 , N'Ví')
insert into loaiSP values (6 ,N'Áo', 3 , N'Áo')
insert into loaiSP values (7 ,N'Quần', 3 , N'Quần')
insert into loaiSP values (8 ,N'Mũ', 3 , N'Mũ')
select * from loaiSP
-- sản phẩm
insert into sanPham values ('VN002', N'VANS AUTHENTIC CLASSIC BLACK/WHITE','/Images/vans-authentic-classic-black-1.jpg','VANS AUTHENTIC CLASSIC BLACK/WHITE',
							23/11/2022,2,N'Vans','hongpook@gmail.com',N'Đôi',1, 1750000,0,N'VANS',N'Đen/Trắng',N'Classic',N'12,8% là da và 88,8% là vải',
							N'Unisex','/Images/vans-authentic-classic-black-1.jpg','/Images/vans-authentic-classic-black-2.jpg','/Images/vans-authentic-classic-black-3.jpg')


insert into sanPham values ('VN003', N'VANS SLIP ON CLASSIC ECO THEORY CHECKERBOARD', '/Images/Vans1/hinh1.jpg', 'VANS SLIP ON CLASSIC ECO THEORY CHECKERBOARD', 
							26/11/2022, 1, N'Vans lười', 'hongpook@gmail.com', N'Đôi', 1, 1550000, 0, N'VANS', N'Eco Theory Checkerboard', N'Slip-on', N'50% Cotton tái chế,50% cây gai dầu trên', 
							N'Unisex', '/Images/Vans1/hinh1.jpg', '/Images/Vans1/hinh2.jpg', '/Images/Vans1/hinh3.jpg')

insert into sanPham values ('VN123', N'vans-sk8-hi-classic-black-white', '/Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-1.jpg','vans-sk8-hi-classic-black-white',
							26/11/2022, 2 , N'Vans', 'hongpook@gmail.com', N'Đôi', 1, 1950000, 0 , N'VANS',N'Black/White', N'Classic', N'12,8% là da và 88,8% là vải', N'Unisex',
							'/Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-1.jpg','/Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-2.jpg',
							'/Images/vans-sk8-hi-classic-black-white/vans-sk8-hi-classic-black-white-3.jpg')

insert into sanPham values ('VN004', N'VANS X PRETTY GUARDIAN SAILOR MOON SKATE SLIP-ON', '/Images/Vans2/hinh1.jpg', 'VANS X PRETTY GUARDIAN SAILOR MOON SKATE SLIP-ON',
							26/11/2022, 1, N'Vans lười', 'hongpook@gmail.com', N'Đôi', 1, 2850000, 0, N'VANS', N' White/Black', N'Slip-on', N'Dệt may',
							N'Unisex', '/Images/Vans2/hinh1.jpg', '/Images/Vans2/hinh2.jpg', '/Images/Vans2/hinh3.jpg')
select * from sanPham
-- loại tin
insert into loaiTin(loaiTin , ghiChu) values (N'Sản phẩm mới', N'Bài viết')
insert into loaiTin(loaiTin , ghiChu) values (N'Giới thiệu sản phẩm', N'Bài viết')
select * from loaiTin
-- Bài viết
insert into baiViet values ('BV001',N'BETTER™️ GIFT SHOP X VAULT BY VANS – TỰ HÀO CÙNG NÉT VĂN HÓA Á ĐÔNG','/Images/van_news/van_new_1.jpg',
							N'Được thành lập tại Toronto, Canada vào năm 2017 Better ™ Gift Shop được tạo ra...',23/11/2022,N'Sản phẩm mới',N'Được thành lập tại Toronto, Canada...', 
							'hongpook@gmail.com',1,'~/Images/van_news/van_new_1.jpg')
select * from baiViet
-- Đơn hàng
insert into donHang values ('DHVN001','001',N'Phúc','phucdau2k3@gmail.com',23/11/2022,1,25/11/2022,N'Lê Đức Thọ - P.13 - Quận Gò Vấp - TP.HCM',
							N'Đang chuẩn bị hàng',N'Đơn hàng gửi khách')
select * from donHang
-- chi tiết đơn hàng
insert into CtDonHang values('DHVN001', 'VN002',2, 1750000, 0)
select * from CtDonHang

insert into sanPham values ('GY001', N'VANS SLIP ON CLASSIC ECO THEORY CHECKERBOARD', '/Images/Vans1/hinh1.jpg', 'VANS SLIP ON CLASSIC ECO THEORY CHECKERBOARD', 
							26/11/2022, 1, N'Giày lười', 'diutrann5@gmail.com', N'Đôi', 1, 1550000, 0, N'VANS', N'Eco Theory Checkerboard', N'Slip-on', N'50% Cotton tái chế,50% cây gai dầu trên', 
							N'Unisex', '/Images/Vans1/hinh1.jpg', '/Images/Vans1/hinh2.jpg', '/Images/Vans1/hinh3.jpg')

insert into sanPham values ('GY002', N'VANS X PRETTY GUARDIAN SAILOR MOON SKATE', '/Images/Vans2/hinh1.jpg', 'VANS X PRETTY GUARDIAN SAILOR MOON SKATE',
							26/11/2022, 1, N'Giày lười', 'diutrann5@gmail.com', N'Đôi', 1, 2850000, 0, N'VANS', N'Guadians Moon White/Black', N'Slip-on', N'Dệt may',
							N'Unisex', '/Images/Vans2/hinh1.jpg', '/Images/Vans2/hinh2.jpg', '/Images/Vans2/hinh3.jpg')

insert into sanPham values ('GY003', N'VANS x A TRIBE CALLED QUEST CLASSIC TWO', '/Images/Vans3/hinh1.jpg', 'VANS x A TRIBE CALLED QUEST CLASSIC TWO', 
							26/11/2022, 1, N'Giày lười', 'diutrann5@gmail.com', N'Đôi', 0, 1800000, 0, N'VANS', N'Mix bold colors', N'Slip-on', N'100% dệt may thủ công', 
							N'Unisex', '/Images/Vans3/hinh1.jpg', '/Images/Vans3/hinh2.jpg', '/Images/Vans3/hinh3.jpg')

insert into sanPham values ('GY004', N'VANS SLIP ON MIX MATCH SF MARSHMALLOW', '/Images/Vans4/hinh1.jpg', 'VANS SLIP ON MIX MATCH SF MARSHMALLOW', 26/11/2022, 1, N'Giày lười',
							'diutrann5@gmail.com', N'Đôi', 1, 1450000, 0, N'VANS', N'Multi/Marshmallow', N'Slip-on', N'100% dệt may', N'Unisex',
							'/Images/Vans4/hinh1.jpg', '/Images/Vans4/hinh2.jpg', '/Images/Vans4/hinh3.jpg')

insert into sanPham values ('GY005', N'VANS X KIDE COLLECTION SLIP-ON SF', '/Images/Vans5/hinh1.jpg', 'VANS X KIDE COLLECTION SLIP-ON SF', 26/11/2022, 1, N'Giày lười',
							'diutrann5@gmail.com', N'Đôi', 1, 1700000, 0, N'VANS', N'Multicolour', N'Slip-on', N'Nhẹ nhàng', N'Unisex',
							'/Images/Vans5/hinh1.jpg', '/Images/Vans5/hinh2.jpg', '/Images/Vans5/hinh3.jpg')
													
insert into sanPham values ('GY006', N'VANS CREW SLIP-ON STYLE 36 CHECKERBOARD RED', '/Images/Vans6/hinh1.jpg', 'VANS CREW SLIP-ON STYLE 36 CHECKERBOARD RED', 26/11/2022, 1,
							N'Giày lười', 'diutrann5@gmail.com', N'Đôi', 0, 1450000, 0, N'VANS', N'Checkerboard Red', N'Slip-on', N'Vải Canvas', N'Unisex',
							'/Images/Vans6/hinh1.jpg', '/Images/Vans6/hinh2.jpg', '/Images/Vans6/hinh3.jpg')
							
insert into sanPham values ('GY007', N'VANS SLIP-ON FLASH SKULLS', '/Images/Vans7/hinh1.jpg', 'VANS SLIP-ON FLASH SKULLS', 26/11/2022, 1, N'Giày lười', 'diutrann5@gmail.com',
							N'Đôi', 1, 1500000, 0, N'VANS', N'Black/White Skull', N'Slip-on', N'Vải Canvas', N'Unisex', '/Images/Vans7/hinh1.jpg', '/Images/Vans7/hinh2.jpg', '/Images/Vans7/hinh3.jpg')

insert into sanPham values ('GY008', N'VANS SLIP-ON CLASSIC NEW VARSITY', '/Images/Vans8/hinh1.jpg', 'VANS SLIP-ON CLASSIC NEW VARSITY', 26/11/2022, 1, N'Giày lười', 'diutrann5@gmail.com',
							N'Đôi', 1, 1690000, 0, N'VANS', N'Grey skull', N'Slip-on', N'Cotton', N'Unisex', '/Images/Vans8/hinh1.jpg', '/Images/Vans8/hinh2.jpg', '/Images/Vans8/hinh3.jpg')

insert into sanPham values ('GY009', N'VANS MENS CLASSIC FESTIVAL SATIN', '/Images/Vans9/hinh1.jpg', 'VANS MENS CLASSIC FESTIVAL SATIN', 26/11/2022, 1, N'Giày lười', 'diutrann5@gmail.com',
							N'Đôi', 0, 2508000, 0, N'VANS', N'Red', N'Slip-on', N'100% Da', N'Unisex', '/Images/Vans9/hinh1.jpg', '/Images/Vans9/hinh2.jpg', '/Images/Vans9/hinh3.jpg')

insert into sanPham values ('GY010', N'VANS MENS U CLASSIC SLIP ON ROSE GOLD', '/Images/Vans10/hinh1.jpg', 'VANS MENS U CLASSIC SLIP ON ROSE GOLD', 26/11/2022, 1, N'Giày lười', 'diutrann5@gmail.com',
							N'Đôi', 1, 2530000, 0, N'VANS', N'Rose gold', N'Slip-on', N'100% dệt may', N'Unisex', '/Images/Vans10/hinh1.jpg', '/Images/Vans10/hinh2.jpg', '/Images/Vans10/hinh3.jpg')

--/Giày Vans/
insert into sanPham values ('GY011', N'VANS X MOCA JUDY BACA AUTHENTIC', '/Images/Vans11/h1.jpg', 'VANS X MOCA JUDY BACA AUTHENTIC', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi', 1,
							2850000, 0, N'VANS', N'Multicolour', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans11/h1.jpg', '/Images/Vans11/h2.jpg', '/Images/Vans11/h3.jpg')

insert into sanPham values ('GY012', N'VANS AUTHENTIC MIX MATCH SF MULTI MARSHMALLOW', '/Images/Vans12/h1.jpg', 'VANS AUTHENTIC MIX MATCH SF MULTI MARSHMALLOW', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com',
							N'Đôi', 0, 1450000, 0, N'VANS', N'Multi/Marshmallow', N'Authentic', N'100% dệt may', N'Unisex', '/Images/Vans12/h1.jpg', '/Images/Vans12/h2.jpg', '/Images/Vans12/h3.jpg')

insert into sanPham values ('GY013', N'VANS DALLAS CLAYTON AUTHENTIC RAINBOW TRUE WHITE', '/Images/Vans13/h1.jpg', 'VANS DALLAS CLAYTON AUTHENTIC RAINBOW TRUE WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com',
							N'Đôi', 1, 1800000, 0, N'VANS', N'Multicolour', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans13/h1.jpg', '/Images/Vans13/h2.jpg', '/Images/Vans13/h3.jpg')

insert into sanPham values ('GY014', N'VANS X PRETTY GUARDIAN SAILOR MOON AUTHENTIC', '/Images/Vans14/h1.jpg', 'VANS X PRETTY GUARDIAN SAILOR MOON AUTHENTIC', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com',
							N'Đôi', 1, 2600000, 0, N'VANS', N'Pretty Sailor Moon Multi', N'Authentic', N'Dệt may', N'Unisex', '/Images/Vans14/h1.jpg', '/Images/Vans14/h2.jpg', '/Images/Vans14/h3.jpg')

insert into sanPham values ('GY015', N'VANS x PRETTY GUARDIAN SAILOR MOON SK8-HI', '/Images/Vans15/h1.jpg', 'VANS x PRETTY GUARDIAN SAILOR MOON SK8-HI', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi',
							0, 3800000, 0, N'VANS', N'Pretty Sailor Moon Black/Pink', N'Sk8-Hi', N'Dệt may', N'Unisex', '/Images/Vans15/h1.jpg', '/Images/Vans15/h2.jpg', '/Images/Vans15/h3.jpg')

insert into sanPham values ('GY016', N'VANS X STRANGER THINGS SK8-HI ZIP BLACK/RED', '/Images/Vans16/h1.jpg', 'VANS X STRANGER THINGS SK8-HI ZIP BLACK/RED', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi',
							1, 3950000, 0, N'VANS', N'Black/Red', N'Sk8', N'Da, dệt may, cao su', N'Unisex', '/Images/Vans16/h1.jpg', '/Images/Vans16/h2.jpg', '/Images/Vans16/h3.jpg')

insert into sanPham values ('GY017', N'VANS OUROBOROS SK8-HI BLACK/TRUE WHITE', '/Images/Vans17/h1.jpg', 'VANS OUROBOROS SK8-HI BLACK/TRUE WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi', 1,
							2100000, 0, N'VANS', N'Black/White', N'Sk8', N'Da', N'Unisex', '/Images/Vans17/h1.jpg', '/Images/Vans17/h2.jpg', '/Images/Vans17/h3.jpg')

insert into sanPham values ('GY018', N'VANS ERA LADY GREEN', '/Images/Vans18/h1.jpg', 'VANS ERA LADY GREEN', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi', 0, 1450000, 0, N'VANS',
							N'Green', N'Era', N'Vải Canvas', N'Unisex', '/Images/Vans18/h1.jpg', '/Images/Vans18/h2.jpg', '/Images/Vans18/h3.jpg')

insert into sanPham values ('GY019', N'VANS ERA VARSITY CANVAS GREEN/BLUE', '/Images/Vans19/h1.jpg', 'VANS ERA VARSITY CANVAS GREEN/BLUE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi', 1,
							1450000, 0, N'VANS', N'Varsity Canvas Green/Blue', N'Era', N'57.7% Da, 42.4% Vải', N'Unisex', '/Images/Vans19/h1.jpg', '/Images/Vans19/h2.jpg', '/Images/Vans19/h3.jpg')

insert into sanPham values ('GY020', N'ANS x MOCA JUDY BACA OLD SKOOL', '/Images/Vans20/h1.jpg', 'ANS x MOCA JUDY BACA OLD SKOOL', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi', 1,
							3500000, 0, N'VANS', N'Judy Baca', N'Old Skool', N'Vải Canvas', N'Unisex', '/Images/Vans20/h1.jpg', '/Images/Vans20/h2.jpg', '/Images/Vans20/h3.jpg')

insert into sanPham values ('GY021', N'VANS OLD SKOOL CLASSIC NAVY/WHITE', '/Images/Vans21/h1.jpg', 'VANS OLD SKOOL CLASSIC NAVY/WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', N'Đôi', 0,
							1750000, 0, N'VANS', N'Navy/White', N'Old Skool', N'Vải Canvas', N'Unisex', '/Images/Vans21/h1.jpg', '/Images/Vans21/h2.jpg', '/Images/Vans21/h3.jpg')

insert into sanPham values ('GY022', N'VANS VAULT OG CLASSIC SLIP ON BLACK/TRUE WHITE', '/Images/Vans22/h1.jpg', 'VANS VAULT OG CLASSIC SLIP ON BLACK/TRUE WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 2600000, 0, N'VANS', N'Black/True White', N'Vault', N'Vải Canvas', N'Unisex', '/Images/Vans22/h1.jpg', '/Images/Vans22/h2.jpg', '/Images/Vans22/h3.jpg')

insert into sanPham values ('GY023', N'VANS AUTHENTIC VANS COLLAGE BLACK/WHITE', '/Images/Vans23/h1.jpg', 'VANS AUTHENTIC VANS COLLAGE BLACK/WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1550000, 0, N'VANS', N'Vans Collage Black/White', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans23/h1.jpg', '/Images/Vans23/h2.jpg', '/Images/Vans23/h3.jpg')

insert into sanPham values ('GY024', N'VANS CLASSIC AUTHENTIC RED', '/Images/Vans24/h1.jpg', 'VANS CLASSIC AUTHENTIC RED', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1450000, 0, N'VANS', N'Red', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans24/h1.jpg', '/Images/Vans24/h2.jpg', '/Images/Vans24/h3.jpg')

insert into sanPham values ('GY025', N'VANS ANAHEIM FACTORY AUTHENTIC 44 DX OG BRIG', '/Images/Vans25/h1.jpg', 'VANS ANAHEIM FACTORY AUTHENTIC 44 DX OG BRIG', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 0, 1700000, 0, N'VANS', N'Checkerboard Blue', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans25/h1.jpg', '/Images/Vans25/h2.jpg', '/Images/Vans25/h3.jpg')

insert into sanPham values ('GY026', N'VANS AUTHENTIC CLASSIC BLACK/BLACK', '/Images/Vans26/h1.jpg', 'VANS AUTHENTIC CLASSIC BLACK/BLACK', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1450000, 0, N'VANS', N'Full Black', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans26/h1.jpg', '/Images/Vans26/h2.jpg', '/Images/Vans26/h3.jpg')

insert into sanPham values ('GY027', N'VANS AUTHENTIC HIGH DENSITY BLACK CHECKERBOARD', '/Images/Vans27/h1.jpg', 'VANS AUTHENTIC HIGH DENSITY BLACK CHECKERBOARD', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1400000, 0, N'VANS', N'Checkerboard Full Black', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans27/h1.jpg', '/Images/Vans27/h2.jpg', '/Images/Vans27/h3.jpg')

insert into sanPham values ('GY027', N'VANS AUTHENTIC HIGH DENSITY BLACK CHECKERBOARD', '/Images/Vans27/h1.jpg', 'VANS AUTHENTIC HIGH DENSITY BLACK CHECKERBOARD', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1400000, 0, N'VANS', N'Checkerboard Full Black', N'Authentic', N'Vải Canvas', N'Unisex', '/Images/Vans27/h1.jpg', '/Images/Vans27/h2.jpg', '/Images/Vans27/h3.jpg')

insert into sanPham values ('GY028', N'VANS OLD SKOOL ZIP (LEATHER) BLACK', '/Images/Vans28/h1.jpg', 'VANS OLD SKOOL ZIP (LEATHER) BLACK', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 0, 2300000, 0, N'VANS', N'Black', N'Old Skool', N'Da', N'Unisex', '/Images/Vans28/h1.jpg', '/Images/Vans28/h2.jpg', '/Images/Vans28/h3.jpg')

insert into sanPham values ('GY029', N'VANS x PRETTY GUARDIAN SAILOR MOON SKATE OLD SKOOL', '/Images/Vans29/h1.jpg', 'VANS x PRETTY GUARDIAN SAILOR MOON SKATE OLD SKOOL', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 3400000, 0, N'VANS', N'Pretty Sailor Moon Black/Black', N'Old Skool', N'Da', N'Unisex', '/Images/Vans29/h1.jpg', '/Images/Vans29/h2.jpg', '/Images/Vans29/h3.jpg')

insert into sanPham values ('GY030', N'VANS x PRETTY GUARDIAN SAILOR MOON OLD SKOOL', '/Images/Vans30/h1.jpg', 'VANS x PRETTY GUARDIAN SAILOR MOON OLD SKOOL', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 2900000, 0, N'VANS', N'Sailor Moon Parisian Night', N'Old Skool', N'Da', N'Unisex', '/Images/Vans30/h1.jpg', '/Images/Vans30/h2.jpg', '/Images/Vans30/h3.jpg')

insert into sanPham values ('GY031', N'VANS x PRETTY GUARDIAN SAILOR MOON SK8-HI', '/Images/Vans31/h1.jpg', 'VANS x PRETTY GUARDIAN SAILOR MOON SK8-HI', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 2800000, 0, N'VANS', N'Sailor Moon Mysterioso', N'Sk8-Hi', N'Da', N'Unisex', '/Images/Vans31/h1.jpg', '/Images/Vans31/h2.jpg', '/Images/Vans31/h3.jpg')

insert into sanPham values ('GY032', N'VANS X MARVEL SK8-HI BLACK PANTHER', '/Images/Vans32/h1.jpg', 'VANS X MARVEL SK8-HI BLACK PANTHER', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 0, 2100000, 0, N'VANS', N'Full Black', N'Sk8-Hi', N'Da', N'Unisex', '/Images/Vans32/h1.jpg', '/Images/Vans32/h2.jpg', '/Images/Vans32/h3.jpg')

insert into sanPham values ('GY033', N'VANS SK8-HI CLASSIC TRUE WHITE', '/Images/Vans33/h1.jpg', 'VANS SK8-HI CLASSIC TRUE WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1950000, 0, N'VANS', N'True White', N'Sk8-Hi', N'Vải Canvas', N'Unisex', '/Images/Vans33/h1.jpg', '/Images/Vans33/h2.jpg', '/Images/Vans33/h3.jpg')

insert into sanPham values ('GY034', N'VANS X NATIONAL GEOGRAPHIC SK8-HI REISSUE 138', '/Images/Vans34/h1.jpg', 'VANS X NATIONAL GEOGRAPHIC SK8-HI REISSUE 138', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 3100000, 0, N'VANS', N'Black/Yellow', N'Sk8-Hi', N'Vải Canvas', N'Unisex', '/Images/Vans34/h1.jpg', '/Images/Vans34/h2.jpg', '/Images/Vans34/h3.jpg')

insert into sanPham values ('GY035', N'VANS UA SK8-LOW HONEY GOLD', '/Images/Vans35/h1.jpg', 'VANS UA SK8-LOW HONEY GOLD', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1800000, 0, N'VANS', N'Honey Gold', N'Sk8', N'Vải Canvas', N'Unisex', '/Images/Vans35/h1.jpg', '/Images/Vans35/h2.jpg', '/Images/Vans35/h3.jpg')

insert into sanPham values ('GY036', N'VANS ERA CLASSIC BLACK', '/Images/Vans36/h1.jpg', 'VANS ERA CLASSIC BLACK', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 0, 1450000, 0, N'VANS', N'Black', N'Era', N'Vải Canvas', N'Unisex', '/Images/Vans36/h1.jpg', '/Images/Vans36/h2.jpg', '/Images/Vans36/h3.jpg')

insert into sanPham values ('GY037', N'VANS ERA BMX WHITE', '/Images/Vans37/h1.jpg', 'VANS ERA BMX WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1450000, 0, N'VANS', N'Beige', N'Era', N'Vải Canvas', N'Unisex', '/Images/Vans37/h1.jpg', '/Images/Vans37/h2.jpg', '/Images/Vans37/h3.jpg')

insert into sanPham values ('GY038', N'VANS SK8-HI CLASSIC TRUE WHITE', '/Images/Vans38/h1.jpg', 'VANS SK8-HI CLASSIC TRUE WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1950000, 0, N'VANS', N'True White', N'Sk8-Hi', N'Vải Canvas', N'Unisex', '/Images/Vans38/h1.jpg', '/Images/Vans38/h2.jpg', '/Images/Vans38/h3.jpg')

insert into sanPham values ('GY039', N'VANS VAULT OG OLD SKOOL LX BLACK/TRUE WHITE', '/Images/Vans39/h1.jpg', 'VANS VAULT OG OLD SKOOL LX BLACK/TRUE WHITE', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 0, 2800000, 0, N'VANS', N'Black/True White', N'Old Skool', N'Vải Canvas', N'Unisex', '/Images/Vans39/h1.jpg', '/Images/Vans39/h2.jpg', '/Images/Vans39/h3.jpg')

insert into sanPham values ('GY040', N'VANS LABEL MIX ERA', '/Images/Vans40/h1.jpg', 'VANS LABEL MIX ERA', 27/11/2022, 2, N'Giày Vans', 'diutrann5@gmail.com', 
							N'Đôi', 1, 1650000, 0, N'VANS', N'Novel olors', N'Era', N'Vải Canvas', N'Unisex', '/Images/Vans40/h1.jpg', '/Images/Vans40/h2.jpg', '/Images/Vans40/h3.jpg')

--/Balo/
insert into sanPham values ('BL001', N'VANS BENCHED CINCH BAG ONYX', '/Images/Balo1/hinh1.jpg', 'VANS BENCHED CINCH BAG ONYX', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc',
							1, 300000, 0, N'VANS', N'Black', N'Backpack', N'Poly cao cấp', N'Unisex', '/Images/Balo1/hinh1.jpg', '/Images/Balo1/hinh2.jpg', '/Images/Balo1/hinh3.jpg')

insert into sanPham values ('BL002', N'VANS W REALM BACKPACK CALIFAS MARSHMALLOW', '/Images/Balo2/hinh1.jpg', 'VANS W REALM BACKPACK CALIFAS MARSHMALLOW', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com',
							N'Chiếc', 0, 950000, 0, N'VANS', N'Califas Marshmallow', N'Backpack', N'100% Poly', N'Unisex', '/Images/Balo2/hinh1.jpg', '/Images/Balo2/hinh2.jpg', '/Images/Balo2/hinh3.jpg')

insert into sanPham values ('BL003', N'VANS AP TAPE OFF BACKPACK RED', '/Images/Balo3/hinh1.jpg', 'VANS AP TAPE OFF BACKPACK RED', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc',
							1, 1050000, 0, N'VANS', N'Red', N'Backpack',  N'Poly cao cấp', N'Unisex', '/Images/Balo3/hinh1.jpg', '/Images/Balo3/hinh2.jpg', '/Images/Balo3/hinh3.jpg')

insert into sanPham values ('BL004', N'VANS AP REACH IN BACKPACK RED', '/Images/Balo4/hinh1.jpg', 'VANS AP REACH IN BACKPACK RED', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc',
							1, 1100000, 0, N'VANS', N'Red', N'Backpack', N'Poly cao cấp', N'Unisex', '/Images/Balo4/hinh1.jpg', '/Images/Balo4/hinh2.jpg', '/Images/Balo4/hinh3.jpg')

insert into sanPham values ('BL005', N'VANS OLD SKOOL III BACKPACK LEMON CHROME', '/Images/Balo5/hinh1.jpg', 'VANS OLD SKOOL III BACKPACK LEMON CHROME', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com',
							N'Chiếc', 0, 1100000, 0, N'VANS', N'Yellow', N'Backpack', N'100% Poly', N'Unisex', '/Images/Balo5/hinh1.jpg', '/Images/Balo5/hinh2.jpg', '/Images/Balo5/hinh3.jpg')

insert into sanPham values ('BL006', N'VANS PLAYING MUSTARD MINI BACKPACK', '/Images/Balo6/hinh1.jpg', 'VANS PLAYING MUSTARD MINI BACKPACK', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc',
							1, 1200000, 0, N'VANS', N'Yellow', N'Backpack', N'Poly cao cấp', N'Unisex', '/Images/Balo6/hinh1.jpg', '/Images/Balo6/hinh2.jpg', '/Images/Balo6/hinh3.jpg')

insert into sanPham values ('BL007', N'VANS MID LIGHT "OFF THE WALL 66" BACKPACK BLACK', '/Images/Balo7/hinh1.jpg', 'VANS MID LIGHT "OFF THE WALL 66" BACKPACK BLACK', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com',
							N'Chiếc', 1, 1100000, 0, N'VANS', N'Black', N'Backpack', N'100% Poly', N'Unisex', '/Images/Balo7/hinh1.jpg', '/Images/Balo7/hinh2.jpg', '/Images/Balo7/hinh3.jpg')

insert into sanPham values ('BL008', N'VANS X NATIONAL GEOGRAPHIC RUCKSACK BLACK', '/Images/Balo8/h1.jpg', 'VANS X NATIONAL GEOGRAPHIC RUCKSACK BLACK', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc',
							1, 1400000, 0, N'VANS', N'Black', N'Backpack', N'100% Poly', N'Unisex', '/Images/Balo8/h1.jpg', '/Images/Balo8/h2.jpg', '/Images/Balo8/h3.jpg')

insert into sanPham values ('BL009', N'VANS SNAG BACKPACK YELLOW', '/Images/Balo9/h1.jpg', 'VANS SNAG BACKPACK YELLOW', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc', 0, 1200000, 0,
							N'VANS', N'Yellow', N'Backpack', N'100% Poly', N'Unisex', '/Images/Balo9/h1.jpg', '/Images/Balo9/h2.jpg', '/Images/Balo9/h3.jpg')

insert into sanPham values ('BL010', N'VANS W STRAND LOGO BACK BACKPACK PURPLE', '/Images/Balo10/h1.jpg', 'VANS W STRAND LOGO BACK BACKPACK PURPLE', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc',
							1, 1500000, 0, N'VANS', N'Purple', N'Backpack', N'Poly cao cấp', N'Unisex', '/Images/Balo10/h1.jpg', '/Images/Balo10/h2.jpg', '/Images/Balo10/h3.jpg')

insert into sanPham values ('BL011', N'VANS OLD SKHOOL H2O BACKPACK', '/Images/Balo11/h1.jpg', 'VANS OLD SKHOOL H2O BACKPACK', 27/11/2022, 3, N'Ba lô', 'diutrann5@gmail.com', N'Chiếc',
							0, 1290000, 0, N'VANS', N'Black', N'Backpack', N'Poly cao cấp', N'Unisex', '/Images/Balo11/h1.jpg', '/Images/Balo11/h2.jpg', '/Images/Balo11/h3.jpg')

--/Túi đeo chéo/
insert into sanPham values ('TU001', N'VANS WOMEN STREET READY WAIST PACK BAG', '/Images/Tui/h1.jpg', 'VANS WOMEN STREET READY WAIST PACK BAG', 27/11/2022, 4, N'Túi chéo', 'diutrann5@gmail.com', N'Chiếc',
							1, 750000, 0, N'VANS', N'Black', N'Backpack', N'100% Poly', N'Unisex', '/Images/Tui/h1.jpg', '/Images/Tui/h2.jpg', '/Images/Tui/h3.jpg')

insert into sanPham values ('TU002', N'VANS M WARD CROSS BODY PACK RED CHECK', '/Images/Tui1/h1.jpg', 'VANS M WARD CROSS BODY PACK RED CHECK', 27/11/2022, 4, N'Túi chéo', 'diutrann5@gmail.com', N'Chiếc',
							1, 750000, 0, N'VANS', N'Red Check', N'Backpack', N'Poly cao cấp', N'Unisex', '/Images/Tui1/h1.jpg', '/Images/Tui1/h2.jpg', '/Images/Tui1/h3.jpg')

insert into sanPham values ('TU003', N'VANS CROSS BODY PACK CHILI PEPPER CHECKERBOARD', '/Images/Tui2/h1.jpg', 'VANS CROSS BODY PACK CHILI PEPPER CHECKERBOARD', 27/11/2022, 4, N'Túi chéo',
							'diutrann5@gmail.com', N'Chiếc', 1, 850000, 0, N'VANS', N'Chili Pepper Checkerboard', N'Backpack', N'Poly cao cấp', N'Unisex',
							'/Images/Tui2/h1.jpg', '/Images/Tui2/h2.jpg', '/Images/Tui2/h3.jpg')

insert into sanPham values ('TU004', N'VANS MALY PLECACZEAK', '/Images/Tui3/h1.jpg', 'VANS MALY PLECACZEAK', 27/11/2022, 4, N'Túi chéo', 'diutrann5@gmail.com', N'Chiếc',
							0, 850000, 0, N'VANS', N'Black', N'Backpack', N'100% Poly', N'Unisex', '/Images/Tui3/h1.jpg', '/Images/Tui3/h2.jpg', '/Images/Tui3/h3.jpg')

--/Ví/
insert into sanPham values ('VI001', N'VANS POUCH WALLET BLACK/WHITE CHECKER', '/Images/Vi1/h1.jpg', 'VANS POUCH WALLET BLACK/WHITE CHECKER', 27/11/2022, 5, N'Ví', 'diutrann5@gmail.com', N'Chiếc',
							1, 450000, 0, N'VANS', N'Black Check', N'Wallet', N'100% Poly', N'Unisex', '/Images/Vi1/h1.jpg', '/Images/Vi1/h2.jpg', 'None')

insert into sanPham values ('VI002', N'VANS SLIPPED WALLET CLASSIC CAMO', '/Images/Vi2/h1.jpg', 'VANS SLIPPED WALLET CLASSIC CAMO', 27/11/2022, 5, N'Ví', 'diutrann5@gmail.com', N'Chiếc', 1,
							450000, 0, N'VANS', N'Classic Camo', N'Wallet', N'100% Poly', N'Unisex', '/Images/Vi2/h1.jpg', '/Images/Vi2/h2.jpg', 'None')

insert into sanPham values ('VI003', N'VANS SLIPPED WALLET BLACK/GUNMETAL GREY', '/Images/Vi3/h1.jpg', 'VANS SLIPPED WALLET BLACK/GUNMETAL GREY', 27/11/2022, 5, N'Ví', 'diutrann5@gmail.com',
							N'Chiếc', 0, 450000, 0, N'VANS', N'Grey', N'Wallet', N'100% Poly', N'Unisex', '/Images/Vi3/h1.jpg', '/Images/Vi3/h2.jpg', 'None')

--/Áo/
insert into sanPham values ('AO001', N'VANS M CLASSIC PO HOODIE II', '/Images/Ao1/h1.jpg', 'VANS M CLASSIC PO HOODIE II', 27/11/2022, 6, N'Áo', 'diutrann5@gmail.com', N'Cái', 1, 1200000, 0,
							N'VANS', N'Grey', N'Hoddie', N'60% Cotton, 40% Poly', N'Unisex', '/Images/Ao1/h1.jpg', '/Images/Ao1/h2.jpg', '/Images/Ao1/h3.jpg')

insert into sanPham values ('AO002', N'VANS M OTW TEE', '/Images/Ao2/h1.jpg', 'VANS M OTW TEE', 27/11/2022, 6, N'Áo', 'diutrann5@gmail.com', N'Cái', 1, 600000, 0, N'VANS', N'Yellow', N'Tee',
							N'Cotton', N'Unisex', '/Images/Ao2/h1.jpg', '/Images/Ao2/h2.jpg', '/Images/Ao2/h3.jpg')

insert into sanPham values ('AO003', N'VANS BMX OFF THE WALL LONG SLEEVE', '/Images/Ao3/h1.jpg', 'VANS BMX OFF THE WALL LONG SLEEVE', 27/11/2022, 6, N'Áo', 'diutrann5@gmail.com', N'Cái', 1, 720000, 0,
							N'VANS', N'White', N'Long Sleeve', N'Cotton',N'Unisex', '/Images/Ao3/h1.jpg', '/Images/Ao3/h2.jpg', '/Images/Ao3/h3.jpg')

insert into sanPham values ('AO004', N'VANS M HOUSER SS SHIRT', '/Images/Ao4/h1.jpg', 'VANS M HOUSER SS SHIRT', 27/11/2022, 6, N'Áo', 'diutrann5@gmail.com', N'Cái', 1, 920000, 0,
							N'VANS', N'Eyeballed', N'Shirt', N'100% BCI Cotton', N'Unisex', '/Images/Ao4/h1.jpg', '/Images/Ao4/h2.jpg', '/Images/Ao4/h3.jpg')

insert into sanPham values ('AO005', N'VANS X MARVEL BLACK PANTHER JACKET', '/Images/Ao5/h1.jpg', 'VANS X MARVEL BLACK PANTHER JACKET', 27/11/2022, 6, N'Áo', 'diutrann5@gmail.com', N'Cái',
							0, 2200000, 0, N'VANS', N'Blue', N'Jacket', N'Jeans', N'Unisex', '/Images/Ao5/h1.jpg', '/Images/Ao5/h2.jpg', '/Images/Ao5/h3.jpg')

--/Quần/
insert into sanPham values ('QN001', N'VANS BLACKHEART CHINO SHORTS SAND', '/Images/Quan1/h1.jpg', 'VANS BLACKHEART CHINO SHORTS SAND', 27/11/2022, 7, N'Quần', 'diutrann5@gmail.com', N'Cái',
							1, 950000, 0, N'VANS', N'White', N'Shorts', N'Jeans', N'Unisex', '/Images/Quan1/h1.jpg', '/Images/Quan1/h2.jpg', '/Images/Quan1/h3.jpg')

insert into sanPham values ('QN002', N'VANS MEN BEDFORD SHORTS', '/Images/Quan2/h1.jpg', 'VANS MEN BEDFORD SHORTS', 27/11/2022, 7, N'Quần', 'diutrann5@gmail.com', N'Cái', 1, 1600000, 0,
							N'VANS', N'Mint', N'Shorts', N'Jeans', N'Unisex', '/Images/Quan2/h1.jpg', '/Images/Quan2/h2.jpg', '/Images/Quan2/h3.jpg')

--/Mũ/
insert into sanPham values ('MU001', N'VANS WILKEN 5 CAP', '/Images/Mu1/h1.jpg', 'VANS WILKEN 5 CAP', 27/11/2022, 8, N'Mũ', 'diutrann5@gmail.com', N'Cái', 1, 790000, 0, N'VANS',
							N'Navy Blue', N'Cap', N'Cotton cao cấp', N'Unisex', '/Images/Mu1/h1.jpg', '/Images/Mu1/h2.jpg', '/Images/Mu1/h3.jpg')

insert into sanPham values ('MU002', N'VANS RED CAP', '/Images/Mu2/h1.jpg', 'VANS RED CAP', 27/11/2022, 8, N'Mũ', 'diutrann5@gmail.com', N'Cái', 0, 690000, 0, N'VANS', N'Red',
							N'Cap', N'Cotton', N'Unisex', '/Images/Mu2/h1.jpg', '/Images/Mu2/h2.jpg', '/Images/Mu2/h3.jpg')

insert into sanPham values ('MU003', N'VANS PATCH JOCK BLACK', '/Images/Mu3/h1.jpg', 'VANS PATCH JOCK BLACK', 27/11/2022, 8, N'Mũ', 'diutrann5@gmail.com', N'Cái', 1, 790000,0,
							N'VANS', N'Black', N'Cap', N'Cotton', N'Unisex', '/Images/Mu3/h1.jpg', '/Images/Mu3/h2.jpg', '/Images/Mu3/h3.jpg')

insert into sanPham values ('MU004', N'VANS CHECKERBOARD CAP', '/Images/Mu4/h1.jpg', 'VANS CHECKERBOARD CAP', 27/11/2022, 8, N'Mũ', 'diutrann5@gmail.com', N'Cái', 1, 690000, 0,
							N'VANS', N'Black White', N'Cap', N'Cotton', N'Unisex', '/Images/Mu4/h1.jpg', '/Images/Mu4/h2.jpg', '/Images/Mu4/h3.jpg')

insert into sanPham values ('MU005', N'VANS AP THE ULTRASAKE CAP', '/Images/Mu5/h1.jpg', 'VANS AP THE ULTRASAKE CAP', 27/11/2022, 8, N'Mũ', 'diutrann5@gmail.com', N'Cái', 0, 690000, 0,
							N'VANS', N'Black', N'Cap', N'Cotton', N'Unisex', '/Images/Mu5/h1.jpg', '/Images/Mu5/h2.jpg', '/Images/Mu5/h3.jpg')
-------------- Bài viết-------------
insert into baiViet values ('BV100', N'BETTER™️ GIFT SHOP X VAULT BY VANS – TỰ HÀO CÙNG NÉT VĂN HÓA Á ĐÔNG', '/Images/New1/h1.jpg', N'Được thành lập tại Toronto, Canada vào năm 2017 Better ™ 
							Gift Shop được tạo ra...', 27/11/2022, N'Giới thiệu sản phẩm', N'Được thành lập tại Toronto, Canada vào năm 2017 Better ™ Gift Shop được tạo ra để mang những ý tưởng văn hóa, 
							xã hội và nghệ thuật vào cuộc sống thông qua những sản phẩm thời trang may mặc. Đó là một cửa hàng quà tặng được biết đến như một bảo tàng; một cuộc triển lãm về nguồn cảm hứng; 
							một nền tảng cho nghệ thuật cổ điển và hiện đại, nơi thể hiện văn hóa, nét truyền thống riêng biệt nơi được chắp cánh ý tưởng trên nhiều sản phẩm. Tất cả các sự hợp tác đến từ 
							Better ™ Gift Shop đều được đánh giá cao về giá trị lưu giữ cũng như mang tính nghệ thuật cao. Thông qua các sáng kiến hợp tác này, Better ™ Gift Shop mong muốn kết nối toàn cầu 
							các cộng đồng và ý tưởng của đối tác cũng như nhãn hàng với nhau.
							Lần bắt tay đắt giá năm 2022 của Better ™ Gift Shop có thể kể đến là với nhà giày VANS và đặc biệt hơn là VAULT BY VANS. Cảm hứng cho sự hợp tác này bắt nguồn từ cửa hàng riêng của 
							Better ™ ️ Gift Shop đặc biệt chi tiết hơn từ câu lạc bộ Hong Luck Kung Fu.
							Được thành lập vào năm 1961 với tư cách là một tổ chức phi lợi nhuận và đã cung cấp các dịch vụ Kung Fu, võ thuật, Huấn luyện Múa Sư tử và Múa Sư tử cho khu vực Toronto trong hơn 61 năm. 
							Tổ chức này là một niềm tự hào tôn vinh nền văn hóa Trung Quốc và cam kết duy trì truyền thống của nó trong cộng đồng người Châu Á tại Canada. Ý tưởng kết hợp này ngay lập tức được 
							Better ™ Gift Shop ủng hộ khi đưa ý tưởng truyền thống văn hóa Á Đông vào chính sản phẩm giày hiện đại của nhà Vault.', 'diutrann5@gmail.com', 1, '/BaiViet/New1/h2.jpg',1200)


insert into baiViet values ('BV002', N'CON CONCEPT X VANS – NGUỒN CẢM HỨNG THỜI TRANG PUNK', '/Images/New2/h1.jpg', N'Giống như các dự án trước đây của họ, nhà bán lẻ và thương hiệu giày dép có t...', 27/11/2022,
							N'Giới thiệu sản phẩm', N'Giống như các dự án trước đây của họ, nhà bán lẻ và thương hiệu giày dép có trụ sở tại Boston đã quyết định lấy cảm hứng từ âm nhạc cho bộ sưu tập collab mới nhất 
							của họ, với chủ đề chính từ album Question the Answers của Mighty Mighty Bosstones phát hành năm 1994. Bộ sưu tập bao gồm hai lần lặp lại của VANS SK8-HI, VANS OLD SKOOL và VANS AUTHENTIC 
							với mỗi cặp sở hữu một mô hình bàn cờ mờ được thấy trong Thời trang thập niên 70 và 80 ở London.
							Làm việc với VANS đã cho chúng tôi không gian để thử nghiệm lịch sử phong phú của thời trang punk. Bộ sưu tập mới nhất này, bao gồm các loại quần áo nội bộ tiên tiến nhất của chúng tôi, 
							cho phép chúng tôi tôn vinh lịch sử âm nhạc địa phương và truyền đạt kiến ​​thức sâu sắc của chúng tôi về các chi tiết thiết kế sang trọng. Deon Point, giám đốc sáng tạo của Con Concept, 
							cho biết về dự án.', 'diutrann5@gmail.com', 0, '/BaiViet/New2/h2.jpg',300)


insert into baiViet values ('BV003', N'BỘ SƯU TẬP VỚI MỤC ĐÍCH CAO CẢ', '/Images/New3/h1.jpg', N'Gần đây, kỉ nguyên VANS đã liên tục được hồi phục bằng những lần hợp tác chất lượng, với những đối tác chấ...', 27/11/2022,
							N'Giới thiệu sản phẩm', N'Gần đây, kỉ nguyên VANS đã liên tục được hồi phục bằng những lần hợp tác chất lượng, với những đối tác chất lượng và đương nhiên kết quả là những sản phẩm vô cùng ấn tượng. 
							Sau dấu ấn hợp tác từ nhà giày có trụ sở tại Anaheim cùng những sức ảnh hưởng lớn như Bianca Chandôn và loạt phim nổi tiếng Stranger Things của Netflix, VANS tiếp tục phát triển những dự án bộ sưu tập 
							đặc sắc cùng một sáng kiến ​​từ thiện cùng với hãng thu âm Secretly Canadian. Trong nỗ lực trợ giúp nhiều người vô gia cư ở quê hương Bloomington, Indiana của công ty âm nhạc, công ty đã liên kết với 
							VANS để tạo ra sự hợp tác VANS Sk8-Hi nhằm nâng cao nhận thức và phát triển một cách mạnh nhất quỹ từ thiện giúp đỡ càng nhiều đối tượng càng tốt.
							Bước ra hoàn hảo từ bộ sưu tập, kiểu dáng VANS Sk8-Hi thể hiện không thể tốt hơn những thông điệp mà đối tác nhà VANS mong muốn gửi gắm một cách trọn vẹn nhất. Với phông nền trắng sạch sẽ và tác phẩm 
							nghệ thuật mặt trời và mặt trăng màu xanh lam ám chỉ lời bài hát trong "Farewell Transmission" của Jason Molina, sản phẩm mang biểu tượng của sự đơn giản tinh tế nhưng đầy sự sáng tạo cùng mang chất lượng 
							không thể bàn cãi từ phía nhà giày. Nét nổi bật chấm phá nằm ở mặt sau giày với dòng chữ "Every Light On This" bên trái và "Side Of Town" ở bên phải. Đây cũng chính là hai lời hát đầu tiên trong bài hát 
							chủ đề của bộ sưu tập.', 'diutrann5@gmail.com', 1, '/BaiViet/New3/h2.jpg',70)


insert into baiViet values ('BV004', N'PALM ANGELS X VAULT BY VANS – CỔ ĐIỂN VÀ ĐƯƠNG ĐẠI', '/Images/New4/h1.jpg', N'Được biết đến là dòng sản phẩm cao cấp so với nhiều bộ sưu tập sản phẩm khác...', 27/11/2022,
							N'Giới thiệu sản phẩm', N'Được biết đến là dòng sản phẩm cao cấp so với nhiều bộ sưu tập sản phẩm khác của VANS, Vault by Vans đã chiếm được trái tim của nhiều người trong suốt năm qua nhờ khả năng hợp tác 
							đa dạng nổi bật. Trong suốt năm 2022, chúng ta đã thấy sự hợp tác với những nguồn cảm hứng như Brain Dead và CDG cho các bộ sưu tập mới, và giờ đây, hoan nghênh Palm Angels tham gia vào loạt sự kiện này cùng 
							với nhà giày. Thương hiệu thời trang dạo phố đương đại được biết đến qua những sản phẩm kinh điển như Sk8-Hi VLT LX, Sk8- Mid VLT LX và Old Skool LX, tất cả đều hướng đến sự tự do và cá tính có trong văn hóa trượt ván.
							Mỗi sản phẩm trong bộ sưu tập này được chuẩn bị với các đặc điểm thiết kế tương tự như phần cơ bản nhất của các siêu phẩm kể trên. Tuy nhiên, điều khác biệt đặc biệt được kể đến là phần đế giữa trong mờ cao su, cũng như 
							thương hiệu Palm Angels được uốn lượn mô phỏng lại các sọc nhạc jazz truyền thống thay thế cho phần họa tiết da cơ bản. Bộ sưu tập được thể hiện bởi ba màu sắc đỏ, đen, xám. Trong đó Sk8-Hi được trang trí với màu đỏ 
							quyền lực, cá tính, Sk8-Mid được thiết kế theo phong cách màu đen tối giản và Old Skools được chế tác với màu xám đất khiêm tốn nhưng vẫn đặc sắc.', 'diutrann5@gmail.com', 1, '/BaiViet/New4/h2.jpg',346)


insert into baiViet values ('BV005', N'VANS X STRANGER THINGS – SỰ KẾT HỢP ĐỐI VỚI BOM TẤN', '/Images/New5/h1.jpg', N'Sự thành công của series phim kinh dị Stranger Things 4 mang lại một cơn sốt v...', 27/11/2022, N'Giới thiệu sản phẩm',
							N'Sự thành công của series phim kinh dị Stranger Things 4 mang lại một cơn sốt vô cùng béo bở cho những nhà sáng tạo tuyệt vời. Mang ảnh hưởng, ấn tượng bởi những tình tiết hấp dẫn, hình ảnh và âm thanh rùng rợn từ bộ phim, 
							nhà VANS mang đến một quyết định hợp tác cùng những hình ảnh đặc trưng của series ăn khách đang chiếm lĩnh cộng đồng phim ảnh. Mang thế giới giàu trí tưởng tượng vào cuộc sống, người hâm mộ được giới thiệu đến bộ sưu tập 
							Stranger Things bao gồm nhiều loại giày dép và quần áo và đặc biệt hơn khi nhà VANS mang đến cho chúng ta bao gồm những cơ hội tùy chỉnh một phần đáng kể sản phẩm thuộc bộ sưu tập.
							Bộ sưu tập sở hữu những kiểu dáng vốn đã tạo nên tên tuổi của nhà giày, bao gồm VANS Sk8-Hi, Old Skool, Slip-On và Authentic. Mỗi kiểu dáng mang riêng cho mình các đồ họa chuyên đề khác nhau và chi tiết bao phủ mỗi đôi cũng đặc 
							biệt một cách riêng biệt, mang đậm dấu ấn của bộ phim ăn khách.', 'diutrann5@gmail.com', 1, '/BaiViet/New5/h2.jpg',500)


insert into baiViet values ('BV006', N'VANS OLD SKOOL OVERT CC – SỰ CHUYỂN MÌNH ĐÁNG MONG ĐỢI', '/Images/New6/h1.jpg', N'Khi nhắc đến những đôi sneaker độc đáo từ nhà VANS, chúng ta không thể không...', 27/11/2022, N'Giới thiệu sản phẩm',
							N'Khi nhắc đến những đôi sneaker độc đáo từ nhà VANS, chúng ta không thể không nhắc đến siêu phẩm VANS OLD SKOOL – đôi giày luôn nằm trong mục best seller của hãng xuyên suốt nhiều thập kỷ qua. Xuất phát điểm cho 
							biểu tượng “sọc nhạc jazz”, Old Skool đã đi trước thời đại vào năm 1977 khi nó ra mắt lần đầu tiên. Kể từ đó, rất nhiều cách phối màu, hợp tác và làm lại đã làm nên tên tuổi của nhà VANS. Giờ đây, cho năm 2022, 
							VANS đưa ra quyết định chọn làm mới kiểu dáng cổ điển của OLD SKOOL với phần trên và đế mới được thay đổi. Quyết định này nhằm đưa đến những trải nghiệm được nâng cấp hơn, bên cạnh đó vẫn giữ lại những biểu tượng 
							và công nghệ cổ điển đã làm nên nét riêng cho kiểu dáng này.
							Được đặt tên là Old Skool Overt CC, trọng tâm của lần lặp lại này của Old Skool là sự phù hợp với phong cách thể thao, rộng rãi hơn và thoải mái hơn. Phần đế được thiết kế to bè hơn, kích thước ngoại cỡ được điêu khắc 
							360 độ cung cấp vùng co giãn êm ái và tấm đế ngoài bằng cao su để tạo độ bám lực kéo.', 'diutrann5@gmail.com', 0, '/BaiViet/New6/h2.jpg',120)


insert into baiViet values ('BV007', N'VANS VỚI BỘ SƯU TẬP "NĂNG LƯỢNG ĐA DẠNG"', '/Images/New7/h1.jpg', N'Lấy cảm hứng từ những thành tựu xã hội, kinh tế, văn hóa và chính trị của phụ...', 27/11/2022, N'Giới thiệu sản phẩm',
							N'Lấy cảm hứng từ những thành tựu xã hội, kinh tế, văn hóa và chính trị của phụ nữ, dòng sản phẩm DIVINE ENERGY đại diện cho quyền của phái đẹp, sự phát ngôn cho những lý lẽ công bằng mà phụ nữ xứng 
							đáng có được. Bộ sưu tập này bao gồm giày thể thao và quần áo đặc trưng của thương hiệu. VANS Old Skool Divine Energy và Classic Slip-On có sự kết hợp giữa màu đất, hoa và họa tiết kẻ caro của thương hiệu. 
							La Costa Slide-On có biểu tượng hoa với các từ “fighter”, “dreamer”, “healer”, “leader”, “advocate”, “mentor” và “lover” được dịch sang các ngôn ngữ khác nhau trên đế giày. Những biểu tượng ấy đại diện 
							cho những vai trò của phụ nữ trong xã hội, sự tích cực của phụ nữ trên thế giới và chỉ có phụ nữ mới làm được. Về trang phục, áo hoodie và quần thể thao phù hợp được trang trí bằng hình ảnh in lụa trên mây. 
							Ticker Sock trong bản in Checkerboard toàn diện làm tròn phạm vi.
							Để tôn vinh sự kiện này, VANS sẽ quyên góp một phần doanh thu từ bộ sưu tập cho Tides Foundation. Ngoài ra, công ty sẽ hỗ trợ tổ chức có trụ sở tại Vương quốc Anh, Sisterhood, tổ chức cung cấp các chương trình 
							hành động xã hội sáng tạo cho trẻ em gái và thanh niên mở rộng giới tính.', 'diutrann5@gmail.com', 1, '/BaiViet/New7/h2.jpg',360)


insert into baiViet values ('BV008', N'VANS x SAILOR MOON - TÔN VINH BỘ TRUYỆN TRANH/ ANIME MANG TÍNH BIỂU TƯỢNG', '/Images/New8/h1.jpg', N'Chắc hẳn không ít độc giả cảm thấy quen thuộc với cái tên Sailor moon - một b...', 27/11/2022, N'Giới thiệu sản phẩm',
							N'Chắc hẳn không ít độc giả cảm thấy quen thuộc với cái tên Sailor moon - một bộ truyện tranh xứ sở hoa anh đào về tình yêu, tình bạn và hòa bình gắn liền với tuổi thơ của rất nhiều người. Không cần nghi ngờ gì về khả năng tạo hiệu 
							ứng và “lây lan” chóng mặt khi tác phẩm mang nhiều yếu tố thú vị, thu hút người xem. Bên cạnh đó là nội dung và lối dẫn dắt gần gũi không biết từ bao giờ đã dần len lỏi vào ký ức và “hớp hồn” trái tim rất nhiều thế hệ trẻ em trên 
							toàn thế giới. Mang theo cơn sốt hơn 30 năm chưa hạ nhiệt, Sailor moon ắt hẳn đã chiếm được tình yêu của người hâm mộ bất chấp thời gian.
							Với vị thế bền vững trên thị trường giày thể thao là vậy nhưng VANS vẫn luôn không ngừng ấp ủ những dự án để mang đến sự mới lạ cho tên tuổi và thử sức bản thân. Lần này VANS bắt tay với Sailor Moon ra mắt bộ sưu tập đặc biệt bao gồm 
							quần áo và giày dép đa dạng cho cả nam, nữ và trẻ em với tiêu chí tập trung toàn diện vào manga/ anime shoujo nhượng quyền thương mại mang tính biểu tượng toàn cầu.', 'diutrann5@gmail.com', 1, '/BaiViet/New/8h2.jpg',91)

--/Sản phẩm mới/
insert into baiViet values ('BV009', N'HÌNH ẢNH ĐẦU TIÊN TỪ LẦN COLLAB ĐÁNG MONG CHỜ ONE PIECE X VANS', '/Images/New9/h1.jpg', N'Không phụ lòng sự mong đợi của người hâm mộ, ngay khi One Piece Film: Red ch..', 27/11/2022,
							N'Sản phẩm mới', N'Không phụ lòng sự mong đợi của người hâm mộ, ngay khi One Piece Film: Red chuẩn bị ra mắt tại Bắc Mỹ, loạt phim One Piece đã triển khai một số hoạt động đáng chú ý bao gồm thực hiện những 
							bộ sưu tập mới với CASETIFY và giờ là sự hợp tác lớn đầu tiên về giày dép với VANS. Mặc dù được đánh giá là một trong những phim hoạt hình nổi tiếng và phổ biến nhất mọi thời đại, nhưng bản 
							phát hành giày thể thao chính thức duy nhất của One Piece vẫn là của Kappa, và giờ đây chúng ta có thể thấy tham vọng vươn xa hơn của bộ phim đã xuất hiện lớn dần theo thời gian. 
							Đây có lẽ là một sự hợp tác đáng mong đợi, vốn từ lâu, những đợt collab thành công từ nhà VANS đều xuất phát từ những bộ phim huyền thoại đặc biệt hôm này là sự xuất hiện của One Piece.
							VANS sau khi bắt đầu một loạt sản phẩm hợp tác mở rộng với Sailor Moon, trong đó nó cung cấp một số bóng giày dép theo chủ đề cũng như quần áo và phụ kiện. Với lần hợp tác này với OP, 
							nhà giày sử dụng cho mình phiên bản đặc biệt VANS Authentic có kiểu dệt lấy cảm hứng từ mũ rơm trên mũ và dây buộc bằng dây gai dầu gợi nhớ đến dây thuyền buồm, thay thế cho vải canvas thông thường. 
							Các họa tiết cờ cướp biển khác nhau từ loạt phim được hiển thị trên hình bóng và hình ảnh la bàn màu đỏ chỉ bốn hướng đến chữ “VANS” được thêu trên tab lưỡi.', 'diutrann5@gmail.com', 1, '/BaiViet/New9/h2.jpg',80)


insert into baiViet values ('BV010', N'CDG X VAULT BY VANS OG CLASSIC SLIP-ONS NỔI BẬT BỞI THIẾT KẾ MONOGRAM', '/Images/New10/h1.jpg', N'Sự hiện đại của thời trang đang dần được phổ biến vô cùng rộng rãi, những bản...', 27/11/2022,
							N'Sản phẩm mới', N'Sự hiện đại của thời trang đang dần được phổ biến vô cùng rộng rãi, những bản sắc riêng biệt của từng nhãn hàng đến những xu hướng bắt mắt chung của nghệ thuật thời trang nhằm mang đến những 
							trải nghiệm tuyệt vời nhất. Họa tiết monogram cũng theo đó đang dần được làm sống lại một cách tiêu biểu hơn cả. Bằng chứng tuyệt vời nhất là khi VANS VAULT quyết định đem nó vào sự hợp tác của mình với nhãn phụ 
							COMME des GARÇONS ‘CDG ngay sau bản phát hành Old Skool thứ hai vào đầu năm nay. Tiếp tục mối quan hệ hợp tác đã tạo nên sự nổi tiếng với các mẫu giày Authentic, Lampin và Old Skool LX, những chiếc Slip-Ons độc đáo 
							đặc sắc sắp tới sở hữu cho mình bản in monogram CDG là họa tiết chính cho bộ sưu tập.
							Monogram –là thuật ngữ chỉ thiết kế chữ lồng – biểu tượng được kết hợp từ hai hoặc nhiều chữ cái lại với nhau. Monogram không chỉ là di sản của thương hiệu. Những biểu tượng này được áp dụng lên trang phục, 
							giày dép để công chúng khoác lên mình thể hiện sự xa hoa và phong cách riêng của mình, đặc biệt khi đó là Monogram đến từ những thương hiệu lâu đời như nhà VANS.', 'diutrann5@gmail.com', 0, '/BaiViet/New10/h2.jpg',63)


insert into baiViet values ('BV011', N'SLAM JAM NỔI DẬY VỚI SỰ HỢP TÁC VỚI VANS SK8-HI', '/Images/New11/h1.jpg', N'Được thành lập bởi Luca Benini vào năm 1989, Slam Jam được sinh ra để phục v...', 27/11/2022, N'Sản phẩm mới',
							N'Được thành lập bởi Luca Benini vào năm 1989, Slam Jam được sinh ra để phục vụ giới underground từ rất lâu trước khi thuật ngữ streetwear còn tồn tại. Từ trụ sở chính ở Ferrara, cách xa cơ sở thời trang Châu Âu, Slam Jam 
							đã có thể trau dồi phong cách độc đáo, đặc biệt của riêng mình, sử dụng nghệ thuật, âm nhạc và câu lạc bộ làm hướng dẫn để kết nối với các bộ tộc có cùng chí hướng trên khắp Thế giới, và trở thành nhà nhập khẩu đầu tiên 
							của Ý đối với các thương hiệu chưa được biết đến như Stussy.
							Ngày nay, nó tận dụng uy tín và kinh nghiệm của mình trong cộng đồng để thúc đẩy phong cách và thái độ của các tiểu văn hóa đô thị trên toàn cầu. Ngoài các hoạt động kinh doanh phân phối và bán lẻ, Slam Jam hợp tác với 
							các thương hiệu với tư cách là đối tác toàn cầu toàn cầu về thị trường, cung cấp mọi cấp độ dịch vụ từ định hướng xây dựng thương hiệu và thiết kế, đến bán buôn, bán lẻ và tương tác với cộng đồng. Slam Jam giờ đây đã 
							thêm VANS vào danh sách các đối tác của mình, tiết lộ sản phẩm đầu tay trên kiểu dáng VANS Sk8-Hi.', 'diutrann5@gmail.com', 1, '/BaiViet/New11/h2.jpg',82)

insert into baiViet values ('BV012', N'Skate Half Cab ’92 – DIME X VANS TIẾP TỤC TẠO NÊN CƠN SỐT MỚI', '/Images/New12/h1.jpg', N'Là một thượng đế của nhà VANS, ắt hẳn bạn đã một lần để ý đến sự hợp tác g...', 27/11/2022, N'Sản phẩm mới',
							N'Là một thượng đế của nhà VANS, ắt hẳn bạn đã một lần để ý đến sự hợp tác giữ Dime và nhà giày đã từng diễn ra trong thời gian gần. Trong đó cả hai đã thực hiện chung Wayvee, Old Skool Pro, Slip-On Pro và nhiều lần 
							lặp lại cùng nhau sự hợp tác này như một sự kết hợp vô cùng ăn ý và mang lại giá trị tích cực cho sản phẩm của cả hai. Và để kết thúc tháng 9, bộ đôi này sẽ tái hợp để tạo ra một sản phẩm sang trọng của Skate Half Cab 
							92 vừa được nhà VANS công bố chính thức thông qua những hình ảnh mới nhất.
							Trong lần hợp tác mới nhất này, thương hiệu thời trang dạo phố có trụ sở tại Montreal cùng với dấu ấn của người chơi trượt ván ở California chính là hai nguồn cảm hứng chính, cũng như từ sự khám phá sáng tạo và văn hóa 
							DIY trong lĩnh vực những môn thể thao đường phố. Bộ sưu tập sở hữu duy nhất một sản phẩm được gửi gắm nhiều tâm huyết, hình bóng phong cách sống cũng như giá trị của Dime lẫn VANS được thể hiện bằng vật liệu cao cấp và 
							bảng màu tinh tế. Các tấm da lộn sang trọng tạo nên toàn bộ phần upper, với chỉ một lớp màu “Oxford Tan”. Màu sắc sáng kem sang trọng và đặc biệt tinh tế khi hòa cùng những đường nét điểm nhấn giá trị như 
							logo Thương hiệu Half Cab, Dime hay VANS được khắc nghệ thuật tỉ mỉ.', 'diutrann5@gmail.com', 1, '/BaiViet/New12/h2.jpg',112)


insert into baiViet values ('BV013', N'LAB SKATE SHOP X VANS SKATE HALF CAB “CROC GREEN”', '/Images/New13/h1.jpg', N'VANS tiếp tục mở rộng danh mục hợp tác của mình mỗi năm khi nắm bắt được xu...', 27/11/2022, N'Sản phẩm mới',
							N'VANS tiếp tục mở rộng danh mục hợp tác của mình mỗi năm khi nắm bắt được xu hướng cũng như các nhà thiết kế, thương hiệu và nhà bán lẻ mới. Những yếu tố này phần nào là cơ hội để mang đến những thứ mới mẻ cho chính VANS 
							cũng như đối với đối tác của nhà giày. Và như một làn gió mới, bộ sưu tập đặc biệt được xướng tên liên quan đến siêu phẩm VANS HALF CAB - mẫu giày đặc trưng thứ hai của Steve Caballero được cung cấp từ VANS. Tuy nhiên, chỉ 
							như thế là không đủ khi VANS mời được những sự hợp tác vô cùng đáng giá như Bianca Chandôn, Salehe Bembury và One Block Down. Giờ đây, Cửa hàng giày trượt ván có trụ sở tại Thành phố New York đã kết nối với VANS để giới thiệu 
							giày trượt Skate Half Cab “Croc Green”.
							Mẫu giày VANS Skate Half Cab của Labour Skate bắt đầu hoàn hảo với chi tiết phần đế bằng da cá sấu giả màu đen. Sản phẩm tiếp tục hoàn thiện ở bộ phận đế và lưỡi DURACAP có logo thương hiệu VANS Skate Half Cab. Hai thẻ khâu màu 
							đen được đính ngay dưới cổ giày bên nổi bật bởi dòng chữ “LABOR” và họa tiết bàn cờ mang tính biểu tượng của nhà VANS.', 'diutrann5@gmail.com', 0, '/BaiViet/New13/h2.jpg',227)


insert into baiViet values ('BV014', N'VANS X PRETTY GUARDIAN SAILOR MOON', '/Images/New14/h1.jpg', N'VANS tự hào công bố Bộ sưu tập giá trị VANS x Pretty Guardian Sailor Moon...', 27/11/2022, N'Sản phẩm mới', 
							N'VANS tự hào công bố Bộ sưu tập giá trị VANS x Pretty Guardian Sailor Moon của Lizzie Armanto. Lấy cảm hứng từ chương trình biểu diễn và vận động viên trượt ván tiên phong, bộ sưu tập mới nhất giữa VANS và biểu tượng 
							Pretty Guardian Sailor Moon là một bức thư tình vui vẻ nhưng không kém phần mạnh mẽ dành cho người hâm mộ của cả hai. Bộ sưu tập giày dép, quần áo và phụ kiện gợi lên cách tiếp cận DIY với cảm giác cổ điển, dẫn đầu 
							bởi hình bóng hướng đến hiệu suất mới của VANS, The Lizzie — đôi giày trượt ván đầu tiên của VANS do một người phụ nữ thiết kế trong suốt 20 năm qua.
							Pretty Guardian Sailor Moon là một manga shojo được viết bởi Naoko Takeuchi, bắt đầu đăng dài kỳ vào năm 1991 trên tạp chí hàng tháng Nakayosi (do Kodansha xuất bản). Cuốn sách gốc đã được dịch sang 17 thứ tiếng và loạt phim 
							hoạt hình do Toei Animation sản xuất đã được phát triển tại hơn 40 quốc gia gây ra các hiện tượng xã hội ở Nhật Bản và trên toàn thế giới. VANS đã hợp tác với Pretty Guardian Sailor Moon trong một bộ sưu tập phản ánh khả năng 
							phục hồi và tinh thần hòa nhập được thấy ngày nay thông qua khả năng nghệ thuật của tay đua Lizzie Armanto thuộc đội VANS.', 'diutrann5@gmail.com', 1, '/BaiViet/New14/h2.jpg',84)


insert into baiViet values ('BV015', N'ONE BLOCK DOWN – TÁC PHẨM THỦ CÔNG ĐẶC SẮC CÙNG NHÀ OFF THE WALL', '/Images/New15/h1.jpg', N'Châu Âu là nơi có vô số cửa hàng thời trang dạo phố và nhà bán lẻ giày sneaker...', 27/11/2022, N'Sản phẩm mới',
							N'Châu Âu là nơi có vô số cửa hàng thời trang dạo phố và nhà bán lẻ giày sneaker cao cấp. Sự phát triển về thời trang và giá trị thiết thực của một sản phẩm được đánh giá rất tỉ mỉ đồng thời cũng rất chuyên nghiệp, một trong số 
							đó là One Block Down ở Milan, Ý. Thương hiệu được biết đến thường tham gia vào các dự án hợp tác về giày dép và họ vừa công bố sản phẩm mới nhất của hãng Slip-On “Dog Days” với nhà VANS đình đám của chúng ta. Đây quả thật là một 
							quyết định mang giá trị cao, cũng như hứa hẹn sẽ tạo nên một xu hướng mới nếu như cả hai cùng nhau đưa ra những sản phẩm đáng mong chờ nhất.
							Đối với sáng kiến ​​mới này, One Block Down đã đi sâu vào nguồn gốc tự làm gắn liền với hình bóng cổ điển dễ lắp ráp. Ba màu sắc được lựa chọn cho những sản phẩm của cả hai bao gồm “Caution”, “Bonfire” và “Grass” đều được tỉ mỉ 
							trang trí bằng tay. Điểm đặc biệt của bộ sưu tập hợp tác nằm ở các bộ hạt phức tạp, kết nối với nhau cùng với độ chính xác cực cao và tuân theo các đường nét của các mẫu họa tiết nổi tiếng nhà VANS - checkerboard – hay còn gọi 
							là họa tiết bàn cờ.', 'diutrann5@gmail.com', 1, '/BaiViet/New15/h2.jpg',900)


insert into baiViet values ('BV016', N'LIZZIE ARMANTO VÀ VANS SKATEBOARDING – SỰ HỢP TÁC MANG GIÁ TRỊ TÍCH CỰC', '/Images/New16/h1.jpg', N'Đầu năm nay, Lizzie Armanto và VANS Skateboarding đã kết nối lại cùng nhau ...', 27/11/2022, N'Sản phẩm mới',
							N'Đầu năm nay, Lizzie Armanto và VANS Skateboarding đã kết nối lại cùng nhau để giới thiệu mẫu giày đặc trưng đầu tiên của Armanto với thương hiệu này. Ra mắt với tông màu nhẹ nhàng “Marshmallow”, The Lizzie đầu tiên xuất 
							hiện cùng với một bộ sưu tập quần áo đã nhận được không ít những đón nhận tích cực từ phía những người yêu cái đẹp. Giờ đây, bộ sưu tập thứ hai The Lizzie đang trên đường ra mắt. Một lần nữa, các sản phẩm hàng ngày được 
							thiết kế với trang phục Armanto là sản phẩm mang tính chủ đạo, và là cảm hứng cho những siêu phẩm được hứa hẹn sẽ bùng nổ mùa hè 2022.
							Màu sắc được chủ động lựa chọn là màu nâu mạnh mẽ, cá tính và sở hữu thật nhiều điểm nhấn đặc sắc. Sản phẩm giày được gia công bằng vải bông hữu cơ 100% của nó, có một ý nghĩa đặc biệt quan trọng đối với môi trường của chúng ta.',
							'diutrann5@gmail.com', 1, '/BaiViet/New16/h2.jpg',440)
