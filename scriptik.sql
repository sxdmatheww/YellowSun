USE [master]
GO
/****** Object:  Database [yellows]    Script Date: 10.06.2024 5:04:01 ******/
CREATE DATABASE [yellows]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'yellows', FILENAME = N'C:\Users\matve\yellows.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'yellows_log', FILENAME = N'C:\Users\matve\yellows_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [yellows] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [yellows].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [yellows] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [yellows] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [yellows] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [yellows] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [yellows] SET ARITHABORT OFF 
GO
ALTER DATABASE [yellows] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [yellows] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [yellows] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [yellows] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [yellows] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [yellows] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [yellows] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [yellows] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [yellows] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [yellows] SET  DISABLE_BROKER 
GO
ALTER DATABASE [yellows] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [yellows] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [yellows] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [yellows] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [yellows] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [yellows] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [yellows] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [yellows] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [yellows] SET  MULTI_USER 
GO
ALTER DATABASE [yellows] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [yellows] SET DB_CHAINING OFF 
GO
ALTER DATABASE [yellows] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [yellows] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [yellows] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [yellows] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [yellows] SET QUERY_STORE = OFF
GO
USE [yellows]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[item] [varchar](50) NULL,
	[count] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[dexcription] [text] NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
	[url] [nvarchar](max) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id_orders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_user]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10.06.2024 5:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (1, N'/photo/BCAA apelsin.png', N'BCAA', N'500ml', N'Вкус: Апельсин', 100, 10, N'https://megamarket.ru/catalog/details/napitok-sportinia-bcaa-6000-orange-500-ml-12-sht-600010731049/?adjust_tracker=4a3jxi1_j6n0ehs&adjust_campaign=yandex&adjust_adgroup=cpc&adjust_creative=mm_ya_dsa-gal_0506-011_na_sport-i-aktivnyy-otdyh_na_msk-mo&adjust_ya_click_id=10708531860392378367&utm_source=yandex&utm_medium=cpc&utm_campaign=mm_ya_dsa-gal_0506-011_na_sport-i-aktivnyy-otdyh_na_msk-mo_74718756_4923884791_12200032479&utm_term=&utm_keyid=3341346&utm_rtrid=3341346&utm_content=none&utm_regid=98605&utm_regname=Раменский%20район&utm_coef=0&yclid=10708531860392378367', 13)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (2, N'/photo/BCAA mango.png', N'BCAA', N'500ml', N'Вкус: Манго', 100, 15, N'https://megamarket.ru/catalog/details/napitok-sportinia-bcaa-6000-mango-500-ml-12-sht-600010731061/#?related_search=sportinia%20bcaa%206000%20апельсин', 10)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (3, N'/photo/BCAA maraku.png', N'BCAA', N'500ml', N'Вкус: Маракуйа', 100, 10, N'https://megamarket.ru/catalog/details/sportivnyy-napitok-sportinia-bcaa-6000-negazirovannyy-12-sht-600010134513/#?related_search=спортивный%20напиток%20sportinia%20bcaa%206000%20маракуйа', 10)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (3013, N'/photo/BCAA vishnya myata.png', N'BCAA', N'500ml', N'Вкус: Вишня, Мята', 110, 10, N'https://www.wildberries.ru/catalog/179429586/detail.aspx?utm_referrer=https%3A%2F%2Fyandex.ru%2Fproducts%2Fsearch%3Ftext%3D%25D0%25BA%25D1%2583%25D0%25BF%25D0%25B8%25D1%2582%25D1%258C%2520bcaa%2520sportinia%25206000%2520%25D1%258B%25D0%25B8%25D1%2588%25D0%25BD%25D1%258F%2520%25D0%25BC%25D1%258F%25D1%2582%25D0%25B0', 10)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (3014, N'/photo/Lananas.png', N'L-Карнитин', N'500ml', N'Вкус: Ананас', 100, 5, N'https://megamarket.ru/catalog/details/sportivnyy-napitok-sportinia-l-carnitine-1500-mg-ananas-05l-12-shtuk-600011007485/#?related_search=спортивный%20напиток%20sportinia%20bcaa%206000%20вишня%20мята', 10)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (3018, N'/photo/Lgranat.png', N'L-Карнитин', N'500ml', N'Вкус: Гранат', 100, 0, N'https://megamarket.ru/catalog/details/sportinia-l-carnitine-500-ml-granat-100024404287/#?related_search=спортивный%20напиток%20sportinia%20bcaa%206000%20гранат', 10)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (3022, N'/photo/Lmalina.png', N'L-Карнитин', N'500ml', N'Вкус: Малина', 100, 5, N'https://megamarket.ru/catalog/details/sportivnyy-napitok-sportinia-l-carnitine-1500-mg-malina-05-l-h-12-sht-600010741904/#?related_search=спортивный%20напиток%20sportinia%20bcaa%206000%20гранат', 10)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (3025, N'/photo/Lsacura.png', N'L-Карнитин', N'500ml', N'Вкус: Сакура', 100, 20, N'https://megamarket.ru/catalog/details/sportivnyy-napitok-sportinia-l-carnitine-1500-mg-sakura-05-l-h-12-sht-600010936840/#?related_search=спортивный%20напиток%20sportinia%20bcaa%206000%20сакура', 10)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (3026, N'/photo/guarana.png', N'ГУАРАНА', N'500ml', N'Вкус: Гуарана', 150, 10, N'https://shop.soyka.ru/product/sportivnyy-energeticheskiy-napitok-guarana-sportinia-500ml/?yclid=5726100626030460927', 11)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (10031, N'/photo/milkshake.png', N'Протеиновый баотнчик', N'700?.', N'Молочный коктейль', 100, 5, N'https://www.wildberries.ru/catalog/168754463/detail.aspx', 15)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (10032, N'/photo/chokolate.png', N'Протеиновый батончик', N'700?.', N'Вкус: Шоколад', 100, 10, N'https://www.wildberries.ru/catalog/154700190/detail.aspx?targetUrl=EX', 14)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (10033, N'/photo/raspberry.png', N'Протеиновый батончик', N'700?.', N'Вкус: Малина', 100, 7, N'https://www.wildberries.ru/catalog/154700191/detail.aspx?targetUrl=EX', 20)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount], [url], [quantity]) VALUES (10034, N'/photo/mango.png', N'Протеиновый батончик', N'700?.', N'Вкус: Манго', 100, 10, N'https://www.wildberries.ru/catalog/154700193/detail.aspx?targetUrl=EX', 15)
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount]) VALUES (1, 1, 1, 1, CAST(N'2023-09-14' AS Date), 1256, 1200, 35)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount]) VALUES (2, 2, 2, 2, CAST(N'2023-09-25' AS Date), 6673, 5000, 0)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount]) VALUES (3, 3, 3, 3, CAST(N'2023-09-28' AS Date), 4342, 9000, 0)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [name], [photo]) VALUES (1, N'Пункт выдачи 1', N'/photo/point.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (2, N'Пункт выдачи 2', N'/photo/point2.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (3, N'Пункт выдачи 3', NULL)
SET IDENTITY_INSERT [dbo].[point] OFF
GO
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (1, 1, 1)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (2, 2, 1)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (3, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'в работе')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'доставляется')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[type_user] ON 

INSERT [dbo].[type_user] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[type_user] ([id], [role]) VALUES (2, N'Менеджер')
INSERT [dbo].[type_user] ([id], [role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[type_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (1, N'admin', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (2, N'', N'', 2)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (3, N'', N'', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (4, N'', N'', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (5, N'', N'', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (6, N'', N'', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (7, N'proverka', N'12345', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (8, N'anna', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (9, N'lexa', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (10, N'1', N'1', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_user] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_user]
GO
USE [master]
GO
ALTER DATABASE [yellows] SET  READ_WRITE 
GO
