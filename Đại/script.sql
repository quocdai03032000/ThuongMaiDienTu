USE [master]
GO
/****** Object:  Database [ThuongMaiDienTu]    Script Date: 01/12/2022 01:57:13 ******/
CREATE DATABASE [ThuongMaiDienTu] ON  PRIMARY 
( NAME = N'ThuongMaiDienTu', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ThuongMaiDienTu.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ThuongMaiDienTu_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ThuongMaiDienTu_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ThuongMaiDienTu] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThuongMaiDienTu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ARITHABORT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ThuongMaiDienTu] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ThuongMaiDienTu] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET  DISABLE_BROKER
GO
ALTER DATABASE [ThuongMaiDienTu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ThuongMaiDienTu] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ThuongMaiDienTu] SET  READ_WRITE
GO
ALTER DATABASE [ThuongMaiDienTu] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ThuongMaiDienTu] SET  MULTI_USER
GO
ALTER DATABASE [ThuongMaiDienTu] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ThuongMaiDienTu] SET DB_CHAINING OFF
GO
USE [ThuongMaiDienTu]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedback_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Feedback_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangInfor]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangInfor](
	[DonHangInfor_id] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Sdt] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TinhThanh] [nvarchar](50) NULL,
	[QuanHuyen] [nvarchar](50) NULL,
	[PhuongXa] [nvarchar](50) NULL,
 CONSTRAINT [PK_DonHangInfor] PRIMARY KEY CLUSTERED 
(
	[DonHangInfor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonHangInfor] ON
INSERT [dbo].[DonHangInfor] ([DonHangInfor_id], [HoTen], [Email], [Sdt], [DiaChi], [TinhThanh], [QuanHuyen], [PhuongXa]) VALUES (6, N'Trần quốc đại', N'123@gmail.com', N'0777973833', N'58B ấp 4 Xuân Thới sơn Hóc Môn', N'31', N'Huyện Hóc Môn', N'Chọn phường / xã')
SET IDENTITY_INSERT [dbo].[DonHangInfor] OFF
/****** Object:  Table [dbo].[Account_role]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account_role](
	[Account_role_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_role_name] [varchar](50) NULL,
 CONSTRAINT [PK_Account_role] PRIMARY KEY CLUSTERED 
(
	[Account_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account_role] ON
INSERT [dbo].[Account_role] ([Account_role_id], [Account_role_name]) VALUES (1, N'admin')
INSERT [dbo].[Account_role] ([Account_role_id], [Account_role_name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Account_role] OFF
/****** Object:  Table [dbo].[Type_SanPham]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_SanPham](
	[Type_SanPham_id] [int] IDENTITY(1,1) NOT NULL,
	[Type_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type_SanPham] PRIMARY KEY CLUSTERED 
(
	[Type_SanPham_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Type_SanPham] ON
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (1, N'Tee')
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (2, N'Pant')
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (3, N'Jacket')
INSERT [dbo].[Type_SanPham] ([Type_SanPham_id], [Type_name]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[Type_SanPham] OFF
/****** Object:  Table [dbo].[TinhTrangDonHang]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangDonHang](
	[TinhTrangDonHang_id] [int] NOT NULL,
	[TinhTrangDonHang_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangDonHang] PRIMARY KEY CLUSTERED 
(
	[TinhTrangDonHang_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (2, N'Đã xác nhận')
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (3, N'Đang vận chuyển')
INSERT [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id], [TinhTrangDonHang_name]) VALUES (4, N'Đã giao hàng')
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[ThanhToan_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[ThanhToan_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Size_id] [int] NOT NULL,
	[Size_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[Size_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (1, N'S')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (2, N'M')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (3, N'L')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (4, N'XL')
INSERT [dbo].[Size] ([Size_id], [Size_name]) VALUES (5, N'XL')
/****** Object:  Table [dbo].[SanPhamDetail]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamDetail](
	[SanPhamDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[S] [int] NULL,
	[M] [int] NULL,
	[L] [int] NULL,
	[XL] [int] NULL,
	[XXL] [int] NULL,
 CONSTRAINT [PK_SanPhamDetail] PRIMARY KEY CLUSTERED 
(
	[SanPhamDetail_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SanPhamDetail] ON
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (13, 10, 2, 3, 50, 30)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (14, 5, 2, 3, 2, 3)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (15, 4, 5, 6, 7, 8)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (16, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (17, 1, 0, 0, 50, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (18, 26, 51, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (20, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (21, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (22, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (23, 12, 10, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (24, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (25, 0, 0, 0, 0, 0)
INSERT [dbo].[SanPhamDetail] ([SanPhamDetail_id], [S], [M], [L], [XL], [XXL]) VALUES (26, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[SanPhamDetail] OFF
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPham_Id] [int] IDENTITY(1,1) NOT NULL,
	[SanPham_Name] [nvarchar](50) NULL,
	[SanPham_description] [nvarchar](max) NULL,
	[SanPham_Price] [int] NULL,
	[SanPham_priceSale] [int] NULL,
	[Sale_key] [bit] NULL,
	[Main_img] [nvarchar](max) NULL,
	[Img1] [nvarchar](max) NULL,
	[Img2] [nvarchar](max) NULL,
	[Img3] [nvarchar](max) NULL,
	[Img4] [nvarchar](max) NULL,
	[Type_SanPham_id] [int] NULL,
	[SanPhamDetail_id] [int] NULL,
	[SoLuong] [int] NULL,
	[StringPrice] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SanPham_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (20, N'Tee 2', N'Đây là tee 2', 500000, 0, 0, N'~/Content/Image_SanPham/balo.png', N'~/Content/Image_SanPham/balo.png', N'~/Content/Image_SanPham/balo.png', N'~/Content/Image_SanPham/balo.png', N'~/Content/Image_SanPham/balo.png', 2, 14, 0, N'500.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (22, N'Tiểu Cường', N'Đây là tiêu cường', 123000, 0, 0, N'~/Content/Image_SanPham/fake.png', N'~/Content/Image_SanPham/teeSpecial.png', N'~/Content/Image_SanPham/non.png', N'~/Content/Image_SanPham/teeSpecial.png', N'~/Content/Image_SanPham/teeSpecial.png', 3, 16, 0, N'123.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (23, N'Sticker Ghost', N'Đây là 1 con ma', 147000, 0, 0, N'~/Content/Image_SanPham/avt_ce0eace178864f2a86411a97d5542042_grande.jpg', N'~/Content/Image_SanPham/avt_ce0eace178864f2a86411a97d5542042_grande.jpg', N'~/Content/Image_SanPham/avt_ce0eace178864f2a86411a97d5542042_grande.jpg', N'~/Content/Image_SanPham/avt_ce0eace178864f2a86411a97d5542042_grande.jpg', N'~/Content/Image_SanPham/avt_ce0eace178864f2a86411a97d5542042_grande.jpg', 3, 17, 51, N'147.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (24, N'abc', N'xyz', 155000, 0, 0, N'~/Content/Image_SanPham/AnyConv.com__slideshow_1-removebg-preview.png', N'~/Content/Image_SanPham/AnyConv.com__slideshow_1-removebg-preview.png', N'~/Content/Image_SanPham/AnyConv.com__slideshow_1-removebg-preview.png', N'~/Content/Image_SanPham/AnyConv.com__slideshow_1-removebg-preview.png', N'~/Content/Image_SanPham/AnyConv.com__slideshow_1-removebg-preview.png', 3, 18, 77, N'155.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (30, N'test nữa nè', N'123123123', 210000, 0, 0, N'~/Content/Image_SanPham/1-1-ao-hoodie-loang-mau-removebg-preview.png', N'~/Content/Image_SanPham/1-1-ao-hoodie-loang-mau-removebg-preview.png', N'~/Content/Image_SanPham/1-1-ao-hoodie-loang-mau-removebg-preview.png', N'~/Content/Image_SanPham/1-1-ao-hoodie-loang-mau-removebg-preview.png', N'~/Content/Image_SanPham/1-1-ao-hoodie-loang-mau-removebg-preview.png', 3, 20, 0, N'210.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (31, N'Túi nimi bumbag', N'Vải Polyester cao cấp - chống thấm nước', 300000, 0, 0, N'~/Content/Image_SanPham/2.jpeg', N'~/Content/Image_SanPham/2.jpeg', N'~/Content/Image_SanPham/2.jpeg', N'~/Content/Image_SanPham/2.jpeg', N'~/Content/Image_SanPham/3.jpeg', 3, 21, 0, N'300.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (33, N'Đây là quần tâyy', N'123123', 100000, 0, 0, N'~/Content/Image_SanPham/', N'~/Content/Image_SanPham/', N'~/Content/Image_SanPham/', N'~/Content/Image_SanPham/', N'~/Content/Image_SanPham/', 1, 23, 22, N'100.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (34, N'test again nè', N'đây là mô tả nè', 100000, 0, 0, N'~/Content/Image_SanPham/pant.png', N'~/Content/Image_SanPham/pant.png', N'~/Content/Image_SanPham/pant.png', N'~/Content/Image_SanPham/pant.png', N'~/Content/Image_SanPham/pant.png', 1, 24, 0, N'100.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (35, N'Trần quốc đại', N'12312312
dad
dad
das', 100000, 0, 0, N'~/Content/Image_SanPham/11.png', N'~/Content/Image_SanPham/BanhBao.png', N'~/Content/Image_SanPham/BanhBao.png', N'~/Content/Image_SanPham/BanhBao.png', N'~/Content/Image_SanPham/BanhBao.png', 1, 25, 0, N'100.000đ')
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id], [SanPhamDetail_id], [SoLuong], [StringPrice]) VALUES (36, N'Tee22222', N'dasdasdasd', 100000, 0, 0, N'~/Content/Image_SanPham/1-1-ao-hoodie-loang-mau-removebg-preview.png', N'~/Content/Image_SanPham/2.jpeg', N'~/Content/Image_SanPham/2.jpeg', N'~/Content/Image_SanPham/2.jpeg', N'~/Content/Image_SanPham/2.jpeg', 3, 26, 0, N'100.000đ')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Account_user] [nchar](30) NULL,
	[Account_password] [nchar](30) NULL,
	[Account_role_id] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id]) VALUES (1, N'admin                         ', N'admin                         ', 1)
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id]) VALUES (2, N'user                          ', N'user                          ', 2)
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id]) VALUES (18, N'quocdai9.5.2000@gmail.com     ', N'01227973833                   ', 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
/****** Object:  Table [dbo].[Infor]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infor](
	[Infor_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TinhThanh] [nvarchar](50) NULL,
	[QuanHuyen] [nvarchar](50) NULL,
	[PhuongXa] [nvarchar](50) NULL,
	[BuyHistory] [nvarchar](50) NULL,
 CONSTRAINT [PK_Infor] PRIMARY KEY CLUSTERED 
(
	[Infor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Infor] ON
INSERT [dbo].[Infor] ([Infor_id], [Account_id], [Name], [Phone], [DiaChi], [TinhThanh], [QuanHuyen], [PhuongXa], [BuyHistory]) VALUES (15, 18, N'Trần Quốc Đại', N'0777973833', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Infor] OFF
/****** Object:  Table [dbo].[DonHang]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DonHang_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NULL,
	[NgayGio] [datetime] NULL,
	[TinhTrangDonHang_id] [int] NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
	[TinhTrangThanhToan] [nvarchar](50) NULL,
	[Total] [int] NULL,
	[DonHangInfor_id] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[DonHang_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON
INSERT [dbo].[DonHang] ([DonHang_id], [Account_ID], [NgayGio], [TinhTrangDonHang_id], [PhuongThucThanhToan], [TinhTrangThanhToan], [Total], [DonHangInfor_id]) VALUES (6, NULL, CAST(0x0000AE1B000993A2 AS DateTime), 1, N'COD', N'Chưa thanh toán', 494000, 6)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
/****** Object:  Table [dbo].[ProductListCheckout]    Script Date: 01/12/2022 01:57:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductListCheckout](
	[ProductListCheckout_id] [int] IDENTITY(1,1) NOT NULL,
	[DonHang_id] [int] NULL,
	[SanPham_id] [int] NULL,
	[SoLuong] [int] NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[StringPrice] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductListCheckout] PRIMARY KEY CLUSTERED 
(
	[ProductListCheckout_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductListCheckout] ON
INSERT [dbo].[ProductListCheckout] ([ProductListCheckout_id], [DonHang_id], [SanPham_id], [SoLuong], [Size], [Price], [StringPrice]) VALUES (2, 6, 33, 1, N'M', 100000, N'100.000')
INSERT [dbo].[ProductListCheckout] ([ProductListCheckout_id], [DonHang_id], [SanPham_id], [SoLuong], [Size], [Price], [StringPrice]) VALUES (3, 6, 33, 1, N'S', 100000, N'100.000')
INSERT [dbo].[ProductListCheckout] ([ProductListCheckout_id], [DonHang_id], [SanPham_id], [SoLuong], [Size], [Price], [StringPrice]) VALUES (4, 6, 23, 2, N'S', 294000, N'294.000')
SET IDENTITY_INSERT [dbo].[ProductListCheckout] OFF
/****** Object:  ForeignKey [FK_SanPham_SanPhamDetail]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_SanPhamDetail] FOREIGN KEY([SanPhamDetail_id])
REFERENCES [dbo].[SanPhamDetail] ([SanPhamDetail_id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_SanPhamDetail]
GO
/****** Object:  ForeignKey [FK_SanPham_Type_SanPham]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Type_SanPham] FOREIGN KEY([Type_SanPham_id])
REFERENCES [dbo].[Type_SanPham] ([Type_SanPham_id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Type_SanPham]
GO
/****** Object:  ForeignKey [FK_Account_Account_role]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_role] FOREIGN KEY([Account_role_id])
REFERENCES [dbo].[Account_role] ([Account_role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account_role]
GO
/****** Object:  ForeignKey [FK_Infor_Account]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[Infor]  WITH CHECK ADD  CONSTRAINT [FK_Infor_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Infor] CHECK CONSTRAINT [FK_Infor_Account]
GO
/****** Object:  ForeignKey [FK_DonHang_Account]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_Account]
GO
/****** Object:  ForeignKey [FK_DonHang_DonHangInfor1]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_DonHangInfor1] FOREIGN KEY([DonHangInfor_id])
REFERENCES [dbo].[DonHangInfor] ([DonHangInfor_id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_DonHangInfor1]
GO
/****** Object:  ForeignKey [FK_DonHang_TinhTrangDonHang]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TinhTrangDonHang] FOREIGN KEY([TinhTrangDonHang_id])
REFERENCES [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TinhTrangDonHang]
GO
/****** Object:  ForeignKey [FK_ProductListCheckout_DonHang]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[ProductListCheckout]  WITH CHECK ADD  CONSTRAINT [FK_ProductListCheckout_DonHang] FOREIGN KEY([DonHang_id])
REFERENCES [dbo].[DonHang] ([DonHang_id])
GO
ALTER TABLE [dbo].[ProductListCheckout] CHECK CONSTRAINT [FK_ProductListCheckout_DonHang]
GO
/****** Object:  ForeignKey [FK_ProductListCheckout_SanPham]    Script Date: 01/12/2022 01:57:14 ******/
ALTER TABLE [dbo].[ProductListCheckout]  WITH CHECK ADD  CONSTRAINT [FK_ProductListCheckout_SanPham] FOREIGN KEY([SanPham_id])
REFERENCES [dbo].[SanPham] ([SanPham_Id])
GO
ALTER TABLE [dbo].[ProductListCheckout] CHECK CONSTRAINT [FK_ProductListCheckout_SanPham]
GO
