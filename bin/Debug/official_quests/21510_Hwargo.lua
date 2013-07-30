-- [È­¸£°í]

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ð...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 21510;

-- [È­¸£°í] Å¬¸¯½Ã Äù½ºÆ® Ã¼Å©  




if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 1252, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- ¹» ÇÏ´Â °É±î?
			 Ret = 1; -- ÀÌ°Ç ¿Ö ÀúÀå ½ÃÄÑ¿ä? ±×³É RETURNÀº ¾ÈµÇ³ª¿ä?
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 1253, NPC)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--ÇÉ¼­µ¶ ¼öÁý
--. ¹Ì½©

-------------------------------
------Ã´ÈÄ º¸°í¼­-----
-------------------------------

if EVENT == 195 then
   SelectMsg(UID, 1, 8, 1172, NPC, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 45);
   SaveEvent(UID, 467);
end

--  102¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 200 then
   SelectMsg(UID, 2, 8, 1173, NPC, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 8, 1174, NPC, 22, 202, 23, 203, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local ITEM_COUNT3=0;
local Weight;
local Slot;

if EVENT == 202 then
     ITEM_COUNT3 = HowmuchItem(UID, 910044000); 
   if  ITEM_COUNT3 <= 0 then -- Àç·á ¾øÀ»¶§
   Weight = CheckGiveWeight(UID, 910044000, 1) ;
   Slot = CheckGiveSlot(UID);
   if Weight==1 and Slot >= 1 then 
   GiveItem(UID, 910044000, 1);
   SaveEvent(UID, 468);
   else
   ret = 1 ;
   end
   end
   if  ITEM_COUNT3 > 0 then -- Àç·á ÀÖÀ»¶§
      SelectMsg(UID, 2, 8, 1257, NPC, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


if EVENT == 203 then
   SaveEvent(UID, 471);
end

-- Àç·á¸¦ ´Ù ¸ð¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 205 then
   SaveEvent(UID, 470);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 8, 1175, NPC, 32, 208, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ðÀÏ¶§
      SelectMsg(UID, 1, 8, 1176, NPC, 21, 208, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 210 then
     ITEM_COUNT1 = HowmuchItem(UID, 910040000); 
     ITEM_COUNT2 = HowmuchItem(UID, 910041000); 
		if ITEM_COUNT1 < 5 then 
        SelectMsg(UID, 2, 8, 1177, NPC, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
		elseif ITEM_COUNT2 < 1 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
        SelectMsg(UID, 2, 8, 1178, NPC, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
        SelectMsg(UID, 4, 8, 1179, NPC, 41, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
		end
end


if EVENT == 213 then
   ShowMap(UID, 46);
end

local Check;

if EVENT == 214 then
  Check = CheckExchange(UID, 88)
   if  Check ==1 then
   RunExchange(UID, 88);	   
   SaveEvent(UID, 469);      
   else
  Ret = 1;	
  end	 
end

-------------------------------
------Ã´ÈÄ º¸°í¼­  ³¡---
-------------------------------

--******************************************************--
-- ÀÏ°ö ¿­¼è ¼öÈ£ÀÚ ½ÃÀÛ 
--******************************************************--


local NPC = 21510;
local savenum = 9;

-- ½Ãµå¹Ì¼¿ µîÀå

if EVENT == 530 then
   NATION = CheckNation(UID);
      if NATION == 1 then --Ä«·ç½º ÀÏ¶§ 
      SaveEvent(UID, 4205);
      SelectMsg(UID, 1, savenum, 4194, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- ¿¤¸ðÀÏ¶§
      SaveEvent(UID, 4210);
      SelectMsg(UID, 1, savenum, 4195, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

-- 9¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 532 then   
    SelectMsg(UID, 4, savenum, 4196, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 533 then
   SaveEvent(UID, 4206); --¼ö¶ô½Ã
   GiveItem(UID, 910050000, 1);
end

if EVENT == 534 then
   SaveEvent(UID, 4209); -- °ÅÀý½Ã 
end

-- 9¹øÀÇ ¼Ó¼º 1¹ø 3¹øÀÏ °æ¿ì

local ItemA
local ItemB

if EVENT == 536 then
ItemA = HowmuchItem(UID, 910057000); --7¹øÂ° ¿­¼è
ItemB = HowmuchItem(UID, 910050000); -- ¸í·É¼­
    if  ItemA == 0 then -- Àç·á°¡ ¾øÀ»¶§
       if ItemB == 0 then -- ¸í·É¼­µµ  ¾øÀ»¶§
       GiveItem(UID, 910050000, 1);
       SelectMsg(UID, 2, savenum, 4198, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- B Àç·á ÀÖÀ»¶§ 
       SelectMsg(UID, 2, savenum, 4199, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
    else --7¹øÂ° ¿­¼è ÀÖÀ»¶§ 
    SelectMsg(UID, 2, savenum, 4197, NPC, 4172, 537, 4173, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 537 then
   SaveEvent(UID, 4207);
   RunExchange(UID, 470);
end


--******************************************************--
-- ÀÏ°ö ¿­¼è ¼öÈ£ÀÚ ³¡ 
--******************************************************--

--San-juck captian start
-----------------------------------------------------------
-- ¸ó½ºÅÍ Åä¹ú´ë ½ÃÀÛ - Áß±Þ
-----------------------------------------------------------
local NPC = 21510;
local savenum = 603;
local savenum1 = 604;

-----------------------------------------------------------

--½Ãµå ¹Ì¼¿ È£Ãâ
if EVENT == 6090 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       SaveEvent(UID, 6078);
       EVENT = 7009
       elseif Class == 2 or Class == 7 or Class == 8 then
       SaveEvent(UID, 6084);
       EVENT = 7009
       elseif Class == 3 or Class == 9 or Class == 10 then
       SaveEvent(UID, 6090);
       EVENT = 7009
      elseif Class == 4 or Class == 11 or Class == 12 then
       SaveEvent(UID, 6096);
       EVENT = 7009
      end
end

if EVENT == 7009 then
   NATION = CheckNation(UID);
   if NATION == 1 then --Ä«ç½º ï¿½ 
   SelectMsg(UID, 1, savenum, 6039, NPC, 28, 6091, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ï¿½Ï¶
   SelectMsg(UID, 1, savenum, 6040, NPC, 28, 6091, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6091 then
   ShowMap(UID,45);
end

------------------------------------------------------------------------
-- SANJUK Campaign Troops Start
------------------------------------------------------------------------

local Level = 0;
if EVENT == 6092 then
   Level = CheckLevel(UID);
   if Level >= 40 and Level <= 50 then
   	SelectMsg(UID, 2, savenum, 6065, NPC, 6007, 6093, 6008, 7002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else 
	SelectMsg(UID, 2, savenum, 6066, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 6093 then
    SelectMsg(UID, 4, savenum, 6067, NPC, 22, 6094, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local WATING = 0;
local PARTYCOUNT = 0;
if EVENT == 6094 then
--   WATING = CheckWaiting(2);  -- 1:Begginer  2:Medium  3:Higher
--   if WATING == 1 then
--      SelectMsg(UID, 2, savenum, 6044, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
--      return;
--   end
--   SaveEvent(UID, 6003);
   --Ä«ï¿½Í° ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ 
--   SetCampaignGrade(UID, 2, 40, 50, 6095);  -- 1:Begginer  2:Medium  3:Higher, level limitation 40 ~ 50
--   SelectMsg(UID, 8, savenum, 6045, NPC, 6003, 3001, 6004, 3001, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   -- 8 is Campaign Invitation Message...
--end
   PARTYCOUNT = PartyCountMembers(UID, 0);
   if PARTYCOUNT == 0 then
	SelectMsg(UID, 2, savenum, 6068, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if PARTYCOUNT > 1 then
	SetClearType(4, 82, 1, 3500, 20, 2001, 6099, UID, "21510_Hwargo.lua");  -- complete condition setting 1:Boss Mob Eliminate, 12001: Mob ID
   end

--if EVENT == 6095 then
--   SetClearType(2, 82, 1, 3500, 20, 2001, 6099);  -- complete condition setting 1:Boss Mob Eliminate, 12001: Mob ID
--   SetClearType(UID, 2, 30, 30, 101, 4010);  -- complete condition setting 2:Time Endure, 30:Endure time (minutes)
--   SetClearType(UID, 3, 128128, 20, 101, 4010); -- completecondition setting 3:Region Arrival 128128:position cordinate
end

if EVENT == 6096 then   -- A region passed  UID is contained zonenumber... broadcasting packets
  SelectMsg(UID, 6, 8201, 6059, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--/*ÀüÃ¼ UI Á¦°Å
if EVENT == 6097 then   -- B region passed
  SelectMsg(UID, 6, 8202, 6060, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6098 then   -- C region passed
   SelectMsg(UID, 6, 8203, 6061, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 6099 then   -- Quest Completed  WARNINIG!!! UID is contained zonenumber... broadcasting packets
     GiveItem(UID, 910135000, 1);		
       SaveEvent(UID, 6041);
 
end

--ÀüÃ¼ UIÁ¦°Å */
------------------------------------------------------------------------
-- SANJUK Campaign Troops End
------------------------------------------------------------------------

---------ï¿½ ï¿½ï¿½ï¿½

local quest_ITEM_COUNT=0;
if EVENT == 7000 then
   quest_ITEM_COUNT = HowmuchItem(UID, 910135000);
if quest_ITEM_COUNT == 1 then
   NATION = CheckNation(UID);
   --SaveEvent(UID, 6043);
   if NATION == 1 then --Ä«ç½º ï¿½ 
   SelectMsg(UID, 1, savenum1, 6046, NPC, 28, 7001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ï¿½Ï¶
   SelectMsg(UID, 1, savenum1, 6047, NPC, 28, 7001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
  end
end

if EVENT == 7001 then
      ShowMap(UID, 45);
end

--1, 3
local ITEM_COUNT=0;
local ITEM_COUNT1=0;
local RUN_EXCHANGE ;--ï¿½ï¿½Ã¼ ï¿½ï¿½ï¿½ ï¿½ï¿½

if EVENT == 7002 then
   ITEM_COUNT = HowmuchItem(UID, 910135000);   
   ITEM_COUNT1 = HowmuchItem(UID, 910138000);
   if  ITEM_COUNT <= 0 then -- ï¿½ï¿½;
      SelectMsg(UID, 2, savenum1, 6069, NPC, 18, 7003, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 <= 2 then -- ï¿½ï¿½;
      SelectMsg(UID, 2, savenum1, 6069, NPC, 18, 7003, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT  > 0 and ITEM_COUNT1 > 2 then-- ï¿½ï¿½ï¿½;
      --SaveEvent(UID, 6004);
      SelectMsg(UID, 5, savenum1, 6070, NPC, 4006, 7004, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 7003 then
--   SaveEvent(UID, 6002);
   ShowMap(UID, 45);
end

if EVENT == 7004 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       EVENT = 7005
       elseif Class == 2 or Class == 7 or Class == 8 then
       EVENT = 7006
       elseif Class == 3 or Class == 9 or Class == 10 then
       EVENT = 7007
      elseif Class == 4 or Class == 11 or Class == 12 then
       EVENT = 7008
      end
end


local Check;
if EVENT == 7005 then
  Check = CheckExchange(UID, 94)
   if  Check ==1 then
   RunSelectExchange(UID, 94)
   else
  Ret = 1;	
  end	 
end

local Check1;

if EVENT == 7006 then
  Check1 = CheckExchange(UID, 95)
   if  Check1 ==1 then
   RunSelectExchange(UID, 95)
   else
  Ret = 1;	
  end	 
end

local Check2;

if EVENT == 7007 then
  Check2 = CheckExchange(UID, 96)
   if  Check2 ==1 then
   RunSelectExchange(UID, 96)
   else
  Ret = 1;	
  end	 
end


local Check3;

if EVENT == 7008 then
  Check3 = CheckExchange(UID, 97)
   if  Check3 ==1 then
   RunSelectExchange(UID, 97)
   else
  Ret = 1;	
  end	 
end
--------------------------------------
-----¸ó½ºÅÍ Åä¹ú´ë ³¡-----------------
--------------------------------------


--San-juck captian start
-----------------------------------------------------------
-- ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½- ï¿½
-----------------------------------------------------------
local NPC = 21510;
local savenum = 605;
local savenum1 = 606;

-----------------------------------------------------------

--Ãµï¿½Ì¼ È£ï¿½

if EVENT == 7010 then
       SaveEvent(UID, 6071);
   NATION = CheckNation(UID);
   if NATION == 1 then --Ä«ç½º ï¿½ 
   SelectMsg(UID, 1, savenum, 6039, NPC, 28, 7011, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ï¿½Ï¶
   SelectMsg(UID, 1, savenum, 6040, NPC, 28, 7011, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 7011 then
   ShowMap(UID,45);
end

------------------------------------------------------------------------
-- SANJUK Campaign Troops Start
------------------------------------------------------------------------

local Level = 0;
if EVENT == 7012 then
   Level = CheckLevel(UID);
   if Level >= 60 and Level <= 80 then
   	SelectMsg(UID, 2, savenum, 6072, NPC, 6009, 7013, 6008, 7022, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else 
	SelectMsg(UID, 2, savenum, 6073, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 7013 then
   SelectMsg(UID, 4, savenum, 6074, NPC, 22, 7014, 23, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local WATING = 0;
local PARTYCOUNT = 0;
if EVENT == 7014 then
--   WATING = CheckWaiting(3);  -- 1:Begginer  2:Medium  3:Higher
--   if WATING == 1 then
--      SelectMsg(UID, 2, savenum, 6054, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
--      return;
--   end
--   SaveEvent(UID, 6003);
   --Ä«ï¿½Í° ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ 
--   SetCampaignGrade(UID, 3, 60, 80, 7015);  -- 1:Begginer  2:Medium  3:Higher, level limitation 40 ~ 50
--   SelectMsg(UID, 8, savenum, 6055, NPC, 6003, 3001, 6004, 3001, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   -- 8 is Campaign Invitation Message...
   PARTYCOUNT = PartyCountMembers(UID, 0);
   if PARTYCOUNT == 0 then
	SelectMsg(UID, 2, savenum, 6075, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if PARTYCOUNT > 1 then
	SetClearType(4, 83, 1, 4800, 30, 3001, 7019, UID, "21510_Hwargo.lua");  -- complete condition setting 1:Boss Mob Eliminate, 12001: Mob ID
   end

end
   
--if EVENT == 7015 then
--   SetClearType(3, 83, 1, 4800, 30, 3001, 7019);  -- complete condition setting 1:Boss Mob Eliminate, 12001: Mob ID
--   SetClearType(UID, 2, 30, 30, 101, 4010);  -- complete condition setting 2:Time Endure, 30:Endure time (minutes)
--   SetClearType(UID, 3, 128128, 20, 101, 4010); -- completecondition setting 3:Region Arrival 128128:position cordinate
--end
if EVENT == 7026 then   -- A region passed  UID is contained zonenumber... broadcasting packets
   SelectMsg(UID, 6, 8304, 6084, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 7016 then   -- A region passed  UID is contained zonenumber... broadcasting packets
   SelectMsg(UID, 6, 8301, 6062, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--/*ï¿½Ã¼ UI fï¿½
if EVENT == 7017 then   -- B region passed
  SelectMsg(UID, 6, 8302, 6063, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 7018 then   -- C region passed
   SelectMsg(UID, 6, 8303, 6064, NPC, 10, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 7019 then   -- Quest Completed  WARNINIG!!! UID is contained zonenumber... broadcasting packets
     GiveItem(UID, 910136000, 1);		
      SaveEvent(UID, 6073);
  end
--ï¿½Ã¼ UIfï¿½*/
------------------------------------------------------------------------
-- SANJUK Campaign Troops End
------------------------------------------------------------------------

---------ï¿½ ï¿½ï¿½ï¿½

local quest_ITEM_COUNT=0;
if EVENT == 7020 then
   quest_ITEM_COUNT = HowmuchItem(UID, 910136000);
if quest_ITEM_COUNT == 1 then
   NATION = CheckNation(UID);
   if NATION == 1 then --Ä«ç½º ï¿½ 
   SelectMsg(UID, 1, savenum1, 6046, NPC, 28, 7021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ï¿½Ï¶
   SelectMsg(UID, 1, savenum1, 6047, NPC, 28, 7021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
  end
end

if EVENT == 7021 then
      ShowMap(UID, 45);
end

--1, 3
local ITEM_COUNT=0;
local ITEM_COUNT1=0;
local RUN_EXCHANGE ;--ï¿½ï¿½Ã¼ ï¿½ï¿½ï¿½ ï¿½ï¿½

if EVENT == 7022 then
   ITEM_COUNT1 = HowmuchItem(UID, 910137000);
   ITEM_COUNT = HowmuchItem(UID, 910136000);
   if  ITEM_COUNT <= 0 then -- ï¿½ï¿½;
      SelectMsg(UID, 2, savenum1, 6077, NPC, 18, 7023, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 <= 2 then -- ï¿½ï¿½;
      SelectMsg(UID, 2, savenum1, 6077, NPC, 18, 7023, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT  > 0 and  ITEM_COUNT1 > 2 then-- ï¿½ï¿½ï¿½;
      --SaveEvent(UID, 6004);
      SelectMsg(UID, 2, savenum1, 6078, NPC, 4006, 7025, 27, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 7023 then
--   SaveEvent(UID, 6002);
   ShowMap(UID, 45);
end


local Check;
if EVENT == 7025 then
  Check = CheckExchange(UID, 98)
   if  Check ==1 then
   RunExchange(UID, 98)
   else
  Ret = 1;	
  end	 
end


--------------------------------------
-----ï¿½ï¿½ï¿½ï¿½-----------------
--------------------------------------

return Ret;
