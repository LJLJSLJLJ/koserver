
-- [간수]카발
-- 그냥 닫기 101

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC=18010; --NPC 번호 
local savenum = -1;

-- [관리인] 빌보르 클릭시 퀘스트 체크  

if EVENT == 100 then
   SelectMsg(UID, 2, savenum, 5254, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 101 then -- 그냥 닫기 
    Ret = 1;
end

