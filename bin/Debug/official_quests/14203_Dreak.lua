-- [드레이크]

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�
---토크 여분 번호 : 400 ~500
---이벤트 여분 번호 : 400 ~500
-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;

-- [대마법사] 드레이크클릭시 퀘스트 체크  


if EVENT == 190 then
    Status1 = CheckEventStatus(UID, 115)
    Status2 = CheckEventStatus(UID, 114)
    Status3 = CheckEventStatus(UID, 116)
    Status4 = CheckEventStatus(UID, 117)
    Status5 = CheckEventStatus(UID, 112)
    Status6 = CheckEventStatus(UID, 113)
        if Status1 == 2 then
        SaveEvent(UID, 163);
        elseif Status2 == 2 then
        SaveEvent(UID, 157);
        elseif Status3 == 2 then
        SaveEvent(UID, 169);
        elseif Status4 == 2 then
        SaveEvent(UID, 175);
        elseif Status5 == 2 then
        SaveEvent(UID, 145);
        elseif Status6 == 2 then
        SaveEvent(UID, 151);
       else
            QuestNum = SearchQuest(UID, 14203);
            if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
            -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 335, 14203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
            elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
            NpcMsg(UID, 336,14203)
            else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
            EVENT = QuestNum
            end
        end
end


if EVENT == 193 then
    Ret = 1;
end

----------------------------------------
---적국 침투----------------------------
----------------------------------------
--적국침투. 미쉘

if EVENT == 195 then
   SelectMsg(UID, 1, 69, 337, 14203, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 18);
   SaveEvent(UID, 128);
end

--  102번의 속성 0번 4번일 경우

if EVENT == 200 then
   SelectMsg(UID, 2, 69, 339, 14203, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 69, 340, 14203, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 129);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 205 then
   SaveEvent(UID, 131);
   NATION = CheckNation(UID);
   if NATION == 2 then -- 카루스 일때
      SelectMsg(UID, 1, 69, 341, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end


local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 210 then
   ITEM_COUNT = HowmuchItem(UID, 910091000);
   if  ITEM_COUNT <= 0 then -- 재료 없을때
      SelectMsg(UID, 2, 69, 342, 14203, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 0 then-- 재료 있을때
          SelectMsg(UID, 2, 69, 343, 14203, 41, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 213 then
   ShowMap(UID, 16);
end

local Check;

if EVENT == 214 then
  Check = CheckExchange(UID, 33)
   if  Check ==1 then
      RunExchange(UID, 33);       
      SaveEvent(UID, 130);
   else
  Ret = 1;	
  end	 
end
----------------------------------------
---적국 침투 끝-------------------------
----------------------------------------

----------------------------------------
---엡솔루트 파워 - 정신의 증거 퀘스트 --
----------------------------------------


if EVENT == 300 then
   SelectMsg(UID, 1, 112, 1234, 14203, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
   ShowMap(UID, 18);
   SaveEvent(UID, 141);
end


--  105번의 속성 0번 4번일 경우

if EVENT == 303 then
   SelectMsg(UID, 2, 112, 346, 14203, 10, 304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 304 then
   SelectMsg(UID, 4, 112, 347, 14203, 22, 305, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 305 then
   SaveEvent(UID, 142);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 306 then
   SaveEvent(UID, 144);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 112, 348, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 112, 349, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 112, 350, 14203, 18, 309, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 112, 351, 14203, 18, 309 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT3 <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 112, 352, 14203, 18, 309, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end      
   if ITEM_COUNT1 > 4 and ITEM_COUNT2 > 4 and ITEM_COUNT3 > 4 then -- 
     SelectMsg(UID, 2, 112, 353, 14203, 41, 312, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
   SaveEvent(UID, 145);
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
   SelectMsg(UID, 1, 113, 355, 14203, 28, 314, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 314 then
   ShowMap(UID, 18);
   SaveEvent(UID, 147);
end


--  속성 0번 4번일 경우

if EVENT == 315 then
   SelectMsg(UID, 2, 113, 356, 14203, 10, 316, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 316 then
   SelectMsg(UID, 4, 113, 357, 14203, 22, 317, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 317 then
   SaveEvent(UID, 148);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 318 then
   SaveEvent(UID, 150);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 113, 358, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 113, 359, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 113, 360, 14203, 18, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 4 then -- 재료 없을때
        SelectMsg(UID, 2, 113, 361, 14203, 18, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT2  > 4 and ITEM_COUNT1  > 4 then-- 재료 있을때
            SelectMsg(UID, 2, 113, 362, 14203, 41, 321, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
   SaveEvent(UID, 151);
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
   SelectMsg(UID, 1, 114, 1236, 14203, 28, 323, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 323 then
   ShowMap(UID, 18);
   SaveEvent(UID, 153);
end


--  속성 0번 4번일 경우

if EVENT == 324 then
   SelectMsg(UID, 2, 114, 365, 14203, 10, 325, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 325 then
   SelectMsg(UID, 4, 114, 366, 14203, 22, 326, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 326 then
   SaveEvent(UID, 154);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 327 then
   SaveEvent(UID, 156);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 114, 367, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 114, 368, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 114, 369, 14203, 18, 330, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 49 then -- 재료 없을때
        SelectMsg(UID, 2, 114, 370, 14203, 18, 331, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 9 then -- 재료 없을때
        SelectMsg(UID, 2, 114, 371, 14203, 18, 332, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT4 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 114, 371, 14203, 18, 180, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
      if ITEM_COUNT1  > 49 and ITEM_COUNT2  > 49 and ITEM_COUNT3  > 9 and ITEM_COUNT4 > 0 then-- 재료 있을때
            SelectMsg(UID, 2, 114, 372, 14203, 41, 333, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
   ShowMap(UID, 18);
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
   SelectMsg(UID, 1, 115, 1237, 14203, 28, 335, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 335 then
   ShowMap(UID, 18);
   SaveEvent(UID, 159);
end


--  속성 0번 4번일 경우

if EVENT == 336 then
   SelectMsg(UID, 2, 115, 375, 14203, 10, 337, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 337 then
   SelectMsg(UID, 4, 115, 376, 14203, 22, 338, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 338 then
   SaveEvent(UID, 160);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 339 then
   SaveEvent(UID, 162);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 115, 377, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 115, 378, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 115, 379, 14203, 18, 342, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 115, 380, 14203, 18, 343, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 4999999 then -- 재료 없을때
        SelectMsg(UID, 2, 115, 381, 14203, 18, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 0 and ITEM_COUNT3  > 4999999  then-- 재료 있을때
            SelectMsg(UID, 2, 115, 383, 14203, 41, 346, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 342 then
   ShowMap(UID, 23);
end

if EVENT == 343 then
   ShowMap(UID, 24);
end

if EVENT == 344 then
   ShowMap(UID, 18);
end



local Check;

if EVENT == 346 then
  Check = CheckExchange(UID, 38)
   if  Check ==1 then
   RunExchange(UID, 38);  
   SaveEvent(UID, 163);
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
   SelectMsg(UID, 1, 116, 1238, 14203, 28, 348, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 348 then
   ShowMap(UID, 18);
   SaveEvent(UID, 165);
end


--  속성 0번 4번일 경우

if EVENT == 349 then
   SelectMsg(UID, 2, 116, 386, 14203, 10, 350, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 350 then
   SelectMsg(UID, 4, 116, 387, 14203, 22, 351, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 351 then
   SaveEvent(UID, 166);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 352 then
   SaveEvent(UID, 168);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 116, 388, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 116, 389, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 116, 390, 14203, 18, 355, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 49 then -- 재료 없을때
        SelectMsg(UID, 2, 116, 391, 14203, 18, 356, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 116, 392, 14203, 18, 357, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
    if  ITEM_COUNT1 > 19 and ITEM_COUNT2 > 49  and ITEM_COUNT3 > 0 then -- 재료 없을때
        SelectMsg(UID, 2, 116, 393, 14203, 41, 358, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
   SaveEvent(UID, 169);
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
   SelectMsg(UID, 1, 117, 1239, 14203, 28, 360, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 360 then
   ShowMap(UID, 18);
   SaveEvent(UID, 171);
end


--  속성 0번 4번일 경우

if EVENT == 361 then
   SelectMsg(UID, 2, 117, 501, 14203, 10, 362, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 362 then
   SelectMsg(UID, 4, 117, 502, 14203, 22, 363, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 363 then
   SaveEvent(UID, 172);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 364 then
   SaveEvent(UID, 174);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 117, 503, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 117, 504, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 117, 505, 14203, 18, 367, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 29 then -- 재료 없을때
        SelectMsg(UID, 2, 117, 506, 14203, 18, 368, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 0 then -- 재료 없을때
        SelectMsg(UID, 2, 117, 507, 14203, 18, 369, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
 if  ITEM_COUNT1 > 29 and ITEM_COUNT2 > 29 and ITEM_COUNT3 > 0 then 
           SelectMsg(UID, 2, 117, 508, 14203, 41, 370, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
   SaveEvent(UID, 175);
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
   SelectMsg(UID, 1, 118, 510, 14203, 28, 372, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 372 then
   ShowMap(UID, 18);
   SaveEvent(UID, 177);
end


--  속성 0번 4번일 경우

if EVENT == 373 then
   SelectMsg(UID, 2, 118, 511, 14203, 10, 374, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 374 then
   SelectMsg(UID, 4, 118, 512, 14203, 22, 375, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 375 then
   SaveEvent(UID, 178);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 376 then
   SaveEvent(UID, 180);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 118, 513, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 118, 514, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
         SelectMsg(UID, 2, 118, 515, 14203, 18, 379, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 9 then -- 2재료 없을때
        SelectMsg(UID, 2, 118, 516, 14203, 18, 379, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <= 9 then -- 3재료 없을때
        SelectMsg(UID, 2, 118, 517, 14203, 18, 379, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  end
   if ITEM_COUNT1  > 9 and ITEM_COUNT2  > 9 and ITEM_COUNT3  > 9 then-- 재료 있을때
        SelectMsg(UID, 2, 118, 518, 14203, 41, 382, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
   SaveEvent(UID, 181);
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
   SelectMsg(UID, 1, 119, 1241, 14203, 28, 384, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 384 then
   ShowMap(UID, 18);
   SaveEvent(UID, 183);
end


--  속성 0번 4번일 경우

if EVENT == 385 then
   SelectMsg(UID, 2, 119, 521, 14203, 10, 386, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 386 then
   SelectMsg(UID, 4, 119, 522, 14203, 22, 387, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 387 then
   SaveEvent(UID, 184);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 388 then
   SaveEvent(UID, 186);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 119, 523, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 119, 524, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 119, 525, 14203, 18, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <= 2 then -- 재료 없을때
        SelectMsg(UID, 2, 119, 526, 14203, 18, 392, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 > 4999999 and ITEM_COUNT2 > 2 then
            SelectMsg(UID, 2, 119, 528, 14203, 41, 394, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 392 then
   ShowMap(UID, 18);
end

local Check;

if EVENT == 394 then
  Check = CheckExchange(UID, 42)
   if  Check ==1 then
   RunExchange(UID, 42);  
   SaveEvent(UID, 185);
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
   SelectMsg(UID, 1, 120, 1242, 14203, 28, 501, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 501 then
   ShowMap(UID, 18);
   SaveEvent(UID, 189);
end


--  속성 0번 4번일 경우

if EVENT == 502 then
   SelectMsg(UID, 2, 120, 531, 14203, 10, 503, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 503 then
   SelectMsg(UID, 4, 120, 532, 14203, 22, 504, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 504 then
   SaveEvent(UID, 190);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 505 then
   SaveEvent(UID, 192);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 120, 533, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 120, 534, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 120, 535, 14203, 18, 508, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 120, 536, 14203, 18, 508, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 120, 537, 14203, 18, 508, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 >0  and ITEM_COUNT2 >0 and ITEM_COUNT3 >0 then -- 
        SelectMsg(UID, 2, 120, 538, 14203, 41, 511, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
   SaveEvent(UID, 191);
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
   SelectMsg(UID, 1, 121, 1243, 14203, 28, 513, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 513 then
   ShowMap(UID, 18);
   SaveEvent(UID, 195);
end


--  속성 0번 4번일 경우

if EVENT == 514 then
   SelectMsg(UID, 2, 121, 541, 14203, 10, 515, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 515 then
   SelectMsg(UID, 4, 121, 542, 14203, 22, 516, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 516 then
   SaveEvent(UID, 196);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 517 then
   SaveEvent(UID, 198);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 121, 543, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 121, 544, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 121, 545, 14203, 18, 521, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 121, 546, 14203, 18, 522, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT3 <=0  then -- 재료 없을때
        SelectMsg(UID, 2, 121, 547, 14203, 18, 522, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   if  ITEM_COUNT1 >0 and ITEM_COUNT2 >0 and ITEM_COUNT3 >0 then -- 재료가 없을때
            SelectMsg(UID, 2, 121, 548, 14203, 41, 523, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
end

if EVENT == 521 then
   ShowMap(UID, 18);
end

if EVENT == 522 then
   ShowMap(UID, 8);
end


local Check;

if EVENT == 523 then
  Check = CheckExchange(UID, 44)
   if  Check ==1 then
   RunExchange(UID, 44);  
   SaveEvent(UID, 197);
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
   SelectMsg(UID, 1, 122, 550, 14203, 28, 525, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 525 then
   ShowMap(UID, 18);
   SaveEvent(UID, 201);
end


--  속성 0번 4번일 경우    

if EVENT == 526 then
   SelectMsg(UID, 2, 122, 551, 14203, 10, 527, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 527 then
   SelectMsg(UID, 4, 122, 552, 14203, 22, 528, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 528 then
   SaveEvent(UID, 202);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 529 then
   SaveEvent(UID, 204);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 122, 553, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 122, 554, 14203, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 2, 122, 555, 14203, 18, 532, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT2 <=4999999  then -- 재료 없을때
        SelectMsg(UID, 2, 122, 556, 14203, 18, 532, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
   if  ITEM_COUNT1 >0 and ITEM_COUNT2 >4999999  then 
            SelectMsg(UID, 2, 122, 557, 14203, 41, 533, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 532 then
   ShowMap(UID, 18);
end

local Check;

if EVENT == 533 then
  Check = CheckExchange(UID, 45)
   if  Check ==1 then
   RunExchange(UID, 45);  
   SaveEvent(UID, 203);
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

local NPC = 14203;
local savenum = 408;

-- 시드미셀 등장

if EVENT == 550 then
   Class = CheckClass (UID);
   if  Class == 9  then -- 2차전직 가능한 경우
   SaveEvent(UID, 4111); --helper 번호 수정 
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
      SaveEvent(UID, 4113);
      SelectMsg(UID, 2, savenum, 4107, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   else --레벨이 60이하일때 
   SelectMsg(UID, 2, savenum, 4106, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 552 then
   SaveEvent(UID, 4112); --수락시
end

if EVENT == 534 then
   SaveEvent(UID, 4115); -- 거절시 
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 535 then
   SaveEvent(UID, 4114);
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
   SaveEvent(UID, 4113);
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
   SelectMsg(UID, 1, 53, 3235, 14203, 3006, 621, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 621 then
   ShowMap(UID, 18);
   SaveEvent(UID, 3442);
end

if EVENT == 622 then
   SelectMsg(UID, 1, 53, 3234, 14203, 3006, 621, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 70Lv skill no.53 type 0 or 4

if EVENT == 623 then
   Class = CheckClass (UID);
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2차 전직 자인가 체크 
   SelectMsg(UID, 2, 53, 3236, 14203, 10, 624, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else --2차 전직을 안했을때 
   SelectMsg(UID, 2, 53, 4712, 14203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 624 then
   SelectMsg(UID, 4, 53, 3237, 14203, 22, 625, 23, 631, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 625 then
   SaveEvent(UID, 3443);
   SelectMsg(UID, 2, 53, 3238, 14203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 631 then
   SelectMsg(UID, 2, 53, 3239, 14203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- collect all
local NATION = 0;--nation check

if EVENT == 626 then
   SaveEvent(UID, 3445);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 53, 3241, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 53, 3242, 14203, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
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
      SelectMsg(UID, 4, 53, 3243, 14203, 41, 630, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
      if ITEM_COUNT1 <= 0 then -- 1재료 없을때
        SelectMsg(UID, 2, 53, 3240, 14203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT2 <= 0 then -- 2재료 없을때
         SelectMsg(UID, 2, 53, 3240, 14203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 3재료 없을때
         SelectMsg(UID, 2, 53, 3240, 14203, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
   end
end

if EVENT == 629 then
   ShowMap(UID, 304);
end

local Check;

if EVENT == 630 then
            Exchange =RunExchange(UID, 331);
            if  Exchange ==0 then
            SaveEvent(UID, 3444);
            else
            Ret = 1;	
            end	 
end


if EVENT == 630 then
        Check = CheckExchange(UID, 331)
        if  Check == 1 then
            SaveEvent(UID, 3444);
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
local NPC = 14203;
--******************************************************--

--seed or misel call

if EVENT == 920 then
   SelectMsg(UID, 1, savenum, 5155, NPC, 3006, 921, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end
--시드

if EVENT == 921 then
   ShowMap(UID, 18);
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
   ITEM_COUNT1 = HowmuchItem(UID, 379242000);
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
   Check = CheckExchange(UID, 525)
   if  Check == 1 then
   Exchange =RunExchange(UID, 525);
        if  Exchange ==0 then
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
   ShowMap(UID, 18);
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
        if  Exchange ==0 then
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
   ShowMap(UID, 18);
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
        if  Exchange ==0 then
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