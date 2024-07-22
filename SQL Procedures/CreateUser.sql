

CREATE PROCEDURE CreateUser
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