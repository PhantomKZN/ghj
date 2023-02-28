USE [master]
GO
/****** Object:  Database [bz1]    Script Date: 28.02.2023 17:06:28 ******/
CREATE DATABASE [bz1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bz1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bz1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bz1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bz1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bz1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bz1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bz1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bz1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bz1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bz1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bz1] SET ARITHABORT OFF 
GO
ALTER DATABASE [bz1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bz1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bz1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bz1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bz1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bz1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bz1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bz1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bz1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bz1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bz1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bz1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bz1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bz1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bz1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bz1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bz1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bz1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bz1] SET  MULTI_USER 
GO
ALTER DATABASE [bz1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bz1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bz1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bz1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bz1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bz1] SET QUERY_STORE = OFF
GO
USE [bz1]
GO
/****** Object:  Table [dbo].[role]    Script Date: 28.02.2023 17:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id_role] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 28.02.2023 17:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id_user] [int] NOT NULL,
	[id_role] [int] NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[patronymic] [varchar](50) NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[role] ([id_role], [name]) VALUES (1, N'Руководитель отдела по работе с клиентами')
INSERT [dbo].[role] ([id_role], [name]) VALUES (2, N'Менеджер по работе с клиентами')
INSERT [dbo].[role] ([id_role], [name]) VALUES (3, N'Руководитель отдела технической поддержки')
INSERT [dbo].[role] ([id_role], [name]) VALUES (4, N'Специалист технической поддержки')
INSERT [dbo].[role] ([id_role], [name]) VALUES (5, N'Бухгалтер')
INSERT [dbo].[role] ([id_role], [name]) VALUES (6, N'Директор по развитию')
INSERT [dbo].[role] ([id_role], [name]) VALUES (7, N'Сотрудник технического департамента')
INSERT [dbo].[user] ([id_user], [id_role], [surname], [name], [patronymic], [login], [password]) VALUES (1, 3, N'Лоскутов', N'Ильназ', N'Радикович', N'89456', N'1111')
INSERT [dbo].[user] ([id_user], [id_role], [surname], [name], [patronymic], [login], [password]) VALUES (2, 4, N'Мадирова', N'Айгуль', N'Эдгарович', N'89234', N'1111')
INSERT [dbo].[user] ([id_user], [id_role], [surname], [name], [patronymic], [login], [password]) VALUES (3, 1, N'Гайфиев', N'Шайтан', N'Иванович', N'89345', N'1111')
INSERT [dbo].[user] ([id_user], [id_role], [surname], [name], [patronymic], [login], [password]) VALUES (4, 5, N'Власов', N'Айнур', N'Никитович', N'89354', N'1111')
INSERT [dbo].[user] ([id_user], [id_role], [surname], [name], [patronymic], [login], [password]) VALUES (5, 2, N'Афанасьева', N'Эльмира', N'Иванович', N'89452', N'1111')
INSERT [dbo].[user] ([id_user], [id_role], [surname], [name], [patronymic], [login], [password]) VALUES (6, 7, N'Курочкин', N'Никита', N'Айнурович', N'89453', N'1111')
INSERT [dbo].[user] ([id_user], [id_role], [surname], [name], [patronymic], [login], [password]) VALUES (7, 6, N'Ушаков', N'Иван', N'Ильназович', N'89242', N'2222')
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_role] FOREIGN KEY([id_role])
REFERENCES [dbo].[role] ([id_role])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_role]
GO
USE [master]
GO
ALTER DATABASE [bz1] SET  READ_WRITE 
GO
