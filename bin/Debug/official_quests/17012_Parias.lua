local UserClass;
local QuestNum;
local Ret = 0;
local NPC =17012;


-- 감옥에서 나가기 

if EVENT == 165 then
Prison = CheckPrison(UID)
    if Prison == 0 then
    SelectMsg(UID, 2, -1, 4666, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
    else
    SelectMsg(UID, 2, -1, 4666, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
    end
end

if EVENT == 168 then -- 그냥 닫기 
    Ret = 1;
end

if EVENT == 169 then -- 이동 
   ZoneChange(UID, 21, 450, 300) -- 존번호, X좌표, Y좌료 
end
