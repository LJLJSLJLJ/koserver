ALTER PROCEDURE [dbo].[ACCOUNT_LOGIN]
	@AccountID	varchar(21),
	@Password	varchar(32),
	@nRet		smallint	OUTPUT
AS
DECLARE @Nation tinyint, @CharNum smallint, @pwd varchar(32)
SELECT @pwd = strPasswd FROM TB_USER WHERE strAccountID = @AccountID AND strAuthority != 255
IF @@ROWCOUNT = 0 --OR @pwd != @Password 
BEGIN
	SET @nRet = 0
	RETURN
END

SELECT @Nation = bNation, @CharNum = bCharNum FROM ACCOUNT_CHAR WHERE strAccountID = @AccountID
IF @@ROWCOUNT = 0 OR @CharNum = 0
	SET @nRet = 1
ELSE 
	SET @nRet = @Nation+1