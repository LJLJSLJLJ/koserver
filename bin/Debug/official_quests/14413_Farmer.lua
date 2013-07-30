-- [³óÀå°ü¸®ÀÎ]

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ŞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ

-- Áö¿ªº¯¼ö ¼±¾ğ...
local UserClass;
local QuestNum;
local Ret = 0;

-- [³óÀå°ü¸®ÀÎ] ³óÀå°ü¸®ÀÎÅ¬¸¯½Ã Äù½ºÆ® Ã¼Å©  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, 14413);
		if QuestNum == 0 then --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 0°³ ÀÏ¶§ 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 324, 14413, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- ¹» ÇÏ´Â °É±î?
			 Ret = 1; -- ÀÌ°Ç ¿Ö ÀúÀå ½ÃÄÑ¿ä? ±×³É RETURNÀº ¾ÈµÇ³ª¿ä?
		elseif QuestNum > 1 and  QuestNum < 100 then--ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÏ¶§ 
          NpcMsg(UID, 325, 14413)
      else --ÇØ´ç NPC¿¡°Ô ÇÒ¼ö ÀÖ´Â Äù½ºÆ®°¡ 1°³ ÀÌ»ó ÀÏ¶§ 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--Å¸ÀÌ¿Â »ç³Éä

if EVENT == 195 then
   SelectMsg(UID, 1, 108, 327, 14413, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 13);
   SaveEvent(UID, 114);
end

--  102¹øÀÇ ¼Ó¼º 0¹ø 4¹øÀÏ °æ¿ì

if EVENT == 200 then
   SelectMsg(UID, 2, 108, 328, 14413, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 108, 329, 14413, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 115);
end

-- Àç·á¸¦ ´Ù ¸ğ¾ÒÀ» ¶§ 
local NATION = 0;--±¹°¡ Ã¼Å©

if EVENT == 205 then
   SaveEvent(UID, 117);
   NATION = CheckNation(UID);
   if NATION == 1 then -- Ä«·ç½º ÀÏ¶§
      SelectMsg(UID, 1, 108, 330, 14413, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- ¿¤¸ğÀÏ¶§
      SelectMsg(UID, 1, 108, 331, 14413, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ItemA ;
local ITEM_COUNT;
local RUN_EXCHANGE ;--Àç·á ±³Ã¼ ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä 

if EVENT == 210 then
      ITEM_COUNT = GetMaxExchange(UID, 31); --exchange Å×ÀÌºí ÀÎµ¦½º°ª       
   if  ITEM_COUNT == 0 then -- Àç·á ¾øÀ»¶§
      SelectMsg(UID, 2, 109, 332, 14413, 18, 212, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else  -- Àç·á ÀÖÀ» ¶§
      SelectMsg(UID, 2, 109, 333, 14413, 10, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 212 then
   ShowMap(UID, 14);
end

local Check;


if EVENT == 213 then
  Check = CheckExchange(UID, 31)
   if  Check ==1 then
   ITEM_COUNT = GetMaxExchange(UID, 31);
 	RunCountExchange(UID, 31, ITEM_COUNT);	   
      SaveEvent(UID, 118);
   else
  Ret = 1;	
  end	 
end

return Ret;