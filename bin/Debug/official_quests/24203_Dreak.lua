-- [드레이크]

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;

-- [대마법사] 드레이크클릭시 퀘스트 체크  


if EVENT == 190 then
    Status1 = CheckEventStatus(UID, 215)
    Status2 = CheckEventStatus(UID, 114)
    Status3 = CheckEventStatus(UID, 216)
    Status4 = CheckEventStatus(UID, 217)
    Status5 = CheckEventStatus(UID, 212)
    Status6 = CheckEventStatus(UID, 213)
        if Status1 == 2 then
        SaveEvent(UID, 559);
        elseif Status2 == 2 then
        SaveEvent(UID, 157);
        elseif Status3 == 2 then
        SaveEvent(UID, 565)
        elseif Status4 == 2 then
        SaveEvent(UID, 571);
        elseif Status5 == 2 then
        SaveEvent(UID, 541)
        elseif Status6 == 2 then
        SaveEvent(UID, 547);
       else
        QuestNum = SearchQuest(UID, 24203);
            if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 335, 24203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
            elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
            NpcMsg(UID, 336,24203)
            else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
            EVENT = QuestNum
            end
        end
end


if EVENT == 193 then
    Ret = 1;
end

--적국침투. 미쉘

if EVENT == 195 then
   SelectMsg(UID, 1, 69, 1233, 24203, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 19);
   SaveEvent(UID, 136);
end

--  102번의 속성 0번 4번일 경우

if EVENT == 200 then
   SelectMsg(UID, 2, 69, 1014, 24203, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 69, 1015, 24203, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 136);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 205 then
   SaveEvent(UID, 138);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 69, 1016, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 69, 1016, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 210 then
   ITEM_COUNT = HowmuchItem(UID, 910090000);
   if  ITEM_COUNT <= 0 then -- 재료 없을때
      SelectMsg(UID, 2, 69, 1017, 24203, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT  > 0 then-- 재료 있을때
          SelectMsg(UID, 2, 69, 1018, 24203, 41, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 213 then
   ShowMap(UID, 17);
end

local Check;

if EVENT == 214 then
  Check = CheckExchange(UID, 34)
   if  Check ==1 then
      RunExchange(UID, 34);       
      SaveEvent(UID, 137);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
---엡솔루트 파워 - 정신의 증거 퀘스트 --
----------------------------------------


if EVENT == 300 then
   SelectMsg(UID, 1, 212, 345, 24203, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
   ShowMap(UID, 19);
   SaveEvent(UID, 537);
end


--  105번의 속성 0번 4번일 경우

if EVENT == 303 then
   SelectMsg(UID, 2, 212, 346, 24203, 10, 304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 304 then
   SelectMsg(UID, 4, 212, 347, 24203, 22, 305, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 305 then
   SaveEvent(UID, 538);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 306 then
   SaveEvent(UID, 540);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 212, 348, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 212, 349, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 308 then
   ITEM_COUNT1 = HowmuchItem(UID, 379031000);--우황청심환 만들어주세요~
   ITEM_COUNT2 = HowmuchItem(UID, 379032000);
   ITEM_COUNT3 = HowmuchItem(UID, 379033000);
   if  ITEM_COUNT1 <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 212, 350, 24203, 18, 309, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 212, 351, 24203, 18, 309 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT3 <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 212, 352, 24203, 18, 309, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end      
   if ITEM_COUNT1 > 4 and ITEM_COUNT2 > 4 and ITEM_COUNT3 > 4 then -- 
     SelectMsg(UID, 2, 212, 353, 24203, 41, 312, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end 
end

if EVENT == 309 then
   ShowMap(UID, 20);
end

local Check;

if EVENT == 312 then
  Check = CheckExchange(UID, 35)
   if  Check ==1 then
   RunExchange(UID, 35);  
   SaveEvent(UID, 541);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
---엡솔루트 파워 주문서 - 정신의 증거 퀘스트 끝-------------------
----------------------------------------

----------------------------------------
---엡솔루트 파워 주문서 - 육체의 증거 퀘스트 ---------------------
----------------------------------------


if EVENT == 313 then
   SelectMsg(UID, 1, 213, 1235, 24203, 28, 314, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 314 then
   ShowMap(UID, 19);
   SaveEvent(UID, 543);
end


--  속성 0번 4번일 경우

if EVENT == 315 then
   SelectMsg(UID, 2, 213, 356, 24203, 10, 316, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 316 then
   SelectMsg(UID, 4, 213, 357, 24203, 22, 317, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 317 then
   SaveEvent(UID, 544);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 318 then
   SaveEvent(UID, 546);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 213, 358, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 213, 359, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 320 then
   ITEM_COUNT1 = HowmuchItem(UID, 379030000);--
   ITEM_COUNT2 = HowmuchItem(UID, 379022000);
   if  ITEM_COUNT1 <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 213, 360, 24203, 18, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 4 then -- 재료 없을때
        SelectMsg(UID, 2, 213, 361, 24203, 18, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT2  > 4 and ITEM_COUNT1  > 4 then-- 재료 있을때
            SelectMsg(UID, 2, 213, 362, 24203, 41, 321, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 310 then
   ShowMap(UID, 20);
end


local Check;

if EVENT == 321 then
  Check = CheckExchange(UID, 36)
   if  Check ==1 then
   RunExchange(UID, 36);  
   SaveEvent(UID, 547);
   else
  Ret = 1;	
  end	 
end


----------------------------------------
---엡솔루트 파워 주문서 - 육체의 증거 퀘스트 끝-------------------
----------------------------------------

----------------------------------------
---전직 - 마력의 완장 퀘스트 ----
----------------------------------------


if EVENT == 322 then
   SelectMsg(UID, 1, 214, 364, 24203, 28, 323, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 323 then
   ShowMap(UID, 19);
   SaveEvent(UID, 549);
end


--  속성 0번 4번일 경우

if EVENT == 324 then
   SelectMsg(UID, 2, 214, 365, 24203, 10, 325, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 325 then
   SelectMsg(UID, 4, 214, 366, 24203, 22, 326, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 326 then
   SaveEvent(UID, 550);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 327 then
   SaveEvent(UID, 552);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 214, 367, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 214, 368, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 329 then
   ITEM_COUNT1 = HowmuchItem(UID, 379043000);--
   ITEM_COUNT2 = HowmuchItem(UID, 379044000);
   ITEM_COUNT3 = HowmuchItem(UID, 379014000);
   ITEM_COUNT4 = HowmuchItem(UID, 379236000);
   if  ITEM_COUNT1 <= 49 then -- 재료 없을때
      SelectMsg(UID, 2, 214, 369, 24203, 18, 330, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 49 then -- 재료 없을때
        SelectMsg(UID, 2, 214, 370, 24203, 18, 331, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 9 then -- 재료 없을때
        SelectMsg(UID, 2, 214, 371, 24203, 18, 332, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT4 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 214, 371, 24203, 18, 180, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
      if ITEM_COUNT1  > 49 and ITEM_COUNT2  > 49 and ITEM_COUNT3  > 9 and ITEM_COUNT4 > 0 then-- 재료 있을때
            SelectMsg(UID, 2, 214, 372, 24203, 41, 333, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 330 then
   ShowMap(UID, 12);
end

if EVENT == 331 then
   ShowMap(UID, 22);
end

if EVENT == 332 then
   ShowMap(UID, 21);
end

if EVENT == 180 then
   ShowMap(UID, 19);
end

local Check;

if EVENT == 333 then
  Check = CheckExchange(UID, 37)
   if  Check ==1 then
   RunExchange(UID, 37);  
   SaveEvent(UID, 157);
   else
  Ret = 1;	
  end	 
end

----------------------------------------
---전직 - 마력의 완장끝-------------------
----------------------------------------
----------------------------------------
---엡술루트 파워  퀘스트 ---------------
----------------------------------------


if EVENT == 334 then
   SelectMsg(UID, 1, 215, 374, 24203, 28, 335, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 335 then
   ShowMap(UID, 19);
   SaveEvent(UID, 555);
end


--  속성 0번 4번일 경우

if EVENT == 336 then
   SelectMsg(UID, 2, 215, 375, 24203, 10, 337, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 337 then
   SelectMsg(UID, 4, 215, 376, 24203, 22, 338, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 338 then
   SaveEvent(UID, 556);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 339 then
   SaveEvent(UID, 558);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 215, 377, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 215, 378, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 341 then
   ITEM_COUNT1 = HowmuchItem(UID, 379239000);--
   ITEM_COUNT2 = HowmuchItem(UID, 379240000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if  ITEM_COUNT1 <= 0 then -- 재료 없을때
      SelectMsg(UID, 2, 215, 379, 24203, 18, 342, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 215, 380, 24203, 18, 342, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 4999999 then -- 재료 없을때
        SelectMsg(UID, 2, 215, 381,24203, 18, 344, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 0 and ITEM_COUNT3  > 4999999  then-- 재료 있을때
            SelectMsg(UID, 2, 215, 383, 24203, 41, 346, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 342 then
   ShowMap(UID, 19);
end


if EVENT == 344 then
   ShowMap(UID, 9);
end


local Check;

if EVENT == 346 then
  Check = CheckExchange(UID, 38)
   if  Check ==1 then
   RunExchange(UID, 38);  
   SaveEvent(UID, 559);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
---엡솔루트 파워 끝-------------------
----------------------------------------
----------------------------------------
-- 70레벨 퀘스트 - 마법의 비약 퀘스트 --
----------------------------------------


if EVENT == 347 then
   SelectMsg(UID, 1, 216, 385, 24203, 28, 348, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 348 then
   ShowMap(UID, 19);
   SaveEvent(UID, 561);
end


--  속성 0번 4번일 경우

if EVENT == 349 then
   SelectMsg(UID, 2, 216, 386, 24203, 10, 350, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 350 then
   SelectMsg(UID, 4, 216, 387, 24203, 22, 351, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 351 then
   SaveEvent(UID, 562);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 352 then
   SaveEvent(UID, 564);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 216, 388, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 216, 389, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 354 then
   ITEM_COUNT1 = HowmuchItem(UID, 379098000);--
   ITEM_COUNT2 = HowmuchItem(UID, 379203000);
   ITEM_COUNT3 = HowmuchItem(UID, 379040000);
   if  ITEM_COUNT1 <= 19 then -- 재료 없을때
      SelectMsg(UID, 2, 216, 390, 24203, 18, 355, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 49 then -- 재료 없을때
        SelectMsg(UID, 2, 216, 391, 24203, 18, 356, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 216, 392, 24203, 18, 357, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
    if  ITEM_COUNT1 > 19 and ITEM_COUNT2 > 49  and ITEM_COUNT3 > 0 then -- 재료 없을때
        SelectMsg(UID, 2, 216, 393, 24203, 41, 358, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 355 then
   ShowMap(UID, 26);
end

if EVENT == 356 then
   ShowMap(UID, 27);
end

if EVENT == 357 then
   ShowMap(UID, 28);
end

local Check;

if EVENT == 358 then
  Check = CheckExchange(UID, 39)
   if  Check ==1 then
   RunExchange(UID, 39);  
   SaveEvent(UID, 565);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
-- 70레벨 퀘스트 - 마법의 비약 퀘스트 끝-
----------------------------------------

----------------------------------------
-- 70레벨 퀘스트 - 마력의 인장 퀘스트 --
----------------------------------------


if EVENT == 359 then
   SelectMsg(UID, 1, 217, 500, 24203, 28, 360, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 360 then
   ShowMap(UID, 19);
   SaveEvent(UID, 567);
end


--  속성 0번 4번일 경우

if EVENT == 361 then
   SelectMsg(UID, 2, 217, 501, 24203, 10, 362, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 362 then
   SelectMsg(UID, 4, 217, 502, 24203, 22, 363, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 363 then
   SaveEvent(UID, 568);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 364 then
   SaveEvent(UID, 570);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 217, 503, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 217, 504, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 366 then
   ITEM_COUNT1 = HowmuchItem(UID, 379011000);--
   ITEM_COUNT2 = HowmuchItem(UID, 389074000);
   ITEM_COUNT3 = HowmuchItem(UID, 379067000);
   if  ITEM_COUNT1 <= 29 then -- 재료 없을때
      SelectMsg(UID, 2, 217, 505, 24203, 18, 367, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 29 then -- 재료 없을때
        SelectMsg(UID, 2, 217, 506, 24203, 18, 368, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 217, 507, 24203, 18, 369, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
 if  ITEM_COUNT1 > 29 and ITEM_COUNT2 > 29 and ITEM_COUNT3 > 0 then 
           SelectMsg(UID, 2, 217, 508, 24203, 41, 370, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 367 then
   ShowMap(UID, 29);
end

if EVENT == 368 then
   ShowMap(UID, 23);
end

if EVENT == 369 then
   ShowMap(UID, 30);
end

local Check;

if EVENT == 370 then
  Check = CheckExchange(UID, 40)
   if  Check ==1 then
   RunExchange(UID, 40);  
   SaveEvent(UID, 571);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
---70레벨 퀘스트 - 마력의 인장 퀘스트 끝-
----------------------------------------

----------------------------------------
--- 마법의 가루 재조 퀘스트 ------------
----------------------------------------


if EVENT == 371 then
   SelectMsg(UID, 1, 218, 1240, 24203, 28, 372, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 372 then
   ShowMap(UID, 19);
   SaveEvent(UID, 573);
end


--  속성 0번 4번일 경우

if EVENT == 373 then
   SelectMsg(UID, 2, 218, 511, 24203, 10, 374, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 374 then
   SelectMsg(UID, 4, 218, 512, 24203, 22, 375, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 375 then
   SaveEvent(UID, 574);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 376 then
   SaveEvent(UID, 576);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 218, 513, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 218, 514, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 378 then
   ITEM_COUNT1 = HowmuchItem(UID, 389074000);--
   ITEM_COUNT2 = HowmuchItem(UID, 389075000);
   ITEM_COUNT3 = HowmuchItem(UID, 389076000);
   if  ITEM_COUNT1 <= 9 then -- 1재료 없을때
         SelectMsg(UID, 2, 218, 515, 24203, 18, 379, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 9 then -- 2재료 없을때
        SelectMsg(UID, 2, 218, 516, 24203, 18, 379, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 9 then -- 3재료 없을때
        SelectMsg(UID, 2, 218, 517, 24203, 18, 379, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end
   if ITEM_COUNT1  > 9 and ITEM_COUNT2  > 9 and ITEM_COUNT3  > 9 then-- 재료 있을때
            SelectMsg(UID, 2, 218, 518, 24203, 41, 382, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end   
end

if EVENT == 379 then
   ShowMap(UID, 23);
end


local Check;

if EVENT == 382 then
  Check = CheckExchange(UID, 41)
   if  Check ==1 then
   RunExchange(UID, 41);  
   SaveEvent(UID, 577);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
--- 마법의 가루 재조 퀘스트 ------------
----------------------------------------

----------------------------------------
--- 쏜 마법 주문서 퀘스트 ------------
----------------------------------------


if EVENT == 383 then
   SelectMsg(UID, 1, 219, 520, 24203, 28, 384, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 384 then
   ShowMap(UID, 19);
   SaveEvent(UID, 579);
end


--  속성 0번 4번일 경우

if EVENT == 385 then
   SelectMsg(UID, 2, 219, 521, 24203, 10, 386, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 386 then
   SelectMsg(UID, 4, 219, 522, 24203, 22, 387, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 387 then
   SaveEvent(UID, 580);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 388 then
   SaveEvent(UID, 582);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 219, 523, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 219, 524, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 390 then
   ITEM_COUNT1 = HowmuchItem(UID, 900000000);--
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);--마법의 보석가루 필요
   if  ITEM_COUNT1 <= 4999999 then -- 노아가 없을때
      SelectMsg(UID, 2, 219, 525, 24203, 18, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 2 then -- 재료 없을때
        SelectMsg(UID, 2, 219, 526, 24203, 18, 392, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 > 4999999 and ITEM_COUNT2 > 2 then
            SelectMsg(UID, 2, 219, 528, 24203, 41, 394, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 392 then
   ShowMap(UID, 19);
end


local Check;

if EVENT == 394 then
  Check = CheckExchange(UID, 42)
   if  Check ==1 then
   RunExchange(UID, 42);  
   SaveEvent(UID, 581);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
--- 쏜 마법 주문서 퀘스트 끝------------
----------------------------------------

----------------------------------------
--- 임펙트 마법 주문서 - 고블린 정장----
----------------------------------------


if EVENT == 500 then
   SelectMsg(UID, 1, 220, 530, 24203, 28, 501, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 501 then
   ShowMap(UID, 19);
   SaveEvent(UID, 585);
end


--  속성 0번 4번일 경우

if EVENT == 502 then
   SelectMsg(UID, 2, 220, 531, 24203, 10, 503, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 503 then
   SelectMsg(UID, 4, 220, 532, 24203, 22, 504, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 504 then
   SaveEvent(UID, 586);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 505 then
   SaveEvent(UID, 588);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 220, 533, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 220, 534, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 507 then
   ITEM_COUNT1 = HowmuchItem(UID, 263001271);--
   ITEM_COUNT2 = HowmuchItem(UID, 263002271);
   ITEM_COUNT3 = HowmuchItem(UID, 263003271);
   if  ITEM_COUNT1 <=0  then -- 재료가 없을때
      SelectMsg(UID, 2, 220, 535, 24203, 18, 508, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 220, 536, 24203, 18, 508, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 220, 537, 24203, 18, 508, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 >0  and ITEM_COUNT2 >0 and ITEM_COUNT3 >0 then -- 
        SelectMsg(UID, 2, 220, 538, 24203, 41, 511, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 508 then
   ShowMap(UID, 8);
end

local Check;

if EVENT == 511 then
  Check = CheckExchange(UID, 43)
   if  Check ==1 then
   RunExchange(UID, 43);  
   SaveEvent(UID, 587);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
--- 임펙트 마법 주문서 - 고블린 정장 끝-
----------------------------------------

----------------------------------------
--- 임펙트 마법 주문서 - 완성된 고블린 갑옷----
----------------------------------------


if EVENT == 512 then
   SelectMsg(UID, 1, 221, 540, 24203, 28, 513, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 513 then
   ShowMap(UID, 19);
   SaveEvent(UID, 591);
end


--  속성 0번 4번일 경우

if EVENT == 514 then
   SelectMsg(UID, 2, 221, 541, 24203, 10, 515, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 515 then
   SelectMsg(UID, 4, 221, 542, 24203, 22, 516, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 516 then
   SaveEvent(UID, 592);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 517 then
   SaveEvent(UID, 594);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 221, 543, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 221, 544, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 520 then
   ITEM_COUNT1 = HowmuchItem(UID, 379237000);--고블린 정장 필요
   ITEM_COUNT2 = HowmuchItem(UID, 263004271);
   ITEM_COUNT3 = HowmuchItem(UID, 263005271);
   if  ITEM_COUNT1 <=0  then -- 재료가 없을때
      SelectMsg(UID, 2, 221, 545, 24203, 18, 521, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 221, 546, 24203, 18, 522, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 221, 547, 24203, 18, 522, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   if  ITEM_COUNT1 >0 and ITEM_COUNT2 >0 and ITEM_COUNT3 >0 then -- 재료가 없을때
            SelectMsg(UID, 2, 221, 548, 24203, 41, 523, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 521 then
   ShowMap(UID, 19);
end

if EVENT == 522 then
   ShowMap(UID, 8);
end

local Check;

if EVENT == 523 then
  Check = CheckExchange(UID, 44)
   if  Check ==1 then
   RunExchange(UID, 44);  
   SaveEvent(UID, 593);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
--- 임펙트 마법 주문서 - 완성된 고블린 갑옷----
----------------------------------------
----------------------------------------
--- 임펙트 마법 주문서 퀘스트-----------
----------------------------------------


if EVENT == 524 then
   SelectMsg(UID, 1, 222, 1244, 24203, 28, 525, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 525 then
   ShowMap(UID, 19);
   SaveEvent(UID, 597);
end


--  속성 0번 4번일 경우    

if EVENT == 526 then
   SelectMsg(UID, 2, 222, 551, 24203, 10, 527, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 527 then
   SelectMsg(UID, 4, 222, 552, 24203, 22, 528, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 528 then
   SaveEvent(UID, 598);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 529 then
   SaveEvent(UID, 600);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 222, 553, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 222, 554, 24203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 531 then
   ITEM_COUNT1 = HowmuchItem(UID, 379238000);--완성된 고블린 갑옷 필요
   ITEM_COUNT2 = HowmuchItem(UID, 900000000);
   
   if  ITEM_COUNT1 <=0  then -- 재료가 없을때
      SelectMsg(UID, 2, 222, 555, 24203, 18, 532, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <=4999999  then -- 재료 없을때
        SelectMsg(UID, 2, 222, 556, 24203, 18, 532, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 >0 and ITEM_COUNT2 >4999999  then 
            SelectMsg(UID, 2, 222, 557, 24203, 41, 533, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 532 then
   ShowMap(UID, 19);
end

local Check;

if EVENT == 533 then
  Check = CheckExchange(UID, 45)
   if  Check ==1 then
   RunExchange(UID, 45);  
   SaveEvent(UID, 599);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
--- 임펙트 마법 주문서 퀘스트 끝--------
----------------------------------------


--******************************************************--
-- 2차 전직 시작 
--******************************************************--

local NPC = 24203;
local savenum = 408;

-- 시드미셀 등장

if EVENT == 550 then
   Class = CheckClass (UID);
   if  Class == 9  then -- 2차전직 가능한 경우
   SaveEvent(UID, 4105); --helper 번호 수정 
   NATION = CheckNation(UID);
      if NATION == 1 then --카루스 일때 
      SelectMsg(UID, 1, savenum, 4104, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 엘모일때
      SelectMsg(UID, 1, savenum, 4105, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   else -- 2차 전직이 되거나, 1차 전직도 안한 경우
    Ret = 1;
   end
end

-- 드레이크 408번의 속성 0번 4번일 경우

if EVENT == 551 then   
Level = CheckLevel(UID)
   if Level > 59 then -- 레벨이 60이상인가?   
   Class = CheckClass (UID);
      if Class == 5 or Class == 7 or Class == 9 or Class == 11 then -- 1차 전직 전인가 체크
       SelectMsg(UID, 4, savenum, 4108, NPC, 22, 552, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else --1차 전직을 이미 했을때
      SaveEvent(UID, 4107);
      SelectMsg(UID, 2, savenum, 4107, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   else --레벨이 60이하일때 
   SelectMsg(UID, 2, savenum, 4106, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 552 then
   SaveEvent(UID, 4106); --수락시
end

if EVENT == 534 then
   SaveEvent(UID, 4109); -- 거절시 
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 535 then
   SaveEvent(UID, 4108);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, savenum, 4113, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, savenum, 4114, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

-- 드레이크 408번의 속성 1번 3번일 경우


if EVENT == 536 then
   ITEM_COUNTA = HowmuchItem(UID, 379045000); --스켈레톤의 뼈
   ITEM_COUNTB = HowmuchItem(UID, 379046000); -- 하피퀸의 깃털
   ITEM_COUNTC = HowmuchItem(UID, 379242000);-- 마력의 완장
   ITEM_COUNTD = HowmuchItem(UID, 330310014);-- 케쿠리 반지
    if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 and  ITEM_COUNTD  > 0 then --재료가 다있을때 
      SelectMsg(UID, 2, savenum, 4115, NPC, 4062, 537, 4063, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 재료가 없을때
       if ITEM_COUNTA <= 0 then -- A 재료 없을때
       SelectMsg(UID, 2, savenum, 4109, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTB <= 0 then -- B 재료 없을때 
       SelectMsg(UID, 2, savenum, 4110, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  ITEM_COUNTC <= 0 then -- C 재료 없을때 
       SelectMsg(UID, 2, savenum, 4111, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D 재료 없을때
       SelectMsg(UID, 2, savenum, 4112, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

if EVENT == 537 then
   SaveEvent(UID, 4107);
   RobItem(UID, 379045000, 1);
   RobItem(UID, 379046000, 1);
   RobItem(UID, 379242000, 1);
   RobItem(UID, 330310014, 1);
   PromoteUser(UID)
   NATION = CheckNation(UID);
   if NATION == 1 then --카루스 일때 
   SelectMsg(UID, 1, savenum, 4092, NPC, 4064, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
   SelectMsg(UID, 1, savenum, 4093, NPC, 4064, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

--******************************************************--
-- 2차 전직 끝 
--******************************************************--
--******************************************************--
-- 70Lv skill - start
--******************************************************--

--seed or misel call

if EVENT == 620 then
   SelectMsg(UID, 1, 53, 3235, 24203, 3006, 621, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 621 then
   ShowMap(UID, 19);
   SaveEvent(UID, 3452);
end

if EVENT == 622 then
   SelectMsg(UID, 1, 53, 3234, 24203, 3006, 621, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 70Lv skill no.53 type 0 or 4

if EVENT == 623 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2차 전직 자인가 체크 
   SelectMsg(UID, 2, 53, 3236, 24203, 10, 624, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2차 전직을 안했을때 
   SelectMsg(UID, 2, 53, 4712, 24203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 624 then
   SelectMsg(UID, 4, 53, 3237, 24203, 22, 625, 23, 631, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 625 then
   SaveEvent(UID, 3453);
   SelectMsg(UID, 2, 53, 3238, 24203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 631 then
   SelectMsg(UID, 2, 53, 3239, 24203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 626 then
   SaveEvent(UID, 3455);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 53, 3241, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 53, 3242, 24203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;

if EVENT == 628 then
   ITEM_COUNT1 = HowmuchItem(UID, 379065000);
   ITEM_COUNT2 = HowmuchItem(UID, 379247000);
   ITEM_COUNT3 = HowmuchItem(UID, 379248000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 0 and ITEM_COUNT3  > 0 then-- 재료 다있을때
      SelectMsg(UID, 4, 53, 3243, 24203, 41, 630, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1재료 없을때
        SelectMsg(UID, 2, 53, 3240, 24203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2재료 없을때
         SelectMsg(UID, 2, 53, 3240, 24203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 3재료 없을때
         SelectMsg(UID, 2, 53, 3240, 24203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end

if EVENT == 629 then
   ShowMap(UID, 304);
end

local Check;

if EVENT == 630 then
   Check = CheckExchange(UID, 331);
   if  Check == 1 then
   Exchange =RunExchange(UID, 331);
        if  Exchange == 1 then
        SaveEvent(UID, 3454);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end


--******************************************************--
-- 70Lv skill - end
--******************************************************--


--******************************************************--
-- 72Lv skill - start
local savenum = 515;
local NPC = 24203;
--******************************************************--

--seed or misel call

if EVENT == 920 then
   SelectMsg(UID, 1, savenum, 5155, NPC, 3006, 921, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--시드

if EVENT == 921 then
   ShowMap(UID, 19);
   SaveEvent(UID, 5161);
end

if EVENT == 922 then
   SelectMsg(UID, 1, savenum, 5156, NPC, 3006, 921, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--미셀

--  type 0 or 4

if EVENT == 923 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2차 전직 자인가 체크 
    SelectMsg(UID, 2, savenum, 5158, NPC, 10, 924, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2차 전직을안했을때 
    SelectMsg(UID, 2, savenum, 5157, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 924 then
   SelectMsg(UID, 4, savenum, 5159, NPC, 22, 925, 23, 931, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 925 then
   SaveEvent(UID, 5162);
   SelectMsg(UID, 2, savenum, 5160, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 931 then
   SelectMsg(UID, 2, savenum, 5161, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 926 then
   SaveEvent(UID, 5164);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, savenum, 5163, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, savenum, 5164, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 928 then
   ITEM_COUNT1 = HowmuchItem(UID, 379248000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- 재료 다있을때
      SelectMsg(UID, 4, savenum, 5165, NPC, 41, 930, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1재료 없을때
        SelectMsg(UID, 2, savenum, 5162, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2재료 없을때
         SelectMsg(UID, 2, savenum, 5162, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3재료 없을때
         SelectMsg(UID, 2, savenum, 5162, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4재료 없을때
         SelectMsg(UID, 2, savenum, 5162, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 930 then
   Check = CheckExchange(UID, 525);
   if  Check == 1 then
   Exchange =RunExchange(UID, 525);
        if  Exchange == 1 then
        SaveEvent(UID, 5163);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 72Lv skill - end
--******************************************************--

--******************************************************--
-- 75Lv skill - start
local savenum = 516;
--******************************************************--

--seed or misel call

if EVENT == 1020 then
   SelectMsg(UID, 1, savenum, 5166, NPC, 3006, 1021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--시드

if EVENT == 1021 then
   ShowMap(UID, 19);
   SaveEvent(UID, 5173);
end

if EVENT == 1022 then
   SelectMsg(UID, 1, savenum, 5167, NPC, 3006, 1021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--미셀

--  type 0 or 4

if EVENT == 1023 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2차 전직 자인가 체크 
    SelectMsg(UID, 2, savenum, 5169, NPC, 10, 1024, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2차 전직을안했을때 
    SelectMsg(UID, 2, savenum, 5168, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 1024 then
   SelectMsg(UID, 4, savenum, 5170, NPC, 22, 1025, 23, 1031, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1025 then
   SaveEvent(UID, 5174);
   SelectMsg(UID, 2, savenum, 5171, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1031 then
   SelectMsg(UID, 2, savenum, 5172, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 1026 then
   SaveEvent(UID, 5176);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, savenum, 5174, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, savenum, 5175, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 1028 then
   ITEM_COUNT1 = HowmuchItem(UID, 379248000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- 재료 다있을때
      SelectMsg(UID, 4, savenum, 5176, NPC, 41, 1030, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1재료 없을때
        SelectMsg(UID, 2, savenum, 5173, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2재료 없을때
         SelectMsg(UID, 2, savenum, 5173, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3재료 없을때
         SelectMsg(UID, 2, savenum, 5173, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4재료 없을때
         SelectMsg(UID, 2, savenum, 5173, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 1030 then
   Check = CheckExchange(UID, 526)
   if  Check == 1 then
   Exchange =RunExchange(UID, 526);
        if  Exchange == 1 then
        SaveEvent(UID, 5175);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 75Lv skill - end
--******************************************************--

--******************************************************--
-- 80Lv skill - start
local savenum = 517;
--******************************************************--

--seed or misel call

if EVENT == 1120 then
   SelectMsg(UID, 1, savenum, 5177, NPC, 3006, 1121, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--시드

if EVENT == 1121 then
   ShowMap(UID, 19);
   SaveEvent(UID, 5185);
end

if EVENT == 1122 then
   SelectMsg(UID, 1, savenum, 5178, NPC, 3006, 1121, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--미셀

--  type 0 or 4

if EVENT == 1123 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2차 전직 자인가 체크 
    SelectMsg(UID, 2, savenum, 5180, NPC, 10, 1124, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2차 전직을안했을때 
    SelectMsg(UID, 2, savenum, 5179, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 1124 then
   SelectMsg(UID, 4, savenum, 5181, NPC, 22, 1125, 23, 1131, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1125 then
   SaveEvent(UID, 5186);
   SelectMsg(UID, 2, savenum, 5182, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1131 then
   SelectMsg(UID, 2, savenum, 5183, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 1126 then
   SaveEvent(UID, 5188);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, savenum, 5185, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, savenum, 5186, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 1128 then
   ITEM_COUNT1 = HowmuchItem(UID, 379247000);
   ITEM_COUNT2 = HowmuchItem(UID, 379236000);
   ITEM_COUNT3 = HowmuchItem(UID, 900000000);
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- 재료 다있을때
      SelectMsg(UID, 4, savenum, 5187, NPC, 41, 1130, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1재료 없을때
        SelectMsg(UID, 2, savenum, 5184, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2재료 없을때
         SelectMsg(UID, 2, savenum, 5184, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT3 <= 0 then -- 3재료 없을때
         SelectMsg(UID, 2, savenum, 5184, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 4재료 없을때
         SelectMsg(UID, 2, savenum, 5184, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end


local Check;

if EVENT == 1130 then
   Check = CheckExchange(UID, 527)
   if  Check == 1 then
   Exchange =RunExchange(UID, 527);
        if  Exchange == 1 then
        SaveEvent(UID, 5187);
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 80Lv skill - end
--******************************************************--



return Ret;