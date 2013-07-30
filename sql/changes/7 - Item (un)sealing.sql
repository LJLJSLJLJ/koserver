--Changing TB_USER table to add a column for the seal password used in the sealing / unsealing process
--(can NOT be NULL, default 00000000)
ALTER TABLE TB_USER
ADD
strSealPassword varchar(8) NOT NULL
DEFAULT 00000000;

GO

-- Create the table in which the sealed items will be stored (Duhh "SEALED_ITEMS"??)
CREATE TABLE [SEALED_ITEMS](
	[nItemSerial] [bigint] NOT NULL,
	[strAccountID] [char](21) NOT NULL,
	[strUserID] [char](21) NOT NULL,
	[bSealType] [tinyint] NOT NULL,
	[nItemID] [int] NOT NULL
) ON [PRIMARY]

GO


--Create the procedure that will handle the item being sealed (added) / unsealed (deleted)

CREATE PROCEDURE [USER_ITEM_SEAL]
@strAccountID	char(21),
@strUserID		char(21),
@strPasswd		char(8),
@nItemSerial	bigint,
@nItemID		int,
@bSealType		tinyint,
@bDoSeal		bit,
@nRet			tinyint OUTPUT

AS
DECLARE @strSealPasswd char(8)
BEGIN

SET @nRet = 2 --Default error : "Item Sealing failed."

SELECT @strSealPasswd = strSealPassword FROM TB_USER WHERE strAccountID = @strAccountID

IF @strSealPasswd <> @strPasswd
	BEGIN
		SET @nRet = 4 --"Invalid Citizen Registration number"
		RETURN
	END
ELSE
	BEGIN
		IF @bDoSeal = 1			--If we are sealing
			INSERT INTO SEALED_ITEMS (strAccountID, strUserID, nItemSerial, nItemID, bSealType) VALUES (@strAccountID, @strUserID, @nItemSerial, @nItemID, @bSealType)
		ELSE IF @bDoSeal = 0	--If we are unsealing
			DELETE FROM SEALED_ITEMS WHERE nItemSerial = @nItemSerial AND strAccountID = @strAccountID AND strUserID = @strUserID AND nItemID = @nItemID
		SET @nRet = 1 -- "Success!"
	END

RETURN
END
GO

--Add the procedure that'll handle the loading of your character's sealed item(s)
CREATE PROCEDURE [LOAD_SEALED_ITEM_DATA]
@strAccountID	char(21)
AS

SELECT nItemSerial, nItemID, bSealType
FROM SEALED_ITEMS
WHERE strAccountID = @strAccountID

GO