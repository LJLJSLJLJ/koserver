-- 비프 이동 비석
-- 그냥 닫기 168

-- EVENT 는 100번 이상 부터 사용

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC =601;


-- 비프 이동 비석 클릭시 퀘스트 체크  

if EVENT == 165 then
    SelectMsg(UID, 2, -1, 4470, NPC, 4200, 166, 4199, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
end

if EVENT == 166 then
Victory = CheckBeefRoastVictory(UID)
    if Victory == 1 then
    Nation = CheckNation(UID);
        if Nation == 1 then
        ZoneChange(UID, 31, 78, 730)
        else
        SelectMsg(UID, 2, -1, 4471, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
        end
    elseif Victory == 2 then
        Nation = CheckNation(UID);
        if Nation == 2 then
        ZoneChange(UID, 31, 245, 950)
        else
        SelectMsg(UID, 2, -1, 4471, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
        end
    elseif Victory == 3 then
        Nation = CheckNation(UID);
        if Nation == 1 then
        ZoneChange(UID, 31, 78, 730)
        else
        ZoneChange(UID, 31, 245, 950)
        end
    else
        SelectMsg(UID, 2, -1, 4471, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);        
    end
end

if EVENT == 168 then -- 그냥 닫기 
    Ret = 1;
end

