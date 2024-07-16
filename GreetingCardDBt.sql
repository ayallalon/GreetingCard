USE [GCDB]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 17/07/2024 00:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](64) NULL,
	[Style] [nvarchar](200) NULL,
	[Text] [nvarchar](max) NULL,
	[Background] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/07/2024 00:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](64) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cards] ON 

INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (58, N'1', N' color: #2e2323; font-size: 1.3; text-align: center', N'מנהל אגף חג שמח', N'/assets/images/Background3.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (59, N'1', N' color: #2e2323; font-size: 1.3; text-align: center', N'ראש צוות יקרה שנה טובה', N'/assets/images/Background3.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (60, N'1', N' color: #2e2323; font-size: 1.3; text-align: center', N'צוות יקר
 שנה טובה  ומתוקה', N'/assets/images/Background3.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (61, N'1', N' color: #2e2323; font-size: 1.3; text-align: center', N'משפחה אהובה שנה טובה ומבורכת', N'/assets/images/Background3.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (62, N'6', N' color: #2e2323; font-size: 1.3; text-align: center', N'צוות יקר
 שנה טובה  ומתוקה', N'/assets/images/Background2.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (63, N'22', N' color: #2e2323; font-size: 1.3; text-align: center', N'משפחה אהובה שנה טובה ומבורכת', N'/assets/images/Background2.jpg')
SET IDENTITY_INSERT [dbo].[Cards] OFF
GO
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'1', N' Ayala Alon', N'ayalaal@moia.gov.il', N'258369')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'22', N'Jane Smith', N'jane.smith@example.com', N'password456')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'6', N'Bob Brown', N'Sincere@april.biz', N's')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'9', N'Bob Brown', N'bob.brown@example.com', N'password321')
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
