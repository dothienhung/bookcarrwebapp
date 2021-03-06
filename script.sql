USE [master]
GO
/****** Object:  Database [Car_Park]    Script Date: 11/03/2020 10:04:06 PM ******/
CREATE DATABASE [Car_Park]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Car_Park', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Car_Park.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Car_Park_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Car_Park_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Car_Park] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Car_Park].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Car_Park] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Car_Park] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Car_Park] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Car_Park] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Car_Park] SET ARITHABORT OFF 
GO
ALTER DATABASE [Car_Park] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Car_Park] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Car_Park] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Car_Park] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Car_Park] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Car_Park] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Car_Park] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Car_Park] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Car_Park] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Car_Park] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Car_Park] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Car_Park] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Car_Park] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Car_Park] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Car_Park] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Car_Park] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Car_Park] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Car_Park] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Car_Park] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Car_Park] SET  MULTI_USER 
GO
ALTER DATABASE [Car_Park] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Car_Park] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Car_Park] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Car_Park] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Car_Park]
GO
/****** Object:  Table [dbo].[Bookingoffice]    Script Date: 11/03/2020 10:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bookingoffice](
	[officeId] [bigint] IDENTITY(1,1) NOT NULL,
	[endContractDeadline] [date] NOT NULL,
	[officeName] [varchar](50) NOT NULL,
	[officePhone] [varchar](50) NOT NULL,
	[officePlace] [varchar](50) NOT NULL,
	[officePrice] [bigint] NOT NULL,
	[startContractDeadline] [date] NOT NULL,
	[tripId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[officeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Car]    Script Date: 11/03/2020 10:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[licensePlate] [varchar](50) NOT NULL,
	[carColor] [varchar](50) NULL,
	[carType] [varchar](50) NULL,
	[company] [varchar](50) NOT NULL,
	[parkId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[licensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/03/2020 10:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeId] [bigint] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[department] [varchar](50) NOT NULL,
	[employeeAddress] [varchar](50) NULL,
	[employeeBirthdate] [date] NOT NULL,
	[employeeEmail] [varchar](50) NULL,
	[employeeName] [varchar](50) NOT NULL,
	[employeePhone] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[sex] [bit] NOT NULL,
	[admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parkinglot]    Script Date: 11/03/2020 10:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parkinglot](
	[parkId] [bigint] IDENTITY(1,1) NOT NULL,
	[parkArea] [bigint] NOT NULL,
	[parkName] [varchar](50) NOT NULL,
	[parkPlace] [varchar](50) NOT NULL,
	[parkPrice] [bigint] NOT NULL,
	[parkStatus] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[parkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/03/2020 10:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[ticketId] [bigint] IDENTITY(1,1) NOT NULL,
	[bookingTime] [time](7) NOT NULL,
	[customerName] [varchar](50) NOT NULL,
	[licensePlate] [varchar](50) NOT NULL,
	[tripId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ticketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 11/03/2020 10:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trip](
	[tripId] [bigint] IDENTITY(1,1) NOT NULL,
	[bookedTicketNumber] [int] NOT NULL,
	[carType] [varchar](50) NOT NULL,
	[departureDate] [date] NOT NULL,
	[departureTime] [time](7) NOT NULL,
	[destination] [varchar](50) NOT NULL,
	[driver] [varchar](50) NOT NULL,
	[maximumOnlineTicketNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bookingoffice] ON 

INSERT [dbo].[Bookingoffice] ([officeId], [endContractDeadline], [officeName], [officePhone], [officePlace], [officePrice], [startContractDeadline], [tripId]) VALUES (1, CAST(0xD5400B00 AS Date), N'Hoang Ha', N'0915489796', N'Quay so 1', 100000, CAST(0xC53F0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Bookingoffice] OFF
INSERT [dbo].[Car] ([licensePlate], [carColor], [carType], [company], [parkId]) VALUES (N'29A-1234', N'Blue', N'HUYNDAI', N'Phuong Trang', 1)
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([employeeId], [account], [department], [employeeAddress], [employeeBirthdate], [employeeEmail], [employeeName], [employeePhone], [password], [sex], [admin]) VALUES (1, N'ducnq', N'employee', N'Ha Noi ', CAST(0x69210B00 AS Date), N'duc', N'Nguyen Quang Duc', N'0912711339', N'123', 1, 1)
INSERT [dbo].[Employee] ([employeeId], [account], [department], [employeeAddress], [employeeBirthdate], [employeeEmail], [employeeName], [employeePhone], [password], [sex], [admin]) VALUES (2, N'tiennm', N'parking', N'10, Tr&#7847;n Duy H&#432;ng', CAST(0x69200B00 AS Date), N'tien', N'Nguyen Manh Tien', N'0982515705', N'1', 1, 0)
INSERT [dbo].[Employee] ([employeeId], [account], [department], [employeeAddress], [employeeBirthdate], [employeeEmail], [employeeName], [employeePhone], [password], [sex], [admin]) VALUES (3, N'tungns', N'parking', N'10, Tr&#7847;n Duy H&#432;ng', CAST(0xCD400B00 AS Date), N'tung', N'Nguyen Son Tung', N'011223122', N'123', 0, 0)
INSERT [dbo].[Employee] ([employeeId], [account], [department], [employeeAddress], [employeeBirthdate], [employeeEmail], [employeeName], [employeePhone], [password], [sex], [admin]) VALUES (4, N'toanlv', N'parking', N'Binh Duong', CAST(0xB81A0B00 AS Date), N'toan', N'Le Van Toan', N'0911233654', N'1', 0, 0)
INSERT [dbo].[Employee] ([employeeId], [account], [department], [employeeAddress], [employeeBirthdate], [employeeEmail], [employeeName], [employeePhone], [password], [sex], [admin]) VALUES (5, N'chieumv', N'service', N'Hai Duong', CAST(0x62200B00 AS Date), N'chieu', N'Mai Van Chieu', N'05879663315', N'123', 0, 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Parkinglot] ON 

INSERT [dbo].[Parkinglot] ([parkId], [parkArea], [parkName], [parkPlace], [parkPrice], [parkStatus]) VALUES (1, 20, N'Bai so 1', N'Khu Dong', 25000, N'Blank')
INSERT [dbo].[Parkinglot] ([parkId], [parkArea], [parkName], [parkPlace], [parkPrice], [parkStatus]) VALUES (2, 30, N'Bai so 2', N'Khu Nam', 500000, N'Blank')
INSERT [dbo].[Parkinglot] ([parkId], [parkArea], [parkName], [parkPlace], [parkPrice], [parkStatus]) VALUES (3, 20, N'Bai so 3', N'Khu Tay', 100000, N'Blank')
SET IDENTITY_INSERT [dbo].[Parkinglot] OFF
SET IDENTITY_INSERT [dbo].[Trip] ON 

INSERT [dbo].[Trip] ([tripId], [bookedTicketNumber], [carType], [departureDate], [departureTime], [destination], [driver], [maximumOnlineTicketNumber]) VALUES (1, 10, N'HUYNDAI', CAST(0x9C3F0B00 AS Date), CAST(0x0780D2DCA0750000 AS Time), N'aaaaa', N'Duc', 3)
SET IDENTITY_INSERT [dbo].[Trip] OFF
ALTER TABLE [dbo].[Bookingoffice]  WITH CHECK ADD FOREIGN KEY([tripId])
REFERENCES [dbo].[Trip] ([tripId])
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([parkId])
REFERENCES [dbo].[Parkinglot] ([parkId])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([licensePlate])
REFERENCES [dbo].[Car] ([licensePlate])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([tripId])
REFERENCES [dbo].[Trip] ([tripId])
GO
USE [master]
GO
ALTER DATABASE [Car_Park] SET  READ_WRITE 
GO
