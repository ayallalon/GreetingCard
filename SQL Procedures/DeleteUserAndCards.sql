


CREATE PROCEDURE DeleteUserAndCards
    @UserID INT
AS
BEGIN
    BEGIN TRANSACTION;

-- =========================================================
-- Description:	Delete user and all cards linked to him
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
