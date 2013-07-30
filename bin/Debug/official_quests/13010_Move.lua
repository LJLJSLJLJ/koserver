
-- 기타 이벤트 존에서 밖으로 나갈때 

if EVENT == 500 then
   SelectMsg(UID, 2, -1, 4072, 13010, 4071, 501, 4072, 502, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 501 then
   ZoneChange(UID, 21, 450, 300) -- 존번호, X좌표, Y좌료 
end

if EVENT == 502 then
    Ret = 1;
end

