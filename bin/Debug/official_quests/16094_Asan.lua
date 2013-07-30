
-- 기타 이벤트 존에서 밖으로 나갈때 

if EVENT == 500 then
   SelectMsg(UID, 2, -1, 4071, 16094, 4071, 501, 4072, 502, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local NATION = 0;

if EVENT == 501 then
Level = CheckLevel(UID)
    if Level < 30 then
    NATION = CheckNation(UID);
        if NATION == 1 then --카루스 일때 
        ZoneChange(UID, 1, 441, 1625) -- 존번호, X좌표, Y좌료 
        else -- 엘모일때
        ZoneChange(UID, 2, 1595, 412) -- 존번호, X좌표, Y좌료 
        end
    else
    NATION = CheckNation(UID);
        if NATION == 1 then --카루스 일때 
        ZoneChange(UID, 71, 1380, 1090) -- 존번호, X좌표, Y좌료 
        else -- 엘모일때
        ZoneChange(UID, 71, 630, 920) -- 존번호, X좌표, Y좌료 
        end
    end
end

if EVENT == 502 then
    Ret = 1;
end


