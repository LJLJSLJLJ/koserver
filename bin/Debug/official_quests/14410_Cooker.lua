-- [황실요리사]

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 14410;

-- [황실요리사] 클릭시 퀘스트 체크  
-------------------------------
------맛의 절정-----
-------------------------------
if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 680, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 681, NPC)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--고기구해오기
--. 미쉘

if EVENT == 195 then
   SelectMsg(UID, 1, 65, 1260, NPC, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 41);
   SaveEvent(UID, 449);
end

--  102번의 속성 0번 4번일 경우

if EVENT == 200 then
   SelectMsg(UID, 2, 65, 683, NPC, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 65, 684, NPC, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 450);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 205 then
   SaveEvent(UID, 452);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 65, 1263, NPC, 32, 208, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 65, 685, NPC, 21, 208, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 210 then
   ITEM_COUNT = HowmuchItem(UID, 379204000); --exchange 테이블 인덱스값   
   if  ITEM_COUNT < 5 then -- 재료 없을때
      SelectMsg(UID, 2, 65, 686, NPC, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else
          SelectMsg(UID, 4, 65, 687, NPC, 41, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 213 then
   ShowMap(UID, 14);
end

local Check;

if EVENT == 214 then
  Check = CheckExchange(UID, 90)
   if  Check ==1 then
    SaveEvent(UID, 451);
    SaveEvent(UID, 455); 
    RunExchange(UID, 90);
    SelectMsg(UID, 2, 65, 689, NPC, 58, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);      
   else
  Ret = 1;	
  end	 
end


-------------------------------
-----맛의 절정            끝---
-------------------------------
return Ret;