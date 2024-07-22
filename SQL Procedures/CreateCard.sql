CREATE PROCEDURE CreateCard
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