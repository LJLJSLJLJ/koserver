
-- [고문관]네즈
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
local NPC= 14407; --NPC 번호 


-- [고문관]네즈 퀘스트 체크  

if EVENT == 100 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
			 SelectMsg(UID, 2, -1, 4273, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 4274, NPC)
      else--해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 101 then -- 그냥 닫기 
    Ret = 1;
end


-----------------------------------------------------------
-- 다크루나 시작 

local savenum = 63;
local Level
local NATION
-----------------------------------------------------------

-- [고문관]네즈  63번의 속성 0번 4번일 경우

if EVENT == 105 then
Level = CheckLevel(UID)
    if Level > 29 and Level < 50 then -- 30~50사이 
    SelectMsg(UID, 4, savenum, 4277, NPC, 22, 106, 23, 107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif Level > 50 then
    SelectMsg(UID, 2, savenum, 4278, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    SaveEvent(UID, 4174);
    else
    SelectMsg(UID, 2, savenum, 4278, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 106 then
    SaveEvent(UID,4173);
end

if EVENT == 107 then
    SaveEvent(UID,4176);
end

--[고문관]네즈  63번의 속성 1번 3번일 경우

   local ItemA = 0;


if EVENT == 110 then 
    SelectMsg(UID, 2, savenum, 4280, NPC, 4171, 120, 4063, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 120 then 
    ItemA = HowmuchItem(UID, 910084000);  
   if  ItemA == 0 then 
       SelectMsg(UID, 2, savenum, 4279, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
    SaveEvent(UID, 4174);
    RunExchange(UID, 468);
   end
end
-----------------------------------------------------------
-- 다크루나 끝 
-----------------------------------------------------------

-----------------------------------------------------------
-- 루나 시작 
local savenum = 64;
local Level
local NATION
-----------------------------------------------------------

-- [고문관]네즈  64번의 속성 0번 4번일 경우

if EVENT == 125 then
Level = CheckLevel(UID)
    if Level > 39 then -- 40 이상일때 
    SelectMsg(UID, 4, savenum, 4283, NPC, 22, 126, 23, 127, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else
    SelectMsg(UID, 2, savenum, 4284, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 126 then
    SaveEvent(UID,4178);
end

if EVENT == 127 then
    SaveEvent(UID,4181);
end

--[고문관]네즈 64번의 속성 1번 3번일 경우

   local ItemA = 0;


if EVENT == 130 then 
    SelectMsg(UID, 2, savenum, 4285, NPC, 4171, 131, 4063, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 131 then 
    ItemA = HowmuchItem(UID, 910085000);  
   if  ItemA == 0 then 
       SelectMsg(UID, 2, savenum, 4179, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
    SaveEvent(UID, 4168);
    RunExchange(UID, 469);
   end
end

-----------------------------------------------------------
-- 루나 끝 
-----------------------------------------------------------
