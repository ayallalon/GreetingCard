
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================================================
-- Description:	Shows  user name, user ID and the amount of cards available for a certain background
-- =================================================================================================
CREATE PROCEDURE GetUserCardCountsByBackground
    @Background NVARCHAR(255)
AS
BEGIN
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
