USE [master]
GO
/****** Object:  Database [ThuongMaiDienTu]    Script Date: 01/12/2022 01:17:43 ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[DonHangInfor]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[Account_role]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[Type_SanPham]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[TinhTrangDonHang]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[SanPhamDetail]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[Infor]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  Table [dbo].[ProductListCheckout]    Script Date: 01/12/2022 01:17:44 ******/
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
/****** Object:  ForeignKey [FK_SanPham_SanPhamDetail]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_SanPhamDetail] FOREIGN KEY([SanPhamDetail_id])
REFERENCES [dbo].[SanPhamDetail] ([SanPhamDetail_id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_SanPhamDetail]
GO
/****** Object:  ForeignKey [FK_SanPham_Type_SanPham]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Type_SanPham] FOREIGN KEY([Type_SanPham_id])
REFERENCES [dbo].[Type_SanPham] ([Type_SanPham_id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Type_SanPham]
GO
/****** Object:  ForeignKey [FK_Account_Account_role]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_role] FOREIGN KEY([Account_role_id])
REFERENCES [dbo].[Account_role] ([Account_role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account_role]
GO
/****** Object:  ForeignKey [FK_Infor_Account]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[Infor]  WITH CHECK ADD  CONSTRAINT [FK_Infor_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Infor] CHECK CONSTRAINT [FK_Infor_Account]
GO
/****** Object:  ForeignKey [FK_DonHang_Account]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_Account]
GO
/****** Object:  ForeignKey [FK_DonHang_DonHangInfor1]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_DonHangInfor1] FOREIGN KEY([DonHangInfor_id])
REFERENCES [dbo].[DonHangInfor] ([DonHangInfor_id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_DonHangInfor1]
GO
/****** Object:  ForeignKey [FK_DonHang_TinhTrangDonHang]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TinhTrangDonHang] FOREIGN KEY([TinhTrangDonHang_id])
REFERENCES [dbo].[TinhTrangDonHang] ([TinhTrangDonHang_id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TinhTrangDonHang]
GO
/****** Object:  ForeignKey [FK_ProductListCheckout_DonHang]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[ProductListCheckout]  WITH CHECK ADD  CONSTRAINT [FK_ProductListCheckout_DonHang] FOREIGN KEY([DonHang_id])
REFERENCES [dbo].[DonHang] ([DonHang_id])
GO
ALTER TABLE [dbo].[ProductListCheckout] CHECK CONSTRAINT [FK_ProductListCheckout_DonHang]
GO
/****** Object:  ForeignKey [FK_ProductListCheckout_SanPham]    Script Date: 01/12/2022 01:17:44 ******/
ALTER TABLE [dbo].[ProductListCheckout]  WITH CHECK ADD  CONSTRAINT [FK_ProductListCheckout_SanPham] FOREIGN KEY([SanPham_id])
REFERENCES [dbo].[SanPham] ([SanPham_Id])
GO
ALTER TABLE [dbo].[ProductListCheckout] CHECK CONSTRAINT [FK_ProductListCheckout_SanPham]
GO
