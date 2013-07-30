UPDATE ZONE_INFO SET InitX = 81590, InitZ = 53079, InitY = 469 WHERE ZoneNo = 21
GO

ALTER PROCEDURE [dbo].[CREATE_NEW_CHAR]
	@nRet		smallint OUTPUT, 
	@AccountID	varchar(21), 
	@index		tinyint,
	@CharID		varchar(21),
	@Race		tinyint, 
	@Class		smallint, 
	@Hair		int,
	@Face 		tinyint, 
	@Str 		tinyint, 
	@Sta 		tinyint, 
	@Dex 		tinyint,
	@Intel 		tinyint, 
	@Cha 		tinyint
AS
DECLARE @Row tinyint, @Nation tinyint, @Zone tinyint, @PosX int, @PosZ int, @PosY int

	SET @Row = 0	SET @Nation = 0  SET @Zone = 21  SET @PosX = 0 SET @PosZ = 0 SET @PosY = 0
	SELECT @PosX = InitX, @PosZ = InitZ, @PosY = InitY from ZONE_INFO where ZoneNo = 21
	SELECT @Nation = bNation, @Row = bCharNum FROM ACCOUNT_CHAR WHERE strAccountID = @AccountID
	IF @Row >= 3	SET @nRet =  1
	
	IF @Nation = 1 AND @Race > 10	SET @nRet = 2
	ELSE IF @Nation = 2 AND @Race < 10	SET @nRet = 2
	ELSE IF @Nation <>1 AND @Nation <> 2	SET @nRet = 2

	IF @nRet > 0
		RETURN
	
	SELECT @Row = COUNT(*) FROM USERDATA WHERE strUserId = @CharID
	IF @Row > 0 
	BEGIN
		SET @nRet =  3
		RETURN
	END

BEGIN TRAN	
	IF @index = 0
		UPDATE ACCOUNT_CHAR SET strCharID1 = @CharID, bCharNum = bCharNum + 1 WHERE strAccountID = @AccountID
	ELSE IF @index = 1
		UPDATE ACCOUNT_CHAR SET strCharID2 = @CharID, bCharNum = bCharNum + 1 WHERE strAccountID = @AccountID
	ELSE IF @index = 2
		UPDATE ACCOUNT_CHAR SET strCharID3 = @CharID, bCharNum = bCharNum + 1 WHERE strAccountID = @AccountID
	ELSE 
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
	
	INSERT INTO USERDATA (strUserId, Nation, Race, Class, HairRGB, Face, Strong, Sta, Dex, Intel, Cha, Zone, PX, PZ, PY) 
	VALUES	 (@CharID, @Nation, @Race, @Class, @Hair, @Face, @Str, @Sta, @Dex, @Intel, @Cha, @Zone, @PosX, @PosZ, @PosY)
	IF @@ERROR <> 0
	BEGIN	 
		ROLLBACK TRAN 
		SET @nRet =  4
		RETURN
	END
		
COMMIT TRAN
SET    @nRet =  0

GO