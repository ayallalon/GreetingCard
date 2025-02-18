USE [GCDB]
GO


/****** Object:  Table [dbo].[Cards]    Script Date: 22/07/2024 16:35:05 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 22/07/2024 16:35:05 ******/
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

INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (58, N'1', N' color: #2e2323; font-size: 1.3; text-align: cente', N'מנהל אגף חג שמח', N'/assets/images/Background2.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (59, N'1', N' color: #2e2323; font-size: 1.3; text-align: center', N'ראש צוות יקרה שנה טובה', N'/assets/images/Background3.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (60, N'1', N' color: #2e2323; font-size: 1.3; text-align: center', N'צוות יקר
 שנה טובה  ומתוקה', N'/assets/images/Background3.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (61, N'1', N' color: #2e2323; font-size: 1.3; text-align: center', N'משפחה אהובה שנה טובה ומבורכת', N'/assets/images/Background3.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (62, N'6', N' color: #2e2323; font-size: 1.3; text-align: center', N'צוות יקר
 שנה טובה  ומתוקה', N'/assets/images/Background2.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (63, N'22', N' color: #2e2323; font-size: 1.3; text-align: center', N'משפחה אהובה שנה טובה ומבורכת', N'/assets/images/Background2.jpg')
INSERT [dbo].[Cards] ([CardID], [UserID], [Style], [Text], [Background]) VALUES (79, N'1', N' color: #2e2323; font-size: 1.2; text-align: cente', N'מנהל אגף חג שמח', N'/assets/images/Background3.jpg')
SET IDENTITY_INSERT [dbo].[Cards] OFF
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'1', N' Ayala Alon', N'ayalaal@moia.gov.il', N'258369')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'2', N' Chaya Ben', N'ayalaal@moia.gov.il', N'58')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'22', N'Jane Smith', N'jane.smith@example.com', N'password456')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'3', N' Tali Amar', N'ayalaal@moia.gov.il', N'5974')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'6', N'Bob Brown', N'Sincere@april.biz', N's')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password]) VALUES (N'9', N'Bob Brown', N'bob.brown@example.com', N'password321')
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[CreateCard]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCard]
    @UserID NVARCHAR(50),
    @Style NVARCHAR(50),
    @Text NVARCHAR(MAX),
    @Background NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Cards (UserID, Style, Text, Background)
    OUTPUT INSERTED.CardID
    VALUES (@UserID, @Style, @Text, @Background);
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CreateUser]
	@UserID NVARCHAR(50),
	@UserName NVARCHAR(50),
	@Email NVARCHAR(50),
	@Password NVARCHAR(50)

AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Users(UserID, UserName, Email, Password)
	VALUES (@UserID, @UserName, @Email, @Password);

END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserAndCards]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[DeleteUserAndCards]
    @UserID INT
AS
BEGIN
    BEGIN TRANSACTION;

-- =========================================================
-- Author:		Ayala Alon
-- Description:	Delete user and all the cards linked to him
-- =========================================================

    BEGIN TRY
        DELETE FROM Cards
        WHERE UserID = @UserID;

        DELETE FROM Users
        WHERE UserID = @UserID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllCards]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCards]
AS
BEGIN
    SELECT * FROM Cards;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
    SELECT * FROM Users;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCardById]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetCardById]
    @CardID INT
AS
BEGIN
	SET NOCOUNT ON

    SELECT *

	FROM Cards 

	WHERE CardID = @CardID;

END;
GO
/****** Object:  StoredProcedure [dbo].[GetUserCardCountsByBackground]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================================================
-- Description:	Shows  user name, user ID and the amount of cards available for a certain background
-- =================================================================================================
CREATE PROCEDURE [dbo].[GetUserCardCountsByBackground]
    @Background NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
        u.UserID AS UserID,
        u.UserName AS UserName,
        COUNT(c.UserID) AS CardCount
    FROM 
        users u
    LEFT JOIN 
        cards c ON u.UserID = c.UserID
    WHERE 
        c.Background = @Background
    GROUP BY 
        u.UserID, u.UserName
    ORDER BY 
        u.UserID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCard]    Script Date: 22/07/2024 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--================================================
-- Author:		Ayala Alon
-- Description:	Update card
--================================================

CREATE PROCEDURE [dbo].[UpdateCard]
    @CardID INT,
    @UserID NVARCHAR(50),
    @Style NVARCHAR(50),
    @Text NVARCHAR(MAX),
    @Background NVARCHAR(50)
AS
BEGIN
    UPDATE Cards
    SET UserID = @UserID, 
        Style = @Style, 
        Text = @Text, 
        Background = @Background
    WHERE CardID = @CardID;
END;
GO
