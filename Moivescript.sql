USE [master]
GO
/****** Object:  Database [Moive]    Script Date: 2/7/2024 7:45:56 PM ******/
CREATE DATABASE [Moive]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Moive', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Moive.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Moive_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Moive_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Moive] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Moive].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Moive] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Moive] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Moive] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Moive] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Moive] SET ARITHABORT OFF 
GO
ALTER DATABASE [Moive] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Moive] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Moive] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Moive] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Moive] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Moive] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Moive] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Moive] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Moive] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Moive] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Moive] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Moive] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Moive] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Moive] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Moive] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Moive] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Moive] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Moive] SET RECOVERY FULL 
GO
ALTER DATABASE [Moive] SET  MULTI_USER 
GO
ALTER DATABASE [Moive] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Moive] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Moive] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Moive] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Moive] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Moive] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Moive', N'ON'
GO
ALTER DATABASE [Moive] SET QUERY_STORE = ON
GO
ALTER DATABASE [Moive] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Moive]
GO
/****** Object:  Table [dbo].[actors]    Script Date: 2/7/2024 7:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actors](
	[actor_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[directors]    Script Date: 2/7/2024 7:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[directors](
	[director_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[director_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 2/7/2024 7:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[genre_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_genres]    Script Date: 2/7/2024 7:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_genres](
	[movie_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 2/7/2024 7:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[movie_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[release_date] [date] NULL,
	[director_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 2/7/2024 7:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[review_id] [int] NOT NULL,
	[movie_id] [int] NULL,
	[reviewer_name] [varchar](100) NULL,
	[rating] [float] NULL,
	[comment] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[actors] ([actor_id], [name]) VALUES (1, N'Actor1')
INSERT [dbo].[actors] ([actor_id], [name]) VALUES (2, N'Actor2')
INSERT [dbo].[actors] ([actor_id], [name]) VALUES (3, N'Actor3')
INSERT [dbo].[actors] ([actor_id], [name]) VALUES (4, N'Actor4')
INSERT [dbo].[actors] ([actor_id], [name]) VALUES (5, N'Actor5')
GO
INSERT [dbo].[directors] ([director_id], [name]) VALUES (1, N'Director1')
INSERT [dbo].[directors] ([director_id], [name]) VALUES (2, N'Director2')
INSERT [dbo].[directors] ([director_id], [name]) VALUES (3, N'Director3')
INSERT [dbo].[directors] ([director_id], [name]) VALUES (4, N'Director4')
INSERT [dbo].[directors] ([director_id], [name]) VALUES (5, N'Director5')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (1, N'Action')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (2, N'Comedy')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (3, N'Drama')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (4, N'Sci-Fi')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (5, N'Thriller')
GO
INSERT [dbo].[movie_genres] ([movie_id], [genre_id]) VALUES (1, 1)
INSERT [dbo].[movie_genres] ([movie_id], [genre_id]) VALUES (2, 2)
INSERT [dbo].[movie_genres] ([movie_id], [genre_id]) VALUES (3, 3)
INSERT [dbo].[movie_genres] ([movie_id], [genre_id]) VALUES (4, 4)
INSERT [dbo].[movie_genres] ([movie_id], [genre_id]) VALUES (5, 5)
GO
INSERT [dbo].[movies] ([movie_id], [title], [release_date], [director_id]) VALUES (1, N'Movie1', CAST(N'2023-01-01' AS Date), 1)
INSERT [dbo].[movies] ([movie_id], [title], [release_date], [director_id]) VALUES (2, N'Movie2', CAST(N'2023-02-01' AS Date), 2)
INSERT [dbo].[movies] ([movie_id], [title], [release_date], [director_id]) VALUES (3, N'Movie3', CAST(N'2023-03-01' AS Date), 3)
INSERT [dbo].[movies] ([movie_id], [title], [release_date], [director_id]) VALUES (4, N'Movie4', CAST(N'2023-04-01' AS Date), 4)
INSERT [dbo].[movies] ([movie_id], [title], [release_date], [director_id]) VALUES (5, N'Movie5', CAST(N'2023-05-01' AS Date), 5)
GO
INSERT [dbo].[reviews] ([review_id], [movie_id], [reviewer_name], [rating], [comment]) VALUES (1, 1, N'Reviewer1', 4.5, N'Great movie!')
INSERT [dbo].[reviews] ([review_id], [movie_id], [reviewer_name], [rating], [comment]) VALUES (2, 2, N'Reviewer2', 3.8, N'Funny and entertaining')
INSERT [dbo].[reviews] ([review_id], [movie_id], [reviewer_name], [rating], [comment]) VALUES (3, 3, N'Reviewer3', 4, N'Touching story')
INSERT [dbo].[reviews] ([review_id], [movie_id], [reviewer_name], [rating], [comment]) VALUES (4, 4, N'Reviewer4', 5, N'Amazing sci-fi')
INSERT [dbo].[reviews] ([review_id], [movie_id], [reviewer_name], [rating], [comment]) VALUES (5, 5, N'Reviewer5', 4.2, N'Thrilling plot')
GO
ALTER TABLE [dbo].[movie_genres]  WITH CHECK ADD FOREIGN KEY([genre_id])
REFERENCES [dbo].[genres] ([genre_id])
GO
ALTER TABLE [dbo].[movie_genres]  WITH CHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[movies] ([movie_id])
GO
ALTER TABLE [dbo].[movies]  WITH CHECK ADD  CONSTRAINT [your_new_foreign_key_name] FOREIGN KEY([director_id])
REFERENCES [dbo].[directors] ([director_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[movies] CHECK CONSTRAINT [your_new_foreign_key_name]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[movies] ([movie_id])
GO
USE [master]
GO
ALTER DATABASE [Moive] SET  READ_WRITE 
GO
