
-- [무명 전사]

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공?

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;

-- [무명전사][엘모] 클릭시 퀘스트 체크  

if EVENT == 190 then
	QuestNum = SearchQuest(UID, 14414);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 3212, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 3000,14414)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--local SHOW_MAP; -- 지도 보여주눈 함수 만들어 주세요

if EVENT == 195 then
   SelectMsg(UID, 1, 305, 3001, 14414, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 196 then
   ShowMap(UID, 333);
   SaveEvent(UID, 3043);
end

if EVENT == 197 then
   SelectMsg(UID, 1, 305, 3002, 14414, 28, 196, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 무명전사 102번의 속성 0번 4번일 경우

if EVENT == 200 then
   SelectMsg(UID, 2, 305, 3003, 14414, 10, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
   SelectMsg(UID, 4, 305, 3004, 14414, 22, 202, 23, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 202 then
   SaveEvent(UID, 3044);
end

-- 재료를 다 모았을 때 
local NATION = 0;--국가 체크

if EVENT == 205 then
   SaveEvent(UID, 3046);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 305, 3005, 14414, 3009, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else -- 엘모일때
      SelectMsg(UID, 1, 305, 3006, 14414, 3009, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--재료 교체 함수 만들어 주세요 

if EVENT == 210 then
	ITEM_COUNT = GetMaxExchange(UID, 305); --exchange 테이블 인덱스값 
      if  ITEM_COUNT <= 0 then -- 재료 없을때
         SelectMsg(UID, 2, 305, 3007, 14414, 18, 213, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
         elseif ITEM_COUNT  > 0 then-- 재료 있을때
         SelectMsg(UID, 4, 305, 3008, 14414, 10, 214, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

if EVENT == 213 then
   ShowMap(UID, 22);
end

local Check;

if EVENT == 214 then
   Check = CheckExchange(UID, 305)
   if  Check ==1 then
   min_count = GetMaxExchange(UID, 305);
 	RunCountExchange(UID, 305, min_count);	
   SaveEvent(UID, 3047);
   else
  Ret = 1;	
  end	 
end

------------------------------------------------------
-- 언다잉 퇴치 시작 
------------------------------------------------------
--시드, 미셀 호출 
if EVENT == 9000 then
--  NATION = CheckNation(UID);
--  if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 328, 170, 14414, 24, 9001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9001 then
   ShowMap(UID, 333);
   SaveEvent(UID, 7002);
end

if EVENT == 9002 then
   SelectMsg(UID, 2, 328, 172, 14414, 24, 9001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 320번의 속성 0번 4번일 경우 


if EVENT == 300 then
   SelectMsg(UID, 2, 328, 3845, 14414,  3006, 301, 13, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 308 then
   SelectMsg(UID, 2, 328, 3846, 14414,  3000, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 301 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
      SelectMsg(UID, 4, 328, 3847, 14414, 22, 302, 23, 309, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);

	else-- 몬스터 서브 퀘스트가 있을때
 		SelectMsg(UID, 2, 328, 173, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 309 then
   SelectMsg(UID, 2, 328, 3849, 14414,  10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 302 then
   SaveEvent(UID, 7003);
end

-- 재료를 다 모았을때 시드와 미셀의 또 등장 
if EVENT == 303 then
   SaveEvent(UID, 7005);
   NATION = CheckNation(UID);
   if NATION == 1 then -- 카루스 일때
      SelectMsg(UID, 1, 328, 3851, 14414, 3003, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   elseif NATION == 2 then -- 엘모일때 
      SelectMsg(UID, 1, 328, 3852, 14414, 3003, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

-- 320의 1번 3번인 경우 

local MonsterCount = 0;

if EVENT == 305 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 10 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 328, 3850, 14414, 10, 306, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 328, 3853, 14414, 10, 307, 27, 306, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 306 then
   ShowMap(UID, 22);
end

local Check;

if EVENT == 307 then
   Check = CheckExchange(UID, 328)
   if  Check ==1 then
   RunExchange(UID, 328);
   SaveEvent(UID, 7004);
   else
  Ret = 1;	
  end	 
end

------------------------------------------------------
-- 언다잉 퇴치 끝 
------------------------------------------------------

-------------------------------
------- 라튼 아이즈 퇴치 ------
-------------------------------

if EVENT == 8400 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8490);
    EVENT = 8401
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8495);
    EVENT = 8401
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8500);
    EVENT = 8401
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8505);
     EVENT = 8401
   end
end

if EVENT == 8401 then
    SelectMsg(UID, 1, 830, 8322, 14414, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8402 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 830, 8323, 14414, 10, 8405, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 830, 8324, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8405 then
    SelectMsg(UID, 4, 830, 8325, 14414, 22, 8403, 23, 8404, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8403 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8491);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8496);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8501);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8506);
   end
end

if EVENT == 8404 then
   SaveEvent(UID, 8494); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8410 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8493);
    EVENT = 8411
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8498);
    EVENT = 8411
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8503);
    EVENT = 8411
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8508);
    EVENT = 8411
   end
end

if EVENT == 8411 then
    SelectMsg(UID, 1, 830, 8326, 14414, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8406 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 830, 8327, 14414, 10, 8407, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 830, 8328, 14414, 10, 8408, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8407 then
   ShowMap(UID, 576);
end

local Check;

if EVENT == 8408 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 904)
        if  Check ==1 then        
        RunExchange(UID, 904);
        SaveEvent(UID, 8492);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 905)
        if  Check ==1 then        
        RunExchange(UID, 905);
        SaveEvent(UID, 8497);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 906)
        if  Check ==1 then        
        RunExchange(UID, 906);
        SaveEvent(UID, 8502);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 907)
        if  Check ==1 then        
        RunExchange(UID, 907);
        SaveEvent(UID, 8507);
        SaveEvent(UID, 8471);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
---- 라튼 아이즈 퇴치 끝 ------
-------------------------------

-------------------------------
-------- 바탈리언 퇴치 --------
-------------------------------

if EVENT == 8850 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8742);
    EVENT = 8851
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8747);
    EVENT = 8851
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8752);
    EVENT = 8851
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8757);
     EVENT = 8851
   end
end

if EVENT == 8851 then
    SelectMsg(UID, 1, 854, 8329, 14414, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8852 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 854, 8330, 14414, 10, 8855, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 854, 8324, 14414, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8855 then
    SelectMsg(UID, 4, 854, 8331, 14414, 22, 8853, 23, 8854, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8853 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8743);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8748);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8753);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8758);
   end
end

if EVENT == 8854 then
   SaveEvent(UID, 8746); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8860 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8745);
    EVENT = 8861
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8750);
    EVENT = 8861
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8755);
    EVENT = 8861
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8760);
    EVENT = 8861
   end
end

if EVENT == 8861 then
    SelectMsg(UID, 1, 854, 8326, 14414, 56, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8856 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 854, 8327, 14414, 10, 8857, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 854, 8332, 14414, 10, 8858, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8857 then
   ShowMap(UID, 580);
end

local Check;

if EVENT == 8858 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 961)
        if  Check ==1 then        
        RunExchange(UID, 961);
        SaveEvent(UID, 8744);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 962)
        if  Check ==1 then        
        RunExchange(UID, 962);
        SaveEvent(UID, 8749);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 963)
        if  Check ==1 then        
        RunExchange(UID, 963);
        SaveEvent(UID, 8754);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 964)
        if  Check ==1 then        
        RunExchange(UID, 964);
        SaveEvent(UID, 8759);
        SaveEvent(UID, 8723);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
------- 바탈리언 퇴치 끝-------
-------------------------------

return Ret;