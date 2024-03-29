USE [master]
GO
/****** Object:  Database [Accommodation service]    Script Date: 7/16/2023 12:19:59 PM ******/
CREATE DATABASE [Accommodation service]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Accommodation service', FILENAME = N'E:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Accommodation service.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Accommodation service_log', FILENAME = N'E:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Accommodation service_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Accommodation service] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Accommodation service].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Accommodation service] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Accommodation service] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Accommodation service] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Accommodation service] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Accommodation service] SET ARITHABORT OFF 
GO
ALTER DATABASE [Accommodation service] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Accommodation service] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Accommodation service] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Accommodation service] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Accommodation service] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Accommodation service] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Accommodation service] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Accommodation service] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Accommodation service] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Accommodation service] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Accommodation service] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Accommodation service] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Accommodation service] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Accommodation service] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Accommodation service] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Accommodation service] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Accommodation service] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Accommodation service] SET RECOVERY FULL 
GO
ALTER DATABASE [Accommodation service] SET  MULTI_USER 
GO
ALTER DATABASE [Accommodation service] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Accommodation service] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Accommodation service] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Accommodation service] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Accommodation service] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Accommodation service] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Accommodation service', N'ON'
GO
ALTER DATABASE [Accommodation service] SET QUERY_STORE = OFF
GO
USE [Accommodation service]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[acctype] [bit] NOT NULL,
	[datesign] [nvarchar](255) NULL,
	[otpcode] [varchar](6) NULL,
	[usid] [int] NULL,
	[pcid] [int] NULL,
	[accstatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[accid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alert]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert](
	[alertid] [int] IDENTITY(1,1) NOT NULL,
	[imagecheck] [nvarchar](max) NULL,
	[textarea] [nvarchar](max) NULL,
	[dateup] [nvarchar](50) NULL,
	[pmoney] [int] NULL,
	[staid] [int] NULL,
	[idsend] [int] NULL,
	[roommid] [int] NULL,
	[idget] [int] NULL,
	[seen] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[alertid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Astatus]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Astatus](
	[staid] [int] IDENTITY(1,1) NOT NULL,
	[typename] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[staid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[datebill] [nvarchar](50) NULL,
	[bdescription] [nvarchar](max) NULL,
	[price] [int] NULL,
	[datedue] [nvarchar](50) NULL,
	[roommid] [int] NULL,
	[accid] [int] NULL,
	[condition] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cateid] [int] IDENTITY(1,1) NOT NULL,
	[catenme] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InforUser]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InforUser](
	[usid] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[uaddress] [nvarchar](255) NULL,
	[phonenumber] [nvarchar](30) NULL,
	[birthday] [varchar](4) NULL,
	[avatar] [nvarchar](max) NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[usid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motel]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motel](
	[mid] [int] IDENTITY(1,1) NOT NULL,
	[mname] [nvarchar](max) NULL,
	[motelimg] [nvarchar](max) NULL,
	[mdescription] [nvarchar](max) NULL,
	[maddress] [nvarchar](255) NULL,
	[dateupload] [nvarchar](50) NULL,
	[coordinates] [nvarchar](max) NULL,
	[accid] [int] NULL,
	[condition] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paycard]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paycard](
	[pcid] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](max) NULL,
	[numcard] [nvarchar](50) NULL,
	[cmoney] [int] NULL,
	[releasedate] [nvarchar](50) NULL,
	[pincode] [nvarchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[pcid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[rvid] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](max) NULL,
	[dateup] [nvarchar](50) NULL,
	[rscore] [float] NULL,
	[comment] [nvarchar](255) NULL,
	[accid] [int] NULL,
	[mid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[rvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/16/2023 12:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roommid] [int] IDENTITY(1,1) NOT NULL,
	[mimage1] [nvarchar](max) NULL,
	[mimage2] [nvarchar](max) NULL,
	[mimage3] [nvarchar](max) NULL,
	[price] [int] NULL,
	[quantity] [int] NOT NULL,
	[mid] [int] NULL,
	[cateid] [int] NULL,
	[codition] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roommid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accid], [username], [password], [acctype], [datesign], [otpcode], [usid], [pcid], [accstatus]) VALUES (1, N'admin', N'12345678', 0, N'20/5/2023', N'´´*', 1, NULL, 1)
INSERT [dbo].[Account] ([accid], [username], [password], [acctype], [datesign], [otpcode], [usid], [pcid], [accstatus]) VALUES (2, N'hdhien12', N'12345678', 1, N'20/5/2023', N'´´*', 2, NULL, 1)
INSERT [dbo].[Account] ([accid], [username], [password], [acctype], [datesign], [otpcode], [usid], [pcid], [accstatus]) VALUES (3, N'htphuc202', N'12345678', 0, N'20/5/2023', N'´´*', 3, NULL, 1)
INSERT [dbo].[Account] ([accid], [username], [password], [acctype], [datesign], [otpcode], [usid], [pcid], [accstatus]) VALUES (4, N'htdat12', N'12345678', 0, N'20/5/2023', N'´´*', 4, 2, 1)
INSERT [dbo].[Account] ([accid], [username], [password], [acctype], [datesign], [otpcode], [usid], [pcid], [accstatus]) VALUES (5, N'hchding123', N'12345678', 1, N'20/5/2023', N'´´*', 5, NULL, 1)
INSERT [dbo].[Account] ([accid], [username], [password], [acctype], [datesign], [otpcode], [usid], [pcid], [accstatus]) VALUES (6, N'kvqdat12', N'12345678', 1, N'20/5/2023', N'´´*', 6, NULL, 1)
INSERT [dbo].[Account] ([accid], [username], [password], [acctype], [datesign], [otpcode], [usid], [pcid], [accstatus]) VALUES (7, N'htp2k2', N'12345678', 0, N'13/07/2023', N'*', 7, 3, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Alert] ON 

INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (1, NULL, N'want to book room%2', N'2023-07-13T15:35:11.877', 5250000, 2, 7, 4, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (2, NULL, N'has Accepted your oder', N'2023-07-13T15:35:11.937', 5250000, 4, 2, 4, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (3, NULL, N'Extended booking room with id:4', N'2023-07-13T15:38:19.805', 2625000, 4, 7, 4, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (4, NULL, N'Want to become Owner Motel', N'2023-07-13T15:42:41.653', NULL, 8, 7, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (5, NULL, N'has accepted your request to become an Owner Motel', N'2023-07-13T15:42:41.942', NULL, 4, 1, NULL, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (6, NULL, N'Has Create Motel:15', N'2023-07-13T15:48:37.417', NULL, 8, 7, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (7, NULL, N'Has Create Room have roomid is:28: in motel:15', N'2023-07-13T15:48:36.288', NULL, 8, 7, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (8, NULL, N'Has Create Room have roomid is:29: in motel:15', N'2023-07-13T15:48:34.879', NULL, 8, 7, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (9, NULL, N'has Lock your roomid :29 :in motelid :15', N'2023-07-13T15:48:34.855', NULL, 4, 1, NULL, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (10, NULL, N'has Lock your roomid :28 :in motelid :15', N'2023-07-13T15:48:36.256', NULL, 4, 1, NULL, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (11, NULL, N'has lock your motel have id :15', N'2023-07-13T15:48:37.393', NULL, 4, 1, NULL, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (12, NULL, N'Want to unlock Room have id:29: in Motel:15', N'2023-07-13T15:49:49.224', NULL, 7, 7, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (13, NULL, N'Has Updated Motel have mid is:2', N'2023-07-14T15:25:16.473', NULL, 8, 2, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (14, NULL, N'want to book room%1', N'2023-07-13T21:06:22.275', 2625000, 2, 7, 4, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (15, NULL, N'want to book room%1', N'2023-07-13T21:06:23.772', 2625000, 3, 7, 4, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (16, NULL, N'want to book room%2', N'2023-07-13T21:06:25.732', 5250000, 3, 7, 4, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (17, NULL, N'Has Create Motel:16', N'2023-07-13T16:29:40.035', NULL, 7, 7, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (18, NULL, N'Want to become Owner Motel', N'2023-07-13T16:47:55.052', NULL, 7, 4, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (19, NULL, N'has Accepted your oder', N'2023-07-13T21:06:22.318', 2625000, 4, 2, 4, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (20, NULL, N'has Deny your oder', N'2023-07-13T21:06:23.798', 2625000, 4, 2, 4, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (21, NULL, N'has Deny your oder', N'2023-07-13T21:06:25.762', 5250000, 4, 2, 4, 7, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (22, NULL, N'has lock your motel have id :3', N'2023-07-14T08:46:07.541', NULL, 4, 1, NULL, 6, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (23, NULL, N'has lock your motel have id :6', N'2023-07-14T08:46:08.807', NULL, 4, 1, NULL, 6, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (25, NULL, N'has Lock your roomid :2 :in motelid :1', N'2023-07-14T08:48:57.149', NULL, 4, 1, NULL, 6, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (26, NULL, N'want to book room%2', N'2023-07-14T09:22:44.270', 6090000, 2, 7, 16, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (27, NULL, N'want to book room%1', N'2023-07-14T09:22:41.686', 1995000, 2, 7, 18, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (28, NULL, N'want to book room%1', N'2023-07-14T09:22:42.876', 2730000, 3, 7, 17, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (29, NULL, N'has Accepted your oder', N'2023-07-14T09:22:41.703', 1995000, 4, 2, 18, 7, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (30, NULL, N'has Deny your oder', N'2023-07-14T09:22:42.891', 2730000, 4, 2, 17, 7, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (31, NULL, N'has Accepted your oder', N'2023-07-14T09:22:44.283', 6090000, 4, 2, 16, 7, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (32, NULL, N'Want to unlock Motel have id:5', N'2023-07-14T15:24:46.037', NULL, 8, 2, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (33, NULL, N'has unlock your motel have id :5', N'2023-07-14T15:24:45.998', NULL, 4, 1, NULL, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (34, NULL, N'has lock your motel have id :2', N'2023-07-14T15:25:16.432', NULL, 4, 1, NULL, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (35, NULL, N'Want to unlock Motel have id:2', N'2023-07-14T15:25:41.739', NULL, 8, 2, NULL, 1, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (36, NULL, N'has deny your request to unlock motelid:2', N'2023-07-14T15:25:41.779', NULL, 4, 1, NULL, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (37, NULL, N'want to book room%1', N'2023-07-14T16:33:59.978', 3045000, 2, 7, 16, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (38, NULL, N'want to book room%1', N'2023-07-14T16:34:01.396', 2730000, 2, 7, 17, 2, 1)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (39, NULL, N'has Accepted your oder', N'2023-07-14T16:34:00.044', 3045000, 4, 2, 16, 7, 0)
INSERT [dbo].[Alert] ([alertid], [imagecheck], [textarea], [dateup], [pmoney], [staid], [idsend], [roommid], [idget], [seen]) VALUES (40, NULL, N'has Accepted your oder', N'2023-07-14T16:34:01.476', 2730000, 4, 2, 17, 7, 0)
SET IDENTITY_INSERT [dbo].[Alert] OFF
GO
SET IDENTITY_INSERT [dbo].[Astatus] ON 

INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (1, N'pending')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (2, N'Approve')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (3, N'NotApprove')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (4, N'complete')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (5, N'Locked')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (6, N'Out of Date')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (7, N'ad-pending')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (8, N'ad-complete')
INSERT [dbo].[Astatus] ([staid], [typename]) VALUES (9, N'contact')
SET IDENTITY_INSERT [dbo].[Astatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([bid], [datebill], [bdescription], [price], [datedue], [roommid], [accid], [condition]) VALUES (1, N'2023-07-13T15:35:12.001', N'Successful booking Room with ID is 4', 2500000, N'2023-10-13T15:35:12.001', 4, 7, 1)
INSERT [dbo].[Bill] ([bid], [datebill], [bdescription], [price], [datedue], [roommid], [accid], [condition]) VALUES (2, N'2023-07-13T21:06:22.373', N'Successful booking Room with ID is 4', 2500000, N'2023-07-12T21:06:22.372', 4, 7, 0)
INSERT [dbo].[Bill] ([bid], [datebill], [bdescription], [price], [datedue], [roommid], [accid], [condition]) VALUES (3, N'2023-07-14T09:22:41.718', N'Successful booking Room with ID is 18', 1900000, N'2023-08-14T09:22:41.718', 18, 7, 1)
INSERT [dbo].[Bill] ([bid], [datebill], [bdescription], [price], [datedue], [roommid], [accid], [condition]) VALUES (4, N'2023-07-14T09:22:44.297', N'Successful booking Room with ID is 16', 2900000, N'2023-09-14T09:22:44.296', 16, 7, 1)
INSERT [dbo].[Bill] ([bid], [datebill], [bdescription], [price], [datedue], [roommid], [accid], [condition]) VALUES (5, N'2023-07-14T16:34:00.114', N'Successful booking Room with ID is 16', 2900000, N'2023-08-14T16:34:00.114', 16, 7, 1)
INSERT [dbo].[Bill] ([bid], [datebill], [bdescription], [price], [datedue], [roommid], [accid], [condition]) VALUES (6, N'2023-07-14T16:34:01.540', N'Successful booking Room with ID is 17', 2600000, N'2023-08-14T16:34:01.540', 17, 7, 1)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cateid], [catenme]) VALUES (1, N'Cheap')
INSERT [dbo].[Category] ([cateid], [catenme]) VALUES (2, N'Normal')
INSERT [dbo].[Category] ([cateid], [catenme]) VALUES (3, N'Vip')
INSERT [dbo].[Category] ([cateid], [catenme]) VALUES (4, N'Small')
INSERT [dbo].[Category] ([cateid], [catenme]) VALUES (5, N'Big')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[InforUser] ON 

INSERT [dbo].[InforUser] ([usid], [fullname], [uaddress], [phonenumber], [birthday], [avatar], [email]) VALUES (1, N'Trần Admin', N'Hà Nội', N'0356788241', N'1999', N'admin.jpg', N'admin@gmail.com')
INSERT [dbo].[InforUser] ([usid], [fullname], [uaddress], [phonenumber], [birthday], [avatar], [email]) VALUES (2, N'Hoàng Đức Hiền', N'Đà Nẵng', N'0523927504', N'2002', N'avahien.webp', N'hienhdde160299@fpt.edu.vn')
INSERT [dbo].[InforUser] ([usid], [fullname], [uaddress], [phonenumber], [birthday], [avatar], [email]) VALUES (3, N'Hà Thanh Phúc', N'Quảng Bình', N'0905123789', N'2001', N'avaphuc.webp', N'phuchtde160466@fpt.edu.vn')
INSERT [dbo].[InforUser] ([usid], [fullname], [uaddress], [phonenumber], [birthday], [avatar], [email]) VALUES (4, N'Huỳnh Thành Đạt', N'Đà Nẵng', N'0905667432', N'2000', N'avatdat.webp', N'dathtde160551@fpt.edu.vn')
INSERT [dbo].[InforUser] ([usid], [fullname], [uaddress], [phonenumber], [birthday], [avatar], [email]) VALUES (5, N'Hoàng Công Hải Định', N'Quảng Bình', N'0901345672', N'2001', N'avadinh.webp', N'dinhhchde106607@fpt.edu.vn')
INSERT [dbo].[InforUser] ([usid], [fullname], [uaddress], [phonenumber], [birthday], [avatar], [email]) VALUES (6, N'Kiều Văn Quốc Đạt', N'Đà Nẵng', N'0905180307', N'2002', N'avaqdat.webp', N'datkvqde160284@fpt.edu.vn')
INSERT [dbo].[InforUser] ([usid], [fullname], [uaddress], [phonenumber], [birthday], [avatar], [email]) VALUES (7, N'Ha Thanh Phuc', N'Quảng Bình', N'0987654321', N'2002', N'z4111963303828_fcf10e5063ecd43dd7c356b3e3e50fa1.jpg', N'hphuc20k2@gmail.com')
SET IDENTITY_INSERT [dbo].[InforUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Motel] ON 

INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (1, N'Phòng trọ cao cấp giá rẻ mới xây - Shophouse dầu khí - Đường Võ Chí Công, Hòa Quý, Đà Nẵng', N'tro11.webp', N'1. Vị trí ở Shophouse Dầu Khí, Hòa Quý, Đà Nẵng. Phòng mới xây sử dụng lần đầu, thông thoáng sạch sẽ. Giao thông đi lại thuận tiện.
2. Phòng khép kín, có chỗ nấu ăn,... Wifi miễn phí, nhà xe, Camera an ninh.
Ghi chú: Phòng Không nội thất.
4. Giá thuê: Từ 2,2tr - 3.5tr/phòng/tháng (tùy phòng).
Cọc 01 triệu. Nộp tiền theo tháng. Điện nước theo công tơ riêng.
Phù hợp: Gia đình nhỏ, nhân viên văn phòng, sinh viên có nhu cầu ở lâu dài.', N'214 Đường Võ Chí Công, Hòa Quý, Đà Nẵng', N'16/05/2023', N'https://goo.gl/maps/z5YsfwxD5yVoUQ1g8', 6, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (2, N'Phòng trọ 30m tại Nguyễn văn thoại,an Hải đông,Sơn trà', N'tro21.webp', N'Cho thuê phòng trọ tại kiệt 145 Nguyễn văn thoại,dt 30m ,gần biển,chợ gần cầu Trần thị lý,giá cho thuê 2triệu 8/tháng LH 0936 441 755 ', N'145 Nguyễn Văn Thoại, Phường An Hải Đông, Sơn Trà', N'20/05/2023', N'https://goo.gl/maps/gkjSXKiVZYAeKpgL9', 2, 0)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (3, N'Cho thuê phòng trọ ở trung tâm thành phố', N'tro31.webp', N'Cho thuê phòng cho trọ ở q Hải Châu, thoáng mát sạch đẹp, yên tĩnh giá chỉ từ 1,6 tr/th/ng 2,1tr/th/2ng có Tolet, bếp nấu, có gác lưng. Thang máy, nơi để xe tầng trệt và lối đi riêng, ra vào 24/24. 2 lớp cửa thẻ từ và vân tay nên an ninh cực kỳ tốt. Mặt tiền đường Duy tân, lối ra vào sân bay ĐN. gần các trường đại hoc duy tân, kiến trúc, ngoại ngữ....', N'132 Đường Duy Tân, Phường Hòa Thuận Tây, Hải Châu', N'20/05/2023', N'https://goo.gl/maps/nmeUFjSbRXpYH1bp8', 6, 0)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (4, N'Cho thuê phòng trọ giá rẻ khu vực ngay chợ Non Nước', N'tro41.webp', N'Cho thuê nhà ngay chợ Non Nước , gần nhiều trường đại học cao đẳng cho các bạn sinh viên như Đại học công nghệ thông tin và truyền thông Việt - Hàn , Trường ĐH FPT Đà Nẵng …..

Có lối để xe rộng rãi

An ninh tốt

phòng ở thoáng mát sạch sẽ có wifi free ( nhiều phòng có trang thiết bị đầy đủ như giường , tủ …)

camera 24/24 nên mọi người có thể yên tâm

tất cả các phòng đều có cửa số thoáng mát nhiều ánh sáng

Có thể trực tiếp đến xem phòng bất cứ lúc nào . Hãy liên hệ nếu bạn cần nhé', N'K35/3 Đường Nam Thành, Phường Hòa Hải, Ngũ Hành Sơn', N'10/05/2023', N'https://goo.gl/maps/NscNAPQXKeyH1VcL9', 5, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (5, N'Phòng trọ giá rẻ ngã tư Hoàng Diệu-Nguyễn Văn Linh, gần ĐH Duy Tân', N'tro51.webp', N'- Phòng chất lượng cao ở lầu 2 ( Nhà ở mái đúc 2 tấm mới, cả tầng chỉ có 2 phòng và sân thượng) - lối đi riêng, cho nữ thuê lâu dài tại K266 H14/19 Hoàng Diệu, (đi thẳng kiệt 254 HD 80m là đến nhà), ngay ngã tư Hoàng Diệu-NVLinh, cạnh KS Mường Thanh Sông Hàn (Hoàng Anh Gia Lai cũ).

- Nhà ngay trung tâm TP nên rất thuận tiện việc đi lại. Gần chợ, siêu thị, trường học, bệnh viện...Cách Cầu Rồng 600m, ĐH Duy Tân 500m, cách đường Hoàng Diệu 80m, đường ôtô vào tận cổng. Thân thiện, an ninh, yên tĩnh. Vào ở ngay.

- Đã trang bị điều hòa, tủ bếp, nệm, Wifi miễn phí, nước nóng lạnh năng lượng, tủ lạnh, tủ áo, bàn salon, Xe đạp thể dục, WC cao cấp.

- DT: trong phòng là 16m2, tổng diện tích sử dụng 70m2/ tầng 2, có sân thượng trước nhà thoáng mát, phơi đồ thoải mái, có bếp nấu ăn, rửa chén . . ', N'k266 H14/19 Đường Hoàng Diệu, Phường Nam Dương, Hải Châu', N'08/05/2023', N'https://goo.gl/maps/d92iUs9sZdn6p37n8', 2, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (6, N'Cho thuê phòng trọ tại số 78 Nguyễn Xuân Hữu, Hoà Thọ Đông, Cẩm Lệ, Đà Nẵng', N'tro61.webp', N'Phòng trọ 20m2, có gác lửng, có khu vực bếp, có bình nóng lạnh, gạch ốp tới trần nên sạch sẽ và thoáng mát. Cả dãy trọ chỉ có 4 phòng, có sân phơi đồ và chỗ để xe riêng. Gần chợ Cẩm Lệ, Hoà Cầm và trường tiểu học Trần Nhân Tông, khu dân cư đông đúc, giờ giấc tự do. Ưu tiên cho gia đình nhỏ ở dài lâu. Liên hệ A An 0905.229.886. Giá 1800k/ tháng', N'Đường Nguyễn Xuân Hữu, Phường Hòa Thọ Đông, Cẩm Lệ', N'15/05/2023', N'https://goo.gl/maps/a7Qqh2NA1nDii7U86', 6, 0)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (7, N'Cho thuê căn hộ sát chợ Non Nước', N'tro71.webp', N'Cho thuê căn hộ sát bên cạnh chợ Non Nước – Ngũ Hành Sơn (06 Nam Thành) – Nằm ở vị trí 2 mặt tiền, diện tích 32m2, có gác lửng rộng rãi, thiết bị vệ sinh sinh cao cấp, giá cho thuê. 2tr/căn hộ Liên hệ Đt, zalo: 0905 868 758 (A.Thịnh)', N'06 Nam Thành,Hòa Hải, Ngũ Hành Sơn', N'01/03/2021', N'https://goo.gl/maps/5KdMh7sJzQajnj9Y8', 2, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (8, N'CHO THUÊ PHÒNG TRỌ GIÁ RẺ ĐƯỜNG TRỤC LỚN TÔN ĐỨC THẮNG', N'tro81.webp', N'Cho thuê phòng trọ giá rẻ Hòa Minh, Liên Chiểu

Địa chỉ: 380 Tôn Đức Thắng,P. Hòa Minh, Liên Chiểu, Đà Nẵng

Mặt tiền của trục đường chính Tôn Đức Thắng, gần trung tâm thành phố, gần chợ, siêu thị.

Gần các trường tiểu học

Gần trường đại học sư phạm, Bách khoa, Duy Tân

Phòng rộng rãi, thoáng , view đẹp

Có chỗ để xe riêng

Không chung chủ, giờ giấc tự do

Dưới là trung tâm tiếng anh WISE ENGLISH có tiếng tại Đà Nẵng, gần cho các bạn sinh viên muốn học luyện thi IELTS, TOEIC,... nhé

Giá: từ 2tr đến 2tr7/tháng, cọc 2 triệu

Liên hệ: 0326482674 ( Thương )', N'380 Tôn Đức Thắng,P. Hòa Minh, Liên Chiểu', N'19/04/2021', N'https://goo.gl/maps/2JX25jwd74kUwDQw7', 2, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (9, N'Cho thuê phòng trọ tại Ngũ Hành Sơn, Đà Nẵng', N'tro91.webp', N'Cho thuê phòng trọ ở 346 Ngũ Hành Sơn quận Ngũ Hành Sơn Đà Nẵng.

Giá 2,5 triệu/1phòng/1tháng, có nhà vệ sinh riêng hệ thống nóng lạnh từng phòng, có thang máy, gần trường đại học Kinh tế (cách 700m).

Cho thuê nguyên tầng làm văn phòng, spa.

Cho thuê mặt tiền kinh doanh giá 7 triệu/1tháng.

Liên hệ: 034 851 0149 (chú Dũng)

036 897 0278 (cô Hoa)', N'346 Ngũ Hành Sơn, Ngũ Hành Sơn', N'19/04/2025', N'https://goo.gl/maps/T1KZLoVrD2azmFHf8', 6, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (10, N'Cho thuê phòng trọ thoáng mát, sạch sẽ', N'tro101.webp', N'Cho thuê phòng chung chủ, phòng lớn có ban công có lối đi riêng. Cách trường ĐH Đông Á, Kiến Trúc, Chợ Đầu mối Hòa Cường, có thể đi bộ khoảng 290m, Gần bệnh viện Vinmec, gần trường Đại học ngoại ngữ. Có điều hoà, nóng lạnh, có chỗ nấu ăn, Yêu cầu: sinh viên nữ ưu tiên những bạn sinh viên năm 1, chưa có xe.', N'582 Đường số 2/9, Phường Hòa Cường Nam, Hải Châu', N'28/03/2023', N'https://goo.gl/maps/nKvSAkm9zdqC2758A', 5, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (11, N'Cho thuê phòng trọ giá rẻ 1tr7 một phòng', N'tro111.webp', N'Diện tích: 40m2. Có gác lửng, thoáng mát, tiện nghi.

Cho thuê phòng trọ hoặc mặt bằng kinh doanh.

Liên hệ: 0825.64.55.78 Chú Sơn.', N'Phường Hòa Minh, Liên Chiểu', N'28/03/2023', N'https://goo.gl/maps/ZceA1wM2SYw3vtJcA', 5, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (12, N'Cho thuê nhà cấp 4 mặt tiền giá rẻ', N'tro121.webp', N'nhà cấp 4, đường 7m5, 100m2, có sân, 1PK, 1PN, 1 Bếp, 1 VS,

Nội thất có sẵn 1 giường và bộ bàn ghế phòng khách,

địa chỉ: đường Võ Văn Đồng, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng. gần FPT Plaza 1-2.

Điên nước tự quản theo giá nhà nước.

Giá cho thuê 3tr/tháng.

LH: Zin-0962308846', N'Đường Nguyễn Duy Trinh, Phường Hòa Hải, Ngũ Hành Sơn', N'05/02/2025', N'https://goo.gl/maps/GHm3cJxV8uaxZbuj9', 6, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (13, N'Cho thuê nhà cấp 4 mặt tiền giá rẻ', N'tro131.webp', N'phòng trọ rộng rãi thoáng mát giá rẻ.gần khu công nghiệp,cách chợ 200m,phòng mới xây và có sân vuờn rộng rãi. chỗ để xe thoải mái và an toàn

giá 1tr2 chưa tính điện nước

địa chỉ 1033 âu cơ chạy lên 100m có tiệm thuốc tây KIM TÂN', N'Phường Hòa Khánh Bắc, Liên Chiểu', N'31/01/2023', N'https://goo.gl/maps/8jhbFUCBaDtfxq9W7', 2, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (14, N'Cho thuê phòng trọ phù hợp cho gia đình nhỏ', N'tro141.webp', N'Co 03 Phòng rộng từ 30 đến 35m2 có phòng ngủ riêng, phòng ăn và wc', N'382/6k Đường Núi Thành, Phường Hòa Cường Bắc, Hải Châu', N'28/01/2023', N'https://goo.gl/maps/94f5PgpDadLfoKPr8', 5, 1)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (15, N'Test', N'6CyJ_admin.jpg', N'Test', N'Test', N'2023-07-13T15:46:51.889', N'Test', 7, 0)
INSERT [dbo].[Motel] ([mid], [mname], [motelimg], [mdescription], [maddress], [dateupload], [coordinates], [accid], [condition]) VALUES (16, N'Phòng trọ giá rẻ', N'G@H9_326872974_636913038123292_590419478477962300_n.jpg', N'hayyyyyyyyyyyyyyyyyyyyyyyyyyyyy', N'Hải Châu', N'2023-07-13T16:29:39.891', N'#', 7, 1)
SET IDENTITY_INSERT [dbo].[Motel] OFF
GO
SET IDENTITY_INSERT [dbo].[Paycard] ON 

INSERT [dbo].[Paycard] ([pcid], [fullname], [numcard], [cmoney], [releasedate], [pincode]) VALUES (1, N'Admin Ne', N'1234 5678 9012 3456', 1338000, N'25/12', N'999999')
INSERT [dbo].[Paycard] ([pcid], [fullname], [numcard], [cmoney], [releasedate], [pincode]) VALUES (2, N'Hoang Duc Hien', N'8762569723895555', 902483750, N'18/24', N'111111')
INSERT [dbo].[Paycard] ([pcid], [fullname], [numcard], [cmoney], [releasedate], [pincode]) VALUES (3, N'Ha Thanh Phuc', N'6555999876542323', 35620000, N'05/25', N'070502')
INSERT [dbo].[Paycard] ([pcid], [fullname], [numcard], [cmoney], [releasedate], [pincode]) VALUES (4, N'Kieu Van Quoc Dat', N'6342210005134567', 400000000, N'26/25', N'121212')
INSERT [dbo].[Paycard] ([pcid], [fullname], [numcard], [cmoney], [releasedate], [pincode]) VALUES (5, N'Hoang Cong Hai Dinh', N'6776101288897643', 650000000, N'16/26', N'787878')
INSERT [dbo].[Paycard] ([pcid], [fullname], [numcard], [cmoney], [releasedate], [pincode]) VALUES (6, N'Huynh Thanh Dat', N'7842911062774388', 567400000, N'13/24', N'565656')
SET IDENTITY_INSERT [dbo].[Paycard] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (1, N'motelimage/tro11.webp', N'2023-06-07T09:41:22.883', 5, N'Thật sự là một nhà trọ đáng sống giữa thành phố nhộn nhịp', 6, 1)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (2, N'motelimage/tro11.webp', N'2023-06-07T09:41:22.883', 3, N'Trọ ổn áp nhưng không có điều hòa và nóng', 6, 2)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (3, N'motelimage/tro14.webp', N'2023-06-07T09:41:22.883', 2, N'Trọ nóng, không mới lắm', 3, 1)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (4, N'motelimage/tro16.webp', N'2023-06-07T09:41:22.883', 4, N'Chủ trọ tốt bụng, trọ hơi xa trung tâm', 4, 3)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (5, N'motelimage/tro16.webp', N'2023-06-07T09:41:22.883', 5, N'Trọ đẹp nhất trong tầm giá', 5, 5)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (6, N'motelimage/tro15.webp', N'2023-06-07T09:41:22.883', 4, N'Đáng để thuê, hơi xa', 5, 4)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (7, N'motelimage/tro16.webp', N'2023-06-07T09:41:22.883', 5, N'Trọ tuyệt vời', 4, 6)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (8, N'motelimage/tro16.webp', N'2023-06-07T09:41:22.883', 3, N'Trọ này đẹp,nhưng ồn ào', 5, 7)
INSERT [dbo].[Review] ([rvid], [img], [dateup], [rscore], [comment], [accid], [mid]) VALUES (9, N'motelimage/tro15.webp', N'2023-06-07T09:41:22.883', 5, N'Đẹp, sạch, gần trung tâm  rất tiện lợi mọi người nên thử', 5, 8)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (1, N'tro11.webp', N'tro11.webp', N'tro11.webp', 3500000, 10, 1, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (2, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1500000, 10, 1, 2, 0)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (3, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2000000, 10, 1, 3, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (4, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2500000, 8, 2, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (5, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2300000, 10, 2, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (6, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1800000, 10, 3, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (7, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1700000, 10, 3, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (8, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2700000, 10, 4, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (9, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2600000, 10, 4, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (10, N'tro11.webp', N'tro11.webp', N'tro11.webp', 3000000, 10, 4, 3, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (11, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1500000, 10, 5, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (12, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2000000, 10, 5, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (13, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2300000, 10, 5, 3, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (14, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2000000, 10, 6, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (15, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1400000, 10, 6, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (16, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2900000, 8, 7, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (17, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2600000, 9, 7, 3, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (18, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1900000, 9, 8, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (19, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2700000, 10, 9, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (20, N'tro11.webp', N'tro11.webp', N'tro11.webp', 3000000, 10, 10, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (21, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2000000, 10, 11, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (22, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2100000, 10, 12, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (23, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1800000, 10, 12, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (24, N'tro11.webp', N'tro11.webp', N'tro11.webp', 3100000, 10, 13, 3, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (25, N'tro11.webp', N'tro11.webp', N'tro11.webp', 2400000, 10, 13, 1, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (26, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1600000, 10, 14, 3, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (27, N'tro11.webp', N'tro11.webp', N'tro11.webp', 1800000, 10, 14, 2, 1)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (28, N'JIDN_298284115_366680468959816_473424842989077840_n.jpg', N'DMo#_298763770_366680602293136_5306550908890668972_n.jpg', N'8df@_326872974_636913038123292_590419478477962300_n.jpg', 2000000, 10, 15, 2, 0)
INSERT [dbo].[Room] ([roommid], [mimage1], [mimage2], [mimage3], [price], [quantity], [mid], [cateid], [codition]) VALUES (29, N'Lvt4_298197362_366650775629452_2592640129796339362_n.jpg', N'Y$z5_298284115_366680468959816_473424842989077840_n.jpg', N'abZ#_Screenshot 2023-02-06 131109.png', 2000000, 11, 15, 4, 0)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([pcid])
REFERENCES [dbo].[Paycard] ([pcid])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([usid])
REFERENCES [dbo].[InforUser] ([usid])
GO
ALTER TABLE [dbo].[Alert]  WITH CHECK ADD FOREIGN KEY([idget])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Alert]  WITH CHECK ADD FOREIGN KEY([idsend])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Alert]  WITH CHECK ADD FOREIGN KEY([roommid])
REFERENCES [dbo].[Room] ([roommid])
GO
ALTER TABLE [dbo].[Alert]  WITH CHECK ADD FOREIGN KEY([staid])
REFERENCES [dbo].[Astatus] ([staid])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([accid])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([roommid])
REFERENCES [dbo].[Room] ([roommid])
GO
ALTER TABLE [dbo].[Motel]  WITH CHECK ADD FOREIGN KEY([accid])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([accid])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([mid])
REFERENCES [dbo].[Motel] ([mid])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([cateid])
REFERENCES [dbo].[Category] ([cateid])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([mid])
REFERENCES [dbo].[Motel] ([mid])
GO
USE [master]
GO
ALTER DATABASE [Accommodation service] SET  READ_WRITE 
GO
