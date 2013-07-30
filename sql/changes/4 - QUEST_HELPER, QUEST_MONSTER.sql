
CREATE TABLE [dbo].[QUEST_HELPER](
	[nIndex] [int] NOT NULL,
	[bMessageType] [tinyint] NOT NULL,
	[bLevel] [tinyint] NOT NULL,
	[nExp] [int] NOT NULL,
	[bClass] [tinyint] NOT NULL,
	[bNation] [tinyint] NOT NULL,
	[bQuestType] [tinyint] NOT NULL,
	[bZone] [tinyint] NOT NULL,
	[sNpcId] [smallint] NOT NULL,
	[sEventDataIndex] [smallint] NOT NULL,
	[bEventStatus] [tinyint] NOT NULL,
	[nEventTriggerIndex] [int] NOT NULL,
	[nEventCompleteIndex] [int] NOT NULL,
	[nExchangeIndex] [int] NOT NULL,
	[nEventTalkIndex] [int] NOT NULL,
	[strLuaFilename] [char](40) NOT NULL
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[QUEST_MONSTER](
	[sQuestNum] [smallint] NOT NULL,
	[sNum1a] [smallint] NOT NULL,
	[sNum1b] [smallint] NOT NULL,
	[sNum1c] [smallint] NOT NULL,
	[sNum1d] [smallint] NOT NULL,
	[sCount1] [smallint] NOT NULL,
	[sNum2a] [smallint] NOT NULL,
	[sNum2b] [smallint] NOT NULL,
	[sNum2c] [smallint] NOT NULL,
	[sNum2d] [smallint] NOT NULL,
	[sCount2] [smallint] NOT NULL,
	[sNum3a] [smallint] NOT NULL,
	[sNum3b] [smallint] NOT NULL,
	[sNum3c] [smallint] NOT NULL,
	[sNum3d] [smallint] NOT NULL,
	[sCount3] [smallint] NOT NULL,
	[sNum4a] [smallint] NOT NULL,
	[sNum4b] [smallint] NOT NULL,
	[sNum4c] [smallint] NOT NULL,
	[sNum4d] [smallint] NOT NULL,
	[sCount4] [smallint] NOT NULL
) ON [PRIMARY]

GO