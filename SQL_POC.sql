USE [master]
GO
/****** Object:  Database [ecommerce]    Script Date: 3/12/2021 11:29:05 AM ******/
CREATE DATABASE [ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER1\MSSQL\DATA\ecommerce.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER1\MSSQL\DATA\ecommerce_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ecommerce] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ecommerce] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[GetallUsers]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetallUsers]
as
select * from Users

GO
/****** Object:  StoredProcedure [dbo].[SelectedUsers]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectedUsers] @User_name varchar(20)
as
select * from Users where User_name=@User_name

GO
/****** Object:  Table [dbo].[Bank_Account]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank_Account](
	[U_ID] [int] NULL,
	[Bank_name] [varchar](20) NOT NULL,
	[IFSC_Code] [varchar](20) NOT NULL,
	[Acc_no] [int] NULL,
	[Acc_holder_name] [varchar](20) NOT NULL,
	[B_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[B_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[Cart_id] [int] NOT NULL,
	[U_ID] [int] NULL,
	[Cart_order_name] [varchar](30) NULL,
	[Cart_quantity] [int] NULL,
	[Cart_price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[C_ID] [int] NOT NULL,
	[Cat_name] [varchar](20) NULL,
	[Cat_description] [varchar](50) NULL,
	[Created_date] [datetime] NOT NULL,
	[Updated_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[Login_id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [int] NOT NULL,
	[Order_name] [varchar](30) NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[U_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Product_id] [int] NOT NULL,
	[Product_name] [varchar](40) NULL,
	[Product_description] [varchar](50) NULL,
	[Product_Price] [int] NULL,

PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seller](
	[S_id] [int] NULL,
	[S_name] [varchar](10) NULL,
	[S_city] [varchar](10) NULL,
	[S_address] [varchar](40) NULL,
	[S_contact] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[U_ID] [int] NULL,
	[Address_line1] [varchar](40) NULL,
	[Street] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[Contact_no] [varchar](12) NOT NULL,
	[Pincode] [varchar](7) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2021 11:29:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[U_ID] [int] NOT NULL,
	[User_name] [varchar](20) NULL,
	[Login_id] [int] NULL,
	[Email_id] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[U_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Bank_Account] ([U_ID], [Bank_name], [IFSC_Code], [Acc_no], [Acc_holder_name], [B_ID]) VALUES (1, N'ICICI', N'ICICI003123', 2315648664, N'Pratik', 1)
INSERT [dbo].[Bank_Account] ([U_ID], [Bank_name], [IFSC_Code], [Acc_no], [Acc_holder_name], [B_ID]) VALUES (1, N'State Bank Of India', N'SBI006532', 2315648675, N'Pratik', 2)
INSERT [dbo].[Cart] ([Cart_id], [U_ID], [Cart_order_name], [Cart_quantity], [Cart_price]) VALUES (1, 1, N'Samsung M21', 1, 13000)
INSERT [dbo].[Cart] ([Cart_id], [U_ID], [Cart_order_name], [Cart_quantity], [Cart_price]) VALUES (2, 1, N'Samsung M31', 1, 15000)
INSERT [dbo].[Cart] ([Cart_id], [U_ID], [Cart_order_name], [Cart_quantity], [Cart_price]) VALUES (3, 1, N'Headphones Cosmic Byte', 1, 1500)
INSERT [dbo].[Category] ([C_ID], [Cat_name], [Cat_description], [Created_date], [Updated_date]) VALUES (1, N'Headphones', N'OverHead Headphones', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[Category] ([C_ID], [Cat_name], [Cat_description], [Created_date], [Updated_date]) VALUES (2, N'Mobile', N'Smartphones', CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[Credential] ([Login_id], [Username], [Password]) VALUES (1, N'Pratik', N'Pratik@123')
INSERT [dbo].[Credential] ([Login_id], [Username], [Password]) VALUES (2, N'Ajinkya', N'Ajinkya@123')
INSERT [dbo].[Orders] ([Order_id], [Order_name], [Quantity], [Price], [U_ID]) VALUES (1, N'Headphones Cosmic Byte', 2, 3000, 1)
INSERT [dbo].[Orders] ([Order_id], [Order_name], [Quantity], [Price], [U_ID]) VALUES (2, N'Samsung M21', 1,13000, 1)
INSERT [dbo].[Orders] ([Order_id], [Order_name], [Quantity], [Price], [U_ID]) VALUES (3, N'Samsung M31', 1, 15000, 2)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_description],[Product_Price]) VALUES (1, N'Samsung M21', N'Smartphone 4GB, 32 GB',13000)
INSERT [dbo].[Products] ([Product_id], [Product_name], [Product_description],[Product_Price]) VALUES (2, N'Samsung M31', N'Smartphone 6GB, 64 GB',15000)
INSERT [dbo].[Seller] ([S_id], [S_name], [S_city], [S_address], [S_contact]) VALUES (1, N'Digital Store', N'Nashik', N'Address', 89745612)
INSERT [dbo].[User] ([U_ID], [Address_line1], [Street], [City], [Contact_no], [Pincode]) VALUES (1, N'Pratik', N'Ashoka Marg', N'Nashik', N'1234567890', N'422011')
INSERT [dbo].[User] ([U_ID], [Address_line1], [Street], [City], [Contact_no], [Pincode]) VALUES (2, N'Ajinkya', N'Dehu Phata, Alandi', N'Pune', N'1234567890', N'42222')
INSERT [dbo].[Users] ([U_ID], [User_name], [Login_id], [Email_id]) VALUES (1, N'Pratik', 1, N'Pratik123@gmail.com')
INSERT [dbo].[Users] ([U_ID], [User_name], [Login_id], [Email_id]) VALUES (2, N'Ajinkya', 2, N'AJP@gmail.com')
/****** Object:  Index [UQ__Bank_det__49AA9902191B374C]    Script Date: 3/12/2021 11:29:06 AM ******/
ALTER TABLE [dbo].[Bank_Account] ADD UNIQUE NONCLUSTERED 
(
	[Acc_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bank_Account]  WITH CHECK ADD FOREIGN KEY([U_ID])
REFERENCES [dbo].[Users] ([U_ID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([U_ID])
REFERENCES [dbo].[Users] ([U_ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([U_ID])
REFERENCES [dbo].[Users] ([U_ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([U_ID])
REFERENCES [dbo].[Users] ([U_ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Login_id])
REFERENCES [dbo].[Credential] ([Login_id])
GO
USE [master]
GO
ALTER DATABASE [ecommerce] SET  READ_WRITE 
GO
