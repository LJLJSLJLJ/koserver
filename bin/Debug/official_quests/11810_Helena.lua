
-- ´ë»çÁ¦ Çï·¹³ª

-- EVENT ´Â 100¹ø ÀÌ»ó ºÎÅÍ »ç¿ëÇÏ¶ó

-- UID : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â À¯Àú¹øÈ£
-- EVENT : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ¹øÈ£
-- STEP : ¼­¹ö¿¡¼­ Á¦°øÇÏ´Â Äù½ºÆ® ³»ºÎ ´Ü°è

-- À§ÀÇ ¼¼°¡Áö ÆÄ¶ó¸ÞÅ¸´Â ·ç¾Æ ½ÇÇà½Ã Ç×»ó Àü¿ªº¯¼ö·Î Á¦°øµ



-- Class  ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä (Á÷¾÷ Ã¼Å©ÇÏ´Â ÇÔ¼öÀÓ)
-- 1:Àü»ç, 2:·Î±×, 3:¸¶¹ý»ç, 4: »çÁ¦
-- 1Â÷ÀüÁ÷	5	7	9	11
-- 2Â÷ÀüÁ÷	6	8	10	12



-- SkillPoint ÇÔ¼ö ¸¸µé¾î ÁÖ¼¼¿ä ( ½ºÅ³ Æ÷ÀÎÆ® Ã¼Å©ÇÏ´Â ÇÔ¼öÀÓ)
-- 1¹ø½ºÅ³:5, 2¹ø½ºÅ³ : 6, 	3¹ø½ºÅ³:7  	¸¶½ºÅÍ : 8Í


-- Áö¿ªº¯¼ö ¼±¾ð...
local Class;
local SkillPoint;
local QuestNum;
local Ret = 0;
local NPC = 11810
local Savenum = 400

-- ´ë»çÁ¦ Çï·¹³ª Å¬¸¯½Ã Äù½ºÆ® Ã¼Å© 

if EVENT == 4000 then
   Class = CheckClass (UID);
   if Class == 4 or Class == 11 or Class == 12 then -- »çÁ¦ÀÎ°¡¸¦ Ã¼Å© 
      SkillPoint = CheckSkillPoint(UID, 5);
    if SkillPoint > 59 then -- Ä¡·á½ºÅ³ÀÌ 60ÀÌ»óÀÎ°¡ Ã¼Å© 
    SelectMsg(UID, 3, -1, 4001,  NPC, 4000, 4007, 4001, 4010, 4002, 4013, 4003, 4016, 47, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif SkillPoint > 49 then -- Ä¡·á½ºÅ³ÀÌ 50ÀÌ»óÀÎ°¡ Ã¼Å© 
    SelectMsg(UID, 3, -1, 4001,  NPC, 4000, 4007, 4001, 4010, 4002, 4013, 47, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif SkillPoint > 39 then -- Ä¡·á½ºÅ³ÀÌ 40ÀÌ»óÀÎ°¡ Ã¼Å© 
    SelectMsg(UID, 3, -1, 4001,  NPC, 4000, 4007, 4001, 4010, 47, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif SkillPoint > 29 then -- Ä¡·á½ºÅ³ÀÌ 30ÀÌ»óÀÎ°¡ Ã¼Å© 
    SelectMsg(UID, 3, -1, 4001,  NPC, 4000, 4007, 47, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- Ä¡·á½ºÅ³ÀÌ 29ÀÌÇÏÀÏ¶§ 
         EVENT = 4001
      end
   else --»çÁ¦°¡ ¾Æ´Ò¶§
   EVENT = 4001
   end
end

if EVENT == 4001 then -- ¹°¾à Á¦Á¶¸øÇÑ´Ù´Â ¸Þ½ÃÁö
   SelectMsg(UID, 2, -1, 4000,  NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 4002 then
    Ret = 1;
end

-- ´ë»çÁ¦ Çï·¹³ª 400¹øÀÇ ¼Ó¼º ½ÃµåÀÎ °æ¿ì 

if EVENT == 4004 then
   SkillPoint = CheckSkillPoint(UID, 5);
   if SkillPoint > 29 then
    SaveEvent(UID, 4003);
   SelectMsg(UID, 1, Savenum, 4005, NPC, 29, 4005, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- Ä¡·á½ºÅ³ÀÌ 29ÀÌÇÏÀÏ¶§ 
    Ret = 1;
   end
end

if EVENT == 4005 then
   ShowMap(UID, 400);
end

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª »ý¸íÀÇ¼º¼ö Á¦Á¶½ÃÀÛ 
---------------------------------------

   local min_count;
   local ItemA ;
   local ItemB ;
   local Check ;

if EVENT == 4007 then
    Check = CheckExchange(UID, 400)
    if  Check ==1 then
	min_count = GetMaxExchange(UID, 400); --exchange Å×ÀÌºí ÀÎµ¦½º°ª 
        if min_count == 0 then
        ItemA = HowmuchItem(UID, 389010000);  
        ItemB = HowmuchItem(UID, 379001000); 
            if  ItemA == 0  then -- ¼º¼ö°¡ ¾øÀ»¶§
            SelectMsg(UID, 2, Savenum, 4010, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            elseif ItemB == 0  then-- ±âµµ¹®ÀÌ ¾øÀ»¶§§
            SelectMsg(UID, 2, Savenum, 4011, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else
            SelectMsg(UID, 2, Savenum, 4007, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            end
        else
        SelectMsg(UID, 4, Savenum, 4006, NPC, 4004, 4008, 4005, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else
    Ret = 1; 
    end  
end


if EVENT == 4008 then
   min_count = GetMaxExchange(UID, 400);
 	RunCountExchange(UID, 400, min_count);	
end

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª »ý¸íÀÇ¼º¼ö Á¦Á¶³¡
---------------------------------------

local Savenum = 410

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª »ç¶ûÀÇ ¼º¼ö Á¦Á¶½ÃÀÛ 
---------------------------------------
   local min_count;
   local ItemA ;
   local ItemB ;
   local Check ;

if EVENT == 4010 then
    Check = CheckExchange(UID, 401)
    if  Check ==1 then
	min_count = GetMaxExchange(UID, 401); --exchange Å×ÀÌºí ÀÎµ¦½º°ª 
        if min_count == 0 then
        ItemA = HowmuchItem(UID, 389010000);  
        ItemB = HowmuchItem(UID, 379002000); 
            if  ItemA == 0  then -- ¼º¼ö°¡ ¾øÀ»¶§
            SelectMsg(UID, 2, Savenum, 4010, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            elseif ItemB == 0  then-- ±âµµ¹®ÀÌ ¾øÀ»¶§§
            SelectMsg(UID, 2, Savenum, 4011, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else
            SelectMsg(UID, 2, Savenum, 4007, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            end
        else
        SelectMsg(UID, 4, Savenum, 4006, NPC, 4004, 4011, 4005, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else
    Ret = 1; 
    end  
end


if EVENT == 4011 then
   min_count = GetMaxExchange(UID, 401);
    RunCountExchange(UID, 401, min_count);	
end

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª »ç¶ûÀÇ ¼º¼ö Á¦Á¶³¡
---------------------------------------


local Savenum = 411

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª ÀºÃÑÀÇ ¼º¼ö Á¦Á¶½ÃÀÛ 
---------------------------------------
   local min_count;
   local ItemA ;
   local ItemB ;
   local Check ;

if EVENT == 4013 then
    Check = CheckExchange(UID, 402)
    if  Check ==1 then
	min_count = GetMaxExchange(UID, 402); --exchange Å×ÀÌºí ÀÎµ¦½º°ª 
        if min_count == 0 then
        ItemA = HowmuchItem(UID, 389010000);  
        ItemB = HowmuchItem(UID, 379003000); 
            if  ItemA == 0  then -- ¼º¼ö°¡ ¾øÀ»¶§
            SelectMsg(UID, 2, Savenum, 4010, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            elseif ItemB == 0  then-- ±âµµ¹®ÀÌ ¾øÀ»¶§§
            SelectMsg(UID, 2, Savenum, 4011, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else
            SelectMsg(UID, 2, Savenum, 4007, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            end
        else
        SelectMsg(UID, 4, Savenum, 4006, NPC, 4004, 4014, 4005, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else
    Ret = 1; 
    end  
end


if EVENT == 4014 then
   min_count = GetMaxExchange(UID, 402);
    RunCountExchange(UID, 402, min_count);	
end

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª ÀºÃÑÀÇ ¼º¼ö Á¦Á¶³¡
---------------------------------------


local Savenum = 412

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª ÀºÇýÀÇ ¼º¼ö Á¦Á¶½ÃÀÛ 
---------------------------------------

   local min_count;
   local ItemA ;
   local ItemB ;
   local Check ;

if EVENT == 4016 then
    Check = CheckExchange(UID, 403)
    if  Check ==1 then
	min_count = GetMaxExchange(UID, 403); --exchange Å×ÀÌºí ÀÎµ¦½º°ª 
        if min_count == 0 then
        ItemA = HowmuchItem(UID, 389010000);  
        ItemB = HowmuchItem(UID, 379004000); 
            if  ItemA == 0  then -- ¼º¼ö°¡ ¾øÀ»¶§
            SelectMsg(UID, 2, Savenum, 4010, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            elseif ItemB == 0  then-- ±âµµ¹®ÀÌ ¾øÀ»¶§§
            SelectMsg(UID, 2, Savenum, 4011, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else
            SelectMsg(UID, 2, Savenum, 4007, NPC, 10, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            end
        else
        SelectMsg(UID, 4, Savenum, 4006, NPC, 4004, 4017, 4005, 4002, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else
    Ret = 1; 
    end  
end


if EVENT == 4017 then
   min_count = GetMaxExchange(UID, 403);
    RunCountExchange(UID, 403, min_count);	
end

---------------------------------------
-- ´ë»çÁ¦ Çï·¹³ª ÀºÇýÀÇ ¼º¼ö Á¦Á¶³¡
---------------------------------------


return Ret;