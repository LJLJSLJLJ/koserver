
-- 기타 이벤트 존에서 밖으로 나갈때 

if EVENT == 500 then
   SelectMsg(UID, 2, -1, 4071, 13010, 4071, 501, 4072, 502, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local NATION = 0;

if EVENT == 501 then
   NATION = CheckNation(UID);
   if NATION == 1 then --카루스 일때 
   ZoneChange(UID, 1, 354, 1610) -- 존번호, X좌표, Y좌료 
   else -- 엘모일때
   ZoneChange(UID, 2, 1670, 370) -- 존번호, X좌표, Y좌료 
   end
end

if EVENT == 502 then
    Ret = 1;
end

