-- [경비병]멜버릭
-- 그냥 닫기 168

-- EVENT 는 100번 이상 부터 사용

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공?

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC =24427;


-- [경비병]멜버릭 클릭시 퀘스트 체크  

if EVENT == 100 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
			 SelectMsg(UID, 2, -1, 4701, NPC, 10, 168, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1;
		elseif QuestNum > 1 and QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 1313, NPC)
        else--해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end


if EVENT == 168 then -- 그냥 닫기 
    Ret = 1;
end


-------------------------------
------늑대인간 사냥 ----------
-------------------------------

if EVENT == 300 then
   SelectMsg(UID, 1, 235, 656, NPC, 28, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
   ShowMap(UID, 495);
   SaveEvent(UID, 531);
end

--  102번의 속성 0번 4번일 경우

if EVENT == 302 then
   SelectMsg(UID, 2, 235, 1334, NPC, 10, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 310 then
   SelectMsg(UID, 4, 235, 1335, NPC, 22, 303, 23,193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 303 then
   SaveEvent(UID, 532);
end


-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 305 then
   SaveEvent(UID, 534);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 235, 659, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 235, 660, NPC, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 307 then
    ITEM_COUNT = GetMaxExchange(UID, 85); --exchange 테이블 인덱스값   
   if  ITEM_COUNT <= 0 then -- 재료 없을때
      SelectMsg(UID, 2, 235, 1336, NPC, 18, 308, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT  > 0 then-- 재료 있을때
          SelectMsg(UID, 2, 235, 1337, NPC, 4006, 309, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 308 then
   ShowMap(UID, 520);
end


local Check;

if EVENT == 309 then
  Check = CheckExchange(UID, 85)
   if  Check ==1 then
   ITEM_COUNT = GetMaxExchange(UID, 85); --exchange 테이블 인덱스값    
 	RunCountExchange(UID, 85, ITEM_COUNT);	   
   SaveEvent(UID, 535);
   else
  Ret = 1;	
  end	 
end

-------------------------------
------늑대인간 사냥끝----------
-------------------------------


-------------------------------
------블랙 실크 뭉치 ----------
-------------------------------

if EVENT == 231 then
   SelectMsg(UID, 1, 225, 1230, NPC, 28, 232, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 232 then
   ShowMap(UID, 495);
   SaveEvent(UID, 504);
end

--  102번의 속성 0번 4번일 경우

if EVENT == 233 then
   SelectMsg(UID, 2, 225, 1324, NPC, 10, 234, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 234 then
   SelectMsg(UID, 4, 225, 1325, NPC, 22, 235, 23, 236, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 235 then
   SaveEvent(UID, 505);
end

if EVENT == 236 then
   SaveEvent(UID, 508);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 237 then
   SaveEvent(UID, 507);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 225, 580, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 225, 581, NPC, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 239 then
 ITEM_COUNT = HowmuchItem(UID, 379252000);  
   if  ITEM_COUNT < 50 then -- 재료 없을때
      SelectMsg(UID, 2, 225, 1326, NPC, 18, 240, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT  >= 50 then-- 재료 있을때
          SelectMsg(UID, 2, 225, 1327, NPC, 4006, 241, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 240 then
   ShowMap(UID, 33);
end


local Check;

if EVENT == 241 then
  Check = CheckExchange(UID, 51)
   if  Check ==1 then
   SaveEvent(UID, 506);
   SaveEvent(UID, 334);
   RunExchange(UID, 51)
   else
  Ret = 1;	
  end	 
end

-------------------------------
------블랙 실크 뭉치 끝--------
-------------------------------

-------------------------------
------황실 공사 - 핀서 독 -----
-------------------------------

--핀서독 수집
--. 시드

if EVENT == 195 then
   SelectMsg(UID, 1, 223, 561, NPC, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 495);
   SaveEvent(UID, 477);
end

--  102번의 속성 0번 4번일 경우

if EVENT == 200 then
   SelectMsg(UID, 2, 223, 1314, NPC, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 223, 1315, NPC, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 478);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 205 then
   SaveEvent(UID, 480);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 223, 564, NPC, 32, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 223, 565, NPC, 21, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 210 then
   ITEM_COUNT = GetMaxExchange(UID, 46); --exchange 테이블 인덱스값   
   if  ITEM_COUNT <= 0 then -- 재료 없을때
      SelectMsg(UID, 2, 223, 1316, NPC, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ITEM_COUNT  > 0 then-- 재료 있을때
          SelectMsg(UID, 2, 223, 1317, NPC, 4006, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
           
   end
end

if EVENT == 213 then
   ShowMap(UID, 62);
end

local Check;

if EVENT == 214 then
  Check = CheckExchange(UID, 46)
   if  Check ==1 then
   ITEM_COUNT = GetMaxExchange(UID, 46); --exchange 테이블 인덱스값    
 	RunCountExchange(UID, 46, ITEM_COUNT);	   
   SaveEvent(UID, 481);      
   else
  Ret = 1;	
  end	 
end
-------------------------------
------황실 공사 - 핀서 독 끝---
-------------------------------

-------------------------------
------중앙 켐프 수호 ----------
-------------------------------


--미쉘 시작
if EVENT == 215 then
   SelectMsg(UID, 1, 224, 569, NPC, 28, 216, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 216 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
   ShowMap(UID, 495);
   SaveEvent(UID, 483);
    elseif Class == 2 or Class == 7 or Class == 8 then
   ShowMap(UID, 495);
   SaveEvent(UID, 488);
    elseif Class == 3 or Class == 9 or Class == 10 then
   ShowMap(UID, 495);
   SaveEvent(UID, 493);
   elseif Class == 4 or Class == 11 or Class == 12 then
   ShowMap(UID, 495);
   SaveEvent(UID, 498);
   end
end


-- [대장장이] 해파   104번의 속성 0번 4번일 경우

if EVENT == 217 then
   SelectMsg(UID, 2, 224, 1319, NPC, 10, 218, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 218 then
   SelectMsg(UID, 4, 224, 1320, NPC, 22, 219, 23, 220, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 219 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 484);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 489);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 494);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 499);
   end
end

if EVENT == 220 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 487);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 492);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 497);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 502);
   end
end


-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 221 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       SaveEvent(UID, 486);
       EVENT = 222
       elseif Class == 2 or Class == 7 or Class == 8 then
       SaveEvent(UID, 491);
       EVENT = 222
       elseif Class == 3 or Class == 9 or Class == 10 then
       SaveEvent(UID, 496);
       EVENT = 222
      elseif Class == 4 or Class == 11 or Class == 12 then
       SaveEvent(UID, 501);
       EVENT = 222
      end
end

if EVENT == 222 then
   NATION = CheckNation(UID);
   if NATION == 1 then --카루스 일때 
   SelectMsg(UID, 1, 224, 572, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
   SelectMsg(UID, 1, 224, 573, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


--[대장장이] 해파   124번의 속성 1번 3번일 경우

   local ItemA = 0;
   local RUN_EXCHANGE ;

if EVENT == 224 then 
    ItemA = HowmuchItem(UID, 379253000);  
      if  ItemA < 20  then
       SelectMsg(UID, 2, 224, 1321, NPC, 10, 225, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else
       SelectMsg(UID, 5, 224, 1322, NPC, 4006, 226, 27, 220, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 225 then
   ShowMap(UID, 332);
end

if EVENT == 226 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       EVENT = 227
       elseif Class == 2 or Class == 7 or Class == 8 then
       EVENT = 228
       elseif Class == 3 or Class == 9 or Class == 10 then
       EVENT = 229
      elseif Class == 4 or Class == 11 or Class == 12 then
       EVENT = 230
      end
end


local Check;
if EVENT == 227 then
  Check = CheckExchange(UID, 47)
   if  Check ==1 then
   SaveEvent(UID, 485);
   SaveEvent(UID, 310);
   RunSelectExchange(UID, 47)
      GiveItem(UID, 900001000, 80000);
   else
  Ret = 1;	
  end	 
end

local Check1;

if EVENT == 228 then
  Check1 = CheckExchange(UID, 48)
   if  Check1 ==1 then
   SaveEvent(UID, 490);
   SaveEvent(UID, 310);
   RunSelectExchange(UID, 48)
      GiveItem(UID, 900001000, 80000);
   else
  Ret = 1;	
  end	 
end

local Check2;

if EVENT == 229 then
  Check2 = CheckExchange(UID, 49)
   if  Check2 ==1 then
   SaveEvent(UID, 495);
   SaveEvent(UID, 310);
   RunSelectExchange(UID, 49)
      GiveItem(UID, 900001000, 80000);
   else
  Ret = 1;	
  end	 
end


local Check3;

if EVENT == 230 then
  Check3 = CheckExchange(UID, 50)
   if  Check3 ==1 then
   SaveEvent(UID, 500);
   SaveEvent(UID, 310);
   RunSelectExchange(UID, 50)
      GiveItem(UID, 900001000, 80000);
   else
  Ret = 1;	
  end	 
end
-------------------------------
------중앙 켐프 수호 끝 -------
-------------------------------


-------------------------------
------스포일러 사냥 시작-------
-------------------------------

if EVENT == 8230 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7917);
    EVENT = 8231
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7922);
    EVENT = 8231
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7927);
    EVENT = 8231
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7932);
    EVENT = 8231
   end
end

if EVENT == 8231 then
    SelectMsg(UID, 1, 820, 8027, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8232 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 820, 8029, NPC, 10, 8235, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 820, 8150, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8235 then
    SelectMsg(UID, 4, 820, 8030, NPC, 22, 8233, 23, 8034, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8233 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7918);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7923);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7928);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7933);
   end
end

if EVENT == 8234 then
   SaveEvent(UID, 7921); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8240 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7920);
    EVENT = 8241
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7925);
    EVENT = 8241
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7930);
    EVENT = 8241
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7935);
    EVENT = 8241
   end
end

if EVENT == 8241 then
    SelectMsg(UID, 1, 820, 8028, NPC, 29, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8236 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 820, 8031, NPC, 10, 8237, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       SelectMsg(UID, 4, 820, 8032, NPC, 10, 8238, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8237 then
   ShowMap(UID, 522);
end

local Check;

if EVENT == 8238 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 824)
        if  Check ==1 then        
        RunExchange(UID, 824);
        SaveEvent(UID, 7919);
        SaveEvent(UID, 7940);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 825)
        if  Check ==1 then        
        RunExchange(UID, 825);
        SaveEvent(UID, 7924);
        SaveEvent(UID, 7940);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 826)
        if  Check ==1 then        
        RunExchange(UID, 826);
        SaveEvent(UID, 7929);
        SaveEvent(UID, 7940);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 827)
        if  Check ==1 then        
        RunExchange(UID, 827);
        SaveEvent(UID, 7934);
        SaveEvent(UID, 7940);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-------스포일러 사냥 끝--------
-------------------------------

----------------------------------
------전쟁 구호 물자 준비 - 2차---
----------------------------------


--시드 시작
if EVENT == 242 then
   SelectMsg(UID, 1, 226, 585, NPC, 28, 243, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 243 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
   ShowMap(UID, 495);
   SaveEvent(UID, 510);
    elseif Class == 2 or Class == 7 or Class == 8 then
   ShowMap(UID, 495);
   SaveEvent(UID, 515);
    elseif Class == 3 or Class == 9 or Class == 10 then
   ShowMap(UID, 495);
   SaveEvent(UID, 520);
   elseif Class == 4 or Class == 11 or Class == 12 then
   ShowMap(UID, 495);
   SaveEvent(UID, 525);
   end
end


-- [대장장이] 해파   104번의 속성 0번 4번일 경우

if EVENT == 244 then
   SelectMsg(UID, 2, 226, 1329, NPC, 10, 245, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 245 then
   SelectMsg(UID, 4, 226, 1330, NPC, 22, 246, 23, 247, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 246 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 511);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 516);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 521);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 526);
   end
end

if EVENT == 247 then
    Class = CheckClass (UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 514);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 519);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 524);
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 529);
   end
end


-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 248 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       SaveEvent(UID, 513);
       EVENT = 249
       elseif Class == 2 or Class == 7 or Class == 8 then
       SaveEvent(UID, 518);
       EVENT = 249
       elseif Class == 3 or Class == 9 or Class == 10 then
       SaveEvent(UID, 523);
       EVENT = 249
      elseif Class == 4 or Class == 11 or Class == 12 then
       SaveEvent(UID, 528);
       EVENT = 249
      end
end

if EVENT == 249 then
   NATION = CheckNation(UID);
   if NATION == 1 then --카루스 일때 
   SelectMsg(UID, 1, 226, 588, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
   SelectMsg(UID, 1, 226, 589, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


--[대장장이] 해파   124번의 속성 1번 3번일 경우

   local ItemA = 0;
   local RUN_EXCHANGE ;

if EVENT == 250 then 
    ItemA = HowmuchItem(UID, 379015000);  
      if  ItemA < 10  then
       SelectMsg(UID, 2, 226, 1331, NPC, 10, 256, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      elseif ItemA >= 10  then
       SelectMsg(UID, 2, 226, 1332, NPC, 4006, 251, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 256 then
   ShowMap(UID, 63);
end

if EVENT == 251 then
   Class = CheckClass (UID);
       if Class == 1 or Class == 5 or Class == 6 then
       EVENT = 252
       elseif Class == 2 or Class == 7 or Class == 8 then
       EVENT = 253
       elseif Class == 3 or Class == 9 or Class == 10 then
       EVENT = 254
      elseif Class == 4 or Class == 11 or Class == 12 then
       EVENT = 255
      end
end




local Check;
if EVENT == 252 then
  Check = CheckExchange(UID, 52)
   if  Check ==1 then
   SaveEvent(UID, 512);
   SaveEvent(UID, 340);
   RunExchange(UID, 52)
   else
  Ret = 1;	
  end	 
end

local Check1;

if EVENT == 253 then
  Check1 = CheckExchange(UID, 53)
   if  Check1 ==1 then
   SaveEvent(UID, 517);
   SaveEvent(UID, 340);
   RunExchange(UID, 53)
   else
  Ret = 1;	
  end	 
end

local Check2;

if EVENT == 254 then
  Check2 = CheckExchange(UID, 54)
   if  Check2 ==1 then
   SaveEvent(UID, 522);
   SaveEvent(UID, 340);
   RunExchange(UID, 54)
   else
  Ret = 1;	
  end	 
end


local Check3;

if EVENT == 255 then
  Check3 = CheckExchange(UID, 55)
   if  Check3 ==1 then
   SaveEvent(UID, 527);
   SaveEvent(UID, 340);
   RunExchange(UID, 55)
   else
  Ret = 1;	
  end	 
end
-------------------------------
------전쟁 구호 물자 준비 - 2차 끝 -------
-------------------------------

-------------------------------
------스콜피온 사냥 시작-------
-------------------------------

if EVENT == 8330 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7959);
    EVENT = 8331
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7964);
    EVENT = 8331
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7969);
    EVENT = 8331
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7974);
    EVENT = 8331
   end
end

if EVENT == 8331 then
    SelectMsg(UID, 1, 821, 8041, NPC, 4061, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8332 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 821, 8043, NPC, 10, 8335, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 821, 8150, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8335 then
    SelectMsg(UID, 4, 821, 8044, NPC, 22, 8333, 23, 8334, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8333 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7960);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7965);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7970);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7975);
   end
end

if EVENT == 8334 then
   SaveEvent(UID, 7963); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8340 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 7962);
    EVENT = 8341
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 7967);
    EVENT = 8341
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 7972);
    EVENT = 8341
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 7977);
    EVENT = 8341
   end
end

if EVENT == 8341 then
    SelectMsg(UID, 1, 821, 8042, NPC, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8336 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 821, 8045, NPC, 10, 8337, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       SelectMsg(UID, 4, 821, 8046, NPC, 10, 8338, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8337 then
   ShowMap(UID, 567);
end

local Check;

if EVENT == 8338 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 814)
        if  Check ==1 then        
        RunExchange(UID, 814);
        SaveEvent(UID, 7961);
        SaveEvent(UID, 7982);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 815)
        if  Check ==1 then        
        RunExchange(UID, 815);
        SaveEvent(UID, 7966);
        SaveEvent(UID, 7982);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 816)
        if  Check ==1 then        
        RunExchange(UID, 816);
        SaveEvent(UID, 7971);
        SaveEvent(UID, 7982);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 817)
        if  Check ==1 then        
        RunExchange(UID, 817);
        SaveEvent(UID, 7976);
        SaveEvent(UID, 7982);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-------스콜피온 사냥 끝--------
-------------------------------

-------------------------------
--------라이칸 사냥 시작-------
-------------------------------

if EVENT == 8430 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8013);
    EVENT = 8431
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8018);
    EVENT = 8431
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8023);
    EVENT = 8431
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8028);
    EVENT = 8431
   end
end

if EVENT == 8431 then
    SelectMsg(UID, 1, 819, 8055, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8432 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 819, 8057, NPC, 10, 8435, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 819, 8150, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8435 then
    SelectMsg(UID, 4, 819, 8058, NPC, 22, 8433, 23, 8434, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8433 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8014);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8019);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8024);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8029);
   end
end

if EVENT == 8434 then
   SaveEvent(UID, 8017); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8440 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8016);
    EVENT = 8441
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8021);
    EVENT = 8441
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8026);
    EVENT = 8441
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8031);
    EVENT = 8441
   end
end

if EVENT == 8441 then
    SelectMsg(UID, 1, 819, 8056, NPC, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8436 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 819, 8059, NPC, 10, 8437, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       SelectMsg(UID, 4, 819, 8060, NPC, 10, 8438, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8437 then
   ShowMap(UID, 520);
end

local Check;

if EVENT == 8438 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 820)
        if  Check ==1 then        
        RunExchange(UID, 820);
        SaveEvent(UID, 8015);
        SaveEvent(UID, 8036);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 821)
        if  Check ==1 then        
        RunExchange(UID, 821);
        SaveEvent(UID, 8020);
        SaveEvent(UID, 8036);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 822)
        if  Check ==1 then        
        RunExchange(UID, 822);
        SaveEvent(UID, 8025);
        SaveEvent(UID, 8036);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 823)
        if  Check ==1 then        
        RunExchange(UID, 823);
        SaveEvent(UID, 8030);
        SaveEvent(UID, 8036);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
--------라이칸 사냥 끝---------
-------------------------------

-------------------------------
-------루가루 사냥 시작--------
-------------------------------

if EVENT == 8530 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8055);
    EVENT = 8531
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8060);
    EVENT = 8531
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8065);
    EVENT = 8531
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8070);
    EVENT = 8531
   end
end

if EVENT == 8531 then
    SelectMsg(UID, 1, 815, 8066, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8532 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 815, 8067, NPC, 10, 8535, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 815, 8150, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8535 then
    SelectMsg(UID, 4, 815, 8068, NPC, 22, 8533, 23, 8534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8533 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8056);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8061);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8066);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8071);
   end
end

if EVENT == 8534 then
   SaveEvent(UID, 8059); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8540 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8058);
    EVENT = 8541
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8063);
    EVENT = 8541
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8068);
    EVENT = 8541
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8073);
    EVENT = 8541
   end
end

if EVENT == 8541 then
    SelectMsg(UID, 1, 815, 8056, NPC, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8536 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 815, 8069, NPC, 10, 8537, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       SelectMsg(UID, 4, 815, 8070, NPC, 10, 8538, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8537 then
   ShowMap(UID, 69);
end

local Check;

if EVENT == 8538 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 832)
        if  Check ==1 then        
        RunExchange(UID, 832);
        SaveEvent(UID, 8057);
        SaveEvent(UID, 8078);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 833)
        if  Check ==1 then        
        RunExchange(UID, 833);
        SaveEvent(UID, 8062);
        SaveEvent(UID, 8078);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 834)
        if  Check ==1 then        
        RunExchange(UID, 834);
        SaveEvent(UID, 8067);
        SaveEvent(UID, 8078);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 835)
        if  Check ==1 then        
        RunExchange(UID, 835);
        SaveEvent(UID, 8072);
        SaveEvent(UID, 8078);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
--------루가루 사냥 끝---------
-------------------------------

-------------------------------
-----다크 아이즈 사냥 시작-----
-------------------------------

if EVENT == 8130 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8103);
    EVENT = 8131
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8108);
    EVENT = 8131
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8113);
    EVENT = 8131
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8118);
     EVENT = 8131
   end
end

if EVENT == 8131 then
    SelectMsg(UID, 1, 825, 8076, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8132 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 825, 8077, NPC, 10, 8135, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 825, 8150, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8135 then
    SelectMsg(UID, 4, 825, 8078, NPC, 22, 8133, 23, 8134, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8133 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8104);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8109);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8114);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8119);
   end
end

if EVENT == 8134 then
   SaveEvent(UID, 8107); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8140 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8106);
    EVENT = 8141
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8111);
    EVENT = 8141
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8116);
    EVENT = 8141
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8121);
    EVENT = 8141
   end
end

if EVENT == 8141 then
    SelectMsg(UID, 1, 825, 8056, NPC, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8136 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 825, 8079, NPC, 10, 8137, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
        SelectMsg(UID, 4, 825, 8080, NPC, 10, 8138, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8137 then
   ShowMap(UID, 569);
end

local Check;

if EVENT == 8138 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 828)
        if  Check ==1 then        
        RunExchange(UID, 828);
        SaveEvent(UID, 8105);
        SaveEvent(UID, 8126);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 829)
        if  Check ==1 then        
        RunExchange(UID, 829);
        SaveEvent(UID, 8110);
        SaveEvent(UID, 8126);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 830)
        if  Check ==1 then        
        RunExchange(UID, 830);
        SaveEvent(UID, 8115);
        SaveEvent(UID, 8126);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 831)
        if  Check ==1 then        
        RunExchange(UID, 831);
        SaveEvent(UID, 8120);
        SaveEvent(UID, 8126);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
------다크 아이즈 사냥 끝------
-------------------------------

-------------------------------
----------케일란 사냥----------
-------------------------------

if EVENT == 8630 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8145);
    EVENT = 8631
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8150);
    EVENT = 8631
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8155);
    EVENT = 8631
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8160);
    EVENT = 8631
   end
end

if EVENT == 8631 then
    SelectMsg(UID, 1, 822, 8086, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8632 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 822, 8087, NPC, 10, 8635, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 822, 8150, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8635 then
    SelectMsg(UID, 4, 822, 8088, NPC, 22, 8633, 23, 8634, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8633 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8146);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8151);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8156);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8161);
   end
end

if EVENT == 8634 then
   SaveEvent(UID, 8149); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8640 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8148);
    EVENT = 8641
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8153);
    EVENT = 8641
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8158);
    EVENT = 8641
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8163);
    EVENT = 8641
   end
end

if EVENT == 8641 then
    SelectMsg(UID, 1, 822, 8056, NPC, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8636 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 822, 8069, NPC, 10, 8637, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       Class = CheckClass(UID);
        if Class == 1 or Class == 5 or Class == 6 or Class == 3 or Class == 9 or Class == 10 or Class == 4 or Class == 11 or Class == 12 then
        SelectMsg(UID, 4, 822, 8089, NPC, 10, 8638, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        elseif Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, 822, 8145, NPC, 10, 8638, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    end
end

if EVENT == 8637 then
   ShowMap(UID, 528);
end

local Check;

if EVENT == 8638 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 840)
        if  Check ==1 then        
        RunExchange(UID, 840);
        SaveEvent(UID, 8147);
        SaveEvent(UID, 8168);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 841)
        if  Check ==1 then        
        RunSelectExchange(UID, 841);
        SaveEvent(UID, 8152);
        SaveEvent(UID, 8168);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 842)
        if  Check ==1 then        
        RunExchange(UID, 842);
        SaveEvent(UID, 8157);
        SaveEvent(UID, 8168);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 843)
        if  Check ==1 then        
        RunExchange(UID, 843);
        SaveEvent(UID, 8162);
        SaveEvent(UID, 8168);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
---------케일란 사냥 끝--------
-------------------------------

----death knight
if EVENT == 8020 then
	SelectMsg(UID, 1, 838, 8365, NPC, 3003, 8021, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8021 then
	SaveEvent(UID, 8652);
end

local MonsterSub = 0;

if EVENT == 8022 then
	MonsterSub = ExistMonsterQuestSub(UID);
	if MonsterSub == 0 then
		SelectMsg(UID, 2, 838, 8158, NPC, 10, 8030, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 2, 838, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8030 then
	SelectMsg(UID, 4, 838, 8236, NPC, 22, 8023, 23, 1004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8023 then
	SaveEvent(UID, 8653);
end

if EVENT == 8024 then
	SaveEvent(UID, 8656);
end

if EVENT == 8025 then
	SelectMsg(UID, 1, 838, 8416, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	SaveEvent(UID, 8655);
end

local MonsterCount = 0;

if EVENT == 8027 then
	MonsterCount  = CountMonsterQuestSub(UID,838, 1);
	if  MonsterCount < 20 then
		SelectMsg(UID, 2, 838, 8417, NPC, 10, 8028, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 4, 838, 8237, NPC, 10, 8029, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8028 then
	ShowMap(UID, 545);
end

if EVENT == 8029 then
	Check = CheckExchange(UID, 1037)
	if  Check ==1 then
		RunExchange(UID, 1037);
		SaveEvent(UID, 8654);
	else
		Ret = 1;
	end
end

--##########################
------ SHADOW SEEKER HUNT [REPEAT] ------
--------------------------
if EVENT == 1000 then
	SelectMsg(UID, 1, 1813, 8369, NPC, 3003, 1001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1001 then
	SaveEvent(UID, 2001);
end

local MonsterSub = 0;

if EVENT == 1002 then
	MonsterSub = ExistMonsterQuestSub(UID);
	if MonsterSub == 0 then
		SelectMsg(UID, 2, 1813, 8158, NPC, 10, 1010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 2, 1813, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 1010 then
	SelectMsg(UID, 4, 1813, 8236, NPC, 22, 1003, 23, 1004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1003 then
	SaveEvent(UID, 2002);
end

if EVENT == 1004 then
	SaveEvent(UID, 2005);
end

if EVENT == 1005 then
	SelectMsg(UID, 1, 1813, 8416, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	SaveEvent(UID, 2004);
end

local MonsterCount = 0;

if EVENT == 1006 then
	MonsterCount  = CountMonsterQuestSub(UID,1813, 1);
	if  MonsterCount < 20 then
		SelectMsg(UID, 2, 1813, 8417, NPC, 10, 1008, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 4, 1813, 8237, NPC, 10, 1009, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 1008 then
	ShowMap(UID, 545);
end

if EVENT == 1009 then
	Check = CheckExchange(UID, 1189)
	if  Check ==1 then
		RunExchange(UID, 1189);
		SaveEvent(UID, 2003);
	else
		Ret = 1;
	end
end
--------------------------
------ SHADOW SEEKER HUNT [REPEAT] ------
--##########################



return Ret;
