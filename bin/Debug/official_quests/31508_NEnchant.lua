-- 도다 캠프 게이트
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
local NPC =10305;


-- 도다 캠프 게이트 클릭시 퀘스트 체크  

if EVENT == 100 then
NpcMsg(UID, 4706,31508)
end

if EVENT == 168 then -- 그냥 닫기 
    Ret = 1;
end

if EVENT == 169 then -- 이동 
    MoveMiddleStatue(UID)
end

