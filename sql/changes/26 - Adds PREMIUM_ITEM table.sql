CREATE TABLE [dbo].[PREMIUM_ITEM](
	[Type] [tinyint] NULL,
	[ExpPercentLevelBefore55] [smallint] NULL,
	[ExpPercentLevelAfter55] [smallint] NULL,
	[ExpPercentDeath] [smallint] NULL,
	[NoahPercent] [smallint] NULL,
	[DropPercent] [smallint] NULL,
	[BonusLoyalty] [int] NULL,
	[RepairDiscountPercent] [smallint] NULL,
	[ItemSellPercent] [smallint] NULL
) ON [PRIMARY]

GO


INSERT INTO PREMIUM_ITEM VALUES (1,0,0,0,0,0,0,0,0)
INSERT INTO PREMIUM_ITEM VALUES (2,0,0,0,0,0,0,0,0)
INSERT INTO PREMIUM_ITEM VALUES (3,20,20,1,0,0,5,30,30)
INSERT INTO PREMIUM_ITEM VALUES (4,0,0,0,0,0,0,0,0)
INSERT INTO PREMIUM_ITEM VALUES (5,30,30,1,0,1,5,50,50)
INSERT INTO PREMIUM_ITEM VALUES (6,0,0,0,0,0,0,0,0)
INSERT INTO PREMIUM_ITEM VALUES (7,400,100,1,0,1,6,50,50)
INSERT INTO PREMIUM_ITEM VALUES (8,0,0,0,0,0,0,0,0)
GO