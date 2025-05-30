USE [master]
GO
/****** Object:  Database [PS_UserData]    Script Date: 4/25/2024 8:59:40 AM ******/
CREATE DATABASE [PS_UserData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PS_UserData_Data', FILENAME = N'C:\ShaiyaServer\DATABASE\PS_UserData_Data.MDF' , SIZE = 5056KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'PS_UserData_Log', FILENAME = N'C:\ShaiyaServer\DATABASE\PS_UserData_Log.LDF' , SIZE = 504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PS_UserData] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PS_UserData].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [PS_UserData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PS_UserData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PS_UserData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PS_UserData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PS_UserData] SET ARITHABORT OFF 
GO
ALTER DATABASE [PS_UserData] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PS_UserData] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [PS_UserData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PS_UserData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PS_UserData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PS_UserData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PS_UserData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PS_UserData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PS_UserData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PS_UserData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PS_UserData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PS_UserData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PS_UserData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PS_UserData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PS_UserData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PS_UserData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PS_UserData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PS_UserData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PS_UserData] SET  MULTI_USER 
GO
ALTER DATABASE [PS_UserData] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [PS_UserData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PS_UserData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PS_UserData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PS_UserData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PS_UserData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PS_UserData] SET QUERY_STORE = OFF
GO
USE [PS_UserData]
GO
/****** Object:  Table [dbo].[Users_Master]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Master](
	[UserUID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](18) NOT NULL,
	[Pw] [varchar](12) NOT NULL,
	[JoinDate] [smalldatetime] NOT NULL,
	[Admin] [bit] NOT NULL,
	[AdminLevel] [tinyint] NOT NULL,
	[UseQueue] [bit] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Leave] [tinyint] NOT NULL,
	[UserType] [char](1) NOT NULL,
	[UserIp] [varchar](15) NULL,
	[Point] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Detail]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Detail](
	[UserID] [varchar](18) NOT NULL,
	[UserUID] [int] NOT NULL,
	[UserName] [varchar](20) NULL,
	[SocialNo1] [char](6) NULL,
	[SocialNo2] [char](7) NULL,
	[PwQuestion] [varchar](100) NOT NULL,
	[PwAnswer] [varchar](20) NULL,
	[Email] [varchar](100) NOT NULL,
	[PostNo] [char](7) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[Phone1] [varchar](3) NULL,
	[Phone2] [varchar](4) NULL,
	[Phone3] [varchar](4) NULL,
	[Mobile1] [varchar](3) NULL,
	[Mobile2] [varchar](4) NULL,
	[Mobile3] [varchar](4) NULL,
	[NewsLetter] [bit] NOT NULL,
	[Sms] [bit] NOT NULL,
	[AdultAuth] [bit] NOT NULL,
	[AdultAuthDate] [datetime] NULL,
	[EmailAuth] [char](1) NOT NULL,
	[EmailAuthKey] [varchar](10) NULL,
	[Job] [varchar](50) NULL,
	[JobNo] [tinyint] NULL,
	[LocalNo] [tinyint] NULL,
	[PwQuNo] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Users]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  View dbo.View_Users    Script Date: 2008-6-7 18:34:05 ******/






CREATE     View [dbo].[View_Users]

AS

SELECT M.RowID, M.UserID, M.Pw, M.UserUID, M.Admin, M.UseQueue, D.UserName, D.SocialNo1, D.SocialNo2, D.PwQuestion, D.PwAnswer, 
D.Email, D.PostNo, D.Addr1, D.Addr2, D.Phone1, D.Phone2, D.Phone3, 
D.Mobile1, D.Mobile2, D.Mobile3, D.NewsLetter, D.Sms, D.Job, D.AdultAuth, D.AdultAuthDate, D. EmailAuth, D.EmailAuthKey, M.JoinDate, M.Leave, M.LeaveDate, M.UserType, M.Status, M.UserIp
FROM Users_Master M LEFT OUTER JOIN Users_Detail D
ON M.UserID = D.UserID







GO
/****** Object:  Table [dbo].[UserBlockLog]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBlockLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [smallint] NOT NULL,
	[AppliedStatus] [smallint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Cause] [varchar](7000) NOT NULL,
	[ProcDate] [datetime] NOT NULL,
	[ProcAdminID] [varchar](12) NOT NULL,
	[Enable] [bit] NOT NULL,
	[AutoRelease] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLeaveLog]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLeaveLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveApplyNo] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[AppliedStatus] [smallint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[UserID] [varchar](18) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Phone1] [varchar](3) NOT NULL,
	[Phone2] [varchar](4) NOT NULL,
	[Phone3] [varchar](4) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[LeaveQuestion1] [varchar](2000) NOT NULL,
	[LeaveQuestion2] [varchar](2000) NOT NULL,
	[LeaveQuestion3] [varchar](3000) NOT NULL,
	[LeaveApplyDate] [datetime] NOT NULL,
	[Result] [tinyint] NOT NULL,
	[ProcAdminID] [varchar](12) NULL,
	[ProcDate] [datetime] NULL,
	[Enable] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginLog]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLoginLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [bigint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[UserIP] [varchar](15) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LogoutTime] [datetime] NULL,
	[LoginType] [smallint] NOT NULL,
	[ErrType] [smallint] NOT NULL,
	[ErrMsg] [varchar](300) NULL,
	[PCBangRowID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPauseLog]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPauseLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [smallint] NOT NULL,
	[AppliedStatus] [smallint] NOT NULL,
	[UserUID] [int] NOT NULL,
	[Cause] [varchar](7000) NOT NULL,
	[ProcDate] [datetime] NOT NULL,
	[ProcAdminID] [varchar](12) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Enable] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPointChargeLog]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPointChargeLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](18) NOT NULL,
	[Point] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Block]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Block](
	[UserUID] [int] NOT NULL,
	[BlockEndDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_BlockLog]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_BlockLog](
	[UserUID] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[BlockEndDate] [datetime] NULL,
	[GmID] [varchar](18) NULL,
	[InsertDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Deleted]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Deleted](
	[UserID] [varchar](18) NOT NULL,
	[Pw] [varchar](12) NOT NULL,
	[UserUID] [int] NOT NULL,
	[Admin] [bit] NOT NULL,
	[UseQueue] [bit] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[SocialNo1] [char](6) NOT NULL,
	[SocialNo2] [char](7) NOT NULL,
	[PwQuestion] [varchar](100) NOT NULL,
	[PwAnswer] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PostNo] [char](7) NOT NULL,
	[Addr1] [varchar](100) NOT NULL,
	[Addr2] [varchar](100) NOT NULL,
	[Phone1] [varchar](3) NOT NULL,
	[Phone2] [varchar](4) NOT NULL,
	[Phone3] [varchar](4) NOT NULL,
	[Mobile1] [varchar](3) NULL,
	[Mobile2] [varchar](4) NULL,
	[Mobile3] [varchar](4) NULL,
	[NewsLetter] [bit] NOT NULL,
	[Sms] [bit] NOT NULL,
	[Job] [varchar](50) NULL,
	[AdultAuth] [bit] NOT NULL,
	[AdultAuthDate] [datetime] NULL,
	[EmailAuth] [char](1) NOT NULL,
	[EmailAuthKey] [varchar](10) NULL,
	[JoinDate] [smalldatetime] NOT NULL,
	[LeaveDate] [smalldatetime] NULL,
	[DeleteDate] [smalldatetime] NULL,
	[ProcAdmin] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Updatelog]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Updatelog](
	[seq] [int] IDENTITY(1,1) NOT NULL,
	[UserUID] [int] NULL,
	[UserID] [varchar](18) NOT NULL,
	[Pw] [varchar](12) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[SocialNo] [char](14) NOT NULL,
	[PwQuestion] [varchar](100) NOT NULL,
	[PwAnswer] [varchar](20) NOT NULL,
	[PwQuNo] [tinyint] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PostNo] [char](7) NOT NULL,
	[LocalNo] [tinyint] NOT NULL,
	[Addr1] [varchar](100) NOT NULL,
	[Addr2] [varchar](100) NULL,
	[Phone] [varchar](13) NOT NULL,
	[Mobile] [varchar](13) NOT NULL,
	[NewsLetter] [bit] NOT NULL,
	[Sms] [bit] NOT NULL,
	[Job] [varchar](50) NOT NULL,
	[JobNo] [tinyint] NOT NULL,
	[AdultAuth] [tinyint] NULL,
	[AdultAuthDate] [datetime] NULL,
	[EmailAuth] [char](1) NULL,
	[EmailAuthKey] [varchar](10) NULL,
	[Credate] [datetime] NOT NULL,
	[Creip] [varchar](15) NOT NULL,
	[enpassword] [char](32) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users_Detail] ADD  CONSTRAINT [DF_Users_Detail_EmailAuth]  DEFAULT (1) FOR [EmailAuth]
GO
ALTER TABLE [dbo].[Users_Master] ADD  CONSTRAINT [DF_Users_Master_JoinDate]  DEFAULT (getdate()) FOR [JoinDate]
GO
ALTER TABLE [dbo].[Users_Master] ADD  CONSTRAINT [DF_Users_Master_Point]  DEFAULT ((0)) FOR [Point]
GO
/****** Object:  StoredProcedure [dbo].[PlaytimePerHour]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimePerHour    Script Date: 2008-6-7 18:34:05 ******/





CREATE   procedure [dbo].[PlaytimePerHour]

as
declare @dd varchar(100)
declare @ddd varchar(100)
declare @mm char(2)
declare @result varchar(4000)

set @dd = DATEPART(dd, GETDATE())
set @ddd = DATEPART(dd, GETDATE()-1)
set @mm = convert(nvarchar, datepart(mm,GETDATE()))

if @dd <10 
begin
  set @dd = '0' + @dd
end

if @ddd <10 
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

set @result = 'USE PS_UserLog_' + DATENAME (yyyy, GETDATE()) + @mm

--select @ddd, @dd

set @result = @result + '
CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

 select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as pt
into #temppp
from #tempp
where (DATENAME (dd, logout)  = DATENAME (dd, GETDATE())) 
group by UserUID


select  (pt/60) as hour , count(*) as count
from #temppp
group by pt / 60
order by hour
'

EXEC(@result)













GO
/****** Object:  StoredProcedure [dbo].[PlaytimePerHourToday]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimePerHourToday    Script Date: 2008-6-7 18:34:05 ******/






CREATE    procedure [dbo].[PlaytimePerHourToday]

as

declare @dd char(100)
declare @ddd char(100)
declare @mm char(2)
declare @result varchar(4000)

set @dd = DATEPART(dd, GETDATE())
set @ddd = DATEPART(dd, GETDATE()-1)
set @mm = convert(nvarchar, datepart(mm,GETDATE()))

if @dd <10
begin
  set @dd = '0' + @dd
end

if @ddd <10
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

set @result = 'USE PS_UserLog_' + DATENAME (yyyy, GETDATE()) + @mm

--select @ddd, @dd

set @result = @result + '
CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

 select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as pt
into #temppp
from #tempp
where (DATENAME (dd, logout)  = DATENAME (dd, GETDATE())) 
group by UserUID


select  (pt/60) as hour , count(*) as count
from #temppp
group by pt / 60
order by hour
'

EXEC(@result)










GO
/****** Object:  StoredProcedure [dbo].[PlaytimePerHourYesterday]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimePerHourYesterday    Script Date: 2008-6-7 18:34:05 ******/







CREATE     procedure [dbo].[PlaytimePerHourYesterday]

as

declare @dd char(100)
declare @ddd char(100)
declare @mm char(2)
declare @result varchar(4000)

set @dd = DATEPART(dd, GETDATE()-1)
set @ddd = DATEPART(dd, GETDATE()-2)
set @mm = convert(nvarchar, datepart(mm,GETDATE()-1))

if @dd <10
begin
  set @dd = '0' + @dd
end

if @ddd <10
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

set @result = 'USE PS_UserLog_' + DATENAME (yyyy, GETDATE()-1) + @mm

--select @ddd, @dd

set @result = @result + '
CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

 select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as pt
into #temppp
from #tempp
where (DATENAME (dd, logout)  = DATENAME (dd, GETDATE()-1)) 
group by UserUID


select  (pt/60) as hour , count(*) as count
from #temppp
group by pt / 60
order by hour
'

EXEC(@result)






GO
/****** Object:  StoredProcedure [dbo].[PlaytimeReport]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimeReport    Script Date: 2008-6-7 18:34:05 ******/





CREATE    PROCEDURE [dbo].[PlaytimeReport]
as

declare @dd char(100)
declare @ddd char(100)
declare @mm char(2)
declare @result varchar(4000)

set @dd = DATEPART(dd, GETDATE()-1)
set @ddd = DATEPART(dd, GETDATE()-2)
set @mm = convert(nvarchar, datepart(mm,GETDATE()-1))


if @dd <10 
begin
  set @dd = '0' + @dd
end

if @ddd <10 
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

set @result = 'USE PS_UserLog_' + DATENAME (yyyy, GETDATE()) + @mm

--select @ddd, @dd

set @result = @result + '
CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

 select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as "Total User PlayTime(min)"
from #tempp
where DATENAME (dd, logout)  = DATENAME (dd, GETDATE()-1) 
group by UserUID
order by "Total User PlayTime(min)"  desc'

EXEC(@result)




GO
/****** Object:  StoredProcedure [dbo].[PlaytimeReportInsert]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimeReportInsert    Script Date: 2008-6-7 18:34:05 ******/





CREATE       PROCEDURE [dbo].[PlaytimeReportInsert]


@date datetime

as

declare @d varchar(2)
declare @dd varchar(20)
declare @ddd varchar(20)
declare @mm char(2)
declare @mmm char(2)
declare @result varchar(4000)
declare @databaseName1 varchar(30)
declare @databaseName2 varchar(30)
declare @yyyy_before char(4)
declare @ydate char(8)

set @d = convert(char,datepart(dd, dateadd(dd,-1, @date)))
set @dd = convert(char,datepart(dd, dateadd(dd,-1, @date)))
set @ddd = convert(char,datepart(dd, dateadd(dd,-2,@date)))
set @mm = CONVERT(char, datepart(mm,@date-1))
set @mmm = convert(char,datepart(mm, dateadd(mm,-1,@date)))
set @yyyy_before = DATENAME (yyyy, @date)-1
set @ydate = convert(char, @date-1, 112)

select @date

if @dd <10
begin
  set @dd = '0' + @dd
end

if @ddd <10
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

if @mmm <10
begin
  set @mmm = '0' + @mmm
end

select @dd as dd, @ddd as ddd, @mm as mm, @mmm as mmm, @yyyy_before -- 1, 3, 4


if @mm = '12' and @dd = '31'
begin
	set @databaseName1 = 'USE PS_UserLog_' + @yyyy_before + @mm
	set @databaseName2 = 'USE PS_UserLog_' + @yyyy_before + @mmm
end
else if @mm = '01' and @dd = '01'
begin
	set @databaseName1 = 'USE PS_UserLog_' + @yyyy_before + @mmm
	set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mm
end
else
begin
	set @databaseName1 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mm
	
	if @dd = '01'
	begin
	  set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mmm
	end
	else
	begin
	  set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mm
	end
end


select @databaseName1, @databaseName2

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

--select @dd, @ddd

set @result = @databaseName1 + '
CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)
' + @databaseName2 + '
 insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' ' + @databaseName1 + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

 select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as pt
into #temppp
from #tempp
where DATENAME (dd, logout)  = ' + @d + '
group by UserUID

declare @count int 
declare @date CHAR(8) 

SET @DATE= ' + @ydate + '
SET @COUNT=(SELECT count(*) from #temppp where pt >= 180)

insert into GAME.PS_STATISTICS.DBO.DAILY_ACTIVEUSERS values(@date,@count)
'

EXEC(@result)




GO
/****** Object:  StoredProcedure [dbo].[PlaytimeReporTTEST]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimeReporTTEST    Script Date: 2008-6-7 18:34:05 ******/






CREATE       PROCEDURE [dbo].[PlaytimeReporTTEST]
as

declare @dd varchar(20)
declare @ddd varchar(20)
declare @mm char(2)
declare @mmm char(2)
declare @result varchar(4000)
declare @databaseName1 varchar(30)
declare @databaseName2 varchar(30)

set @dd = convert(char,datepart(dd, dateadd(dd,-1,getdate())))
set @ddd = convert(char,datepart(dd, dateadd(dd,-2,getdate())))
set @mm = CONVERT(char, datepart(mm,GETDATE()-1))
set @mmm = convert(char,datepart(mm, dateadd(mm,-1,getdate())))

if @dd <10
begin
  set @dd = '0' + @dd
end

if @ddd <10
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

if @mmm <10
begin
  set @mmm = '0' + @mmm
end

select @dd, @ddd, @mm, @mmm -- 1, 3, 4

set @databaseName1 = 'USE PS_UserLog_' + DATENAME (yyyy, GETDATE()) + @mm

if @dd = '01'
begin
  set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, GETDATE()) + @mmm
end
else
begin
  set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, GETDATE()) + @mm
end

 select @databaseName1, @databaseName2

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

-- select @dd, @ddd

set @result = @databaseName1 + '
CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)
' + @databaseName2 + '
 insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' ' + @databaseName1 + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

 select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as pt
into #temppp
from #tempp
where (DATENAME (dd, logout)  = DATENAME (dd, GETDATE()-1)) 
group by UserUID

declare @count int 
declare @date CHAR(8) 

SET @DATE=(SELECT CONVERT(CHAR,GETDATE()-1,112))
SET @COUNT=(SELECT count(*) from #temppp where pt >= 180)

SELECT @date
SELECT @count
'

EXEC(@result)



GO
/****** Object:  StoredProcedure [dbo].[PlaytimeReporTTEST2]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimeReporTTEST2    Script Date: 2008-6-7 18:34:05 ******/






CREATE       PROCEDURE [dbo].[PlaytimeReporTTEST2]

@date datetime

as

declare @d varchar(2)
declare @dd varchar(20)
declare @ddd varchar(20)
declare @mm char(2)
declare @mmm char(2)
declare @result varchar(4000)
declare @databaseName1 varchar(30)
declare @databaseName2 varchar(30)
declare @yyyy_before char(4)
declare @ydate char(8)

set @d = convert(char,datepart(dd, dateadd(dd,-1, @date)))
set @dd = convert(char,datepart(dd, dateadd(dd,-1, @date)))
set @ddd = convert(char,datepart(dd, dateadd(dd,-2,@date)))
set @mm = CONVERT(char, datepart(mm,@date-1))
set @mmm = convert(char,datepart(mm, dateadd(mm,-1,@date)))
set @yyyy_before = DATENAME (yyyy, @date)-1
set @ydate = convert(char, @date-1, 112)

select @date

if @dd <10
begin
  set @dd = '0' + @dd
end

if @ddd <10
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

if @mmm <10
begin
  set @mmm = '0' + @mmm
end

select @dd as dd, @ddd as ddd, @mm as mm, @mmm as mmm, @yyyy_before -- 1, 3, 4


if @mm = '12' and @dd = '31'
begin
	set @databaseName1 = 'USE PS_UserLog_' + @yyyy_before + @mm
	set @databaseName2 = 'USE PS_UserLog_' + @yyyy_before + @mmm
end
else if @mm = '01' and @dd = '01'
begin
	set @databaseName1 = 'USE PS_UserLog_' + @yyyy_before + @mmm
	set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mm
end
else
begin
	set @databaseName1 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mm
	
	if @dd = '01'
	begin
	  set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mmm
	end
	else
	begin
	  set @databaseName2 = 'USE PS_UserLog_' + DATENAME (yyyy, @date) + @mm
	end
end


select @databaseName1, @databaseName2

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

select @dd, @ddd

set @result = @databaseName1 + ' CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)
' + @databaseName2 + '
 insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' ' + @databaseName1 + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

 select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as pt
into #temppp
from #tempp
where DATENAME (dd, logout)  = ' + @d + '
group by UserUID

declare @count int 
declare @date CHAR(8) 

SET @DATE= ' + @ydate + '
SET @COUNT=(SELECT count(*) from #temppp where pt >= 180)


SELECT @date
SELECT @count
'

--EXEC(@result)




GO
/****** Object:  StoredProcedure [dbo].[PlaytimeUserListPerHour]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.PlaytimeUserListPerHour    Script Date: 2008-6-7 18:34:05 ******/




CREATE  procedure [dbo].[PlaytimeUserListPerHour]

@date nvarchar(20)

as

declare @dd nvarchar(100)
declare @ddd nvarchar(100)
declare @mm nvarchar(10)
declare @datename nvarchar(2)
declare @result nvarchar(2000)

set @dd = DATEPART(dd, CONVERT(DATETIME,@date))
set @ddd = DATEPART(dd, CONVERT(DATETIME,@date)-1)
set @datename = datename(dd, @date)
--set @mm = convert(nvarchar, datepart(mm,CONVERT(DATETIME,@date)))
set @mm = datepart(mm,CONVERT(DATETIME,@date))

if @dd <10
begin
  set @dd = '0' + @dd
end

if @ddd <10
begin
  set @ddd = '0' + @ddd
end

if @mm <10
begin
  set @mm = '0' + @mm
end

set @dd = 'dbo.UserLog' + @dd
set @ddd = 'dbo.UserLog' + @ddd

set @result = 'USE PS_UserLog_' + DATENAME (yyyy, CONVERT(DATETIME,@date)) + @mm

set @result = @result + '
CREATE TABLE [#temp] (
	[SessionID] [bigint] NOT NULL ,
	[UserUID] [int] NOT NULL ,
	[LogType] [bit] NOT NULL ,
	[LogTime] [datetime] NULL ,
	[LoginType] [smallint] NULL ,
)

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @ddd + ' 

insert into #temp(SessionID, UserUID, LogType, LogTime, LoginType)
select SessionID, UserUID, LogType, LogTime, LoginType from ' + @dd + '

select 
u2.useruid as "UserUID",
u1.sessionid as "Session",
u1.logtime as "login",
u2.logtime as "logout",
datediff(s, u1.logtime, u2.logtime) as "PT"
into #tempp
from #temp u1 
inner join #temp u2 on u1.useruid = u2.useruid and u1.sessionid = u2.sessionid
where u1.logtype = 0 and u2.logtype = 1

select UserUID, sum(PT)/60 as pt_min
into #temppp
from #tempp
where (DATENAME (dd, logout) = ' + @datename + ') 
group by UserUID

select distinct userUID
into #temppaid
from PS_GAMEDB01.ps_gamedata.dbo.pointlog
where (DATENAME (dd, usedate)  = ' + @datename + ') 

select t.useruid as ActiveUser, tp.useruid as PaidUser, t.pt_min
into #tempactivepaid
from #temppp as t full outer join #temppaid as tp on t.useruid = tp.useruid
where t.pt_min > 300
order by tp.userUID desc

select activeuser, PaidUser
From #tempactivepaid

'

--select @result

EXEC(@result)






GO
/****** Object:  StoredProcedure [dbo].[sp_LoginSuccessCheck]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.sp_OmgLoginSuccessCheck    Script Date: 2008-6-7 18:29:10 ******/



-- =============================
-- @Rtn_Success : 1-Success , 0-Fail
-- =============================

CREATE   PROCEDURE [dbo].[sp_LoginSuccessCheck] 
	@userid varchar(18),
	@checkPassword varchar(32),
	@Rtn_Success int OUTPUT
AS

BEGIN

	SET NOCOUNT ON;

	IF EXISTS(Select * From users_master with (nolock) Where userid=@userid  And pw=@checkPassword)
		BEGIN
			--Login Success
			SET @Rtn_Success = 1
		END
	ELSE
		BEGIN
			--Login Fail
			SET @Rtn_Success =- 1
		END
	RETURN @Rtn_Success


END
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_LoginLog_E]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.usp_Insert_LoginLog_E    Script Date: 2008-6-7 18:34:05 ******/







CREATE       Proc [dbo].[usp_Insert_LoginLog_E]

/* Created by humanws, 2005-10-18
로그인 로그 남기기
*/

@SessionID bigint,
@UserUID int,
@UserIP varchar(15),
@LogType bit = 0,	-- Login:0, Logout:1
@LogTime datetime,
@LoginType smallint = 1

AS

SET NOCOUNT ON

DECLARE @Sql nvarchar(4000)
DECLARE @yyyy varchar(4)
DECLARE @mm varchar(2)
DECLARE @dd varchar(2)

SET @yyyy = DATEPART(yyyy, @LogTime)
SET @mm = DATEPART(mm, @LogTime)
SET @dd = DATEPART(dd, @LogTime)

IF( LEN(@mm) = 1 )
BEGIN
	SET @mm = '0' + @mm
END

IF( LEN(@dd) = 1 )
BEGIN
	SET @dd = '0' + @dd
END

SET @Sql = N'
INSERT INTO PS_UserLog_' + @yyyy + @mm + '.dbo.UserLog' + @dd + '
(SessionID, UserUID, UserIP, LogType, LogTime, LoginType)
VALUES(@SessionID, @UserUID, @UserIP, @LogType, @LogTime, @LoginType)'

EXEC sp_executesql @Sql, 
N'@SessionID bigint, @UserUID int, @UserIP varchar(15), @LogType bit, @LogTime datetime, @LoginType smallint',
@SessionID, @UserUID, @UserIP, @LogType, @LogTime, @LoginType

SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_UserBlockLog_R]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.usp_Insert_UserBlockLog_R    Script Date: 2008-6-7 18:34:05 ******/





CREATE   Proc [dbo].[usp_Insert_UserBlockLog_R]

/*
Created by frsunny@hotmail.com, 2005-05-18
블럭 넣는 프로시저

*/

@Status smallint,
@UserID varchar(18),
@CharID int = 0,
@StartDate datetime = null,
@EndDate datetime,
@Cause varchar(7000),
@ProcDate datetime = null,
@ProcAdminID varchar(12) = '[GMSystem]',
@Enable bit = 1,
@AutoRelease bit = 1

AS


/* 상태코드
	Reserved						탈퇴완료	웹탈퇴	GM권한				블럭		중지	코드 값	비고
일반(정상유저)	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	
블럭(게임)	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	2	
블럭(웹)		0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	4	
블럭(게임+웹)	0	0	0	0	0	0	0	0	0	0	0	0	1	1	0	6	
블럭(캐릭터)	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	8	
GM권한 1	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	16	
GM권한 2	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	32	
GM권한 3	0	0	0	0	0	0	0	0	0	1	1	0	0	0	0	48	
GM권한 4	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	64	
GM권한 5	0	0	0	0	0	0	0	0	1	0	1	0	0	0	0	80	
탈퇴 웹신청	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	128	
탈퇴(3일내 처리)	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	256	
탈퇴 15일 경과	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	512	
중지		0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	
GM + 중지	0	0	0	0	0	0	0	0	1(0)	1(0)	1(0)	0	0	0	1	17~81	GM권한 + 1

블럭(게임) : 2
블럭(웹) : 4
블럭(게임+웹) : 6
블럭(캐릭터) : 8

*/

-- 정상이 아니면 0 리턴

DECLARE @UserUID int
DECLARE @AppliedStatus smallint

SELECT @UserUID = UserUID, @AppliedStatus = Status
FROM Users_Master
WHERE UserID = @UserID

IF( (@AppliedStatus & @Status) = @Status)
BEGIN

	RETURN 0 --에러 : 지금 걸려는 블럭과 동일한 블럭이 현재 걸려있음 -> 삭제후 재입력
END
ELSE
BEGIN
	
	IF(@ProcDate IS NULL)
	BEGIN
		SET @ProcDate = getdate()
	END
	
	IF(@StartDate IS NULL)
	BEGIN
		SET @StartDate = getdate()
	END
	
	SET @AppliedStatus = (@Status | @AppliedStatus)
	
	INSERT INTO UserBlockLog (Status, AppliedStatus, UserUID, CharID, StartDate, EndDate, 
	Cause, ProcDate, ProcAdminId, Enable, AutoRelease)
	VALUES(@Status, @AppliedStatus, @UserUID, @CharID, @StartDate, @EndDate, 
	@Cause, @ProcDate, @ProcAdminID, @Enable, @AutoRelease)
	
	UPDATE Users_Master
	SET Status = @AppliedStatus
	WHERE UserID = @UserID
	
	RETURN @@rowcount

END








GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_UserPauseLog_R]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.usp_Insert_UserPauseLog_R    Script Date: 2008-6-7 18:34:05 ******/



CREATE Proc [dbo].[usp_Insert_UserPauseLog_R]

/*
Created by frsunny@hotmail.com, 2005-05-18
계정 중지 시키는 프로시저

*/

@Status smallint,
@UserID varchar(18),
@Cause  varchar(7000),
@ProcDate datetime = null,
@ProcAdminID varchar(12),
@StartDate datetime = null,
@EndDate datetime = null,
@Enable bit = 1

AS

DECLARE @UserUID bigint
DECLARE @AppliedStatus smallint


SELECT @UserUID = UserUID, @AppliedStatus = Status
FROM Users_Master 
WHERE UserID = @UserID

IF(@ProcDate IS NULL)
BEGIN
	SET @ProcDate = getdate()
END

IF(@StartDate IS NULL)
BEGIN
	SET @StartDate = getdate()
END
IF(@EndDate IS NULL)
BEGIN
	SET @EndDate = '9999-12-31'
END

SET @AppliedStatus = (@AppliedStatus | @Status)

INSERT UserPauseLog(Status, AppliedStatus, UserUID, Cause, ProcDate, ProcAdminID,
 StartDate, EndDate, Enable)
VALUES(@Status, @AppliedStatus, @UserUID, @Cause, @ProcDate, @ProcAdminID,
 @StartDate, @EndDate, @Enable)

UPDATE Users_Master
SET Status = @AppliedStatus
WHERE UserID = @UserID

RETURN @@rowcount




GO
/****** Object:  StoredProcedure [dbo].[usp_Optisp_Create_ShaiyaAccount]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  Stored Procedure dbo.usp_Optisp_Create_ShaiyaAccount    Script Date: 2008-6-7 18:34:05 ******/
/*==================================================
@author	lenasoft
@date	2006-12-27
@return	
@brief	Create User(For China/Vet)
==================================================*/
CREATE Proc [dbo].[usp_Optisp_Create_ShaiyaAccount]

@UserID varchar(18),
@Pw varchar(18)


AS

SET NOCOUNT ON
--SET XACT_ABORT ON

DECLARE 
@UserUID 	int,
@AdultAuthDate 	datetime,
@Admin 		bit,
@AdminLevel 	tinyint,
@UseQueue 	bit,
@Leave 		tinyint,
@UserType 	char

--(For China)
--------------------------------------------------------------->
DECLARE
@UserName 	varchar(20),
@SocialNo1 	char(6),
@SocialNo2 	char(7),
@Email 		varchar(100),
@PostNo 	char(7),
@Addr1 		varchar(100),
@Addr2 		varchar(100),
@Phone1 	varchar(3),
@Phone2 	varchar(4),
@Phone3 	varchar(4),

@Mobile1 	varchar(3),
@Mobile2 	varchar(4),
@Mobile3 	varchar(4),
@PwQuestion 	varchar(100),
@PwAnswer 	varchar(20),
@NewsLetter 	bit,
@Sms 		bit,
@AdultAuth 	bit,
@Job 		varchar(50),
@Status 		smallint,

@Ret		int

SET @UserName = ''
SET @SocialNo1 = ''
SET @SocialNo2 = ''
SET @Email = ''
SET @PostNo = ''
SET @Addr1 = ''
SET @Addr2 = ''
SET @Phone1 = ''
SET @Phone2 = ''
SET @Phone3 = ''

SET @Mobile1 = ''
SET @Mobile2 = ''
SET @Mobile3 = ''
SET @PwQuestion = ''
SET @PwAnswer = ''
SET @NewsLetter = 1
SET @Sms  = 1
SET @AdultAuth  = 1
SET @Job  = ''
SET @Status  = 0
----------------------------------------------------------------<


SET @AdultAuthDate	= GETDATE()
SET @Admin		= 0
SET @AdminLevel		= 0
SET @UseQueue		= 0
SET @Leave		= 0
SET @UserType		= 'N'

SET @UserID		= LTRIM(RTRIM(@UserID))
SET @Pw		= LTRIM(RTRIM(@Pw))
SET @UserName		= LTRIM(RTRIM(@UserName))
SET @SocialNo1		= LTRIM(RTRIM(@SocialNo1))
SET @SocialNo2		= LTRIM(RTRIM(@SocialNo2))
SET @Email		= LTRIM(RTRIM(@Email))
SET @PostNo		= LTRIM(RTRIM(@PostNo))
SET @Addr1		= LTRIM(RTRIM(@Addr1))
SET @Addr2		= LTRIM(RTRIM(@Addr2))
SET @PwQuestion	= LTRIM(RTRIM(@PwQuestion))
SET @PwAnswer		= LTRIM(RTRIM(@PwAnswer))
SET @Job		= LTRIM(RTRIM(@Job))


SET @Ret = 0


IF ( LEN(@UserID) < 5 )
BEGIN
	RETURN @Ret
END

IF ( LEN(@Pw) < 5 )
BEGIN
	RETURN @Ret
END


BEGIN TRAN

SELECT @UserUID = (MAX(UserUID)+1) FROM Users_Master

INSERT INTO Users_Detail(UserUID,UserID,UserName,SocialNo1,SocialNo2,PwQuestion,PwAnswer,Email,PostNo,Addr1,
Addr2,Phone1,Phone2,Phone3,Mobile1,Mobile2,Mobile3,NewsLetter,Sms,AdultAuth, AdultAuthDate,Job)
VALUES(@UserUID,@UserID,@UserName,@SocialNo1,@SocialNo2,@PwQuestion,@PwAnswer,@Email,@PostNo,@Addr1,
@Addr2,@Phone1,@Phone2,@Phone3,@Mobile1,@Mobile2,@Mobile3,@NewsLetter,@Sms,@AdultAuth,@AdultAuthDate,@Job)

IF @@ERROR <> 0 
BEGIN
	SET @Ret = 0
	GOTO ON_ERROR
END

--SET @UserUID = IDENT_CURRENT('Users_Detail')

--Add By Titan MD5
declare @HashPassword varchar(32)
EXEC master..xp_crypt @Pw, @HashPassword OUTPUT
SET  @HashPassword = lower(@HashPassword)

INSERT INTO Users_Master(UserUID,UserID,Pw,Enpassword,Admin,AdminLevel,UseQueue,Status,Leave,UserType)
VALUES(@UserUID,@UserID,@Pw,@HashPassword ,@Admin,@AdminLevel,@UseQueue,@Status,@Leave,@UserType)
	
IF @@ERROR <> 0 
BEGIN
	SET @Ret = 0
	GOTO ON_ERROR
END

SET @Ret = 1

COMMIT TRAN
RETURN @Ret

ON_ERROR:
ROLLBACK TRAN
RETURN @Ret


--SET XACT_ABORT OFF
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Optisp_Create_ShaiyaAccount_Taiwan]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.usp_Optisp_Create_ShaiyaAccount_Taiwan    Script Date: 2008-6-7 18:34:05 ******/
-- =============================================
-- Author:		Titan
-- Create date: 2007.12.11
-- Description:	Sync OMG_GameWeb DB
-- =============================================

CREATE Proc [dbo].[usp_Optisp_Create_ShaiyaAccount_Taiwan]
@UserID varchar(18),
@Pw varchar(18),
@PwQuestion 	varchar(100),
@Email	varchar(100)

AS

SET NOCOUNT ON
--SET XACT_ABORT ON

DECLARE 
@UserUID 	int,
@AdultAuthDate 	datetime,
@Admin 		bit,
@AdminLevel 	tinyint,
@UseQueue 	bit,
@Leave 		tinyint,
@UserType 	char

--(For China)
--------------------------------------------------------------->
DECLARE
@UserName 	varchar(20),
@SocialNo1 	char(6),
@SocialNo2 	char(7),
@PostNo 	char(7),
@Addr1 		varchar(100),
@Addr2 		varchar(100),
@Phone1 	varchar(3),
@Phone2 	varchar(4),
@Phone3 	varchar(4),

@Mobile1 	varchar(3),
@Mobile2 	varchar(4),
@Mobile3 	varchar(4),
@PwAnswer 	varchar(20),
@NewsLetter 	bit,
@Sms 		bit,
@AdultAuth 	bit,
@Job 		varchar(50),
@Status 		smallint,

@Ret		int

SET @UserName = ''
SET @SocialNo1 = ''
SET @SocialNo2 = ''
SET @PostNo = ''
SET @Addr1 = ''
SET @Addr2 = ''
SET @Phone1 = ''
SET @Phone2 = ''
SET @Phone3 = ''

SET @Mobile1 = ''
SET @Mobile2 = ''
SET @Mobile3 = ''
SET @PwAnswer = ''
SET @NewsLetter = 1
SET @Sms  = 1
SET @AdultAuth  = 1
SET @Job  = ''
SET @Status  = 0
----------------------------------------------------------------<


SET @AdultAuthDate	= GETDATE()
SET @Admin		= 0
SET @AdminLevel		= 0
SET @UseQueue		= 0
SET @Leave		= 0
SET @UserType		= 'N'

SET @UserID		= LTRIM(RTRIM(@UserID))
SET @Pw		= LTRIM(RTRIM(@Pw))
SET @UserName		= LTRIM(RTRIM(@UserName))
SET @SocialNo1		= LTRIM(RTRIM(@SocialNo1))
SET @SocialNo2		= LTRIM(RTRIM(@SocialNo2))
SET @Email		= LTRIM(RTRIM(@Email))
SET @PostNo		= LTRIM(RTRIM(@PostNo))
SET @Addr1		= LTRIM(RTRIM(@Addr1))
SET @Addr2		= LTRIM(RTRIM(@Addr2))
SET @PwQuestion	= LTRIM(RTRIM(@PwQuestion))
SET @PwAnswer		= LTRIM(RTRIM(@PwAnswer))
SET @Job		= LTRIM(RTRIM(@Job))


SET @Ret = 0

IF ( LEN(@UserID) < 5 )
BEGIN
	RETURN @Ret
END

IF ( LEN(@Pw) < 5 )
BEGIN
	RETURN @Ret
END
	
Select 000

BEGIN TRAN

SELECT @UserUID = (MAX(UserUID)+1) FROM Users_Master


INSERT INTO Users_Detail(UserUID,UserID,UserName,SocialNo1,SocialNo2,PwQuestion,PwAnswer,Email,PostNo,Addr1,
Addr2,Phone1,Phone2,Phone3,Mobile1,Mobile2,Mobile3,NewsLetter,Sms,AdultAuth, AdultAuthDate,Job)
VALUES(@UserUID,@UserID,@UserName,@SocialNo1,@SocialNo2,@PwQuestion,@PwAnswer,@Email,@PostNo,@Addr1,
@Addr2,@Phone1,@Phone2,@Phone3,@Mobile1,@Mobile2,@Mobile3,@NewsLetter,@Sms,@AdultAuth,@AdultAuthDate,@Job)

IF @@ERROR <> 0 
BEGIN
	SET @Ret = 0
	GOTO ON_ERROR
END

--SET @UserUID = IDENT_CURRENT('Users_Detail')

--Add By Titan MD5
declare @HashPassword varchar(32)
EXEC master..xp_crypt @Pw, @HashPassword OUTPUT
SET  @HashPassword = lower(@HashPassword)


INSERT INTO Users_Master(UserUID,UserID,Pw,Enpassword,Admin,AdminLevel,UseQueue,Status,Leave,UserType)
VALUES(@UserUID,@UserID,@Pw,@HashPassword ,@Admin,@AdminLevel,@UseQueue,@Status,@Leave,@UserType)
	exec OMG_GameWeb.dbo.sp_CreateOmgGMGameAccount @UserUID,@UserID,@Pw,@HashPassword
IF @@ERROR <> 0 
BEGIN
	SET @Ret = 0
	GOTO ON_ERROR
END

SET @Ret = 1

COMMIT TRAN
RETURN @Ret

ON_ERROR:
ROLLBACK TRAN
RETURN @Ret


--SET XACT_ABORT OFF
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Optisp_Change_ShaiyaPass]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.usp_Optisp_Change_ShaiyaPass    Script Date: 2008-6-7 18:34:05 ******/
/*==================================================
@author	lenasoft
@date	2006-12-27
@return	
@brief	Change Password(China/Vet)
==================================================*/

CREATE Proc [dbo].[usp_Optisp_Change_ShaiyaPass]

@UserID 	varchar(18),
@NewPass 	varchar(18)

AS

SET NOCOUNT ON

SET @UserID		= LTRIM(RTRIM(@UserID))
SET @NewPass		= LTRIM(RTRIM(@NewPass))

IF ( LEN( @NewPass ) < 5 )
BEGIN
	RETURN 0 
END


UPDATE Users_Master SET Enpassword=master.dbo.fn_md5(@NewPass)  WHERE UserID=@UserID

IF( @@ERROR = 0 AND @@ROWCOUNT = 1)
BEGIN
	RETURN 1
END
ELSE
BEGIN
	RETURN 0
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Optisp_Charge_ShaiyaPoint]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.usp_Optisp_Charge_ShaiyaPoint    Script Date: 2008-6-7 18:34:05 ******/






/*==================================================
@author	lenasoft
@date	2006-12-27
@return	1-Success
	0-Fail
@brief	Shaiya Point Charge(China/Vet)
==================================================*/
CREATE Proc [dbo].[usp_Optisp_Charge_ShaiyaPoint]
@UserID 	varchar(18),
@Point		int

AS

SET NOCOUNT ON

DECLARE
@Return int

BEGIN TRAN

UPDATE Users_Master SET Point=ISNULL(Point,0)+@Point
WHERE UserID=@UserID

IF( @@ROWCOUNT = 1)
BEGIN
	-- Log Insert
	INSERT INTO UserPointChargeLog( UserID, Point ) VALUES (@UserID,@Point)
	IF( @@ERROR <> 0 ) --Error
	BEGIN	
		GOTO ERR 
	END
END
ELSE
BEGIN
	GOTO ERR
END

COMMIT TRAN
SET NOCOUNT OFF
RETURN 1


ERR:
ROLLBACK TRAN
SET NOCOUNT OFF
RETURN -1






GO
/****** Object:  StoredProcedure [dbo].[usp_Read_Char_Items_Simple_R]    Script Date: 4/25/2024 8:59:40 AM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Read_LoginLog_R]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  Stored Procedure dbo.usp_Read_LoginLog_R    Script Date: 2008-6-7 18:34:05 ******/



CREATE Proc [dbo].[usp_Read_LoginLog_R]

/*

Created by frsunny@hotmail.com, 2004-09-20
로그인 / 로그아웃 로그 읽기

*/


@UserID varchar(18) = '',
@UserIP varchar(15) = '',
@StDate datetime,
@EnDate datetime,
@UserUID int = -1,
@Flag_ID bit = 0,
@Flag_IP bit = 0,
@Cond varchar(200) = '',
@Sql varchar(1000) = ''

AS

-- 걍 날 SQL로 때려넣을께요 ^^
-- 파라미터들 꼭 Trim 해서 넣어주세요..

IF(@UserID <> '')
BEGIN
	SET @Flag_ID = 1

END

IF(@UserIP <> '')
BEGIN
	SET @Flag_IP = 1

END

-- ID만 있을때..

IF( @Flag_ID = 1 AND @Flag_IP = 0)
BEGIN

	SELECT M.UserID, L.SessionID, L.UserIP, L.LoginTime, L.LogoutTime, L.LoginType, E.ErrType, E.ErrMsg

	FROM UserLoginLog L INNER JOIN ErrTypeDefs E
	ON L.ErrType = E.ErrType

	INNER JOIN Users_Master M
	ON M.UserUID = L.UserUID

	WHERE M.UserID = @UserID 
	AND (LoginTime >= @StDate AND LoginTime <= @EnDate)
	

END

-- IP만 있을때..

ELSE IF( @Flag_ID = 0 AND @Flag_IP = 1)
BEGIN

	SELECT M.UserID, L.SessionID, L.UserIP, L.LoginTime, L.LogoutTime, L.LoginType, E.ErrType, E.ErrMsg

	FROM UserLoginLog L INNER JOIN ErrTypeDefs E
	ON L.ErrType = E.ErrType

	INNER JOIN Users_Master M
	ON M.UserUID = L.UserUID

	WHERE L.UserIP = @UserIP
	AND (LoginTime >= @StDate AND LoginTime <= @EnDate)
	

END

-- 둘다 있을때

ELSE IF( @Flag_ID = 1 AND @Flag_IP = 0)
BEGIN

	SELECT M.UserID, L.SessionID, L.UserIP, L.LoginTime, L.LogoutTime, L.LoginType, E.ErrType, E.ErrMsg

	FROM UserLoginLog L INNER JOIN ErrTypeDefs E
	ON L.ErrType = E.ErrType

	INNER JOIN Users_Master M
	ON M.UserUID = L.UserUID

	WHERE M.UserID = @UserID AND L.UserIP = @UserIP
	AND (LoginTime >= @StDate AND LoginTime <= @EnDate)	

END







GO
/****** Object:  StoredProcedure [dbo].[usp_Try_GameLogout_R]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.usp_Try_GameLogout_R    Script Date: 2008-6-7 18:34:05 ******/
CREATE        Proc [dbo].[usp_Try_GameLogout_R]

/* 
Created by humanws, 2005-10-18
로그아웃 로그 저장
*/

@UserUID int,
@SessionID bigint,
@LogoutType smallint = 0,
@ErrType int = 0

AS

SET NOCOUNT ON

DECLARE @LogTime datetime
DECLARE @Sql nvarchar(4000)
DECLARE @yyyy varchar(4)
DECLARE @mm varchar(2)
DECLARE @dd varchar(2)
DECLARE @LogType bit	-- Login:0, Logout:1

SET @LogType = 1
SET @LogTime = GETDATE()
SET @yyyy = DATEPART(yyyy, @LogTime)
SET @mm = DATEPART(mm, @LogTime)
SET @dd = DATEPART(dd, @LogTime)

IF( LEN(@mm) = 1 )
BEGIN
	SET @mm = '0' + @mm
END

IF( LEN(@dd) = 1 )
BEGIN
	SET @dd = '0' + @dd
END

SET @Sql = N'
INSERT INTO PS_GameLog.dbo.UserLog
(SessionID, UserUID, LogType, LogTime, LogoutType, ErrType)
VALUES(@SessionID, @UserUID, @LogType, @LogTime, @LogoutType, @ErrType)'

EXEC sp_executesql @Sql, 
N'@SessionID bigint, @UserUID int, @LogType bit, @LogTime datetime, @LogoutType smallint, @ErrType int',
@SessionID, @UserUID, @LogType, @LogTime, @LogoutType, @ErrType

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Try_GameLogin_Taiwan]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  Stored Procedure dbo.usp_Try_GameLogin_Taiwan    Script Date: 2008-6-7 18:34:05 ******/

/*==================================================
@date	2007-12-04
@brief	Login Proc( Taiwan )
==================================================*/

CREATE  Proc [dbo].[usp_Try_GameLogin_Taiwan]

@UserID 	varchar(18),
@InPassword	varchar(32),

@SessionID 	bigint,
@UserIP 	varchar(15),

-- 罹晦梱雖 蹂 檣濠, 釭該雖朝 頂睡 滲熱

@UserUID 	int = 0,
@LoginType 	smallint = 1, 
@LoginTime 	datetime = NULL

AS

SET NOCOUNT ON

DECLARE 

@Leave 		tinyint,
@Status 		smallint,

@CompanyIP 	varchar(15),
@TempIP 	varchar(15),
@Check		int

SET @Status =		 -1
SET @LoginTime = 	GETDATE()

--------------------------------------------------
SET @CompanyIP = 	'61.107.81'
SET @UserIP =		LTRIM( RTRIM(@UserIP) )
--------------------------------------------------
SET @Check = 0
--------------------------------------------------

SELECT @UserUID=UserUID, @Status=Status, @Leave=Leave FROM Users_Master WHERE UserID = @UserID

-- NotExist User OR Leave User
IF( @UserUID = 0 OR @Leave = 1 )
BEGIN
	SET @Status = -3
END
ELSE
BEGIN
	-- Check Password
	EXEC dbo.sp_LoginSuccessCheck @UserID, @InPassword, @Check output
	IF ( @@ERROR = 0 )
	BEGIN
		IF( @Check <> 1 )
		BEGIN
			SET @Status = -1
		END
	END
	ELSE
	BEGIN
		SET @Status = -1
	END

	/* Old
	SET @InEnPassword = master.dbo.fn_md5(@InPassword)
	IF ( @InEnPassword <> @EnPassword )
	BEGIN
		SET @Status = -1
	END
	*/
END

-- BlockUser Check
IF( (@Status >= 2) AND (@Status <= 6) )
BEGIN
	-- Get Block Limit Date AND Replace date text
	DECLARE @BlockEndDate datetime
	SELECT @BlockEndDate = BlockEndDate FROM Users_Block WHERE UserUID = @UserUID
	IF ( @@ROWCOUNT <> 0 )
	BEGIN
		-- Block Release
		IF ( @BlockEndDate <= @LoginTime )
		BEGIN
			SET @Status = 0
			UPDATE Users_Master SET Status = @Status WHERE UserUID = @UserUID
		END
	END
END

-- Admin IP Check(2006-02-21)
/*
IF( @Status = 16 OR @Status = 32 OR @Status = 48 OR @Status = 64 OR @Status = 80 )
BEGIN
	SET @TempIP = LEFT(@UserIP, 9)
	IF( @TempIP <> @CompanyIP )
	BEGIN
		SET @Status = -999
	END
END
*/

-- Select 
SELECT @Status AS Status, @UserUID AS UserUID

-- Log Insert
IF( @Status = 0 OR @Status = 16 OR @Status = 32 OR @Status = 48 OR @Status = 64 OR @Status = 80 )
BEGIN
	EXEC usp_Insert_LoginLog_E @SessionID=@SessionID, @UserUID=@UserUID, @UserIP=@UserIP, @LogType=0, @LogTime=@LoginTime, @LoginType=@LoginType
END
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Try_GameLogin3_R]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  Stored Procedure dbo.usp_Try_GameLogin3_R    Script Date: 2008-6-7 18:34:05 ******/




/*==================================================
@date	2007-09-27
@brief	Login Proc( Korea Test Server & Japan Server )
==================================================*/

CREATE  Proc [dbo].[usp_Try_GameLogin3_R]

@UserID 	varchar(18),
@InPassword	varchar(18),

@SessionID 	bigint,
@UserIP 	varchar(15),

-- 여기까지 필요한 인자, 나머지는 내부 변수

@UserUID 	int = 0,
@LoginType 	smallint = 1, 
@LoginTime 	datetime = null

AS

SET NOCOUNT ON

DECLARE 
@EnPassword	varchar(32),
@InEnPassword	varchar(32),

@Leave 		tinyint,
@Status 	smallint,

@CompanyIP 	varchar(15),
@TempIP 	varchar(15)

SET @Status =		 -1
SET @LoginTime = 	GETDATE()

SET @CompanyIP = 	'61.107.81'
SET @UserIP =		LTRIM( RTRIM(@UserIP) )


SELECT @UserUID=UserUID, @EnPassword=Enpassword, @Status=Status, @Leave=Leave FROM Users_Master WHERE UserID = @UserID

-- NotExist User OR Leave User
IF( @UserUID = 0 OR @Leave = 1 )
BEGIN
	SET @Status = -3
END
ELSE
BEGIN
	-- Check Password
	SET @InEnPassword = master.dbo.fn_md5(@InPassword)
	IF ( @InEnPassword <> @EnPassword )
	BEGIN
		SET @Status = -1
	END
END

-- BlockUser Check
IF( (@Status >= 2) AND (@Status <= 6) )
BEGIN
	-- Get Block Limit Date AND Replace date text
	DECLARE @BlockEndDate datetime
	SELECT @BlockEndDate = BlockEndDate FROM Users_Block WHERE UserUID = @UserUID
	IF ( @@ROWCOUNT <> 0 )
	BEGIN
		-- Block Release
		IF ( @BlockEndDate <= @LoginTime )
		BEGIN
			SET @Status = 0
			UPDATE Users_Master SET Status = @Status WHERE UserUID = @UserUID
		END
	END
END

-- Admin IP Check(2006-02-21)
/*
IF( @Status = 16 OR @Status = 32 OR @Status = 48 OR @Status = 64 OR @Status = 80 )
BEGIN
	SET @TempIP = LEFT(@UserIP, 9)
	IF( @TempIP <> @CompanyIP )
	BEGIN
		SET @Status = -999
	END
END
*/

-- Select 
SELECT @Status AS Status, @UserUID AS UserUID

-- Log Insert
IF( @Status = 0 OR @Status = 16 OR @Status = 32 OR @Status = 48 OR @Status = 64 OR @Status = 80 )
BEGIN
	EXEC usp_Insert_LoginLog_E @SessionID=@SessionID, @UserUID=@UserUID, @UserIP=@UserIP, @LogType=0, @LogTime=@LoginTime, @LoginType=@LoginType
END


SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [dbo].[usp_Update_UserPoint]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  Stored Procedure dbo.usp_Update_UserPoint    Script Date: 2008-6-7 18:34:05 ******/
CREATE Proc [dbo].[usp_Update_UserPoint]
@UserUID int,
@UsePoint int

AS

SET NOCOUNT ON

DECLARE 
@UserPoint int

SELECT @UserPoint= ISNULL(Point,0) FROM Users_Master WHERE UserUID=@UserUID
IF ( @@ROWCOUNT=0 OR @UserPoint-@UsePoint < 0 )
BEGIN
	UPDATE Users_Master SET Point=0 WHERE UserUID=@UserUID
	RETURN -1
END

UPDATE Users_Master SET Point=ISNULL(Point,0)-@UsePoint WHERE UserUID=@UserUID
IF( @@ERROR<>0 )
BEGIN
	RETURN -1
END

RETURN 1

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_Update_UserStatus]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  Stored Procedure dbo.usp_Update_UserStatus    Script Date: 2008-6-7 18:34:05 ******/






/*==================================================
@author	lenasoft
@date	2006-10-27
@return	
@brief	상태변경.
==================================================*/
CREATE  Proc [dbo].[usp_Update_UserStatus]
@UserUID 	int,
@Status		smallint,
@BlockEndDate 	datetime = null,
@GmID		varchar(32) = null
AS

SET NOCOUNT ON

DECLARE
@ReturnValue int

BEGIN TRAN

UPDATE Users_Master SET Status = @Status WHERE UserUID = @UserUID

IF @@ERROR <> 0
GOTO ERROR

-- Block Set
IF ( @Status = 2 )
BEGIN
	IF EXISTS ( SELECT UserUID FROM Users_Block WHERE UserUID = @UserUID )
	BEGIN
		UPDATE Users_Block SET BlockEndDate = @BlockEndDate
			WHERE UserUID = @UserUID
	END
	ELSE
	BEGIN
		
		INSERT INTO Users_Block ( UserUID, BlockEndDate)
			VALUES( @UserUID, @BlockEndDate )
	END
END

IF @@ERROR <> 0
GOTO ERROR

-- InsertLog
IF ( @GmID IS NOT NULL )
BEGIN
	INSERT INTO Users_BlockLog ( UserUID, Status, BlockEndDate, GmID, InsertDate) 
		VALUES( @UserUID, @Status, @BlockEndDate, @GmID, GETDATE()  )
	IF @@ERROR <> 0
	GOTO ERROR
END


SET @ReturnValue = 1
COMMIT TRAN
SET NOCOUNT OFF
RETURN @ReturnValue

ERROR:
SET @ReturnValue = -1
ROLLBACK TRAN
SET NOCOUNT OFF
RETURN @ReturnValue







GO
/****** Object:  StoredProcedure [dbo].[uxp_CreateDB]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.uxp_CreateDB    Script Date: 2008-6-7 18:34:05 ******/















CREATE      Proc [dbo].[uxp_CreateDB]

/* 

Created by humanws, 2005-10-18
유저로그DB 월별로 생성하는 프로시저

*/

@Dest1 varchar(200), -- 맨 마지막에 \ 까지 입력
@Dest2 varchar(200), -- 맨 마지막에 \ 까지 입력
@DBName varchar(50) = 'PS_UserLog',
@DBDate datetime,
@ServerName varchar(50) = ''

AS

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
DECLARE @DD int
DECLARE @DDc varchar(2)

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

-- CREATE DATABASE 시작부분 / PRIMARY 까지
--[ServerName]__[CatalogName]_[Filegroup].m(n)df

SET @Sql1 = 

'
CREATE DATABASE [' + @DBName + ']
ON
PRIMARY
( NAME = ' + @DBName + '_PRIMARY,
  FILENAME = ''' + @dest1 + @ServerName + '__' + @DBName + '_PRIMARY.mdf'',
  SIZE = 5MB,
  FILEGROWTH = 2MB )
'

-- @Sql2 = Filegroup Model Script

SET @Sql2 = 

'

, FILEGROUP  FG[DD]
( NAME = ' + @DBName + '_FG[DD],
  FILENAME = ''' + @dest1 + @ServerName + '__' + @DBName + '_FG[DD].ndf'',
  SIZE = 5MB,
  FILEGROWTH = 2MB
)
'

-- 저장되는 파라미터 초기화

SET @Sql4 = ''

-- WHILE 돌려서 파일그룹 얻어냄

WHILE ( @Cnt <= @DayMax )
BEGIN

	SET @DDc = CAST ( @Cnt AS varchar(2) )
	
	IF( LEN ( @DDc ) = 1 )
	BEGIN
	
		SET @DDc = '0' + @DDc
	
	END
	
	SET @Sql3 = @Sql2
	
	SET @Sql3 = REPLACE(@Sql3, '[DD]', @DDc)
	
	SET @Sql4 = @Sql4 + @Sql3
	
	SET @Cnt = @Cnt + 1	

END

-- 로그 설정


SET @Sql5 = 

'
LOG ON
( NAME = ' + @DBName + '_Log,
   FILENAME = ''' + @dest2 + @ServerName + '__' + @DBName + '_Log.ldf'',
   SIZE = 5MB,
   FILEGROWTH = 2MB 
)

'


EXEC (@Sql1 + @Sql4 + @Sql5)








GO
/****** Object:  StoredProcedure [dbo].[uxp_CreateTable]    Script Date: 4/25/2024 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Stored Procedure dbo.uxp_CreateTable    Script Date: 2008-6-7 18:34:05 ******/
CREATE         Proc [dbo].[uxp_CreateTable]

/*

Created by humanws, 2005-10-18
유저로그DB 일별로 테이블 만들어주는 쿼리

*/

@DBName varchar(50) = 'PS_UserLog',
@DBDate datetime

AS

-- 필수 내장 변수

DECLARE @SqlTbl varchar(8000)
DECLARE @SqlIdx varchar(8000)

DECLARE @Sql1 varchar(4000)
DECLARE @Sql2 varchar(4000)
DECLARE @Sql3 varchar(100)

DECLARE @StDate datetime
DECLARE @EnDate datetime

DECLARE @Cnt int
DECLARE @DayMax int

DECLARE @YYYY varchar(4)
DECLARE @MM varchar(2)
DECLARE @DD varchar(2)

DECLARE @Date1 datetime
DECLARE @Date2 datetime

DECLARE @Tempyyyy1 varchar(4)
DECLARE @Tempyyyy2 varchar(4)
DECLARE @Tempmm1 varchar(2)
DECLARE @Tempmm2 varchar(2)
DECLARE @Tempdd1 varchar(2)
DECLARE @Tempdd2 varchar(2)

DECLARE @Date1c varchar(30)
DECLARE @Date2c varchar(30)

-- 날짜 셋팅



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

-- DB 사용 스크립트

SET @Sql3 = 'USE ' + @DBName 


-- 테이블 생성 스크립트 선언

SET @SqlTbl = '

CREATE TABLE dbo.UserLog[DD] (
	RowID int IDENTITY (1, 1) NOT NULL ,
	SessionID bigint NOT NULL ,
	UserUID int NOT NULL ,
	UserIP varchar(15) NULL ,
	LogType bit NOT NULL,
	LogTime datetime NULL ,
	LoginType smallint NULL,
	LogoutType smallint NULL,
	ErrType int NULL ,
	CONSTRAINT PK_UserLog[DD]_RowID PRIMARY KEY NONCLUSTERED 
	(
		RowID
	)  ON FG[DD]
) ON FG[DD]

'

-- 인덱스 생성 스크립트 선언

SET @SqlIdx = 

'
CREATE  CLUSTERED  INDEX IX_UserLog[DD]_UserUID 
ON dbo.UserLog[DD](UserUID) ON FG[DD]

CREATE  INDEX IX_UserLog[DD]_SessionID 
ON dbo.UserLog[DD](SessionID) ON FG[DD]

'

-- 테이블 생성

SET @Cnt = 1

WHILE( @Cnt <= @DayMax)
BEGIN

	-- 날짜 번호 구하기
	
	SET @DD = CAST( @Cnt AS varchar(2) )

	IF ( LEN(@DD) = 1 )
	BEGIN
		SET @DD = '0' + @DD
	END 	

	-- 앞날짜 뒷날짜 구하기

	SET @Date1 = CAST(@YYYY + '-' + @MM + '-' + @DD AS datetime)
	SET @Date2 = DATEADD(dd, 1, @Date1)

	-- 각 part 별 날짜데이터 구하기

	-- 앞날짜
	
	SET @Tempyyyy1 = DATEPART(yyyy, @Date1)
	SET @Tempmm1 = DATEPART(mm, @Date1)

	IF( LEN ( @Tempmm1 ) = 1 )
	BEGIN
		SET @Tempmm1 = '0' + @Tempmm1
	END

	SET @Tempdd1 = DATEPART(dd, @Date1)

	IF( LEN ( @Tempdd1 ) = 1 )
	BEGIN
		SET @Tempdd1 = '0' + @Tempdd1
	END

	SET @Date1c = @Tempyyyy1 + '-' + @Tempmm1 + '-' + @Tempdd1 + ' 00:00:00'

	-- 뒷날짜

	SET @Tempyyyy2 = DATEPART(yyyy, @Date2)
	SET @Tempmm2 = DATEPART(mm, @Date2)

	IF( LEN ( @Tempmm2 ) = 1 )
	BEGIN
		SET @Tempmm2 = '0' + @Tempmm2
	END

	SET @Tempdd2 = DATEPART(dd, @Date2)

	IF( LEN ( @Tempdd2 ) = 1 )
	BEGIN
		SET @Tempdd2 = '0' + @Tempdd2
	END

	SET @Date2c = @Tempyyyy2 + '-' + @Tempmm2 + '-' + @Tempdd2 + ' 00:00:00'



	SET @Sql1 = @SqlTbl
	SET @Sql1 = REPLACE(@Sql1, '[DD]', @DD)
	SET @Sql1 = REPLACE(@Sql1, '[Date1]', @Date1c)
	SET @Sql1 = REPLACE(@Sql1, '[Date2]', @Date2c)

	EXEC(@Sql3 + @Sql1)
--	SELECT (@Sql3 + @Sql1)

	SET @Cnt = @Cnt + 1

END

-- 인덱스 생성

SET @Cnt = 1

WHILE( @Cnt <= @DayMax)
BEGIN

SET @DD = CAST( @Cnt AS varchar(2) )

	IF ( LEN(@DD) = 1 )
	BEGIN
		SET @DD = '0' + @DD
	END 	

	SET @Sql2 = @SqlIdx
	SET @Sql2 = REPLACE(@Sql2, '[DD]', @DD)

	EXEC(@Sql3 + @Sql2)
--	SELECT (@Sql3 + @Sql2)

	SET @Cnt = @Cnt + 1

END
GO
USE [master]
GO
ALTER DATABASE [PS_UserData] SET  READ_WRITE 
GO
