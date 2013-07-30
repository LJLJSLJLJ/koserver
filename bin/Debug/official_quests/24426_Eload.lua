-- [전진기지대장]엘로드

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24426;

-- [전진기지대장]엘로드 클릭시 퀘스트 체크  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
			 SelectMsg(UID, 2, -1, 4597, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          NpcMsg(UID, 4598, NPC)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--******************************************************--
-- 로나크 랜드의 평화 시작 
--******************************************************--

local savenum = 439;

-- 시드미셀 등장

if EVENT == 530 then
    SaveEvent(UID, 4320);
    SelectMsg(UID, 1, savenum, 4599, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 439 번의 속성 0번 4번일 경우

local MonsterSub = 0;

if EVENT == 532 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 4, savenum, 4600, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, savenum, 4601, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 533 then
   SaveEvent(UID, 4321); --수락시
end


if EVENT == 534 then
   SaveEvent(UID, 4324); -- 거절시 
end

if EVENT == 535 then
   SaveEvent(UID, 4323); -- 거절시 
end

-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 180 then
    SaveEvent(UID, 4323);
    SelectMsg(UID, 1, savenum, 4602, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 439의 1번 3번인 경우 

local MonsterCount = 0;

if EVENT == 536 then
   MonsterCount  = CountMonsterQuestSub(UID,439, 1);
   if  MonsterCount < 100 then -- 사냥이 남았을때
      SelectMsg(UID, 2, savenum, 4603, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 2, savenum, 4604, NPC, 4172, 537, 4173, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local Check;

if EVENT == 537 then
  Check = CheckExchange(UID, 491)
   if  Check ==1 then
   RunExchange(UID, 491);
   SaveEvent(UID, 4322);
   SaveEvent(UID, 4329);
   else
  Ret = 1;	
  end	 
end


--
local savenum = 906;
if EVENT == 9402 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 4, savenum, 8692, NPC, 22, 9403, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, savenum, 8693, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9403 then
   SaveEvent(UID, 9436); --수락시
end

if EVENT == 9404 then
   SaveEvent(UID, 9439); -- 거절시 
end

if EVENT == 9405 then
   SaveEvent(UID, 9438); -- 거절시 
end

local MonsterCount1 = 0;
local MonsterCount2 = 0;
local MonsterCount3 = 0;

if EVENT == 9407 then
   MonsterCount1  = CountMonsterQuestSub(UID,906, 1);
   MonsterCount2  = CountMonsterQuestSub(UID,906, 2);
   MonsterCount3  = CountMonsterQuestSub(UID,906, 3);
   if  MonsterCount1 < 1 and MonsterCount2 < 1 and MonsterCount3 < 1  then -- 사냥이 남았을때
      SelectMsg(UID, 2, savenum, 4605, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, savenum, 4606, NPC, 4172, 9408, 4173, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local Check;

if EVENT == 9408 then
  Check = CheckExchange(UID, 906)
   if  Check == 1 then
   RunExchange(UID, 906);
   SaveEvent(UID, 9437);
   SaveEvent(UID, 9443);
   else
  Ret = 1;	
  end	 
end
--******************************************************--
-- 로나크 랜드의 평화 끝 
--******************************************************--

return Ret;
