USE [GCDB]
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 22/07/2024 14:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
    SELECT * FROM Users;
END;
