DECLARE @constraint as sysname
SELECT @constraint = b.name FROM sys.all_columns a 
INNER JOIN
sys.default_constraints b
ON a.default_object_id = b.object_id
WHERE a.object_id = OBJECT_ID('USERDATA')
AND a.name = 'Exp'
IF (@constraint IS NOT NULL)
	EXEC('ALTER TABLE USERDATA DROP CONSTRAINT ' + @constraint)
GO
ALTER TABLE USERDATA ALTER COLUMN [Exp] bigint NOT NULL 
ALTER TABLE USERDATA ADD CONSTRAINT [DF_Exp] DEFAULT 0 FOR [Exp]
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
	@Exp		bigint,
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