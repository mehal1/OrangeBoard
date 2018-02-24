USE [OrangeBoard]
GO
/****** Object:  Table [dbo].[AlumniRecord]    Script Date: 11/22/2017 10:10:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlumniRecord](
	[AlumniName] [varchar](50) NOT NULL,
	[AlumniId] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[positionInCompany] [varchar](50) NULL,
	[OtherRecord] [varchar](150) NULL,
	[CGPA] [decimal](4, 2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/22/2017 10:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [varchar](50) NOT NULL,
	[CourseTitle] [varchar](50) NOT NULL,
	[TotalSeats] [varchar](50) NOT NULL,
	[InstructorId] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 11/22/2017 10:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorId] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[emailId] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[zip] [varchar](50) NOT NULL,
	[NumberOfCourses] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OTP]    Script Date: 11/22/2017 10:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OTP](
	[PhoneNumber] [varchar](50) NOT NULL,
	[OTP] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegisteredInfo]    Script Date: 11/22/2017 10:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisteredInfo](
	[StudentId] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/22/2017 10:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[Full Name] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
