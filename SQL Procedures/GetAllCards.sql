USE GCDB

GO

CREATE PROCEDURE GetAllCards
AS
BEGIN
    SELECT * FROM Cards;
END;