USE [master]
GO
/****** Object:  Database [Projekt_test_03]    Script Date: 28.03.2022 00:59:48 ******/
CREATE DATABASE [Projekt_test_03]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projekt_test_03', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Projekt_test_03.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projekt_test_03_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Projekt_test_03_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Projekt_test_03] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projekt_test_03].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projekt_test_03] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projekt_test_03] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projekt_test_03] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projekt_test_03] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projekt_test_03] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projekt_test_03] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projekt_test_03] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projekt_test_03] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projekt_test_03] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projekt_test_03] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projekt_test_03] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projekt_test_03] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projekt_test_03] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projekt_test_03] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projekt_test_03] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projekt_test_03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projekt_test_03] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projekt_test_03] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projekt_test_03] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projekt_test_03] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projekt_test_03] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projekt_test_03] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projekt_test_03] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Projekt_test_03] SET  MULTI_USER 
GO
ALTER DATABASE [Projekt_test_03] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projekt_test_03] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projekt_test_03] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projekt_test_03] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projekt_test_03] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Projekt_test_03] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Projekt_test_03] SET QUERY_STORE = OFF
GO
USE [Projekt_test_03]
GO
/****** Object:  UserDefinedFunction [dbo].[AgeOfEmployee]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AgeOfEmployee] (@ColumnName DATE)
RETURNS INT
AS
BEGIN
	
	RETURN datediff(year,@ColumnName,getdate())
END
GO
/****** Object:  UserDefinedFunction [dbo].[HowManyDaysUntil]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HowManyDaysUntil] (@destinedDate DATE)
RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(day,GETDATE(),@destinedDate)
END
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_id] [int] NOT NULL,
	[Amount_payed] [decimal](10, 2) NULL,
	[Payment_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Game_id] [int] NOT NULL,
	[Available_copies] [int] NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[Category] [varchar](50) NULL,
	[Release_year] [date] NULL,
	[Publisher] [varchar](50) NULL,
	[Rating] [int] NULL,
	[Price_with_tax] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_id] [int] NOT NULL,
	[First_name] [varchar](20) NULL,
	[Last_name] [varchar](20) NULL,
	[Date_of_birth] [date] NULL,
	[Active_working] [varchar](3) NULL,
	[ContactInfo_id] [int] NULL,
	[Address_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_id] [int] NOT NULL,
	[First_name] [varchar](20) NULL,
	[Last_name] [varchar](20) NULL,
	[Date_of_birth] [date] NULL,
	[ContactInfo_id] [int] NULL,
	[Address_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[Rental_id] [int] NOT NULL,
	[Rental_date] [date] NULL,
	[Return_date] [date] NULL,
	[Rental_status] [varchar](12) NULL,
	[Payment_id] [int] NULL,
	[Customer_id] [int] NULL,
	[Staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Rental_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalGames]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalGames](
	[Rental_id] [int] NOT NULL,
	[Game_id] [int] NOT NULL,
 CONSTRAINT [RentalGames_id] PRIMARY KEY CLUSTERED 
(
	[Rental_id] ASC,
	[Game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FullRentalInfo]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[FullRentalInfo] AS

SELECT R.Rental_id AS [id_zamowienia], R.Rental_date, R.Rental_status,
	G.Title, P.Amount_payed,
	C.Last_name AS [nazwisko klienta], S.Last_name AS [nazwisko pracownika]
FROM Rental AS [R]
	LEFT OUTER JOIN RentalGames AS [RG] ON R.Rental_id = RG.Rental_id
	LEFT OUTER JOIN Games AS [G] ON G.Game_id = RG.Game_id
	LEFT OUTER JOIN Payment AS [P] ON R.Payment_id = P.Payment_id
	LEFT OUTER JOIN Customers as [C] ON R.Customer_id = C.Customer_id
	LEFT OUTER JOIN Staff as [S] On R.Staff_id = S.Staff_id
GO
/****** Object:  Table [dbo].[GamesReview]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamesReview](
	[Review_description] [varchar](255) NULL,
	[Review_score] [int] NULL,
	[Review_date] [date] NULL,
	[Game_id] [int] NOT NULL,
	[Customer_id] [int] NOT NULL,
 CONSTRAINT [GameReview_id] PRIMARY KEY CLUSTERED 
(
	[Game_id] ASC,
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FullGameReview]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FullGameReview] AS

SELECT G.Title [Tytuł],
	   GR.Review_description [Recenzja gry], Gr.Review_score [Ocena gry],
	   C.First_name [Imię klienta], C.Last_name [Nazwisko klienta]
FROM GamesReview AS [GR]
	INNER JOIN Games AS [G] ON GR.Game_id = G.Game_id
	INNER JOIN Customers AS [C] ON GR.Customer_id = C.Customer_id
GO
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[ContactInfo_id] [int] NOT NULL,
	[Phone_number] [int] NULL,
	[Email_address] [varchar](30) NULL,
	[Last_update] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactInfo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Address_id] [int] NOT NULL,
	[Street] [varchar](30) NULL,
	[Postal_code] [int] NULL,
	[City] [varchar](15) NULL,
	[Country] [varchar](15) NULL,
	[Last_update] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CustomerFullDetail]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CustomerFullDetail] AS

SELECT C.First_name [Imię klienta], C.Last_name [Nazwisko klienta], C.Date_of_birth [Rok urodzenia klienta],
       CI.Phone_number [Telefon], CI.Email_address [E-mail],
	   A.Street [Ulica], A.Postal_code [Kod pocztowy], A.City [Miasto], A.Country [Kraj]
FROM Customers AS [C]
	INNER JOIN Addresses AS [A] ON C.Address_id = A.Address_id
	INNER JOIN ContactInfo AS [CI] ON C.ContactInfo_id = CI.ContactInfo_id
GO
/****** Object:  Table [dbo].[GamesOrdered]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamesOrdered](
	[GameOrdered_id] [int] NOT NULL,
	[Ordered_copies] [int] NULL,
	[Arrival_date] [date] NULL,
	[Order_arrived] [varchar](3) NULL,
	[Last_update] [timestamp] NOT NULL,
	[Game_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameOrdered_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (1, N'ul. Kwiatowa 20', 80180, N'Gdańsk', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (2, N'ul Długa 1', 80801, N'Gdańsk', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (3, N'ul. Niepamiętna 50C', 80846, N'Gdynia', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (4, N'ul. Sienkiewicza 21', 80720, N'Gdańsk', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (5, N'ul. Łąkowa 66', 80801, N'Gdańsk', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (6, N'ul. Zeusa 77', 80180, N'Gdańsk', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (7, N'ul. Kasztanowa 9F', 80611, N'Gdańsk', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (8, N'ul. Wroty 4', 80645, N'Sopot', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (9, N'ul. Nowożytnia 5C', 80758, N'Gdynia', N'Polska')
INSERT [dbo].[Addresses] ([Address_id], [Street], [Postal_code], [City], [Country]) VALUES (10, N'ul. Wypasów', 80837, N'Gdańsk', NULL)
GO
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (1, 393113793, N'Emil.Nowak@gmail.com')
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (2, 800880, NULL)
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (3, 746382647, N'Jan.kowalski@gmail.com')
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (4, 917538294, NULL)
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (5, 927621875, N'Aleksy.Szym@gamergate.pl')
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (6, 793113393, N'Marcin.Kub@gamergate.pl')
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (7, 712857635, N'Andżelika.And@gamergate.pl')
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (8, 375847568, NULL)
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (9, 917385948, N'Liliana.Szc@gamergate.pl')
INSERT [dbo].[ContactInfo] ([ContactInfo_id], [Phone_number], [Email_address]) VALUES (10, 918756387, N'Bogumił.Dąb@gamergate.pl')
GO
INSERT [dbo].[Customers] ([Customer_id], [First_name], [Last_name], [Date_of_birth], [ContactInfo_id], [Address_id]) VALUES (1, N'Marek', N'Krowicki', CAST(N'1989-12-20' AS Date), 2, 2)
INSERT [dbo].[Customers] ([Customer_id], [First_name], [Last_name], [Date_of_birth], [ContactInfo_id], [Address_id]) VALUES (2, N'Alicja', N'Brzeszkot', NULL, 4, 4)
INSERT [dbo].[Customers] ([Customer_id], [First_name], [Last_name], [Date_of_birth], [ContactInfo_id], [Address_id]) VALUES (3, N'Jan', N'Kowalski', CAST(N'1965-03-07' AS Date), 3, 3)
INSERT [dbo].[Customers] ([Customer_id], [First_name], [Last_name], [Date_of_birth], [ContactInfo_id], [Address_id]) VALUES (4, N'Emil', N'Nowak', CAST(N'1989-06-08' AS Date), 1, 1)
INSERT [dbo].[Customers] ([Customer_id], [First_name], [Last_name], [Date_of_birth], [ContactInfo_id], [Address_id]) VALUES (5, N'Danuta', N'Stenka', CAST(N'1961-10-10' AS Date), NULL, 5)
GO
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (1, 20, N'Wiedźmin 3', NULL, N'Action RPG', CAST(N'2015-05-18' AS Date), N'CD Projekt', 9, CAST(95.59 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (2, 0, N'Elden Ring', NULL, N'Action RPG', CAST(N'2022-02-25' AS Date), N'From Software', 10, CAST(314.60 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (3, 34, N'Call of Duty Vanguard', NULL, N'FPS', CAST(N'2021-09-16' AS Date), N'Activision', 5, CAST(240.79 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (4, 39, N'Dark Souls 2', NULL, N'Action RPG', CAST(N'2014-03-11' AS Date), N'From Software', 7, CAST(83.49 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (5, 61, N'Far Cry 3', NULL, N'FPS', CAST(N'2012-11-29' AS Date), N'Ubisoft', 6, CAST(83.49 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (6, 47, N'GTA V', NULL, N'Sandbox', CAST(N'2013-09-17' AS Date), N'Rockstar Games', 9, CAST(199.79 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (7, 25, N'Portal 2', NULL, N'Logiczna', CAST(N'2011-04-18' AS Date), N'Valve', 9, CAST(59.29 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (8, 9, N'Battlefield 3', NULL, N'FPS', CAST(N'2011-10-25' AS Date), N'Electronic Arts', 8, CAST(59.29 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (9, 48, N'Assasin''s Creed 2', NULL, N'Przygodowa', CAST(N'2009-11-17' AS Date), N'Ubisoft', 8, CAST(71.39 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (10, 19, N'Worms 3D', NULL, N'Strategia', CAST(N'2003-10-31' AS Date), N'Team17', 7, CAST(59.29 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([Game_id], [Available_copies], [Title], [Description], [Category], [Release_year], [Publisher], [Rating], [Price_with_tax]) VALUES (11, 0, N'Dying Light 2', NULL, N'Przygodowa', CAST(N'2021-12-07' AS Date), N'Techland', 7, CAST(314.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[GamesOrdered] ([GameOrdered_id], [Ordered_copies], [Arrival_date], [Order_arrived], [Game_id]) VALUES (1, 50, CAST(N'2022-03-01' AS Date), N'YES', 5)
INSERT [dbo].[GamesOrdered] ([GameOrdered_id], [Ordered_copies], [Arrival_date], [Order_arrived], [Game_id]) VALUES (2, 70, CAST(N'2022-04-21' AS Date), N'NO', 2)
INSERT [dbo].[GamesOrdered] ([GameOrdered_id], [Ordered_copies], [Arrival_date], [Order_arrived], [Game_id]) VALUES (3, 70, CAST(N'2022-04-21' AS Date), N'NO', 11)
GO
INSERT [dbo].[GamesReview] ([Review_description], [Review_score], [Review_date], [Game_id], [Customer_id]) VALUES (N'Niesamowity tytuł. Jestem dumny z naszego kraju, że zachód zachwyca się naszą polską produkcją!!', 10, CAST(N'2020-02-20' AS Date), 1, 1)
INSERT [dbo].[GamesReview] ([Review_description], [Review_score], [Review_date], [Game_id], [Customer_id]) VALUES (N'Gra mojego dzieciństwa. Pamiętam, kiedyś to były czasy!', 8, CAST(N'2020-02-27' AS Date), 10, 4)
GO
INSERT [dbo].[Payment] ([Payment_id], [Amount_payed], [Payment_date]) VALUES (1, CAST(240.79 AS Decimal(10, 2)), CAST(N'2022-01-23T15:43:00.000' AS DateTime))
INSERT [dbo].[Payment] ([Payment_id], [Amount_payed], [Payment_date]) VALUES (2, CAST(238.37 AS Decimal(10, 2)), CAST(N'2022-03-07T09:01:00.000' AS DateTime))
INSERT [dbo].[Payment] ([Payment_id], [Amount_payed], [Payment_date]) VALUES (3, CAST(312.18 AS Decimal(10, 2)), CAST(N'2022-02-14T18:23:00.000' AS DateTime))
INSERT [dbo].[Payment] ([Payment_id], [Amount_payed], [Payment_date]) VALUES (4, CAST(83.49 AS Decimal(10, 2)), CAST(N'2021-12-15T09:25:00.000' AS DateTime))
INSERT [dbo].[Payment] ([Payment_id], [Amount_payed], [Payment_date]) VALUES (5, CAST(199.79 AS Decimal(10, 2)), CAST(N'2021-12-27T21:37:00.000' AS DateTime))
GO
INSERT [dbo].[Rental] ([Rental_id], [Rental_date], [Return_date], [Rental_status], [Payment_id], [Customer_id], [Staff_id]) VALUES (1, CAST(N'2022-01-23' AS Date), CAST(N'2022-01-30' AS Date), N'Zakonczony', 1, 3, 2)
INSERT [dbo].[Rental] ([Rental_id], [Rental_date], [Return_date], [Rental_status], [Payment_id], [Customer_id], [Staff_id]) VALUES (2, CAST(N'2022-03-15' AS Date), NULL, N'Aktywny', 2, 3, 1)
INSERT [dbo].[Rental] ([Rental_id], [Rental_date], [Return_date], [Rental_status], [Payment_id], [Customer_id], [Staff_id]) VALUES (3, CAST(N'2022-03-10' AS Date), NULL, N'Po terminie', 3, 2, 2)
INSERT [dbo].[Rental] ([Rental_id], [Rental_date], [Return_date], [Rental_status], [Payment_id], [Customer_id], [Staff_id]) VALUES (4, CAST(N'2021-12-15' AS Date), CAST(N'2021-12-29' AS Date), N'Zakonczony', 4, 1, 3)
INSERT [dbo].[Rental] ([Rental_id], [Rental_date], [Return_date], [Rental_status], [Payment_id], [Customer_id], [Staff_id]) VALUES (5, CAST(N'2021-12-27' AS Date), NULL, N'Po terminie', 5, 4, 4)
GO
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (1, 3)
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (2, 4)
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (2, 5)
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (2, 9)
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (3, 3)
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (3, 9)
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (4, 5)
INSERT [dbo].[RentalGames] ([Rental_id], [Game_id]) VALUES (5, 6)
GO
INSERT [dbo].[Staff] ([Staff_id], [First_name], [Last_name], [Date_of_birth], [Active_working], [ContactInfo_id], [Address_id]) VALUES (1, N'Aleksy', N'Szymański', CAST(N'1994-01-20' AS Date), N'yes', 5, NULL)
INSERT [dbo].[Staff] ([Staff_id], [First_name], [Last_name], [Date_of_birth], [Active_working], [ContactInfo_id], [Address_id]) VALUES (2, N'Marcin', N'Kubicki', CAST(N'1997-12-27' AS Date), N'yes', 6, 6)
INSERT [dbo].[Staff] ([Staff_id], [First_name], [Last_name], [Date_of_birth], [Active_working], [ContactInfo_id], [Address_id]) VALUES (3, N'Bogumił', N'Dąbrowski', CAST(N'1995-09-11' AS Date), N'no', NULL, 8)
INSERT [dbo].[Staff] ([Staff_id], [First_name], [Last_name], [Date_of_birth], [Active_working], [ContactInfo_id], [Address_id]) VALUES (4, N'Andżelika', N'Andrzejewska', CAST(N'1994-12-12' AS Date), N'yes', 7, 7)
INSERT [dbo].[Staff] ([Staff_id], [First_name], [Last_name], [Date_of_birth], [Active_working], [ContactInfo_id], [Address_id]) VALUES (5, N'Liliana', N'Szczepańska', CAST(N'1986-01-01' AS Date), N'yes', 9, 9)
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([Address_id])
REFERENCES [dbo].[Addresses] ([Address_id])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([ContactInfo_id])
REFERENCES [dbo].[ContactInfo] ([ContactInfo_id])
GO
ALTER TABLE [dbo].[GamesOrdered]  WITH CHECK ADD FOREIGN KEY([Game_id])
REFERENCES [dbo].[Games] ([Game_id])
GO
ALTER TABLE [dbo].[GamesReview]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customers] ([Customer_id])
GO
ALTER TABLE [dbo].[GamesReview]  WITH CHECK ADD FOREIGN KEY([Game_id])
REFERENCES [dbo].[Games] ([Game_id])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customers] ([Customer_id])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([Payment_id])
REFERENCES [dbo].[Payment] ([Payment_id])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([Staff_id])
REFERENCES [dbo].[Staff] ([Staff_id])
GO
ALTER TABLE [dbo].[RentalGames]  WITH CHECK ADD FOREIGN KEY([Game_id])
REFERENCES [dbo].[Games] ([Game_id])
GO
ALTER TABLE [dbo].[RentalGames]  WITH CHECK ADD FOREIGN KEY([Rental_id])
REFERENCES [dbo].[Rental] ([Rental_id])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([Address_id])
REFERENCES [dbo].[Addresses] ([Address_id])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([ContactInfo_id])
REFERENCES [dbo].[ContactInfo] ([ContactInfo_id])
GO
/****** Object:  StoredProcedure [dbo].[GetRentalInfo]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRentalInfo] @id INT
AS
  SELECT R.Rental_status,
  S.Last_name AS [Pracownik obslugujacy],
  C.First_name AS [Imie klienta], C.Last_name AS [Nazwisko klienta],
  P.Amount_payed AS [Platnosc], P.Payment_date AS [Data platnosci]
  FROM Rental AS [R]
  INNER JOIN Staff AS [S] ON S.Staff_id = R.Staff_id
  INNER JOIN Customers AS [C] ON C.Customer_id = R.Customer_id
  INNER JOIN Payment AS [P] ON P.Payment_id = R.Payment_id
  WHERE R.Rental_id = @id 
GO
/****** Object:  StoredProcedure [dbo].[UpdateAvailableCopies]    Script Date: 28.03.2022 00:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateAvailableCopies] (@game_id INT, @copies INT)
AS
	UPDATE Games
	  SET Available_copies = @copies
	  FROM Games
	  WHERE Game_id = @game_id
GO
USE [master]
GO
ALTER DATABASE [Projekt_test_03] SET  READ_WRITE 
GO
