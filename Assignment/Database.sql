USE [master]
GO
/****** Object:  Database [WS_PRJ301]    Script Date: 18/8/2023 6:00:32 PM ******/
CREATE DATABASE [WS_PRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WS_PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WS_PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WS_PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WS_PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WS_PRJ301] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WS_PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WS_PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WS_PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WS_PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WS_PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WS_PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [WS_PRJ301] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WS_PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WS_PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WS_PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WS_PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WS_PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WS_PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WS_PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WS_PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WS_PRJ301] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WS_PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WS_PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WS_PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WS_PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WS_PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WS_PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WS_PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WS_PRJ301] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WS_PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [WS_PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WS_PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WS_PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WS_PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WS_PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WS_PRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WS_PRJ301] SET QUERY_STORE = ON
GO
ALTER DATABASE [WS_PRJ301] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WS_PRJ301]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 18/8/2023 6:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](100) NULL,
	[Password] [nchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18/8/2023 6:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateId] [int] NOT NULL,
	[CateName] [varchar](50) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 18/8/2023 6:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustName] [varchar](50) NOT NULL,
	[CustContent] [varchar](100) NOT NULL,
	[ItemId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 18/8/2023 6:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NULL,
	[Price] [int] NULL,
	[CateId] [int] NULL,
	[Image] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([UserId], [Username], [Password]) VALUES (1, N'user                                                                                                ', N'user                                                                                                ')
INSERT [dbo].[Accounts] ([UserId], [Username], [Password]) VALUES (2, N'admin                                                                                               ', N'admin                                                                                               ')
INSERT [dbo].[Accounts] ([UserId], [Username], [Password]) VALUES (3, N'dang                                                                                                ', N'dang                                                                                                ')
INSERT [dbo].[Accounts] ([UserId], [Username], [Password]) VALUES (4, N'kiet                                                                                                ', N'kiet                                                                                                ')
INSERT [dbo].[Accounts] ([UserId], [Username], [Password]) VALUES (5, N'hellobagia                                                                                          ', N'hellobagia                                                                                          ')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
INSERT [dbo].[Categories] ([CateId], [CateName], [Status]) VALUES (1, N'Dining tables', 1)
INSERT [dbo].[Categories] ([CateId], [CateName], [Status]) VALUES (2, N'Chairs', 0)
INSERT [dbo].[Categories] ([CateId], [CateName], [Status]) VALUES (3, N'Clocks & Barometers', 1)
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (1, N'table walnut side', 2000, 1, N'https://elkohardwoods.com/wp-content/uploads/2021/06/172-2.jpg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (2, N'Edwardian-Torchiere', 1200, 1, N'https://i.etsystatic.com/7886550/r/il/71a750/611374733/il_1080xN.611374733_oz5d.jpg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (3, N'Large Oak farmhouse', 1000, 1, N'https://www.antique-tables.co.uk/productimages/large-antique-pale-oak-farmhouse-table-46-L1.jpeg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (4, N'Mahogani', 2000, 1, N'https://kadiyamnursery.com/cdn/shop/products/swietenia-mahogani-mahogany-spanish-mahogany-kadiyam-nursery-1_700x700.jpg?v=1662198545')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (5, N'Carver', 900, 1, N'https://carver.earth/wp-content/uploads/2022/06/2007-carver-one_100650881_m.jpg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (6, N'Library', 1000, 1, N'https://www.parliament.uk/contentassets/aa8b9933d3cb4364b827e7a60ea898e0/hl_library_roger-harris2022.jpg?width=1000&quality=85')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (7, N'Chiming Longcase', 3000, 1, N'https://www.regentantiques.com/product_images/06994-Antique-Longcase-Clock-Chiming-on-Bells---19th-Century-1.jpg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (8, N'small Caver', 2300, 1, N'https://c8.alamy.com/comp/AMYTME/caver-in-small-crawlway-baliem-river-cave-irian-jaya-AMYTME.jpg')
INSERT [dbo].[Items] ([ItemId], [ItemName], [Price], [CateId], [Image]) VALUES (9, N'Testttt', 45, 1, NULL)
GO
ALTER TABLE [dbo].[FAQ]  WITH CHECK ADD  CONSTRAINT [FK_Items_FAQ] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[FAQ] CHECK CONSTRAINT [FK_Items_FAQ]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories] FOREIGN KEY([CateId])
REFERENCES [dbo].[Categories] ([CateId])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories]
GO
USE [master]
GO
ALTER DATABASE [WS_PRJ301] SET  READ_WRITE 
GO
