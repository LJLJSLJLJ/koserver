
-- [¿ëº´´ëÀå Äí°Å]

-- EVENT ´Â 3000¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;

-- [¿ëº´´ëÀå Äí°Å] ¿ëº´´ëÀå Äí°Å Å¬¸¯ ½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 3000 then
	QuestNum = SearchQuest(UID, 13009);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 1186, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- ¹» ÇÏ´Â °É±î?
			 Ret = 1; -- ÀÌ°Ç ¿Ö ÀúÀå ½ÃÄÑ¿ä? ±×³É RETURNÀº ¾ÈµÇ³ª¿ä?
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 1187,13009)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 3001 then
    Ret = 1;
end

--½Ãµå ¹Ì¼¿ È£Ãâ 

if EVENT == 3002 then
   SelectMsg(UID, 1, 11, 1188, 13009, 28, 3003, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 3003 then
   ShowMap(UID, 6);
   SaveEvent(UID, 3033);
end

if EVENT == 3004 then
   SelectMsg(UID, 1, 11, 1189, 13009, 10, 3003, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- Äí°Å 301¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 3005 then
   SelectMsg(UID, 2, 11, 1190, 13009, 10, 3006, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 3006 then
   SelectMsg(UID, 4, 11, 1191, 13009, 22, 3007, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 3007 then
   ZoneChange(UID, 51, 150, 150)
   SaveEvent(UID, 3034);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 3008 then
   SaveEvent(UID, 3036);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 11, 1192, 13009, 32, 3009, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 11, 1193, 13009, 21, 3009, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 3009 then
   ShowMap(UID, 6);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 3010 then
   ITEM_COUNT = HowmuchItem(UID, 910038000);
   if  ITEM_COUNT <= 9 then -- Àç·á ¾øÀ»¶§
      SelectMsg(UID, 2, 11, 1194, 13009, 18, 3011, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 9 then-- Àç·á ÀÖÀ»¶§
      SelectMsg(UID, 2, 11, 1195, 13009, 4006, 3012, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 3011 then
   ZoneChange(UID, 51, 150, 150)
end

local Check;

if EVENT == 3012 then
        Check = CheckExchange(UID, 304)
        if  Check ==1 then
        RunExchange(UID, 304);
        SaveEvent(UID, 3035);
        else
        Ret = 1;	
        end	 
end

--San-juck captian start
-----------------------------------------------------------
-- »êÀû Åä¹ú´ë ½ÃÀÛ - ÃÊ±Þ
-----------------------------------------------------------
local NPC = 13009;
local savenum = 600;
local savenum1 = 601;
local savenum2 = 602;
-----------------------------------------------------------

--½Ãµå ¹Ì¼¿ È£Ãâ
if EVENT == 6000 then
   NATION = CheckNation(UID);
   SaveEvent(UID, 6002);
   if NATION == 1 then --Ä«ç½º ï¿½ 
   SelectMsg(UID, 1, savenum, 6000, NPC, 28, 6001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ï¿½Ï¶
   SelectMsg(UID, 1, savenum, 6001, NPC, 28, 6001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6001 then
   ShowMap(UID,6);
end

------------------------------------------------------------------------
-- SANJUK Campaign Troops Start
------------------------------------------------------------------------

local Level = 0;
if EVENT == 6014 then
   Level = CheckLevel(UID);
   if Level >= 5 and Level <= 9 then
   	SelectMsg(UID, 2, savenum, 6002, NPC, 6005, 6002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else 
	SelectMsg(UID, 2, savenum, 1311, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6002 then
   SelectMsg(UID, 4, savenum, 6003, NPC, 22, 6003, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local WATING = 0;

if EVENT == 6003 then
   WATING = CheckWaiting(1);  -- 1:Begginer  2:Medium  3:Higher
   if WATING == 1 then
      SelectMsg(UID, 2, savenum, 6004, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      return;
   end
--   SaveEvent(UID, 6003);
   --Ä«ï¿½Í° ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ 
   SetCampaignGrade(UID, 1, 3, 9, 6004, "13009_Kuger.lua");  -- 1:Begginer  2:Medium  3:Higher, level limitation 3 ~ 9
   SelectMsg(UID, 8, savenum, 6005, NPC, 6003, 3001, 6004, 3001, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   -- 8 is Campaign Invitation Message...
end
   
if EVENT == 6004 then
   SetClearType(1, 81, 1, 1636, 20, 1001, 6008, UID, "13009_Kuger.lua");  -- complete condition setting 1:Boss Mob Eliminate, 12001: Mob ID
--   SetClearType(UID, 2, 30, 30, 101, 4010);  -- complete condition setting 2:Time Endure, 30:Endure time (minutes)
--   SetClearType(UID, 3, 128128, 20, 101, 4010); -- completecondition setting 3:Region Arrival 128128:position cordinate
end
--/*ÀüÃ¼ UI Á¦°Å
if EVENT == 6005 then   -- A region passed  UID is contained zonenumber... broadcasting packets
   SelectMsg(UID, 6, 8101, 6006, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6006 then   -- B region passed
  SelectMsg(UID, 6, 8102, 6007, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6007 then   -- C region passed
   SelectMsg(UID, 6, 8103, 6008, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--ÀüÃ¼ UIÁ¦°Å */



--if EVENT == 6008 then   -- Quest Completed  WARNINIG!!! UID is contained zonenumber... broadcasting packets
--      GiveItem(UID, 910117000, 1);		
--     SaveEvent(UID, 6004);
--      SelectMsg(UID, 2, savenum1, 6012, NPC, 4006, 7200, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1); 
--end

--local quest_ITEM_COUNT1=0;
local Check;
if EVENT == 6008 then
   GiveItem(UID, 910117000, 1);		
   Check = CheckExchange(UID, 86)
   if  Check ==1 then
   RunExchange(UID, 86);
   else
   Ret = 1;	
   end	 
   SaveEvent(UID, 6004);
end

------------------------------------------------------------------------
-- SANJUK Campaign Troops End
------------------------------------------------------------------------

---------ï¿½ ï¿½ï¿½ï¿½

local quest_ITEM_COUNT=0;
if EVENT == 6009 then
   quest_ITEM_COUNT = HowmuchItem(UID, 910117000);
if quest_ITEM_COUNT == 1 then
   NATION = CheckNation(UID);
   SaveEvent(UID, 6005);
   if NATION == 1 then --Ä«ç½º ï¿½ 
   SelectMsg(UID, 1, savenum1, 6009, NPC, 28, 6010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ï¿½Ï¶
   SelectMsg(UID, 1, savenum1, 6010, NPC, 28, 6010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
  end
end

if EVENT == 6010 then
      ShowMap(UID, 53);
end

--1, 3
local ITEM_COUNT=0;
local RUN_EXCHANGE ;--ï¿½ï¿½Ã¼ ï¿½ï¿½ï¿½ ï¿½ï¿½

if EVENT == 6011 then
   ITEM_COUNT = HowmuchItem(UID, 910117000);
   if  ITEM_COUNT <= 0 then -- ï¿½ï¿½;
      SelectMsg(UID, 2, savenum1, 6011, NPC, 18, 6012, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 0 then-- ï¿½ï¿½ï¿½;
      --SaveEvent(UID, 6004);
      SelectMsg(UID, 2, savenum1, 6012, NPC, 4006, 6013, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6012 then
--   SaveEvent(UID, 6002);
   ShowMap(UID, 53);
end

local Check;

if EVENT == 6013 then
        Check = CheckExchange(UID, 86)
        if  Check ==1 then
        RunExchange(UID, 86);
        else
        Ret = 1;	
        end	 
end

-----------------------------------------------------------
-- »êÀû Åä¹ú´ë ³¡ 
-----------------------------------------------------------
--San-juck captian end

-------------------------------------------
---¿ë±âÀÇ º¸¼® ½ÃÀÛ -----------------------
-------------------------------------------

if EVENT == 6060 then
   SelectMsg(UID, 1, 7, 6014, 13009, 28, 6061, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6061 then
   ShowMap(UID, 6);
   SaveEvent(UID, 6023);
end

if EVENT == 6062 then
   SelectMsg(UID, 1, 7, 6015, 13009, 10, 6061, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- Äí°Å 301¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 6063 then
   SelectMsg(UID, 2, 7, 6016, 13009, 10, 6064, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local Level ;

if EVENT == 6064 then
Level = CheckLevel(UID)
   if Level < 21 then 
   SelectMsg(UID, 4, 7, 6017, 13009, 22, 6065, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
   SelectMsg(UID, 2, 7, 6018, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end

end

if EVENT == 6065 then
   ZoneChange(UID, 52, 150, 150)
   SaveEvent(UID, 6024);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 6066 then
   SaveEvent(UID, 6026);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 7, 6019, 13009, 32, 6067, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 7, 6020, 13009, 21, 6067, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6067 then
   ShowMap(UID, 6);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 6068 then
   ITEM_COUNT = HowmuchItem(UID, 910039000);
   if  ITEM_COUNT <= 9 then -- Àç·á ¾øÀ»¶§
      SelectMsg(UID, 2, 7, 6021, 13009, 18, 6069, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 9 then-- Àç·á ÀÖÀ»¶§
      SelectMsg(UID, 2, 7, 6022, 13009, 4006, 6070, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6069 then
   ZoneChange(UID, 52, 150, 150)
end

local Check;

if EVENT == 6070 then
        Check = CheckExchange(UID, 600)
        if  Check ==1 then
        RunExchange(UID, 600);
        SaveEvent(UID, 6025);
        else
        Ret = 1;	
        end	 
end
-------------------------------------------
---¿ë±âÀÇ º¸¼® ³¡ -----------------------
-------------------------------------------

-------------------------------------------
---¹èÆ² ÇÊµå ½ÃÀÛ -----------------------
-------------------------------------------

if EVENT == 6080 then
   SelectMsg(UID, 1, 602, 6030, 13009, 28, 6061, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6081 then
   ShowMap(UID, 6);
   SaveEvent(UID, 6033);
end

if EVENT == 6082 then
   SelectMsg(UID, 1, 602, 6031, 13009, 10, 6081, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- Äí°Å 301¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 6083 then
   SelectMsg(UID, 2, 602, 6032, 13009, 10, 6084, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local Level ;

if EVENT == 6084 then
Level = CheckLevel(UID)
   if Level > 1 and Level < 39 then -- ·¹º§ÀÌ 40ÀÌÇÏÀÎ°¡?   
   SelectMsg(UID, 2, 602, 6033, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if Level == 40 then -- ·¹º§ÀÌ 40ÀÌ»óÀÎ°¡?   
   SelectMsg(UID, 2, 602, 6034, 13009, 59, 6085, 60, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);   
   end
   if Level > 40 then -- ·¹º§ÀÌ 41ÀÌ»óÀÎ°¡?   
   SelectMsg(UID, 2, 602, 6035, 13009, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6085 then
   ZoneChange(UID, 53, 150, 150)
   SaveEvent(UID, 6034);
end

-- ·¹º§ÀÌ 41ÀÌ µÇ¾úÀ»¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©
local Level = 0 ;
if EVENT == 6086 then
Level = CheckLevel(UID)
   if Level == 41 then
   SaveEvent(UID, 6035);
      NATION = CheckNation(UID);
      if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
         SelectMsg(UID, 1, 602, 6036, 13009, 61, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- ¿¤¸ðÀÏ¶§
         SelectMsg(UID, 1, 602, 6037, 13009, 62, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end

-------------------------------------------
---¿ë±âÀÇ º¸¼® ³¡ -----------------------
-------------------------------------------


--******************************************************--
-- µå·¡°ï »ç³É ½ÃÀÛ 
--******************************************************--

local savenum = 444;

-- ½Ãµå¹Ì¼¿ µîÀå

if EVENT == 630 then
   Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4377);
    EVENT = 631
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4382);
    EVENT = 631
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4387);
    EVENT = 631
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4392);
     EVENT = 631
   end
end

if EVENT == 631 then
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
    SelectMsg(UID, 1, savenum, 4635, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
    SelectMsg(UID, 1, savenum, 4636, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


-- 444 ¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

local MonsterSub = 0;

if EVENT == 632 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ¾øÀ»¶§
    SelectMsg(UID, 4, savenum, 4637, NPC, 22, 633, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- ¸ó½ºÅÍ ¼­ºê Äù½ºÆ®°¡ ÀÖÀ»¶§
    SelectMsg(UID, 2, savenum, 4638, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end



if EVENT == 633 then --¼ö¶ô½Ã
   Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4378);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4383);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4388);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4393);
   end
end


-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ»¶§ ½Ãµå ¶Ç µîÀå 

if EVENT == 280 then
   Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4380);
    EVENT = 281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4385);
    EVENT = 281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4390);
    EVENT = 281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4395);
     EVENT = 281
   end
end

if EVENT == 281 then
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
    SelectMsg(UID, 1, savenum, 4639, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
    SelectMsg(UID, 1, savenum, 4640, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


-- 444ÀÇ 1¹ø 3¹øÀÎ °æ¿ì 

local MonsterCount01
local MonsterCount02
local MonsterCount03
local MonsterCount04


if EVENT == 636 then
   MonsterCount01  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount01  > 0 then -- »ç³ÉÀÌ ¿Ï·á µÇ¾úÀ»¶§ 
    Class = CheckClass (UID);
        if Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, savenum, 4642, NPC, 4161, 637, 4162, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else
        SelectMsg(UID, 4, savenum, 4642, NPC, 4161, 637, 4162, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else -- »ç³ÉÀÌ ³²¾ÒÀ»¶§
    SelectMsg(UID, 2, savenum, 4641, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local Check;

if EVENT == 637 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 501)
        if  Check ==1 then        
        RunExchange(UID, 501);
        SaveEvent(UID, 4379);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 502)
        if  Check ==1 then        
        RunSelectExchange(UID, 502);
        SaveEvent(UID, 4384);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 503)
        if  Check ==1 then        
        RunExchange(UID, 503);
        SaveEvent(UID, 4389);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 504)
        if  Check ==1 then        
        RunExchange(UID, 504);
        SaveEvent(UID, 4394);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

--******************************************************--
-- µå·¡°ï »ç³É ³¡
--******************************************************--


return Ret;