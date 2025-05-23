USE [EyeSaveDB]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 19.05.2022 12:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (1, N'--ОГОРОД--', 1, N'840377, Рязанская область, город Щёлково, пл. Бухарестская, 42', N'231312323213', N'123312333', N'Никита Александрович Королёв', N'79096498215', N'znosov@mail.ru', N'file:///C:/Users/kraic/OneDrive/Рабочий стол/EyeSave_Demo/EyeSave_Demo/Images/Agents/agent_2.png', 123, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (2, N'СантехСеверЛенМашина', 5, N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'3506691089', N'830713603', N'Павел Максимович Рожков', N'(812) 214-73-94', N'pgorbacev@vasilev.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_99.png', 123, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (3, N'ЭлектроРемОрионЛизинг', 1, N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'1340072597', N'500478249', N'Тарасова Дан Львович', N'(495) 513-93-16', N'anfisa.fedotova@tvetkov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_93.png', 198, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (4, N'РыбАлмазГаражСнаб', 1, N'278792, Воронежская область, город Люберцы, ул. Космонавтов, 07', N'2135119617', N'916748563', N'Власов Ян Львович', N'(35222) 46-54-74', N'diana.gorbunov@gromov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_29.png', 123, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (5, N'CибБашкирТекстиль', 2, N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'7392007090', N'576103661', N'Григорий Владимирович Елисеева', N'(35222) 92-28-68', N'vzimina@zdanova.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_94.png', 123, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (6, N'ЮпитерТяжОрионЭкспедиция', 4, N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'6843174002', N'935556458', N'Валерий Евгеньевич Виноградов', N'(812) 819-51-58', N'gblokin@orlov.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_69.png', 446, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (7, N'КазаньТекстиль', 4, N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'4584384019', N'149680499', N'Александров Бронислав Максимович', N'+7 (922) 936-37-67', N'osimonova@andreeva.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_72.png', 11, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (8, N'МясИнфоМясТраст', 4, N'873144, Курская область, город Талдом, проезд Домодедовская, 46', N'6387079446', N'113956342', N'Лихачёваа Оксана Романовна', N'(812) 375-59-29', N'dgulyev@krasilnikov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_43.png', 11, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (9, N'АвтоТомскЦементЦентр', 2, N'282009, Вологодская область, город Красногорск, пл. Домодедовская, 14', N'8317739640', N'940326934', N'Леонид Иванович Афанасьева', N'(35222) 24-98-18', N'kabanov.valentina@subbotina.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_40.png', 71, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (10, N'Радио', 6, N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'9077613654', N'657690787', N'Эмма Андреевна Колесникова', N'(35222) 84-44-92', N'rtretykova@kozlov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_68.png', 221, 1)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (11, N'ДизайнФинансМикро', 4, N'775051, Иркутская область, город Серебряные Пруды, спуск Домодедовская, 41', N'2700182907', N'141912770', N'Кузьма Борисович Королёва', N'(495) 223-67-97', N'varvara15@belousov.ru', NULL, 462, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (12, N'Креп', 1, N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'4880732317', N'258673591', N'Назар Алексеевич Григорьева', N'(495) 315-25-86', N'savina.dominika@belousova.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_64.png', 371, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (13, N'ЖелДорДизайнМетизТраст', 6, N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'7669116841', N'906390137', N'Игорь Львович Агафонова', N'8-800-692-72-18', N'lnikitina@kulikova.com', NULL, 290, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (14, N'Асбоцемент', 5, N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'1261407459', N'745921890', N'Никитинаа Антонина Андреевна', N'(812) 152-28-78', N'antonin19@panfilov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_59.png', 273, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (15, N'Мобайл', 6, N'273144, Калужская область, город Наро-Фоминск, бульвар Чехова, 70', N'3655195522', N'395816585', N'Горшков Кузьма Фёдорович', N'(495) 532-54-42', N'rafail22@orlov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_53.png', 40, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (16, N'ТекстильУралАвтоОпт', 1, N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'3930950057', N'678529397', N'Алина Сергеевна Дьячковаа', N'(495) 418-67-55', N'hkononova@pavlova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_97.png', 176, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (17, N'Башкир', 3, N'513065, Рязанская область, город Одинцово, шоссе Славы, 93', N'3105334340', N'117513650', N'Одинцова Розалина Дмитриевна', N'8-800-656-63-99', N'iskra.sergeev@zykov.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_33.png', 35, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (18, N'ГорДор', 2, N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'7088187045', N'440309946', N'Нонна Львовна Одинцоваа', N'(812) 364-46-64', N'maiy12@koklov.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_77.png', 175, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (19, N'Компания Рос', 5, N'479740, Оренбургская область, город Наро-Фоминск, наб. Будапештсткая, 36', N'5502989807', N'518320454', N'Алёна Ивановна Тимофеева', N'(35222) 32-99-94', N'odenisov@knyzeva.ru', NULL, 252, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (20, N'КазЮпитерТомск', 4, N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'9201745524', N'510248846', N'Рафаил Андреевич Копылов', N'(35222) 24-85-54', N'tgavrilov@frolov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_85.png', 244, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (21, N'СеверГаз', 6, N'509479, Орловская область, город Павловский Посад, спуск Бухарестская, 28', N'7908427926', N'249521550', N'Валериан Андреевич Кириллова', N'(812) 973-88-81', N'smukina@evseev.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_15.png', 83, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (22, N'Компания КазАлмаз', 5, N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'3084797352', N'123190924', N'Марк Фёдорович Муравьёва', N'+7 (922) 692-21-57', N'irina.gusina@vlasova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_105.png', 396, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (23, N'ЦементАсбоцементОрионТраст', 4, N'221534, Орловская область, город Серебряные Пруды, проезд Гагарина, 54', N'2972154471', N'668972219', N'Павлова Марк Александрович', N'(495) 979-36-66', N'igulyeva@kostina.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_28.png', 441, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (24, N'Компания Электро', 5, N'183744, Рязанская область, город Клин, въезд Косиора, 29', N'4335399269', N'780051451', N'Кабанов Кирилл Максимович', N'(35222) 63-92-83', N'blokin.sofiy@terentev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_41.png', 340, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (25, N'БашкирЮпитерТомск', 1, N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'1606315697', N'217799345', N'Фадеева Раиса Александровна', N'(812) 395-91-75', N'dyckov.veniamin@kotova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_84.png', 139, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (26, N'Укроп', 2, N'138159, Свердловская область, город Подольск, спуск Балканская, 72', N'123411111111', N'816451597', N'уцскауыа сыасв', N'4567))(09-', N'subbotin.rostislav@mail.ru', N'file:///C:/Users/kraic/OneDrive/Рабочий стол/EyeSave_Demo/EyeSave_Demo/Images/Agents/agent_30.png', 123, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (27, N'Рос', 3, N'412597, Калужская область, город Клин, пр. Гагарина, 57', N'6729448041', N'935241906', N'Никифороваа Рената Сергеевна', N'+7 (922) 822-88-76', N'potapov.abram@trofimova.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_36.png', 158, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (28, N'ДизайнВосток', 2, N'680394, Оренбургская область, город Павловский Посад, спуск Косиора, 50', N'6222265808', N'245694799', N'Добрыня Сергеевич Кабанов', N'+7 (922) 767-84-15', N'efimova.timofei@tretykova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_17.png', 188, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (29, N'РемГаражЛифт', 4, N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'1656477206', N'988968838', N'Филатов Владимир Максимович', N'(35222) 18-85-61', N'novikova.gleb@sestakov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_90.png', 374, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (30, N'ПивГлав', 5, N'244290, Астраханская область, город Талдом, проезд Космонавтов, 17', N'3090235456', N'870818930', N'Клим Иванович Юдин', N'8-800-153-74-46', N'sofiy.bolsakov@isakova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_27.png', 329, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (31, N'Компания Гараж', 5, N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'6190244524', N'399106161', N'Владлена Фёдоровна Ларионоваа', N'(35222) 22-47-12', N'asiryeva@andreeva.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_91.png', 413, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (32, N'Монтаж', 3, N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'6142194281', N'154457435', N'Блохина Сергей Максимович', N'(495) 783-36-97', N'zakar.sazonova@gavrilov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_66.png', 300, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (33, N'ВодГараж', 4, N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'5575072431', N'684290320', N'Лаврентий Фёдорович Логинова', N'(35222) 11-75-66', N'pmaslov@fomiceva.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_92.png', 250, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (34, N'Компания Метал', 5, N'908229, Иркутская область, город Истра, бульвар Бухарестская, 97', N'9933367989', N'856443865', N'Валентина Ивановна Громова', N'(35222) 99-39-28', N'vasileva.tatyna@lebedeva.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_16.png', 167, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (35, N'Бум', 3, N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'1953785418', N'122905583', N'Татьяна Сергеевна Королёваа', N'+7 (922) 282-82-91', N'belova.vikentii@konstantinova.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_103.png', 82, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (36, N'Гор', 6, N'245009, Белгородская область, город Коломна, шоссе Домодедовская, 93', N'6196739969', N'784512010', N'Адриан Александрович Одинцов', N'(812) 327-52-23', N'rostislav.savelev@dmitrieva.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_46.png', 85, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (37, N'МясРеч', 1, N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'9254261217', N'656363498', N'Белоусоваа Ирина Максимовна', N'(812) 256-74-95', N'bkozlov@volkov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_83.png', 355, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (38, N'МясТрансМоторЛизинг', 4, N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'6148685143', N'196332656', N'Тамара Дмитриевна Семёноваа', N'(495) 489-75-57', N'vlad.sokolov@andreev.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_87.png', 268, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (39, N'Компания ТелекомХмельГаражПром', 5, N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'1614623826', N'824882264', N'Костина Татьяна Борисовна', N'8-800-617-13-37', N'qkolesnikova@kalinina.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_96.png', 457, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (40, N'МетизТехАвтоПроф', 5, N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'2988890076', N'215491048', N'Егор Фёдорович Третьякова', N'8-800-192-74-77', N'anastasiy.gromov@samsonova.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_58.png', 321, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (41, N'РосАвтоМонтаж', 5, N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'4735043946', N'263682488', N'Диана Алексеевна Исаковаа', N'8-800-468-91-51', N'lapin.inessa@isaeva.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_80.png', 10, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (42, N'Компания КрепГаз', 5, N'415525, Воронежская область, город Орехово-Зуево, спуск Ленина, 14', N'2910821636', N'169856199', N'Эмилия Фёдоровна Шилова', N'8-800-971-62-32', N'iturova@isakova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_48.png', 50, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (43, N'БухТеле', 1, N'481781, Астраханская область, город Орехово-Зуево, спуск Ломоносова, 67', N'3547826061', N'581933218', N'Клавдия Романовна Савина', N'(35222) 89-78-68', N'vasilev.svetlana@saskov.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_18.png', 171, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (44, N'ТяжМяж', 6, N'255489, Самарская область, город Озёры, ул. Ломоносова, 09', N'6391522710', N'209038885', N'Юлия Львовна Горбунова', N'(812) 425-28-46', N'bzykov@baranov.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_55.png', 472, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (45, N'Тех', 4, N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'9282924869', N'587356429', N'Аким Романович Логинова', N'+7 (922) 113-94-49', N'vasilisa99@belyev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_86.png', 278, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (46, N'ГлавITФлотПроф', 3, N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'2561361494', N'525678825', N'Зыкова Стефан Максимович', N'(35222) 33-48-16', N'savva.rybov@kolobov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_89.png', 62, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (47, N'Восток', 3, N'284236, Воронежская область, город Павловский Посад, бульвар Ленина, 28', N'8929775900', N'788028687', N'Савинаа Нина Александровна', N'(495) 227-66-48', N'nsitnikova@tikonova.org', NULL, 380, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (48, N'ТелекомЮпитер', 2, N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'9383182378', N'944520594', N'Калинина Татьяна Ивановна', N'(812) 798-33-53', N'kulikov.adrian@zuravlev.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_106.png', 302, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (49, N'МонтажВекторМобайлЦентр', 1, N'094869, Ленинградская область, город Ступино, наб. Ленина, 80', N'4433392652', N'757806909', N'Захар Александрович Панова', N'(495) 566-98-62', N'pavel.davydova@tretykov.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_32.png', 372, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (50, N'ВостокГлав', 5, N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'3580946305', N'405017349', N'Инга Фёдоровна Дмитриева', N'+7 (922) 329-34-28', N'gordei95@kirillov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_88.png', 107, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (51, N'Компания КрепЦемент', 5, N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'3025099903', N'606083992', N'Екатерина Львовна Суворова', N'8-800-628-79-67', N'rusakov.efim@nikiforov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_75.png', 426, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (52, N'ЖелДор', 1, N'860124, Иркутская область, город Егорьевск, пер. Гагарина, 67', N'9392505809', N'911026119', N'Симоноваа Лариса Борисовна', N'(35222) 26-55-64', N'karitonova.fedosy@vasileva.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_51.png', 429, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (53, N'Компания Хмель', 5, N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'9004087602', N'297273898', N'Владимир Борисович Суворова', N'(35222) 27-19-66', N'ermakov.mark@isakova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_67.png', 2, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (54, N'Цемент', 5, N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'9662118663', N'650216214', N'Анфиса Фёдоровна Буроваа', N'+7 (922) 859-19-97', N'panova.klementina@bobrov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_79.png', 340, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (55, N'ЛенМобайлМикро', 3, N'737175, Ростовская область, город Одинцово, ул. Космонавтов, 99', N'6729041572', N'828657559', N'Изабелла Евгеньевна Дьячкова', N'(35222) 96-34-97', N'frolov.artem@zuravlev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_52.png', 341, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (56, N'Компания ТверьДизайн', 5, N'672492, Калининградская область, город Москва, проезд Сталина, 64', N'3567301661', N'623881311', N'Доминика Александровна Никитинаа', N'8-800-234-93-22', N'ypotapov@kolesnikova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_37.png', 271, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (57, N'ВодТверьХозМашина', 1, N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'4174253174', N'522227145', N'Александра Дмитриевна Ждановаа', N'(495) 756-36-72', N'tkrylov@baranova.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_81.png', 8, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (58, N'ТелеГлавВекторСбыт', 1, N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'9504787157', N'419758597', N'Екатерина Фёдоровна Ковалёва', N'+7 (922) 619-91-52', N'nsitnikov@kovaleva.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_56.png', 185, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (59, N'БашкирИнжКрепСбыт', 5, N'191420, Новосибирская область, город Ногинск, пер. Будапештсткая, 28', N'6771467761', N'977595370', N'Алиса Фёдоровна Архипова', N'+7 (922) 495-46-18', N'vlad.molcanov@fomicev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_24.png', 475, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (60, N'ТрансТверь', 2, N'818676, Томская область, город Павловский Посад, ул. Ладыгина, 27', N'3311036393', N'590018934', N'Алина Романовна Овчинникова', N'(35222) 22-74-12', N'dorofeev.milan@vorobeva.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_25.png', 495, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (61, N'ТелеСеверМикро', 2, N'046300, Орловская область, город Ступино, бульвар Бухарестская, 13', N'9534974527', N'344691556', N'Селезнёв Василий Евгеньевич', N'(35222) 66-26-65', N'koseleva.ylii@potapov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_12.png', 254, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (62, N'CибПивОмскСнаб', 1, N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'5676173945', N'256512286', N'Людмила Александровна Сафонова', N'(812) 743-49-87', N'evorontova@potapova.ru', NULL, 477, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (63, N'ЛенБухМикро-H', 3, N'078797, Мурманская область, город Коломна, пр. Гоголя, 94', N'5943902570', N'103426359', N'Субботин Герасим Владимирович', N'(812) 421-59-75', N'rybov.tatyna@merkuseva.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_30.png', 242, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (64, N'ЮпитерЛенГараж-М', 2, N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'2038393690', N'259672761', N'Васильева Валерия Борисовна', N'(812) 229-34-18', N'larkipova@gorbunov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_73.png', 470, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (65, N'МорВостокТомскПром', 4, N'034623, Белгородская область, город Павловский Посад, проезд Ломоносова, 72', N'4082127026', N'544686044', N'Гавриил Евгеньевич Селиверстов', N'+7 (922) 258-96-16', N'lev.efremov@frolov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_20.png', 198, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (66, N'Компания ФинансСервис', 5, N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'7491491391', N'673621812', N'Клавдия Сергеевна Виноградова', N'8-800-358-54-99', N'robert.serbakov@safonova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_63.png', 395, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (67, N'Метиз', 5, N'455463, Ярославская область, город Серпухов, пер. Бухарестская, 01', N'4433116074', N'949226221', N'Ян Иванович Егоров', N'(35222) 81-78-92', N'mersova@rodionova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_54.png', 168, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (68, N'ФлотБух', 2, N'741647, Ульяновская область, город Наро-Фоминск, ул. 1905 года, 11', N'4868711532', N'409331823', N'Муравьёваа Мария Дмитриевна', N'+7 (922) 155-75-21', N'tkuznetova@sukanova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_21.png', 385, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (69, N'КазХоз', 4, N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'6503377671', N'232279972', N'Степанова Роман Иванович', N'8-800-955-44-52', N'istrelkova@fomin.ru', NULL, 213, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (70, N'Орион', 6, N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'2670166502', N'716874456', N'Мартынов Михаил Борисович', N'(35222) 58-77-96', N'aleksei63@kiselev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_102.png', 166, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (71, N'РечИнж', 4, N'862241, Кемеровская область, город Москва, пер. Славы, 63', N'9289300952', N'534867576', N'Донат Иванович Кудрявцев', N'(812) 971-47-98', N'qloginova@antonov.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_8.png', 426, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (72, N'РосПивТверь', 4, N'053965, Магаданская область, город Видное, наб. Балканская, 41', N'2857470864', N'732899890', N'Люся Фёдоровна Горшковаа', N'+7 (922) 692-73-72', N'vitalii.melnikov@kopylov.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_11.png', 368, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (73, N'КрепТелекомТекстильМашина', 3, N'754514, Тверская область, город Люберцы, пл. Домодедовская, 84', N'7626613684', N'187506967', N'Богданов Денис Максимович', N'+7 (922) 278-54-95', N'ignatov.adam@kononova.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_39.png', 259, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (74, N'МорГлавМонтажЭкспедиция', 4, N'313619, Читинская область, город Чехов, ул. Ленина, 38', N'8619846965', N'796144573', N'Анастасия Львовна Субботинаа', N'(812) 161-96-49', N'flukin@moiseeva.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_34.png', 329, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (75, N'ТекстильУралВод', 6, N'872673, Ярославская область, город Видное, спуск Славы, 04', N'8336124514', N'871193263', N'Эльвира Фёдоровна Герасимова', N'(495) 614-67-93', N'obespalov@alekseev.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_9.png', 28, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (76, N'Газ', 3, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'8876413796', N'955381891', N'Терентьев Илларион Максимович', N'8-800-278-78-32', N'ulyna.antonov@noskov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_101.png', 170, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (77, N'ТомскТранс', 5, N'271624, Свердловская область, город Озёры, ул. Косиора, 21', N'6523850838', N'970092830', N'Архипова Юрий Дмитриевич', N'(35222) 66-22-46', N'antonina.krasilnikov@nikonov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_47.png', 427, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (78, N'Компания ТехТеле', 5, N'285256, Магаданская область, город Дмитров, шоссе Ладыгина, 20', N'1553744119', N'713327632', N'Тихонова Валериан Владимирович', N'8-800-943-36-45', N'anfisa63@sobolev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_42.png', 465, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (79, N'СофтИнжIT', 4, N'146295, Тверская область, город Одинцово, въезд Бухарестская, 78', N'2368693812', N'791368408', N'Виктор Львович Михайлова', N'8-800-319-27-45', N'yliy.efimov@zdanova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_50.png', 460, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (80, N'Компания Монтаж', 5, N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'6206428565', N'118570048', N'Силин Даниил Иванович', N'(495) 626-86-13', N'afanasev.anastasiy@muravev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_100.png', 124, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (81, N'СтройГорНефть', 4, N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'5916775587', N'398299418', N'Тарасова Макар Максимович', N'(495) 852-82-84', N'lysy.kolesnikova@molcanova.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_62.png', 161, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (82, N'ЦементХмельОрионНаладка', 4, N'014379, Кировская область, город Озёры, пр. Будапештсткая, 28', N'2118874929', N'482607758', N'Максим Евгеньевич Гурьева', N'+7 (922) 419-14-19', N'daniil.selezneva@safonova.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_49.png', 61, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (83, N'Компания ОрионСтройЛифт', 5, N'819305, Воронежская область, город Талдом, шоссе Ломоносова, 36', N'8834229587', N'958311664', N'Щукина Искра Максимовна', N'8-800-381-59-97', N'artemii.abramova@arkipov.ru', NULL, 467, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (84, N'Тяж', 3, N'650482, Смоленская область, город Коломна, проезд Косиора, 95', N'5484904441', N'943388774', N'Белов Влад Александрович', N'+7 (922) 547-77-52', N'rodionova.ulyna@noskov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_35.png', 207, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (85, N'ЦементАсбоцемент', 1, N'619540, Курская область, город Раменское, пл. Балканская, 12', N'4345774724', N'352469905', N'Воронова Мария Александровна', N'+7 (922) 133-68-96', N'polykov.veronika@artemeva.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_76.png', 426, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (86, N'ГазДизайнЖелДор', 2, N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'2396029740', N'458924890', N'Лев Иванович Третьяков', N'(35222) 39-88-91', N'elizaveta.komarov@rybakov.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_74.png', 236, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (87, N'РемСантехОмскБанк', 4, N'289468, Омская область, город Видное, пер. Балканская, 33', N'6823050572', N'176488617', N'Фокина Искра Максимовна', N'(35222) 76-15-56', N'anisimov.mark@vorobev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_82.png', 442, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (88, N'Мясо', 3, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'1876413796', N'955381891', N'Терентьев Илларион Максимович', N'+7 (922) 315-51-42', N'ulyna.antonov@noskov.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_107.png', 170, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (89, N'КрепГаражСантехМаш', 6, N'207204, Пензенская область, город Одинцово, пер. Гагарина, 80', N'7574946061', N'146206755', N'Аркадий Романович Тихонов', N'(495) 172-31-91', N'vladlen84@ersova.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_10.png', 330, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (90, N'ИнжITЖелДор-H', 3, N'019291, Вологодская область, город Клин, ул. Космонавтов, 96', N'8103088511', N'604606043', N'Колесникова Август Владимирович', N'(495) 324-18-82', N'karitonov.aleksandra@samoilov.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_14.png', 129, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (91, N'Рем', 1, N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'3203830728', N'456254820', N'Шароваа Елизавета Львовна', N'(35222) 46-69-69', N'zanna25@nikiforova.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_104.png', 329, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (92, N'ФинансТелеТверь', 6, N'687171, Томская область, город Лотошино, пл. Славы, 59', N'2646091050', N'971874277', N'Зайцеваа Дарья Сергеевна', N'(495) 839-58-56', N'medvedev.klim@afanasev.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_70.png', 100, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (93, N'Строй', 3, N'763019, Омская область, город Шатура, пл. Сталина, 56', N'6678884759', N'279288618', N'Кудрявцев Адриан Андреевич', N'+7 (922) 129-57-13', N'soloveva.adam@andreev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_57.png', 12, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (94, N'ЭлектроITITСбыт', 1, N'855489, Вологодская область, город Серебряные Пруды, пл. Ломоносова, 57', N'1532104861', N'112607081', N'Якушеваа Варвара Романовна', N'(812) 326-15-27', N'eliseeva.sofy@gorskov.net', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_23.png', 452, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (95, N'ЛенХозМясБанк', 2, N'702413, Саратовская область, город Люберцы, въезд Чехова, 15', N'9266199692', N'335770867', N'Арсений Алексеевич Виноградова', N'(35222) 26-15-93', N'bobrov.viktor@kazakova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_31.png', 17, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (96, N'ЭлектроМоторТрансСнос', 4, N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'6608362851', N'799760512', N'Людмила Евгеньевна Новиковаа', N'(495) 951-23-53', N'inessa.voronov@sidorova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_98.png', 151, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (97, N'Компания СервисРадиоГор', 5, N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'8880473721', N'729975116', N'Попов Вадим Александрович', N'(812) 871-21-15', N'nika.nekrasova@kovalev.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_65.png', 169, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (98, N'Компания МясДизайнДизайн', 5, N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'8004989990', N'908629456', N'Клементина Сергеевна Стрелкова', N'(495) 752-21-98', N'gleb.gulyev@belyeva.com', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_78.png', 491, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (99, N'БашкирФлотМотор-H', 2, N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'1657476072', N'934931159', N'Марат Алексеевич Фролов', N'(812) 737-79-77', N'morozova.nika@kazakova.ru', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_61.png', 416, 0)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (100, N'СофтМонтажХозСбыт', 4, N'860932, Калужская область, город Наро-Фоминск, ул. Балканская, 78', N'5408216010', N'737659265', N'Харитонов Антонин Владимирович', N'(495) 396-23-64', N'zinaida90@filippov.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_44.png', 403, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (101, N'СофтМонтажХозСбыт', 4, N'860932, Калужская область, город Наро-Фоминск, ул. Балканская, 78', N'5408216010', N'737659265', N'Харитонов Антонин Владимирович', N'(495) 396-23-64', N'zinaida90@filippov.org', N'C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\agent_44.png', 403, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (102, N'Героиня', 2, N'ул бульварная д.45 ', N'111111111111', N'222211111', N'вса асцасцу', N'798765432134', N'alex@mail.ru', N'file:///C:/Users/kraic/OneDrive/Рабочий стол/EyeSave_Demo/EyeSave_Demo/Images/Agents/agent_3.png', 45, 0)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority], [IsDeleted]) VALUES (103, N'йсаымаукв', 2, N'мывпывпм', N'111111111111', N'111111111', N'йвфуымувипкеаир', N'1231534534', N'email@mail.ru', N'file:///C:/Users/kraic/OneDrive/Рабочий стол/EyeSave_Demo/EyeSave_Demo/Images/Agents/agent_8.png', 123, 0)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentPriorityHistory] ON 

INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue], [IsDeleted]) VALUES (1, 1, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue], [IsDeleted]) VALUES (4, 1, CAST(N'2022-05-18T00:00:00.000' AS DateTime), 10, 1)
SET IDENTITY_INSERT [dbo].[AgentPriorityHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'ЗАО
', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'МКК
', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'МФО
', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'ОАО
', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'ООО
', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'ПАО
', NULL)
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Маска на лицо открытого типа 4556', 4, N'7560408', NULL, NULL, 3, 3, CAST(1576.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Очки прозрачные затемненные 2256', 4, N'76452269', NULL, NULL, 3, 9, CAST(342.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Маска защитная закрытого типа 1359', 3, N'75996796', NULL, NULL, 4, 12, CAST(198.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Защита глаз с клапаном 2579', 4, N'50785095', NULL, NULL, 3, 5, CAST(832.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Маска на лицо затемненные 5068', 4, N'44451659', NULL, NULL, 3, 6, CAST(1713.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Очки прозрачные открытого типа 2830', 1, N'67633308', NULL, NULL, 5, 2, CAST(1269.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Маска на лицо с клапаном 3370', 2, N'81175619', NULL, NULL, 1, 3, CAST(822.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Маска защитная затемненные 1396', 2, N'21739873', NULL, NULL, 2, 10, CAST(744.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Защита глаз затемненные 1999', 1, N'83267291', NULL, NULL, 1, 8, CAST(1105.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Маска защитная с клапаном 2921', 3, N'42906442', NULL, NULL, 4, 3, CAST(273.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Очки красные затемненные 5288', 3, N'17973888', NULL, NULL, 5, 10, CAST(1383.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Маска защитная закрытого типа 1508', 3, N'38631872', NULL, NULL, 5, 10, CAST(1521.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Защита глаз от воды с клапаном 5141', 2, N'48232658', NULL, NULL, 2, 10, CAST(1754.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Очки прозрачные с клапаном 4732', 4, N'9796980', NULL, NULL, 4, 5, CAST(1806.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Маска на лицо открытого типа 3158', 2, N'47415783', NULL, NULL, 5, 1, CAST(1285.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Очки прозрачные с клапаном 5034', 2, N'6783736', NULL, NULL, 3, 12, CAST(1475.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Защита глаз затемненные 1922', 3, N'63567187', NULL, NULL, 4, 9, CAST(1562.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Защита глаз от воды с клапаном 1498', 2, N'73250951', NULL, NULL, 5, 12, CAST(1868.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Защита глаз от пыли затемненные 6614', 2, N'89589447', NULL, NULL, 1, 7, CAST(1370.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Очки темные открытого типа 4067', 2, N'74666994', NULL, NULL, 2, 5, CAST(792.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Защита глаз открытого типа 3465', 3, N'35778001', NULL, NULL, 2, 4, CAST(212.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Защита глаз от воды закрытого типа 6052', 2, N'80684143', NULL, NULL, 2, 9, CAST(589.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Очки прозрачные затемненные 5848', 4, N'86254159', NULL, NULL, 4, 8, CAST(878.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Маска на лицо закрытого типа 4426', 2, N'78789007', NULL, NULL, 5, 8, CAST(185.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Маска на лицо открытого типа 6456', 4, N'23804393', NULL, NULL, 3, 12, CAST(1343.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Защита глаз открытого типа 2381', 4, N'80410937', NULL, NULL, 5, 2, CAST(1690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Очки прозрачные открытого типа 6480', 3, N'23552742', NULL, NULL, 5, 12, CAST(729.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Маска на лицо затемненные 6914', 2, N'16837832', NULL, NULL, 1, 9, CAST(296.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Защита глаз открытого типа 1876', 2, N'18274186', NULL, NULL, 1, 6, CAST(1754.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Защита глаз с клапаном 2715', 2, N'65896850', NULL, NULL, 3, 11, CAST(1769.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Защита глаз от воды с клапаном 2922', 1, N'32589387', NULL, NULL, 1, 3, CAST(1436.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Маска защитная затемненные 3116', 2, N'16694924', NULL, NULL, 3, 4, CAST(1042.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Маска защитная открытого типа 5493', 4, N'28669954', NULL, NULL, 4, 9, CAST(565.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Очки темные с клапаном 4354', 2, N'26078631', NULL, NULL, 2, 6, CAST(1627.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Защита глаз от пыли открытого типа 5443', 3, N'87162470', NULL, NULL, 5, 8, CAST(1180.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Маска на лицо с клапаном 6789', 1, N'75277715', NULL, NULL, 2, 1, CAST(874.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Защита глаз с клапаном 1456', 4, N'89728004', NULL, NULL, 3, 10, CAST(1676.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Очки прозрачные закрытого типа 1090', 1, N'51936367', NULL, NULL, 2, 12, CAST(335.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Защита глаз от воды закрытого типа 1351', 3, N'33766997', NULL, NULL, 4, 11, CAST(453.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Защита глаз с клапаном 4657', 3, N'60888572', NULL, NULL, 3, 12, CAST(638.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Очки прозрачные затемненные 2009', 2, N'60643813', NULL, NULL, 2, 10, CAST(1070.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Очки темные с клапаном 2774', 3, N'74007987', NULL, NULL, 5, 11, CAST(534.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Очки прозрачные затемненные 4299', 1, N'30033340', NULL, NULL, 1, 7, CAST(708.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Защита глаз от воды закрытого типа 5795', 4, N'37743614', NULL, NULL, 1, 11, CAST(1790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Защита глаз от пыли с клапаном 6767', 2, N'57763347', NULL, NULL, 4, 5, CAST(371.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Защита глаз затемненные 1433', 1, N'19163774', NULL, NULL, 3, 12, CAST(1301.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Очки прозрачные с клапаном 2870', 1, N'14625901', NULL, NULL, 2, 1, CAST(1483.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Очки прозрачные с клапаном 2928', 4, N'72314954', NULL, NULL, 1, 2, CAST(1467.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Очки прозрачные закрытого типа 1153', 2, N'18277077', NULL, NULL, 3, 12, CAST(375.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Маска на лицо закрытого типа 2053', 2, N'48084823', NULL, NULL, 5, 3, CAST(1617.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (1, 4, 33, CAST(N'2014-06-25' AS Date), 8, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (2, 72, 42, CAST(N'2011-01-04' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (3, 73, 11, CAST(N'2015-07-03' AS Date), 3, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (4, 8, 21, CAST(N'2019-06-06' AS Date), 16, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (5, 15, 1, CAST(N'2014-03-28' AS Date), 20, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (6, 15, 31, CAST(N'2019-02-13' AS Date), 18, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (7, 71, 38, CAST(N'2012-04-26' AS Date), 17, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (8, 42, 2, CAST(N'2019-01-22' AS Date), 5, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (9, 56, 32, CAST(N'2017-12-09' AS Date), 12, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (10, 19, 35, CAST(N'2013-03-18' AS Date), 13, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (11, 17, 18, CAST(N'2016-11-06' AS Date), 7, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (12, 4, 18, CAST(N'2018-08-22' AS Date), 1, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (13, 59, 48, CAST(N'2012-08-06' AS Date), 12, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (14, 71, 28, CAST(N'2011-02-27' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (15, 8, 40, CAST(N'2016-01-09' AS Date), 17, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (16, 9, 41, CAST(N'2018-01-14' AS Date), 14, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (17, 1, 9, CAST(N'2010-07-20' AS Date), 16, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (18, 43, 6, CAST(N'2012-11-24' AS Date), 7, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (19, 47, 44, CAST(N'2017-12-15' AS Date), 16, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (20, 60, 23, CAST(N'2015-06-24' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (21, 11, 29, CAST(N'2018-03-05' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (22, 4, 33, CAST(N'2016-12-16' AS Date), 12, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (23, 95, 31, CAST(N'2019-03-10' AS Date), 6, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (24, 89, 33, CAST(N'2017-10-25' AS Date), 8, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (25, 19, 13, CAST(N'2013-06-16' AS Date), 20, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (26, 78, 8, CAST(N'2016-05-05' AS Date), 8, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (27, 77, 3, CAST(N'2018-05-01' AS Date), 1, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (28, 1, 34, CAST(N'2011-03-17' AS Date), 20, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (29, 84, 49, CAST(N'2010-05-08' AS Date), 13, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (30, 84, 37, CAST(N'2014-01-16' AS Date), 3, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (31, 89, 9, CAST(N'2010-09-13' AS Date), 5, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (32, 28, 17, CAST(N'2017-06-15' AS Date), 11, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (33, 26, 37, CAST(N'2011-01-06' AS Date), 4, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (34, 8, 12, CAST(N'2013-01-28' AS Date), 12, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (35, 19, 20, CAST(N'2014-09-13' AS Date), 8, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (36, 47, 14, CAST(N'2010-11-04' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (37, 36, 16, CAST(N'2017-12-19' AS Date), 16, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (38, 11, 37, CAST(N'2013-06-26' AS Date), 9, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (39, 8, 45, CAST(N'2012-10-15' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (40, 94, 47, CAST(N'2015-09-05' AS Date), 17, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (41, 71, 8, CAST(N'2012-08-26' AS Date), 7, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (42, 94, 44, CAST(N'2012-06-04' AS Date), 13, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (43, 77, 46, CAST(N'2012-06-11' AS Date), 12, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (44, 23, 8, CAST(N'2018-05-23' AS Date), 8, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (45, 58, 16, CAST(N'2013-08-24' AS Date), 6, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (46, 9, 16, CAST(N'2011-05-10' AS Date), 11, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (47, 26, 14, CAST(N'2013-02-03' AS Date), 1, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (48, 43, 41, CAST(N'2017-06-24' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (49, 83, 31, CAST(N'2010-09-13' AS Date), 11, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (50, 49, 18, CAST(N'2017-09-10' AS Date), 9, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (51, 36, 18, CAST(N'2016-09-17' AS Date), 13, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (52, 63, 14, CAST(N'2013-04-18' AS Date), 1, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (53, 36, 17, CAST(N'2010-08-27' AS Date), 6, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (54, 73, 14, CAST(N'2017-07-06' AS Date), 14, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (55, 23, 33, CAST(N'2013-07-10' AS Date), 18, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (56, 74, 29, CAST(N'2019-12-23' AS Date), 13, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (57, 65, 37, CAST(N'2019-11-07' AS Date), 17, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (58, 79, 34, CAST(N'2011-07-20' AS Date), 12, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (59, 72, 20, CAST(N'2011-02-05' AS Date), 11, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (60, 1, 8, CAST(N'2016-04-17' AS Date), 4, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (61, 47, 6, CAST(N'2018-02-06' AS Date), 18, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (62, 44, 12, CAST(N'2012-01-04' AS Date), 3, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (63, 44, 32, CAST(N'2018-12-07' AS Date), 15, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (64, 1, 8, CAST(N'2019-02-12' AS Date), 17, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (65, 82, 17, CAST(N'2010-11-10' AS Date), 1, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (66, 75, 9, CAST(N'2013-03-23' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (67, 52, 43, CAST(N'2019-09-26' AS Date), 17, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (68, 8, 49, CAST(N'2013-08-24' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (69, 42, 43, CAST(N'2015-10-18' AS Date), 7, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (70, 95, 5, CAST(N'2012-12-28' AS Date), 13, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (71, 63, 21, CAST(N'2019-08-09' AS Date), 1, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (72, 17, 41, CAST(N'2010-03-23' AS Date), 15, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (73, 11, 26, CAST(N'2010-12-21' AS Date), 5, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (74, 11, 26, CAST(N'2010-02-21' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (75, 52, 29, CAST(N'2014-03-24' AS Date), 4, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (76, 24, 12, CAST(N'2018-04-18' AS Date), 20, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (77, 47, 25, CAST(N'2011-11-12' AS Date), 6, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (78, 90, 19, CAST(N'2017-12-17' AS Date), 8, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (79, 9, 39, CAST(N'2018-06-24' AS Date), 4, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (80, 84, 31, CAST(N'2014-07-10' AS Date), 16, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (81, 67, 48, CAST(N'2019-03-05' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (82, 4, 50, CAST(N'2017-07-20' AS Date), 17, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (83, 60, 15, CAST(N'2019-01-08' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (84, 24, 26, CAST(N'2017-05-05' AS Date), 20, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (85, 56, 35, CAST(N'2013-01-12' AS Date), 7, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (86, 95, 3, CAST(N'2012-10-12' AS Date), 15, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (87, 61, 10, CAST(N'2014-04-12' AS Date), 13, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (88, 1, 47, CAST(N'2018-09-11' AS Date), 9, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (89, 19, 47, CAST(N'2018-01-18' AS Date), 10, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (90, 24, 50, CAST(N'2015-03-07' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (91, 27, 9, CAST(N'2012-10-08' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (92, 83, 17, CAST(N'2014-01-08' AS Date), 5, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (93, 36, 26, CAST(N'2011-10-27' AS Date), 15, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (94, 21, 43, CAST(N'2012-08-18' AS Date), 7, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (95, 100, 27, CAST(N'2011-11-01' AS Date), 1, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (96, 60, 48, CAST(N'2011-12-16' AS Date), 12, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (97, 23, 39, CAST(N'2013-04-18' AS Date), 5, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (98, 73, 49, CAST(N'2010-06-09' AS Date), 19, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (99, 52, 22, CAST(N'2015-02-12' AS Date), 12, 0)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (100, 23, 24, CAST(N'2012-08-01' AS Date), 1, 0)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (101, 1, 5, CAST(N'2022-05-17' AS Date), 0, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (102, 1, 1, CAST(N'2022-05-17' AS Date), 0, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (103, 1, 4, CAST(N'2022-05-17' AS Date), 0, 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount], [IsDeleted]) VALUES (104, 26, 1, CAST(N'2022-05-19' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N' Закрытого типа
', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N' Затемненные
', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N' Открытого типа
', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N' С клапаном
', 5)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ID], [Title], [Address], [AgentID], [IsDeleted]) VALUES (1, N'Ог', N'воц3оумрауцсаь', 1, 1)
INSERT [dbo].[Shop] ([ID], [Title], [Address], [AgentID], [IsDeleted]) VALUES (2, N'Ор', N'аувымпкмпокуолса', 1, 1)
INSERT [dbo].[Shop] ([ID], [Title], [Address], [AgentID], [IsDeleted]) VALUES (3, N'Од', N'асмпикей', 1, 1)
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
ALTER TABLE [dbo].[Agent] ADD  CONSTRAINT [DF_Agent_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AgentPriorityHistory] ADD  CONSTRAINT [DF_AgentPriorityHistory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductSale] ADD  CONSTRAINT [DF_ProductSale_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
