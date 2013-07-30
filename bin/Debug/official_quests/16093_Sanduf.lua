-- EVENT 는 100번 이상 부터 사용

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC =16093;

-- 중국존 이동 


if EVENT == 190 then
    SelectMsg(UID, 2, -1, 4631, NPC, 4226, 191, 4227, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
end

if EVENT == 191 then
Level = CheckLevel(UID)
Nation = CheckNation(UID)
    if Level < 60 then
    SelectMsg(UID, 2, -1, 4705, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
    else
        if Nation == 1 then
        RobItem(UID, 900000000, 6000)
        ZoneChange(UID, 85, 235, 489)
        else
        RobItem(UID, 900000000, 6000)
        ZoneChange(UID, 86, 235, 489)
        end
    end
end

if EVENT == 168 then -- 그냥 닫기 
    Ret = 1;
end

