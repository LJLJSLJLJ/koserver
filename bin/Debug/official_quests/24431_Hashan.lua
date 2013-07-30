-- [경비병]하샨�

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24431;


if EVENT == 155 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 8255, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 8257, NPC)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 158 then
    Ret = 1;
end



-- [경비병]하샨 클릭시 퀘스트 체크  

-------------------------------
---------라미아 사냥-----------
-------------------------------

if EVENT == 8250 then
   SelectMsg(UID, 1, 844, 8231, NPC, 28, 8251, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8251 then
   ShowMap(UID, 562);
   SaveEvent(UID, 9009);
end

local MonsterSub = 0;

if EVENT == 8252 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 844, 8232, NPC, 10, 8260, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 844, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8260 then
   SelectMsg(UID, 4, 844, 8233, NPC, 22, 8253, 23, 8254, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8253 then
   SaveEvent(UID, 9010);
end

if EVENT == 8254 then
   SaveEvent(UID, 9013);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 8255 then
   SelectMsg(UID, 1, 844, 8262, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9012);
end

local MonsterCount = 0;

if EVENT == 8257 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 844, 8263, NPC, 10, 8258, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 844, 8264, NPC, 10, 8259, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8258 then
   ShowMap(UID, 514);
end

if EVENT == 8259 then
   Check = CheckExchange(UID, 1003)
   if  Check ==1 then
   RunExchange(UID, 1003);
   SaveEvent(UID, 9011);
   SaveEvent(UID, 9017);
   else
  Ret = 1;	
  end	 
end

-------------------------------
--------라미아 사냥 끝---------
-------------------------------

-------------------------------
-------우르크 하이 사냥--------
-------------------------------

if EVENT == 8350 then
   SelectMsg(UID, 1, 846, 8271, NPC, 14, 8351, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8351 then
    SaveEvent(UID, 9021);
end

local MonsterSub = 0;

if EVENT == 8352 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 846, 8272, NPC, 10, 8360, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 846, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8360 then
   SelectMsg(UID, 4, 846, 8273, NPC, 22, 8353, 23, 8354, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8353 then
   SaveEvent(UID, 9022);
end

if EVENT == 8354 then
   SaveEvent(UID, 9025);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 8355 then
   SelectMsg(UID, 1, 846, 8262, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9024);
end

local MonsterCount = 0;

if EVENT == 8357 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 846, 8263, NPC, 10, 8358, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 846, 8264, NPC, 10, 8359, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8358 then
   ShowMap(UID, 544);
end

if EVENT == 8359 then
   Check = CheckExchange(UID, 1005)
   if  Check ==1 then
   RunExchange(UID, 1005);
   SaveEvent(UID, 9023);
   SaveEvent(UID, 9029);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-----우르크 하이 사냥 끝-------
-------------------------------

-------------------------------
---------트렌트 사냥-----------
-------------------------------

if EVENT == 8650 then
   SelectMsg(UID, 1, 851, 8277, NPC, 3008, 8651, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8651 then
   SelectMsg(UID, 1, 851, 8278, NPC, 4080, 8652, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9057);
end

local MonsterSub = 0;

if EVENT == 8652 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 1, 851, 8279, NPC, 10, 8653, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 1, 851, 8280, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8653 then
    SelectMsg(UID, 1, 851, 8281, NPC, 22, 8654, 23, 8655, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8654 then --수락시
    ShowMap(UID, 506);
    SaveEvent(UID, 9058);
end

if EVENT == 8655 then --거절시
    SelectMsg(UID, 1, 851, 8286, NPC, 4255, 8655, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    SaveEvent(UID, 9061);
end

-- 836번 속성 0, 4번일 경우

if EVENT == 8660 then
   SelectMsg(UID, 2, 851, 8284, NPC, 3002, 8661, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8661 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 4, 851, 8285, NPC, 3018, 8662, 3019, 8668, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 851, 8287, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8662 then --수락시
    SaveEvent(UID, 9058);
end

if EVENT == 8668 then --거절시
    SaveEvent(UID, 9061);
end

-- 재료를 다 모았을때 시드와 미셀의 등장 

if EVENT == 8663 then
    SelectMsg(UID, 1, 851, 8288, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    SaveEvent(UID, 9060);
end

-- 836이 1번 3번인 경우 

local MonsterCount = 0;

if EVENT == 8665 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 30 then -- 사냥이 남았을때
    SelectMsg(UID, 2, 851, 8289, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
    SelectMsg(UID, 4, 851, 8290, NPC, 10, 8667, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local Check;

if EVENT == 8667 then
   Slot = CheckGiveSlot(UID) 
  if Slot > 1 then
   RunExchange(UID, 944);
   SaveEvent(UID, 9059);
   SaveEvent(UID, 9065);
  else
    SelectMsg(UID, 2, 851, 8498, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end
end

-------------------------------
--------트렌트 사냥 끝---------
-------------------------------

-------------------------------
--------에이션트 사냥----------
-------------------------------

if EVENT == 9180 then
   SelectMsg(UID, 1, 828, 8271, NPC, 14, 9181, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9181 then
   SaveEvent(UID, 9069);
end

local MonsterSub = 0;

if EVENT == 9182 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 828, 8303, NPC, 10, 9190, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 828, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9190 then
   SelectMsg(UID, 4, 828, 8304, NPC, 22, 9183, 23, 9184, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9183 then
   SaveEvent(UID, 9070);
end

if EVENT == 9184 then
   SaveEvent(UID, 9073);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 9185 then
   SelectMsg(UID, 1, 828, 8262, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9072);
end

local MonsterCount = 0;

if EVENT == 9187 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 828, 8263, NPC, 10, 9188, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 828, 8264, NPC, 10, 9189, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9188 then
   ShowMap(UID, 547);
end

if EVENT == 9189 then
   Check = CheckExchange(UID, 946)
   if  Check ==1 then
   RunExchange(UID, 946);
   SaveEvent(UID, 9071);
   SaveEvent(UID, 9077);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------에이션트 사냥 끝--------
-------------------------------

-------------------------------
------용아 기사 단장 사냥------
-------------------------------

if EVENT == 9020 then
   SelectMsg(UID, 1, 870, 8271, NPC, 14, 9021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9021 then
   SaveEvent(UID, 9093);
end

local MonsterSub = 0;

if EVENT == 9022 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 870, 8444, NPC, 10, 9030, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 870, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9030 then
   SelectMsg(UID, 4, 870, 8445, NPC, 22, 9023, 23, 9024, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9023 then
   SaveEvent(UID, 9094);
end

if EVENT == 9024 then
   SaveEvent(UID, 9097);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 9025 then
   SelectMsg(UID, 1, 870, 8262, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9096);
end

local MonsterCount = 0;

if EVENT == 9027 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 30 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 870, 8263, NPC, 10, 9028, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 870, 8450, NPC, 10, 9029, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9028 then
   ShowMap(UID, 587);
end

if EVENT == 9029 then
    Slot = CheckGiveSlot(UID) 
  if Slot > 1 then
   RunExchange(UID, 1007);
   SaveEvent(UID, 9095);
   SaveEvent(UID, 9101);
  else
    SelectMsg(UID, 2, 870, 8498, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end	 
end

-------------------------------
----용아 기사 단장 사냥 끝-----
-------------------------------

------------------------------
------우르크 블레이드 사냥-----
-------------------------------

if EVENT == 9040 then
   SelectMsg(UID, 1, 872, 8271, NPC, 14, 9041, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9041 then
   SaveEvent(UID, 9105);
end

local MonsterSub = 0;

if EVENT == 9042 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 872, 8454, NPC, 10, 9050, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 872, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9050 then
   SelectMsg(UID, 4, 872, 8455, NPC, 22, 9043, 23, 9044, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9043 then
   SaveEvent(UID, 9106);
end

if EVENT == 9044 then
   SaveEvent(UID, 9109);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 9045 then
   SelectMsg(UID, 1, 872, 8262, NPC, 3007, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9108);
end

local MonsterCount = 0;

if EVENT == 9047 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 872, 8263, NPC, 10, 9048, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 872, 8264, NPC, 10, 9049, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9048 then
   ShowMap(UID, 551);
end

if EVENT == 9049 then
   Check = CheckExchange(UID, 950)
   if  Check ==1 then
   RunExchange(UID, 950);
   SaveEvent(UID, 9107);
   SaveEvent(UID, 9113);
   else
  Ret = 1;	
  end	 
end

-------------------------------
----우르크 블레이드 사냥 끝----
-------------------------------

-------------------------------
------데루비시 사냥 시작-------
-------------------------------

if EVENT == 9080 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9129);
    EVENT = 9081
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9134);
    EVENT = 9081
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9139);
    EVENT = 9081
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9144);
     EVENT = 9081
   end
end

if EVENT == 9081 then
    SelectMsg(UID, 1, 876, 8458, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9082 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 876, 8459, NPC, 10, 9085, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 876, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9085 then
    SelectMsg(UID, 4, 876, 8460, NPC, 22, 9083, 23, 9084, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9083 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9130);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9135);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9140);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9145);
   end
end

if EVENT == 9084 then
   SaveEvent(UID, 9133); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 9090 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9132);
    EVENT = 9091
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9137);
    EVENT = 9091
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9142);
    EVENT = 9091
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9147);
    EVENT = 9091
   end
end

if EVENT == 9091 then
    SelectMsg(UID, 1, 876, 8461, NPC, 3002, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9086 then
    MonsterCount  = CountMonsterQuestSub(UID,876, 1);
    if  MonsterCount < 40 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 876, 8462, NPC, 10, 9087, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 876, 8463, NPC, 10, 9088, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9087 then
   ShowMap(UID, 518);
end

local Check;

if EVENT == 9088 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 932)
        if  Check ==1 then        
        RunExchange(UID, 932);
        SaveEvent(UID, 9131);
        SaveEvent(UID, 9152);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 933)
        if  Check ==1 then        
        RunExchange(UID, 933);
        SaveEvent(UID, 9136);
        SaveEvent(UID, 9152);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 934)
        if  Check ==1 then        
        RunExchange(UID, 934);
        SaveEvent(UID, 9141);
        SaveEvent(UID, 9152);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 935)
        if  Check ==1 then        
        RunExchange(UID, 935);
        SaveEvent(UID, 9146);
        SaveEvent(UID, 9152);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
-------데루비시 사냥 끝--------
-------------------------------

-------------------------------
--------사도 사냥 시작---------
-------------------------------

if EVENT == 9100 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9171);
    EVENT = 9101
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9176);
    EVENT = 9101
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9181);
    EVENT = 9101
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9186);
     EVENT = 9101
   end
end

if EVENT == 9101 then
    SelectMsg(UID, 1, 878, 8472, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9102 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 878, 8473, NPC, 10, 9105, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 878, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9105 then
    SelectMsg(UID, 4, 878, 8474, NPC, 22, 9103, 23, 9104, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9103 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9172);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9177);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9182);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9187);
   end
end

if EVENT == 9104 then
   SaveEvent(UID, 9175); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 9110 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9174);
    EVENT = 9111
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9179);
    EVENT = 9111
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9184);
    EVENT = 9111
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9189);
    EVENT = 9111
   end
end

if EVENT == 9111 then
    SelectMsg(UID, 1, 878, 8461, NPC, 3002, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9106 then
    MonsterCount  = CountMonsterQuestSub(UID,878, 1);
    if  MonsterCount < 40 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 878, 8462, NPC, 10, 9107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 878, 8475, NPC, 10, 9108, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9107 then
   ShowMap(UID, 553);
end

local Check;

if EVENT == 9108 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 912)
        if  Check ==1 then        
        RunExchange(UID, 912);
        SaveEvent(UID, 9173);
        SaveEvent(UID, 9194);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 913)
        if  Check ==1 then        
        RunExchange(UID, 913);
        SaveEvent(UID, 9178);
        SaveEvent(UID, 9194);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 914)
        if  Check ==1 then        
        RunExchange(UID, 914);
        SaveEvent(UID, 9183);
        SaveEvent(UID, 9194);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 915)
        if  Check ==1 then        
        RunExchange(UID, 915);
        SaveEvent(UID, 9188);
        SaveEvent(UID, 9194);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
---------사도 사냥 끝----------
-------------------------------

-------------------------------
--------트롤 사냥 시작---------
-------------------------------

if EVENT == 9120 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9213);
    EVENT = 9121
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9218);
    EVENT = 9121
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9223);
    EVENT = 9121
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9228);
     EVENT = 9121
   end
end

if EVENT == 9121 then
    SelectMsg(UID, 1, 880, 8472, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9122 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 880, 8480, NPC, 10, 9125, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 880, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9125 then
    SelectMsg(UID, 4, 880, 8481, NPC, 22, 9123, 23, 9124, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9123 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9214);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9219);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9224);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9229);
   end
end

if EVENT == 9124 then
   SaveEvent(UID, 9217); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 9130 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9216);
    EVENT = 9131
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9221);
    EVENT = 9131
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9226);
    EVENT = 9131
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9231);
    EVENT = 9131
   end
end

if EVENT == 9131 then
    SelectMsg(UID, 1, 880, 8461, NPC, 29, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9126 then
    MonsterCount  = CountMonsterQuestSub(UID,880, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 880, 8462, NPC, 10, 9127, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 880, 8482, NPC, 10, 9128, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9127 then
   ShowMap(UID, 555);
end

local Check;

if EVENT == 9128 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1044)
        if  Check ==1 then        
        RunExchange(UID, 1044);
        SaveEvent(UID, 9215);
        SaveEvent(UID, 9236);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1045)
        if  Check ==1 then        
        RunExchange(UID, 1045);
        SaveEvent(UID, 9220);
        SaveEvent(UID, 9236);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1046)
        if  Check ==1 then        
        RunExchange(UID, 1046);
        SaveEvent(UID, 9225);
        SaveEvent(UID, 9236);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1047)
        if  Check ==1 then        
        RunExchange(UID, 1047);
        SaveEvent(UID, 9230);
        SaveEvent(UID, 9236);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
---------트롤 사냥 끝----------
-------------------------------

-------------------------------
------스톤골렘 사냥 시작-------
-------------------------------

if EVENT == 9160 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9297);
    EVENT = 9161
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9302);
    EVENT = 9161
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9307);
    EVENT = 9161
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9312);
     EVENT = 9161
   end
end

if EVENT == 9161 then
    SelectMsg(UID, 1, 884, 8472, NPC, 4080, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 9162 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 884, 8486, NPC, 10, 9165, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 884, 8261, NPC, 10, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9165 then
    SelectMsg(UID, 4, 884, 8487, NPC, 22, 9163, 23, 9164, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9163 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9298);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9303);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9308);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9313);
   end
end

if EVENT == 9164 then
   SaveEvent(UID, 9301); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 9170 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 9300);
    EVENT = 9171
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 9305);
    EVENT = 9171
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 9310);
    EVENT = 9171
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 9315);
    EVENT = 9171
   end
end

if EVENT == 9171 then
    SelectMsg(UID, 1, 884, 8461, NPC, 29, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9166 then
    MonsterCount  = CountMonsterQuestSub(UID,884, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 884, 8462, NPC, 10, 9167, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 884, 8488, NPC, 10, 9168, 27, 158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 9167 then
   ShowMap(UID, 557);
end

local Check;

if EVENT == 9168 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 993)
        if  Check ==1 then        
        RunExchange(UID, 993);
        SaveEvent(UID, 9299);
        SaveEvent(UID, 9320);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 994)
        if  Check ==1 then        
        RunExchange(UID, 994);
        SaveEvent(UID, 9304);
        SaveEvent(UID, 9320);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 995)
        if  Check ==1 then        
        RunExchange(UID, 995);
        SaveEvent(UID, 9309);
        SaveEvent(UID, 9320);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 996)
        if  Check ==1 then        
        RunExchange(UID, 996);
        SaveEvent(UID, 9314);
        SaveEvent(UID, 9320);        
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
--------스톤골렘 사냥 끝-------
-------------------------------

return Ret;