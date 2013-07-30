
-- 기유스
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
local NPC=17007; --NPC 번호 


-- [관리인] 빌보르 클릭시 퀘스트 체크  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
			 SelectMsg(UID, 2, -1, 4709, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 4718, NPC)
      else--해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 101 then -- 그냥 닫기 
    Ret = 1;
end

-----------------------------------------------------------
-- 로그 포상 퀘스트
savenum = 510
-----------------------------------------------------------

--지능의인장 309번의 속성 0번 4번일 경우

if EVENT == 400 then
   ITEM_COUNTA = HowmuchItem(UID, 910092000);
    if ITEM_COUNTA <= 0 then -- A 재료 없을때
    SelectMsg(UID, 2, savenum, 4719, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else 
        Check = CheckExchange(UID, 550)
        if  Check ==1 then
        RunExchange(UID, 550);
        SaveEvent(UID, 4511);
        SelectMsg(UID, 2, savenum, 4720, NPC, 10, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else
        Ret = 1;	
        end	 
    end
end

-----------------------------------------------------------
-- 로그 포상 퀘스트 끝 
-----------------------------------------------------------

-----------------------------------------------------------
-- 리자드맨 퀘스트 시작
savenum = 511
-----------------------------------------------------------

if EVENT == 500 then
   ITEM_COUNTA = HowmuchItem(UID, 389158000);
   ITEM_COUNTB = HowmuchItem(UID, 900000000);   
    if ITEM_COUNTA <= 0 then -- A 재료 없을때
    SelectMsg(UID, 2, savenum, 4715, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else 
        if ITEM_COUNTB < 800000 then -- B 재료 없을때
        SelectMsg(UID, 2, savenum, 4716, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else 
            Check = CheckExchange(UID, 551)
            if  Check ==1 then
            RunExchange(UID, 551);
            SaveEvent(UID, 4514);
            SelectMsg(UID, 2, savenum, 4717, NPC, 10, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else
            Ret = 1;	
            end	 
        end
    end
end

if EVENT == 501 then
    SelectMsg(UID, 2, savenum, 4714, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-----------------------------------------------------------
-- 리자드맨 퀘스트 시작 끝 
-----------------------------------------------------------
