local UserClass;
local QuestNum;
local Ret = 0;

--  척후병 전달 1번?


if EVENT == 215 then
    ITEM_COUNT1 = HowmuchItem(UID, 910044000); 
   if  ITEM_COUNT1 < 1 then -- 재료 없을때
   SelectMsg(UID, 2, 137, 1183, 21051, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
   SelectMsg(UID, 2, 137, 1184, 21051, 22, 218, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 193 then
Ret = 1;
end

local Check;
if EVENT == 218 then
  Check = CheckExchange(UID, 89)
   if  Check ==1 then
   SaveEvent(UID, 468);
   RunExchange(UID, 89);
   SaveEvent(UID, 474);
   SelectMsg(UID, 2, 137, 1182, 21051, 10, 217, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
  Ret = 1;	
  end	 
end

return Ret;