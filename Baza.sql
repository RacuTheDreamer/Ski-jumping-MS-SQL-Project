USE [master]
GO
/****** Object:  Database [Ski_jumping]    Script Date: 08.01.2024 19:23:42 ******/
CREATE DATABASE [Ski_jumping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ski_jumping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\Ski_jumping.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ski_jumping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\Ski_jumping_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Ski_jumping] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ski_jumping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ski_jumping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ski_jumping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ski_jumping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ski_jumping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ski_jumping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ski_jumping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ski_jumping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ski_jumping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ski_jumping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ski_jumping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ski_jumping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ski_jumping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ski_jumping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ski_jumping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ski_jumping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ski_jumping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ski_jumping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ski_jumping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ski_jumping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ski_jumping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ski_jumping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ski_jumping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ski_jumping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ski_jumping] SET  MULTI_USER 
GO
ALTER DATABASE [Ski_jumping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ski_jumping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ski_jumping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ski_jumping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ski_jumping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ski_jumping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ski_jumping] SET QUERY_STORE = ON
GO
ALTER DATABASE [Ski_jumping] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Ski_jumping]
GO
/****** Object:  Table [dbo].[Druzyny]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Druzyny](
	[ID_druzyny] [int] NOT NULL,
	[Kraj] [varchar](50) NOT NULL,
	[ID_trenera] [int] NULL,
 CONSTRAINT [PK_Druzyny] PRIMARY KEY CLUSTERED 
(
	[ID_druzyny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kluby]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kluby](
	[ID_klubu] [int] NOT NULL,
	[Nazwa_klubu] [varchar](50) NULL,
	[Kraj] [varchar](50) NULL,
 CONSTRAINT [PK_Kluby] PRIMARY KEY CLUSTERED 
(
	[ID_klubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogladalnosc]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogladalnosc](
	[ID_zawodow] [int] NOT NULL,
	[Ilosc_wyswietlen] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raport_Finansowy]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raport_Finansowy](
	[ID_zawodow] [int] NOT NULL,
	[Wydatki] [float] NULL,
	[Przychody] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rekordy_skoczni]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rekordy_skoczni](
	[ID_skoczni] [int] NOT NULL,
	[ID_weterana] [int] NULL,
	[ID_zawodnika] [int] NULL,
	[Odleglosc] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sedziowie]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sedziowie](
	[ID_sedziego] [int] NOT NULL,
	[Imie] [varchar](50) NULL,
	[Nazwisko] [varchar](50) NULL,
	[Narodowosc] [varchar](50) NULL,
	[Data_urodzenia] [date] NULL,
 CONSTRAINT [PK_Sędziowie] PRIMARY KEY CLUSTERED 
(
	[ID_sedziego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sedziowie_Przypisanie]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sedziowie_Przypisanie](
	[ID_przypisania] [int] NOT NULL,
	[ID_zawodow] [int] NOT NULL,
	[ID_sedziego] [int] NOT NULL,
 CONSTRAINT [PK_Sedziowie_Przypisanie] PRIMARY KEY CLUSTERED 
(
	[ID_przypisania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skocznie]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skocznie](
	[ID_skoczni] [int] NOT NULL,
	[Miejscowosc] [varchar](50) NULL,
	[Kraj] [varchar](50) NULL,
	[Typ_skoczni] [varchar](50) NULL,
	[Punkt_K] [float] NULL,
	[Punkt_HS] [float] NULL,
 CONSTRAINT [PK_Skocznie] PRIMARY KEY CLUSTERED 
(
	[ID_skoczni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsorzy]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsorzy](
	[ID_zawodow] [int] NOT NULL,
	[Nazwa_sponsora] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trenerzy]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trenerzy](
	[ID_trenera] [int] NOT NULL,
	[Imie] [varchar](50) NULL,
	[Nazwisko] [varchar](50) NULL,
	[Narodowosc] [varchar](50) NULL,
	[Data_urodzenia] [date] NULL,
	[Kadra] [varchar](50) NULL,
	[ID_klubu] [int] NULL,
 CONSTRAINT [PK_Trenerzy] PRIMARY KEY CLUSTERED 
(
	[ID_trenera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wyniki_druzynowe]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wyniki_druzynowe](
	[ID_zawodow] [int] NULL,
	[ID_druzyny] [int] NULL,
	[ID_zawodnika] [int] NULL,
	[ID_skoczni] [int] NULL,
	[Odleglosc1] [float] NULL,
	[Odleglosc2] [float] NULL,
	[Nota1] [decimal](4, 1) NULL,
	[Nota2] [decimal](4, 1) NULL,
	[Nota3] [decimal](4, 1) NULL,
	[Nota4] [decimal](4, 1) NULL,
	[Nota5] [decimal](4, 1) NULL,
	[Nota6] [decimal](4, 1) NULL,
	[Nota7] [decimal](4, 1) NULL,
	[Nota8] [decimal](4, 1) NULL,
	[Nota9] [decimal](4, 1) NULL,
	[Nota10] [decimal](4, 1) NULL,
	[Wiatr1] [float] NULL,
	[Wiatr2] [float] NULL,
	[Punkty_indywidualne] [float] NULL,
	[ID_wyniku] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_wyniku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wyniki_indywidualne]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wyniki_indywidualne](
	[ID_zawodow] [int] NULL,
	[ID_zawodnika] [int] NULL,
	[ID_skoczni] [int] NULL,
	[Odleglosc1] [decimal](10, 1) NULL,
	[Odleglosc2] [decimal](10, 1) NULL,
	[Nota1] [decimal](4, 1) NULL,
	[Nota2] [decimal](4, 1) NULL,
	[Nota3] [decimal](4, 1) NULL,
	[Nota4] [decimal](4, 1) NULL,
	[Nota5] [decimal](4, 1) NULL,
	[Nota6] [decimal](4, 1) NULL,
	[Nota7] [decimal](4, 1) NULL,
	[Nota8] [decimal](4, 1) NULL,
	[Nota9] [decimal](4, 1) NULL,
	[Nota10] [decimal](4, 1) NULL,
	[Wiatr1] [decimal](4, 1) NULL,
	[Wiatr2] [decimal](4, 1) NULL,
	[Punkty] [decimal](10, 1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zawodnicy]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zawodnicy](
	[ID_zawodnika] [int] NOT NULL,
	[Imie] [varchar](30) NULL,
	[Nazwisko] [varchar](30) NULL,
	[Narodowosc] [varchar](20) NOT NULL,
	[Data_urodzenia] [date] NOT NULL,
	[Rekord_zyciowy] [float] NULL,
	[ID_trenera] [int] NULL,
	[ID_klubu] [int] NULL,
 CONSTRAINT [PK_Zawodnicy] PRIMARY KEY CLUSTERED 
(
	[ID_zawodnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zawodnicy_weterani]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zawodnicy_weterani](
	[ID_weterana] [int] NOT NULL,
	[Imie] [varchar](50) NOT NULL,
	[Nazwisko] [varchar](50) NOT NULL,
	[Narodowosc] [varchar](50) NOT NULL,
	[Data_urodzenia] [date] NOT NULL,
	[Rekord_zyciowy] [float] NOT NULL,
 CONSTRAINT [PK_Zawodnicy_weterani] PRIMARY KEY CLUSTERED 
(
	[ID_weterana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zawody]    Script Date: 08.01.2024 19:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zawody](
	[ID_zawodow] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Rodzaj_zawodow] [varchar](50) NOT NULL,
	[ID_skoczni] [int] NOT NULL,
 CONSTRAINT [PK_Zawody] PRIMARY KEY CLUSTERED 
(
	[ID_zawodow] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Druzyny]  WITH CHECK ADD  CONSTRAINT [FK_Druzyny_Trenerzy] FOREIGN KEY([ID_trenera])
REFERENCES [dbo].[Trenerzy] ([ID_trenera])
GO
ALTER TABLE [dbo].[Druzyny] CHECK CONSTRAINT [FK_Druzyny_Trenerzy]
GO
ALTER TABLE [dbo].[Ogladalnosc]  WITH CHECK ADD  CONSTRAINT [FK_Ogladalnosc_Zawody] FOREIGN KEY([ID_zawodow])
REFERENCES [dbo].[Zawody] ([ID_zawodow])
GO
ALTER TABLE [dbo].[Ogladalnosc] CHECK CONSTRAINT [FK_Ogladalnosc_Zawody]
GO
ALTER TABLE [dbo].[Raport_Finansowy]  WITH CHECK ADD  CONSTRAINT [FK_Raport_Finansowy_Zawody] FOREIGN KEY([ID_zawodow])
REFERENCES [dbo].[Zawody] ([ID_zawodow])
GO
ALTER TABLE [dbo].[Raport_Finansowy] CHECK CONSTRAINT [FK_Raport_Finansowy_Zawody]
GO
ALTER TABLE [dbo].[Rekordy_skoczni]  WITH CHECK ADD  CONSTRAINT [FK_Rekordy_skoczni_Skocznie] FOREIGN KEY([ID_skoczni])
REFERENCES [dbo].[Skocznie] ([ID_skoczni])
GO
ALTER TABLE [dbo].[Rekordy_skoczni] CHECK CONSTRAINT [FK_Rekordy_skoczni_Skocznie]
GO
ALTER TABLE [dbo].[Rekordy_skoczni]  WITH CHECK ADD  CONSTRAINT [FK_Rekordy_skoczni_Zawodnicy] FOREIGN KEY([ID_zawodnika])
REFERENCES [dbo].[Zawodnicy] ([ID_zawodnika])
GO
ALTER TABLE [dbo].[Rekordy_skoczni] CHECK CONSTRAINT [FK_Rekordy_skoczni_Zawodnicy]
GO
ALTER TABLE [dbo].[Rekordy_skoczni]  WITH CHECK ADD  CONSTRAINT [FK_Rekordy_skoczni_Zawodnicy_weterani1] FOREIGN KEY([ID_weterana])
REFERENCES [dbo].[Zawodnicy_weterani] ([ID_weterana])
GO
ALTER TABLE [dbo].[Rekordy_skoczni] CHECK CONSTRAINT [FK_Rekordy_skoczni_Zawodnicy_weterani1]
GO
ALTER TABLE [dbo].[Sedziowie_Przypisanie]  WITH CHECK ADD  CONSTRAINT [FK_Sedziowie_Przypisanie_Sedziowie] FOREIGN KEY([ID_sedziego])
REFERENCES [dbo].[Sedziowie] ([ID_sedziego])
GO
ALTER TABLE [dbo].[Sedziowie_Przypisanie] CHECK CONSTRAINT [FK_Sedziowie_Przypisanie_Sedziowie]
GO
ALTER TABLE [dbo].[Sedziowie_Przypisanie]  WITH CHECK ADD  CONSTRAINT [FK_Sedziowie_Przypisanie_Zawody] FOREIGN KEY([ID_zawodow])
REFERENCES [dbo].[Zawody] ([ID_zawodow])
GO
ALTER TABLE [dbo].[Sedziowie_Przypisanie] CHECK CONSTRAINT [FK_Sedziowie_Przypisanie_Zawody]
GO
ALTER TABLE [dbo].[Sponsorzy]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorzy_Zawody] FOREIGN KEY([ID_zawodow])
REFERENCES [dbo].[Zawody] ([ID_zawodow])
GO
ALTER TABLE [dbo].[Sponsorzy] CHECK CONSTRAINT [FK_Sponsorzy_Zawody]
GO
ALTER TABLE [dbo].[Trenerzy]  WITH CHECK ADD  CONSTRAINT [FK_Trenerzy_Kluby1] FOREIGN KEY([ID_klubu])
REFERENCES [dbo].[Kluby] ([ID_klubu])
GO
ALTER TABLE [dbo].[Trenerzy] CHECK CONSTRAINT [FK_Trenerzy_Kluby1]
GO
ALTER TABLE [dbo].[Wyniki_druzynowe]  WITH CHECK ADD  CONSTRAINT [FK_Wyniki_druzynowe_Druzyny] FOREIGN KEY([ID_druzyny])
REFERENCES [dbo].[Druzyny] ([ID_druzyny])
GO
ALTER TABLE [dbo].[Wyniki_druzynowe] CHECK CONSTRAINT [FK_Wyniki_druzynowe_Druzyny]
GO
ALTER TABLE [dbo].[Wyniki_druzynowe]  WITH CHECK ADD  CONSTRAINT [FK_Wyniki_druzynowe_Skocznie] FOREIGN KEY([ID_skoczni])
REFERENCES [dbo].[Skocznie] ([ID_skoczni])
GO
ALTER TABLE [dbo].[Wyniki_druzynowe] CHECK CONSTRAINT [FK_Wyniki_druzynowe_Skocznie]
GO
ALTER TABLE [dbo].[Wyniki_druzynowe]  WITH CHECK ADD  CONSTRAINT [FK_Wyniki_druzynowe_Zawodnicy] FOREIGN KEY([ID_zawodnika])
REFERENCES [dbo].[Zawodnicy] ([ID_zawodnika])
GO
ALTER TABLE [dbo].[Wyniki_druzynowe] CHECK CONSTRAINT [FK_Wyniki_druzynowe_Zawodnicy]
GO
ALTER TABLE [dbo].[Wyniki_druzynowe]  WITH CHECK ADD  CONSTRAINT [FK_Wyniki_druzynowe_Zawody] FOREIGN KEY([ID_zawodow])
REFERENCES [dbo].[Zawody] ([ID_zawodow])
GO
ALTER TABLE [dbo].[Wyniki_druzynowe] CHECK CONSTRAINT [FK_Wyniki_druzynowe_Zawody]
GO
ALTER TABLE [dbo].[Wyniki_indywidualne]  WITH CHECK ADD  CONSTRAINT [FK_Wyniki_indywidualne_Skocznie] FOREIGN KEY([ID_skoczni])
REFERENCES [dbo].[Skocznie] ([ID_skoczni])
GO
ALTER TABLE [dbo].[Wyniki_indywidualne] CHECK CONSTRAINT [FK_Wyniki_indywidualne_Skocznie]
GO
ALTER TABLE [dbo].[Wyniki_indywidualne]  WITH CHECK ADD  CONSTRAINT [FK_Wyniki_indywidualne_Zawodnicy] FOREIGN KEY([ID_zawodnika])
REFERENCES [dbo].[Zawodnicy] ([ID_zawodnika])
GO
ALTER TABLE [dbo].[Wyniki_indywidualne] CHECK CONSTRAINT [FK_Wyniki_indywidualne_Zawodnicy]
GO
ALTER TABLE [dbo].[Wyniki_indywidualne]  WITH CHECK ADD  CONSTRAINT [FK_Wyniki_indywidualne_Zawody] FOREIGN KEY([ID_zawodow])
REFERENCES [dbo].[Zawody] ([ID_zawodow])
GO
ALTER TABLE [dbo].[Wyniki_indywidualne] CHECK CONSTRAINT [FK_Wyniki_indywidualne_Zawody]
GO
ALTER TABLE [dbo].[Zawodnicy]  WITH CHECK ADD  CONSTRAINT [FK_Zawodnicy_Kluby] FOREIGN KEY([ID_klubu])
REFERENCES [dbo].[Kluby] ([ID_klubu])
GO
ALTER TABLE [dbo].[Zawodnicy] CHECK CONSTRAINT [FK_Zawodnicy_Kluby]
GO
ALTER TABLE [dbo].[Zawodnicy]  WITH CHECK ADD  CONSTRAINT [FK_Zawodnicy_Trenerzy] FOREIGN KEY([ID_trenera])
REFERENCES [dbo].[Trenerzy] ([ID_trenera])
GO
ALTER TABLE [dbo].[Zawodnicy] CHECK CONSTRAINT [FK_Zawodnicy_Trenerzy]
GO
ALTER TABLE [dbo].[Zawody]  WITH CHECK ADD  CONSTRAINT [FK_Zawody_Skocznie] FOREIGN KEY([ID_skoczni])
REFERENCES [dbo].[Skocznie] ([ID_skoczni])
GO
ALTER TABLE [dbo].[Zawody] CHECK CONSTRAINT [FK_Zawody_Skocznie]
GO
USE [master]
GO
ALTER DATABASE [Ski_jumping] SET  READ_WRITE 
GO
