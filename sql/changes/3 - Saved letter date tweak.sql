ALTER PROCEDURE [dbo].[MAIL_BOX_REQUEST_LIST]
	@strRecipientID varchar(21),
	@bNewLettersOnly tinyint,
	@bCount tinyint OUTPUT
AS
DECLARE @expiresInDays int = 7
BEGIN
	-- Can only see 12 unread letters at a time
	IF (@bNewLettersOnly = 1)
	BEGIN
		SELECT TOP 12
			id, bStatus, bType, strSubject, strSenderID, 
			bType, nItemID, sCount, nCoins,
			YEAR(dtSendDate) * 10000 + MONTH(dtSendDate) * 100 + DAY(dtSendDate),
			DATEDIFF(dd, GetDate(), dtSendDate + @expiresInDays)
		FROM MAIL_BOX
		WHERE 
			strRecipientID = @strRecipientID AND
			-- Unread letter
			bStatus = 1 AND
			-- Letter is not deleted
			bDeleted = 0
	END
	-- Request saved letters
	ELSE
	BEGIN
		SELECT TOP 20
			id, bStatus, bType, strSubject, strSenderID, 
			bType, nItemID, sCount, nCoins,
			YEAR(dtReadDate) * 10000 + MONTH(dtReadDate) * 100 + DAY(dtReadDate),
			DATEDIFF(dd, dtReadDate, GetDate())
		FROM MAIL_BOX
		WHERE 
			strRecipientID = @strRecipientID AND
			-- Read letter
			bStatus = 2 AND
			-- Letter is not deleted
			bDeleted = 0
	END
	SET @bCount = @@ROWCOUNT
END
