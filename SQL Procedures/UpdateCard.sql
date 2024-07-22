

CREATE PROCEDURE UpdateCard
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
