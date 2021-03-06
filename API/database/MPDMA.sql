USE [MPDMA]
GO
/****** Object:  Table [dbo].[MotionPictures]    Script Date: 5/1/2021 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MotionPictures]') AND type in (N'U'))
DROP TABLE [dbo].[MotionPictures]
GO
USE [master]
GO
/****** Object:  Database [MPDMA]    Script Date: 5/1/2021 3:16:05 PM ******/
DROP DATABASE [MPDMA]
GO
/****** Object:  Database [MPDMA]    Script Date: 5/1/2021 3:16:05 PM ******/
CREATE DATABASE [MPDMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MPDMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MPDMA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MPDMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MPDMA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MPDMA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MPDMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MPDMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MPDMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MPDMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MPDMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MPDMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [MPDMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MPDMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MPDMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MPDMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MPDMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MPDMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MPDMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MPDMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MPDMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MPDMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MPDMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MPDMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MPDMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MPDMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MPDMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MPDMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MPDMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MPDMA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MPDMA] SET  MULTI_USER 
GO
ALTER DATABASE [MPDMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MPDMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MPDMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MPDMA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MPDMA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MPDMA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MPDMA] SET QUERY_STORE = OFF
GO
USE [MPDMA]
GO
/****** Object:  Table [dbo].[MotionPictures]    Script Date: 5/1/2021 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotionPictures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
	[release_year] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_MotionPictures] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MotionPictures] ON 

INSERT [dbo].[MotionPictures] ([id], [name], [description], [release_year], [active]) VALUES (1, N'Galaxy Quest', N'The alumni cast of a space opera television series have to play their roles as the real thing when an alien race needs their help. However, they also have to defend both Earth and the alien race from a reptilian warlord.', 1999, 1)
INSERT [dbo].[MotionPictures] ([id], [name], [description], [release_year], [active]) VALUES (2, N'Back to the Future', N'Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.', 1985, 1)
INSERT [dbo].[MotionPictures] ([id], [name], [description], [release_year], [active]) VALUES (3, N'Se7en', N'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', 1995, 1)
INSERT [dbo].[MotionPictures] ([id], [name], [description], [release_year], [active]) VALUES (4, N'Stowaway', N'A three-person crew on a mission to Mars faces an impossible choice when an unplanned passenger jeopardizes the lives of everyone on board.', 2021, 1)
INSERT [dbo].[MotionPictures] ([id], [name], [description], [release_year], [active]) VALUES (5, N'The Emperor''s New Groove', N'Emperor Kuzco is turned into a llama by his ex-administrator Yzma, and must now regain his throne with the help of Pacha, the gentle llama herder.', 2000, 1)
INSERT [dbo].[MotionPictures] ([id], [name], [description], [release_year], [active]) VALUES (6, N'The Dark Knight', N'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 2008, 1)
INSERT [dbo].[MotionPictures] ([id], [name], [description], [release_year], [active]) VALUES (7, N'The Princess Bride', N'While home sick in bed, a young boy''s grandfather reads him the story of a farmboy-turned-pirate who encounters numerous obstacles, enemies and allies in his quest to be reunited with his true love.', 1987, 1)
SET IDENTITY_INSERT [dbo].[MotionPictures] OFF
GO
USE [master]
GO
ALTER DATABASE [MPDMA] SET  READ_WRITE 
GO
