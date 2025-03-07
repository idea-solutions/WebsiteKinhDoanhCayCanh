USE [master]
GO
/****** Object:  Database [QuanLyCayCanh]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE DATABASE [QuanLyCayCanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCayCanh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyCayCanh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyCayCanh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyCayCanh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyCayCanh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyCayCanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyCayCanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyCayCanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCayCanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyCayCanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyCayCanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyCayCanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyCayCanh] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyCayCanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyCayCanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyCayCanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyCayCanh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyCayCanh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyCayCanh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyCayCanh] SET QUERY_STORE = OFF
GO
USE [QuanLyCayCanh]
GO
/****** Object:  User [CrisDame]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE USER [CrisDame] FOR LOGIN [CrisDame] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CrisDame]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[id_BinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[ngayDangBinhLuan] [datetime] NULL,
	[noiDung] [nvarchar](250) NULL,
	[trangThai] [char](10) NULL,
	[id_User] [nvarchar](128) NULL,
	[id_SP] [varchar](10) NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[id_BinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CachChamSoc]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CachChamSoc](
	[id_CCS] [varchar](10) NOT NULL,
	[tuoiNuoc] [ntext] NULL,
	[dat] [ntext] NULL,
	[anhSang] [ntext] NULL,
	[viTriDatCay] [ntext] NULL,
	[duongChat] [ntext] NULL,
	[tenCCS] [nvarchar](50) NULL,
 CONSTRAINT [PK_CachChamSoc] PRIMARY KEY CLUSTERED 
(
	[id_CCS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTCapNhat]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTCapNhat](
	[id_CTCN] [bigint] IDENTITY(1,1) NOT NULL,
	[id_User] [nvarchar](128) NOT NULL,
	[id_SP] [varchar](10) NOT NULL,
	[ngayCapNhat] [datetime] NULL,
	[thaoTac] [nvarchar](50) NULL,
 CONSTRAINT [PK_CTCapNhat_1] PRIMARY KEY CLUSTERED 
(
	[id_CTCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDH](
	[id_DH] [int] NOT NULL,
	[id_SP] [varchar](10) NOT NULL,
	[soLuong] [int] NULL,
	[thanhTien] [bigint] NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[id_DH] ASC,
	[id_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[id_DanhGia] [int] IDENTITY(1,1) NOT NULL,
	[soSao] [int] NULL,
	[ngayDG] [datetime] NULL,
	[trangThai] [char](1) NULL,
	[id_User] [nvarchar](128) NULL,
	[id_SP] [varchar](10) NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[id_DanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[id_DH] [int] IDENTITY(1,1) NOT NULL,
	[ngayDat] [datetime] NULL,
	[ngayGiao] [datetime] NULL,
	[trangThaiThanhToan] [char](1) NULL,
	[trangThaiGiaoHang] [char](1) NULL,
	[phuongThucThanhToan] [char](1) NULL,
	[tongTien] [bigint] NULL,
	[diaChiGiao] [nvarchar](250) NULL,
	[id_User] [nvarchar](128) NULL,
	[id_Voucher] [varchar](10) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[id_DH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhAnhSP]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnhSP](
	[id_Hinh] [int] IDENTITY(1,1) NOT NULL,
	[duongDan] [varchar](250) NULL,
	[id_SP] [varchar](10) NULL,
 CONSTRAINT [PK_HinhAnhSP] PRIMARY KEY CLUSTERED 
(
	[id_Hinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomSP]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSP](
	[id_Nhom] [varchar](10) NOT NULL,
	[tenNhom] [nvarchar](50) NULL,
	[id_CCS] [varchar](10) NULL,
 CONSTRAINT [PK_NhomSP] PRIMARY KEY CLUSTERED 
(
	[id_Nhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[id_SP] [varchar](10) NOT NULL,
	[tenSP] [nvarchar](50) NULL,
	[mota] [nvarchar](250) NULL,
	[gia] [bigint] NULL,
	[soLuong] [int] NULL,
	[DVT] [nvarchar](10) NULL,
	[phanTramGiamGia] [int] NULL,
	[id_Nhom] [varchar](10) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[id_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinThemVeSP]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinThemVeSP](
	[id_SP] [varchar](10) NOT NULL,
	[congDung] [nvarchar](255) NULL,
	[cachTrong] [nvarchar](255) NULL,
 CONSTRAINT [PK_ThongTinThemVeSP] PRIMARY KEY CLUSTERED 
(
	[id_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVoucher]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVoucher](
	[id_voucher] [varchar](10) NOT NULL,
	[id_User] [nvarchar](128) NOT NULL,
	[soLuotConLai] [int] NULL,
 CONSTRAINT [PK_UserVoucher] PRIMARY KEY CLUSTERED 
(
	[id_voucher] ASC,
	[id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 04/11/2022 11:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[id_voucher] [varchar](10) NOT NULL,
	[tenVoucher] [nvarchar](50) NULL,
	[noiDung] [nvarchar](250) NULL,
	[phanTramGiamGia] [int] NULL,
	[thoiGianBatDau] [smalldatetime] NULL,
	[thoiGianKetThuc] [smalldatetime] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[id_voucher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CachChamSoc] ([id_CCS], [tuoiNuoc], [dat], [anhSang], [viTriDatCay], [duongChat], [tenCCS]) VALUES (N'CaySenDa', N'An d?p', N'Lo?i d?t tr?ng s?n ? cây thu?ng dã là lo?i d?t t?t có nhi?u mùn d?m b?o cho cây phát tri?n t?t trong vòng 3 d?n 6 tháng. N?u tr?ng lâu th?y hi?n tu?ng vàng lá do thi?u ch?t b?n có th? b? sung d?t, mùn, thay d?t cho cây ho?c các don gi?n là mua d?m, phân bón tan ch?m r?c nên g?c cây là du?c.', N'S?ng du?c trong môi tru?ng thi?u sáng nhung màu s?c c?a lá s? b?t d?m và xanh tuoi, vì th? cu?i tu?n b?n nên d? cây ra ngoài hiên d? cây có th? ti?p xúc tr?c ti?p v?i n?ng gió ngoài tr?i, còn không t?t nh?t hay d? cây g?n c?a s? noi có ánh sáng chi?u qua.', N'V? trí d?t cây là r?t quan tr?ng ?nh hu?ng l?n d?n s? phát tri?n và s?ng c?a cây van phòng, cây trong nhà. V? trí d?t cây t?t nh?t là noi thoáng mát có ánh n?ng nh?. N?u b?n th?y cây ph?i bu?c d?t noi khu?t, t?i tam, ít thoáng thì b?n nên d? cây ? noi thoáng có ánh n?ng nh? ho?c du?i ánh di?n.', N'an d?p trai quá', NULL)
INSERT [dbo].[CachChamSoc] ([id_CCS], [tuoiNuoc], [dat], [anhSang], [viTriDatCay], [duongChat], [tenCCS]) VALUES (N'CCS01CTN', N'Thu?ng n?u d? cây ? ngoài tr?i có n?ng và gió thì ngày nào b?n tu?i nu?c cung du?c, m?i ngày tu?i qua cho cây d? th? nh?t là r?a s?ch b?i trên lá giúp cây d? quang h?p hon, thông thoáng hon, và thu?ng tu?i và bu?i sáng s?m ho?c chi?u t?i, tránh tu?i bu?i trua n?ng nóng d? làm cây s?c nhi?t mà ch?t. Nhung thu?ng cây du?c d? ? môi tru?ng van phòng, có máy l?nh, ho?c trong nhà ít n?ng, thi?u gió nên nu?c có t?c d? bay hoi th?p, d?t gi? ?m lâu. Vì v?y b?n ch? nên tu?i nu?c 1 tu?n/ 2 l?n m?i l?n d? ?m 1/2 d?t là du?c. Ch? nên tu?i ? g?c còn lá n?u b?n thì nên dùng khan u?t lau.', N'Lo?i d?t tr?ng s?n ? cây thu?ng dã là lo?i d?t t?t có nhi?u mùn d?m b?o cho cây phát tri?n t?t trong vòng 3 d?n 6 tháng. N?u tr?ng lâu th?y hi?n tu?ng vàng lá do thi?u ch?t b?n có th? b? sung d?t, mùn, thay d?t cho cây ho?c các don gi?n là mua d?m, phân bón tan ch?m r?c nên g?c cây là du?c.', N'S?ng du?c trong môi tru?ng thi?u sáng nhung màu s?c c?a lá s? b?t d?m và xanh tuoi, vì th? cu?i tu?n b?n nên d? cây ra ngoài hiên d? cây có th? ti?p xúc tr?c ti?p v?i n?ng gió ngoài tr?i, còn không t?t nh?t hay d? cây g?n c?a s? noi có ánh sáng chi?u qua.', N'V? trí d?t cây là r?t quan tr?ng ?nh hu?ng l?n d?n s? phát tri?n và s?ng c?a cây van phòng, cây trong nhà. V? trí d?t cây t?t nh?t là noi thoáng mát có ánh n?ng nh?. N?u b?n th?y cây ph?i bu?c d?t noi khu?t, t?i tam, ít thoáng thì b?n nên d? cây ? noi thoáng có ánh n?ng nh? ho?c du?i ánh di?n.', N'Bón phân v?a d? cho cây phát tri?n', NULL)
INSERT [dbo].[CachChamSoc] ([id_CCS], [tuoiNuoc], [dat], [anhSang], [viTriDatCay], [duongChat], [tenCCS]) VALUES (N'CCS02CTS', N'B?n c?n d? ý nu?c c?a cây th?y sinh, nh?t là th?i gian ban d?u n?u nu?c có mùi thì b?n c?n thay nu?c luôn và lo?i b? r? th?i. N?u b?n không có th?i gian d? ý thì th?i di?m ban d?u c? 1 tu?n b?n thay nu?c m?t l?n.  Khi thay nu?c nên d? nu?c di, d? nu?c l?i nhi?u l?n d? t?o không khí trong nu?c, cây s? phát tri?n r? t?t hon.', N'V?a d?', N'V?a d?', N'Nên d?t cây ? noi thoáng gió, du?i ánh di?n ho?c có ánh n?ng nh? bu?i sáng s?m và chi?u mu?n. Tránh d? cây du?i n?ng g?t, noi có hoi nóng t?a ra nhu ? c?c nóng di?u hòa, sau cpu máy tính', N'B?n c?n thêm dung d?ch th?y canh vào hàng tu?n d? giúp cây có d? ch?t dinh du?ng, sao cho PPM( n?ng d? dung d?ch dinh du?ng ) trong nu?c trong kho?ng t? 600 -1000 ppm là du?c. PH dao d?ng t? 5,5 d?n 6,5.', NULL)
GO
SET IDENTITY_INSERT [dbo].[HinhAnhSP] ON 

INSERT [dbo].[HinhAnhSP] ([id_Hinh], [duongDan], [id_SP]) VALUES (1, N'/Template/img/cayluoiho.jpg', N'CTN01')
INSERT [dbo].[HinhAnhSP] ([id_Hinh], [duongDan], [id_SP]) VALUES (2, N'/Template/img/caycauvang.jpg', N'CTN02')
INSERT [dbo].[HinhAnhSP] ([id_Hinh], [duongDan], [id_SP]) VALUES (3, N'/Template/img/cayngocngan.jpg', N'CTN03')
INSERT [dbo].[HinhAnhSP] ([id_Hinh], [duongDan], [id_SP]) VALUES (4, N'/Template/img/caytieutram.jpg', N'CTN04')
INSERT [dbo].[HinhAnhSP] ([id_Hinh], [duongDan], [id_SP]) VALUES (7, N'/Template/img/cayhongmon.jpg', N'CTS01')
SET IDENTITY_INSERT [dbo].[HinhAnhSP] OFF
GO
INSERT [dbo].[NhomSP] ([id_Nhom], [tenNhom], [id_CCS]) VALUES (N'', NULL, NULL)
INSERT [dbo].[NhomSP] ([id_Nhom], [tenNhom], [id_CCS]) VALUES (N'CTN', N'Cây trong nhà', N'CCS01CTN')
INSERT [dbo].[NhomSP] ([id_Nhom], [tenNhom], [id_CCS]) VALUES (N'CTS', N'Cây thủy sinh', N'CCS02CTS')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'1', N'admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'2', N'user ')
GO
INSERT [dbo].[SanPham] ([id_SP], [tenSP], [mota], [gia], [soLuong], [DVT], [phanTramGiamGia], [id_Nhom]) VALUES (N'CTN01', N'Cây lưỡi hổ vàng', N'Cây trong nhà, văn phòng', 150000, 11, N'chậu', 10, N'CTN')
INSERT [dbo].[SanPham] ([id_SP], [tenSP], [mota], [gia], [soLuong], [DVT], [phanTramGiamGia], [id_Nhom]) VALUES (N'CTN02', N'Cây cau vàng', N'Cây trong nhà, van phòng', 150000, 10, N'chậu', 10, N'CTN')
INSERT [dbo].[SanPham] ([id_SP], [tenSP], [mota], [gia], [soLuong], [DVT], [phanTramGiamGia], [id_Nhom]) VALUES (N'CTN03', N'Cây ngọc ngân', N'Cây trong nhà, van phòng', 100000, 10, N'chậu', 0, N'CTN')
INSERT [dbo].[SanPham] ([id_SP], [tenSP], [mota], [gia], [soLuong], [DVT], [phanTramGiamGia], [id_Nhom]) VALUES (N'CTN04', N'Cây tiểu trâm', N'Cây trong nhà, van phòng', 250000, 10, N'chậu', 20, N'CTN')
INSERT [dbo].[SanPham] ([id_SP], [tenSP], [mota], [gia], [soLuong], [DVT], [phanTramGiamGia], [id_Nhom]) VALUES (N'CTS01', N'Cây hồng môn', N'Cây trong nhà, van phòng, cây th?y sinh', 110000, 10, N'chậu', 10, N'CTS')
GO
INSERT [dbo].[ThongTinThemVeSP] ([id_SP], [congDung], [cachTrong]) VALUES (N'CTN01', N'Giup thanh l?c không khí, t?o s?c xanh cho ngôi nhà c?a b?n', N'Tr?ng trong ch?u d? trong nhà ho?c van phòng')
INSERT [dbo].[ThongTinThemVeSP] ([id_SP], [congDung], [cachTrong]) VALUES (N'CTS01', N'Giup thanh l?c không khí, t?o s?c xanh cho ngôi nhà c?a b?n', N'Tr?ng trong ch?u nu?c d? trong nhà ho?c van phòng')
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'1477661d-6621-4a5a-90fa-fb4313b37ab5', N'1')
GO
INSERT [dbo].[Users] ([Id], [FullName], [Address], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1477661d-6621-4a5a-90fa-fb4313b37ab5', N'NGUYEN TRONG TUAN', N'19/25 Đường 102 TP HCM', N'tuan123@gmail.com', 0, N'ALE8jww8lG8EZTwbueXy4sSnME0dRn2yIn6kWTEu7qa84Idr+q59pKZwHtUMPwjmxw==', N'c9253df5-4031-422d-97c7-ba8429b8b3f7', N'0789654123', 0, 0, NULL, 1, 0, N'tuan123@gmail.com')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 04/11/2022 11:08:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([id_SP])
REFERENCES [dbo].[SanPham] ([id_SP])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_Users] FOREIGN KEY([id_User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_Users]
GO
ALTER TABLE [dbo].[CTCapNhat]  WITH CHECK ADD  CONSTRAINT [FK_CTCapNhat_SanPham] FOREIGN KEY([id_SP])
REFERENCES [dbo].[SanPham] ([id_SP])
GO
ALTER TABLE [dbo].[CTCapNhat] CHECK CONSTRAINT [FK_CTCapNhat_SanPham]
GO
ALTER TABLE [dbo].[CTCapNhat]  WITH CHECK ADD  CONSTRAINT [FK_CTCapNhat_Users] FOREIGN KEY([id_User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CTCapNhat] CHECK CONSTRAINT [FK_CTCapNhat_Users]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DonHang] FOREIGN KEY([id_DH])
REFERENCES [dbo].[DonHang] ([id_DH])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_DonHang]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_SanPham] FOREIGN KEY([id_SP])
REFERENCES [dbo].[SanPham] ([id_SP])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_SanPham] FOREIGN KEY([id_SP])
REFERENCES [dbo].[SanPham] ([id_SP])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_Users] FOREIGN KEY([id_User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_Users]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_Users] FOREIGN KEY([id_User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_Users]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_Voucher] FOREIGN KEY([id_Voucher])
REFERENCES [dbo].[Voucher] ([id_voucher])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_Voucher]
GO
ALTER TABLE [dbo].[HinhAnhSP]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnhSP_SanPham] FOREIGN KEY([id_SP])
REFERENCES [dbo].[SanPham] ([id_SP])
GO
ALTER TABLE [dbo].[HinhAnhSP] CHECK CONSTRAINT [FK_HinhAnhSP_SanPham]
GO
ALTER TABLE [dbo].[NhomSP]  WITH CHECK ADD  CONSTRAINT [FK_NhomSP_CachChamSoc] FOREIGN KEY([id_CCS])
REFERENCES [dbo].[CachChamSoc] ([id_CCS])
GO
ALTER TABLE [dbo].[NhomSP] CHECK CONSTRAINT [FK_NhomSP_CachChamSoc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhomSP] FOREIGN KEY([id_Nhom])
REFERENCES [dbo].[NhomSP] ([id_Nhom])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhomSP]
GO
ALTER TABLE [dbo].[ThongTinThemVeSP]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinThemVeSP_SanPham] FOREIGN KEY([id_SP])
REFERENCES [dbo].[SanPham] ([id_SP])
GO
ALTER TABLE [dbo].[ThongTinThemVeSP] CHECK CONSTRAINT [FK_ThongTinThemVeSP_SanPham]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaims_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo.UserClaims_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogins_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_dbo.UserLogins_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserVoucher]  WITH CHECK ADD  CONSTRAINT [FK_UserVoucher_Users] FOREIGN KEY([id_User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserVoucher] CHECK CONSTRAINT [FK_UserVoucher_Users]
GO
ALTER TABLE [dbo].[UserVoucher]  WITH CHECK ADD  CONSTRAINT [FK_UserVoucher_Voucher] FOREIGN KEY([id_voucher])
REFERENCES [dbo].[Voucher] ([id_voucher])
GO
ALTER TABLE [dbo].[UserVoucher] CHECK CONSTRAINT [FK_UserVoucher_Voucher]
GO
USE [master]
GO
ALTER DATABASE [QuanLyCayCanh] SET  READ_WRITE 
GO
