USE [master]
GO
/****** Object:  Database [ThuongMaiDienTu]    Script Date: 12/25/2021 10:18:54 ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/25/2021 10:18:55 ******/
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
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SanPham_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id]) VALUES (1, N'abc', N'ds', 123, 0, 0, N'asd', N'asd', N'asda', N'asd', N'asd', 1)
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id]) VALUES (2, N'deb', N'ds', 123, 0, 0, N'das', N'sda', N'asd', N'asd', N'asd', 2)
INSERT [dbo].[SanPham] ([SanPham_Id], [SanPham_Name], [SanPham_description], [SanPham_Price], [SanPham_priceSale], [Sale_key], [Main_img], [Img1], [Img2], [Img3], [Img4], [Type_SanPham_id]) VALUES (3, N'123', N'eqw', 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
/****** Object:  Table [dbo].[List_SanPham]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_SanPham](
	[List_SanPham_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_List_SanPham] PRIMARY KEY CLUSTERED 
(
	[List_SanPham_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infor]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infor](
	[Infor_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Infor] PRIMARY KEY CLUSTERED 
(
	[Infor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Image_id] [int] IDENTITY(1,1) NOT NULL,
	[SanPham_id] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[key] [bit] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Image_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Image] ON
INSERT [dbo].[Image] ([Image_id], [SanPham_id], [Image], [key]) VALUES (1, 1, N'~/Content/imgItem/2.jpg', NULL)
INSERT [dbo].[Image] ([Image_id], [SanPham_id], [Image], [key]) VALUES (2, 2, N'~/Content/imgItem/1.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Image] OFF
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/25/2021 10:18:55 ******/
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
/****** Object:  Table [dbo].[DonHangGuest]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangGuest](
	[DonHangGuest_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DonHangGuest] PRIMARY KEY CLUSTERED 
(
	[DonHangGuest_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DonHang_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[DonHang_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaoCaoGuest]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCaoGuest](
	[BaoCaoGuest_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BaoCaoGuest] PRIMARY KEY CLUSTERED 
(
	[BaoCaoGuest_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaoCao]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCao](
	[BaoCao_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BaoCao] PRIMARY KEY CLUSTERED 
(
	[BaoCao_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_role]    Script Date: 12/25/2021 10:18:55 ******/
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
/****** Object:  Table [dbo].[Type_SanPham]    Script Date: 12/25/2021 10:18:55 ******/
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
/****** Object:  Table [dbo].[TinhTrangDonHang]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangDonHang](
	[TinhTrangDonHang_id] [int] NOT NULL,
 CONSTRAINT [PK_TinhTrangDonHang] PRIMARY KEY CLUSTERED 
(
	[TinhTrangDonHang_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 12/25/2021 10:18:55 ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 12/25/2021 10:18:55 ******/
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
/****** Object:  Table [dbo].[SanPhamDetail]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamDetail](
	[SanPhamDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[SanPham_id] [int] NULL,
	[Size_id] [int] NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [PK_SanPhamDetail] PRIMARY KEY CLUSTERED 
(
	[SanPhamDetail_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/25/2021 10:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Account_user] [nchar](30) NULL,
	[Account_password] [nchar](30) NULL,
	[Account_role_id] [int] NULL,
	[Infor_id] [int] NULL,
	[LichSuMuaHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id], [Infor_id], [LichSuMuaHang]) VALUES (1, N'admin                         ', N'admin                         ', 1, NULL, NULL)
INSERT [dbo].[Account] ([id], [Account_user], [Account_password], [Account_role_id], [Infor_id], [LichSuMuaHang]) VALUES (2, N'user                          ', N'user                          ', 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
/****** Object:  ForeignKey [FK_SanPhamDetail_Size]    Script Date: 12/25/2021 10:18:55 ******/
ALTER TABLE [dbo].[SanPhamDetail]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamDetail_Size] FOREIGN KEY([SanPhamDetail_id])
REFERENCES [dbo].[Size] ([Size_id])
GO
ALTER TABLE [dbo].[SanPhamDetail] CHECK CONSTRAINT [FK_SanPhamDetail_Size]
GO
/****** Object:  ForeignKey [FK_Account_Account_role]    Script Date: 12/25/2021 10:18:55 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_role] FOREIGN KEY([Account_role_id])
REFERENCES [dbo].[Account_role] ([Account_role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account_role]
GO
