USE [master]
GO
/****** Object:  Database [SWP]    Script Date: 7/18/2025 9:22:46 AM ******/
CREATE DATABASE [SWP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP] SET  MULTI_USER 
GO
ALTER DATABASE [SWP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP]
GO
/****** Object:  Table [dbo].[attendance]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[check_in_time] [datetime2](6) NULL,
	[check_out_time] [datetime2](6) NULL,
	[staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chat_message]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat_message](
	[id] [uniqueidentifier] NOT NULL,
	[content] [varchar](255) NOT NULL,
	[created_at] [datetime2](6) NOT NULL,
	[room_id] [varchar](255) NOT NULL,
	[sender_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NOT NULL,
	[date_from] [datetime2](6) NULL,
	[date_to] [datetime2](6) NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[status] [nvarchar](20) NULL,
	[customer_id] [int] NULL,
	[staff_id] [int] NULL,
	[storage_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conversations]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conversations](
	[id] [uniqueidentifier] NOT NULL,
	[created_at] [datetime2](6) NOT NULL,
	[customer_unread] [bit] NOT NULL,
	[last_message_at] [datetime2](6) NULL,
	[manager_unread] [bit] NOT NULL,
	[status] [varchar](255) NOT NULL,
	[updated_at] [datetime2](6) NULL,
	[customer_id] [int] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[id_citizen] [nvarchar](20) NULL,
	[password] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[role_name] [nvarchar](20) NULL,
	[avatar] [varbinary](max) NULL,
	[is_online] [bit] NULL,
	[last_seen] [datetime2](6) NULL,
	[points] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_payments]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_payments](
	[customer_id] [int] NOT NULL,
	[payments_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_storage_transactions]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_storage_transactions](
	[customer_id] [int] NOT NULL,
	[storage_transactions_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_wish_lists]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_wish_lists](
	[customer_id] [int] NOT NULL,
	[wish_lists_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[econtract]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[econtract](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[contract_code] [varchar](255) NULL,
	[created_at] [datetime2](6) NOT NULL,
	[price_per_day] [float] NOT NULL,
	[rental_area] [float] NOT NULL,
	[signed_at] [datetime2](6) NULL,
	[status] [varchar](255) NOT NULL,
	[storage_name] [varchar](255) NOT NULL,
	[total_amount] [float] NOT NULL,
	[customer_id] [int] NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[rating] [int] NOT NULL,
	[customer_id] [int] NULL,
	[staff_id] [int] NULL,
	[storage_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[issue]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[issue](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime2](6) NULL,
	[description] [nvarchar](255) NULL,
	[resolved] [bit] NOT NULL,
	[subject] [nvarchar](100) NULL,
	[staff_id] [int] NULL,
	[customer_id] [int] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leave_request]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leave_request](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime2](6) NULL,
	[from_date] [date] NULL,
	[leave_type] [varchar](255) NULL,
	[manager_note] [varchar](255) NULL,
	[reason] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[to_date] [date] NULL,
	[staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[role_name] [nvarchar](20) NULL,
	[is_online] [bit] NULL,
	[last_seen] [datetime2](6) NULL,
	[on_duty] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message_status]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_status](
	[id] [uniqueidentifier] NOT NULL,
	[created_at] [datetime2](6) NOT NULL,
	[delivered_at] [datetime2](6) NULL,
	[read_at] [datetime2](6) NULL,
	[status] [varchar](255) NOT NULL,
	[user_id] [int] NOT NULL,
	[user_type] [varchar](255) NOT NULL,
	[message_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[id] [uniqueidentifier] NOT NULL,
	[attachment_name] [varchar](255) NULL,
	[attachment_size] [bigint] NULL,
	[attachment_url] [varchar](255) NULL,
	[content] [text] NOT NULL,
	[created_at] [datetime2](6) NOT NULL,
	[is_read] [bit] NOT NULL,
	[message_type] [varchar](255) NOT NULL,
	[read_at] [datetime2](6) NULL,
	[sender_id] [int] NOT NULL,
	[sender_type] [varchar](255) NOT NULL,
	[conversation_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime2](6) NULL,
	[is_read] [bit] NULL,
	[message] [varchar](255) NULL,
	[customer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[end_date] [date] NULL,
	[order_date] [date] NULL,
	[start_date] [date] NULL,
	[status] [nvarchar](20) NULL,
	[total_amount] [float] NOT NULL,
	[customer_id] [int] NULL,
	[manager_id] [int] NULL,
	[staff_id] [int] NULL,
	[storage_id] [int] NULL,
	[cancel_reason] [varchar](500) NULL,
	[voucher_id] [int] NULL,
	[rental_area] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](6) NULL,
	[payment_method] [nvarchar](50) NULL,
	[status] [nvarchar](20) NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recent_activity]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recent_activity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action] [varchar](255) NOT NULL,
	[actor] [varchar](255) NOT NULL,
	[detail_link] [varchar](255) NULL,
	[entity_name] [varchar](255) NULL,
	[entity_type] [varchar](255) NULL,
	[timestamp] [datetime2](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staffid] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[id_citizen_card] [nvarchar](20) NULL,
	[password] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[role_name] [nvarchar](20) NULL,
	[sex] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[staffid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage](
	[storageid] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[area] [float] NOT NULL,
	[city] [nvarchar](50) NULL,
	[description] [nvarchar](255) NULL,
	[price_per_day] [float] NOT NULL,
	[state] [nvarchar](50) NULL,
	[status] [bit] NOT NULL,
	[storagename] [nvarchar](100) NULL,
	[im_url] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[storageid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage_item]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_stored] [date] NULL,
	[item_name] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[quantity] [int] NOT NULL,
	[volume_per_unit] [float] NOT NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage_transaction]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage_transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_date] [datetime2](6) NULL,
	[type] [nvarchar](50) NULL,
	[customer_id] [int] NULL,
	[storage_id] [int] NULL,
	[amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[support_activity]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[support_activity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[activity_time] [datetime2](6) NULL,
	[activity_type] [nvarchar](50) NULL,
	[status] [nvarchar](20) NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[due_date] [datetime2](6) NULL,
	[status] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[staff_id] [int] NULL,
	[ma] [int] NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viewing_appointment]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viewing_appointment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_date_time] [datetime2](6) NULL,
	[customer_name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[note] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[reject_reason] [nvarchar](255) NULL,
	[status] [varchar](255) NOT NULL,
	[viewing_purpose] [nvarchar](255) NULL,
	[storage_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vouchers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime2](6) NULL,
	[description] [varchar](255) NULL,
	[discount_amount] [numeric](38, 2) NULL,
	[end_date] [datetime2](6) NULL,
	[name] [varchar](255) NULL,
	[remain_quantity] [int] NULL,
	[required_point] [int] NULL,
	[start_date] [datetime2](6) NULL,
	[status] [varchar](255) NULL,
	[total_quantity] [int] NULL,
	[updated_at] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wish_list]    Script Date: 7/18/2025 9:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wish_list](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](6) NULL,
	[customer_id] [int] NULL,
	[storage_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([id], [amount], [date_from], [date_to], [first_name], [last_name], [status], [customer_id], [staff_id], [storage_id]) VALUES (0, 1000000, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), N'Nguyễn', N'Văn A', N'active', 1, 1, 1)
INSERT [dbo].[contact] ([id], [amount], [date_from], [date_to], [first_name], [last_name], [status], [customer_id], [staff_id], [storage_id]) VALUES (1, 1000000, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), N'Nguyễn', N'Văn A', N'active', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (1, N'12 Nguyễn Trãi, Hà Nội', N'nguyenvana@gmail.com', N'Nguyễn Văn A', N'012345678', N'pass123', N'0912345678', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (2, N'45 Lê Lợi, Đà Nẵng', N'tranthib@gmail.com', N'Trần Thị B', N'023456789', N'pass456', N'0987654321', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (3, N'78 Pasteur, TP HCM', N'phamquocd@gmail.com', N'Phạm Quốc D', N'034567890', N'pass789', N'0901234567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (4, N'123 Nguyễn Huệ, Huế', N'leduyc@gmail.com', N'Lê Duy C', N'045678901', N'pass321', N'0932123456', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (5, N'68 Bạch Đằng, Hải Phòng', N'vuhoangh@gmail.com', N'Vũ Hoàng H', N'056789012', N'pass654', N'0943234567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (6, N'20 Phan Chu Trinh, Cần Thơ', N'dangkimn@gmail.com', N'Đặng Kim N', N'067890123', N'pass987', N'0962123567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (7, N'5 Lê Duẩn, Thanh Hóa', N'buiminhk@gmail.com', N'Bùi Minh K', N'078901234', N'pass159', N'0912123123', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (8, N'16 Trần Phú, Nha Trang', N'phanhuongl@gmail.com', N'Phan Hương L', N'089012345', N'pass753', N'0934567890', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (9, N'18 Hà Đông, Hà Nội', N'hongquanvjp@gmail.com', N'Đặng Hồng Quân', N'001205002574', N'Hongquan@123', N'0889615388', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (10, N'33 Quang Trung, Vũng Tàu', N'voquangi@gmail.com', N'Võ Quang I', N'090123456', N'pass258', N'0973234567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (11, N'91 Lý Thường Kiệt, Biên Hòa', N'taithanhs@gmail.com', N'Tài Thanh S', N'101234567', N'pass456123', N'0909988776', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (12, N'12 Nguyễn Trãi, Hà Nội', N'nguyenvana@gmail.com', N'Nguyễn Văn A', N'012345678', N'pass123', N'0912345678', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (13, N'45 Lê Lợi, Đà Nẵng', N'tranthib@gmail.com', N'Trần Thị B', N'023456789', N'pass456', N'0987654321', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (14, N'78 Pasteur, TP HCM', N'phamquocd@gmail.com', N'Phạm Quốc D', N'034567890', N'pass789', N'0901234567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (15, N'123 Nguyễn Huệ, Huế', N'leduyc@gmail.com', N'Lê Duy C', N'045678901', N'pass321', N'0932123456', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (16, N'68 Bạch Đằng, Hải Phòng', N'vuhoangh@gmail.com', N'Vũ Hoàng H', N'056789012', N'pass654', N'0943234567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (17, N'20 Phan Chu Trinh, Cần Thơ', N'dangkimn@gmail.com', N'Đặng Kim N', N'067890123', N'pass987', N'0962123567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (18, N'5 Lê Duẩn, Thanh Hóa', N'buiminhk@gmail.com', N'Bùi Minh K', N'078901234', N'pass159', N'0912123123', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (19, N'16 Trần Phú, Nha Trang', N'phanhuongl@gmail.com', N'Phan Hương L', N'089012345', N'pass753', N'0934567890', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (20, N'18 Hà Đông, Hà Nội', N'hongquanvjp@gmail.com', N'Đặng Hồng Quân', N'001205002574', N'Hongquan@123', N'0889615388', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (21, N'33 Quang Trung, Vũng Tàu', N'voquangi@gmail.com', N'Võ Quang I', N'090123456', N'pass258', N'0973234567', N'CUSTOMER', NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [address], [email], [fullname], [id_citizen], [password], [phone], [role_name], [avatar], [is_online], [last_seen], [points]) VALUES (22, N'91 Lý Thường Kiệt, Biên Hòa', N'taithanhs@gmail.com', N'Tài Thanh S', N'101234567', N'pass456123', N'0909988776', N'CUSTOMER', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
INSERT [dbo].[customer_payments] ([customer_id], [payments_id]) VALUES (1, 1)
INSERT [dbo].[customer_payments] ([customer_id], [payments_id]) VALUES (2, 2)
GO
INSERT [dbo].[customer_storage_transactions] ([customer_id], [storage_transactions_id]) VALUES (1, 1)
INSERT [dbo].[customer_storage_transactions] ([customer_id], [storage_transactions_id]) VALUES (2, 2)
GO
INSERT [dbo].[customer_wish_lists] ([customer_id], [wish_lists_id]) VALUES (1, 1)
INSERT [dbo].[customer_wish_lists] ([customer_id], [wish_lists_id]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (0, N'Dịch vụ rất tốt, nhân viên nhiệt tình.', 5, 1, 1, 1)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (1, N'Kho rộng rãi, an ninh tốt.', 4, 2, 2, 2)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (2, N'Giá cả hợp lý, sẽ quay lại.', 5, 3, 3, 3)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (3, N'Vị trí thuận tiện cho vận chuyển.', 4, 4, 1, 4)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (4, N'Kho sạch sẽ, bảo quản hàng hóa tốt.', 5, 5, 2, 5)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (5, N'Nhân viên hỗ trợ rất chuyên nghiệp.', 5, 6, 3, 1)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (6, N'Cần cải thiện thời gian làm thủ tục.', 3, 7, 4, 2)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (7, N'Kho khá mới, thiết bị hiện đại.', 4, 8, 5, 3)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (8, N'Dễ dàng đặt chỗ, nhân viên tư vấn tốt.', 5, 9, 6, 4)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (9, N'Giao nhận hàng nhanh chóng.', 4, 10, 1, 5)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (10, N'Ứng dụng đặt kho rất tiện lợi.', 5, 11, 2, 1)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (11, N'Dịch vụ rất tốt, nhân viên nhiệt tình.', 5, 1, 1, 1)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (12, N'Kho rộng rãi, an ninh tốt.', 4, 2, 2, 2)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (13, N'Giá cả hợp lý, sẽ quay lại.', 5, 3, 3, 3)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (14, N'Vị trí thuận tiện cho vận chuyển.', 4, 4, 1, 4)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (15, N'Kho sạch sẽ, bảo quản hàng hóa tốt.', 5, 5, 2, 5)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (16, N'Nhân viên hỗ trợ rất chuyên nghiệp.', 5, 6, 3, 1)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (17, N'Cần cải thiện thời gian làm thủ tục.', 3, 7, 4, 2)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (18, N'Kho khá mới, thiết bị hiện đại.', 4, 8, 5, 3)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (19, N'Dễ dàng đặt chỗ, nhân viên tư vấn tốt.', 5, 9, 6, 4)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (20, N'Giao nhận hàng nhanh chóng.', 4, 10, 1, 5)
INSERT [dbo].[feedback] ([id], [content], [rating], [customer_id], [staff_id], [storage_id]) VALUES (21, N'Ứng dụng đặt kho rất tiện lợi.', 5, 11, 2, 1)
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[issue] ON 

INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (0, CAST(N'2024-06-10T00:00:00.0000000' AS DateTime2), N'Kho bị rò nước, cần sửa chữa gấp.', 0, N'Khiếu nại kho lạnh', 1, 1, N'Pending')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (1, CAST(N'2024-06-12T00:00:00.0000000' AS DateTime2), N'Nhân viên giao hàng đến muộn.', 1, N'Phản ánh dịch vụ', 2, 2, N'Resolved')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (2, CAST(N'2024-06-15T00:00:00.0000000' AS DateTime2), N'Đơn hàng không khớp thông tin.', 0, N'Sai thông tin đơn', 3, 3, N'Pending')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (3, CAST(N'2024-06-18T00:00:00.0000000' AS DateTime2), N'Yêu cầu hoàn tiền do lỗi dịch vụ.', 1, N'Hoàn tiền', 4, 4, N'Resolved')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (4, CAST(N'2024-06-20T00:00:00.0000000' AS DateTime2), N'Kho chưa được vệ sinh định kỳ.', 0, N'Phản ánh vệ sinh', 5, 5, N'Pending')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (5, CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), N'Nhân viên hỗ trợ chưa nhiệt tình.', 1, N'Khiếu nại thái độ', 6, 6, N'Resolved')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (6, CAST(N'2024-06-10T00:00:00.0000000' AS DateTime2), N'Kho bị rò nước, cần sửa chữa gấp.', 0, N'Khiếu nại kho lạnh', 1, 1, N'Pending')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (7, CAST(N'2024-06-12T00:00:00.0000000' AS DateTime2), N'Nhân viên giao hàng đến muộn.', 1, N'Phản ánh dịch vụ', 2, 2, N'Resolved')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (8, CAST(N'2024-06-15T00:00:00.0000000' AS DateTime2), N'Đơn hàng không khớp thông tin.', 0, N'Sai thông tin đơn', 3, 3, N'Pending')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (9, CAST(N'2024-06-18T00:00:00.0000000' AS DateTime2), N'Yêu cầu hoàn tiền do lỗi dịch vụ.', 1, N'Hoàn tiền', 4, 4, N'Resolved')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (10, CAST(N'2024-06-20T00:00:00.0000000' AS DateTime2), N'Kho chưa được vệ sinh định kỳ.', 0, N'Phản ánh vệ sinh', 5, 5, N'Pending')
INSERT [dbo].[issue] ([id], [created_date], [description], [resolved], [subject], [staff_id], [customer_id], [status]) VALUES (11, CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), N'Nhân viên hỗ trợ chưa nhiệt tình.', 1, N'Khiếu nại thái độ', 6, 6, N'Resolved')
SET IDENTITY_INSERT [dbo].[issue] OFF
GO
SET IDENTITY_INSERT [dbo].[manager] ON 

INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (1, N'quanghieu.manager@gmail.com', N'Nguyễn Quang Hiếu', N'Hieu123', N'0901234567', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (2, N'lethanhdat.manager@gmail.com', N'Lê Thành Đạt', N'Dat456', N'0912345678', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (3, N'phamminhchau.manager@gmail.com', N'Phạm Minh Châu', N'Chau789', N'0923456789', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (4, N'tuelamgido@gmail.com', N'Võ Tuệ Lâm', N'Lam@123', N'0945678901', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (5, N'ngoquanngu@gmail.com', N'Ngô Minh Quân', N'Ngoquan@123', N'0124185933', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (6, N'vudepzai@gmail.com', N'Trịnh Thế Vũ', N'Vu@123', N'0732841933', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (7, N'quanghieu.manager@gmail.com', N'Nguyễn Quang Hiếu', N'Hieu123', N'0901234567', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (8, N'lethanhdat.manager@gmail.com', N'Lê Thành Đạt', N'Dat456', N'0912345678', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (9, N'phamminhchau.manager@gmail.com', N'Phạm Minh Châu', N'Chau789', N'0923456789', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (10, N'tuelamgido@gmail.com', N'Võ Tuệ Lâm', N'Lam@123', N'0945678901', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (11, N'ngoquanngu@gmail.com', N'Ngô Minh Quân', N'Ngoquan@123', N'0124185933', N'MANAGER', NULL, NULL, 1)
INSERT [dbo].[manager] ([id], [email], [fullname], [password], [phone], [role_name], [is_online], [last_seen], [on_duty]) VALUES (12, N'vudepzai@gmail.com', N'Trịnh Thế Vũ', N'Vu@123', N'0732841933', N'MANAGER', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[manager] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [end_date], [order_date], [start_date], [status], [total_amount], [customer_id], [manager_id], [staff_id], [storage_id], [cancel_reason], [voucher_id], [rental_area]) VALUES (8, CAST(N'2024-06-02' AS Date), CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), N'Pending', 2000000, 1, 1, 1, 1, NULL, NULL, 10)
INSERT [dbo].[orders] ([id], [end_date], [order_date], [start_date], [status], [total_amount], [customer_id], [manager_id], [staff_id], [storage_id], [cancel_reason], [voucher_id], [rental_area]) VALUES (9, CAST(N'2024-06-05' AS Date), CAST(N'2024-06-02' AS Date), CAST(N'2024-06-02' AS Date), N'Paid', 3500000, 2, 2, 2, 2, NULL, NULL, 20)
INSERT [dbo].[orders] ([id], [end_date], [order_date], [start_date], [status], [total_amount], [customer_id], [manager_id], [staff_id], [storage_id], [cancel_reason], [voucher_id], [rental_area]) VALUES (10, CAST(N'2024-06-07' AS Date), CAST(N'2024-06-03' AS Date), CAST(N'2024-06-03' AS Date), N'Approved', 4000000, 3, 3, 3, 3, NULL, NULL, 30)
INSERT [dbo].[orders] ([id], [end_date], [order_date], [start_date], [status], [total_amount], [customer_id], [manager_id], [staff_id], [storage_id], [cancel_reason], [voucher_id], [rental_area]) VALUES (11, CAST(N'2024-06-10' AS Date), CAST(N'2024-06-04' AS Date), CAST(N'2024-06-05' AS Date), N'Rejected', 3000000, 4, 4, 4, 4, NULL, NULL, 15)
INSERT [dbo].[orders] ([id], [end_date], [order_date], [start_date], [status], [total_amount], [customer_id], [manager_id], [staff_id], [storage_id], [cancel_reason], [voucher_id], [rental_area]) VALUES (12, CAST(N'2024-06-14' AS Date), CAST(N'2024-06-10' AS Date), CAST(N'2024-06-10' AS Date), N'Paid', 7000000, 5, 5, 5, 5, NULL, NULL, 50)
INSERT [dbo].[orders] ([id], [end_date], [order_date], [start_date], [status], [total_amount], [customer_id], [manager_id], [staff_id], [storage_id], [cancel_reason], [voucher_id], [rental_area]) VALUES (13, CAST(N'2024-06-17' AS Date), CAST(N'2024-06-12' AS Date), CAST(N'2024-06-12' AS Date), N'Pending', 2500000, 6, 6, 6, 6, NULL, NULL, 25)
INSERT [dbo].[orders] ([id], [end_date], [order_date], [start_date], [status], [total_amount], [customer_id], [manager_id], [staff_id], [storage_id], [cancel_reason], [voucher_id], [rental_area]) VALUES (14, CAST(N'2024-06-20' AS Date), CAST(N'2024-06-15' AS Date), CAST(N'2024-06-15' AS Date), N'Approved', 4500000, 7, 7, 7, 7, NULL, NULL, 40)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[payment] ON 

INSERT [dbo].[payment] ([id], [date], [payment_method], [status], [customer_id]) VALUES (0, CAST(N'2025-07-18T09:16:36.3533330' AS DateTime2), N'Chuyển khoản', N'Paid', 1)
INSERT [dbo].[payment] ([id], [date], [payment_method], [status], [customer_id]) VALUES (1, CAST(N'2025-07-18T09:16:36.3533330' AS DateTime2), N'Tiền mặt', N'Pending', 2)
INSERT [dbo].[payment] ([id], [date], [payment_method], [status], [customer_id]) VALUES (2, CAST(N'2025-07-18T09:17:30.2500000' AS DateTime2), N'Chuyển khoản', N'Paid', 1)
INSERT [dbo].[payment] ([id], [date], [payment_method], [status], [customer_id]) VALUES (3, CAST(N'2025-07-18T09:17:30.2500000' AS DateTime2), N'Tiền mặt', N'Pending', 2)
SET IDENTITY_INSERT [dbo].[payment] OFF
GO
SET IDENTITY_INSERT [dbo].[staff] ON 

INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (1, N'danghongquan@gmail.com', N'Đặng Hồng Quân', N'012345678', N'Hongquan@123', N'0987654321', N'STAFF', N'Nam')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (2, N'phamvanmanh@gmail.com', N'Phạm Văn Mạnh', N'135792468', N'Manh123', N'0912341123', N'STAFF', N'Nam')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (3, N'phamthihuong@gmail.com', N'Phạm Thị Hương', N'357951456', N'Huong789', N'0987123456', N'STAFF', N'Nữ')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (4, N'ledung@gmail.com', N'Lê Dũng', N'741852963', N'Dung123', N'0963214569', N'STAFF', N'Nam')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (5, N'tranbaochau@gmail.com', N'Trần Bảo Châu', N'753159852', N'Chau321', N'0978523146', N'STAFF', N'Nữ')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (6, N'phamthanhson@gmail.com', N'Phạm Thanh Sơn', N'951753852', N'Son963', N'0932145785', N'STAFF', N'Nam')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (7, N'danghongquan@gmail.com', N'Đặng Hồng Quân', N'012345678', N'Hongquan@123', N'0987654321', N'STAFF', N'Nam')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (8, N'phamvanmanh@gmail.com', N'Phạm Văn Mạnh', N'135792468', N'Manh123', N'0912341123', N'STAFF', N'Nam')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (9, N'phamthihuong@gmail.com', N'Phạm Thị Hương', N'357951456', N'Huong789', N'0987123456', N'STAFF', N'Nữ')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (10, N'ledung@gmail.com', N'Lê Dũng', N'741852963', N'Dung123', N'0963214569', N'STAFF', N'Nam')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (11, N'tranbaochau@gmail.com', N'Trần Bảo Châu', N'753159852', N'Chau321', N'0978523146', N'STAFF', N'Nữ')
INSERT [dbo].[staff] ([staffid], [email], [fullname], [id_citizen_card], [password], [phone], [role_name], [sex]) VALUES (12, N'phamthanhson@gmail.com', N'Phạm Thanh Sơn', N'951753852', N'Son963', N'0932145785', N'STAFF', N'Nam')
SET IDENTITY_INSERT [dbo].[staff] OFF
GO
SET IDENTITY_INSERT [dbo].[storage] ON 

INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (1, N'123 Hoàng Quốc Việt', 500, N'Hà Nội', N'Kho hàng tại trung tâm Hà Nội', 200000, N'Active', 1, N'Kho Hà Nội 1', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (2, N'456 Nguyễn Trãi', 600, N'Hà Nội', N'Kho rộng rãi với sức chứa lớn', 250000, N'Cầu Giấy', 1, N'Kho Hà Nội 2', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (3, N'789 Trần Phú', 550, N'Đà Nẵng', N'Kho thuận tiện gần cảng biển', 220000, N'Thanh Xuân', 1, N'Kho Đà Nẵng', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (4, N'101 Lê Lợi', 700, N'TP Hồ Chí Minh', N'Kho lớn phục vụ khu vực miền Nam', 300000, N'Hải Châu', 1, N'Kho TP HCM 1', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (5, N'202 Nguyễn Văn Cừ', 750, N'TP Hồ Chí Minh', N'Kho công nghệ cao, bảo quản tốt', 280000, N'Quận 1', 1, N'Kho TP HCM 2', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (6, N'303 3/2', 500, N'Cần Thơ', N'Kho phục vụ khu vực Đồng bằng sông Cửu Long', 200000, N'Quận 5', 1, N'Kho Cần Thơ', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (7, N'404 Tô Hiệu', 620, N'Hải Phòng', N'Kho gần cảng Hải Phòng thuận tiện vận chuyển', 240000, N'Ninh Kiều', 1, N'Kho Hải Phòng', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (8, N'505 Phan Chu Trinh', 580, N'Nha Trang', N'Kho gần khu vực du lịch lớn', 230000, N'Lê Chân', 1, N'Kho Nha Trang', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (9, N'606 Lê Hồng Phong', 500, N'Vũng Tàu', N'Kho hàng hỗ trợ vận tải biển', 210000, N'Vĩnh Thọ', 1, N'Kho Vũng Tàu', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (10, N'707 Đại Lộ Bình Dương', 700, N'Bình Dương', N'Kho hàng lớn tại khu công nghiệp Bình Dương', 260000, N'Phường 7', 1, N'Kho Bình Dương', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (11, N'123 Hoàng Quốc Việt', 500, N'Hà Nội', N'Kho hàng tại trung tâm Hà Nội', 200000, N'Active', 1, N'Kho Hà Nội 1', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (12, N'456 Nguyễn Trãi', 600, N'Hà Nội', N'Kho rộng rãi với sức chứa lớn', 250000, N'Cầu Giấy', 1, N'Kho Hà Nội 2', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (13, N'789 Trần Phú', 550, N'Đà Nẵng', N'Kho thuận tiện gần cảng biển', 220000, N'Thanh Xuân', 1, N'Kho Đà Nẵng', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (14, N'101 Lê Lợi', 700, N'TP Hồ Chí Minh', N'Kho lớn phục vụ khu vực miền Nam', 300000, N'Hải Châu', 1, N'Kho TP HCM 1', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (15, N'202 Nguyễn Văn Cừ', 750, N'TP Hồ Chí Minh', N'Kho công nghệ cao, bảo quản tốt', 280000, N'Quận 1', 1, N'Kho TP HCM 2', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (16, N'303 3/2', 500, N'Cần Thơ', N'Kho phục vụ khu vực Đồng bằng sông Cửu Long', 200000, N'Quận 5', 1, N'Kho Cần Thơ', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (17, N'404 Tô Hiệu', 620, N'Hải Phòng', N'Kho gần cảng Hải Phòng thuận tiện vận chuyển', 240000, N'Ninh Kiều', 1, N'Kho Hải Phòng', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (18, N'505 Phan Chu Trinh', 580, N'Nha Trang', N'Kho gần khu vực du lịch lớn', 230000, N'Lê Chân', 1, N'Kho Nha Trang', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (19, N'606 Lê Hồng Phong', 500, N'Vũng Tàu', N'Kho hàng hỗ trợ vận tải biển', 210000, N'Vĩnh Thọ', 1, N'Kho Vũng Tàu', NULL)
INSERT [dbo].[storage] ([storageid], [address], [area], [city], [description], [price_per_day], [state], [status], [storagename], [im_url]) VALUES (20, N'707 Đại Lộ Bình Dương', 700, N'Bình Dương', N'Kho hàng lớn tại khu công nghiệp Bình Dương', 260000, N'Phường 7', 1, N'Kho Bình Dương', NULL)
SET IDENTITY_INSERT [dbo].[storage] OFF
GO
SET IDENTITY_INSERT [dbo].[storage_transaction] ON 

INSERT [dbo].[storage_transaction] ([id], [transaction_date], [type], [customer_id], [storage_id], [amount]) VALUES (0, CAST(N'2025-07-18T09:16:36.3533330' AS DateTime2), N'Nhập kho', 1, 1, NULL)
INSERT [dbo].[storage_transaction] ([id], [transaction_date], [type], [customer_id], [storage_id], [amount]) VALUES (1, CAST(N'2025-07-18T09:16:36.3533330' AS DateTime2), N'Xuất kho', 2, 2, NULL)
INSERT [dbo].[storage_transaction] ([id], [transaction_date], [type], [customer_id], [storage_id], [amount]) VALUES (2, CAST(N'2025-07-18T09:17:37.2400000' AS DateTime2), N'Nhập kho', 1, 1, NULL)
INSERT [dbo].[storage_transaction] ([id], [transaction_date], [type], [customer_id], [storage_id], [amount]) VALUES (3, CAST(N'2025-07-18T09:17:37.2400000' AS DateTime2), N'Xuất kho', 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[storage_transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[support_activity] ON 

INSERT [dbo].[support_activity] ([id], [activity_time], [activity_type], [status], [customer_id]) VALUES (0, CAST(N'2025-07-18T09:16:36.3533330' AS DateTime2), N'Gọi điện', N'Hoàn thành', 1)
INSERT [dbo].[support_activity] ([id], [activity_time], [activity_type], [status], [customer_id]) VALUES (1, CAST(N'2025-07-18T09:17:39.9666670' AS DateTime2), N'Gọi điện', N'Hoàn thành', 1)
SET IDENTITY_INSERT [dbo].[support_activity] OFF
GO
SET IDENTITY_INSERT [dbo].[wish_list] ON 

INSERT [dbo].[wish_list] ([id], [date], [customer_id], [storage_id]) VALUES (0, CAST(N'2025-07-18T09:16:36.3533330' AS DateTime2), 1, NULL)
INSERT [dbo].[wish_list] ([id], [date], [customer_id], [storage_id]) VALUES (1, CAST(N'2025-07-18T09:16:36.3533330' AS DateTime2), 2, NULL)
INSERT [dbo].[wish_list] ([id], [date], [customer_id], [storage_id]) VALUES (2, CAST(N'2025-07-18T09:17:34.3566670' AS DateTime2), 1, NULL)
INSERT [dbo].[wish_list] ([id], [date], [customer_id], [storage_id]) VALUES (3, CAST(N'2025-07-18T09:17:34.3566670' AS DateTime2), 2, NULL)
SET IDENTITY_INSERT [dbo].[wish_list] OFF
GO
/****** Object:  Index [UK7h9oaqdvlysa9n7wkvaxe9b6y]    Script Date: 7/18/2025 9:22:46 AM ******/
ALTER TABLE [dbo].[customer_payments] ADD  CONSTRAINT [UK7h9oaqdvlysa9n7wkvaxe9b6y] UNIQUE NONCLUSTERED 
(
	[payments_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK9e8is4a70ionx2n5cf2qt71kk]    Script Date: 7/18/2025 9:22:46 AM ******/
ALTER TABLE [dbo].[customer_storage_transactions] ADD  CONSTRAINT [UK9e8is4a70ionx2n5cf2qt71kk] UNIQUE NONCLUSTERED 
(
	[storage_transactions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKk7wmf959vu80xvmorm4pgv128]    Script Date: 7/18/2025 9:22:46 AM ******/
ALTER TABLE [dbo].[customer_wish_lists] ADD  CONSTRAINT [UKk7wmf959vu80xvmorm4pgv128] UNIQUE NONCLUSTERED 
(
	[wish_lists_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKcnt526536kmsvdvqcvg738o4w]    Script Date: 7/18/2025 9:22:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKcnt526536kmsvdvqcvg738o4w] ON [dbo].[econtract]
(
	[order_id] ASC
)
WHERE ([order_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKt7ehjrgqklhp2w8h3w97sh5io]    Script Date: 7/18/2025 9:22:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKt7ehjrgqklhp2w8h3w97sh5io] ON [dbo].[econtract]
(
	[contract_code] ASC
)
WHERE ([contract_code] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[attendance]  WITH CHECK ADD  CONSTRAINT [FKgfsd9oocfu5mp2nc6kcqqxogx] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staffid])
GO
ALTER TABLE [dbo].[attendance] CHECK CONSTRAINT [FKgfsd9oocfu5mp2nc6kcqqxogx]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD  CONSTRAINT [FKckoarj5a5jmet3b3smgdhaopw] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[contact] CHECK CONSTRAINT [FKckoarj5a5jmet3b3smgdhaopw]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD  CONSTRAINT [FKqpu8s5tliblr5ee3xd6wtuxfq] FOREIGN KEY([storage_id])
REFERENCES [dbo].[storage] ([storageid])
GO
ALTER TABLE [dbo].[contact] CHECK CONSTRAINT [FKqpu8s5tliblr5ee3xd6wtuxfq]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD  CONSTRAINT [FKxma0rf86nv3graohjh5mu830] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staffid])
GO
ALTER TABLE [dbo].[contact] CHECK CONSTRAINT [FKxma0rf86nv3graohjh5mu830]
GO
ALTER TABLE [dbo].[conversations]  WITH CHECK ADD  CONSTRAINT [FKiugdxmq35sgg5byi50x0cqmra] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[conversations] CHECK CONSTRAINT [FKiugdxmq35sgg5byi50x0cqmra]
GO
ALTER TABLE [dbo].[conversations]  WITH CHECK ADD  CONSTRAINT [FKjdb0h0usyf5lu14eooq9xcbvb] FOREIGN KEY([manager_id])
REFERENCES [dbo].[manager] ([id])
GO
ALTER TABLE [dbo].[conversations] CHECK CONSTRAINT [FKjdb0h0usyf5lu14eooq9xcbvb]
GO
ALTER TABLE [dbo].[customer_payments]  WITH CHECK ADD  CONSTRAINT [FKh34yv8veqbjgardvcnqlkbv52] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[customer_payments] CHECK CONSTRAINT [FKh34yv8veqbjgardvcnqlkbv52]
GO
ALTER TABLE [dbo].[customer_payments]  WITH CHECK ADD  CONSTRAINT [FKoyg49ps1dxxqomx924veghwbe] FOREIGN KEY([payments_id])
REFERENCES [dbo].[payment] ([id])
GO
ALTER TABLE [dbo].[customer_payments] CHECK CONSTRAINT [FKoyg49ps1dxxqomx924veghwbe]
GO
ALTER TABLE [dbo].[customer_storage_transactions]  WITH CHECK ADD  CONSTRAINT [FK1hacipn4a0dcb26hliv85lml6] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[customer_storage_transactions] CHECK CONSTRAINT [FK1hacipn4a0dcb26hliv85lml6]
GO
ALTER TABLE [dbo].[customer_storage_transactions]  WITH CHECK ADD  CONSTRAINT [FKec92heypjrf3f6bcj3i53b954] FOREIGN KEY([storage_transactions_id])
REFERENCES [dbo].[storage_transaction] ([id])
GO
ALTER TABLE [dbo].[customer_storage_transactions] CHECK CONSTRAINT [FKec92heypjrf3f6bcj3i53b954]
GO
ALTER TABLE [dbo].[customer_wish_lists]  WITH CHECK ADD  CONSTRAINT [FKq7ykhldaoxio05ld6j2dn4k34] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[customer_wish_lists] CHECK CONSTRAINT [FKq7ykhldaoxio05ld6j2dn4k34]
GO
ALTER TABLE [dbo].[customer_wish_lists]  WITH CHECK ADD  CONSTRAINT [FKtieum2u2cf9s6cpfylvg8ekmi] FOREIGN KEY([wish_lists_id])
REFERENCES [dbo].[wish_list] ([id])
GO
ALTER TABLE [dbo].[customer_wish_lists] CHECK CONSTRAINT [FKtieum2u2cf9s6cpfylvg8ekmi]
GO
ALTER TABLE [dbo].[econtract]  WITH CHECK ADD  CONSTRAINT [FKm4jba2efs8by2e7oonor71ksy] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[econtract] CHECK CONSTRAINT [FKm4jba2efs8by2e7oonor71ksy]
GO
ALTER TABLE [dbo].[econtract]  WITH CHECK ADD  CONSTRAINT [FKqq4h8gywxigrirn7gc7ryi0f] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[econtract] CHECK CONSTRAINT [FKqq4h8gywxigrirn7gc7ryi0f]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FKfun9ujhj2ycjw0ao02fihn11y] FOREIGN KEY([storage_id])
REFERENCES [dbo].[storage] ([storageid])
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FKfun9ujhj2ycjw0ao02fihn11y]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FKpi2y2j7n01ypo49fone3knjry] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FKpi2y2j7n01ypo49fone3knjry]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FKsl1stvft00ntoc3m0pjbj1i2n] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staffid])
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FKsl1stvft00ntoc3m0pjbj1i2n]
GO
ALTER TABLE [dbo].[issue]  WITH CHECK ADD  CONSTRAINT [FK4re8gnqikxtudxkwg87wl9c8p] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK4re8gnqikxtudxkwg87wl9c8p]
GO
ALTER TABLE [dbo].[issue]  WITH CHECK ADD  CONSTRAINT [FKpvvjbf8d19xlm2q2px8c6xaq0] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staffid])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FKpvvjbf8d19xlm2q2px8c6xaq0]
GO
ALTER TABLE [dbo].[leave_request]  WITH CHECK ADD  CONSTRAINT [FKikpdq792b4tfpbh3uqrfeggh2] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staffid])
GO
ALTER TABLE [dbo].[leave_request] CHECK CONSTRAINT [FKikpdq792b4tfpbh3uqrfeggh2]
GO
ALTER TABLE [dbo].[message_status]  WITH CHECK ADD  CONSTRAINT [FKt08yagv0viu5m3sk4uwluxr4o] FOREIGN KEY([message_id])
REFERENCES [dbo].[messages] ([id])
GO
ALTER TABLE [dbo].[message_status] CHECK CONSTRAINT [FKt08yagv0viu5m3sk4uwluxr4o]
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD  CONSTRAINT [FKt492th6wsovh1nush5yl5jj8e] FOREIGN KEY([conversation_id])
REFERENCES [dbo].[conversations] ([id])
GO
ALTER TABLE [dbo].[messages] CHECK CONSTRAINT [FKt492th6wsovh1nush5yl5jj8e]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FKduo4ugsictahhrd219y86wqho] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FKduo4ugsictahhrd219y86wqho]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK4ery255787xl56k025fyxrqe9] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staffid])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK4ery255787xl56k025fyxrqe9]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK624gtjin3po807j3vix093tlf] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK624gtjin3po807j3vix093tlf]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK6jbkiysveyovjotl4sldii03i] FOREIGN KEY([storage_id])
REFERENCES [dbo].[storage] ([storageid])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK6jbkiysveyovjotl4sldii03i]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKdimvsocblb17f45ikjr6xn1wj] FOREIGN KEY([voucher_id])
REFERENCES [dbo].[vouchers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKdimvsocblb17f45ikjr6xn1wj]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKnbkbw16ixkd1bftyotbjipsj6] FOREIGN KEY([manager_id])
REFERENCES [dbo].[manager] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKnbkbw16ixkd1bftyotbjipsj6]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FKby2skjf3ov608yb6nm16b49lg] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FKby2skjf3ov608yb6nm16b49lg]
GO
ALTER TABLE [dbo].[storage_item]  WITH CHECK ADD  CONSTRAINT [FKtkpfvcfdmqf2jvx734qedmdlq] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[storage_item] CHECK CONSTRAINT [FKtkpfvcfdmqf2jvx734qedmdlq]
GO
ALTER TABLE [dbo].[storage_transaction]  WITH CHECK ADD  CONSTRAINT [FK6yqp07j0e06kfuvvgh5y87ok7] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[storage_transaction] CHECK CONSTRAINT [FK6yqp07j0e06kfuvvgh5y87ok7]
GO
ALTER TABLE [dbo].[storage_transaction]  WITH CHECK ADD  CONSTRAINT [FKajjqev72gta9kio2ppnhr49u] FOREIGN KEY([storage_id])
REFERENCES [dbo].[storage] ([storageid])
GO
ALTER TABLE [dbo].[storage_transaction] CHECK CONSTRAINT [FKajjqev72gta9kio2ppnhr49u]
GO
ALTER TABLE [dbo].[support_activity]  WITH CHECK ADD  CONSTRAINT [FKlanvty3fvg8t2eugfedb01btx] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[support_activity] CHECK CONSTRAINT [FKlanvty3fvg8t2eugfedb01btx]
GO
ALTER TABLE [dbo].[task]  WITH CHECK ADD  CONSTRAINT [FK147ofm6vxubsm2dcjkg61jcbl] FOREIGN KEY([ma])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[task] CHECK CONSTRAINT [FK147ofm6vxubsm2dcjkg61jcbl]
GO
ALTER TABLE [dbo].[task]  WITH CHECK ADD  CONSTRAINT [FK47thqhru2kvnjvpij8yeeflm8] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staffid])
GO
ALTER TABLE [dbo].[task] CHECK CONSTRAINT [FK47thqhru2kvnjvpij8yeeflm8]
GO
ALTER TABLE [dbo].[task]  WITH CHECK ADD  CONSTRAINT [FKfy13petlv2mc40btju6afhyo6] FOREIGN KEY([manager_id])
REFERENCES [dbo].[manager] ([id])
GO
ALTER TABLE [dbo].[task] CHECK CONSTRAINT [FKfy13petlv2mc40btju6afhyo6]
GO
ALTER TABLE [dbo].[viewing_appointment]  WITH CHECK ADD  CONSTRAINT [FKcbqfxkqf7qpyxyrb63js5th2v] FOREIGN KEY([storage_id])
REFERENCES [dbo].[storage] ([storageid])
GO
ALTER TABLE [dbo].[viewing_appointment] CHECK CONSTRAINT [FKcbqfxkqf7qpyxyrb63js5th2v]
GO
ALTER TABLE [dbo].[wish_list]  WITH CHECK ADD  CONSTRAINT [FK1lnlly6r9bd5l5i0a5ibo7p9o] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[wish_list] CHECK CONSTRAINT [FK1lnlly6r9bd5l5i0a5ibo7p9o]
GO
ALTER TABLE [dbo].[wish_list]  WITH CHECK ADD  CONSTRAINT [FKsi5wri4f2q8qtf3026xrypo18] FOREIGN KEY([storage_id])
REFERENCES [dbo].[storage] ([storageid])
GO
ALTER TABLE [dbo].[wish_list] CHECK CONSTRAINT [FKsi5wri4f2q8qtf3026xrypo18]
GO
ALTER TABLE [dbo].[conversations]  WITH CHECK ADD CHECK  (([status]='PENDING_ASSIGNMENT' OR [status]='ARCHIVED' OR [status]='CLOSED' OR [status]='ACTIVE'))
GO
ALTER TABLE [dbo].[econtract]  WITH CHECK ADD CHECK  (([status]='REJECTED' OR [status]='APPROVED' OR [status]='SIGNED' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[leave_request]  WITH CHECK ADD CHECK  (([status]='TU_CHOI' OR [status]='DUYET' OR [status]='CHO_DUYET'))
GO
ALTER TABLE [dbo].[message_status]  WITH CHECK ADD CHECK  (([status]='READ' OR [status]='DELIVERED' OR [status]='SENT'))
GO
ALTER TABLE [dbo].[message_status]  WITH CHECK ADD CHECK  (([user_type]='SYSTEM' OR [user_type]='MANAGER' OR [user_type]='CUSTOMER'))
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD CHECK  (([message_type]='SYSTEM' OR [message_type]='FILE' OR [message_type]='IMAGE' OR [message_type]='TEXT'))
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD CHECK  (([sender_type]='SYSTEM' OR [sender_type]='MANAGER' OR [sender_type]='CUSTOMER'))
GO
ALTER TABLE [dbo].[roles]  WITH CHECK ADD CHECK  (([name]='MANAGER' OR [name]='STAFF' OR [name]='delivery' OR [name]='customer'))
GO
ALTER TABLE [dbo].[task]  WITH CHECK ADD CHECK  (([status]='REJECTED' OR [status]='RESOLVED' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD CHECK  (([status]='EXPIRED' OR [status]='INACTIVE' OR [status]='ACTIVE'))
GO
USE [master]
GO
ALTER DATABASE [SWP] SET  READ_WRITE 
GO
