local UserClass;
local QuestNum;
local Ret = 0;
-------------------
--이슬란트여인
-------------------
if EVENT == 222  then
	QuestNum = SearchQuest(UID, 24412);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 1273, 24412, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 1274, 24412)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end


local ITEM_COUNT1=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 


if EVENT == 224 then
   ITEM_COUNT1 = HowmuchItem(UID, 910087000); --exchange 테이블 인덱스값   
   if  ITEM_COUNT1 <= 0 then -- 재료 없을때
      SelectMsg(UID, 2, 67, 1278, 24412, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT1  > 0 then-- 재료 있을때
          SelectMsg(UID, 4, 67, 1283, 24412, 41, 226, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end
end


local Check;

if EVENT == 226 then
  Check = CheckExchange(UID, 93)
   if  Check ==1 then
   RunExchange(UID, 93);
   SaveEvent(UID, 614); 
   else
  Ret = 1;	
  end	 
end
return Ret;