USE [master]
GO
/****** Object:  Database [PS_GameData]    Script Date: 4/25/2024 8:58:00 AM ******/
CREATE DATABASE [PS_GameData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PS_GameData_Data', FILENAME = N'C:\ShaiyaServer\DATABASE\PS_GameData_Data.MDF' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'PS_GameData_Log', FILENAME = N'C:\ShaiyaServer\DATABASE\PS_GameData_Log.LDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PS_GameData] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PS_GameData].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [PS_GameData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PS_GameData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PS_GameData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PS_GameData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PS_GameData] SET ARITHABORT OFF 
GO
ALTER DATABASE [PS_GameData] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PS_GameData] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [PS_GameData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PS_GameData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PS_GameData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PS_GameData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PS_GameData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PS_GameData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PS_GameData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PS_GameData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PS_GameData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PS_GameData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PS_GameData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PS_GameData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PS_GameData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PS_GameData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PS_GameData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PS_GameData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PS_GameData] SET  MULTI_USER 
GO
ALTER DATABASE [PS_GameData] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [PS_GameData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PS_GameData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PS_GameData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PS_GameData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PS_GameData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PS_GameData] SET QUERY_STORE = OFF
GO
USE [PS_GameData]
GO
/****** Object:  Table [dbo].[UserStoredItems]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStoredItems](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [tinyint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[ItemUID] [bigint] NOT NULL,
	[Slot] [int] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Gem1] [tinyint] NOT NULL,
	[Gem2] [tinyint] NOT NULL,
	[Gem3] [tinyint] NOT NULL,
	[Gem4] [tinyint] NOT NULL,
	[Gem5] [tinyint] NOT NULL,
	[Gem6] [tinyint] NOT NULL,
	[Craftname] [varchar](20) NULL,
	[Count] [tinyint] NOT NULL,
	[Maketime] [datetime] NOT NULL,
	[Maketype] [char](1) NOT NULL,
	[Del] [bit] NOT NULL,
 CONSTRAINT [IX_UserStoredItems_1] UNIQUE NONCLUSTERED 
(
	[ItemUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharItems]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharItems](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemUID] [bigint] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[Bag] [tinyint] NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Gem1] [tinyint] NOT NULL,
	[Gem2] [tinyint] NOT NULL,
	[Gem3] [tinyint] NOT NULL,
	[Gem4] [tinyint] NOT NULL,
	[Gem5] [tinyint] NOT NULL,
	[Gem6] [tinyint] NOT NULL,
	[Craftname] [varchar](20) NULL,
	[Count] [tinyint] NOT NULL,
	[Maketime] [datetime] NOT NULL,
	[Maketype] [varchar](1) NOT NULL,
	[Del] [bit] NOT NULL,
 CONSTRAINT [PK_CharItems] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[ItemUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Items]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[View_Items]

/* 

Created by frsunny@hotmail.com, 2004-08-19

갯수를 구하기 위해 생성된 View

*/

AS

SELECT ItemID, Type, TypeID
FROM CharItems WITH(NOLOCK)

UNION ALL

SELECT ItemID, Type, TypeID
FROM UserStoredItems WITH(NOLOCK)


GO
/****** Object:  Table [dbo].[_CreatedChars]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_CreatedChars](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [tinyint] NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[CharID] [int] NOT NULL,
	[CharName] [nvarchar](50) NOT NULL,
	[Family] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserUID] [int] NULL,
 CONSTRAINT [PK_CreatedChars] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_DeletedChars]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_DeletedChars](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [tinyint] NOT NULL,
	[CharID] [int] NOT NULL,
	[DeleteDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DeleteChars] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_GuildDetailsBack]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_GuildDetailsBack](
	[GuildID] [int] NOT NULL,
	[UseHouse] [tinyint] NOT NULL,
	[BuyHouse] [tinyint] NOT NULL,
	[Rank] [tinyint] NOT NULL,
	[Etin] [int] NOT NULL,
	[EtinReturnCnt] [int] NOT NULL,
	[KeepEtin] [int] NOT NULL,
	[Remark] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_GuildRankPoint]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_GuildRankPoint](
	[GuildID] [int] NOT NULL,
	[GuildPoint] [int] NOT NULL,
 CONSTRAINT [PK__GuildRankPoint] PRIMARY KEY CLUSTERED 
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_GuildsBack]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_GuildsBack](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[GuildID] [int] NOT NULL,
	[GuildName] [varchar](30) NOT NULL,
	[MasterUserID] [varchar](12) NOT NULL,
	[MasterCharID] [int] NOT NULL,
	[MasterName] [varchar](30) NOT NULL,
	[Country] [tinyint] NOT NULL,
	[TotalCount] [smallint] NOT NULL,
	[GuildPoint] [int] NOT NULL,
	[Del] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BanChars]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanChars](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[BanID] [int] NOT NULL,
	[BanName] [varchar](50) NOT NULL,
	[Memo] [varchar](50) NULL,
	[BanDate] [datetime] NULL,
 CONSTRAINT [PK_BanChars] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[BanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsiderBank]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsiderBank](
	[UserUID] [int] NULL,
	[ItemUID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsiderInven]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsiderInven](
	[CharID] [int] NULL,
	[ItemUID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharApplySkills]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharApplySkills](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[SkillID] [smallint] NOT NULL,
	[SkillLevel] [tinyint] NOT NULL,
	[LeftResetTime] [int] NOT NULL,
 CONSTRAINT [PK_CharApplySkills] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[SkillID] ASC,
	[SkillLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharBacks]    Script Date: 4/25/2024 8:58:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharBacks](
	[ServerID] [tinyint] NOT NULL,
	[UserID] [varchar](12) NOT NULL,
	[UserUID] [int] NOT NULL,
	[CharID] [int] IDENTITY(1,1) NOT NULL,
	[CharName] [varchar](50) NOT NULL,
	[New] [tinyint] NOT NULL,
	[Del] [tinyint] NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[Family] [tinyint] NOT NULL,
	[Grow] [tinyint] NOT NULL,
	[Hair] [tinyint] NOT NULL,
	[Face] [tinyint] NOT NULL,
	[Size] [tinyint] NOT NULL,
	[Job] [tinyint] NOT NULL,
	[Sex] [tinyint] NOT NULL,
	[Level] [smallint] NOT NULL,
	[StatPoint] [smallint] NOT NULL,
	[SkillPoint] [smallint] NOT NULL,
	[Str] [smallint] NOT NULL,
	[Dex] [smallint] NOT NULL,
	[Rec] [smallint] NOT NULL,
	[Int] [smallint] NOT NULL,
	[Luc] [smallint] NOT NULL,
	[Wis] [smallint] NOT NULL,
	[HP] [smallint] NOT NULL,
	[MP] [smallint] NOT NULL,
	[SP] [smallint] NOT NULL,
	[Map] [smallint] NOT NULL,
	[Dir] [smallint] NOT NULL,
	[Exp] [int] NOT NULL,
	[Money] [int] NOT NULL,
	[PosX] [real] NOT NULL,
	[PosY] [real] NOT NULL,
	[Posz] [real] NOT NULL,
	[Hg] [smallint] NOT NULL,
	[Vg] [smallint] NOT NULL,
	[Cg] [tinyint] NOT NULL,
	[Og] [tinyint] NOT NULL,
	[Ig] [tinyint] NOT NULL,
	[K1] [int] NOT NULL,
	[K2] [int] NOT NULL,
	[K3] [int] NOT NULL,
	[K4] [int] NOT NULL,
	[KillLevel] [tinyint] NOT NULL,
	[DeadLevel] [tinyint] NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL,
	[JoinDate] [datetime] NULL,
	[LeaveDate] [datetime] NULL,
	[RenameCnt] [tinyint] NOT NULL,
	[OldCharName] [varchar](30) NULL,
	[RemainTime] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharEvents]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharEvents](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[Event1] [tinyint] NOT NULL,
	[Event2] [tinyint] NOT NULL,
	[Event3] [tinyint] NULL,
	[Event4] [tinyint] NULL,
	[Event5] [tinyint] NULL,
	[Event6] [tinyint] NULL,
	[Event7] [tinyint] NULL,
	[Event8] [tinyint] NULL,
	[Event9] [tinyint] NULL,
	[Event10] [tinyint] NULL,
 CONSTRAINT [PK_CharEvents] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharQuests]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharQuests](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[QuestID] [smallint] NOT NULL,
	[Delay] [smallint] NOT NULL,
	[Count1] [tinyint] NOT NULL,
	[Count2] [tinyint] NOT NULL,
	[Count3] [tinyint] NOT NULL,
	[Success] [tinyint] NOT NULL,
	[Finish] [tinyint] NOT NULL,
	[Del] [bit] NOT NULL,
 CONSTRAINT [PK_CharQuests] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[QuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharQuickSlotBacks]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharQuickSlotBacks](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[QuickBar] [tinyint] NOT NULL,
	[QuickSlot] [tinyint] NOT NULL,
	[Bag] [tinyint] NOT NULL,
	[Number] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharQuickSlots]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharQuickSlots](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[QuickBar] [tinyint] NOT NULL,
	[QuickSlot] [tinyint] NOT NULL,
	[Bag] [tinyint] NOT NULL,
	[Number] [smallint] NOT NULL,
 CONSTRAINT [PK_CharQuickSlots] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[QuickBar] ASC,
	[QuickSlot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharRenameLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharRenameLog](
	[ServerID] [tinyint] NULL,
	[CharID] [int] NULL,
	[CharName] [nvarchar](50) NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chars]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chars](
	[ServerID] [tinyint] NOT NULL,
	[UserID] [varchar](12) NOT NULL,
	[UserUID] [int] NOT NULL,
	[CharID] [int] IDENTITY(1,1) NOT NULL,
	[CharName] [nvarchar](50) NOT NULL,
	[New] [tinyint] NOT NULL,
	[Del] [tinyint] NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[Family] [tinyint] NOT NULL,
	[Grow] [tinyint] NOT NULL,
	[Hair] [tinyint] NOT NULL,
	[Face] [tinyint] NOT NULL,
	[Size] [tinyint] NOT NULL,
	[Job] [tinyint] NOT NULL,
	[Sex] [tinyint] NOT NULL,
	[Level] [smallint] NOT NULL,
	[StatPoint] [smallint] NOT NULL,
	[SkillPoint] [smallint] NOT NULL,
	[Str] [smallint] NOT NULL,
	[Dex] [smallint] NOT NULL,
	[Rec] [smallint] NOT NULL,
	[Int] [smallint] NOT NULL,
	[Luc] [smallint] NOT NULL,
	[Wis] [smallint] NOT NULL,
	[HP] [smallint] NOT NULL,
	[MP] [smallint] NOT NULL,
	[SP] [smallint] NOT NULL,
	[Map] [smallint] NOT NULL,
	[Dir] [smallint] NOT NULL,
	[Exp] [int] NOT NULL,
	[Money] [int] NOT NULL,
	[PosX] [real] NOT NULL,
	[PosY] [real] NOT NULL,
	[Posz] [real] NOT NULL,
	[Hg] [smallint] NOT NULL,
	[Vg] [smallint] NOT NULL,
	[Cg] [tinyint] NOT NULL,
	[Og] [tinyint] NOT NULL,
	[Ig] [tinyint] NOT NULL,
	[K1] [int] NOT NULL,
	[K2] [int] NOT NULL,
	[K3] [int] NOT NULL,
	[K4] [int] NOT NULL,
	[KillLevel] [tinyint] NOT NULL,
	[DeadLevel] [tinyint] NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL,
	[JoinDate] [datetime] NULL,
	[LeaveDate] [datetime] NULL,
	[RenameCnt] [tinyint] NOT NULL,
	[OldCharName] [nvarchar](50) NULL,
	[RemainTime] [int] NOT NULL,
 CONSTRAINT [PK_Chars] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharSavePoint]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharSavePoint](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[MapID] [smallint] NOT NULL,
	[PosX] [real] NOT NULL,
	[PosY] [real] NOT NULL,
	[PosZ] [real] NOT NULL,
 CONSTRAINT [PK_CharSavePoint] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[Slot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharSavePointBack]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharSavePointBack](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[MapID] [smallint] NOT NULL,
	[PosX] [real] NOT NULL,
	[PosY] [real] NOT NULL,
	[PosZ] [real] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharSkillBacks]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharSkillBacks](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[SkillID] [smallint] NOT NULL,
	[SkillLevel] [tinyint] NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Delay] [smallint] NOT NULL,
	[CreateTime] [smalldatetime] NOT NULL,
	[Del] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharSkills]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharSkills](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[SkillID] [smallint] NOT NULL,
	[SkillLevel] [tinyint] NOT NULL,
	[Number] [tinyint] NOT NULL,
	[Delay] [smallint] NOT NULL,
	[CreateTime] [smalldatetime] NOT NULL,
	[Del] [bit] NOT NULL,
 CONSTRAINT [PK_CharSkills] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[SkillID] ASC,
	[SkillLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog_CharSkill1]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog_CharSkill1](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[UseCount] [tinyint] NOT NULL,
	[GetPoint] [smallint] NOT NULL,
	[SkillPoint] [smallint] NOT NULL,
	[UseDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EventLog_CharSkill1] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[UseCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog_CharSkill2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog_CharSkill2](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[UseCount] [tinyint] NOT NULL,
	[SkillID] [smallint] NOT NULL,
	[SkillLevel] [tinyint] NOT NULL,
	[Number] [tinyint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_EventLog_CharSkill2] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[UseCount] ASC,
	[SkillID] ASC,
	[SkillLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog_CharStat]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog_CharStat](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[UseCount] [tinyint] NOT NULL,
	[GetPoint] [smallint] NOT NULL,
	[StatPoint] [smallint] NOT NULL,
	[Str] [smallint] NOT NULL,
	[Dex] [smallint] NOT NULL,
	[Rec] [smallint] NOT NULL,
	[Int] [smallint] NOT NULL,
	[Luc] [smallint] NOT NULL,
	[Wis] [smallint] NOT NULL,
	[UseDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EventLog_CharStat] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[UseCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendChars]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendChars](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[FriendID] [int] NOT NULL,
	[FriendName] [nvarchar](50) NOT NULL,
	[Family] [tinyint] NOT NULL,
	[Grow] [tinyint] NOT NULL,
	[Job] [tinyint] NOT NULL,
	[Memo] [nvarchar](50) NULL,
	[Refuse] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[RefuseDate] [datetime] NULL,
 CONSTRAINT [PK_FriendChars] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[FriendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuildChars]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuildChars](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[GuildID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[GuildLevel] [tinyint] NOT NULL,
	[Del] [tinyint] NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[LeaveDate] [datetime] NULL,
 CONSTRAINT [PK_GuildChars] PRIMARY KEY NONCLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_GuildChars_CharID]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE CLUSTERED INDEX [IX_GuildChars_CharID] ON [dbo].[GuildChars]
(
	[CharID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuildDetails]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuildDetails](
	[GuildID] [int] NOT NULL,
	[UseHouse] [tinyint] NOT NULL,
	[BuyHouse] [tinyint] NOT NULL,
	[Rank] [tinyint] NOT NULL,
	[Etin] [int] NOT NULL,
	[EtinReturnCnt] [int] NOT NULL,
	[KeepEtin] [int] NOT NULL,
	[Remark] [varchar](64) NULL,
 CONSTRAINT [PK_GuildHouses] PRIMARY KEY CLUSTERED 
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuildNpcLv]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuildNpcLv](
	[GuildID] [int] NOT NULL,
	[GNpcType] [smallint] NOT NULL,
	[NpcLevel] [tinyint] NOT NULL,
	[Number] [tinyint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Del] [tinyint] NOT NULL,
 CONSTRAINT [PK_GuildNpcLv] PRIMARY KEY CLUSTERED 
(
	[GuildID] ASC,
	[GNpcType] ASC,
	[NpcLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuildRankLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuildRankLog](
	[GuildID] [int] NOT NULL,
	[GuildValue] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[TotalRank] [int] NOT NULL,
	[Change] [int] NULL,
	[TotalChange] [int] NULL,
	[RankTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuildRankLog2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuildRankLog2](
	[GuildID] [int] NOT NULL,
	[GuildValue] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[TotalRank] [int] NOT NULL,
	[Change] [int] NULL,
	[TotalChange] [int] NULL,
	[RankTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guilds]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guilds](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[GuildID] [int] NOT NULL,
	[GuildName] [nvarchar](50) NOT NULL,
	[MasterUserID] [varchar](12) NOT NULL,
	[MasterCharID] [int] NOT NULL,
	[MasterName] [nvarchar](50) NOT NULL,
	[Country] [tinyint] NOT NULL,
	[TotalCount] [smallint] NOT NULL,
	[GuildPoint] [int] NOT NULL,
	[Del] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_Guilds] PRIMARY KEY CLUSTERED 
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuildStoredItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuildStoredItems](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[GuildID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[ItemUID] [bigint] NOT NULL,
	[Slot] [int] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Gem1] [tinyint] NOT NULL,
	[Gem2] [tinyint] NOT NULL,
	[Gem3] [tinyint] NOT NULL,
	[Gem4] [tinyint] NOT NULL,
	[Gem5] [tinyint] NOT NULL,
	[Gem6] [tinyint] NOT NULL,
	[Craftname] [varchar](20) NULL,
	[Count] [tinyint] NOT NULL,
	[Maketime] [datetime] NOT NULL,
	[Maketype] [char](1) NOT NULL,
	[Del] [bit] NOT NULL,
 CONSTRAINT [PK_GuildStoredItems] PRIMARY KEY CLUSTERED 
(
	[ItemUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HackLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HackLog](
	[CharID] [int] NULL,
	[Money] [int] NULL,
	[CurDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keeps]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keeps](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[KeepID] [int] NOT NULL,
	[OwnCountry] [tinyint] NOT NULL,
	[ResetTime] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Market]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Market](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[MarketID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[MinMoney] [int] NOT NULL,
	[DirectMoney] [int] NOT NULL,
	[MarketType] [tinyint] NOT NULL,
	[GuaranteeMoney] [int] NOT NULL,
	[TenderCharID] [int] NOT NULL,
	[TenderCharName] [varchar](21) NULL,
	[TenderMoney] [int] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Del] [int] NOT NULL,
 CONSTRAINT [PK_Market] PRIMARY KEY CLUSTERED 
(
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketCharConcern]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketCharConcern](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
 CONSTRAINT [PK_MarketCharConcern] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketCharResultItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketCharResultItems](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
	[Result] [tinyint] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MarketCharResultItems] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC,
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketCharResultItems_DelLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketCharResultItems_DelLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[CharID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
	[Result] [tinyint] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DelDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketCharResultMoney]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketCharResultMoney](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[MoneyID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
	[Result] [tinyint] NOT NULL,
	[Money] [int] NOT NULL,
	[GuaranteeMoney] [int] NOT NULL,
	[ReturnMoney] [int] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Gem1] [tinyint] NOT NULL,
	[Gem2] [tinyint] NOT NULL,
	[Gem3] [tinyint] NOT NULL,
	[Gem4] [tinyint] NOT NULL,
	[Gem5] [tinyint] NOT NULL,
	[Gem6] [tinyint] NOT NULL,
	[Craftname] [varchar](20) NOT NULL,
	[Count] [tinyint] NOT NULL,
 CONSTRAINT [PK_MarketCharResultMoney] PRIMARY KEY CLUSTERED 
(
	[MoneyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketCharResultMoney_DelLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketCharResultMoney_DelLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[MoneyID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
	[Result] [tinyint] NOT NULL,
	[Money] [int] NOT NULL,
	[GuaranteeMoney] [int] NOT NULL,
	[ReturnMoney] [int] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Gem1] [tinyint] NOT NULL,
	[Gem2] [tinyint] NOT NULL,
	[Gem3] [tinyint] NOT NULL,
	[Gem4] [tinyint] NOT NULL,
	[Gem5] [tinyint] NOT NULL,
	[Gem6] [tinyint] NOT NULL,
	[Craftname] [varchar](20) NOT NULL,
	[Count] [tinyint] NOT NULL,
	[DelDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketItems](
	[MarketID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemUID] [bigint] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Gem1] [tinyint] NOT NULL,
	[Gem2] [tinyint] NOT NULL,
	[Gem3] [tinyint] NOT NULL,
	[Gem4] [tinyint] NOT NULL,
	[Gem5] [tinyint] NOT NULL,
	[Gem6] [tinyint] NOT NULL,
	[Craftname] [varchar](20) NULL,
	[Count] [tinyint] NOT NULL,
	[Maketime] [datetime] NOT NULL,
	[Maketype] [varchar](1) NOT NULL,
 CONSTRAINT [PK_MarketItems] PRIMARY KEY CLUSTERED 
(
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketItems_DelLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketItems_DelLog](
	[MarketID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemUID] [bigint] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[Gem1] [tinyint] NOT NULL,
	[Gem2] [tinyint] NOT NULL,
	[Gem3] [tinyint] NOT NULL,
	[Gem4] [tinyint] NOT NULL,
	[Gem5] [tinyint] NOT NULL,
	[Gem6] [tinyint] NOT NULL,
	[Craftname] [varchar](20) NULL,
	[Count] [tinyint] NOT NULL,
	[Maketime] [datetime] NOT NULL,
	[Maketype] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointErrorLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointErrorLog](
	[UserUID] [int] NOT NULL,
	[CharID] [int] NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[Ret] [int] NOT NULL,
	[ErrDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointGiftNotify]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointGiftNotify](
	[UserUID] [int] NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[SendCharName] [varchar](30) NOT NULL,
	[RecvDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointLog](
	[UserUID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[UsePoint] [int] NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[TargetName] [varchar](30) NULL,
	[UseDate] [datetime] NOT NULL,
	[UseType] [tinyint] NOT NULL,
	[RemainPoint] [int] NULL,
	[OrderNumber] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [tinyint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemUID] [bigint] NOT NULL,
	[Quality] [smallint] NOT NULL,
	[ItemCount] [tinyint] NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[VerifyCode] [bigint] NULL,
	[BuyDate] [datetime] NOT NULL,
	[ReceiveDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductLog] PRIMARY KEY CLUSTERED 
(
	[UserUID] ASC,
	[CharID] ASC,
	[ItemUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestAward]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestAward](
	[ItemID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TmpGuildEtin]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TmpGuildEtin](
	[GuildID] [int] NULL,
	[Etin] [int] NULL,
	[CurTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaxGrow]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaxGrow](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [tinyint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[Country] [tinyint] NOT NULL,
	[MaxGrow] [tinyint] NOT NULL,
	[Del] [bit] NOT NULL,
 CONSTRAINT [PK_UserMaxGrow] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC,
	[UserUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStoredMoney]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStoredMoney](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [tinyint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[Money] [bigint] NOT NULL,
	[LastAccessTime] [datetime] NOT NULL,
	[Del] [bit] NOT NULL,
 CONSTRAINT [PK_UserStoredMoney] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC,
	[UserUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStoredPointItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStoredPointItems](
	[UserUID] [int] NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemCount] [tinyint] NOT NULL,
	[BuyDate] [datetime] NULL,
 CONSTRAINT [PK_UserProductItems] PRIMARY KEY CLUSTERED 
(
	[UserUID] ASC,
	[Slot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorldInfo]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorldInfo](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[LastWorldTime] [int] NOT NULL,
	[GodBless_Light] [int] NOT NULL,
	[GodBless_Dark] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_CharItems_ItemID]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharItems_ItemID] ON [dbo].[CharItems]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Chars_UserUID]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Chars_UserUID] ON [dbo].[Chars]
(
	[UserUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GuildChars_GuildID]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_GuildChars_GuildID] ON [dbo].[GuildChars]
(
	[GuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Market]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Market] ON [dbo].[Market]
(
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MarketCharResultItems]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_MarketCharResultItems] ON [dbo].[MarketCharResultItems]
(
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MarketCharResultMoney]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_MarketCharResultMoney] ON [dbo].[MarketCharResultMoney]
(
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PointGiftNotify]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_PointGiftNotify] ON [dbo].[PointGiftNotify]
(
	[UserUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PointLog]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_PointLog] ON [dbo].[PointLog]
(
	[CharID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PointLog_UserUID]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_PointLog_UserUID] ON [dbo].[PointLog]
(
	[UserUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductLog]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductLog] ON [dbo].[ProductLog]
(
	[ReceiveDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserStoredItems]    Script Date: 4/25/2024 8:58:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserStoredItems] ON [dbo].[UserStoredItems]
(
	[UserUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CharEvents] ADD  CONSTRAINT [DF_CharEvents_Event1]  DEFAULT (0) FOR [Event1]
GO
ALTER TABLE [dbo].[CharEvents] ADD  CONSTRAINT [DF_CharEvents_Event2]  DEFAULT (0) FOR [Event2]
GO
ALTER TABLE [dbo].[CharItems] ADD  CONSTRAINT [DF_CharItems_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[CharQuests] ADD  CONSTRAINT [DF_CharQuests_Count1]  DEFAULT (0) FOR [Count1]
GO
ALTER TABLE [dbo].[CharQuests] ADD  CONSTRAINT [DF_CharQuests_Count2]  DEFAULT (0) FOR [Count2]
GO
ALTER TABLE [dbo].[CharQuests] ADD  CONSTRAINT [DF_CharQuests_Count3]  DEFAULT (0) FOR [Count3]
GO
ALTER TABLE [dbo].[CharQuests] ADD  CONSTRAINT [DF_CharQuests_Success]  DEFAULT (0) FOR [Success]
GO
ALTER TABLE [dbo].[CharQuests] ADD  CONSTRAINT [DF_CharQuests_Finish]  DEFAULT (0) FOR [Finish]
GO
ALTER TABLE [dbo].[CharQuests] ADD  CONSTRAINT [DF_CharQuests_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[CharRenameLog] ADD  CONSTRAINT [DF_CharRenameLog_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_New]  DEFAULT ((1)) FOR [New]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_Del]  DEFAULT ((0)) FOR [Del]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_level]  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_StatPoint]  DEFAULT ((0)) FOR [StatPoint]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_SkillPoint]  DEFAULT ((0)) FOR [SkillPoint]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_map]  DEFAULT ((0)) FOR [Map]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_dir]  DEFAULT ((0)) FOR [Dir]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_exp]  DEFAULT ((0)) FOR [Exp]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_money]  DEFAULT ((0)) FOR [Money]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_posx]  DEFAULT ((674.442)) FOR [PosX]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_posy]  DEFAULT ((3.640)) FOR [PosY]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_posz]  DEFAULT ((1000.924)) FOR [Posz]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_K1]  DEFAULT ((0)) FOR [K1]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_K2]  DEFAULT ((0)) FOR [K2]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_K3]  DEFAULT ((0)) FOR [K3]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_K4]  DEFAULT ((0)) FOR [K4]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_KillLevel]  DEFAULT ((0)) FOR [KillLevel]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_DeadLevel]  DEFAULT ((0)) FOR [DeadLevel]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Chars] ADD  CONSTRAINT [DF_Chars_RemainTime]  DEFAULT ((0)) FOR [RemainTime]
GO
ALTER TABLE [dbo].[CharSkills] ADD  CONSTRAINT [DF_CharSkills_RegDate]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[CharSkills] ADD  CONSTRAINT [DF_CharSkills_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[FriendChars] ADD  CONSTRAINT [DF_Friends_Ban]  DEFAULT ((0)) FOR [Refuse]
GO
ALTER TABLE [dbo].[GuildChars] ADD  CONSTRAINT [DF_GuildChars_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[GuildDetails] ADD  CONSTRAINT [DF_GuildHouses_UseHouse]  DEFAULT (0) FOR [UseHouse]
GO
ALTER TABLE [dbo].[GuildDetails] ADD  CONSTRAINT [DF_GuildDetails_BuyHouse]  DEFAULT (0) FOR [BuyHouse]
GO
ALTER TABLE [dbo].[GuildDetails] ADD  CONSTRAINT [DF_GuildHouses_Rank]  DEFAULT (31) FOR [Rank]
GO
ALTER TABLE [dbo].[GuildDetails] ADD  CONSTRAINT [DF_GuildHouses_Etine]  DEFAULT (0) FOR [Etin]
GO
ALTER TABLE [dbo].[GuildDetails] ADD  CONSTRAINT [DF_GuildDetails_EtinReturnCnt]  DEFAULT (0) FOR [EtinReturnCnt]
GO
ALTER TABLE [dbo].[GuildDetails] ADD  CONSTRAINT [DF_GuildDetails_KeepEtin]  DEFAULT (2000) FOR [KeepEtin]
GO
ALTER TABLE [dbo].[GuildNpcLv] ADD  CONSTRAINT [DF_GuildNpcLv_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[GuildNpcLv] ADD  CONSTRAINT [DF_GuildNpcLv_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[GuildRankLog] ADD  CONSTRAINT [DF_GuildRankLog_TotalRank]  DEFAULT (0) FOR [TotalRank]
GO
ALTER TABLE [dbo].[GuildRankLog] ADD  CONSTRAINT [DF_GuildRankLog_RankTime]  DEFAULT (getdate()) FOR [RankTime]
GO
ALTER TABLE [dbo].[GuildRankLog2] ADD  CONSTRAINT [DF_GuildRankLog2_TotalRank]  DEFAULT (0) FOR [TotalRank]
GO
ALTER TABLE [dbo].[GuildRankLog2] ADD  CONSTRAINT [DF_GuildRankLog2_RankTime]  DEFAULT (getdate()) FOR [RankTime]
GO
ALTER TABLE [dbo].[Guilds] ADD  CONSTRAINT [DF_Guilds_Del]  DEFAULT ((0)) FOR [Del]
GO
ALTER TABLE [dbo].[GuildStoredItems] ADD  CONSTRAINT [DF_GuildStoredItems_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[HackLog] ADD  CONSTRAINT [DF_HackLog_CurDate]  DEFAULT (getdate()) FOR [CurDate]
GO
ALTER TABLE [dbo].[Market] ADD  CONSTRAINT [DF_Market_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[PointErrorLog] ADD  CONSTRAINT [DF_PointErrorLog_ErrDate]  DEFAULT (getdate()) FOR [ErrDate]
GO
ALTER TABLE [dbo].[PointGiftNotify] ADD  CONSTRAINT [DF_PointGiftNotify_UseDate]  DEFAULT (getdate()) FOR [RecvDate]
GO
ALTER TABLE [dbo].[PointLog] ADD  CONSTRAINT [DF_PointLog_UseDate]  DEFAULT (getdate()) FOR [UseDate]
GO
ALTER TABLE [dbo].[UserMaxGrow] ADD  CONSTRAINT [DF_UserMaxGrow_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[UserStoredItems] ADD  CONSTRAINT [DF_UserStoredItems_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[UserStoredMoney] ADD  CONSTRAINT [DF_UserStoredMoney_Money]  DEFAULT (0) FOR [Money]
GO
ALTER TABLE [dbo].[UserStoredMoney] ADD  CONSTRAINT [DF_UserStoredMoney_LastAccessTime]  DEFAULT (getdate()) FOR [LastAccessTime]
GO
ALTER TABLE [dbo].[UserStoredMoney] ADD  CONSTRAINT [DF_UserStoredMoney_Del]  DEFAULT (0) FOR [Del]
GO
ALTER TABLE [dbo].[UserStoredPointItems] ADD  CONSTRAINT [DF_UserProductItems_BuyDate]  DEFAULT (getdate()) FOR [BuyDate]
GO
/****** Object:  StoredProcedure [dbo].[CKeepObeliskMgr]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CKeepObeliskMgr] AS
GO
/****** Object:  StoredProcedure [dbo].[DBKillCountSave]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DBKillCountSave] AS
GO
/****** Object:  StoredProcedure [dbo].[dt_addtosourcecontrol_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_addtosourcecontrol_u]
    @vchSourceSafeINI nvarchar(255) = '',
    @vchProjectName   nvarchar(255) ='',
    @vchComment       nvarchar(255) ='',
    @vchLoginName     nvarchar(255) ='',
    @vchPassword      nvarchar(255) =''

as
	-- This procedure should no longer be called;  dt_addtosourcecontrol should be called instead.
	-- Calls are forwarded to dt_addtosourcecontrol to maintain backward compatibility
	set nocount on
	exec dbo.dt_addtosourcecontrol 
		@vchSourceSafeINI, 
		@vchProjectName, 
		@vchComment, 
		@vchLoginName, 
		@vchPassword


GO
/****** Object:  StoredProcedure [dbo].[dt_adduserobject]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Add an object to the dtproperties table
*/
create procedure [dbo].[dt_adduserobject]
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity
GO
/****** Object:  StoredProcedure [dbo].[dt_adduserobject_vcs]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[dt_adduserobject_vcs]
    @vchProperty varchar(64)

as

set nocount on

declare @iReturn int
    /*
    ** Create the user object if it does not exist already
    */
    begin transaction
        select @iReturn = objectid from dbo.dtproperties where property = @vchProperty
        if @iReturn IS NULL
        begin
            insert dbo.dtproperties (property) VALUES (@vchProperty)
            update dbo.dtproperties set objectid=@@identity
                    where id=@@identity and property=@vchProperty
            select @iReturn = @@identity
        end
    commit
    return @iReturn


GO
/****** Object:  StoredProcedure [dbo].[dt_checkinobject]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_checkinobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255)='',
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     Text = '', /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     Text = '', /* create stream */
    @txStream3     Text = ''  /* grant stream  */


as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @iStreamObjectId int

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iPropertyObjectId int
	select @iPropertyObjectId  = 0

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    declare @iReturnValue	  int
    declare @pos			  int
    declare @vchProcLinePiece varchar(255)

    
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        if @iActionFlag = 1
        begin
            /* Procedure Can have up to three streams
            Drop Stream, Create Stream, GRANT stream */

            begin tran compile_all

            /* try to compile the streams */
            exec (@txStream1)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream2)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream3)
            if @@error <> 0 GOTO E_Compile_Fail
        end

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        
        if @iActionFlag = 1
        begin
            
            declare @iStreamLength int
			
			select @pos=1
			select @iStreamLength = datalength(@txStream2)
			
			if @iStreamLength > 0
			begin
			
				while @pos < @iStreamLength
				begin
						
					select @vchProcLinePiece = substring(@txStream2, @pos, 255)
					
					exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
            		if @iReturn <> 0 GOTO E_OAError
            		
					select @pos = @pos + 255
					
				end
            
				exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
														'CheckIn_StoredProcedure',
														NULL,
														@sProjectName = @vchProjectName,
														@sSourceSafeINI = @vchSourceSafeINI,
														@sServerName = @vchServerName,
														@sDatabaseName = @vchDatabaseName,
														@sObjectName = @vchObjectName,
														@sComment = @vchComment,
														@sLoginName = @vchLoginName,
														@sPassword = @vchPassword,
														@iVCSFlags = @iVCSFlags,
														@iActionFlag = @iActionFlag,
														@sStream = ''
                                        
			end
        end
        else
        begin
        
            select colid, text into #ProcLines
            from syscomments
            where id = object_id(@vchObjectName)
            order by colid

            declare @iCurProcLine int
            declare @iProcLines int
            select @iCurProcLine = 1
            select @iProcLines = (select count(*) from #ProcLines)
            while @iCurProcLine <= @iProcLines
            begin
                select @pos = 1
                declare @iCurLineSize int
                select @iCurLineSize = len((select text from #ProcLines where colid = @iCurProcLine))
                while @pos <= @iCurLineSize
                begin                
                    select @vchProcLinePiece = convert(varchar(255),
                        substring((select text from #ProcLines where colid = @iCurProcLine),
                                  @pos, 255 ))
                    exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
                    if @iReturn <> 0 GOTO E_OAError
                    select @pos = @pos + 255                  
                end
                select @iCurProcLine = @iCurProcLine + 1
            end
            drop table #ProcLines

            exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
													'CheckIn_StoredProcedure',
													NULL,
													@sProjectName = @vchProjectName,
													@sSourceSafeINI = @vchSourceSafeINI,
													@sServerName = @vchServerName,
													@sDatabaseName = @vchDatabaseName,
													@sObjectName = @vchObjectName,
													@sComment = @vchComment,
													@sLoginName = @vchLoginName,
													@sPassword = @vchPassword,
													@iVCSFlags = @iVCSFlags,
													@iActionFlag = @iActionFlag,
													@sStream = ''
        end

        if @iReturn <> 0 GOTO E_OAError

        if @iActionFlag = 1
        begin
            commit tran compile_all
            if @@error <> 0 GOTO E_Compile_Fail
        end

    end

CleanUp:
	return

E_Compile_Fail:
	declare @lerror int
	select @lerror = @@error
	rollback tran compile_all
	RAISERROR (@lerror,16,-1)
	goto CleanUp

E_OAError:
	if @iActionFlag = 1 rollback tran compile_all
	exec dbo.dt_displayoaerror @iObjectId, @iReturn
	goto CleanUp


GO
/****** Object:  StoredProcedure [dbo].[dt_checkinobject_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_checkinobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255)='',
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     text = '',  /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     text = '',  /* create stream */
    @txStream3     text = ''   /* grant stream  */

as	
	-- This procedure should no longer be called;  dt_checkinobject should be called instead.
	-- Calls are forwarded to dt_checkinobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkinobject
		@chObjectType,
		@vchObjectName,
		@vchComment,
		@vchLoginName,
		@vchPassword,
		@iVCSFlags,
		@iActionFlag,   
		@txStream1,		
		@txStream2,		
		@txStream3		


GO
/****** Object:  StoredProcedure [dbo].[dt_checkoutobject]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_checkoutobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255),
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId =0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @vchTempText varchar(255)

	/* this is for our strings */
	declare @iStreamObjectId int
	select @iStreamObjectId = 0

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        /* Procedure Can have up to three streams
           Drop Stream, Create Stream, GRANT stream */

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'CheckOut_StoredProcedure',
												NULL,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sComment = @vchComment,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword,
												@iVCSFlags = @iVCSFlags,
												@iActionFlag = @iActionFlag

        if @iReturn <> 0 GOTO E_OAError


        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #commenttext (id int identity, sourcecode varchar(255))


        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #commenttext (sourcecode) select @vchTempText
        end

        select 'VCS'=sourcecode from #commenttext order by id
        select 'SQL'=text from syscomments where id = object_id(@vchObjectName) order by colid

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp


GO
/****** Object:  StoredProcedure [dbo].[dt_checkoutobject_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_checkoutobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255),
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	-- This procedure should no longer be called;  dt_checkoutobject should be called instead.
	-- Calls are forwarded to dt_checkoutobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkoutobject
		@chObjectType,  
		@vchObjectName, 
		@vchComment,    
		@vchLoginName,  
		@vchPassword,  
		@iVCSFlags,    
		@iActionFlag 


GO
/****** Object:  StoredProcedure [dbo].[dt_displayoaerror]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dt_displayoaerror]
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)

    exec @hr = master.dbo.sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return

GO
/****** Object:  StoredProcedure [dbo].[dt_displayoaerror_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dt_displayoaerror_u]
    @iObject int,
    @iresult int
as
	-- This procedure should no longer be called;  dt_displayoaerror should be called instead.
	-- Calls are forwarded to dt_displayoaerror to maintain backward compatibility.
	set nocount on
	exec dbo.dt_displayoaerror
		@iObject,
		@iresult


GO
/****** Object:  StoredProcedure [dbo].[dt_droppropertiesbyid]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Drop one or all the associated properties of an object or an attribute 
**
**	dt_dropproperties objid, null or '' -- drop all properties of the object itself
**	dt_dropproperties objid, property -- drop the property
*/
create procedure [dbo].[dt_droppropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		delete from dbo.dtproperties where objectid=@id
	else
		delete from dbo.dtproperties 
			where objectid=@id and property=@property

GO
/****** Object:  StoredProcedure [dbo].[dt_dropuserobjectbyid]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Drop an object from the dbo.dtproperties table
*/
create procedure [dbo].[dt_dropuserobjectbyid]
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id
GO
/****** Object:  StoredProcedure [dbo].[dt_generateansiname]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
**	Generate an ansi name that is unique in the dtproperties.value column 
*/ 
create procedure [dbo].[dt_generateansiname](@name varchar(255) output) 
as 
	declare @prologue varchar(20) 
	declare @indexstring varchar(20) 
	declare @index integer 
 
	set @prologue = 'MSDT-A-' 
	set @index = 1 
 
	while 1 = 1 
	begin 
		set @indexstring = cast(@index as varchar(20)) 
		set @name = @prologue + @indexstring 
		if not exists (select value from dtproperties where value = @name) 
			break 
		 
		set @index = @index + 1 
 
		if (@index = 10000) 
			goto TooMany 
	end 
 
Leave: 
 
	return 
 
TooMany: 
 
	set @name = 'DIAGRAM' 
	goto Leave 
GO
/****** Object:  StoredProcedure [dbo].[dt_getobjwithprop]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Retrieve the owner object(s) of a given property
*/
create procedure [dbo].[dt_getobjwithprop]
	@property varchar(30),
	@value varchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value
GO
/****** Object:  StoredProcedure [dbo].[dt_getobjwithprop_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Retrieve the owner object(s) of a given property
*/
create procedure [dbo].[dt_getobjwithprop_u]
	@property varchar(30),
	@uvalue nvarchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@uvalue is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and uvalue=@uvalue
GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure [dbo].[dt_getpropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property
GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure [dbo].[dt_getpropertiesbyid_u]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property
GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_vcs]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[dt_getpropertiesbyid_vcs]
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )

GO
/****** Object:  StoredProcedure [dbo].[dt_getpropertiesbyid_vcs_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[dt_getpropertiesbyid_vcs_u]
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    -- This procedure should no longer be called;  dt_getpropertiesbyid_vcsshould be called instead.
	-- Calls are forwarded to dt_getpropertiesbyid_vcs to maintain backward compatibility.
	set nocount on
    exec dbo.dt_getpropertiesbyid_vcs
		@id,
		@property,
		@value output

GO
/****** Object:  StoredProcedure [dbo].[dt_isundersourcecontrol]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_isundersourcecontrol]
    @vchLoginName varchar(255) = '',
    @vchPassword  varchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @iStreamObjectId int
	select @iStreamObjectId   = 0

	declare @vchTempText varchar(255)

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if (@vchProjectName = '')	set @vchProjectName		= null
    if (@vchSourceSafeINI = '') set @vchSourceSafeINI	= null
    if (@vchServerName = '')	set @vchServerName		= null
    if (@vchDatabaseName = '')	set @vchDatabaseName	= null
    
    if (@vchProjectName is null) or (@vchSourceSafeINI is null) or (@vchServerName is null) or (@vchDatabaseName is null)
    begin
        RAISERROR('Not Under Source Control',16,-1)
        return
    end

    if @iWhoToo = 1
    begin

        /* Get List of Procs in the project */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'GetListOfObjects',
												NULL,
												@vchProjectName,
												@vchSourceSafeINI,
												@vchServerName,
												@vchDatabaseName,
												@vchLoginName,
												@vchPassword

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #ObjectList (id int identity, vchObjectlist varchar(255))

        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #ObjectList (vchObjectlist ) select @vchTempText
        end

        select vchObjectlist from #ObjectList order by id
    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp


GO
/****** Object:  StoredProcedure [dbo].[dt_isundersourcecontrol_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_isundersourcecontrol_u]
    @vchLoginName nvarchar(255) = '',
    @vchPassword  nvarchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as
	-- This procedure should no longer be called;  dt_isundersourcecontrol should be called instead.
	-- Calls are forwarded to dt_isundersourcecontrol to maintain backward compatibility.
	set nocount on
	exec dbo.dt_isundersourcecontrol
		@vchLoginName,
		@vchPassword,
		@iWhoToo 


GO
/****** Object:  StoredProcedure [dbo].[dt_removefromsourcecontrol]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[dt_removefromsourcecontrol]

as

    set nocount on

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null

    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1

    return 0


GO
/****** Object:  StoredProcedure [dbo].[dt_setpropertybyid]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		value -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure [dbo].[dt_setpropertybyid]
	@id int,
	@property varchar(64),
	@value varchar(255),
	@lvalue image
as
	set nocount on
	declare @uvalue nvarchar(255) 
	set @uvalue = convert(nvarchar(255), @value) 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@value, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @value, @uvalue, @lvalue)
	end

GO
/****** Object:  StoredProcedure [dbo].[dt_setpropertybyid_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		uvalue -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure [dbo].[dt_setpropertybyid_u]
	@id int,
	@property varchar(64),
	@uvalue nvarchar(255),
	@lvalue image
as
	set nocount on
	-- 
	-- If we are writing the name property, find the ansi equivalent. 
	-- If there is no lossless translation, generate an ansi name. 
	-- 
	declare @avalue varchar(255) 
	set @avalue = null 
	if (@uvalue is not null) 
	begin 
		if (convert(nvarchar(255), convert(varchar(255), @uvalue)) = @uvalue) 
		begin 
			set @avalue = convert(varchar(255), @uvalue) 
		end 
		else 
		begin 
			if 'DtgSchemaNAME' = @property 
			begin 
				exec dbo.dt_generateansiname @avalue output 
			end 
		end 
	end 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@avalue, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @avalue, @uvalue, @lvalue)
	end
GO
/****** Object:  StoredProcedure [dbo].[dt_validateloginparams]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_validateloginparams]
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)
as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchSourceSafeINI varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError

    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'ValidateLoginParams',
											NULL,
											@sSourceSafeINI = @vchSourceSafeINI,
											@sLoginName = @vchLoginName,
											@sPassword = @vchPassword
    if @iReturn <> 0 GOTO E_OAError

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp


GO
/****** Object:  StoredProcedure [dbo].[dt_validateloginparams_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_validateloginparams_u]
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)
as

	-- This procedure should no longer be called;  dt_validateloginparams should be called instead.
	-- Calls are forwarded to dt_validateloginparams to maintain backward compatibility.
	set nocount on
	exec dbo.dt_validateloginparams
		@vchLoginName,
		@vchPassword 


GO
/****** Object:  StoredProcedure [dbo].[dt_vcsenabled]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_vcsenabled]

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */


GO
/****** Object:  StoredProcedure [dbo].[dt_verstamp006]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	This procedure returns the version number of the stored
**    procedures used by legacy versions of the Microsoft
**	Visual Database Tools.  Version is 7.0.00.
*/
create procedure [dbo].[dt_verstamp006]
as
	select 7000
GO
/****** Object:  StoredProcedure [dbo].[dt_verstamp007]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	This procedure returns the version number of the stored
**    procedures used by the the Microsoft Visual Database Tools.
**	Version is 7.0.05.
*/
create procedure [dbo].[dt_verstamp007]
as
	select 7005
GO
/****** Object:  StoredProcedure [dbo].[dt_whocheckedout]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_whocheckedout]
        @chObjectType  char(4),
        @vchObjectName varchar(255),
        @vchLoginName  varchar(255),
        @vchPassword   varchar(255)

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        declare @vchReturnValue varchar(255)
        select @vchReturnValue = ''

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'WhoCheckedOut',
												@vchReturnValue OUT,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword

        if @iReturn <> 0 GOTO E_OAError

        select @vchReturnValue

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp


GO
/****** Object:  StoredProcedure [dbo].[dt_whocheckedout_u]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dt_whocheckedout_u]
        @chObjectType  char(4),
        @vchObjectName nvarchar(255),
        @vchLoginName  nvarchar(255),
        @vchPassword   nvarchar(255)

as

	-- This procedure should no longer be called;  dt_whocheckedout should be called instead.
	-- Calls are forwarded to dt_whocheckedout to maintain backward compatibility.
	set nocount on
	exec dbo.dt_whocheckedout
		@chObjectType, 
		@vchObjectName,
		@vchLoginName, 
		@vchPassword  


GO
/****** Object:  StoredProcedure [dbo].[g_GuildMgrSav]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[g_GuildMgrSav] AS
GO
/****** Object:  StoredProcedure [dbo].[g_KeepObeliskMgr]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[g_KeepObeliskMgr] AS
GO
/****** Object:  StoredProcedure [dbo].[GuildMgrSave]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GuildMgrSave] AS
GO
/****** Object:  StoredProcedure [dbo].[kill]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[kill] AS
GO
/****** Object:  StoredProcedure [dbo].[usp_Clear_Table]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Clear_Table]

AS

/*
TRUNCATE TABLE _CreatedChars

TRUNCATE TABLE _DeletedChars

TRUNCATE TABLE CharApplySkills

TRUNCATE TABLE CharItems

TRUNCATE TABLE CharQuests

TRUNCATE TABLE CharQuickSlots

TRUNCATE TABLE Chars

TRUNCATE TABLE CharSkills

TRUNCATE TABLE GuildChars

TRUNCATE TABLE Guilds

TRUNCATE TABLE Keeps

TRUNCATE TABLE UserMaxGrow

TRUNCATE TABLE UserStoredItems

TRUNCATE TABLE UserStoredMoney
*/

RETURN 1

GO
/****** Object:  StoredProcedure [dbo].[usp_Create_BanChar_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Create_BanChar_E]

@CharID int,
@BanID int,
@BanName varchar(30)

AS

SET NOCOUNT ON

SET @BanName = LTRIM( RTRIM(@BanName) )

INSERT INTO BanChars(CharID,BanID,BanName,BanDate) VALUES(@CharID,@BanID,@BanName,GETDATE())

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Char_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Proc [dbo].[usp_Create_Char_R]

@ServerID tinyint,
@UserID varchar(12),
@UserUID int,
@CharName nvarchar(18),
@Slot tinyint,
@Family tinyint,
@Grow tinyint,
@Hair tinyint,
@Face tinyint,
@Size tinyint,
@Job tinyint,
@Sex tinyint,
@Level smallint,
@Statpoint smallint,
@Skillpoint smallint,
@Str smallint,
@Dex smallint,
@Rec smallint,
@Int smallint,
@Luc smallint,
@Wis smallint,
@Hp smallint,
@Mp smallint,
@Sp smallint,
@Map smallint,
@Dir smallint,
@Exp int,
@Money int,
@Posx real,
@Posy real,
@Posz real,
@Hg smallint,
@Vg smallint,
@Cg tinyint,
@Og tinyint,
@Ig tinyint,
@CharID int = 0,
@NameCnt tinyint = 0

AS

SET NOCOUNT ON

DECLARE @Ret int

SET @CharName = LTRIM(RTRIM(REPLACE(@CharName, char(39), char(32))))
SET @SkillPoint = 5
SET @Ret = 0

DECLARE @Regex AS int

SET @NameCnt = (SELECT ISNULL(COUNT(*), 0) FROM Chars WHERE CharName = @CharName AND Del = 0)
SET @Regex = PATINDEX('%[^a-zA-Z0-9._-À-ỹ ]%', @CharName) 

IF @Regex > 0
RETURN -1

IF @NameCnt <> 0
BEGIN
	RETURN -2
END

ELSE
BEGIN
	IF EXISTS (SELECT CharID FROM Chars WHERE CharName = @CharName AND Del = 1 AND [Level] > 10 AND DeleteDate > DATEADD(dd, -7, GETDATE()) )
	BEGIN
		RETURN -2
	END

	BEGIN TRANSACTION

	INSERT INTO Chars(ServerID, UserID, UserUID, CharName, Slot, Family, Grow, 
	Hair, Face, [Size], Job, Sex, [Level], StatPoint, SkillPoint, 
	[Str], Dex, Rec, [Int], Luc, Wis, HP, MP, SP, Map, Dir, [Exp], [Money], 
	PosX, PosY, Posz, Hg, Vg, Cg, Og, Ig, RenameCnt, RemainTime)

	VALUES(@ServerID, @UserID, @UserUID, @CharName, @Slot, @Family, @Grow, 
	@Hair, @Face, @Size, @Job, @Sex, @Level, @StatPoint, @SkillPoint, 
	@Str, @Dex, @Rec, @Int, @Luc, @Wis, @HP, @MP, @SP, @Map, @Dir, @Exp, @Money, 
	@PosX, @PosY, @Posz, @Hg, @Vg, @Cg, @Og, @Ig, 0, 0)

	IF @@ERROR = 0
	BEGIN
		COMMIT TRANSACTION
	END
	
	ELSE
	BEGIN
		ROLLBACK TRANSACTION
		RETURN -1
	END

	SET @CharID = IDENT_CURRENT('Chars')
END

RETURN @CharID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Char_R2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/****** 개체: 저장 프로시저 dbo.usp_Create_Char_R    스크립트 날짜: 2006-05-30 오후 12:53:23 ******/

CREATE  Proc [dbo].[usp_Create_Char_R2]

@ServerID tinyint,
@UserID varchar(12),
@UserUID int,
@CharName nvarchar(18) ,
@Slot Tinyint,
@Family Tinyint,
@Grow Tinyint,
@Hair Tinyint,
@Face Tinyint,
@Size Tinyint,
@Job Tinyint,
@Sex Tinyint,
@Level Smallint,
@Statpoint Smallint,
@Skillpoint Smallint,
@Str Smallint,
@Dex Smallint,
@Rec Smallint,
@Int Smallint,
@Luc Smallint,
@Wis Smallint,
@Hp Smallint,
@Mp Smallint,
@Sp Smallint,
@Map Smallint,
@Dir Smallint,
@Exp Int,
@Money Int,
@Posx Real,
@Posy Real,
@Posz Real,
@Hg Smallint,
@Vg Smallint,
@Cg Tinyint,
@Og Tinyint,
@Ig Tinyint,


/* 여기까지 인자값 주어져야 함 */

/* SP 내부 참조용 변수 */

@CharID int = 0,
@NameCnt tinyint = 0

AS

SET NOCOUNT ON

DECLARE @Ret int

SET @CharName = LTRIM(RTRIM(@CharName))
SET @SkillPoint = 5
SET @Ret = 0


BEGIN TRANSACTION

INSERT INTO Chars(ServerID,UserID, UserUID, CharName, Slot, Family, Grow, 
Hair, Face, [Size], Job, Sex, [Level], StatPoint, SkillPoint, 
[Str], Dex, Rec, [Int], Luc, Wis, HP, MP, SP, Map, Dir, [Exp], [Money], 
PosX, PosY, Posz, Hg, Vg, Cg, Og, Ig, RenameCnt, RemainTime)

VALUES(@ServerID,@UserID, @UserUID, @CharName, @Slot, @Family, @Grow, 
@Hair, @Face, @Size, @Job, @Sex, @Level, @StatPoint, @SkillPoint, 
@Str, @Dex, @Rec, @Int, @Luc, @Wis, @HP, @MP, @SP, @Map, @Dir, @Exp, @Money, 
@PosX, @PosY, @Posz, @Hg, @Vg, @Cg, @Og, @Ig, 0, 0)

IF( @@ERROR=0 )
BEGIN
	COMMIT TRANSACTION
END
ELSE
BEGIN
	ROLLBACK TRANSACTION
	RETURN -1
END

SET @CharID = IDENT_CURRENT('Chars')


RETURN @CharID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Char_SavePoint]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*==================================================
@author	lenasoft
@date	2006-08-31
@return	
@brief	기록점을 생성(Insert)한다.(중국/해외측만 해당)
==================================================*/
CREATE Proc [dbo].[usp_Create_Char_SavePoint]

@CharID int,
@Slot tinyint,
@MapID smallint,
@Posx real,
@Posy real,
@Posz real

AS

SET NOCOUNT ON


INSERT INTO CharSavePoint(CharID, Slot, MapID, PosX, PosY, PosZ)
VALUES(@CharID, @Slot, @MapID, @PosX, @PosY, @PosZ)

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_FriendChar_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Create_FriendChar_E]

@CharID int,
@FriendID int,
@FriendName nvarchar(30),
@Family tinyint,
@Grow tinyint,
@Job tinyint

AS

SET NOCOUNT ON

SET @FriendName = LTRIM( RTRIM(@FriendName) )

INSERT INTO FriendChars(CharID, FriendID, FriendName, Family, Grow, Job, CreateDate)
VALUES(@CharID, @FriendID, @FriendName, @Family, @Grow, @Job, GETDATE())

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Create_GameData]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE    Proc [dbo].[usp_Create_GameData]

@Dest1 varchar(200),
@Dest2 varchar(200)

AS

SET NOCOUNT ON

DECLARE @DBName varchar(50)
DECLARE @ServerName varchar(50)
DECLARE @Year int
DECLARE @Month int
DECLARE @Day int
DECLARE @MaxDay int
DECLARE @Date datetime
DECLARE @StrDay varchar(2)

DECLARE @Cnt int
DECLARE @Sql1 varchar(8000)
DECLARE @Sql2 varchar(8000)
DECLARE @StrTable varchar(100)

--SET @ServerName = (SELECT @@servername)
SET @ServerName = 'PS_GMDB01'
SET @Date = GETDATE()
SET @Year = YEAR(@Date)
SET @Month = MONTH(@Date)
SET @Day = DAY(@Date)
Set @MaxDay = DAY( DateAdd(d, - DAY(@Date), DateAdd(M,1, @Date)) )

SET @DBName = 'PS_GameData_'
SET @DBName = @DBName + CAST(@Year AS varchar(4))

IF ( @Day > 9 )
BEGIN
	SET @StrDay = CAST(@Day AS varchar(2))
END
ELSE
BEGIN
	SET @StrDay = '0' + CAST(@Day AS varchar(2))
END

IF ( @Month > 9 )
BEGIN
	SET @DBName = @DBName + CAST(@Month AS varchar(2))
END
ELSE
BEGIN
	SET @DBName = @DBName + '0' + CAST(@Month AS varchar(2))
END

IF( @Day = 1 )	-- 매월1일이면 데이타베이스 생성
BEGIN
	SET @Sql1 = 

	'
	CREATE DATABASE [' + @DBName + ']
	ON
	PRIMARY
	( NAME = ' + @DBName + '_PRIMARY,
	  FILENAME = ''' + @Dest1 + @ServerName + '__' + @DBName + '_PRIMARY.mdf'',
	  SIZE = 5MB,
	  FILEGROWTH = 1MB )
	'
	
	-- 로그 설정
	
	
	SET @Sql2 = 
	
	'
	LOG ON
	( NAME = ' + @DBName + '_Log,
	   FILENAME = ''' + @Dest2 + @ServerName + '__' + @DBName + '_Log.ldf'',
	   SIZE = 5MB,
	   FILEGROWTH = 1MB 
	)
	
	'	
	
	EXEC (@Sql1 + @Sql2)
	
END

DECLARE @Query nvarchar(1000)

-- Chars 테이블 생성 및 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'Chars'+@StrDay
EXEC dbo.usp_Create_Table_Chars @DBName, @StrTable

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.Chars'
EXEC (@Query)

-- CharItems 테이블 생성 및 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'CharItems'+@StrDay
EXEC dbo.usp_Create_Table_CharItems @DBName, @StrTable

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.CharItems'
EXEC (@Query)

-- CharQuests 테이블 생성 및 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'CharQuests'+@StrDay
EXEC dbo.usp_Create_Table_CharQuests @DBName, @StrTable

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.CharQuests'
EXEC (@Query)

-- CharSkills 테이블 생성 및 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'CharSkills'+@StrDay
EXEC dbo.usp_Create_Table_CharSkills @DBName, @StrTable

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.CharSkills'
EXEC (@Query)

-- UserStoredItems 테이블 생성 및 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'UserStoredItems'+@StrDay
EXEC dbo.usp_Create_Table_UserStoredItems @DBName, @StrTable

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.UserStoredItems'
EXEC (@Query)

-- UserStoredMoney 테이블 생성 및 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'UserStoredMoney'+@StrDay
EXEC dbo.usp_Create_Table_UserStoredMoney @DBName, @StrTable

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.UserStoredMoney'
EXEC (@Query)

-- GuildStoredItems 테이블 생성 및 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'GuildStoredItems'+@StrDay
EXEC dbo.usp_Create_Table_GuildStoredItems @DBName, @StrTable

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.GuildStoredItems'
EXEC (@Query)


SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Guild_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Create_Guild_E]

@GuildID int,
@GuildName nvarchar(30),
@MasterUserID varchar(12),
@MasterCharID int,
@MasterName nvarchar(30),
@Country tinyint

AS

SET NOCOUNT ON

DECLARE @NameCnt int
DECLARE @Regex AS int

SET @GuildName = LTRIM ( RTRIM ( @GuildName ) )
SET @MasterName = LTRIM ( RTRIM ( @MasterName ) )
SET @NameCnt = ( SELECT ISNULL(COUNT(*),0) FROM Guilds WHERE GuildName=@GuildName AND Del = 0 )
SET @Regex = PATINDEX('%[^a-zA-Z0-9._-À-ỹ ]%', @GuildName) 

IF @Regex > 0
RETURN -1

IF( @NameCnt <> 0 )
BEGIN
	RETURN -1
END
ELSE
BEGIN
	INSERT INTO Guilds(GuildID,GuildName,MasterUserID,MasterCharID,MasterName,Country,TotalCount,GuildPoint,CreateDate)
	VALUES(@GuildID,@GuildName,@MasterUserID,@MasterCharID,@MasterName,@Country,0,0,GETDATE())
	RETURN 0
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Guild2_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Proc [dbo].[usp_Create_Guild2_E]

@GuildID int,
@GuildName nvarchar(30),
@MasterUserID varchar(12),
@MasterCharID int,
@MasterName varchar(30),
@Country tinyint,
@Remark varchar(64) = NULL

AS

SET NOCOUNT ON

DECLARE @NameCnt int

SET @GuildName = LTRIM(RTRIM(REPLACE(@GuildName, char(39), char(32))))
SET @MasterName = LTRIM(RTRIM(REPLACE(@MasterName, char(39), char(32))))
SET @NameCnt = (SELECT ISNULL(COUNT(*), 0) FROM Guilds WHERE GuildName = @GuildName AND Del = 0)
SET @Remark = LTRIM(RTRIM(REPLACE(@Remark, char(39), char(32))))

IF @NameCnt <> 0
BEGIN
	RETURN -1
END

ELSE
BEGIN
	BEGIN TRAN
	INSERT INTO Guilds(GuildID, GuildName, MasterUserID, MasterCharID, MasterName, Country, TotalCount, GuildPoint, CreateDate)
	VALUES(@GuildID, @GuildName, @MasterUserID, @MasterCharID, @MasterName, @Country, 0, 0, GETDATE())

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END

	INSERT INTO GuildDetails(GuildID, Remark) VALUES(@GuildID, @Remark)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END

	COMMIT TRAN
	RETURN 0
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Create_GuildChar_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Create_GuildChar_E]

@GuildID int,
@CharID int,
@GuildLevel tinyint

AS

SET NOCOUNT ON

DECLARE @NameCnt int

SET @NameCnt = ( SELECT ISNULL(COUNT(*),0) FROM GuildChars WHERE CharID = @CharID AND Del = 0 )

IF( @NameCnt <> 0 )
BEGIN
	RETURN -1
END
ELSE
BEGIN
	INSERT INTO GuildChars(GuildID, CharID, GuildLevel, JoinDate)
	VALUES(@GuildID, @CharID, @GuildLevel, GETDATE())

	UPDATE Guilds SET TotalCount=TotalCount+1 WHERE GuildID=@GuildID

	RETURN 0
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Keep_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Create_Keep_E]

@KeepID int,
@OwnCountry tinyint,
@ResetTime int

AS

SET NOCOUNT ON

INSERT INTO Keeps(KeepID,OwnCountry,ResetTime) VALUES(@KeepID,@OwnCountry,@ResetTime)

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_CharItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_CharItems    스크립트 날짜: 2006-05-30 오후 12:56:40 ******/



CREATE  Proc [dbo].[usp_Create_Table_CharItems]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int]  NOT NULL ,
	[CharID] [int] NOT NULL ,
	[ItemID] [int] NOT NULL ,
	[ItemUID] [bigint] NOT NULL ,
	[Type] [tinyint] NOT NULL ,
	[TypeID] [tinyint] NOT NULL ,
	[Bag] [tinyint] NOT NULL ,
	[Slot] [tinyint] NOT NULL ,
	[Quality] [smallint] NOT NULL ,
	[Gem1] [tinyint] NOT NULL ,
	[Gem2] [tinyint] NOT NULL ,
	[Gem3] [tinyint] NOT NULL ,
	[Gem4] [tinyint] NOT NULL ,
	[Gem5] [tinyint] NOT NULL ,
	[Gem6] [tinyint] NOT NULL ,
	[Craftname] [varchar] (20) NULL ,
	[Count] [tinyint] NOT NULL ,
	[Maketime] [datetime] NOT NULL ,
	[Maketype] [varchar] (1) NOT NULL ,
	[Del] [bit] NOT NULL 
) ON [PRIMARY]

'

SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_CharQuests]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_CharQuests    스크립트 날짜: 2006-05-30 오후 12:57:06 ******/



CREATE  Proc [dbo].[usp_Create_Table_CharQuests]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int] NOT NULL ,
	[CharID] [int] NOT NULL ,
	[QuestID] [smallint] NOT NULL ,
	[Delay] [smallint] NOT NULL ,
	[Count1] [tinyint] NOT NULL ,
	[Count2] [tinyint] NOT NULL ,
	[Count3] [tinyint] NOT NULL ,
	[Success] [tinyint] NOT NULL ,
	[Finish] [tinyint] NOT NULL ,
	[Del] [bit] NOT NULL 
) ON [PRIMARY]

'

SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_Chars]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_Chars    스크립트 날짜: 2006-05-30 오후 12:57:30 ******/


/****** 개체: 저장 프로시저 dbo.usp_Create_Table_Chars    스크립트 날짜: 2006-05-09 오후 12:55:01 ******/


CREATE   Proc [dbo].[usp_Create_Table_Chars]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[ServerID] [tinyint] NOT NULL ,
	[UserID] [varchar] (12) NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[CharID] [int] NOT NULL ,
	[CharName] [varchar] (30) NOT NULL ,
	[New] [tinyint] NOT NULL ,
	[Del] [tinyint] NOT NULL ,
	[Slot] [tinyint] NOT NULL ,
	[Family] [tinyint] NOT NULL ,
	[Grow] [tinyint] NOT NULL ,
	[Hair] [tinyint] NOT NULL ,
	[Face] [tinyint] NOT NULL ,
	[Size] [tinyint] NOT NULL ,
	[Job] [tinyint] NOT NULL ,
	[Sex] [tinyint] NOT NULL ,
	[Level] [smallint] NOT NULL ,
	[StatPoint] [smallint] NOT NULL ,
	[SkillPoint] [smallint] NOT NULL ,
	[Str] [smallint] NOT NULL ,
	[Dex] [smallint] NOT NULL ,
	[Rec] [smallint] NOT NULL ,
	[Int] [smallint] NOT NULL ,
	[Luc] [smallint] NOT NULL ,
	[Wis] [smallint] NOT NULL ,
	[HP] [smallint] NOT NULL ,
	[MP] [smallint] NOT NULL ,
	[SP] [smallint] NOT NULL ,
	[Map] [smallint] NOT NULL ,
	[Dir] [smallint] NOT NULL ,
	[Exp] [int] NOT NULL ,
	[Money] [int] NOT NULL ,
	[PosX] [real] NOT NULL ,
	[PosY] [real] NOT NULL ,
	[Posz] [real] NOT NULL ,
	[Hg] [smallint] NOT NULL ,
	[Vg] [smallint] NOT NULL ,
	[Cg] [tinyint] NOT NULL ,
	[Og] [tinyint] NOT NULL ,
	[Ig] [tinyint] NOT NULL ,
	[K1] [int] NOT NULL ,
	[K2] [int] NOT NULL ,
	[K3] [int] NOT NULL ,
	[K4] [int] NOT NULL ,
	[KillLevel] [tinyint] NOT NULL ,
	[DeadLevel] [tinyint] NOT NULL ,
	[RegDate] [datetime] NOT NULL ,
	[DeleteDate] [datetime] NULL,
	[JoinDate] [datetime] NULL,
	[LeaveDate] [datetime] NULL,
	[RenameCnt] [tinyint] NOT NULL ,
	[OldCharName] [varchar] (30) NULL ,
	[RemainTime] [int] NOT NULL ,
) ON [PRIMARY]

'
SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

--IF EXISTS ( SELECT * FROM dbo.sysobjects WHERE ID = OBJECT_ID(@IN_Table) and OBJECTPROPERTY(id, @IN_Table) = 1)
IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_CharSkills]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_CharSkills    스크립트 날짜: 2006-05-30 오후 12:57:56 ******/



CREATE  Proc [dbo].[usp_Create_Table_CharSkills]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int] NOT NULL ,
	[CharID] [int] NOT NULL ,
	[SkillID] [smallint] NOT NULL ,
	[SkillLevel] [tinyint] NOT NULL ,
	[Number] [tinyint] NOT NULL ,
	[Delay] [smallint] NOT NULL ,
	[CreateTime] [smalldatetime] NOT NULL ,
	[Del] [bit] NOT NULL 
) ON [PRIMARY]

'

SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_GuildChars]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_GuildChars    스크립트 날짜: 2006-05-30 오후 12:58:13 ******/



CREATE  Proc [dbo].[usp_Create_Table_GuildChars]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int] NOT NULL ,
	[GuildID] [int] NOT NULL ,
	[CharID] [int] NOT NULL ,
	[GuildLevel] [tinyint] NOT NULL ,
	[Del] [tinyint] NOT NULL ,
	[JoinDate] [datetime] NOT NULL ,
	[LeaveDate] [datetime] NULL 
) ON [PRIMARY]

'
SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

--IF EXISTS ( SELECT * FROM dbo.sysobjects WHERE ID = OBJECT_ID(@IN_Table) and OBJECTPROPERTY(id, @IN_Table) = 1)
IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_Guilds]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_Guilds    스크립트 날짜: 2006-05-30 오후 12:58:42 ******/



CREATE  Proc [dbo].[usp_Create_Table_Guilds]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int] NOT NULL ,
	[GuildID] [int] NOT NULL ,
	[GuildName] [varchar] (30) NOT NULL ,
	[MasterID] [int] NOT NULL ,
	[MasterName] [varchar] (30) NOT NULL ,
	[Country] [tinyint] NOT NULL ,
	[Del] [tinyint] NOT NULL ,
	[CreateDate] [datetime] NOT NULL ,
	[DeleteDate] [datetime] NULL 
) ON [PRIMARY]

'
SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

--IF EXISTS ( SELECT * FROM dbo.sysobjects WHERE ID = OBJECT_ID(@IN_Table) and OBJECTPROPERTY(id, @IN_Table) = 1)
IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_GuildStoredItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** 개체: 저장 프로시저 dbo.usp_Create_Table_UserStoredItems    스크립트 날짜: 2006-05-30 오후 12:58:58 ******/



CREATE  Proc [dbo].[usp_Create_Table_GuildStoredItems]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int] NOT NULL ,
	[GuildID] [int] NOT NULL ,
	[ItemID] [int] NOT NULL ,
	[Type] [tinyint] NOT NULL ,
	[TypeID] [tinyint] NOT NULL ,
	[ItemUID] [bigint] NOT NULL ,
	[Slot] [int] NOT NULL ,
	[Quality] [smallint] NOT NULL ,
	[Gem1] [tinyint] NOT NULL ,
	[Gem2] [tinyint] NOT NULL ,
	[Gem3] [tinyint] NOT NULL ,
	[Gem4] [tinyint] NOT NULL ,
	[Gem5] [tinyint] NOT NULL ,
	[Gem6] [tinyint] NOT NULL ,
	[Craftname] [varchar] (20) NULL ,
	[Count] [tinyint] NOT NULL ,
	[Maketime] [datetime] NOT NULL ,
	[Maketype] [char] (1) NOT NULL ,
	[Del] [bit] NOT NULL 
) ON [PRIMARY]

'

SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_UserStoredItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_UserStoredItems    스크립트 날짜: 2006-05-30 오후 12:58:58 ******/



CREATE  Proc [dbo].[usp_Create_Table_UserStoredItems]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int] NOT NULL ,
	[ServerID] [tinyint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[ItemID] [int] NOT NULL ,
	[Type] [tinyint] NOT NULL ,
	[TypeID] [tinyint] NOT NULL ,
	[ItemUID] [bigint] NOT NULL ,
	[Slot] [int] NOT NULL ,
	[Quality] [smallint] NOT NULL ,
	[Gem1] [tinyint] NOT NULL ,
	[Gem2] [tinyint] NOT NULL ,
	[Gem3] [tinyint] NOT NULL ,
	[Gem4] [tinyint] NOT NULL ,
	[Gem5] [tinyint] NOT NULL ,
	[Gem6] [tinyint] NOT NULL ,
	[Craftname] [varchar] (20) NULL ,
	[Count] [tinyint] NOT NULL ,
	[Maketime] [datetime] NOT NULL ,
	[Maketype] [char] (1) NOT NULL ,
	[Del] [bit] NOT NULL 
) ON [PRIMARY]

'

SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Create_Table_UserStoredMoney]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Create_Table_UserStoredMoney    스크립트 날짜: 2006-05-30 오후 12:59:22 ******/



CREATE  Proc [dbo].[usp_Create_Table_UserStoredMoney]

@IN_DB varchar(50),
@IN_Table varchar(50)

AS

SET NOCOUNT ON

DECLARE @Table varchar(100)
DECLARE @DropQuery varchar(1000)
DECLARE @CreateQuery varchar(8000)

SET @Table = @IN_DB + '.dbo.' + @IN_Table
SET @DropQuery = 'DROP TABLE ' + @Table
SET @CreateQuery = '

CREATE TABLE [$Table$] (
	[RowID] [int] NOT NULL ,
	[ServerID] [tinyint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[Money] [bigint] NOT NULL ,
	[LastAccessTime] [datetime] NOT NULL ,
	[Del] [bit] NOT NULL 
) ON [PRIMARY]

'

SET @CreateQuery = REPLACE(@CreateQuery, '[$Table$]', @Table)

IF EXISTS (SELECT name FROM sysobjects WHERE name = @IN_Table AND type = 'U')
BEGIN
	EXEC ( @DropQuery )
END

EXEC ( @CreateQuery )

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_BanChar_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Delete_BanChar_E]

@CharID int,
@BanID int

AS

SET NOCOUNT ON

DELETE BanChars WHERE CharID=@CharID AND BanID=@BanID

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_Char_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Delete_Char_E    스크립트 날짜: 2006-04-11 오후 4:03:02 ******/


CREATE  Proc [dbo].[usp_Delete_Char_E]

@ServerID tinyint,
@CharID int

AS

SET NOCOUNT ON

DECLARE @DeleteDate datetime
DECLARE @GuildID int

SET @DeleteDate = GETDATE()

--캐릭터정보 삭제처리
UPDATE Chars SET Del=1, DeleteDate=@DeleteDate WHERE CharID=@CharID

-- 길드정보 삭제처리
SELECT @GuildID=GuildID FROM GuildChars WHERE CharID=@CharID AND Del=0

IF( @GuildID IS NOT NULL )
BEGIN
	EXEC usp_Delete_GuildChar_E @GuildID, @CharID
END

--캐릭터 삭제테이블에 추가
INSERT _DeletedChars(ServerID,CharID,DeleteDate) VALUES(@ServerID,@CharID,@DeleteDate)

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[Usp_Delete_Char_Request_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[Usp_Delete_Char_Request_E]

@CharID int,
@RemainTime int

AS

SET NOCOUNT ON

--캐릭터정보 삭제요청처리
UPDATE Chars SET RemainTime=@RemainTime WHERE CharID=@CharID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_FriendChar_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Delete_FriendChar_E]

@CharID int,
@FriendID int

AS

SET NOCOUNT ON

DELETE FriendChars WHERE CharID=@CharID AND FriendID=@FriendID

UPDATE FriendChars SET Refuse = 1, RefuseDate=GETDATE()  WHERE CharID=@FriendID AND FriendID=@CharID

IF( @@ERROR = 0 )
BEGIN
	RETURN 0
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_Guild_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Delete_Guild_E]

@GuildID int

AS

SET NOCOUNT ON

UPDATE Guilds SET Del=1,DeleteDate=GETDATE() WHERE GuildID=@GuildID AND Del=0

IF( @@ERROR=0 AND @@ROWCOUNT=1 )
BEGIN
	UPDATE GuildChars SET Del=1,LeaveDate=GETDATE()	WHERE GuildID=@GuildID AND Del=0
	UPDATE Guilds SET TotalCount=0 WHERE GuildID=@GuildID
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_GuildChar_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Delete_GuildChar_E]

@GuildID int,
@CharID int

AS

SET NOCOUNT ON

UPDATE GuildChars
SET Del = 1, LeaveDate = GETDATE()
WHERE GuildID = @GuildID AND CharID = @CharID AND Del = 0

IF( @@ERROR = 0 AND @@ROWCOUNT = 1 )
BEGIN
	UPDATE Guilds SET TotalCount=TotalCount-1 WHERE GuildID=@GuildID
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_GM_Recovery_Char]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_GM_Recovery_Char]

@ServerID tinyint,
@UserID varchar(12),
@CharID int,
@CharName nvarchar(50),
@Family tinyint,
@RegDate varchar(30)
 
AS

SET NOCOUNT ON

DECLARE @CreateDate datetime
SET @CreateDate = CAST( @RegDate AS datetime )

DELETE FROM _CreatedChars WHERE CharID=@CharID

INSERT _CreatedChars(ServerID,UserID,CharID,CharName,Family,CreateDate) 
VALUES(@ServerID,@UserID,@CharID,@CharName,@Family,@CreateDate)

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Market_ADD]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE    Proc [dbo].[usp_Market_ADD]

@MarketID		int,
@CharID 		int,
@MinMoney		int,
@DirectMoney		int,
@MarketType		tinyint,

@GuaranteeMoney	int,
@TenderCharID		int,
@TenderMoney		int,
@EndDate		datetime,

@ItemID 		int,
@ItemUID 		bigint,

@Type 			tinyint,
@TypeID 		tinyint,
@Quality 		int,
@Gem1 		tinyint,
@Gem2 		tinyint,
@Gem3 		tinyint,
@Gem4 		tinyint,
@Gem5 		tinyint,
@Gem6 		tinyint,
@Craftname 		varchar(20) = '', 
@Count 		tinyint,
@Maketime 		datetime,
@Maketype 		char(1),
@TenderCharName	varchar(20) = ''
AS

SET NOCOUNT ON

BEGIN TRAN

INSERT INTO [MarketItems]([MarketID], [ItemID], [ItemUID], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count], [Maketime], [Maketype])
VALUES( @MarketID, @ItemID, @ItemUID, @Type, @TypeID, @Quality, @Gem1, @Gem2, @Gem3, @Gem4, @Gem5, @Gem6, @Craftname, @Count, @Maketime,  @Maketype     )

IF( @@ERROR <> 0 )
BEGIN
	ROLLBACK TRAN
	RETURN 0
END

INSERT INTO [Market]( [MarketID], [CharID], [MinMoney], [DirectMoney], [MarketType], [GuaranteeMoney], [TenderCharID], [TenderCharName], [TenderMoney],[EndDate])
VALUES( @MarketID, @CharID, @MinMoney, @DirectMoney, @MarketType, @GuaranteeMoney, @TenderCharID, @TenderCharName, @TenderMoney, @EndDate )

IF( @@ERROR <> 0 )
BEGIN
	ROLLBACK TRAN
	RETURN 0
END

COMMIT TRAN

RETURN 1



SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_CharResultItem_ADD]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE  Proc [dbo].[usp_Market_CharResultItem_ADD]


@CharID 	int,
@MarketID	int,
@Result	tinyint,
@EndDate	datetime,

@ItemID 	int,
@ItemUID 	bigint,

@Type 		tinyint,
@TypeID 	tinyint,
@Quality 	int,
@Gem1 	tinyint,
@Gem2 	tinyint,
@Gem3 	tinyint,
@Gem4 	tinyint,
@Gem5 	tinyint,
@Gem6 	tinyint,
@Craftname 	varchar(20) = '', 
@Count 	tinyint,
@Maketime 	datetime,
@Maketype 	char(1)

AS

SET NOCOUNT ON



IF NOT EXISTS( SELECT MarketID FROM MarketItems WHERE MarketID = @MarketID )
BEGIN
	BEGIN TRAN

	INSERT INTO [MarketItems]([MarketID], [ItemID], [ItemUID], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count], [Maketime], [Maketype])
	VALUES( @MarketID, @ItemID, @ItemUID, @Type, @TypeID, @Quality, @Gem1, @Gem2, @Gem3, @Gem4, @Gem5, @Gem6, @Craftname, @Count, @Maketime,  @Maketype     )

	IF( @@ERROR <> 0 )
	BEGIN
		ROLLBACK TRAN
		RETURN 0
	END

	INSERT INTO [MarketCharResultItems]([CharID], [MarketID], [Result], [EndDate])
	VALUES( @CharID, @MarketID, @Result, @EndDate )
	IF( @@ERROR <> 0 )
	BEGIN
		ROLLBACK TRAN
		RETURN 0
	END

	COMMIT TRAN

END

ELSE

BEGIN
	INSERT INTO [MarketCharResultItems]([CharID], [MarketID], [Result], [EndDate])
	VALUES( @CharID, @MarketID, @Result, @EndDate )
	IF( @@ERROR <> 0 )
	BEGIN
		RETURN 0
	END

END

RETURN 1

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_CharResultItem_DEL]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE  Proc [dbo].[usp_Market_CharResultItem_DEL]


@CharID 	int,
@MarketID	int

AS

SET NOCOUNT ON


BEGIN TRAN

DELETE FROM [MarketItems]
WHERE MarketID = @MarketID

IF( @@ERROR <> 0 )
BEGIN
	ROLLBACK TRAN
	RETURN 0
END

DELETE FROM [MarketCharResultItems]
WHERE CharID = @CharID AND MarketID = @MarketID

IF( @@ERROR <> 0 )
BEGIN
	ROLLBACK TRAN
	RETURN 0
END

COMMIT TRAN

RETURN 1

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_CharResultItem_READ]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE Proc [dbo].[usp_Market_CharResultItem_READ]

AS

SET NOCOUNT ON

SELECT C.[CharID], C.[MarketID], C.[Result], C.[EndDate], 
	I.[ItemID], I.[ItemUID], I.[Type], I.[TypeID], I.[Quality], I.[Gem1], I.[Gem2], I.[Gem3], I.[Gem4], I.[Gem5], I.[Gem6], I.[Craftname], I.[Count], I.[Maketime], I.[Maketype]
FROM MarketCharResultItems C

INNER JOIN MarketItems I ON C.MarketID = I.MarketID

ORDER BY C.[CharID]

RETURN @@ROWCOUNT

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_CharResultMoney_ADD]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE  Proc [dbo].[usp_Market_CharResultMoney_ADD]

@MoneyID		int,
@CharID 		int,
@MarketID		int,
@Result		tinyint,

@Money		int,
@GuaranteeMoney	int,
@ReturnMoney		int,

@EndDate		datetime,

@Type			tinyint,
@TypeID		tinyint,
@Quality		smallint,
@Gem1			tinyint,
@Gem2			tinyint,
@Gem3			tinyint,
@Gem4			tinyint,
@Gem5			tinyint,
@Gem6			tinyint,
@Craftname		varchar(20),
@Count			tinyint

AS

SET NOCOUNT ON



INSERT INTO [MarketCharResultMoney]([MoneyID], [CharID], [MarketID], [Result], [Money], [GuaranteeMoney], [ReturnMoney], [EndDate], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count])
VALUES( @MoneyID, @CharID, @MarketID, @Result, @Money, @GuaranteeMoney, @ReturnMoney, @EndDate, @Type, @TypeID, @Quality, @Gem1, @Gem2, @Gem3, @Gem4, @Gem5, @Gem6, @Craftname, @Count )
IF( @@ERROR <> 0 )
BEGIN
	RETURN 0
END


RETURN 1

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_CharResultMoney_DEL]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE  Proc [dbo].[usp_Market_CharResultMoney_DEL]

@MoneyID	int

AS

SET NOCOUNT ON

DELETE FROM [MarketCharResultMoney] WHERE MoneyID = @MoneyID

IF( @@ERROR <> 0 )
BEGIN

	RETURN 0
END


RETURN 1

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_CharResultMoney_READ]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE Proc [dbo].[usp_Market_CharResultMoney_READ]

AS

SET NOCOUNT ON

DECLARE
@MoneyMaxID	int

SELECT @MoneyMaxID = ISNULL(MAX( MoneyID ),0) FROM MarketCharResultMoney

SELECT [MoneyID], [CharID], [MarketID], [Result], [Money], [GuaranteeMoney], [ReturnMoney], [EndDate], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count] FROM [MarketCharResultMoney]
ORDER BY CharID

RETURN @MoneyMaxID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_DEL]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO









CREATE  Proc [dbo].[usp_Market_DEL]

@IDList 		varchar(4096) = ''

AS

SET NOCOUNT ON

DECLARE
@TmpQuery	varchar(8000)

SET @TmpQuery = 'INSERT INTO #TmpDel(MarketID) VALUES('
SET @TmpQuery = @TmpQuery + REPLACE( @IDList, ',', ') INSERT INTO #TmpDel(MarketID) VALUES(' )
SET @TmpQuery = @TmpQuery + ')'

CREATE TABLE #TmpDel( MarketID int  NULL )

--PRINT @TmpQuery

EXEC (@TmpQuery)

UPDATE [Market] SET Del = 1
WHERE MarketID IN (SELECT MarketID FROM #TmpDel)

-- Fail
IF @@ERROR <> 0
BEGIN
	DROP TABLE #TmpDel
	RETURN 0
END
ELSE
BEGIN
	DROP TABLE #TmpDel
	RETURN 1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_INIT]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE  Proc [dbo].[usp_Market_INIT]

AS

SET NOCOUNT ON

DECLARE
@CurDate	datetime,
@MaxMarketID	int


SET @CurDate = GETDATE()

SELECT @MaxMarketID = ISNULL(MAX( MarketID ),0) FROM Market

INSERT INTO [MarketCharResultItems_DelLog]([CharID], [MarketID], [Result], [EndDate], [DelDate])
SELECT [CharID], [MarketID], [Result], [EndDate], @CurDate FROM [MarketCharResultItems] WHERE EndDate <= @CurDate

INSERT INTO [MarketItems_DelLog]([MarketID], [ItemID], [ItemUID], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count], [Maketime], [Maketype])
SELECT [MarketID], [ItemID], [ItemUID], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count], [Maketime], [Maketype] FROM [MarketItems]
WHERE MarketID IN ( SELECT [MarketID] FROM [MarketCharResultItems] WHERE EndDate <= @CurDate )

DELETE FROM [MarketItems]
WHERE MarketID IN ( SELECT [MarketID] FROM [MarketCharResultItems] WHERE EndDate <= @CurDate )

DELETE FROM [MarketCharResultItems]
WHERE EndDate <= @CurDate


INSERT INTO [MarketCharResultMoney_DelLog]( [MoneyID], [CharID], [MarketID], [Result], [Money], [GuaranteeMoney], [ReturnMoney], [EndDate], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count], [DelDate])
SELECT [MoneyID], [CharID], [MarketID], [Result], [Money], [GuaranteeMoney], [ReturnMoney], [EndDate], [Type], [TypeID], [Quality], [Gem1], [Gem2], [Gem3], [Gem4], [Gem5], [Gem6], [Craftname], [Count], @CurDate FROM [MarketCharResultMoney] WHERE EndDate <= @CurDate

DELETE FROM [MarketCharResultMoney]
WHERE EndDate <= @CurDate



DELETE FROM [Market]
WHERE Del = 1 AND EndDate < DATEADD(day, -16, @CurDate )


RETURN @MaxMarketID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Market_READ]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE  Proc [dbo].[usp_Market_READ]

AS

SET NOCOUNT ON

SELECT M.[MarketID], M.[CharID], M.[MinMoney], M.[DirectMoney], M.[MarketType], 
	M.[GuaranteeMoney], M.[TenderCharID], M.[TenderMoney], M.[EndDate], C.[CharName], ISNULL( M.[TenderCharName], '') TenderCharName, 
	I.[ItemID], I.[ItemUID], I.[Type], I.[TypeID], I.[Quality], I.[Gem1], I.[Gem2], I.[Gem3], I.[Gem4], I.[Gem5], I.[Gem6], I.[Craftname], I.[Count], I.[Maketime], I.[Maketype]
FROM Market M
INNER JOIN MarketItems I ON M.MarketID = I.MarketID 
INNER JOIN Chars C ON M.CharID = C.CharID

WHERE M.Del = 0
ORDER BY M.[MarketID]


RETURN 1

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Market_Tender_UPDATE]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE Proc [dbo].[usp_Market_Tender_UPDATE]

@MarketID 		int,
@TenderCharID		int,
@TenderMoney		int,
@TenderCharName	varchar(21)

AS

SET NOCOUNT ON

UPDATE [Market]
SET [TenderCharID]= @TenderCharID, [TenderMoney]= @TenderMoney, [TenderCharName]=@TenderCharName
WHERE MarketID = @MarketID

IF @@ERROR <> 0
BEGIN
	RETURN 0
END

RETURN 1

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_BanChar_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_BanChar_R]

@CharID int

AS

SET NOCOUNT ON

SELECT BanID,BanName,Memo FROM BanChars WHERE CharID=@CharID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_ApplySkills_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_Char_ApplySkills_R]

@CharID int

AS

SET NOCOUNT ON

SELECT SkillID,SkillLevel,LeftResetTime FROM CharApplySkills WHERE CharID=@CharID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_ConcernMarket_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[usp_Read_Char_ConcernMarket_R]

@CharID int

AS

SET NOCOUNT ON

SELECT TOP 10 MarketID FROM MarketCharConcern WHERE CharID=@CharID
ORDER BY RowID

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_FinishedQuest_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_Char_FinishedQuest_R]

@CharID int

AS

SET NOCOUNT ON

SELECT QuestID,Success FROM CharQuests WHERE CharID=@CharID AND Finish=1

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_GuildJoinDate_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO





CREATE Proc [dbo].[usp_Read_Char_GuildJoinDate_R]
@CharID	int
AS

SET NOCOUNT ON

DECLARE 
@RemainTime	int

SET @RemainTime = 0

SELECT TOP 1 @RemainTime = CASE 
WHEN DATEDIFF ( Hour , JoinDate , GETDATE() ) >=72 THEN 0
else 72-DATEDIFF ( Hour , JoinDate , GETDATE() ) END
FROM GuildChars
WHERE CharID = @CharID
ORDER BY JoinDate DESC

PRINT(@RemainTime)

RETURN @RemainTime

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_Items_Detail_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_Char_Items_Detail_R]

@CharID int

AS

SET NOCOUNT ON

SELECT ItemID, Type, TypeID, ItemUID, Bag, Slot, Quality, 
Gem1, Gem2, Gem3, Gem4, Gem5, Gem6, Craftname, [Count],  Maketype ,
DATEPART(yyyy, MakeTime) AS MakeTime_YYYY, 
DATEPART(mm, MakeTime) AS MakeTime_MM, 
DATEPART(dd, MakeTime) AS MakeTime_DD, 
DATEPART(hh, MakeTime) AS MakeTime_HH, 
DATEPART(mi, MakeTime) AS MakeTime_MI, 
DATEPART(ss, MakeTime) AS MakeTime_SS

FROM CharItems

WHERE CharID = @CharID AND Del = 0

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_Items_Simple_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Read_Char_Items_Simple_R    스크립트 날짜: 2006-05-29 오후 7:00:09 ******/



CREATE  Proc [dbo].[usp_Read_Char_Items_Simple_R]

@CharID int,
@Slot int,
@Bag int = 0

AS

SET NOCOUNT ON

SELECT Slot,Type,TypeID,Gem1,Gem2,Gem3,Gem4,Gem5,Gem6 FROM CharItems WHERE CharID=@CharID AND Del=0 AND Bag=0 AND Slot<@Slot

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_Product_Item_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_Read_Char_Product_Item_E]

@UserUID int

AS

SELECT Slot,ItemID,ItemCount FROM PS_USERDB01.PS_Billing.dbo.Users_Product WHERE UserUID=@UserUID

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_Quest_Count_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_Char_Quest_Count_R]

@CharID int,
@QuestID int

AS

SET NOCOUNT ON

SELECT Count1,Count2,Count3 FROM CharQuests WHERE CharID=@CharID AND QuestID=@QuestID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_Quest_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_Char_Quest_R]

@CharID int

AS

SET NOCOUNT ON

SELECT QuestID, [Delay], Count1, Count2, Count3 FROM CharQuests WHERE CharID=@CharID AND Finish=0 AND Del=0

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_QuickSlots_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_Char_QuickSlots_R]

@CharID int

AS

SET NOCOUNT ON

SELECT QuickBar,QuickSlot,Bag,Number FROM CharQuickSlots WHERE CharID=@CharID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_SavePoint]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*==================================================
@author	lenasoft
@date	2006-08-29
@return	
@brief	저장된 기록점을 가져온다.(중국/해외측만 해당)
==================================================*/
CREATE Proc [dbo].[usp_Read_Char_SavePoint]

@CharID int

AS

SET NOCOUNT ON

SELECT Slot, MapID, PosX, PosY, PosZ FROM CharSavePoint
WHERE CharID = @CharID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_Skills_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  Proc [dbo].[usp_Read_Char_Skills_R]

@CharID int

AS

SET NOCOUNT ON

SELECT SkillID,SkillLevel,Number,[Delay] FROM CharSkills WHERE CharID=@CharID AND Del=0 ORDER BY Number ASC

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Chars_Detail2_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_Chars_Detail2_R] 

@CharID int

AS

SET NOCOUNT ON

DECLARE @UserUID int
DECLARE @Money bigint
DECLARE @GuildID int
DECLARE @GuildLevel tinyint

-- 2005-12-30 스탯,스킬 이벤트관련...
DECLARE @Event1 tinyint
DECLARE @Event2 tinyint
--

SET @Money = 0
SET @UserUID = (SELECT UserUID FROM Chars WHERE CharID = @CharID)
SET @GuildID = (SELECT GuildID FROM GuildChars WHERE CharID = @CharID AND Del = 0)

IF(@UserUID IS NOT NULL)
BEGIN
	SET @Money = (SELECT ISNULL([Money], 0) FROM UserStoredMoney WHERE UserUID = @UserUID)
END
ELSE
BEGIN
	SET @Money = 0
END

IF(@GuildID IS NOT NULL)
BEGIN
	SET @GuildLevel = (SELECT GuildLevel FROM GuildChars WHERE CharID = @CharID AND Del = 0)
END
ELSE
BEGIN
	SET @GuildID = 0
	SET @GuildLevel = 0
END

-- 2005-12-30 스탯,스킬 이벤트관련...
SELECT @Event1=Event1, @Event2=Event2 FROM CharEvents WHERE CharID=@CharID
--

SELECT UserUID, CharID, CharName, Slot, Family, Grow, Hair, Face, [Size], Job, Sex, [Level], 
StatPoint AS DistPoint, SkillPoint, [Str], Dex, Rec, [Int], Luc, Wis, HP, MP, SP, Map, Dir, [Exp], [Money], 
PosX, PosY, PosZ, Hg, Vg, Cg, Og, Ig, Del, K1, K2, K3, K4, @Money AS StoredMoney, @GuildID AS GuildID, @GuildLevel AS GuildLevel,

-- 전투공로관 보상레벨
KillLevel, DeadLevel,
--

-- 스탯,스킬 이벤트관련...
@Event1, @Event2,
--

DATEPART(yyyy, LeaveDate) AS LeaveDate_YYYY, 
DATEPART(mm, LeaveDate) AS LeaveDate_MM, 
DATEPART(dd, LeaveDate) AS LeaveDate_DD, 
DATEPART(hh, LeaveDate) AS LeaveDate_HH, 
DATEPART(mi, LeaveDate) AS LeaveDate_MI, 
DATEPART(ss, LeaveDate) AS LeaveDate_SS

--

FROM Chars WHERE CharID = @CharID

-- 접속시간 기록
UPDATE Chars SET JoinDate=GETDATE() WHERE CharID=@CharID
--

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Chars_PointLog_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE Proc [dbo].[usp_Read_Chars_PointLog_R]

@CharID int
--@UseType tinyint

AS

SET NOCOUNT ON


SELECT TOP 10 ProductCode, UseDate, UsePoint FROM PointLog WITH (READUNCOMMITTED) WHERE CharID=@CharID
ORDER BY UseDate desc

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Chars_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** 개체: 저장 프로시저 dbo.usp_Read_Chars_R    스크립트 날짜: 2006-05-09 오후 12:17:36 ******/


CREATE  Proc [dbo].[usp_Read_Chars_R]

@ServerID tinyint,
@UserUID int,
@Del int= 0

AS

SET NOCOUNT ON

SELECT CharID, CharName, Slot, 
Family, Grow, Hair, Face, [Size], Job, Sex, [Level], [Str], Dex, Rec, [Int], Luc, Wis, 
HP, MP, SP, Map, RenameCnt, RemainTime, 
DATEPART(yyyy, RegDate) AS MakeTime_YYYY, 
DATEPART(mm, RegDate) AS MakeTime_MM, 
DATEPART(dd, RegDate) AS MakeTime_DD, 
DATEPART(hh, RegDate) AS MakeTime_HH, 
DATEPART(mi, RegDate) AS MakeTime_MI, 
DATEPART(ss, RegDate) AS MakeTime_SS

FROM Chars

WHERE ServerID=@ServerID AND UserUID=@UserUID AND Del=@Del

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[usp_Read_CharSlots_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_CharSlots_R]

@ServerID tinyint,
@UserUID int,
@Slot tinyint

AS

SET NOCOUNT ON

SELECT CharID FROM Chars WHERE ServerID=@ServerID AND UserUID=@UserUID AND Slot=@Slot AND Del=0

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_FriendChar_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_FriendChar_R]

@CharID int

AS

SET NOCOUNT ON

SELECT F.FriendID, C.CharName, F.Family, F.Grow, F.Job, F.Memo, F.Refuse FROM FriendChars F
INNER JOIN Chars C ON F.FriendID = C.CharID 

WHERE F.CharID=@CharID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_GodBless_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_GodBless_R]

AS

SET NOCOUNT ON

SELECT GodBless_Light, GodBless_Dark FROM WorldInfo

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Guild_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_Guild_R]

AS

SET NOCOUNT ON

SELECT GuildID,GuildName,MasterName,Country FROM Guilds WHERE Del=0

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Guild_StoredItems_Detail_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO





CREATE Proc [dbo].[usp_Read_Guild_StoredItems_Detail_R]

@GuildID int

AS

SET NOCOUNT ON

SELECT ItemID, Type, TypeID, ItemUID, Slot, Quality, 
Gem1, Gem2, Gem3, Gem4, Gem5, Gem6, Craftname, [Count], Maketype,
DATEPART(yyyy, MakeTime) AS MakeTime_YYYY, 
DATEPART(mm, MakeTime) AS MakeTime_MM, 
DATEPART(dd, MakeTime) AS MakeTime_DD, 
DATEPART(hh, MakeTime) AS MakeTime_HH, 
DATEPART(mi, MakeTime) AS MakeTime_MI, 
DATEPART(ss, MakeTime) AS MakeTime_SS

FROM GuildStoredItems

WHERE GuildID=@GuildID AND Del = 0

ORDER BY MakeTime DESC

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Guild2_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE Proc [dbo].[usp_Read_Guild2_R]

AS

SET NOCOUNT ON

SELECT G.GuildID, G.GuildName, G.MasterName, G.Country, G.GuildPoint,
ISNULL(H.[Rank],31) [Rank], ISNULL(H.Etin,0) Etin, ISNULL(H.UseHouse,0) UseHouse, ISNULL(H.Remark, '') Remark, ISNULL( H.BuyHouse,0) BuyHouse, ISNULL(H.EtinReturnCnt, 0 ) EtinReturnCnt, ISNULL(H.KeepEtin, 0) KeepEtin
FROM Guilds G
LEFT OUTER JOIN GuildDetails H ON G.GuildID = H.GuildID
WHERE G.Del=0
ORDER BY H.[Rank] DESC

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_GuildChar_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_GuildChar_R]

@GuildID int=0

AS

SET NOCOUNT ON

IF( @GuildID = 0 )
BEGIN
	SELECT B.CharID, B.CharName, B.[Level], B.Job, A.GuildID, A.GuildLevel
	FROM GuildChars A INNER JOIN Chars B ON A.CharID = B.CharID
	WHERE A.Del = 0
END
ELSE
BEGIN
	SELECT B.CharID, B.CharName, B.[Level], B.Job, A.GuildID, A.GuildLevel
	FROM GuildChars A INNER JOIN Chars B ON A.CharID = B.CharID
	WHERE A.GuildID = @GuildID AND A.Del = 0
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_GuildNpcLv_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE Proc [dbo].[usp_Read_GuildNpcLv_R]

@GuildID 	int

AS

SET NOCOUNT ON

SELECT GNpcType, NpcLevel, Number  FROM GuildNpcLv 
WHERE GuildID=@GuildID AND Del=0 ORDER BY Number ASC

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_ItemCount_ByServer_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Read_ItemCount_ByServer_R]

AS

SET NOCOUNT ON

SELECT V.Type, V.TypeID, V.ItemID, COUNT(*) AS COUNT
FROM View_Items V WITH(NOLOCK) INNER JOIN PS_DEFINEDB.PS_GameDefs.dbo.Items I
ON V.ItemID = I.ItemID
WHERE I.Server <> 0
GROUP BY V.Type, V.TypeID, V.ItemID

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Keep_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_Keep_R]

@KeepID int = 0

AS

SET NOCOUNT ON

IF( @KeepID = 0 )
BEGIN
	SELECT KeepID,OwnCountry,ResetTime FROM Keeps
END
ELSE
BEGIN
	SELECT KeepID,OwnCountry,ResetTime FROM Keeps WHERE KeepID=@KeepID
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_MaxGuildID_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_MaxGuildID_R]

AS

SET NOCOUNT ON

SELECT ISNULL( MAX(GuildID),0 ) + 1 FROM Guilds

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_User_CashPoint_NCash]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==================================================
@author lenasoft
@date 2006-09-28
@return
@brief N-Cash DB에서 포인트를 가져온다.

잔액 확인
procGetCashBalance

유저 ID          @userId               AS         VARCHAR(12)
유저 UID @clientUserNumber     AS         BIGINT
캐쉬 잔액             @cashBalance          AS         INT                      OUTPUT
==================================================*/
CREATE PROCEDURE [dbo].[usp_Read_User_CashPoint_NCash]  
@CashPoint int OUTPUT,
@UserUID  int,
@UserID  varchar(12)

AS

SET NOCOUNT ON

SET @CashPoint = 0

SELECT @CashPoint=ISNULL(Point,0) FROM game.PS_UserData.dbo.Users_Master WHERE UserUID=@UserUID 
IF @CashPoint < 0
BEGIN
UPDATE game.PS_UserData.dbo.Users_Master SET Point=0 WHERE UserUID=@UserUID
SET @CashPoint = 0
end

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_User_CashPoint_UsersMaster]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_Read_User_CashPoint_UsersMaster]
@CashPoint int OUTPUT,
@UserUID   int

AS

SET NOCOUNT ON

SET @CashPoint = 0

SELECT @CashPoint=ISNULL(Point,0) FROM PS_UserData.dbo.Users_Master WHERE UserUID=@UserUID
IF( @CashPoint < 0 )
BEGIN
    UPDATE PS_UserData.dbo.Users_Master SET Point=0 WHERE UserUID=@UserUID
    SET @CashPoint = 0
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_User_Event_BattleZone]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_Read_User_Event_BattleZone]
@UserUID 	int

AS

SET NOCOUNT ON

SELECT Country FROM PS_USERDB01.PS_UserData.dbo.Users_EventBattleZone WHERE UserUID=@UserUID 


SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[usp_Read_User_GiftPointItemNotify]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_Read_User_GiftPointItemNotify]

@UserUID int

AS


SET NOCOUNT ON


SELECT ProductCode, SendCharName, RecvDate 
FROM    PointGiftNotify WITH (READUNCOMMITTED) 
WHERE UserUID=@UserUID
ORDER BY RecvDate


IF( @@ROWCOUNT > 0)
BEGIN
	delete PointGiftNotify
	where UserUID=@UserUID
END


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_User_MaxGrow_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_User_MaxGrow_R]

@ServerID tinyint,
@UserUID int

AS

SET NOCOUNT ON

SELECT Country,MaxGrow FROM UserMaxGrow WHERE ServerID=@ServerID AND UserUID=@UserUID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_User_StoredItems_Detail_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_User_StoredItems_Detail_R]

@ServerID tinyint,
@UserUID int

AS

SET NOCOUNT ON

SELECT ItemID, Type, TypeID, ItemUID, Slot, Quality, 
Gem1, Gem2, Gem3, Gem4, Gem5, Gem6, Craftname, [Count], Maketype,
DATEPART(yyyy, MakeTime) AS MakeTime_YYYY, 
DATEPART(mm, MakeTime) AS MakeTime_MM, 
DATEPART(dd, MakeTime) AS MakeTime_DD, 
DATEPART(hh, MakeTime) AS MakeTime_HH, 
DATEPART(mi, MakeTime) AS MakeTime_MI, 
DATEPART(ss, MakeTime) AS MakeTime_SS

FROM UserStoredItems

WHERE ServerID=@ServerID AND UserUID=@UserUID

ORDER BY MakeTime DESC

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Read_User_StoredPointItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/*==================================================
@author	lenasoft
@date	2006-09-25
@return	

@brief	유저의 포인트아이템을 리드한다.
==================================================*/


CREATE   Proc [dbo].[usp_Read_User_StoredPointItems]

@UserUID int

AS

SET NOCOUNT ON

SELECT Slot,ItemID,ItemCount FROM UserStoredPointItems WHERE UserUID=@UserUID


SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Read_WorldInfo_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Read_WorldInfo_E]

AS

SET NOCOUNT ON

SELECT TOP 1 LastWorldTime FROM WorldInfo

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_BandMemo_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Save_BandMemo_E]

@CharID int,
@BanID int,
@Memo varchar(50) = NULL

AS

SET NOCOUNT ON

SET @Memo = LTRIM( RTRIM(@Memo) )

UPDATE BanChars SET Memo=@Memo WHERE CharID=@CharID AND BanID=@BanID

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ApplySkill_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_ApplySkill_Add_E]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@LeftResetTime smallint

AS

SET NOCOUNT ON

INSERT INTO CharApplySkills(CharID,Skillid,SkillLevel,LeftResetTime) VALUES(@CharID,@Skillid,@SkillLevel,@LeftResetTime)

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ApplySkill_Add_E2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[usp_Save_Char_ApplySkill_Add_E2]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@LeftResetTime int

AS

SET NOCOUNT ON

INSERT INTO CharApplySkills(CharID,Skillid,SkillLevel,LeftResetTime) VALUES(@CharID,@Skillid,@SkillLevel,@LeftResetTime)

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ApplySkill_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_ApplySkill_Del_E]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@DeleteAll bit = 0

AS

SET NOCOUNT ON

IF(@DeleteAll = 0)
BEGIN
	DELETE CharApplySkills WHERE CharID=@CharID AND SKillID=@SkillID AND SkillLevel=@SkillLevel
END
ELSE
BEGIN
	DELETE CharApplySkills WHERE CharID=@CharID
END

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ApplySkill_Mod_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_ApplySkill_Mod_E]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@LeftResetTime smallint

AS

SET NOCOUNT ON

-- 쿨타임만 변경됨..
UPDATE CharApplySkills
SET [LeftResetTime] = @LeftResetTime
WHERE CharID=@CharID AND SkillID=@SkillID AND SkillLevel=@SkillLevel

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ApplySkill_Mod_E2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[usp_Save_Char_ApplySkill_Mod_E2]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@LeftResetTime int

AS

SET NOCOUNT ON

-- 쿨타임만 변경됨..
UPDATE CharApplySkills
SET [LeftResetTime] = @LeftResetTime
WHERE CharID=@CharID AND SkillID=@SkillID AND SkillLevel=@SkillLevel

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_BodyChg_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Proc [dbo].[usp_Save_Char_BodyChg_E]

@CharID int,
@Hair      tinyint,
@Face    tinyint,
@Size     tinyint,
@Sex      tinyint

AS

SET NOCOUNT ON

UPDATE Chars
SET Hair=@Hair, Face=@Face, [Size]=@Size,  Sex=@Sex
WHERE CharID = @CharID


IF(@@ERROR = 0 AND @@ROWCOUNT = 1)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ConcernMarket_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[usp_Save_Char_ConcernMarket_Add_E]

@CharID 	int,
@MarketID	int

AS

SET NOCOUNT ON

INSERT INTO MarketCharConcern(CharID, MarketID)
VALUES(@CharID, @MarketID  )


SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_ConcernMarket_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[usp_Save_Char_ConcernMarket_Del_E]

@CharID 	int

AS

SET NOCOUNT ON

DELETE FROM MarketCharConcern
WHERE CharID = @CharID


SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Country_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Country_E]

@ServerID tinyint,
@UserUID int,
@Country smallint,
@Insert bit = 0

AS

SET NOCOUNT ON

IF(@Insert = 1)
BEGIN
	INSERT UserMaxGrow(ServerID,UserUID,Country,MaxGrow) VALUES(@ServerID,@UserUID,@Country,3)
END
ELSE
BEGIN
	UPDATE UserMaxGrow SET Country=@Country	WHERE ServerID=@ServerID AND UserUID=@UserUID
END

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Usp_Save_Char_EnableRename_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[Usp_Save_Char_EnableRename_E]

@CharID int

AS

SET NOCOUNT ON

UPDATE Chars SET RenameCnt = RenameCnt+1  WHERE CharID = @CharID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_FinishedQuest_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_FinishedQuest_E]

@CharID int,
@QuestID smallint,
@Success tinyint,
@Insert bit = 0

AS

SET NOCOUNT ON

IF(@Insert = 0)
BEGIN
	UPDATE CharQuests SET Success=@Success,Finish=1 WHERE CharID=@CharID AND QuestID=@QuestID
END
ELSE
BEGIN
	INSERT INTO CharQuests(CharID,QuestID,[Delay],Success,Finish) VALUES(@CharID,@QuestID,0,@Success,1)
END

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Info_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_Save_Char_Info_E]

@CharID int,
@Level int,
@StatPoint smallint,
@SkillPoint smallint,
@Str smallint,
@Dex smallint,
@Rec smallint,
@Int smallint,
@Wis smallint,
@Luc smallint,
@Hp smallint,
@Mp smallint,
@Sp smallint,
@Map smallint,
@Dir smallint,
@Exp int,
@Money int,
@Posx varchar(50),
@Posy varchar(50),
@Posz varchar(50),
@Hg int,
@Vg int,
@Cg int,
@Og int,
@Ig int,
@K1 int = null,
@K2 int = null,
@K3 int = null,
@K4 int = null,
@KillLevel tinyint,
@DeadLevel tinyint

AS

SET NOCOUNT ON

DECLARE @ServerID int,
        @Grow     int,
        @tempExp  bigint,
        @PosxR    real,
        @PosyR    real,
        @PoszR    real

SET @ServerID = 1

IF (ISNumeric(@Posx) = 1 and ISNumeric(@Posy) = 1 and ISNumeric(@Posz) = 1)
BEGIN
    SET @PosxR = CAST(@Posx as real)
    SET @PosyR = CAST(@Posy as real)
    SET @PoszR = CAST(@Posz as real)
END
ELSE
BEGIN
    --Only gets here if there is a error in the positions, Most likely a bot or exploit.
    --Log in a error table for manual invest.
    --Set all the pos. to bootleg so it doesn't throw an error
    SET @Map = 42
    SET @PosxR = 66.5
    SET @PosYR = 2.0
    SET @PosZR = 52.6
END

UPDATE Chars
    SET [Level] = @Level, StatPoint = @StatPoint, SkillPoint = @SkillPoint,
    [Str] = @Str, dex = @Dex, Rec = @Rec, [int] = @Int, Wis = @Wis, Luc = @Luc,
    HP = @Hp, Mp = @Mp, Sp = @Sp,
    Map = @Map, dir = @Dir, [exp] = @Exp, [money] = @Money,
    PosX = @PosxR, PosY = @PosYR, PosZ = @PosZR, hg = @Hg, vg = @Vg, cg = @Cg, og = @Og, ig = @Ig, 
    KillLevel=@KillLevel, DeadLevel=@DeadLevel,LeaveDate=GETDATE()
WHERE CharID = @CharID

IF( (@K1 IS NOT NULL) AND (@K2 IS NOT NULL) AND (@K3 IS NOT NULL) AND (@K4 IS NOT NULL))
BEGIN
    UPDATE Chars SET K1=@K1, K2=@K2, K3=@K3, K4=@K4 WHERE CharID=@CharID
END

IF(@@ERROR = 0 AND @@ROWCOUNT = 1)
BEGIN
    RETURN 1
END
ELSE
BEGIN
    RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Item_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/****** 개체: 저장 프로시저 dbo.usp_Save_Char_Item_Add_E ******/


CREATE Proc [dbo].[usp_Save_Char_Item_Add_E]

@CharID int,
@ItemUID bigint,
@Bag tinyint,
@Slot tinyint,
@ItemID int,
@Type tinyint,
@TypeID tinyint,
@Quality int,
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Craftname varchar(20) = '',
@Count tinyint,
@MaketimeZ varchar(50),
@Maketype char(1)

AS
DECLARE @Maketime as datetime
SELECT @Maketime = CONVERT(datetime, @MaketimeZ, 120)
--SET NOCOUNT ON

IF(@Quality >= 5000)
BEGIN
SET @Quality=0
END

INSERT INTO CharItems
(CharID, bag, slot, ItemID, Type, TypeID, ItemUID, quality, gem1, gem2, gem3, gem4,
gem5, gem6, craftname, [count], maketime, maketype)
VALUES(@CharID, @Bag, @Slot, @ItemID, @Type, @TypeID, @ItemUID, @Quality, @Gem1, @Gem2, @Gem3, @Gem4,
@Gem5, @Gem6, @Craftname, @Count, @Maketime, @Maketype)

IF(@@ERROR = 0)
BEGIN
RETURN 1
END
ELSE
BEGIN
RETURN -1
END

--SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Item_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/****** 개체: 저장 프로시저 dbo.usp_Save_Char_Item_Del_E    스크립트 날짜: 2006-04-11 오후 10:57:52 ******/


CREATE   Proc [dbo].[usp_Save_Char_Item_Del_E]

@CharID int,
@IDList varchar(7000) = '', -- 삭제시(리스트값)
@ChkID int = 1,
@Qry varchar(8000) = ''

AS

--------------------------------------------------------------------------------------------------------------------------------
SET NOCOUNT ON

DECLARE
@TmpQuery	varchar(7000)

SET @TmpQuery = 'INSERT INTO #TmpTb(ItemUID) VALUES('
SET @TmpQuery = @TmpQuery + REPLACE( @IDList, ',', ') INSERT INTO #TmpTb(ItemUID) VALUES(' )
SET @TmpQuery = @TmpQuery + ')'


CREATE TABLE #TmpTb( ItemUID bigint  NULL )

EXEC (@TmpQuery)


IF( @ChkID = 1 )
BEGIN
	DELETE CharItems WHERE CharID = @CharID AND ItemUID IN (SELECT ItemUID FROM #TmpTb)
END
ELSE
BEGIN
	DELETE CharItems WHERE ItemUID IN (SELECT ItemUID FROM #TmpTb)
END

IF(@@ERROR = 0)
BEGIN
	DROP TABLE #TmpTb
	RETURN 1
END
ELSE
BEGIN
	DROP TABLE #TmpTb
	RETURN -1
END

SET NOCOUNT OFF

--------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Item_Mod_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/****** 개체: 저장 프로시저 dbo.usp_Save_Char_Item_Mod_E    스크립트 날짜: 2006-04-11 오후 10:58:15 ******/


CREATE   Proc [dbo].[usp_Save_Char_Item_Mod_E]

@CharID int,
@ItemUID bigint = Null, -- 일반 작업시

-- 삭제만 필요한 경우 여기까지만 사용
-- 나머지는 기본값 Null 적용
@Bag tinyint = Null, 
@Slot tinyint = Null, 
@Quality smallint = Null, 
@Gem1 tinyint = Null, 
@Gem2 tinyint = Null, 
@Gem3 tinyint = Null, 
@Gem4 tinyint = Null,  
@Gem5 tinyint = Null, 
@Gem6 tinyint = Null, 
@Craftname varchar(20) = '',
@Count tinyint = Null,
@Qry varchar(8000) = ''

AS

--SET NOCOUNT ON

UPDATE CharItems
SET Bag=@Bag, Slot=@Slot, Quality=@Quality, Gem1=@Gem1, Gem2=@Gem2, Gem3=@Gem3, Gem4=@Gem4, Gem5=@Gem5, Gem6=@Gem6, 
[Count]=@Count, Craftname=@Craftname
WHERE CharID=@CharID AND ItemUID = @ItemUID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN	
	RETURN -1
END

--SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_LeaveDate_R]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_LeaveDate_R] 

@CharID int

AS

SET NOCOUNT ON

-- 종료시간 기록
--UPDATE Chars SET LeaveDate=GETDATE() WHERE CharID=@CharID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Maxgrow_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Maxgrow_E]

@ServerID tinyint,
@UserUID int,
@MaxGrow tinyint

AS

SET NOCOUNT ON

UPDATE UserMaxGrow SET MaxGrow=@MaxGrow WHERE ServerID=@ServerID AND UserUID=@UserUID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Name_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_Save_Char_Name_E]

@ServerID tinyint,
@CharID int,
@OldCharName nvarchar(30),
@NewCharName nvarchar(30)

AS

SET NOCOUNT ON
DECLARE @Regex AS INT

SET @OldCharName = LTRIM(RTRIM(REPLACE(@OldCharName, nchar(39), nchar(32))))
SET @NewCharName = LTRIM(RTRIM(REPLACE(@NewCharName, nchar(39), nchar(32))))
SET @Regex = PATINDEX('%[^a-zA-Z0-9._-À-ỹ ]%', @NewCharName) 

IF @Regex > 0
RETURN -1


IF EXISTS (SELECT CharID FROM Chars WHERE CharName = @NewCharName AND Del = 0)
BEGIN
	RETURN -2
END

BEGIN TRANSACTION

UPDATE Chars SET CharName = @NewCharName, RenameCnt = RenameCnt - 1, OldCharName = @OldCharName 
WHERE CharID = @CharID AND Del = 0

IF @@ERROR <> 0
BEGIN
	GOTO ERROR_ROLLBACK
END

UPDATE Guilds SET MasterName = @NewCharName WHERE MasterCharID = @CharID

UPDATE FriendChars SET FriendName = @NewCharName WHERE FriendID = @CharID

UPDATE BanChars SET BanName = @NewCharName WHERE BanID = @CharID

INSERT INTO CharRenameLog(ServerID, CharID, CharName) VALUES(@ServerID, @CharID, @NewCharName)

COMMIT TRANSACTION
RETURN 1

ERROR_ROLLBACK:
RETURN -2

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Product_Item_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Proc [dbo].[usp_Save_Char_Product_Item_E]

@ServerID tinyint,
@UserUID int,
@BankSlot tinyint,

@CharID int,
@ItemUID bigint,
@Bag tinyint,
@Slot tinyint,
@ItemID int,
@Type tinyint,
@TypeID tinyint,
@Quality smallint,	--int
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Craftname varchar(20) = '', 
@Count tinyint,
@Maketime datetime,
@Maketype varchar(1)	--char(1)

AS

--SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @ProductCode varchar(20)
DECLARE @OrderNumber int
DECLARE @VerifyCode bigint
DECLARE @BuyDate datetime

IF(@Quality >= 5000)
BEGIN
	SET @Quality=0
END

BEGIN DISTRIBUTED TRANSACTION

-- 인벤토리 추가
INSERT INTO CharItems(CharID,Bag,Slot,ItemID,Type,TypeID,ItemUID,Quality,Gem1,Gem2,Gem3,Gem4, 
Gem5,Gem6,CraftName,[Count],Maketime,Maketype)
VALUES(@CharID,@Bag,@Slot,@ItemID,@Type,@TypeID,@ItemUID,@Quality,@Gem1,@Gem2,@Gem3,@Gem4, 
@Gem5,@Gem6,@Craftname,@Count,@Maketime,@Maketype)

-- 상품수령로그 기록
SELECT @ProductCode=ProductCode,@OrderNumber=OrderNumber,@VerifyCode=VerifyCode,@BuyDate=BuyDate
FROM PS_USERDB01.PS_Billing.dbo.Users_Product 
WHERE UserUID=@UserUID AND Slot=@BankSlot

INSERT INTO ProductLog(ServerID,UserUID,CharID,ItemID,ItemUID,Quality,ItemCount,ProductCode,OrderNumber,VerifyCode,BuyDate,ReceiveDate)
VALUES(@ServerID,@UserUID,@CharID,@ItemID,@ItemUID,@Quality,@Count,@ProductCode,@OrderNumber,@VerifyCode,@BuyDate,@Maketime)

-- 은행창고 삭제
DELETE FROM PS_USERDB01.PS_Billing.dbo.Users_Product WHERE UserUID=@UserUID AND Slot=@BankSlot

IF( @@ERROR=0 AND @@ROWCOUNT=1)
BEGIN
	COMMIT TRAN
	RETURN 1
END
ELSE
BEGIN
	ROLLBACK TRAN
	RETURN -1
END

SET XACT_ABORT OFF
--SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Quest_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Quest_Add_E]

@CharID int,
@QuestID smallint,
@Delay smallint = Null,
@Count1 tinyint = Null,
@Count2 tinyint = Null,
@Count3 tinyint = Null

AS

SET NOCOUNT ON

INSERT INTO CharQuests(CharID,QuestID,[Delay],Count1,Count2,Count3) VALUES(@CharID,@QuestID,@Delay,@Count1,@Count2,@Count3)

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Quest_Count_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Quest_Count_E]

@CharID int,
@QuestID int,
@Count1 int,
@Count2 int,
@Count3 int

AS

SET NOCOUNT ON

UPDATE CharQuests SET Count1=@Count1, Count2=@Count2, Count3=@Count3 WHERE CharID=@CharID AND QuestID=@QuestID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Quest_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   Proc [dbo].[usp_Save_Char_Quest_Del_E]

@CharID int,
@QuestID smallint

AS

SET NOCOUNT ON

DELETE CharQuests WHERE CharID=@CharID AND QuestID=@QuestID
--UPDATE CharQuests SET Del=1 WHERE CharID=@CharID AND QuestID=@QuestID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Quest_Mod_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Quest_Mod_E]

@CharID int,
@QuestID smallint,
@Delay smallint = Null,
@Count1 tinyint = Null,
@Count2 tinyint = Null,
@Count3 tinyint = Null

AS

SET NOCOUNT ON

UPDATE CharQuests SET [Delay]=@Delay,Count1=@Count1,Count2=@Count2,Count3=@Count3 WHERE CharID=@CharID AND QuestID=@QuestID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_QuickSlot_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE  Proc [dbo].[usp_Save_Char_QuickSlot_Add_E]

@CharID int,
@QuickBar tinyint,
@QuickSlot tinyint,
@Bag tinyint, 
@Number smallint

AS

SET NOCOUNT ON

INSERT INTO CharQuickSlots(CharID,QuickBar,QuickSlot,Bag,Number) VALUES(@CharID,@QuickBar,@QuickSlot,@Bag,@Number)

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_QuickSlot_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_QuickSlot_Del_E]

@CharID int

AS

SET NOCOUNT ON

DELETE CharQuickSlots WHERE CharID=@CharID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_SavePoint]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*==================================================
@author	lenasoft
@date	2006-08-31
@return	
@brief	기록점을 저장(Update)한다.(중국/해외측만 해당)
==================================================*/
CREATE Proc [dbo].[usp_Save_Char_SavePoint]

@CharID int,
@Slot tinyint,
@MapID smallint,
@PosX real,
@PosY real,
@PosZ real

AS

SET NOCOUNT ON


UPDATE CharSavePoint SET MapID=@MapID, PosX=@PosX, PosY=@PosY, PosZ=@PosZ
WHERE CharID=@CharID AND Slot=@Slot

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Skill_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Skill_Add_E]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@Number tinyint,
@Delay smallint

AS

SET NOCOUNT ON

INSERT INTO CharSkills(CharID,SkillID,SkillLevel,Number,[Delay]) VALUES(@CharID,@SkillID,@SkillLevel,@Number,@Delay)

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Skill_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Skill_Del_E]

@CharID int,
@SkillID smallint,
@DeleteAll bit = 0

AS

SET NOCOUNT ON

IF(@DeleteAll = 0)
BEGIN
	DELETE CharSkills WHERE CharID=@CharID AND SKillID=@SkillID
END
ELSE
BEGIN
	DELETE CharSkills WHERE CharID=@CharID
END

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Char_Skill_Mod_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_Char_Skill_Mod_E]

@CharID int,
@SkillID smallint,
@SkillLevel tinyint,
@Delay smallint

AS

SET NOCOUNT ON

UPDATE CharSkills SET SkillLevel=@SkillLevel,[Delay]=@Delay WHERE CharID=@CharID AND SkillID=@SkillID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_FriendMemo_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Save_FriendMemo_E]

@CharID int,
@FriendID int,
@Memo varchar(50)=NULL

AS

SET NOCOUNT ON

SET @Memo = LTRIM( RTRIM(@Memo) )

UPDATE FriendChars SET Memo=@Memo WHERE CharID=@CharID AND FriendID=@FriendID

IF(@@ERROR = 0)
BEGIN
	RETURN 0
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_GodBless_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Save_GodBless_E]

@GodBless_Light int,
@GodBless_Dark int

AS

SET NOCOUNT ON

UPDATE WorldInfo SET GodBless_Light=@GodBless_Light, GodBless_Dark=@GodBless_Dark

IF( @@ERROR = 0 AND @@ROWCOUNT = 1 )
	RETURN 1
ELSE
	RETURN -1

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Guild_NpcLv_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Proc [dbo].[usp_Save_Guild_NpcLv_Add_E]

@GuildID 	int,
@GNpcType	smallint,
@NpcLevel	tinyint,
@Number	tinyint

AS

SET NOCOUNT ON

INSERT INTO GuildNpcLv ( GuildID, GNpcType, NpcLevel, Number )
VALUES(  @GuildID, @GNpcType, @NpcLevel, @Number )


SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Guild_NpcLv_Mod_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Proc [dbo].[usp_Save_Guild_NpcLv_Mod_E]

@GuildID 	int,
@GNpcType	smallint,
@NpcLevel	tinyint,
@Number	tinyint

AS

SET NOCOUNT ON

UPDATE GuildNpcLv
SET NpcLevel=@NpcLevel
WHERE GuildID=@GuildID AND GNpcType=@GNpcType AND Number=@Number

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Guild_StoredItem_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  Proc [dbo].[usp_Save_Guild_StoredItem_Add_E]

@GuildID int,
@ItemUID bigint,
@Slot tinyint,
@ItemID int,
@Type tinyint,
@TypeID tinyint,
@Quality smallint,
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Craftname varchar(20) = '', 
@Count tinyint,
@Maketime datetime,
@Maketype char(1)

AS

SET NOCOUNT ON

INSERT INTO GuildStoredItems
(GuildID, Slot, ItemID, Type, TypeID, ItemUID, quality, gem1, gem2, gem3, gem4, 
gem5, gem6, craftname, [count], maketime, maketype)
VALUES(@GuildID, @Slot, @ItemID, @Type, @TypeID, @ItemUID, @Quality, @Gem1, @Gem2, @Gem3, @Gem4, 
@Gem5, @Gem6, @Craftname, @Count, @Maketime, @Maketype)

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN	
	RETURN -1
END

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Guild_StoredItem_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  Proc [dbo].[usp_Save_Guild_StoredItem_Del_E]


@GuildID int,
@IDList varchar(7000) = '', -- 삭제시(리스트값)
@ChkID int = 1,
@Qry varchar(8000) = ''

AS

--------------------------------------------------------------------------------------------------------------------------------
SET NOCOUNT ON

DECLARE
@TmpQuery	varchar(7000)

SET @TmpQuery = 'INSERT INTO #TmpTb7(ItemUID) VALUES('
SET @TmpQuery = @TmpQuery + REPLACE( @IDList, ',', ') INSERT INTO #TmpTb7(ItemUID) VALUES(' )
SET @TmpQuery = @TmpQuery + ')'


CREATE TABLE #TmpTb7( ItemUID bigint  NULL )

EXEC (@TmpQuery)

IF( @ChkID = 1 )
BEGIN
	DELETE GuildStoredItems WHERE ItemUID IN (SELECT ItemUID FROM #TmpTb7) AND GuildID=@GuildID 
END
ELSE
BEGIN
	DELETE GuildStoredItems WHERE ItemUID IN (SELECT ItemUID FROM #TmpTb7)
END

IF(@@ERROR = 0)
BEGIN
	DROP TABLE #TmpTb7
	RETURN 1
END
ELSE
BEGIN
	DROP TABLE #TmpTb7
	RETURN -1
END

SET NOCOUNT OFF

--------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Guild_StoredItem_Mod_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   Proc [dbo].[usp_Save_Guild_StoredItem_Mod_E]

@GuildID int,
@ItemUID bigint,
@Slot tinyint,
@Quality smallint,
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Count tinyint,
@Craftname varchar(20)

AS

SET NOCOUNT ON

UPDATE GuildStoredItems
SET Slot=@Slot,Quality=@Quality,Gem1=@Gem1,Gem2=@Gem2,Gem3=@Gem3,Gem4=@Gem4,Gem5=@Gem5,Gem6=@Gem6, 
Craftname=@Craftname,[Count]=@Count
WHERE GuildID=@GuildID AND ItemUID=@ItemUID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN	
	RETURN -1
END

SET NOCOUNT OFF





GO
/****** Object:  StoredProcedure [dbo].[usp_Save_GuildChar_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Save_GuildChar_E]

@CharID int,
@GuildLevel tinyint

AS

SET NOCOUNT ON

DECLARE
@MasterUserID varchar(18),
@MasterName	varchar(30),
@GuildID	int

IF ( @GuildLevel = 1 )
BEGIN

	SELECT @MasterUserID=UserID, @MasterName=CharName FROM Chars WHERE CharID = @CharID AND Del = 0
	IF @@ROWCOUNT <> 0
	BEGIN
		SELECT @GuildID=GuildID FROM GuildChars WHERE CharID=@CharID AND Del=0
		IF @@ROWCOUNT <> 0
			UPDATE Guilds SET MasterUserID=@MasterUserID, MasterCharID=@CharID, MasterName=@MasterName WHERE GuildID = @GuildID
	END
END


UPDATE GuildChars SET GuildLevel=@GuildLevel WHERE CharID=@CharID AND Del=0

IF( @@ERROR = 0 AND @@ROWCOUNT = 1 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_GuildInfo_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE  Proc [dbo].[usp_Save_GuildInfo_E]

@GuildID 	int,
@GuildPoint	int,
@Etin		int,
@Remark	varchar(64),
@BuyHouse	tinyint,
@EtinReturnCnt int = 0,
@KeepEtin	int = 0

AS

SET NOCOUNT ON

DECLARE
@OldGuildPoint	int

SET @Remark = LTRIM(RTRIM(@Remark))

BEGIN TRAN

SELECT @OldGuildPoint = GuildPoint FROM Guilds WHERE GuildID=@GuildID
IF( @GuildPoint > @OldGuildPoint )
BEGIN
	UPDATE Guilds SET GuildPoint=@GuildPoint WHERE GuildID=@GuildID
	IF( @@ERROR <> 0 )
	BEGIN	
		ROLLBACK TRAN
		RETURN -1
	END
END

IF EXISTS ( SELECT GuildID FROM GuildDetails WHERE GuildID = @GuildID )
BEGIN
	UPDATE GuildDetails SET Etin=@Etin, Remark=@Remark, BuyHouse=@BuyHouse,EtinReturnCnt=@EtinReturnCnt, KeepEtin=@KeepEtin WHERE GuildID=@GuildID
END
ELSE
BEGIN
	INSERT INTO GuildDetails(GuildID, Etin, Remark, BuyHouse, EtinReturnCnt, KeepEtin) VALUES(@GuildID, @Etin, @Remark, @BuyHouse,@EtinReturnCnt, @KeepEtin )
END

IF( @@ERROR = 0 AND @@ROWCOUNT = 1 )
BEGIN
	COMMIT TRAN
	RETURN 1
END
ELSE
BEGIN
	ROLLBACK TRAN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_GuildInfo_E2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  Proc [dbo].[usp_Save_GuildInfo_E2]

@GuildID int,
@GuildPoint int,
@Etin int,
@Remark	varchar(64),
@BuyHouse tinyint,
@EtinReturnCnt int,
@KeepEtin int,
@Rank tinyint,
@UseHouse tinyint

AS

SET NOCOUNT ON

DECLARE @OldGuildPoint int

SET @Remark = LTRIM(RTRIM(REPLACE(@Remark, char(39), char(32))))

BEGIN TRAN

SELECT @OldGuildPoint = GuildPoint FROM Guilds WHERE GuildID = @GuildID

IF @GuildPoint <> @OldGuildPoint
BEGIN
	UPDATE Guilds SET GuildPoint = @GuildPoint WHERE GuildID = @GuildID

	IF @@ERROR <> 0
	BEGIN	
		ROLLBACK TRAN
		RETURN -1
	END
END

IF EXISTS (SELECT GuildID FROM GuildDetails WHERE GuildID = @GuildID)
BEGIN
	UPDATE GuildDetails 
	SET UseHouse = @UseHouse, BuyHouse = @BuyHouse, [Rank] = @Rank, Etin = @Etin, EtinReturnCnt = @EtinReturnCnt, KeepEtin = @KeepEtin, Remark = @Remark
	WHERE GuildID = @GuildID
END

ELSE
BEGIN
	INSERT INTO GuildDetails(GuildID, UseHouse, BuyHouse, [Rank], Etin, EtinReturnCnt, KeepEtin, Remark) 
	VALUES(@GuildID, @UseHouse, @BuyHouse, @Rank, @Etin, @EtinReturnCnt, @KeepEtin, @Remark)
END

IF @@ERROR = 0
BEGIN
	COMMIT TRAN
	RETURN 1
END

ELSE
BEGIN
	ROLLBACK TRAN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_GuildRemark_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Proc [dbo].[usp_Save_GuildRemark_E]

@GuildID int,
@Remark	varchar(64)

AS

SET NOCOUNT ON

IF EXISTS (SELECT GuildID FROM Guilds WHERE GuildID = @GuildID)
BEGIN
	UPDATE GuildDetails SET Remark = REPLACE(@Remark, char(39), char(32)) WHERE GuildID = @GuildID
END

ELSE
BEGIN
	INSERT INTO GuildDetails(GuildID, Remark) VALUES(@GuildID, REPLACE(@Remark, char(39), char(32)))
END

IF @@ERROR = 0 AND @@ROWCOUNT = 1
BEGIN
	RETURN 1
END

ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_Keep_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Save_Keep_E]

@KeepID int,
@OwnCountry tinyint,
@ResetTime int

AS

SET NOCOUNT ON

UPDATE Keeps SET OwnCountry=@OwnCountry,ResetTime=@ResetTime WHERE KeepID=@KeepID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_BuyPointItems_NCash]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  Proc [dbo].[usp_Save_User_BuyPointItems_NCash]

@UserUID int,
@CharID int,
@UsePoint int,
@ProductCode varchar(20),
@UseDate datetime

AS

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @UseType int
DECLARE @ReturnValue int

SET @UseType = 1 -- 掘衙

BEGIN DISTRIBUTED TRANSACTION


EXEC @ReturnValue = PS_UserData.dbo.usp_Update_UserPoint @UserUID, @UsePoint
IF ( @ReturnValue < 0 )
BEGIN
GOTO ERROR
END
-- 檣 離馬(Old, 夥煎 UPDATE僥 陳塒唳辦 醴憮纂陛 號檜 橾橫陴)
--UPDATE PS_UserData.dbo.Users_Master SET Point=Point-@UsePoint WHERE UserUID=@UserUID
--IF( @@ERROR<>0 OR @@ROWCOUNT=0)
--BEGIN
-- GOTO ERROR
--END

-- 檣 煎斜 晦煙
INSERT INTO PointLog(UseType,UserUID,CharID,UsePoint,ProductCode,UseDate)
VALUES(@UseType,@UserUID,@CharID,@UsePoint,@ProductCode,@UseDate)
IF( @@ERROR<>0)
BEGIN
GOTO ERROR
END

COMMIT TRAN
RETURN 1

ERROR:
ROLLBACK TRAN
RETURN -1


SET XACT_ABORT OFF
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_BuyPointItems2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[usp_Save_User_BuyPointItems2]

@UserUID int,
@CharID int,
@UsePoint int,
@ProductCode varchar(20),
@UseDate datetime

AS

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @UseType     int
DECLARE @Ret         int
DECLARE @RemainPoint int
DECLARE @OrderNumber int

SET @Ret = 0
SET @UseType = 1 -- 掘衙

BEGIN DISTRIBUTED TRANSACTION

EXEC @Ret = PS_UserData.dbo.usp_Update_UserPoint @UserUID, @UsePoint
IF( @Ret < 0 )
BEGIN
    GOTO ERROR
END

SET @RemainPoint = (SELECT Point FROM PS_UserData.dbo.Users_Master WHERE UserUID=@UserUID)
INSERT INTO PointLog(UserUID,CharID,UsePoint,ProductCode,TargetName,UseDate,UseType,RemainPoint,OrderNumber)
VALUES(@UserUID,@CharID,@UsePoint,@ProductCode,NULL,@UseDate,@UseType,@RemainPoint,@OrderNumber)

IF( @@ERROR<>0)
BEGIN
    GOTO ERROR
END

COMMIT TRAN
RETURN 1

ERROR:
ROLLBACK TRAN
RETURN -1

SET XACT_ABORT OFF
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_GiftPointItemNotify]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE Proc [dbo].[usp_Save_User_GiftPointItemNotify]

@UserUID int,
@ProductCode varchar(20),
@SendCharName varchar(30),
@RecvDate datetime

AS

SET NOCOUNT ON



-- 선물 로그 기록
INSERT INTO PointGiftNotify(UserUID,ProductCode,SendCharName,RecvDate)
VALUES(@UserUID,@ProductCode,@SendCharName,@RecvDate)



IF(@@ERROR = 0 AND @@ROWCOUNT = 1)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END



SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_GiftPointItems_NCash]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




/*==================================================
@author	lenasoft
@date	2006-09-22
@return	@Ret

	  0 = 성공
	  1 = 해당서버에 케릭터명이 존재하지 않음.
	  2 = 같은 개정임
	  3 = 아이템 보유수량 초과(포인트개정슬롯 꽉참)
	  4 = 슬롯부족(아이템을 추가할수 없음)
	  5 = 인서트 오류
	  6 = 상품테이블 데이타오류(해당 상품코드 존재하지 않음)
	  7 = 포인트 차감 실패.
	  8 = 로그기록 실패.
	 10= 포인트부족

@brief	유저에게 포인트아이템을 선물한다.
==================================================*/

CREATE Proc [dbo].[usp_Save_User_GiftPointItems_NCash]
@TargetUserID		int output,
@TargetCharName 	varchar(30),
@ProductCode 		varchar(20),

@BuyUserUID		int,
@BuyCharID		int,
@UsePoint 		int,
@UseDate 		datetime,
@BuyUserID		varchar(30)

AS

SET NOCOUNT ON
--SET XACT_ABORT ON

DECLARE @SlotCnt		int
DECLARE @SlotMax		int
DECLARE @SlotUse		int
DECLARE @I			int
DECLARE @J			int
DECLARE @StrItemID		varchar(20)
DECLARE @StrItemCount	varchar(20)
DECLARE @Query		nvarchar(1000)
DECLARE @ItemID		int
DECLARE @ItemCount		tinyint
DECLARE @Ret		int

-----------------------------------------------
--DECLARE @UserUID	int
DECLARE @UseType	int
--DECLARE @OrderNumber  	int
--DECLARE @RemainPoint  	int

SET @UseType = 2 --선물
SET @TargetUserID = 0
-----------------------------------------------

SET @Ret = 0
SET @SlotMax = 240


SELECT @TargetUserID = UserUID FROM Chars WHERE CharName = @TargetCharName AND Del = 0
IF( @TargetUserID = 0 OR @TargetUserID IS NULL )
BEGIN
	-- 해당서버에 케릭터명이 존재하지 않음.
	SET @Ret = 1
	RETURN @Ret
END

IF( @TargetUserID = @BuyUserUID )
BEGIN
	-- 같은 개정임
	SET @Ret = 2
	RETURN @Ret
END


BEGIN TRANSACTION


CREATE TABLE #SlotList( SlotNum int NOT NULL )
CREATE TABLE #InsertSlotList( SlotNum tinyint NOT NULL, ItemID int NOT NULL, ItemCount tinyint NOT NULL)

INSERT INTO #SlotList SELECT Slot FROM UserStoredPointItems WHERE UserUID=@TargetUserID ORDER BY Slot

SET @SlotCnt = ( SELECT ISNULL(COUNT(*),0) FROM #SlotList )

IF( @SlotCnt >= @SlotMax )
BEGIN
	-- 아이템 보유수량 초과(포인트개정슬롯 꽉참)
	SET @Ret = 3
	GOTO ERROR_RETURN
END

SET @I = 1

WHILE( @I <= 24 )
BEGIN
	SET @StrItemID = 'ItemID' + CAST( @I AS varchar(5) )
	SET @StrItemCount = 'ItemCount' + CAST( @I AS varchar(5) )

	SET @Query = 'SELECT @ItemID='+@StrItemID+', @ItemCount='+@StrItemCount+' FROM PS_DEFINEDB.PS_GameDefs.dbo.ProductList WHERE ProductCode=''' +@ProductCode+''''
	EXEC sp_executesql @Query, N'@ItemID int OUTPUT, @ItemCount tinyint OUTPUT', @ItemID OUTPUT, @ItemCount OUTPUT

	IF( (@ItemID IS NOT NULL) AND (@ItemCount IS NOT NULL) AND (@ItemID <> 0) ) 
	BEGIN
		SET @J = 0

		WHILE( @J < @SlotMax )
		BEGIN
			SET @SlotUse = ( SELECT ISNULL(COUNT(*),0) FROM #SlotList WHERE SlotNum=@J )
			IF( @SlotUse = 0 )
			BEGIN
				INSERT INTO UserStoredPointItems(UserUID,Slot,ItemID,ItemCount) VALUES(@TargetUserID,@J,@ItemID,@ItemCount)
				IF( @@ERROR = 0 )
				BEGIN
					INSERT INTO #SlotList(SlotNum) VALUES(@J)
					INSERT INTO #InsertSlotList(SlotNum, ItemID, ItemCount ) VALUES(@J, @ItemID, @ItemCount)
					BREAK
				END
				ELSE
				BEGIN
					-- 인서트 오류
					SET @Ret = 5
					GOTO ERROR_RETURN
				END
			END
			
			SET @J = @J + 1
		END

		IF( @J >= @SlotMax )
		BEGIN
			-- 슬롯부족(아이템을 추가할수 없음)
			SET @Ret = 4
			GOTO ERROR_RETURN
		END
	END
	ELSE IF( @I = 1 )
	BEGIN
		-- 상품테이블 데이타오류(해당 상품코드 존재하지 않음)
		SET @Ret = 6
		GOTO ERROR_RETURN
	END

	SET @I = @I + 1
END
		
-- Insert Log
INSERT INTO PointLog(UseType,UserUID,CharID,UsePoint,ProductCode,UseDate,TargetName)
VALUES(@UseType,@BuyUserUID,@BuyCharID,@UsePoint,@ProductCode,@UseDate,@TargetCharName)
IF( @@ERROR<>0 )
BEGIN
	SET @Ret = 8
	GOTO ERROR_RETURN
END

-- Select
SELECT SlotNum, ItemID, ItemCount FROM #InsertSlotList

ERROR_RETURN:

DROP TABLE #SlotList
DROP TABLE #InsertSlotList

IF( @@ERROR = 0 AND @Ret = 0 )
BEGIN
	COMMIT TRAN 
	RETURN 0
END
ELSE
BEGIN
	ROLLBACK TRAN
	RETURN @Ret
END

SET NOCOUNT OFF
--SET XACT_ABORT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_GiftPointItems2]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
 

CREATE Proc [dbo].[usp_Save_User_GiftPointItems2]
@TargetUserID   int OUTPUT,
@TargetCharName varchar(30),
@ProductCode    varchar(20),
@BuyUserUID     int,
@BuyCharID      int,
@UsePoint       int,
@UseDate        datetime
--@BuyUserID    varchar(30)

AS

SET NOCOUNT ON
--SET XACT_ABORT ON

DECLARE @SlotCnt      int
DECLARE @SlotMax      int
DECLARE @SlotUse      int
DECLARE @I            int
DECLARE @J            int
DECLARE @StrItemID    varchar(20)
DECLARE @StrItemCount varchar(20)
DECLARE @Query        nvarchar(1000)
DECLARE @ItemID       int
DECLARE @ItemCount    tinyint
DECLARE @Ret          int

-----------------------------------------------
--DECLARE @UserUID    int
DECLARE @UseType      int
DECLARE @OrderNumber  int
DECLARE @RemainPoint  int

SET @UseType = 2 --선물
SET @TargetUserID = 0
-----------------------------------------------

SET @Ret = 0
SET @SlotMax = 240
SELECT @TargetUserID = UserUID FROM Chars WHERE CharName=@TargetCharName AND Del=0
IF( @TargetUserID = 0 OR @TargetUserID IS NULL )
BEGIN
    -- 해당서버에 케릭터명이 존재하지 않음.
    SET @Ret = 1
    RETURN @Ret
END

IF( @TargetUserID = @BuyUserUID )
BEGIN
    -- 같은 개정임
    SET @Ret = 2
    RETURN @Ret
END

BEGIN TRANSACTION

CREATE TABLE #SlotList( SlotNum int NOT NULL )
CREATE TABLE #InsertSlotList( SlotNum tinyint NOT NULL, ItemID int NOT NULL, ItemCount tinyint NOT NULL)

INSERT INTO #SlotList SELECT Slot FROM UserStoredPointItems WHERE UserUID=@TargetUserID ORDER BY Slot

SET @SlotCnt = ( SELECT ISNULL(COUNT(*),0) FROM #SlotList )

IF( @SlotCnt >= @SlotMax )
BEGIN
    -- 아이템 보유수량 초과(포인트개정슬롯 꽉참)
    SET @Ret = 3
    GOTO ERROR_RETURN
END

SET @I = 1

WHILE( @I <= 24 )
BEGIN
    SET @StrItemID = 'ItemID' + CAST( @I AS varchar(5) )
    SET @StrItemCount = 'ItemCount' + CAST( @I AS varchar(5) )

    SET @Query = 'SELECT @ItemID='+@StrItemID+', @ItemCount='+@StrItemCount+' FROM PS_GameDefs.dbo.ProductList WHERE ProductCode=''' +@ProductCode+''''
    EXEC sp_executesql @Query, N'@ItemID int OUTPUT, @ItemCount tinyint OUTPUT', @ItemID OUTPUT, @ItemCount OUTPUT

    IF( (@ItemID IS NOT NULL) AND (@ItemCount IS NOT NULL) AND (@ItemID <> 0) ) 
    BEGIN
        SET @J = 0

        WHILE( @J < @SlotMax )
        BEGIN
            SET @SlotUse = ( SELECT ISNULL(COUNT(*),0) FROM #SlotList WHERE SlotNum=@J )
            IF( @SlotUse = 0 )
            BEGIN
                INSERT INTO UserStoredPointItems(UserUID,Slot,ItemID,ItemCount) VALUES(@TargetUserID,@J,@ItemID,@ItemCount)
                IF( @@ERROR = 0 )
                BEGIN
                    INSERT INTO #SlotList(SlotNum) VALUES(@J)
                    INSERT INTO #InsertSlotList(SlotNum, ItemID, ItemCount ) VALUES(@J, @ItemID, @ItemCount)
                    BREAK
                END
                ELSE
                BEGIN
                    -- 인서트 오류
                    SET @Ret = 5
                    GOTO ERROR_RETURN
                END
            END
            
            SET @J = @J + 1
        END

        IF( @J >= @SlotMax )
        BEGIN
            -- 슬롯부족(아이템을 추가할수 없음)
            SET @Ret = 4
            GOTO ERROR_RETURN
        END
    END
    ELSE IF( @I = 1 )
    BEGIN
        -- 상품테이블 데이타오류(해당 상품코드 존재하지 않음)
        SET @Ret = 6
        GOTO ERROR_RETURN
    END

    SET @I = @I + 1
END

EXEC @Ret = PS_UserData.dbo.usp_Update_UserPoint @BuyUserUID, @UsePoint
IF( @Ret < 0 )
BEGIN
    SET @Ret = 7
    GOTO ERROR_RETURN
END

SET @RemainPoint = (SELECT Point FROM PS_UserData.dbo.Users_Master WHERE UserUID=@BuyUserUID)
INSERT INTO PointLog(UseType,UserUID,CharID,UsePoint,ProductCode,UseDate,TargetName,RemainPoint,OrderNumber)
VALUES(@UseType,@BuyUserUID,@BuyCharID,@UsePoint,@ProductCode,@UseDate,@TargetCharName,@RemainPoint,@OrderNumber)

IF( @@ERROR<>0 )
BEGIN
    SET @Ret = 8
    GOTO ERROR_RETURN
END

-- Select
SELECT SlotNum, ItemID, ItemCount FROM #InsertSlotList

ERROR_RETURN:

DROP TABLE #SlotList
DROP TABLE #InsertSlotList

IF( @@ERROR = 0 AND @Ret = 0 )
BEGIN
    COMMIT TRAN 
    RETURN 0
END
ELSE
BEGIN
	INSERT INTO PointErrorLog(UserUID,CharID,ProductCode,Ret,ErrDate)
    VALUES(@BuyUserUID,@BuyCharID,@ProductCode,@Ret,@UseDate)
    ROLLBACK TRAN
    RETURN @Ret
END

SET NOCOUNT OFF
--SET XACT_ABORT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_NCash]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE  Proc [dbo].[usp_Save_User_NCash]
@BuyUserUID		int,
@TargetUserID		int,
@ProductCode 		varchar(20)

AS

SET NOCOUNT ON

DECLARE @Ret		int
DECLARE @OrderNumber  	int
DECLARE @RemainPoint  	int

SET @Ret = 0
/*========================================
아이템 구매
구매일 경우 구매 유저 UID 와 받는 유저 UID를 똑같이 입력하면 됩니다.
procRequestOrderProductByGame

구매유저 UID       @buyClientUserNumber               BIGINT
받는유저 UID       @receiveClientUserNumber           BIGINT
아이템코드         @itemCode                          VARCHAR(50)
결과 코드          @resultCode                        SMALLINT           	OUTPUT
결제 후 잔액       @cashBalanceAfterOrder             INT                      	OUTPUT
구매번호	   @orderNumber			      INT			OUTPUT

resultCode
0            성공
1            잔액부족
2            해당 사용자 존재하지 않음
3            해당 아이템이 존재하지 않음
5            DB오류
6            기타오류
=========================================*/

EXEC  [PS_NCASH].[Billcrux30].dbo.procRequestOrderProductByGame @BuyUserUID,@TargetUserID,@ProductCode,@Ret OUTPUT, @RemainPoint OUTPUT, @OrderNumber OUTPUT
IF( @@ERROR <> 0 )
BEGIN
	INSERT INTO PointErrorLog( UserUID, CharID, ProductCode, Ret) 	VALUES( @BuyUserUID, NULL, @ProductCode, 100 )
	SET @Ret = 7
	RETURN @Ret
END

IF ( @Ret <> 0 )
BEGIN
	INSERT INTO PointErrorLog( UserUID, CharID, ProductCode, Ret) 	VALUES( @BuyUserUID, NULL, @ProductCode, @Ret )
END

SET @Ret = CASE @Ret
		WHEN 0 THEN 0 
		WHEN 1 THEN 10 
		WHEN 2 THEN 1
		WHEN 3 THEN 6
		ELSE 7
END


RETURN @Ret

SET NOCOUNT OFF
--SET XACT_ABORT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_StoredItem_Add_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Save_User_StoredItem_Add_E    스크립트 날짜: 2006-04-11 오후 10:58:39 ******/


CREATE  Proc [dbo].[usp_Save_User_StoredItem_Add_E]

@ServerID tinyint,
@UserUID int,
@ItemUID bigint,
@Slot tinyint,
@ItemID int,
@Type tinyint,
@TypeID tinyint,
@Quality smallint,
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Craftname varchar(20) = '', 
@Count tinyint,
@Maketime datetime,
@Maketype char(1)

AS

--SET NOCOUNT ON

INSERT INTO UserStoredItems
(ServerID, UserUID, Slot, ItemID, Type, TypeID, ItemUID, quality, gem1, gem2, gem3, gem4, 
gem5, gem6, craftname, [count], maketime, maketype)
VALUES(@ServerID, @UserUID, @Slot, @ItemID, @Type, @TypeID, @ItemUID, @Quality, @Gem1, @Gem2, @Gem3, @Gem4, 
@Gem5, @Gem6, @Craftname, @Count, @Maketime, @Maketype)

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN	
	RETURN -1
END

--SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_StoredItem_Del_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** 개체: 저장 프로시저 dbo.usp_Save_User_StoredItem_Del_E    스크립트 날짜: 2006-04-11 오후 10:59:04 ******/


CREATE  Proc [dbo].[usp_Save_User_StoredItem_Del_E]

@ServerID tinyint,
@UserUID int,
@IDList varchar(7000) = '', -- 삭제시(리스트값)
@ChkID int = 1,
@Qry varchar(8000) = ''

AS

--------------------------------------------------------------------------------------------------------------------------------
SET NOCOUNT ON

DECLARE
@TmpQuery	varchar(7000)

SET @TmpQuery = 'INSERT INTO #TmpTb1(ItemUID) VALUES('
SET @TmpQuery = @TmpQuery + REPLACE( @IDList, ',', ') INSERT INTO #TmpTb1(ItemUID) VALUES(' )
SET @TmpQuery = @TmpQuery + ')'


CREATE TABLE #TmpTb1( ItemUID bigint  NULL )

EXEC (@TmpQuery)

IF( @ChkID = 1 )
BEGIN
	DELETE UserStoredItems WHERE ItemUID IN (SELECT ItemUID FROM #TmpTb1) AND UserUID=@UserUID AND ServerID=@ServerID
END
ELSE
BEGIN
	DELETE UserStoredItems WHERE ItemUID IN (SELECT ItemUID FROM #TmpTb1)
END

IF(@@ERROR = 0)
BEGIN
	DROP TABLE #TmpTb1
	RETURN 1
END
ELSE
BEGIN
	DROP TABLE #TmpTb1
	RETURN -1
END

SET NOCOUNT OFF

--------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_StoredItem_Mod_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 개체: 저장 프로시저 dbo.usp_Save_User_StoredItem_Mod_E    스크립트 날짜: 2006-04-11 오후 10:59:25 ******/


CREATE   Proc [dbo].[usp_Save_User_StoredItem_Mod_E]

@ServerID tinyint,
@UserUID int,
@ItemUID bigint,
@Slot tinyint,
@Quality smallint,
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Count tinyint,
@Craftname varchar(20)

AS

--SET NOCOUNT ON

UPDATE UserStoredItems
SET Slot=@Slot,Quality=@Quality,Gem1=@Gem1,Gem2=@Gem2,Gem3=@Gem3,Gem4=@Gem4,Gem5=@Gem5,Gem6=@Gem6, 
Craftname=@Craftname,[Count]=@Count
WHERE ServerID=@ServerID AND UserUID=@UserUID AND ItemUID=@ItemUID

IF(@@ERROR = 0)
BEGIN
	RETURN 1
END
ELSE
BEGIN	
	RETURN -1
END

--SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_StoredMoney_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Save_User_StoredMoney_E]

@ServerID tinyint,
@UserUID int,
@Money bigint

AS

SET NOCOUNT ON

DECLARE @Cnt int

SET @Cnt = (SELECT COUNT(*) FROM UserStoredMoney WHERE ServerID=@ServerID AND UserUID=@UserUID)
IF(@Cnt = 0)
BEGIN
	INSERT UserStoredMoney(ServerID,UserUID,[Money]) VALUES(@ServerID,@UserUID,@Money)
END
ELSE
BEGIN
	UPDATE UserStoredMoney SET [Money]=@Money,LastAccessTime=GETDATE() WHERE ServerID=@ServerID AND UserUID=@UserUID
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Save_User_StoredPointItems]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/*==================================================
@author	lenasoft
@date	2006-09-25
@return	

@brief	유저의 포인트아이템을 저장한다..
==================================================*/
CREATE    Proc [dbo].[usp_Save_User_StoredPointItems]

@UserUID int,
@BankSlot tinyint,

@CharID int,
@ItemUID bigint,
@Bag tinyint,
@Slot tinyint,
@ItemID int,
@Type tinyint,
@TypeID tinyint,
@Quality smallint,	--int
@Gem1 tinyint,
@Gem2 tinyint,
@Gem3 tinyint,
@Gem4 tinyint,
@Gem5 tinyint,
@Gem6 tinyint,
@Craftname varchar(20) = '', 
@Count tinyint,
@Maketime datetime,
@Maketype varchar(1)	--char(1)

AS

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @ProductCode varchar(20)
DECLARE @OrderNumber int
DECLARE @VerifyCode bigint
DECLARE @BuyDate datetime

IF(@Quality >= 5000)
BEGIN
	SET @Quality=0
END

BEGIN DISTRIBUTED TRANSACTION

-- 인벤토리 추가
INSERT INTO CharItems(CharID,Bag,Slot,ItemID,Type,TypeID,ItemUID,Quality,Gem1,Gem2,Gem3,Gem4, 
Gem5,Gem6,CraftName,[Count],Maketime,Maketype)
VALUES(@CharID,@Bag,@Slot,@ItemID,@Type,@TypeID,@ItemUID,@Quality,@Gem1,@Gem2,@Gem3,@Gem4, 
@Gem5,@Gem6,@Craftname,@Count,@Maketime,@Maketype)

-- 상품수령로그 기록
-- None

-- 저장된포인트아이템 삭제
DELETE FROM UserStoredPointItems WHERE UserUID=@UserUID AND Slot=@BankSlot

IF( @@ERROR=0 AND @@ROWCOUNT=1)
BEGIN
	COMMIT TRAN
	RETURN 1
END
ELSE
BEGIN
	ROLLBACK TRAN
	RETURN -1
END

SET XACT_ABORT OFF
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Save_WorldInfo_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Save_WorldInfo_E]

@LastWorldTime int

AS

SET NOCOUNT ON

DECLARE @Cnt int

SET @Cnt = (SELECT ISNULL(COUNT(*), 0) FROM WorldInfo)

IF(@Cnt = 1)
BEGIN
	UPDATE WorldInfo SET LastWorldTime=@LastWorldTime
END
ELSE
BEGIN
	INSERT INTO WorldInfo(LastWorldTime,GodBless_Light,GodBless_Dark) VALUES(@LastWorldTime,0,0)
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Update_Char_Rename]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*==================================================
@author	lenasoft
@date	2006-10-26
@return	@Ret
	 -1 	= 중복케릭명 있음.
	   1 	= 성공
	-2 	= 실패

@brief	GMTool상에서 케릭명 변경.
==================================================*/
CREATE  Proc [dbo].[usp_Update_Char_Rename]

@ServerID tinyint,
@CharID int,
@OldCharName nvarchar(30),
@NewCharName nvarchar(30),
@Ret int OUTPUT
AS

SET NOCOUNT ON
--SET XACT_ABORT ON

--DECLARE @NameCnt int

SET @OldCharName = LTRIM(RTRIM(@OldCharName))
SET @NewCharName = LTRIM(RTRIM(@NewCharName))

SET @Ret = 0

IF EXISTS ( SELECT CharID FROM Chars WHERE CharName=@NewCharName AND Del=0)
BEGIN
	SET @Ret = -1
	RETURN -1
END

BEGIN TRANSACTION

UPDATE Chars SET CharName=@NewCharName,OldCharName=@OldCharName WHERE CharID=@CharID-- AND Del=0
IF @@ERROR <> 0
BEGIN
	GOTO ERROR_ROLLBACK
END
UPDATE Guilds SET MasterName=@NewCharName WHERE MasterCharID=@CharID
IF @@ERROR <> 0
BEGIN
	GOTO ERROR_ROLLBACK
END
UPDATE FriendChars SET FriendName=@NewCharName WHERE FriendID=@CharID
IF @@ERROR <> 0
BEGIN
	GOTO ERROR_ROLLBACK
END
UPDATE BanChars SET BanName=@NewCharName WHERE BanID=@CharID
IF @@ERROR <> 0
BEGIN
	GOTO ERROR_ROLLBACK
END

INSERT INTO CharRenameLog( ServerID, CharID, CharName) VALUES(@ServerID, @CharID, @NewCharName )
IF @@ERROR <> 0
BEGIN
	GOTO ERROR_ROLLBACK
END

COMMIT TRANSACTION
SET @Ret = 1
RETURN 1


ERROR_ROLLBACK:
ROLLBACK TRANSACTION
SET @Ret = -2
RETURN -2


--SET XACT_ABORT OFF
SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Update_UserPoint]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE Proc [dbo].[usp_Update_UserPoint]
@UserUID  int,
@UsePoint int

AS

SET NOCOUNT ON

DECLARE 
@UserPoint int

SELECT @UserPoint= ISNULL(Point,0) FROM Users_Master WHERE UserUID=@UserUID
IF( @@ROWCOUNT=0 OR @UserPoint-@UsePoint < 0 )
BEGIN
    UPDATE Users_Master SET Point=0 WHERE UserUID=@UserUID
    RETURN -1
END

UPDATE Users_Master SET Point=ISNULL(Point,0)-@UsePoint WHERE UserUID=@UserUID
IF( @@ERROR<>0 )
BEGIN
    RETURN -1
END

RETURN 0

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Use_Event1_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[usp_Use_Event1_E]

@CharID int,
@GetPoint int

AS

SET NOCOUNT ON

DECLARE @Cnt int
DECLARE @UseCount int
DECLARE @StatPoint smallint
DECLARE @Str smallint
DECLARE @Dex smallint
DECLARE @Rec smallint
DECLARE @Int smallint
DECLARE @Luc smallint
DECLARE @Wis smallint

SELECT @StatPoint=StatPoint, @Str=Str, @Dex=Dex, @Rec=Rec, @Int=[Int], @Luc=Luc, @Wis=Wis FROM Chars WHERE CharID=@CharID

SELECT @UseCount=Event1 FROM CharEvents WHERE CharID=@CharID

IF( @UseCount IS NULL )
BEGIN
	SET @UseCount = 1
	INSERT CharEvents(CharID, Event1) VALUES (@CharID, @UseCount)
END
ELSE
BEGIN
	SET @UseCount = @UseCount + 1
	UPDATE CharEvents SET Event1=@UseCount WHERE CharID=@CharID
END

INSERT EventLog_CharStat(CharID, UseCount, GetPoint, StatPoint, Str, Dex, Rec, [Int], Luc, Wis, UseDate) 
VALUES (@CharID, @UseCount, @GetPoint, @StatPoint, @Str, @Dex, @Rec, @Int, @Luc, @Wis, GETDATE())

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[usp_Use_Event2_E]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[usp_Use_Event2_E]

@CharID int,
@GetPoint int

AS

SET NOCOUNT ON

DECLARE @Cnt int
DECLARE @UseCount int
DECLARE @SkillPoint smallint

SELECT @SkillPoint=SkillPoint FROM Chars WHERE CharID=@CharID

SELECT @UseCount=Event2 FROM CharEvents WHERE CharID=@CharID

IF( @UseCount IS NULL )
BEGIN
	SET @UseCount = 1
	INSERT CharEvents(CharID, Event2) VALUES (@CharID, @UseCount)
END
ELSE
BEGIN
	SET @UseCount = @UseCount + 1
	UPDATE CharEvents SET Event2=@UseCount WHERE CharID=@CharID
END

INSERT EventLog_CharSkill1(CharID, UseCount, GetPoint, SkillPoint, UseDate) 
VALUES (@CharID, @UseCount, @GetPoint, @SkillPoint, GETDATE())

INSERT INTO EventLog_CharSkill2(CharID, UseCount, SkillID, SkillLevel, Number, CreateTime)
SELECT CharID, @UseCount, SkillID, SkillLevel, Number, CreateTime FROM CharSkills WHERE CharID=@CharID AND Del=0

IF( @@ERROR = 0 )
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN -1
END

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[uxp_BackupFull]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[uxp_BackupFull]

@DBNames varchar(300),
@Dest varchar(300), -- 꼭 '\' 까지
@ServerName varchar(100), -- 서버 이름(서버종류 + 숫자)
@ServerFamily varchar(100), -- 서버 종류
@WithLogs bit = 1, -- 로그까지 같이 백업(기본 옵션 - 시스템 DB시 필요없음)
@CopyUNC bit = 0, -- 만약에 UNC 경로로 복사할때(경로 및 기타 변수는 걍 백업 프로시저에 끼워넣자~ 바뀔때마다 바꾸면 되지 뭐..)
@MailNotice bit = 0, -- 메일로 알림(이것도)
@System bit = 0 -- System Database(master, msdb) 백업시 폴더에 _Sys 옵션

AS

DECLARE @GTemp varchar(1000)

DECLARE @i1 int

DECLARE @Date varchar(8) -- 날짜
DECLARE @YYYY varchar(4)
DECLARE @MM varchar(2)
DECLARE @DD varchar(2)
DECLARE @HH varchar(2)

DECLARE @Qry varchar(7000)

DECLARE @Qt char(1)
DECLARE @Temp varchar(30)
DECLARE @Dest2 varchar(300) -- 백업폴더 + 된거

-- 파일 이름

DECLARE @FileName_Log1 varchar(1000)
DECLARE @FileName_Log2 varchar(1000)
DECLARE @FileName_Full varchar(1000)

DECLARE @Cmd varchar(1000)

DECLARE @FromAddr varchar(100)
DECLARE @ToAddr varchar(100)
DECLARE @Subject varchar(100)
DECLARE @TextBody varchar(7000)

DECLARE @R int

-- Quot

SET @Qt = ''''

-- 날짜 셋팅

SET @YYYY = DATEPART ( yyyy , GETDATE() )

SET @MM = DATEPART ( mm , GETDATE() )
IF ( LEN (@MM) = 1 )
BEGIN
	SET @MM = '0' + @MM
END

SET @DD = DATEPART ( dd , GETDATE() )
IF ( LEN (@DD) = 1 )
BEGIN
	SET @DD = '0' + @DD
END

SET @HH = DATEPART ( hh , GETDATE() )
IF ( LEN (@HH) = 1 )
BEGIN
	SET @HH = '0' + @HH
END

SET @Date = @YYYY + @MM + @DD

-- 백업 경로 설정

PRINT '백업경로설정'

SET @Dest = RTRIM ( LTRIM ( @Dest ) )

IF ( CHARINDEX ( '\', @Dest, LEN ( @Dest ) ) <> LEN ( @Dest ) ) -- '\' 없을때
BEGIN
	SET @Dest = @Dest + '\'
END

SET @Dest = @Dest + @ServerFamily + '\' + @ServerName + '\' + @YYYY + @MM + '\' + @YYYY + @MM + @DD

-- 시스템 데이터베이스일 경우

IF(@System = 1)
BEGIN
	SET @Dest = @Dest + '_Sys'
END


-- 백업 폴더 생성

SET @GTemp = 'MD ' + @Dest

EXEC master.dbo.xp_cmdshell @GTemp, no_output

WHILE ( LEN ( @DBNames ) > 2 )
BEGIN

-- ',' 하나라도 있는지 확인

IF ( CHARINDEX ( ',', @DBNames ) > 0)
BEGIN

	IF ( SUBSTRING ( @DBNames, 1 , 1 ) = ',' )
	BEGIN
		SET @DBNames = SUBSTRING ( @DBNames , 2 , 298 )
	END

	SET @i1 = CHARINDEX ( ',' , @DBNames )
	SET @Temp = SUBSTRING ( @DBNames , 1 , @i1 - 1 )
	SET @DBNames = REPLACE ( @DBNames , @Temp , '' )

	END
	ELSE
	BEGIN

		SET @Temp = @DBNames
		SET @DBNames = ''

	END


	-- 파일 이름 다 결정하고 들어갈께요

	SET @FileName_Log1 = @ServerName + '__' + @Temp + '_Log1_BAK_' + @Date + '_' + @HH
	SET @FileName_Log2 = @ServerName + '__' + @Temp + '_Log2_BAK_' + @Date + '_' + @HH
	SET @FileName_Full = @ServerName + '__' + @Temp + '_Full_BAK_' + @Date + '_' + @HH

	SET @Qry = ''

	IF(@WithLogs = 1)
	BEGIN

		SET @Qry = 'BACKUP LOG [' + @Temp + '] TO DISK = ' + @Qt + @Dest + '\' + @FileName_Log1 + @Qt + ' WITH INIT ;'
		SET @Qry = @Qry + 'BACKUP DATABASE [PS_GameData ] TO DISK = ' + @Qt + @Dest + '\' + @FileName_Full + @Qt + ';'
		SET @Qry = @Qry + 'BACKUP DATABASE [' + @Temp + '] TO DISK = ' + @Qt + @Dest + '\' + @FileName_Full + @Qt + ';'
		SET @Qry = @Qry + 'BACKUP LOG [' + @Temp + '] TO DISK = ' + @Qt + @Dest + '\' + @FileName_Log2 + @Qt + ' WITH INIT ;'

	END
	ELSE
	BEGIN
		SET @Qry = 'BACKUP DATABASE [PS_GameData ] TO DISK = ' + @Qt + @Dest + '\' + @FileName_Full + @Qt + ';'
		SET @Qry = 'BACKUP DATABASE [' + @Temp + '] TO DISK = ' + @Qt + @Dest + '\' + @FileName_Full + @Qt + ';'
		SELECT @Qry

	END

	EXEC (@Qry)

	IF(@CopyUNC = 1)
	BEGIN

		
		DECLARE @RemoteTarget varchar(1000)		
		SET @RemoteTarget = @ServerFamily + '\' + @ServerName + '\' + @YYYY + @MM + '\' + @YYYY + @MM + @DD

		IF(@System = 1)
		BEGIN
			SET @RemoteTarget = @RemoteTarget + '_Sys'
		END

		SET @RemoteTarget = @RemoteTarget + '\'

		EXEC @R = master.dbo.xp_cmdshell 'Dir x:'
		
		IF(@R = 0)
		BEGIN

			SET @Cmd = 'cmd /c xcopy ' + @Dest + '\' + @FileName_Log1 + ' X:\' + @RemoteTarget 

			EXEC master.dbo.xp_cmdshell @Cmd

			SET @Cmd = 'cmd /c xcopy ' + @Dest + '\' + @FileName_Full + ' X:\' + @RemoteTarget

			EXEC master.dbo.xp_cmdshell @Cmd

			SET @Cmd = 'cmd /c xcopy ' + @Dest + '\' + @FileName_Log2 + ' X:\' + @RemoteTarget	  

			EXEC master.dbo.xp_cmdshell @Cmd

		END

	END

	IF(@MailNotice = 1)
	BEGIN

		DECLARE @NowTime varchar(50)
		SET @NowTime = CONVERT(varchar(50), getdate(), 120)


		SET @FromAddr = 'dba@sonov.com'
		SET @ToAddr = 'sys001@sonov.com'
		SET @Subject = '[백업자동알림] ' + @NowTime + ' 에 일어난 [' + @ServerName + '] 서버 백업 작업 결과입니다.'
		SET @TextBody = '[백업자동알림] ' + @NowTime + ' 에 일어난 [' + @ServerName + '] 서버 백업 작업 결과입니다.' + Char(13) + Char(13)  
		SET @TextBody = @TextBody + @FileName_Log1 + ' 파일이 백업됨 ' + Char(13) + Char(13)  
		SET @TextBody = @TextBody + @FileName_Full + ' 파일이 백업됨 ' + Char(13) + Char(13)  
		SET @TextBody = @TextBody + @FileName_Log2 + ' 파일이 백업됨 ' + Char(13) + Char(13)  

		IF(@R = 0)
		BEGIN
			SET	@TextBody = @TextBody + ' 또한 네트워크 경로 \\10.10.10.243\dbbackup\' + @RemoteTarget + ' 로 파일이 복사 되었습니다.'
		END
		ELSE
		BEGIN
			SET	@TextBody = @TextBody + ' 네트워크 경로 \\10.10.10.243\dbbackup\' + @RemoteTarget + ' 로의 파일 복사 작업이 실패했습니다.'
			SET @ToAddr = @ToAddr + ''
		END		

		EXEC master.dbo.uxp_Send_CDOSysMail @From = @FromAddr, @To = @ToAddr, @Subject = @Subject, @Body = @TextBody

	END

END


GO
/****** Object:  StoredProcedure [dbo].[uxp_BackupLog]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[uxp_BackupLog]

@DBNames varchar(300),
@Dest varchar(300), -- 꼭 '\' 까지
@ServerName varchar(100), -- 서버 이름(서버종류 + 숫자)
@ServerFamily varchar(100), -- 서버 종류
@CopyUNC bit = 0, -- 만약에 UNC 경로로 복사할때(경로 및 기타 변수는 걍 백업 프로시저에 끼워넣자~ 바뀔때마다 바꾸면 되지 뭐..)
@MailNotice bit = 0, -- 메일로 알림(이것도)
@FullBackupTime varchar(10)  -- 풀백업이 이루어지는 시간, HH형식이며 , 로 구분

AS

DECLARE @Date varchar(8) -- 날짜
DECLARE @YYYY varchar(4)
DECLARE @MM varchar(2)
DECLARE @DD varchar(2)
DECLARE @HH varchar(2)

DECLARE @Qry varchar(1000)

DECLARE @i1 int

DECLARE @Qt char(1)
DECLARE @Temp varchar(30)
DECLARE @Dest2 varchar(300) -- 백업폴더 + 된거



-- 파일 이름

DECLARE @GTemp varchar(1000)

DECLARE @FileName varchar(1000)
DECLARE @Cmd varchar(1000)

DECLARE @FromAddr varchar(100)
DECLARE @ToAddr varchar(100)
DECLARE @Subject varchar(100)
DECLARE @TextBody varchar(7000)

DECLARE @R int

-- Quot

SET @Qt = ''''

-- 날짜 셋팅

SET @Date = GETDATE()

SET @YYYY = DATEPART ( yyyy , GETDATE() )

SET @MM = DATEPART ( mm , GETDATE() )
IF ( LEN (@MM) = 1 )
BEGIN
	SET @MM = '0' + @MM
END

SET @DD = DATEPART ( dd , GETDATE() )
IF ( LEN (@DD) = 1 )
BEGIN
	SET @DD = '0' + @DD
END

SET @HH = DATEPART ( hh , GETDATE() )
IF ( LEN (@HH) = 1 )
BEGIN
	SET @HH = '0' + @HH
END

SET @Date = @YYYY + @MM + @DD

-- 백업 경로 설정

SET @Dest = RTRIM ( LTRIM ( @Dest ) )

IF ( CHARINDEX ( '\', @Dest, LEN ( @Dest ) ) <> LEN ( @Dest ) ) -- '\' 없을때
BEGIN
	SET @Dest = @Dest + '\'
END

SET @Dest = @Dest + @ServerFamily + '\' + @ServerName + '\' + @YYYY + @MM + '\' + @YYYY + @MM + @DD

-- 백업 폴더 생성

SET @GTemp = 'MD ' + @Dest

EXEC master.dbo.xp_cmdshell @GTemp, no_output

IF( CHARINDEX ( @HH , @FullBackupTime) = 0 ) -- 풀백업이랑 겹치지 않는 시간에..
BEGIN

	-- ',' 하나라도 있는지 확인

	IF ( CHARINDEX ( ',', @DBNames ) > 0)
	BEGIN

		IF ( SUBSTRING ( @DBNames, 1 , 1 ) = ',' )
		BEGIN
			SET @DBNames = SUBSTRING ( @DBNames , 2 , 298 )
		END

		SET @i1 = CHARINDEX ( ',' , @DBNames )
		SET @Temp = SUBSTRING ( @DBNames , 1 , @i1 - 1 )
		SET @DBNames = REPLACE ( @DBNames , @Temp , '' )

	END
	ELSE
	BEGIN

		SET @Temp = @DBNames
		SET @DBNames = ''

	END


	-- 파일 이름 다 결정하고 들어갈께요

	SET @FileName = @ServerName + '__' + @Temp + '_Log_BAK_' + @Date + '_' + @HH

	SELECT @FileName

	SET @Qry = ''

	
	SET @Qry = 'BACKUP LOG [' + @Temp + '] TO DISK = ' + @Qt + @Dest + '\' + @FileName + @Qt + ' WITH INIT ;'	
	
	EXEC (@Qry)

	IF(@CopyUNC = 1)
	BEGIN
		
		DECLARE @RemoteTarget varchar(1000)		
		SET @RemoteTarget = @ServerFamily + '\' + @ServerName + '\' + @YYYY + @MM + '\' + @YYYY + @MM + @DD + '\'

		EXEC @R = master.dbo.xp_cmdshell 'Dir x:'
		
		IF(@R = 0)
		BEGIN

			SET @Cmd = 'cmd /c xcopy ' + @Dest + '\' + @FileName + ' X:\' + @RemoteTarget

			EXEC master.dbo.xp_cmdshell @Cmd

		END

	END

	IF(@MailNotice = 1)
	BEGIN

		DECLARE @NowTime varchar(50)
		SET @NowTime = CONVERT(varchar(50), getdate(), 120)


		SET @FromAddr = 'dba@sonov.com'
		SET @ToAddr = ''
		SET @Subject = '[백업자동알림] ' + @NowTime + ' 에 일어난 [' + @ServerName + '] 서버 백업 작업 결과입니다.'
		SET @TextBody = '[백업자동알림] ' + @NowTime + ' 에 일어난 [' + @ServerName + '] 서버 백업 작업 결과입니다.' + Char(13) + Char(13)  
		SET @TextBody = @TextBody + @FileName + ' 파일이 백업됨 ' + Char(13) + Char(13)  			

		IF(@R = 0)
		BEGIN
			SET	@TextBody = @TextBody + ' 또한 네트워크 경로 \\10.10.10.243\dbbackup\' + @RemoteTarget + ' 로 파일이 복사 되었습니다.'
		END
		ELSE
		BEGIN
			SET	@TextBody = @TextBody + ' 네트워크 경로 \\10.10.10.243\dbbackup\' + @RemoteTarget + ' 로의 파일 복사 작업이 실패했습니다.'
			SET @ToAddr = @ToAddr + ''
		END		

		EXEC master.dbo.uxp_Send_CDOSysMail @From = @FromAddr, @To = @ToAddr, @Subject = @Subject, @Body = @TextBody

	END

END




GO
/****** Object:  StoredProcedure [dbo].[uxp_CopyTable]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[uxp_CopyTable]

AS

SET NOCOUNT ON

DECLARE @Cnt int
DECLARE @YYYY varchar(4)
DECLARE @MM varchar(2)
DECLARE @DD varchar(2)
DECLARE @nDD int
DECLARE @DBDate datetime
DECLARE @DBName varchar(1000)
DECLARE @StrTable varchar(1000)

SET @DBDate = GETDATE()
SET @DBName = 'PS_GameData'

-- DB 날짜 셋팅

SET @YYYY = CAST ( DATEPART(yyyy, @DBDate) AS varchar(4) )
SET @MM = CAST ( DATEPART(mm, @DBDate) AS varchar(2) )
SET @DD = CAST ( DATEPART(dd, @DBDate) AS varchar(2) )

IF( LEN (@MM) = 1 )
BEGIN
 	SET @MM = '0' + @MM
END

IF( LEN (@DD) = 1 )
BEGIN
 	SET @DD = '0' + @DD
END

-- DBName 다시 설정 = DBName_YYYYMM
SET @DBName = @DBName + '_' + @YYYY + @MM

DECLARE @Query nvarchar(1000)

-- Chars 테이블 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'Chars'+@DD

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.Chars'
EXEC (@Query)

-- CharItems 테이블 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'CharItems'+@DD

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.CharItems'
EXEC (@Query)

-- CharQuests 테이블 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'CharQuests'+@DD

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.CharQuests'
EXEC (@Query)

-- CharSkills 테이블 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'CharSkills'+@DD

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.CharSkills'
EXEC (@Query)

-- UserStoredItems 테이블 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'UserStoredItems'+@DD

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.UserStoredItems'
EXEC (@Query)

-- UserStoredMoney 테이블 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'UserStoredMoney'+@DD

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.UserStoredMoney'
EXEC (@Query)


-- GuildStoredItems 테이블 복사 --------------------------------------------------------------
SET @StrTable = ''
SET @StrTable = 'GuildStoredItems'+@DD

SET @Query = ''
SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.GuildStoredItems'
EXEC (@Query)

-- Guilds 테이블 복사 --------------------------------------------------------------
--SET @StrTable = ''
--SET @StrTable = 'Guilds'+@DD

--SET @Query = ''
--SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.Guilds'
--EXEC (@Query)

-- GuildChars 테이블 복사 --------------------------------------------------------------
--SET @StrTable = ''
--SET @StrTable = 'GuildChars'+@DD

--SET @Query = ''
--SET @Query = 'INSERT INTO '+@DBName+'.dbo.'+@StrTable+' SELECT * FROM PS_GameData.dbo.GuildChars'
--EXEC (@Query)

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[uxp_CreateDB]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE Proc [dbo].[uxp_CreateDB]

@Dest1 varchar(200), -- 맨 마지막에 \ 까지 입력 // 데이터파일(mdf)위치
@Dest2 varchar(200), -- 맨 마지막에 \ 까지 입력 // 로그파일(ldf)위치
@DBName varchar(50) = 'PS_GameData',
@DBDate datetime, --  yyyy-mm-dd
@ServerName varchar(50) --= '' // PSGAMELOG01

AS

SET NOCOUNT ON

DECLARE @Sql1 varchar(8000)
DECLARE @Sql2 varchar(8000)
DECLARE @Sql3 varchar(8000)
DECLARE @Sql4 varchar(8000)
DECLARE @Sql5 varchar(8000)
DECLARE @Sql6 varchar(8000)
DECLARE @Sql7 varchar(8000)
DECLARE @Sql8 varchar(8000)
DECLARE @Sql9 varchar(8000)
DECLARE @Sql10 varchar(8000)
DECLARE @SqlAll varchar(8000)
DECLARE @StDate datetime
DECLARE @EnDate datetime
DECLARE @DayMax int
DECLARE @Cnt int
DECLARE @DBDateC varchar(6)
DECLARE @YYYY varchar(4)
DECLARE @MM varchar(2)
DECLARE @DD varchar(2)
DECLARE @nDD int
DECLARE @StrTable varchar(1000)
DECLARE @Result varchar(8000)

-- 필수변수 셋팅

SET @Cnt = 1

-- 서버 이름 셋팅 : 없으면 @@servername 으로

IF(@ServerName = '' OR @ServerName IS NULL)
BEGIN

 	SET @ServerName = (SELECT @@SERVERNAME)
  
END

-- DB 날짜 셋팅

SET @YYYY = CAST ( DATEPART(yyyy, @DBDate) AS varchar(4) )
SET @MM = CAST ( DATEPART(mm, @DBDate) AS varchar(2) )

IF( LEN (@MM) = 1 )
BEGIN

 	SET @MM = '0' + @MM
  
END

-- 마지막날 구하기

SET @StDate = CAST(@YYYY + '-' + @MM + '-01' AS datetime)
SET @EnDate = DATEADD ( mm , 1, @StDate ) 
SET @EnDate = DATEADD ( dd , -1, @EnDate ) 

SET @DayMax = DATEPART(dd, @EnDate)

-- DBName 다시 설정 = DBName_YYYYMM

SET @DBName = @DBName + '_' + @YYYY + @MM

-- CREATE DATABASE 시작부분

SET @Sql1 = 

'
CREATE DATABASE [' + @DBName + ']
ON
PRIMARY
( NAME = ' + @DBName + '_PRIMARY,
  FILENAME = ''' + @dest1 + @ServerName + '__' + @DBName + '_PRIMARY.mdf'',
  SIZE = 5MB,
  FILEGROWTH = 2048MB )
'

-- 로그 설정

SET @Sql2 = 

'
LOG ON
( NAME = ' + @DBName + '_Log,
   FILENAME = ''' + @dest2 + @ServerName + '__' + @DBName + '_Log.ldf'',
   SIZE = 5MB,
   FILEGROWTH = 1024MB 
)

'
SET @Sql3 = 
'ALTER DATABASE [' +@DBName + ']
SET RECOVERY SIMPLE'


EXEC (@Sql1 + @Sql2 + @Sql3)

SET @Cnt = 1

WHILE( @Cnt <= @DayMax)
BEGIN
	SET @DD = CAST( @Cnt AS varchar(2) )
	IF ( LEN(@DD) = 1 )
	BEGIN
		SET @DD = '0' + @DD
	END

	SET @StrTable = 'Chars' + @DD
	EXEC dbo.usp_Create_Table_Chars @DBName, @StrTable

	SET @StrTable = ''
	SET @StrTable = 'CharItems' + @DD
	EXEC dbo.usp_Create_Table_CharItems @DBName, @StrTable

	SET @StrTable = ''
	SET @StrTable = 'CharQuests' + @DD
	EXEC dbo.usp_Create_Table_CharQuests @DBName, @StrTable

	SET @StrTable = ''
	SET @StrTable = 'CharSkills' + @DD
	EXEC dbo.usp_Create_Table_CharSkills @DBName, @StrTable

	SET @StrTable = ''
	SET @StrTable = 'UserStoredItems' + @DD
	EXEC dbo.usp_Create_Table_UserStoredItems @DBName, @StrTable

	SET @StrTable = ''
	SET @StrTable = 'UserStoredMoney' + @DD
	EXEC dbo.usp_Create_Table_UserStoredMoney @DBName, @StrTable


	SET @StrTable = ''
	SET @StrTable = 'GuildStoredItems' + @DD
	EXEC dbo.usp_Create_Table_GuildStoredItems @DBName, @StrTable
	--SET @StrTable = ''
	--SET @StrTable = 'Guilds' + @DD
	--EXEC dbo.usp_Create_Table_Guilds @DBName, @StrTable

	--SET @StrTable = ''
	--SET @StrTable = 'GuildChars' + @DD
	--EXEC dbo.usp_Create_Table_GuildChars @DBName, @StrTable

	SET @Cnt = @Cnt + 1
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[uxp_DBadduser]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uxp_DBadduser]
as
DECLARE @Date varchar(20)
DECLARE @ServerName varchar(30)
DECLARE @YYYY varchar(4)
DECLARE @MM varchar(2)
DECLARE @USESql varchar(400)
DECLARE @USESql2 varchar(100)
DECLARE @USESql3 varchar(100)
DECLARE @USESql4 varchar(100)

SET @Date = DATEADD(mm, 1, GETDATE() )
SET @Date = CONVERT(varchar(10),  @Date, 102)
SET @Date = REPLACE(@Date, '.', '')
SET @YYYY = YEAR(getdate())
SET @MM =DATEADD(mm, 1, GETDATE()) 
IF ( LEN ( @MM ) = 1 )
BEGIN
	SET @MM = '0' + @MM
END
SET @ServerName ='PS_GameData_' + @YYYY + @MM
SET @USESql2= ' exec sp_adduser ''uacc_ecrm'', ''uacc_ecrm'', ''public'''  
SET @USESql3= ' exec sp_addrolemember ''db_datareader'', ''uacc_ecrm'''
SET @USESql4 = ' exec sp_addrolemember ''db_denydatawriter'', ''uacc_ecrm'''
SET @USESql =N'USE ' +  CAST(@ServerName AS nvarchar(100))
SET @USESql=@USESql +@USESql2+@USESql3+@USESql4
--print @USESql 
EXEC(@USESql)
GO
/****** Object:  StoredProcedure [dbo].[uxp_Send_CDOSysMail]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[uxp_Send_CDOSysMail] 

/*

Originated from MSDN Library 

URL : ms-help://MS.VSCC.2003/MS.MSDNQTR.2003FEB.1042/enu_kbsqlserver/en-us/sqlserver/Q312839.htm

SQLMail 설정 없이 CDOSYS 사용하여 메일 보내는 프로시저

*/

   @From varchar(100) ,
   @To varchar(100) ,
   @Subject varchar(100)=" ",
   @Body varchar(4000) =" "
   
   AS
   Declare @iMsg int
   Declare @hr int
   Declare @source varchar(255)
   Declare @description varchar(500)
   Declare @output varchar(1000)
   
-- 메일서버 및 ID / PW 추가설정
  
   Declare @server varchar(50)
   Declare @username varchar(50)
   Declare @password varchar(50)
   
   Set @server = 'mail.shaiya.com'
   Set @username = 'dbsa'
   Set @password = 'tidldirpdladb'



--************* Create the CDO.Message Object ************************ / CDO.Message Object 를 생성합니다.
   EXEC @hr = sp_OACreate 'CDO.Message', @iMsg OUT

--***************Configuring the Message Object ****************** / Message Object를 설정합니다.
-- This is to configure a remote SMTP server. / 이것은 원격 SMTP 서버를 구성합니다.
-- 참고URL : http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cdosys/html/_cdosys_schema_configuration_sendusing.asp


-- 이하 옵션설정 부분

-- 포트사용 : 2
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/sendusing").Value','2'
-- 서버 설정  
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/smtpserver").Value', @server
-- 커넥션 타임아웃   
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout").Value', '20' 
-- 인증방식 : 1(0 : Anonymous, 1 : Basic Authenticate, 2 : NTLM)   
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate").Value', '1' 
   
-- 인증용 ID
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/sendusername").Value', @username
   
-- 인증용 PW  
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/sendpassword").Value', @password
   
-- Save the configurations to the message object.
   EXEC @hr = sp_OAMethod @iMsg, 'Configuration.Fields.Update', null

-- Set the e-mail parameters. / 이메일 파라미터 저장
   EXEC @hr = sp_OASetProperty @iMsg, 'To', @To
   EXEC @hr = sp_OASetProperty @iMsg, 'From', @From
   EXEC @hr = sp_OASetProperty @iMsg, 'Subject', @Subject

-- If you are using HTML e-mail, use 'HTMLBody' instead of 'TextBody'. / HTML e-mail을 사용하신다면, TextBody 대신 HTMLBody 프로퍼티를 사용하시기 바랍니다.
   EXEC @hr = sp_OASetProperty @iMsg, 'TextBody', @Body
   EXEC @hr = sp_OAMethod @iMsg, 'Send', NULL

-- Sample error handling. / 샘플 에러 처리
   IF @hr <>0 
     select @hr
     BEGIN
       EXEC @hr = sp_OAGetErrorInfo NULL, @source OUT, @description OUT
       IF @hr = 0
         BEGIN
           SELECT @output = '  Source: ' + @source
           PRINT  @output
           SELECT @output = '  Description: ' + @description
           PRINT  @output
         END
       ELSE
         BEGIN
           PRINT '  sp_OAGetErrorInfo failed.'
           RETURN
         END
     END

-- Do some error handling after each step if you need to. / 
-- Clean up the objects created.
   EXEC @hr = sp_OADestroy @iMsg


GO
/****** Object:  StoredProcedure [dbo].[uxp_Update_GuildPointRank]    Script Date: 4/25/2024 8:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     Proc [dbo].[uxp_Update_GuildPointRank]
@CheckDate int = 1
AS

DECLARE
@Country 	tinyint,
@RankTime	datetime,
@OldRankTime	datetime,
@InitSystemCheck	int

-- 빛
SET @Country = 0
SET @RankTime = GETDATE()

----------------------------------------------------------------
--RETURN 1
----------------------------------------------------------------

SET NOCOUNT ON
SET XACT_ABORT ON
----------------------------------------------------------------
--Check Update
IF @CheckDate = 1
BEGIN
	SELECT @InitSystemCheck=Count(*) FROM GuildDetails
	IF ( @InitSystemCheck = 0 )
	BEGIN
		RETURN -1
	END

	SET @OldRankTime = ( SELECT TOP 1 RankTime FROM GuildRankLog ORDER BY RankTime DESC )
	IF ( @OldRankTime IS NOT NULL )
	BEGIN
		IF ( DATEDIFF( day, @OldRankTime, @RankTime ) < 7 )
		BEGIN
			RETURN 0
		END
	END
END

----------------------------------------------------------------

--BEGIN TRAN
--Init
DELETE FROM GuildRankLog2
INSERT INTO GuildRankLog2 SELECT * FROM GuildRankLog
DELETE FROM GuildRankLog

UPDATE GuildDetails SET Rank = 31

--BackUp
if exists (select * from dbo.sysobjects where id = object_id(N'[_GuildDetailsBack]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	drop table [_GuildDetailsBack]
END

SELECT GD.* INTO _GuildDetailsBack FROM GuildDetails GD
INNER JOIN Guilds G ON GD.GuildID = G.GuildID AND G.Del = 0

---------------------------------------------------------------

ROOP:
CREATE TABLE #TmpGuild ( RankIndex int IDENTITY (1, 1) NOT NULL , GuildID int NOT NULL, GuildValue int NOT NULL, Rank int NULL )

--Rank

INSERT INTO #TmpGuild ( GuildID, GuildValue )

SELECT G.GuildID, ISNULL(G.GuildPoint,0) + ISNULL(H.EtinReturnCnt, 0)  AS GuildValue
FROM Guilds G
--INNER JOIN GuildChars GC ON G.GuildId = GC.GuildId and GC.Del = 0
--INNER JOIN Chars C ON GC.CharId = C.CharId and C.Del = 0
LEFT OUTER JOIN GuildDetails H ON G.GuildID = H.GuildID
WHERE G.Del = 0 AND G.Country = @Country
GROUP BY G.GuildId, G.GuildPoint, H.EtinReturnCnt
ORDER BY GuildValue DESC

--SELECT * FROM #TmpGuild

UPDATE #TmpGuild SET Rank = RankIndex
UPDATE #TmpGuild SET Rank = 31 WHERE Rank > 30
UPDATE #TmpGuild SET GuildValue = 0 WHERE GuildValue < 0

-----------------------------------------------------------------
--insert log
--SELECT * FROM #TmpGuild
INSERT INTO GuildRankLog( GuildID, GuildValue, Rank, RankTime)
SELECT GuildID, GuildValue, Rank, @RankTime  FROM #TmpGuild

-----------------------------------------------------------------

UPDATE GuildDetails
SET Rank = T.Rank
FROM Guilds G 
INNER JOIN #TmpGuild T ON T.GuildID = G.GuildID
INNER JOIN GuildDetails H ON H.GuildID = G.GuildID

DELETE FROM #TmpGuild 
WHERE GuildID IN ( SELECT GuildID FROM GuildDetails )

INSERT INTO GuildDetails ( GuildID, Rank )
SELECT  GuildID, Rank 
FROM #TmpGuild G 

IF  @Country = 0
BEGIN
	--분노
	SET  @Country = 1
	DROP TABLE #TmpGuild
	GOTO ROOP
END
--------------------------------------------
--UseHouse

UPDATE GuildDetails SET EtinReturnCnt = 0, UseHouse = 0

UPDATE GuildDetails SET UseHouse = 2
WHERE Etin <  KeepEtin AND BuyHouse = 1 AND Rank < 31

UPDATE GuildDetails SET UseHouse = 1, Etin=Etin - (KeepEtin/2)
WHERE Etin >= (KeepEtin/2) AND BuyHouse = 1 AND Rank < 31

--------------------------------------------
--Total Rank
CREATE TABLE #TmpRank ( TotalRank int IDENTITY (1, 1) NOT NULL , GuildID int NOT NULL )

INSERT INTO #TmpRank( GuildID)
SELECT GuildID FROM GuildRankLog 
WHERE Rank < 31
ORDER BY GuildValue DESC

UPDATE GuildRankLog
SET TotalRank = T.TotalRank
FROM GuildRankLog G 
INNER JOIN #TmpRank T ON T.GuildID = G.GuildID


DROP TABLE #TmpRank
--------------------------------------------
--Release
DROP TABLE #TmpGuild
--------------------------------------------

--COMMIT TRAN

SET XACT_ABORT OFF

RETURN 1


SET NOCOUNT OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'타입(2자리) + 타입ID(3자리) = 5자리 일련번호(겹치지 않음)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가방번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Bag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가방에 슬롯번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Slot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내구도' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Quality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'라피스 번호(타입ID만 들어감)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Gem1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Craftname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생성시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Maketime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생성방법' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Maketype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharItems', @level2type=N'COLUMN',@level2name=N'Del'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'스킬 딜레이(ms던가?)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharQuests', @level2type=N'COLUMN',@level2name=N'Delay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'수행안함 -1, 실패 0, 성공 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharQuests', @level2type=N'COLUMN',@level2name=N'Success'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'세력(0:빛, 1:분노)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserMaxGrow', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최고 성장모드(0~3)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserMaxGrow', @level2type=N'COLUMN',@level2name=N'MaxGrow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'창고 아이템 테이블로써 구조는 CharItems 테이블과 동일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStoredItems', @level2type=N'COLUMN',@level2name=N'RowID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'회원 ''은행'' 으로써 캐릭터에 들어간 Money필드와 역할 동일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserStoredMoney', @level2type=N'COLUMN',@level2name=N'RowID'
GO
USE [master]
GO
ALTER DATABASE [PS_GameData] SET  READ_WRITE 
GO
