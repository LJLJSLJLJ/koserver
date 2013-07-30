CREATE TABLE [dbo].[MAIL_BOX](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dtSendDate] [datetime] NOT NULL,
	[dtReadDate] [datetime] NULL,
	[bStatus] [tinyint] NOT NULL,
	[strSenderID] [varchar](21) NOT NULL,
	[strRecipientID] [varchar](21) NOT NULL,
	[strSubject] [varchar](31) NOT NULL,
	[strMessage] [varchar](128) NOT NULL,
	[bType] [tinyint] NOT NULL,
	[nItemID] [int] NOT NULL,
	[sCount] [smallint] NOT NULL,
	[sDurability] [smallint] NOT NULL,
	[nSerialNum] [bigint] NOT NULL,
	[nCoins] [int] NOT NULL,
	[bDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MAIL_BOX] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_dtSendDate]  DEFAULT (getdate()) FOR [dtSendDate]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_bStatus]  DEFAULT ((1)) FOR [bStatus]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_bType]  DEFAULT ((1)) FOR [bType]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_nItemID]  DEFAULT ((0)) FOR [nItemID]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_sCount]  DEFAULT ((0)) FOR [sCount]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_sDurability]  DEFAULT ((0)) FOR [sDurability]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_nSerialNum]  DEFAULT ((0)) FOR [nSerialNum]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_nCoins]  DEFAULT ((0)) FOR [nCoins]
GO

ALTER TABLE [dbo].[MAIL_BOX] ADD  CONSTRAINT [DF_MAIL_BOX_bDeleted]  DEFAULT ((0)) FOR [bDeleted]
GO
CREATE PROCEDURE [dbo].[MAIL_BOX_CHECK_COUNT]
	@strRecipientID varchar(21),
	@bCount tinyint OUTPUT
AS
SELECT TOP 12 @bCount = COUNT(*)
FROM MAIL_BOX
WHERE 
	strRecipientID = @strRecipientID AND
	-- Unread letter
	bStatus = 1 AND
	-- Letter is not deleted
	bDeleted = 0
GO
CREATE PROCEDURE MAIL_BOX_DELETE_LETTER
	@strRecipientID varchar(21),
	@nLetterID int
AS
UPDATE MAIL_BOX SET bDeleted = 1 WHERE id = @nLetterID AND strRecipientID = @strRecipientID
GO
CREATE PROCEDURE [dbo].[MAIL_BOX_GET_ITEM]
	@strRecipientID	varchar(21),
	@nLetterID		int
AS
BEGIN
	-- Retrieve the item
	SELECT 
		nItemID, sCount, sDurability, nCoins, nSerialNum
	FROM MAIL_BOX
	WHERE 
		id = @nLetterID AND 
		strRecipientID = @strRecipientID 
		AND bStatus = 1
		
	UPDATE 
		MAIL_BOX 
	SET 
		bStatus = 2
	WHERE 
		id = @nLetterID AND 
		strRecipientID = @strRecipientID 
END
GO
CREATE PROCEDURE [dbo].[MAIL_BOX_READ]
	@strRecipientID	varchar(21),
	@nLetterID		int
AS
BEGIN
	SELECT strMessage FROM MAIL_BOX 
	WHERE strRecipientID = @strRecipientID
	AND id = @nLetterID
	
	-- Mark the letter as read
	IF (@@ROWCOUNT != 0)
	BEGIN
		-- If there's no item attached, it can go straight to saved
		UPDATE MAIL_BOX SET dtReadDate = GETDATE(), bStatus = 2 
		WHERE id = @nLetterID AND bType = 1 AND dtReadDate IS NULL

		-- Otherwise, just update the read time.
		UPDATE MAIL_BOX SET dtReadDate = GETDATE() 
		WHERE id = @nLetterID AND bType = 2 AND dtReadDate IS NULL
	END
END
GO
CREATE PROCEDURE [dbo].[MAIL_BOX_REQUEST_LIST]
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
	ELSE
	BEGIN
		SELECT TOP 20
			id, bStatus, bType, strSubject, strSenderID, 
			bType, nItemID, sCount, nCoins,
			YEAR(dtSendDate) * 10000 + MONTH(dtSendDate) * 100 + DAY(dtSendDate),
			DATEDIFF(dd, GetDate(), dtSendDate + @expiresInDays)
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
GO
CREATE PROCEDURE [dbo].[MAIL_BOX_SEND]
	@strSenderID	varchar(21),
	@strRecipientID	varchar(21),
	@strSubject		varchar(31),
	@strMessage		varchar(128),
	@bType			tinyint,
	@nItemID		int,
	@sCount			smallint,
	@sDurability	smallint,
	@nSerialNum		bigint,
	@bRet			tinyint OUTPUT
AS
BEGIN
	IF (NOT EXISTS(SELECT strUserID FROM USERDATA WHERE strUserID = @strRecipientID))
	BEGIN
		SET @bRet = -1
		RETURN
	END
	
	-- NOTE: -2 seems to be too many letters.
	
	INSERT INTO MAIL_BOX 
		(strSenderID, strRecipientID, strSubject, strMessage,
		 bType, nItemID, sCount, sDurability, nSerialNum)
	VALUES
		(@strSenderID, @strRecipientID, @strSubject, @strMessage,
		 @bType, @nItemID, @sCount, @sDurability, @nSerialNum)
		 
	SET @bRet = 1
END
GO