
-- [대상인의 딸]

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local savenum = 100;
local NPC=16079;

-- [대상인의 딸] 메니시아클릭시 퀘스트 체크  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, 16079);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 191, 16079, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 193,16079)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--local SHOW_MAP; -- 지도 보여주눈 함수 만들어 주세요

-----------------------------------------------------------
-- 실크뭉치 퀘스트 시작
-----------------------------------------------------------

local NATION = 0;

if EVENT == 105 then
    SaveEvent(UID, 6);
   NATION = CheckNation(UID);
   if NATION == 1 then --카루스 일때 
   SelectMsg(UID, 1, savenum, 105, NPC, 28, 107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
   SelectMsg(UID, 1, savenum, 111, NPC, 28, 107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

-- [대상인] 카이샨 100번의 속성 0번 4번일 경우

if EVENT == 110 then
   SelectMsg(UID, 2, savenum, 150, NPC, 29, 111, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 111 then
   SelectMsg(UID, 4, savenum, 156, NPC, 22, 112, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 112 then
   SaveEvent(UID, 7);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 120 then
    SaveEvent(UID, 9);
   NATION = CheckNation(UID);
   if NATION == 1 then --카루스 일때 
   SelectMsg(UID, 1, savenum, 131, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
   SelectMsg(UID, 1, savenum, 132, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


--[대상인] 카이샨 100번의 속성 1번 3번일 경우

   local ItemA = 0;
   local RUN_EXCHANGE ;

if EVENT == 280 then 
    ItemA = HowmuchItem(UID, 379048000);  
   if  ItemA < 3  then 
		SelectMsg(UID, 2, savenum, 157, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
		SelectMsg(UID, 4, savenum, 158, NPC, 4006, 281, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 281 then 
    Check = CheckExchange(UID, 1)
    if  Check ==1 then
        SaveEvent(UID, 8);
        RunExchange(UID, 1);
    else
        Ret = 1; 
    end  
end

-----------------------------------------------------------
-- 실크뭉치 퀘스트 끝 
-----------------------------------------------------------



if EVENT == 195 then
   SelectMsg(UID, 1, 102, 195, 16079, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 5);
   SaveEvent(UID, 56);
end

if EVENT == 197 then
   SelectMsg(UID, 1, 102, 197, 16079, 29, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 대상인의 딸 102번의 속성 0번 4번일 경우

if EVENT == 200 then
   SelectMsg(UID, 2, 102, 200, 16079, 29, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 102, 201, 16079, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 57);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 205 then
   SaveEvent(UID, 59);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 102, 206, 16079, 32, 189, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 102, 207, 16079, 4080, 189, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 189 then
   ShowMap(UID, 5);
end


local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 210 then
   ITEM_COUNT = HowmuchItem(UID, 379078000);
   if  ITEM_COUNT <= 2 then -- 재료 없을때
      SelectMsg(UID, 2, 102, 211, 16079, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 2 then-- 재료 있을때
      SelectMsg(UID, 2, 102, 212, 16079, 4006, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);      
 
   end
end

if EVENT == 213 then
   ShowMap(UID, 7);
end



local Check;

if EVENT == 214 then
  Check = CheckExchange(UID, 6)
   if  Check ==1 then
   RunExchange(UID, 6);  
   SaveEvent(UID, 58);
   else
  Ret = 1;	
  end	 
end

-------------------------------------------
--- 우황청심환 만들기 ---------------------
-------------------------------------------


if EVENT == 300 then
   SelectMsg(UID, 1, 105, 292, 16079, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
   ShowMap(UID, 5);
   SaveEvent(UID, 93);
end

if EVENT == 302 then
   SelectMsg(UID, 1, 105, 293, 16079, 29, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 대상인의 딸 105번의 속성 0번 4번일 경우

if EVENT == 303 then
   SelectMsg(UID, 2, 105, 294, 16079, 29, 304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 304 then
   SelectMsg(UID, 4, 105, 295, 16079, 22, 305, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 305 then
   SaveEvent(UID, 94);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 306 then
   SaveEvent(UID, 96);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 105, 299, 16079, 32, 307, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 105, 300, 16079, 4080, 307, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


if EVENT == 307 then
   ShowMap(UID, 5);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 308 then
   ITEM_COUNT = HowmuchItem(UID, 379251000);--우황청심환 만들어주세요~
   if  ITEM_COUNT <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 105, 298, 16079, 18, 309, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 4 then-- 재료 있을때
           SelectMsg(UID, 2, 105, 301, 16079, 4006, 310, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      
   end
end

if EVENT == 309 then
   ShowMap(UID, 55);
end
--퀘스트를 끝낼경우..2번...


local Check;

if EVENT == 310 then
  Check = CheckExchange(UID, 28)
   if  Check ==1 then
   RunExchange(UID, 28);  
   SaveEvent(UID, 95);
   else
  Ret = 1;	
  end	 
end

-------------------------------------------
--- 우황청심환 만들기 끝-------------------
-------------------------------------------
-------------------------------------------
--- 가볼트 날개 수집   --------------------
-------------------------------------------


if EVENT == 311 then
   SelectMsg(UID, 1, 106, 302, 16079, 28, 312, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 312 then
   ShowMap(UID, 5);
   SaveEvent(UID, 100);
end

if EVENT == 313 then
   SelectMsg(UID, 1, 106, 303, 16079, 29, 312, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 대상인의 딸 105번의 속성 0번 4번일 경우

if EVENT == 314 then
   SelectMsg(UID, 2, 106, 304, 16079, 29, 315, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 315 then
   SelectMsg(UID, 4, 106, 305, 16079, 22, 316, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 316 then
   SaveEvent(UID, 101);
end


-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 317 then
   SaveEvent(UID, 103);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 106,311, 16079, 32, 318, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 106, 312, 16079, 4080, 318, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 318 then
   ShowMap(UID, 5);
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;
--1번과 3번의 재료 채크...
if EVENT == 319 then
   ITEM_COUNT = HowmuchItem(UID, 379010000);--이동 속도 강화 물약 주세요.
   if  ITEM_COUNT <= 4 then -- 재료 없을때
      SelectMsg(UID, 2, 106, 310, 16079, 18, 320, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif ITEM_COUNT  > 4 then-- 재료 있을때
       SelectMsg(UID, 2, 106, 314, 16079, 4006, 321, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        
 end
end

if EVENT == 320 then
   ShowMap(UID, 12);
end
--퀘스트를 끝낼경우..2번...

local Check;

if EVENT == 321 then
  Check = CheckExchange(UID, 29)
   if  Check ==1 then
   RunExchange(UID, 29);  
   SaveEvent(UID, 102);
   else
  Ret = 1;	
  end	 
end
-------------------------------------------
--- 가볼트 날개 수집 끝--------------------
-------------------------------------------

-------------------------------------------
--- 마법의 가방 재료 수집------------------
-------------------------------------------


if EVENT == 322 then
   SelectMsg(UID, 1, 107, 316, 16079, 28, 323, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 323 then
   ShowMap(UID, 5);
   SaveEvent(UID, 107);
end

if EVENT == 324 then
   SelectMsg(UID, 1, 107, 317, 16079, 29, 323, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 대상인의 딸 105번의 속성 0번 경우

if EVENT == 325 then
   SelectMsg(UID, 2, 107, 318, 16079, 29, 326, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 326 then
   SelectMsg(UID, 4, 107, 319, 16079, 22, 327, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 327 then
   SaveEvent(UID, 108);
end


-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 328 then
   SaveEvent(UID, 110);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 107, 320, 16079, 32, 329, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 107, 321, 16079, 4080, 329, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 329 then
   ShowMap(UID, 5);
end

-- 대상인의 딸 105번의 속성 1번 3번 4번인  경우

local ITEM_COUNT;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 


if EVENT == 330 then
      SelectMsg(UID, 4, 107, 287, 16079, 4006, 331, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 331 then
ITEM_COUNT = GetMaxExchange(UID, 30); --exchange 테이블 인덱스값       
   if  ITEM_COUNT == 0 then -- 재료 없을때
    SelectMsg(UID, 2, 107, 322, 16079, 18, 333, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else  -- 재료 있을 때
    Check = CheckExchange(UID, 30)
        if  Check ==1 then
        ITEM_COUNT = GetMaxExchange(UID, 30); --exchange 테이블 인덱스값    
        RunCountExchange(UID, 30, ITEM_COUNT);	   
        SaveEvent(UID, 111);
        else
        Ret = 1;	
        end
    end 
end


if EVENT == 333 then
   ShowMap(UID, 1);
end


local Check;

--퀘스트를 끝낼경우..2번...
--반복 퀘스트이므로 저장하지 않음
-------------------------------------------
--- 마법의 가방 재료 수집 끝---------------
-------------------------------------------


return Ret;