USE [master]
GO
/****** Object:  Database [ProkatAvto]    Script Date: 21.11.2022 12:40:10 ******/
CREATE DATABASE [ProkatAvto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProkatAvto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProkatAvto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProkatAvto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProkatAvto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProkatAvto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProkatAvto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProkatAvto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProkatAvto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProkatAvto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProkatAvto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProkatAvto] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProkatAvto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProkatAvto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProkatAvto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProkatAvto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProkatAvto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProkatAvto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProkatAvto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProkatAvto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProkatAvto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProkatAvto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProkatAvto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProkatAvto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProkatAvto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProkatAvto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProkatAvto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProkatAvto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProkatAvto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProkatAvto] SET RECOVERY FULL 
GO
ALTER DATABASE [ProkatAvto] SET  MULTI_USER 
GO
ALTER DATABASE [ProkatAvto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProkatAvto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProkatAvto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProkatAvto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProkatAvto] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProkatAvto', N'ON'
GO
ALTER DATABASE [ProkatAvto] SET QUERY_STORE = OFF
GO
USE [ProkatAvto]
GO
/****** Object:  Table [dbo].[Автомобили]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Автомобили](
	[КодАвтомобиля] [int] IDENTITY(1,1) NOT NULL,
	[КодТарифа] [int] NOT NULL,
	[КодМарки] [int] NOT NULL,
	[Модель] [nvarchar](50) NOT NULL,
	[КодКПП] [int] NOT NULL,
	[ГодВыпуска] [date] NOT NULL,
	[Госномер] [nvarchar](20) NOT NULL,
	[СтоимостьАрендыВМинуту] [float] NOT NULL,
	[СтоимостьАрендыВЧас] [float] NOT NULL,
	[СтоимостьАрендыВСутки] [float] NOT NULL,
	[ФотоАвтомобиля] [nvarchar](40) NOT NULL,
	[Статус] [bit] NOT NULL,
 CONSTRAINT [PK_Автомобили] PRIMARY KEY CLUSTERED 
(
	[КодАвтомобиля] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[АрендованныеАвто]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[АрендованныеАвто](
	[КодАренды] [int] IDENTITY(1,1) NOT NULL,
	[КодКлиента] [int] NOT NULL,
	[КодАвтомобиля] [int] NOT NULL,
	[Дата_Время_Выдачи] [datetime] NOT NULL,
	[Дата_Время_Возврата] [datetime] NOT NULL,
	[СуммаЗаАренду] [float] NOT NULL,
	[КодСкидки] [int] NULL,
	[КодНарушения] [int] NULL,
	[ИтоговаяСумма] [float] NOT NULL,
 CONSTRAINT [PK_АрендованныеАвто] PRIMARY KEY CLUSTERED 
(
	[КодАренды] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ВходПользователи]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ВходПользователи](
	[КодПользователя] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ВходПользователи] PRIMARY KEY CLUSTERED 
(
	[КодПользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[МаркиАвтомобиля]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[МаркиАвтомобиля](
	[КодМарки] [int] NOT NULL,
	[НаименованиеМаркиАвто] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_МаркиАвтомобиля] PRIMARY KEY CLUSTERED 
(
	[КодМарки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СистемаШтрафов]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СистемаШтрафов](
	[КодШтрафа] [int] IDENTITY(1,1) NOT NULL,
	[НаименованиеШтрафа] [nvarchar](100) NOT NULL,
	[СуммаШтрафа] [float] NOT NULL,
 CONSTRAINT [PK_СистемаШтрафов] PRIMARY KEY CLUSTERED 
(
	[КодШтрафа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Скидка]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Скидка](
	[КодСкидки] [int] IDENTITY(1,1) NOT NULL,
	[НаименованиеСкидки] [nvarchar](50) NOT NULL,
	[Процент] [float] NOT NULL,
 CONSTRAINT [PK_Скидка] PRIMARY KEY CLUSTERED 
(
	[КодСкидки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТипАвтомобиля]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТипАвтомобиля](
	[КодТарифа] [int] NOT NULL,
	[НаименованиеТарифаАвто] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ТипАвтомобиля] PRIMARY KEY CLUSTERED 
(
	[КодТарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТипКПП]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТипКПП](
	[КодКПП] [int] NOT NULL,
	[НаименованиеТипаКПП] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ТипКПП] PRIMARY KEY CLUSTERED 
(
	[КодКПП] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Штрафы]    Script Date: 21.11.2022 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Штрафы](
	[КодНарушения] [int] IDENTITY(1,1) NOT NULL,
	[КодАренды] [int] NOT NULL,
	[КодШтрафа] [int] NOT NULL,
 CONSTRAINT [PK_Штрафы] PRIMARY KEY CLUSTERED 
(
	[КодНарушения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Автомобили] ON 

INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (1, 1, 1, N'Polo', 2, CAST(N'2010-01-01' AS Date), N'У001НВ116', 12.23, 400, 3699, N'Polo_1.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (2, 1, 1, N'Polo', 2, CAST(N'2011-01-01' AS Date), N'У002НВ116', 12.23, 400, 3699, N'Polo_2.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (3, 1, 1, N'Polo', 2, CAST(N'2012-01-01' AS Date), N'У003НВ116', 12.23, 400, 3699, N'Polo_3.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (4, 1, 1, N'Polo', 2, CAST(N'2014-01-01' AS Date), N'У004НВ99', 13.03, 510, 4000, N'Polo_4.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (5, 1, 1, N'Polo', 2, CAST(N'2018-01-01' AS Date), N'У005НВ777', 13.33, 520, 4100, N'Polo_5.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (6, 2, 1, N'Tiguan', 2, CAST(N'2017-01-01' AS Date), N'Т600ОН116', 13.93, 550, 5390, N'Tiguan_6.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (7, 2, 1, N'Tiguan', 2, CAST(N'2019-01-01' AS Date), N'Т601ОН116', 13.93, 550, 5390, N'Tiguan_7.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (8, 1, 2, N'Solaris', 2, CAST(N'2011-01-01' AS Date), N'К100ЕН116', 12.23, 400, 3699, N'Solaris_8.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (9, 1, 2, N'Solaris', 2, CAST(N'2014-01-01' AS Date), N'К101ЕН116', 12.23, 510, 3699, N'Solaris_9.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (10, 1, 2, N'Solaris', 2, CAST(N'2014-01-01' AS Date), N'К102ЕН116', 12.23, 600, 3699, N'Solaris_10.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (11, 1, 3, N'Rio', 2, CAST(N'2015-01-01' AS Date), N'В200АК116', 12.33, 410, 3699, N'Rio_11.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (12, 1, 3, N'Sportage', 2, CAST(N'2015-01-01' AS Date), N'В201АК116', 13.9, 550, 4548, N'Sportage_12.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (13, 2, 4, N'Qashqai', 2, CAST(N'2017-01-01' AS Date), N'М250ОУ199', 12.7, 455, 4391, N'Qashqai_13.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (14, 2, 4, N'Qashqai', 2, CAST(N'2018-01-01' AS Date), N'М251ОУ199', 12.7, 455, 4391, N'Qashqai_14.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (15, 2, 4, N'Qashqai', 2, CAST(N'2018-01-01' AS Date), N'М252ОУ199', 12.7, 455, 4391, N'Qashqai_15.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (16, 2, 5, N'Cooper 5D', 2, CAST(N'2016-01-01' AS Date), N'Т750УХ99', 13.93, 550, 5390, N'Cooper_16.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (17, 2, 5, N'Cooper 3D', 2, CAST(N'2016-01-01' AS Date), N'Т751УХ99', 13.94, 550, 5390, N'Cooper_17.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (18, 3, 6, N'320i', 2, CAST(N'2017-01-01' AS Date), N'С101ТС777', 14.33, 600, 5390, N'320i_18.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (19, 3, 6, N'320i', 2, CAST(N'2018-01-01' AS Date), N'С202ТС777', 14.34, 600, 5390, N'320i_19.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (20, 3, 6, N'320i', 2, CAST(N'2019-01-01' AS Date), N'С303ТС77', 14.35, 600, 5390, N'320i_20.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (21, 3, 7, N'GLC 250', 2, CAST(N'2018-01-01' AS Date), N'М909ОР99', 20.03, 850, 8649, N'GLC 250_21.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (22, 3, 7, N'E 200', 2, CAST(N'2018-01-01' AS Date), N'М777ОН77', 20.03, 850, 8649, N'E 200_22.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (23, 3, 7, N'E 200', 2, CAST(N'2021-01-01' AS Date), N'В116УХ116', 20.03, 850, 8649, N'E 200_23.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (24, 4, 8, N'Transit', 1, CAST(N'2019-01-01' AS Date), N'С001МК116', 10, 550, 4590, N'Transit_24.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (25, 4, 8, N'Transit', 1, CAST(N'2019-01-01' AS Date), N'С002МК116', 10, 550, 4590, N'Transit_25.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (26, 4, 8, N'Transit', 1, CAST(N'2019-01-01' AS Date), N'С003МК116', 10, 550, 4590, N'Transit_26.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (27, 4, 8, N'Transit', 1, CAST(N'2019-01-01' AS Date), N'С004МК116', 10, 550, 4590, N'Transit_27.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (28, 4, 8, N'Transit', 1, CAST(N'2019-01-01' AS Date), N'С005МК116', 10, 550, 4590, N'Transit_28.png', 1)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (29, 4, 8, N'Transit', 1, CAST(N'2019-01-01' AS Date), N'С006МК116', 10, 550, 4590, N'Transit_29.png', 0)
INSERT [dbo].[Автомобили] ([КодАвтомобиля], [КодТарифа], [КодМарки], [Модель], [КодКПП], [ГодВыпуска], [Госномер], [СтоимостьАрендыВМинуту], [СтоимостьАрендыВЧас], [СтоимостьАрендыВСутки], [ФотоАвтомобиля], [Статус]) VALUES (30, 5, 9, N'Model 3', 1, CAST(N'2021-01-01' AS Date), N'М111ОВ77', 49, 2000, 16149, N'Model 3_30.png', 0)
SET IDENTITY_INSERT [dbo].[Автомобили] OFF
SET IDENTITY_INSERT [dbo].[АрендованныеАвто] ON 

INSERT [dbo].[АрендованныеАвто] ([КодАренды], [КодКлиента], [КодАвтомобиля], [Дата_Время_Выдачи], [Дата_Время_Возврата], [СуммаЗаАренду], [КодСкидки], [КодНарушения], [ИтоговаяСумма]) VALUES (101, 1, 5, CAST(N'2022-07-12T12:20:00.000' AS DateTime), CAST(N'2022-07-13T12:20:00.000' AS DateTime), 4100, 1, NULL, 3690)
INSERT [dbo].[АрендованныеАвто] ([КодАренды], [КодКлиента], [КодАвтомобиля], [Дата_Время_Выдачи], [Дата_Время_Возврата], [СуммаЗаАренду], [КодСкидки], [КодНарушения], [ИтоговаяСумма]) VALUES (102, 2, 11, CAST(N'2022-07-12T13:00:00.000' AS DateTime), CAST(N'2022-07-12T14:00:00.000' AS DateTime), 410, NULL, NULL, 410)
INSERT [dbo].[АрендованныеАвто] ([КодАренды], [КодКлиента], [КодАвтомобиля], [Дата_Время_Выдачи], [Дата_Время_Возврата], [СуммаЗаАренду], [КодСкидки], [КодНарушения], [ИтоговаяСумма]) VALUES (103, 4, 24, CAST(N'2022-07-13T10:00:00.000' AS DateTime), CAST(N'2022-07-14T10:00:00.000' AS DateTime), 4590, NULL, 1, 14590)
INSERT [dbo].[АрендованныеАвто] ([КодАренды], [КодКлиента], [КодАвтомобиля], [Дата_Время_Выдачи], [Дата_Время_Возврата], [СуммаЗаАренду], [КодСкидки], [КодНарушения], [ИтоговаяСумма]) VALUES (104, 8, 6, CAST(N'2022-07-15T17:00:00.000' AS DateTime), CAST(N'2022-07-15T19:00:00.000' AS DateTime), 1100, 3, NULL, 1100)
INSERT [dbo].[АрендованныеАвто] ([КодАренды], [КодКлиента], [КодАвтомобиля], [Дата_Время_Выдачи], [Дата_Время_Возврата], [СуммаЗаАренду], [КодСкидки], [КодНарушения], [ИтоговаяСумма]) VALUES (105, 7, 18, CAST(N'2022-07-19T14:00:00.000' AS DateTime), CAST(N'2022-07-19T18:00:00.000' AS DateTime), 1800, NULL, 1, 101800)
INSERT [dbo].[АрендованныеАвто] ([КодАренды], [КодКлиента], [КодАвтомобиля], [Дата_Время_Выдачи], [Дата_Время_Возврата], [СуммаЗаАренду], [КодСкидки], [КодНарушения], [ИтоговаяСумма]) VALUES (106, 2, 25, CAST(N'2022-10-20T00:00:00.000' AS DateTime), CAST(N'2022-10-20T00:00:00.000' AS DateTime), 1000, 2, NULL, 0)
INSERT [dbo].[АрендованныеАвто] ([КодАренды], [КодКлиента], [КодАвтомобиля], [Дата_Время_Выдачи], [Дата_Время_Возврата], [СуммаЗаАренду], [КодСкидки], [КодНарушения], [ИтоговаяСумма]) VALUES (113, 20, 2, CAST(N'2022-10-26T00:00:00.000' AS DateTime), CAST(N'2022-11-26T00:00:00.000' AS DateTime), 3699, 1, NULL, 3300)
SET IDENTITY_INSERT [dbo].[АрендованныеАвто] OFF
SET IDENTITY_INSERT [dbo].[ВходПользователи] ON 

INSERT [dbo].[ВходПользователи] ([КодПользователя], [Логин], [Пароль]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[ВходПользователи] ([КодПользователя], [Логин], [Пароль]) VALUES (2, N'client', N'client')
SET IDENTITY_INSERT [dbo].[ВходПользователи] OFF
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (1, N'Volkswagen')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (2, N'Hyundai')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (3, N'Kia')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (4, N'Nissan')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (5, N'Mini ')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (6, N'BMW')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (7, N'Mercedes')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (8, N'Ford')
INSERT [dbo].[МаркиАвтомобиля] ([КодМарки], [НаименованиеМаркиАвто]) VALUES (9, N'Tesla')
SET IDENTITY_INSERT [dbo].[СистемаШтрафов] ON 

INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (1, N'Загрязнение салона и курение ', 2000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (2, N'Если водитель утратил топливную карту либо другие документы', 4000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (3, N'За оклейку салона, порчу товарного знака и любое другое незначительное внешнее повреждение', 5000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (4, N'Документы, не предоставленные в срок', 10000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (5, N'Парковка в запрещенном месте', 10000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (6, N'Взлом блокирующей системы', 40000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (7, N'Передача управления другому лицу', 50000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (8, N'Вождение в нетрезвом виде ', 50000)
INSERT [dbo].[СистемаШтрафов] ([КодШтрафа], [НаименованиеШтрафа], [СуммаШтрафа]) VALUES (9, N'За неаккуратное вождение (включая дрифт)', 100000)
SET IDENTITY_INSERT [dbo].[СистемаШтрафов] OFF
SET IDENTITY_INSERT [dbo].[Скидка] ON 

INSERT [dbo].[Скидка] ([КодСкидки], [НаименованиеСкидки], [Процент]) VALUES (1, N'Первая поездка', 10)
INSERT [dbo].[Скидка] ([КодСкидки], [НаименованиеСкидки], [Процент]) VALUES (2, N'Каждая третья поездка', 7)
INSERT [dbo].[Скидка] ([КодСкидки], [НаименованиеСкидки], [Процент]) VALUES (3, N'Поездки без штрафов', 5)
SET IDENTITY_INSERT [dbo].[Скидка] OFF
INSERT [dbo].[ТипАвтомобиля] ([КодТарифа], [НаименованиеТарифаАвто]) VALUES (1, N'Эконом')
INSERT [dbo].[ТипАвтомобиля] ([КодТарифа], [НаименованиеТарифаАвто]) VALUES (2, N'Комфорт')
INSERT [dbo].[ТипАвтомобиля] ([КодТарифа], [НаименованиеТарифаАвто]) VALUES (3, N'Бизнес')
INSERT [dbo].[ТипАвтомобиля] ([КодТарифа], [НаименованиеТарифаАвто]) VALUES (4, N'Грузовой')
INSERT [dbo].[ТипАвтомобиля] ([КодТарифа], [НаименованиеТарифаАвто]) VALUES (5, N'Электро')
INSERT [dbo].[ТипКПП] ([КодКПП], [НаименованиеТипаКПП]) VALUES (1, N'Механическая')
INSERT [dbo].[ТипКПП] ([КодКПП], [НаименованиеТипаКПП]) VALUES (2, N'Автоматическая')
SET IDENTITY_INSERT [dbo].[Штрафы] ON 

INSERT [dbo].[Штрафы] ([КодНарушения], [КодАренды], [КодШтрафа]) VALUES (1, 101, 2)
INSERT [dbo].[Штрафы] ([КодНарушения], [КодАренды], [КодШтрафа]) VALUES (2, 105, 9)
INSERT [dbo].[Штрафы] ([КодНарушения], [КодАренды], [КодШтрафа]) VALUES (3, 103, 5)
SET IDENTITY_INSERT [dbo].[Штрафы] OFF
ALTER TABLE [dbo].[Автомобили]  WITH CHECK ADD  CONSTRAINT [FK_Автомобили_МаркиАвтомобиля1] FOREIGN KEY([КодМарки])
REFERENCES [dbo].[МаркиАвтомобиля] ([КодМарки])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Автомобили] CHECK CONSTRAINT [FK_Автомобили_МаркиАвтомобиля1]
GO
ALTER TABLE [dbo].[Автомобили]  WITH CHECK ADD  CONSTRAINT [FK_Автомобили_ТипАвтомобиля] FOREIGN KEY([КодТарифа])
REFERENCES [dbo].[ТипАвтомобиля] ([КодТарифа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Автомобили] CHECK CONSTRAINT [FK_Автомобили_ТипАвтомобиля]
GO
ALTER TABLE [dbo].[Автомобили]  WITH CHECK ADD  CONSTRAINT [FK_Автомобили_ТипКПП] FOREIGN KEY([КодКПП])
REFERENCES [dbo].[ТипКПП] ([КодКПП])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Автомобили] CHECK CONSTRAINT [FK_Автомобили_ТипКПП]
GO
ALTER TABLE [dbo].[АрендованныеАвто]  WITH CHECK ADD  CONSTRAINT [FK_АрендованныеАвто_Автомобили] FOREIGN KEY([КодАвтомобиля])
REFERENCES [dbo].[Автомобили] ([КодАвтомобиля])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[АрендованныеАвто] CHECK CONSTRAINT [FK_АрендованныеАвто_Автомобили]
GO
ALTER TABLE [dbo].[АрендованныеАвто]  WITH CHECK ADD  CONSTRAINT [FK_АрендованныеАвто_Скидка] FOREIGN KEY([КодСкидки])
REFERENCES [dbo].[Скидка] ([КодСкидки])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[АрендованныеАвто] CHECK CONSTRAINT [FK_АрендованныеАвто_Скидка]
GO
ALTER TABLE [dbo].[АрендованныеАвто]  WITH CHECK ADD  CONSTRAINT [FK_АрендованныеАвто_Штрафы] FOREIGN KEY([КодНарушения])
REFERENCES [dbo].[Штрафы] ([КодНарушения])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[АрендованныеАвто] CHECK CONSTRAINT [FK_АрендованныеАвто_Штрафы]
GO
ALTER TABLE [dbo].[Штрафы]  WITH CHECK ADD  CONSTRAINT [FK_Штрафы_СистемаШтрафов1] FOREIGN KEY([КодШтрафа])
REFERENCES [dbo].[СистемаШтрафов] ([КодШтрафа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Штрафы] CHECK CONSTRAINT [FK_Штрафы_СистемаШтрафов1]
GO
USE [master]
GO
ALTER DATABASE [ProkatAvto] SET  READ_WRITE 
GO
