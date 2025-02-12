USE [master]
GO
/****** Object:  Database [IAb221_SabirovU]    Script Date: 20.11.2024 18:54:54 ******/
CREATE DATABASE [IAb221_SabirovU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IAb221_SabirovU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IAb221_SabirovU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IAb221_SabirovU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IAb221_SabirovU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IAb221_SabirovU] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IAb221_SabirovU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IAb221_SabirovU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET ARITHABORT OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IAb221_SabirovU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IAb221_SabirovU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IAb221_SabirovU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IAb221_SabirovU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET RECOVERY FULL 
GO
ALTER DATABASE [IAb221_SabirovU] SET  MULTI_USER 
GO
ALTER DATABASE [IAb221_SabirovU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IAb221_SabirovU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IAb221_SabirovU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IAb221_SabirovU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IAb221_SabirovU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IAb221_SabirovU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IAb221_SabirovU', N'ON'
GO
ALTER DATABASE [IAb221_SabirovU] SET QUERY_STORE = ON
GO
ALTER DATABASE [IAb221_SabirovU] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IAb221_SabirovU]
GO
/****** Object:  Table [dbo].[Award]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Award](
	[AwardId] [int] IDENTITY(1,1) NOT NULL,
	[AwardName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AwardStudent]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AwardStudent](
	[AwardId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[DateOfDelivery] [date] NOT NULL,
	[PlaceOfDelivery] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AwardId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[DisciplineId] [int] IDENTITY(1,1) NOT NULL,
	[DisciplineName] [varchar](100) NOT NULL,
	[CountOfHours] [int] NOT NULL,
	[BriefDescripiton] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DisciplineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [int] NOT NULL,
 CONSTRAINT [PK__Grade__54F87A57B10AEA4C] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hobbies]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hobbies](
	[HobbieId] [int] IDENTITY(1,1) NOT NULL,
	[HobbieName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HobbieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HobbieStudent]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HobbieStudent](
	[HobbieId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HobbieId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Performance]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performance](
	[DisciplineId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[DateGrade] [date] NULL,
	[GradeCharacteristic] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DisciplineId] ASC,
	[TeacherId] ASC,
	[StudentId] ASC,
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentSurname] [varchar](50) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[StudentPatronymic] [varchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[HomeAdress] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[DateOfAdmissionToUniversity] [date] NULL,
	[School] [varchar](100) NULL,
	[GroupId] [int] NULL,
	[Scholarship] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherSurname] [varchar](50) NOT NULL,
	[TeacherName] [varchar](50) NOT NULL,
	[TeacherPatronymic] [varchar](50) NULL,
	[PhotoOfTheTeacher] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherDisciplineGroup]    Script Date: 20.11.2024 18:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherDisciplineGroup](
	[TeacherId] [int] NOT NULL,
	[DisciplineId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC,
	[DisciplineId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Award] ON 

INSERT [dbo].[Award] ([AwardId], [AwardName]) VALUES (1, N'Лучший студент')
INSERT [dbo].[Award] ([AwardId], [AwardName]) VALUES (2, N'Отличник')
SET IDENTITY_INSERT [dbo].[Award] OFF
GO
INSERT [dbo].[AwardStudent] ([AwardId], [StudentId], [DateOfDelivery], [PlaceOfDelivery]) VALUES (1, 1, CAST(N'2023-06-15' AS Date), N'Университет')
INSERT [dbo].[AwardStudent] ([AwardId], [StudentId], [DateOfDelivery], [PlaceOfDelivery]) VALUES (1, 3, CAST(N'2024-11-14' AS Date), N'Университет')
INSERT [dbo].[AwardStudent] ([AwardId], [StudentId], [DateOfDelivery], [PlaceOfDelivery]) VALUES (2, 2, CAST(N'2023-06-20' AS Date), N'Университет')
INSERT [dbo].[AwardStudent] ([AwardId], [StudentId], [DateOfDelivery], [PlaceOfDelivery]) VALUES (2, 4, CAST(N'2024-11-10' AS Date), N'Университет')
GO
SET IDENTITY_INSERT [dbo].[Discipline] ON 

INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName], [CountOfHours], [BriefDescripiton]) VALUES (1, N'Математика', 120, NULL)
INSERT [dbo].[Discipline] ([DisciplineId], [DisciplineName], [CountOfHours], [BriefDescripiton]) VALUES (2, N'Физика', 100, NULL)
SET IDENTITY_INSERT [dbo].[Discipline] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (1, 5)
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (2, 4)
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (3, 3)
INSERT [dbo].[Grade] ([GradeId], [GradeName]) VALUES (4, 2)
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (1, N'ИАб-221')
INSERT [dbo].[Group] ([GroupId], [GroupName]) VALUES (2, N'ИАб-231')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Hobbies] ON 

INSERT [dbo].[Hobbies] ([HobbieId], [HobbieName]) VALUES (1, N'Чтение')
INSERT [dbo].[Hobbies] ([HobbieId], [HobbieName]) VALUES (2, N'Рисование')
INSERT [dbo].[Hobbies] ([HobbieId], [HobbieName]) VALUES (3, N'Бодибилдинг')
INSERT [dbo].[Hobbies] ([HobbieId], [HobbieName]) VALUES (4, N'Танцы')
SET IDENTITY_INSERT [dbo].[Hobbies] OFF
GO
INSERT [dbo].[HobbieStudent] ([HobbieId], [StudentId]) VALUES (1, 1)
INSERT [dbo].[HobbieStudent] ([HobbieId], [StudentId]) VALUES (2, 2)
INSERT [dbo].[HobbieStudent] ([HobbieId], [StudentId]) VALUES (3, 2)
INSERT [dbo].[HobbieStudent] ([HobbieId], [StudentId]) VALUES (4, 2)
GO
INSERT [dbo].[Performance] ([DisciplineId], [TeacherId], [StudentId], [GradeId], [DateGrade], [GradeCharacteristic]) VALUES (1, 1, 1, 1, CAST(N'2022-11-07' AS Date), N'Ответ на уроке')
INSERT [dbo].[Performance] ([DisciplineId], [TeacherId], [StudentId], [GradeId], [DateGrade], [GradeCharacteristic]) VALUES (2, 2, 2, 2, CAST(N'2024-11-14' AS Date), N'Контрольная работа')
INSERT [dbo].[Performance] ([DisciplineId], [TeacherId], [StudentId], [GradeId], [DateGrade], [GradeCharacteristic]) VALUES (2, 2, 5, 3, CAST(N'2023-02-18' AS Date), NULL)
INSERT [dbo].[Performance] ([DisciplineId], [TeacherId], [StudentId], [GradeId], [DateGrade], [GradeCharacteristic]) VALUES (2, 2, 6, 4, CAST(N'2023-04-07' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (1, N'Смирнов', N'Алексей', N'Петрович', CAST(N'2004-05-15' AS Date), N'г.Кемерово, ул. Пушкина д.1', N'student1@kuzstu.ru', CAST(N'2022-09-01' AS Date), N'Школа №1', 1, 1001.0000)
INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (2, N'Кузнецова', N'Мария', N'Игоревна', CAST(N'2006-03-20' AS Date), N'г.Кемерово, ул. Ленина д.2', N'student2@kuzstu.ru', CAST(N'2023-09-01' AS Date), N'Школа №5', 2, 3000.0000)
INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (3, N'Сабиров', N'Улугбек', N'Илхамбаевич', CAST(N'2000-12-12' AS Date), N'г.Кемерово, пр. Ленина д.133', N'student3@kuzstu.ru', CAST(N'2022-09-01' AS Date), N'Школа №45', 1, 13700.0000)
INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (4, N'Носов', N'Александр', N'Сергеевич', CAST(N'2000-12-12' AS Date), N'г.Кемерово, ул. Ворошилова д.1В', N'student4@kuzstu.ru', CAST(N'2022-09-01' AS Date), N'Школа №45', 1, 999.0000)
INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (5, N'Титаренко', N'Виолетта', N'Аленовна', CAST(N'1980-01-01' AS Date), N'г.Мариинск, ул. Дырдина д.52', N'student100@kuzstu.ru', CAST(N'2022-09-01' AS Date), N'Школа №52', 1, 100.0000)
INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (6, N'Мамыкин', N'Пашка', N'Никитович', CAST(N'1980-01-01' AS Date), N'г.Мариинск, ул. Дягилевой д.69', N'student69@kuzstu.ru', CAST(N'2022-09-01' AS Date), N'Школа №69', 1, 6.0000)
INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (7, N'Критонова', N'Вероника', N'Николаевна', CAST(N'1999-12-29' AS Date), N'г. Кемерово, ул. Сибиряков-Гвардейцев д.11', N'student11@kuzstu.ru', CAST(N'2022-09-01' AS Date), N'Школа №11', 1, 7000.0000)
INSERT [dbo].[Student] ([StudentId], [StudentSurname], [StudentName], [StudentPatronymic], [DateOfBirth], [HomeAdress], [Email], [DateOfAdmissionToUniversity], [School], [GroupId], [Scholarship]) VALUES (8, N'Акулова', N'Елена', N'Сергеевна', CAST(N'1999-12-30' AS Date), N'г. Кемерово, ул. Ленинградский д.28', N'student28@kuzstu.ru', CAST(N'2023-09-01' AS Date), N'Школа №28', 2, 6969.0000)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [TeacherSurname], [TeacherName], [TeacherPatronymic], [PhotoOfTheTeacher]) VALUES (1, N'Иванов', N'Иван', N'Иванович', NULL)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherSurname], [TeacherName], [TeacherPatronymic], [PhotoOfTheTeacher]) VALUES (2, N'Сидоров', N'Петр', N'Петрович', NULL)
INSERT [dbo].[Teacher] ([TeacherId], [TeacherSurname], [TeacherName], [TeacherPatronymic], [PhotoOfTheTeacher]) VALUES (3, N'Терешкин', N'Михаил', N'Александрович', NULL)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
INSERT [dbo].[TeacherDisciplineGroup] ([TeacherId], [DisciplineId], [GroupId]) VALUES (1, 1, 1)
INSERT [dbo].[TeacherDisciplineGroup] ([TeacherId], [DisciplineId], [GroupId]) VALUES (2, 2, 2)
GO
ALTER TABLE [dbo].[Student] ADD  DEFAULT ('student@kuzstu.ru') FOR [Email]
GO
ALTER TABLE [dbo].[AwardStudent]  WITH CHECK ADD FOREIGN KEY([AwardId])
REFERENCES [dbo].[Award] ([AwardId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AwardStudent]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HobbieStudent]  WITH CHECK ADD FOREIGN KEY([HobbieId])
REFERENCES [dbo].[Hobbies] ([HobbieId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HobbieStudent]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Performance]  WITH CHECK ADD FOREIGN KEY([DisciplineId])
REFERENCES [dbo].[Discipline] ([DisciplineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Performance]  WITH CHECK ADD  CONSTRAINT [FK__Performan__Grade__5070F446] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Performance] CHECK CONSTRAINT [FK__Performan__Grade__5070F446]
GO
ALTER TABLE [dbo].[Performance]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Performance]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TeacherDisciplineGroup]  WITH CHECK ADD FOREIGN KEY([DisciplineId])
REFERENCES [dbo].[Discipline] ([DisciplineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherDisciplineGroup]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherDisciplineGroup]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [chk_DateOfAddmission] CHECK  ((datepart(year,[DateOfAdmissionToUniversity])>(2000)))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [chk_DateOfAddmission]
GO
USE [master]
GO
ALTER DATABASE [IAb221_SabirovU] SET  READ_WRITE 
GO
