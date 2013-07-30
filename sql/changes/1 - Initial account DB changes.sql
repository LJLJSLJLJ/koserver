ALTER PROCEDURE [dbo].[ACCOUNT_LOGOUT]
	@AccountID	varchar(21),
	@nRet		smallint OUTPUT
AS
BEGIN
	DELETE FROM CURRENTUSER WHERE strAccountID = @AccountID
	SET @nRet = 1
END
GO
CREATE PROCEDURE [dbo].[MAIN_LOGIN]
        @AccountID      varchar(21),
        @Password       varchar(13),
        @nRet smallint OUTPUT
AS
DECLARE @pwd varchar(32), @strAuthority tinyint, @expiryTime datetime, @strUserId varchar(21)
BEGIN
        SELECT @pwd = strPasswd, @strAuthority = strAuthority FROM TB_USER WHERE strAccountID = @AccountID
        IF @@ROWCOUNT = 0 -- auto-registration, easiest for testing because of encryption scheme
        BEGIN
                INSERT INTO TB_USER (strAccountID, strPasswd) VALUES(@AccountID, @Password)
                SET @nRet = 1 --2
                RETURN
        END
        -- pass check disabled because of encryption scheme (for now)
        /*ELSE IF (@pwd != @Password)
        BEGIN
                SET @nRet = 3
                RETURN
        END*/
        -- account banned
        ELSE IF (@strAuthority = 255)
        BEGIN
                SET @nRet = 4
                RETURN
        END
        SET @nRet = 1
END
GO