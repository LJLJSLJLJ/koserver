DECLARE @constraint as sysname
SELECT @constraint = b.name FROM sys.all_columns a 
INNER JOIN
sys.default_constraints b
ON a.default_object_id = b.object_id
WHERE a.object_id = OBJECT_ID('USERDATA')
AND a.name = 'HairColor'
IF (@constraint IS NOT NULL)
	EXEC('ALTER TABLE USERDATA DROP CONSTRAINT ' + @constraint)
GO
ALTER TABLE USERDATA DROP COLUMN HairColor
GO
ALTER TABLE USERDATA ADD HairRGB int NOT NULL DEFAULT 0
GO
CREATE PROCEDURE [CHANGE_HAIR]
        @strAccountID   varchar(21),
        @strCharID              varchar(21),
        @bType                  tinyint,
        @bFace                  tinyint,
        @nHair                  int,
        @nRet                   tinyint output
AS
BEGIN
        SET @nRet = 1 -- failed

        -- Make sure the account/char combination exists
        IF (NOT EXISTS(SELECT strAccountID FROM ACCOUNT_CHAR WHERE strAccountID = @strAccountID AND @strCharID IN(strCharID1, strCharID2, strCharID3)))
                RETURN

        -- TO-DO: When we have more info on the type (and moreover, when this should be called)
        -- we'll implement better checks (as is, anyone can use this whenever they like).

        -- Update the hair/face data
        UPDATE USERDATA SET HairRGB = @nHair, Face = @bFace WHERE strUserID = @strCharID 
        SET @nRet = 0 -- succeeded
END
GO
ALTER PROCEDURE [dbo].[LOAD_USER_DATA]
	@AccountID	varchar(21),
	@id			varchar(21),
	@nRet		smallint OUTPUT
AS
DECLARE @charid1 varchar(21), @charid2 varchar(21), @charid3 varchar(21)
BEGIN
	SET @nRet = 0
	SELECT @charid1 = ISNULL(strCharID1, ''), @charid2 = ISNULL(strCharID2, ''), @charid3 = ISNULL(strCharID3, '') FROM ACCOUNT_CHAR WHERE strAccountID = @AccountID
	IF @id NOT IN(@charid1, @charid2, @charid3)
		RETURN

	SELECT Nation, Race, Class, HairRGB, Rank, Title, [Level], [Exp], Loyalty, Face, City, Knights, Fame, Hp, Mp, Sp, Strong, Sta, Dex, Intel, Cha, Authority, Points, Gold, [Zone], Bind, PX, PZ, PY, dwTime, strSkill, strItem,strSerial, sQuestCount, strQuest, MannerPoint, LoyaltyMonthly FROM    USERDATA WHERE strUserId = @id
	SET @nRet = @@ROWCOUNT
END
GO
ALTER PROCEDURE [dbo].[UPDATE_USER_DATA]
	@id 		varchar(21),
	@Nation	tinyint,
	@Race		tinyint,
	@Class		smallint,
	@HairRGB	int,
	@Rank		tinyint,
	@Title		tinyint,
	@Level		tinyint,
	@Exp		int,
	@Loyalty	int,
	@Face		tinyint, 
	@City		tinyint,	
	@Knights	smallint,
	@Fame		tinyint,
	@Hp		smallint,
	@Mp		smallint, 
	@Sp		smallint,
	@Str		tinyint,
	@Sta		tinyint,
	@Dex		tinyint,
	@Intel		tinyint,
	@Cha		tinyint,
	@Authority	tinyint,
	@Points		smallint,	
	@Gold		int,
	@Zone		tinyint,
	@Bind		smallint,
	@PX		int,
	@PZ		int,
	@PY		int,
	@dwTime	int,
	@QuestTotal     smallint,
	@strSkill	varchar(10),
	@strItem	binary(584),
	@strSerial	binary(584),
	@strQuest	binary(600),
	@MannerPoint   int,
	@LoyaltyMonthly	int
AS

DECLARE @KnightsIndex smallint, @isKing int

IF @Zone > 2		-- battle zone user
BEGIN
	SELECT @KnightsIndex=Knights FROM USERDATA WHERE strUserId=@id
	IF @KnightsIndex = -1	-- expel user
	BEGIN
		SET @Knights = 0
		SET @Fame = 0
	END
END

UPDATE	USERDATA
SET
	Nation		= @Nation,
	Race		= @Race,
	Class		= @Class,
	HairRGB		= @HairRGB,
	Rank		= @Rank,
	Title		= @Title,
	[Level]		= @Level,
	[Exp]		= @Exp,
	Loyalty		= @Loyalty,
	Face		= @Face, 
	City		= @City,	
	Knights		= @Knights,
	Fame		= @Fame,
	Hp		= @Hp,
	Mp		= @Mp, 
	Sp		= @Sp,
	Strong		= @Str,
	Sta		= @Sta,
	Dex		= @Dex,
	Intel		= @Intel,
	Cha		= @Cha,
	Authority	= @Authority,
	Points		= @Points,
	Gold		= @Gold,
	[Zone]		= @Zone,
	Bind		= @Bind,
	PX		= @PX,
	PZ		= @PZ,
	PY		= @PY,
	dwTime		= @dwTime,
	strSkill		= @strSkill,
	strItem		= @strItem,
	strSerial		= @strSerial,
	sQuestCount	= @QuestTotal,
	strQuest		= @strQuest,
	MannerPoint 	= @MannerPoint,
	LoyaltyMonthly	= @LoyaltyMonthly,
	UpdateTime       = GetDate()
WHERE	strUserId	= @id

SET ROWCOUNT 1
GO
ALTER PROCEDURE [dbo].[LOAD_CHAR_INFO]
	@CharId	varchar(21),
	@nRet	smallint OUTPUT
AS
SELECT @nRet = COUNT(strUserId) FROM USERDATA WHERE strUserId = @CharId
IF @nRet = 0
	RETURN

SET @nRet = 1
SELECT Race, Class, HairRGB, [Level], Face, Zone, strItem FROM USERDATA WHERE strUserID = @CharId
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
DECLARE @Row tinyint, @Nation tinyint, @Zone tinyint, @PosX int, @PosZ int

	SET @Row = 0	SET @Nation = 0  SET @Zone = 0  SET @PosX = 0 SET @PosZ = 0
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

	SET @Zone=21

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
	
	INSERT INTO USERDATA (strUserId, Nation, Race, Class, HairRGB, Face, Strong, Sta, Dex, Intel, Cha, Zone, PX, PZ) 
	VALUES	 (@CharID, @Nation, @Race, @Class, @Hair, @Face, @Str, @Sta, @Dex, @Intel, @Cha, @Zone, @PosX, @PosZ)
	IF @@ERROR <> 0
	BEGIN	 
		ROLLBACK TRAN 
		SET @nRet =  4
		RETURN
	END
		
COMMIT TRAN
SET    @nRet =  0
GO
ALTER TABLE USERDATA DROP CONSTRAINT DF_USERDATA_Points
ALTER TABLE USERDATA ALTER COLUMN Points smallint NOT NULL
ALTER TABLE USERDATA ADD CONSTRAINT DF_USERDATA_Points DEFAULT 0 FOR Points
GO
ALTER TABLE USERDATA ADD strItemB binary(584) NULL
ALTER TABLE USERDATA ADD strSerialB binary(584) NULL
ALTER TABLE WAREHOUSE ADD WarehouseDataB binary(1536) NULL
ALTER TABLE WAREHOUSE ADD strSerialB binary(1536) NULL
GO
UPDATE USERDATA SET strItemB = CONVERT(binary(584), strItem) 
UPDATE USERDATA SET strSerialB = CONVERT(binary(584), strSerial) 
UPDATE WAREHOUSE SET WarehouseDataB = CONVERT(binary(1536), WarehouseData) 
UPDATE WAREHOUSE SET strSerialB = CONVERT(binary(1536), strSerial) 
GO
ALTER TABLE USERDATA DROP COLUMN strItem
ALTER TABLE USERDATA DROP COLUMN strSerial
ALTER TABLE WAREHOUSE DROP COLUMN WarehouseData
ALTER TABLE WAREHOUSE DROP COLUMN strSerial
GO
EXEC sp_rename 'USERDATA.strItemB', 'strItem', 'COLUMN'
EXEC sp_rename 'USERDATA.strSerialB', 'strSerial', 'COLUMN'
EXEC sp_rename 'WAREHOUSE.WarehouseDataB', 'WarehouseData', 'COLUMN'
EXEC sp_rename 'WAREHOUSE.strSerialB', 'strSerial', 'COLUMN'
GO
ALTER  PROCEDURE [dbo].[UPDATE_WAREHOUSE]
	@accountid 		varchar(21),
	@Money		int,
	@dwTime		int,
	@strItem		binary(1536),
	@strSerial		binary(1536)
AS
UPDATE	WAREHOUSE
Set
	nMoney		= @Money,
	dwTime		= @dwTime,
	WarehouseData	= @strItem,
	strSerial		= @strSerial
WHERE	strAccountID	= @accountid
GO
ALTER TABLE KNIGHTS ADD bCapeR tinyint NOT NULL DEFAULT 0
ALTER TABLE KNIGHTS ADD bCapeG tinyint NOT NULL DEFAULT 0
ALTER TABLE KNIGHTS ADD bCapeB tinyint NOT NULL DEFAULT 0
GO
DROP TABLE [dbo].[KNIGHTS_CAPE]
GO
CREATE TABLE [dbo].[KNIGHTS_CAPE](
        [sCapeIndex] [smallint] NOT NULL,
        [strName] [char](30) NOT NULL,
        [nBuyPrice] [int] NOT NULL,
        [nDuration] [int] NOT NULL,
        [byGrade] [tinyint] NOT NULL,
        [nBuyLoyalty] [int] NOT NULL,
        [byRanking] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE USERDATA ADD strQuestB binary(600) NULL
GO
UPDATE USERDATA SET strQuestB = CONVERT(binary(600), strQuest) 
GO
ALTER TABLE USERDATA DROP COLUMN strQuest
GO
EXEC sp_rename 'USERDATA.strQuestB', 'strQuest', 'COLUMN'
GO
