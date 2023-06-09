USE [master]
GO
/****** Object:  Database [DAI-Pizzas]    Script Date: 17/3/2023 11:44:00 ******/
CREATE DATABASE [DAI-Pizzas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DAI-Pizzas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DAI-Pizzas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DAI-Pizzas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DAI-Pizzas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DAI-Pizzas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DAI-Pizzas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DAI-Pizzas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET ARITHABORT OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DAI-Pizzas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DAI-Pizzas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DAI-Pizzas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DAI-Pizzas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET RECOVERY FULL 
GO
ALTER DATABASE [DAI-Pizzas] SET  MULTI_USER 
GO
ALTER DATABASE [DAI-Pizzas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DAI-Pizzas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DAI-Pizzas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DAI-Pizzas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DAI-Pizzas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DAI-Pizzas', N'ON'
GO
ALTER DATABASE [DAI-Pizzas] SET QUERY_STORE = OFF
GO
USE [DAI-Pizzas]
GO
/****** Object:  User [Pizzas]    Script Date: 17/3/2023 11:44:00 ******/
CREATE USER [Pizzas] FOR LOGIN [Pizzas] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 17/3/2023 11:44:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Pizzas]
GO
/****** Object:  Table [dbo].[Pizzas]    Script Date: 17/3/2023 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizzas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[LibreGluten] [bit] NULL,
	[Importe] [float] NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Pizzas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pizzas] ON 

INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (1, N'Muzzarella', 0, 200, N'Clasico')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (2, N'Fugazzeta', 0, 170, N'Cebolla y Queso')
INSERT [dbo].[Pizzas] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (3, N'Napolitana', 0, 250, N'Jamon y Tomate')
SET IDENTITY_INSERT [dbo].[Pizzas] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteById]    Script Date: 17/3/2023 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteById]
@pId int
AS
BEGIN
DELETE FROM Pizzas
WHERE Id = @pId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 17/3/2023 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetAll]
AS
BEGIN
SELECT *
from Pizzas
END
GO
/****** Object:  StoredProcedure [dbo].[GetById]    Script Date: 17/3/2023 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetById]
@pId int
AS
BEGIN
SELECT *
from Pizzas
WHERE Id = @pId
END
GO
/****** Object:  StoredProcedure [dbo].[Insert]    Script Date: 17/3/2023 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Insert]
@pNombre varchar(150),
@pLibreGluten bit,
@pImporte float,
@pDescripcion varchar(MAX)
AS
BEGIN
INSERT INTO Pizzas (Nombre, LibreGluten, Importe, Descripcion)
VALUES (@pNombre, @pLibreGluten, @pImporte, @pDescripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateById]    Script Date: 17/3/2023 11:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateById]
@pNombre varchar(150),
@pLibreGluten bit,
@pImporte float,
@pDescripcion varchar(MAX),
@pId int
AS
BEGIN
UPDATE Pizzas
SET Nombre = @pNombre, LibreGluten = @pLibreGluten, Importe = @pImporte, Descripcion = @pDescripcion
WHERE Id = @pId
END
GO
USE [master]
GO
ALTER DATABASE [DAI-Pizzas] SET  READ_WRITE 
GO
