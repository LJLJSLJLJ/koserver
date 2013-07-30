--열쇠의 경비인
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


if EVENT == 168 then
	Ret = 1;
end

-- 열쇠의 경비인 클릭시 퀘스트 체크  

local ItemA;
local NPC = 16054;
local savenum = 419;

if EVENT == 100 then
ItemA = HowmuchItem(UID, 910053000);  -- 3번째 열쇠 
    if  ItemA == 0 then -- 3번째 열쇠  없을때
    SelectMsg(UID, 2, savenum, 4312, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 3번째 열쇠 있을때 
    SelectMsg(UID, 4, savenum, 4313, NPC, 22, 101, 23, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 101 then
    SelectMsg(UID, 2, savenum, 4314, NPC, 4180, 102, 4181, 103, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 103 then
   ChangePosition(UID)
   RunExchange(UID, 474);
   SaveEvent(UID, 4239);   
end

if EVENT == 102 then
    ChangePosition(UID)
    RobItem(UID, 910053000, 1);
    SelectMsg(UID, 2, savenum, 4315, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
