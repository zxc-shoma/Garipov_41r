USE [master]
GO
/****** Object:  Database [garipov41]    Script Date: 29.01.2024 17:42:22 ******/
CREATE DATABASE [garipov41]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'garipov41', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\garipov41.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'garipov41_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\garipov41_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [garipov41].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [garipov41] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [garipov41] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [garipov41] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [garipov41] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [garipov41] SET ARITHABORT OFF 
GO
ALTER DATABASE [garipov41] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [garipov41] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [garipov41] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [garipov41] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [garipov41] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [garipov41] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [garipov41] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [garipov41] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [garipov41] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [garipov41] SET  DISABLE_BROKER 
GO
ALTER DATABASE [garipov41] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [garipov41] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [garipov41] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [garipov41] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [garipov41] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [garipov41] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [garipov41] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [garipov41] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [garipov41] SET  MULTI_USER 
GO
ALTER DATABASE [garipov41] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [garipov41] SET DB_CHAINING OFF 
GO
ALTER DATABASE [garipov41] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [garipov41] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [garipov41] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [garipov41] SET QUERY_STORE = OFF
GO
USE [garipov41]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29.01.2024 17:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[Surname] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Patronymic] [nvarchar](max) NULL,
	[OrderCode] [int] NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF0F357CCD] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 29.01.2024 17:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A2662A40C42BF] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pickuppoint]    Script Date: 29.01.2024 17:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pickuppoint](
	[pointID] [int] NOT NULL,
	[index] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NULL,
	[street] [nvarchar](max) NULL,
	[house_number] [nvarchar](max) NULL,
 CONSTRAINT [PK_pickuppoint] PRIMARY KEY CLUSTERED 
(
	[pointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.01.2024 17:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NULL,
	[ProductUnit] [nvarchar](50) NOT NULL,
	[ProductProvider] [nvarchar](max) NOT NULL,
	[ProductMaxDiscount] [int] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD517369BEF] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.01.2024 17:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.01.2024 17:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (1, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 10, N'Анохин', N'Арсений', N'Андреевич', 911, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (2, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 5, N'Козлов', N'Максим', N'Максимович', 912, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (3, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 11, N'Черных', N'Марк', N'Кириллович', 913, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (4, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 10, N'', N'', N'', 914, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (5, CAST(N'2022-05-20' AS Date), CAST(N'2022-05-26' AS Date), 1, N'', N'', N'', 915, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (6, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 32, N'', N'', N'', 916, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (7, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 20, N'Козлов', N'Давид', N'Александрович', 917, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (8, CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 34, N'', N'', N'', 918, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (9, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 25, N'', N'', N'', 919, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [Surname], [Name], [Patronymic], [OrderCode], [OrderStatus]) VALUES (10, CAST(N'2022-05-25' AS Date), CAST(N'2022-05-31' AS Date), 36, N'', N'', N'', 920, N'Завершен')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'H782T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'F635R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'G783F5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'D572U8', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'J384T6', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'B320R5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'D329H3', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'G432E4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'S213E3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'K345R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'S634B5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'G531F4', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'J542F5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'C436G5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'P764G4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'D364R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'S326R5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'D268G5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'M542T5', 2)
GO
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (1, N'344288', N' г. Москва', N' ул. Чехова', N'1')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (2, N'614164', N' г.Москва', N'  ул. Степная', N'30')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (3, N'394242', N' г. Москва', N' ул. Коммунистическая', N'43')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (4, N'660540', N' г. Москва', N' ул. Солнечная', N'25')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (5, N'125837', N' г. Москва', N' ул. Шоссейная', N'40')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (6, N'125703', N' г. Москва', N' ул. Партизанская', N'49')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (7, N'625283', N' г. Москва', N' ул. Победы', N'46')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (8, N'614611', N' г. Москва', N' ул. Молодежная', N'50')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (9, N'454311', N' г.Москва', N' ул. Новая', N'19')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (10, N'660007', N' г.Москва', N' ул. Октябрьская', N'19')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (11, N'603036', N' г. Москва', N' ул. Садовая', N'4')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (12, N'450983', N' г.Москва', N' ул. Комсомольская', N'26')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (13, N'394782', N' г. Москва', N' ул. Чехова', N'3')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (14, N'603002', N' г. Москва', N' ул. Дзержинского', N'28')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (15, N'450558', N' г. Москва', N' ул. Набережная', N'30')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (16, N'394060', N' г.Москва', N' ул. Фрунзе', N'43')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (17, N'410661', N' г. Москва', N' ул. Школьная', N'50')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (18, N'625590', N' г. Москва', N' ул. Коммунистическая', N'20')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (19, N'625683', N' г. Москва', N' ул. 8 Марта', N'1')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (20, N'400562', N' г. Москва', N' ул. Зеленая', N'32')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (21, N'614510', N' г. Москва', N' ул. Маяковского', N'47')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (22, N'410542', N' г. Москва', N' ул. Светлая', N'46')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (23, N'620839', N' г. Москва', N' ул. Цветочная', N'8')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (24, N'443890', N' г. Москва', N' ул. Коммунистическая', N'1')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (25, N'603379', N' г. Москва', N' ул. Спортивная', N'46')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (26, N'603721', N' г. Москва', N' ул. Гоголя', N'41')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (27, N'410172', N' г. Москва', N' ул. Северная', N'13')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (28, N'420151', N' г. Москва', N' ул. Вишневая', N'32')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (29, N'125061', N' г. Москва', N' ул. Подгорная', N'8')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (30, N'630370', N' г. Москва', N' ул. Шоссейная', N'24')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (31, N'614753', N' г. Москва', N' ул. Полевая', N'35')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (32, N'426030', N' г. Москва', N' ул. Маяковского', N'44')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (33, N'450375', N' г. Москва', N' ул. Клубная', N'44')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (34, N'625560', N' г. Москва', N' ул. Некрасова', N'12')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (35, N'630201', N' г. Москва', N' ул. Комсомольская', N'17')
INSERT [dbo].[pickuppoint] ([pointID], [index], [city], [street], [house_number]) VALUES (36, N'190949', N' г. Москва', N' ул. Мичурина', N'26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'B320R5', N'Туфли', N'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', N'Женская обувь', NULL, N'Rieker', CAST(4300.0000 AS Decimal(19, 4)), 2, 6, N'', N'шт.', N'Kari', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'B431R5', N'Ботинки', N'Мужские кожаные ботинки/мужские ботинки', N'Мужская обувь', NULL, N'Rieker', CAST(2700.0000 AS Decimal(19, 4)), 2, 5, N'', N'шт.', N'Обувь для вас', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'C436G5', N'Ботинки', N'Ботинки женские, ARGO, размер 40', N'Женская обувь', NULL, N'Alessio Nesca', CAST(10200.0000 AS Decimal(19, 4)), 2, 9, N'', N'шт.', N'Kari', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'D268G5', N'Туфли', N'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', N'Женская обувь', NULL, N'Rieker', CAST(4399.0000 AS Decimal(19, 4)), 3, 12, N'', N'шт.', N'Обувь для вас', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'D329H3', N'Полуботинки', N'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', N'Женская обувь', NULL, N'Alessio Nesca', CAST(1890.0000 AS Decimal(19, 4)), 4, 4, N'', N'шт.', N'Обувь для вас', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'D364R4', N'Туфли', N'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', N'Женская обувь', NULL, N'Kari', CAST(12400.0000 AS Decimal(19, 4)), 2, 5, N'', N'шт.', N'Kari', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'D572U8', N'Кроссовки', N'129615-4 Кроссовки мужские', N'Мужская обувь', NULL, N'Рос', CAST(4100.0000 AS Decimal(19, 4)), 3, 6, N'', N'шт.', N'Обувь для вас', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'E482R4', N'Полуботинки', N'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', N'Женская обувь', NULL, N'Kari', CAST(1800.0000 AS Decimal(19, 4)), 2, 14, N'', N'шт.', N'Kari', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'F427R5', N'Ботинки', N'Ботинки на молнии с декоративной пряжкой FRAU', N'Женская обувь', NULL, N'Rieker', CAST(11800.0000 AS Decimal(19, 4)), 4, 11, N'', N'шт.', N'Обувь для вас', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'F572H7', N'Туфли', N'Туфли Marco Tozzi женские летние, размер 39, цвет черный', N'Женская обувь', NULL, N'Marco Tozzi', CAST(2700.0000 AS Decimal(19, 4)), 2, 14, N'', N'шт.', N'Kari', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'F635R4', N'Ботинки', N'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', N'Женская обувь', NULL, N'Marco Tozzi', CAST(3244.0000 AS Decimal(19, 4)), 2, 13, N'', N'шт.', N'Обувь для вас', 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'G432E4', N'Туфли', N'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', N'Женская обувь', NULL, N'Kari', CAST(2800.0000 AS Decimal(19, 4)), 3, 15, N'', N'шт.', N'Kari', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'G531F4', N'Ботинки', N'Ботинки женские зимние ROMER арт. 893167-01 Черный', N'Женская обувь', NULL, N'Kari', CAST(6600.0000 AS Decimal(19, 4)), 2, 9, N'', N'шт.', N'Kari', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'G783F5', N'Ботинки', N'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', N'Мужская обувь', NULL, N'Рос', CAST(5900.0000 AS Decimal(19, 4)), 2, 8, N'', N'шт.', N'Kari', 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'H535R5', N'Ботинки', N'Женские Ботинки демисезонные', N'Женская обувь', NULL, N'Rieker', CAST(2300.0000 AS Decimal(19, 4)), 2, 7, N'', N'шт.', N'Обувь для вас', 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'H782T5', N'Туфли', N'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', N'Мужская обувь', NULL, N'Kari', CAST(4499.0000 AS Decimal(19, 4)), 4, 5, N'', N'шт.', N'Kari', 30)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'J384T6', N'Ботинки', N'B3430/14 Полуботинки мужские Rieker', N'Мужская обувь', NULL, N'Rieker', CAST(3800.0000 AS Decimal(19, 4)), 2, 16, N'', N'шт.', N'Обувь для вас', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'J542F5', N'Тапочки', N'Тапочки мужские Арт.70701-55-67син р.41', N'Мужская обувь', NULL, N'Kari', CAST(500.0000 AS Decimal(19, 4)), 3, 12, N'', N'шт.', N'Kari', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'K345R4', N'Полуботинки', N'407700/01-02 Полуботинки мужские CROSBY', N'Мужская обувь', NULL, N'CROSBY', CAST(2100.0000 AS Decimal(19, 4)), 2, 3, N'', N'шт.', N'Обувь для вас', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'K358H6', N'Тапочки', N'Тапочки мужские син р.41', N'Мужская обувь', NULL, N'Rieker', CAST(599.0000 AS Decimal(19, 4)), 3, 2, N'', N'шт.', N'Kari', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'L754R4', N'Полуботинки', N'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', N'Женская обувь', NULL, N'Kari', CAST(1700.0000 AS Decimal(19, 4)), 2, 7, N'', N'шт.', N'Kari', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'M542T5', N'Кроссовки', N'Кроссовки мужские TOFA', N'Мужская обувь', NULL, N'Rieker', CAST(2800.0000 AS Decimal(19, 4)), 5, 3, N'', N'шт.', N'Обувь для вас', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'N457T5', N'Полуботинки', N'Полуботинки Ботинки черные зимние, мех', N'Женская обувь', NULL, N'CROSBY', CAST(4600.0000 AS Decimal(19, 4)), 3, 13, N'', N'шт.', N'Kari', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'O754F4', N'Туфли', N'Туфли женские демисезонные Rieker артикул 55073-68/37', N'Женская обувь', NULL, N'Rieker', CAST(5400.0000 AS Decimal(19, 4)), 4, 18, N'', N'шт.', N'Обувь для вас', 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'P764G4', N'Туфли', N'Туфли женские, ARGO, размер 38', N'Женская обувь', NULL, N'CROSBY', CAST(6800.0000 AS Decimal(19, 4)), 3, 15, N'', N'шт.', N'Kari', 30)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'S213E3', N'Полуботинки', N'407700/01-01 Полуботинки мужские CROSBY', N'Мужская обувь', NULL, N'CROSBY', CAST(2156.0000 AS Decimal(19, 4)), 3, 6, N'', N'шт.', N'Обувь для вас', 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'S326R5', N'Тапочки', N'Мужские кожаные тапочки "Профиль С.Дали" ', N'Мужская обувь', NULL, N'CROSBY', CAST(9900.0000 AS Decimal(19, 4)), 3, 15, N'', N'шт.', N'Обувь для вас', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'S634B5', N'Кеды', N'Кеды Caprice мужские демисезонные, размер 42, цвет черный', N'Мужская обувь', NULL, N'CROSBY', CAST(5500.0000 AS Decimal(19, 4)), 3, 6, N'', N'шт.', N'Обувь для вас', 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'T324F5', N'Сапоги', N'Сапоги замша Цвет: синий', N'Женская обувь', NULL, N'CROSBY', CAST(4699.0000 AS Decimal(19, 4)), 2, 5, N'', N'шт.', N'Kari', 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [ProductUnit], [ProductProvider], [ProductMaxDiscount]) VALUES (N'А112Т4', N'Ботинки', N'Женские Ботинки демисезонные kari', N'Женская обувь', NULL, N'Kari', CAST(4990.0000 AS Decimal(19, 4)), 3, 6, N'', N'шт.', N'Kari', 30)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Герасимов ', N'Вячеслав', N'Ростиславович', N'loginDEftn2018', N'gPq+a}', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Суворов ', N'Всеволод', N'Богданович', N'loginDEhuv2018', N'EJFYzS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Ширяев ', N'Иван', N'Игоревич', N'loginDEfhd2018', N'{4wU7n', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Колобова ', N'Иванна', N'Геннадьевна', N'loginDEaon2018', N'&OmaNE', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Шестаков ', N'Антон', N'Константинович', N'loginDEyat2018', N'ELSTyH', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Игнатьев ', N'Федосей', N'Богданович', N'loginDEmin2018', N'pQ6jze', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Горбунов ', N'Валентин', N'Григорьевич', N'loginDEzal2018', N'zbU8R5', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Терентьева ', N'Анжела', N'Михаиловна', N'loginDEemw2018', N'NxhF5I', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Мясникова ', N'Ия', N'Евсеевна', N'loginDEmqt2018', N'SIasu5', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Горбунов ', N'Григорий', N'Денисович', N'loginDEpxx2018', N'Xv{vjN', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Герасимов ', N'Олег', N'Авксентьевич', N'loginDEetv2018', N'lNi&rF', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Меркушева ', N'Нинель', N'Матвеевна', N'loginDEonq2018', N'mKIIRQ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Степанов ', N'Григорий', N'Матвеевич', N'loginDErhl2018', N'U}rb9j', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Агафонов ', N'Владлен', N'Станиславович', N'loginDEfou2018', N'O+S9hm', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Кузнецов ', N'Фрол', N'Георгьевич', N'loginDElno2018', N'le1vt2', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Игнатьев ', N'Борис', N'Владиславович', N'loginDEtbx2018', N'CQplH|', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Симонов ', N'Юрий', N'Созонович', N'loginDEltw2018', N'zvjkwE', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Степанов ', N'Евсей', N'Федотович', N'loginDEfuz2018', N'ILry03', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Зыков ', N'Вячеслав', N'Антонович', N'loginDEygj2018', N'7b6PUb', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Анисимова ', N'Алина', N'Протасьевна', N'loginDEwpn2018', N'9BBkXP', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Артемьева ', N'Лариса', N'Макаровна', N'loginDEyix2018', N'6zbXg*', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Мамонтова ', N'Ия', N'Христофоровна', N'loginDEtms2018', N'70Z&Zy', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Котова ', N'Светлана', N'Леонидовна', N'loginDEmgl2018', N'QJNgD&', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Фёдорова ', N'Алла', N'Брониславовна', N'loginDEhix2018', N'ZKnd*0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Гущина ', N'Анжела', N'Аркадьевна', N'loginDEwbk2018', N'iJMh5B', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Дмитриев ', N'Григорий', N'Мэлорович', N'loginDEpwa2018', N'yn5MLQ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Дроздова ', N'Фёкла', N'Митрофановна', N'loginDElrx2018', N'lbX+dF', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Гаврилов ', N'Василий', N'Германович', N'loginDEidx2018', N'R2j0mn', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Суханова ', N'Фаина', N'Юрьевна', N'loginDEzmk2018', N'ZrgBk6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Савельев ', N'Егор', N'Сергеевич', N'loginDEvje2018', N'gCU1fd', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Иванов', N'Иванов', N'Васильевич', N'loginDEwun2018', N'yy+Qhe', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Сазонова ', N'Клавдия', N'Евгеньевна', N'loginDEfzq2018', N'36H8f}', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Шаров ', N'Григорий', N'Созонович', N'loginDEwel2018', N'UU5FTi', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Щербаков ', N'Кондрат', N'Фёдорович', N'loginDEljg2018', N'CT44Gc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Дроздов ', N'Дмитрий', N'Юлианович', N'loginDEgsp2018', N'9ACW}r', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Молчанов ', N'Юрий', N'Лукьянович', N'loginDEjvp2018', N'etLGcB', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Тихонов ', N'Валентин', N'Авдеевич', N'loginDEapt2018', N'cwx{RH', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Виноградов ', N'Юрий', N'Лукьевич', N'loginDEilb2018', N'IN2Ahc', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Горбунова ', N'Нинель', N'Сергеевна', N'loginDErch2018', N'|&DFy+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Маслов ', N'Леонид', N'Николаевич', N'loginDEfwx2018', N't|*wCk', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Родионова ', N'Венера', N'Арсеньевна', N'loginDEggp2018', N'bBNxJb', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Агафонов ', N'Пантелеймон', N'Гордеевич', N'loginDEbgb2018', N'VtmP58', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Кудрявцев ', N'Гордей', N'Авксентьевич', N'loginDEnif2018', N'Nhj*t+', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Лыткина ', N'Алевтина', N'Романовна', N'loginDEsvs2018', N'tLgPnC', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Князев ', N'Геласий', N'Евсеевич', N'loginDEghx2018', N'gue+iw', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Бирюкова ', N'Пелагея', N'Дмитрьевна', N'loginDElmy2018', N'X2LtuP', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Быков ', N'Лаврентий', N'Ярославович', N'loginDEevd2018', N'GMbcZN', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Воронов ', N'Олег', N'Яковович', N'loginDEodd2018', N's2|Eb1', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Богданова ', N'Марфа', N'Владимировна', N'loginDEmrj2018', N'blrD&8', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Беляев ', N'Донат', N'Агафонович', N'loginDEyct2018', N'uD+|Ud', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_pickuppoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[pickuppoint] ([pointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_pickuppoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [garipov41] SET  READ_WRITE 
GO
