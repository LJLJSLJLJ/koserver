
-- 교만의 조각, 탐식의 조각, 분노의 조각, 나태의 조각-> 시련의 구슬

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC =16095;


-- 로덴 클릭시 퀘스트 체크  

if EVENT == 500 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
			 SelectMsg(UID, 2, -1, 4430, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1;
		elseif QuestNum > 1 and QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 4431, NPC)
      else--해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 168 then -- 그냥 닫기 
    Ret = 1;
end

--------------------------------------------------------------------------------
-- 비프로스트 구슬 제조 시작 

local savenum = 423
--------------------------------------------------------------------------------
if EVENT == 502 then
    SelectMsg(UID, 4, savenum, 4432, NPC, 4004, 503, 4005, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 503 then
   SaveEvent(UID, 4245);
   ITEM_COUNTA = HowmuchItem(UID, 389160000); -- 교만의 조각
   ITEM_COUNTB = HowmuchItem(UID, 389161000); -- 탐식의 조각
   ITEM_COUNTC = HowmuchItem(UID, 389162000);-- 분노의 조각
   ITEM_COUNTD = HowmuchItem(UID, 389163000);-- 나태의 조각
    if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 and  ITEM_COUNTD  > 0 then --재료가 다있을때 
    Check = CheckExchange(UID, 478)
        if  Check ==1 then   
        RunExchange(UID, 478);		 
        else
        Ret = 1; 
        end  
    else -- 재료가 없을때
       if ITEM_COUNTA <= 0 then -- A 재료 없을때
       SelectMsg(UID, 2, savenum, 4433, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTB <= 0 then -- B 재료 없을때 
       SelectMsg(UID, 2, savenum, 4434, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTC <= 0 then -- C 재료 없을때 
       SelectMsg(UID, 2, savenum, 4435, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D 재료 없을때
       SelectMsg(UID, 2, savenum, 4436, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end
--------------------------------------------------------------------------------
-- 비프로스트 구슬 제조 끝
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- 잃어버린방 입장 시작 

local savenum = 424

--------------------------------------------------------------------------------

if EVENT == 505 then
    SelectMsg(UID, 4, savenum, 4441, NPC, 4188, 506, 4005, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 506 then
   SaveEvent(UID, 4246);
   ITEM_COUNTA = HowmuchItem(UID, 389190000); -- 시련의 구슬
   ITEM_COUNTB = HowmuchItem(UID, 389164000); -- 음란의 조각
   ITEM_COUNTC = HowmuchItem(UID, 389165000);-- 시기의 조각
   ITEM_COUNTD = HowmuchItem(UID, 389166000);-- 탐욕의 조각
    if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 and  ITEM_COUNTD  > 0 then --재료가 다있을때 
        RunExchange(UID, 479);	
        ZoneChangeParty(UID, 31, 940, 186)
    else -- 재료가 없을때
       if ITEM_COUNTA <= 0 then -- A 재료 없을때
       SelectMsg(UID, 2, savenum, 4437, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTB <= 0 then -- B 재료 없을때 
       SelectMsg(UID, 2, savenum, 4438, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTC <= 0 then -- C 재료 없을때 
       SelectMsg(UID, 2, savenum, 4439, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D 재료 없을때
       SelectMsg(UID, 2, savenum, 4440, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

--------------------------------------------------------------------------------
-- 잃어버린방 입장 끝
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- 나이트 오브 스카이 시작 

local savenum = 425

--------------------------------------------------------------------------------

-- 시드미셀 등장

if EVENT == 510 then
   NATION = CheckNation(UID);
   SaveEvent(UID, 4250); --helper 번호 수정 
      if NATION == 1 then --카루스 일때 
      SelectMsg(UID, 1, savenum, 4442, NPC, 4080, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 엘모일때
      SelectMsg(UID, 1, savenum, 4443, NPC, 4080, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

-- 425번의 속성 0번 4번일 경우

if EVENT == 511 then
    SelectMsg(UID, 4, savenum, 4446, NPC, 22, 512, 23, 513, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 512 then
   SaveEvent(UID, 4251); --수락
end

if EVENT == 513then
   SaveEvent(UID, 4254); --거절  
end


-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 520 then
   SaveEvent(UID, 4253);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, savenum, 4451, NPC, 4080, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, savenum, 4452, NPC, 4080, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


-- 425번의 속성 1번 3번일 경우


if EVENT == 521 then
    SelectMsg(UID, 4, savenum, 4453, NPC, 4161, 522, 4162, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 522 then
   ITEM_COUNTA = HowmuchItem(UID, 389190000); -- 시련의 구슬
   ITEM_COUNTB = HowmuchItem(UID, 389164000); -- 음란의 조각
   ITEM_COUNTC = HowmuchItem(UID, 389165000);-- 시기의 조각
   ITEM_COUNTD = HowmuchItem(UID, 389166000);-- 탐욕의 조각
    if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 and  ITEM_COUNTD  > 0 then --재료가 다있을때 
    Check = CheckExchange(UID, 480)
        if  Check ==1 then   
        RunExchange(UID, 480);		 
        SaveEvent(UID, 4252);
       else
        Ret = 1; 
        end  
    else -- 재료가 없을때
       if ITEM_COUNTA <= 0 then -- A 재료 없을때
       SelectMsg(UID, 2, savenum, 4433, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTB <= 0 then -- B 재료 없을때 
       SelectMsg(UID, 2, savenum, 4434, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTC <= 0 then -- C 재료 없을때 
       SelectMsg(UID, 2, savenum, 4435, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D 재료 없을때
       SelectMsg(UID, 2, savenum, 4436, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

--------------------------------------------------------------------------------
-- 나이트 오브 스카이 끝
--------------------------------------------------------------------------------