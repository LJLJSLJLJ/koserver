-- [용병]러셀

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24430;


if EVENT == 150 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 8199, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 8201, NPC)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 153 then
    Ret = 1;
end



-- [용병]러셀 클릭시 퀘스트 체크  

-------------------------------
-----------콩가 사냥-----------
-------------------------------

if EVENT == 8270 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8847);
    EVENT = 8271
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8852);
    EVENT = 8271
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8857);
    EVENT = 8271
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8862);
     EVENT = 8271
   end
end

if EVENT == 8271 then
    SelectMsg(UID, 1, 861, 8397, NPC, 3013, 8279, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8279 then
    ShowMap(UID, 560);
end

local MonsterSub = 0;

if EVENT == 8272 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 861, 8398, NPC, 10, 8275, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 861, 8399, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8275 then
    SelectMsg(UID, 4, 861, 8400, NPC, 22, 8273, 23, 8274, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8273 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8848);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8853);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8858);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8863);
   end
end

if EVENT == 8274 then
   SaveEvent(UID, 8851); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8280 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8850);
    EVENT = 8281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8855);
    EVENT = 8281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8860);
    EVENT = 8281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8865);
    EVENT = 8281
   end
end

if EVENT == 8281 then
    SelectMsg(UID, 1, 861, 8401, NPC, 3002, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8276 then
    MonsterCount  = CountMonsterQuestSub(UID,861, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 861, 8402, NPC, 10, 8277, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 861, 8403, NPC, 10, 8278, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8277 then
   ShowMap(UID, 512);
end

local Check;

if EVENT == 8278 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 989)
        if  Check ==1 then        
        RunExchange(UID, 989);
        SaveEvent(UID, 8849);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 990)
        if  Check ==1 then        
        RunExchange(UID, 990);
        SaveEvent(UID, 8854);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 991)
        if  Check ==1 then        
        RunExchange(UID, 991);
        SaveEvent(UID, 8859);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 992)
        if  Check ==1 then        
        RunExchange(UID, 992);
        SaveEvent(UID, 8864);
        SaveEvent(UID, 8870);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
----------콩가 사냥 끝---------
-------------------------------

-------------------------------
---------에이프 사냥-----------
-------------------------------

if EVENT == 8600 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8889);
    EVENT = 8601
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8894);
    EVENT = 8601
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8899);
    EVENT = 8601
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8904);
     EVENT = 8601
   end
end

if EVENT == 8601 then
   SelectMsg(UID, 1, 862, 8175, NPC, 3002, 8602, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8602 then
   SelectMsg(UID, 1, 862, 8176, NPC, 4241, 8603, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8603 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 1, 862, 8177, NPC, 10, 8604, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 1, 862, 8178, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8604 then
    SelectMsg(UID, 1, 862, 8179, NPC, 22, 8605, 23, 8606, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8605 then --수락시
   ShowMap(UID, 542);
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8890);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8895);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8900);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8905);
   end
end

if EVENT == 8606 then
   SelectMsg(UID, 1, 862, 8492, NPC, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 8893); -- 거절시 
end

-- 836번 속성 0, 4번일 경우

if EVENT == 8610 then
   SelectMsg(UID, 2, 862, 8201, NPC, 3002, 8611, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8611 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 4, 862, 8181, NPC, 3018, 8612, 3019, 8619, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 862, 8182, NPC, 4242, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end


if EVENT == 8612 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8890);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8895);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8900);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8905);
   end
end

if EVENT == 8619 then
   SaveEvent(UID, 8893); -- 거절시 
end

-- 재료를 다 모았을때 시드와 미셀의 등장 

if EVENT == 8613 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8892);
    EVENT = 8614
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8897);
    EVENT = 8614
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8902);
    EVENT = 8614
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8907);
    EVENT = 8614
   end
end

if EVENT == 8614 then
    SelectMsg(UID, 1, 862, 8401, NPC, 4080, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-- 836이 1번 3번인 경우 

local MonsterCount = 0;

if EVENT == 8615 then
   MonsterCount  = CountMonsterQuestSub(UID,862, 1);
   if  MonsterCount < 30 then -- 사냥이 남았을때
    SelectMsg(UID, 2, 862, 8182, NPC, 10, 8617, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
    SelectMsg(UID, 4, 862, 8411, NPC, 10, 8618, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8617 then
   ShowMap(UID, 542);
end

local Check;

if EVENT == 8618 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 928)
        if  Check ==1 then        
        RunExchange(UID, 928);
        SaveEvent(UID, 8891);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 929)
        if  Check ==1 then        
        RunExchange(UID, 929);
        SaveEvent(UID, 8896);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 930)
        if  Check ==1 then        
        RunExchange(UID, 930);
        SaveEvent(UID, 8901);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 931)
        if  Check ==1 then        
        RunExchange(UID, 931);
        SaveEvent(UID, 8906);
        SaveEvent(UID, 8912);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
--------에이프 사냥 끝---------
-------------------------------

-------------------------------
------버닝 스켈레톤 사냥-------
-------------------------------

if EVENT == 8500 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8931);
    EVENT = 8501
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8936);
    EVENT = 8501
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8941);
    EVENT = 8501
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8946);
    EVENT = 8501
   end
end

if EVENT == 8501 then
    SelectMsg(UID, 1, 827, 8191, NPC, 56, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8502 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 827, 8192, NPC, 10, 8505, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 827, 8399, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8505 then
    SelectMsg(UID, 4, 827, 8193, NPC, 22, 8503, 23, 8504, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8503 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8932);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8937);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8942);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8947);
   end
end

if EVENT == 8504 then
   SaveEvent(UID, 8935); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8510 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8934);
    EVENT = 8511
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8939);
    EVENT = 8511
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8944);
    EVENT = 8511
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8949);
    EVENT = 8511
   end
end

if EVENT == 8511 then
    SelectMsg(UID, 1, 827, 8180, NPC, 3007, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8506 then
    MonsterCount  = CountMonsterQuestSub(UID,827, 1);
    if  MonsterCount < 30 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 827, 8402, NPC, 10, 8507, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       Class = CheckClass(UID);
        if Class == 1 or Class == 5 or Class == 6 or Class == 3 or Class == 9 or Class == 10 or Class == 4 or Class == 11 or Class == 12 then
        SelectMsg(UID, 4, 827, 8194, NPC, 10, 8508, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        elseif Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, 827, 8171, NPC, 10, 8508, 27, 8508, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    end
end

if EVENT == 8507 then
   ShowMap(UID, 510);
end

local Check;

if EVENT == 8508 then
    Class = CheckClass(UID);
	print(Class," : Class");
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 920)
        if  Check ==1 then        
        RunExchange(UID, 920);
        SaveEvent(UID, 8933);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 921)
        if  Check ==1 then        
        RunSelectExchange(UID, 921);
        SaveEvent(UID, 8938);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 922)
        if  Check ==1 then        
        RunExchange(UID, 922);
        SaveEvent(UID, 8943);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 923)
        if  Check ==1 then        
        RunExchange(UID, 923);
        SaveEvent(UID, 8948);
        SaveEvent(UID, 8954);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-----버닝 스켈레톤 사냥 끝-----
-------------------------------

-------------------------------
-------애쉬나이트 사냥---------
-------------------------------

if EVENT == 8070 then
   SelectMsg(UID, 1, 818, 8147, NPC, 14, 8351, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8071 then
   SaveEvent(UID, 8985);
end

local MonsterSub = 0;

if EVENT == 8072 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 818, 8155, NPC, 10, 8080, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 818, 8399, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8080 then
   SelectMsg(UID, 4, 818, 8173, NPC, 22, 8073, 23, 8074, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8073 then
   SaveEvent(UID, 8986);
end

if EVENT == 8074 then
   SaveEvent(UID, 8989);
end

-- 사냥 완료시 시드와 미셀의 등장

if EVENT == 8075 then
   SelectMsg(UID, 1, 818, 8213, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 8988);
end

local MonsterCount = 0;

if EVENT == 8077 then
   MonsterCount  = CountMonsterQuestSub(UID,818, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 818, 8402, NPC, 10, 8078, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 818, 8214, NPC, 10, 8079, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8078 then
   ShowMap(UID, 504);
end

if EVENT == 8079 then
   Check = CheckExchange(UID, 818)
   if  Check ==1 then
   RunExchange(UID, 818);
   SaveEvent(UID, 8987);
   SaveEvent(UID, 8993);
   else
  Ret = 1;	
  end	 
end

-------------------------------
------애쉬나이트 사냥 끝-------
-------------------------------

-------------------------------
----------하웅가 사냥----------
-------------------------------

if EVENT == 8150 then
   SelectMsg(UID, 1, 842, 8217, NPC, 3002, 8151, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8151 then
   SaveEvent(UID, 8997);
end

local MonsterSub = 0;

if EVENT == 8152 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 842, 8218, NPC, 10, 8160, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 842, 8399, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8160 then
   SelectMsg(UID, 4, 842, 8219, NPC, 22, 8153, 23, 8154, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8153 then
   SaveEvent(UID, 8998);
end

if EVENT == 8154 then
   SaveEvent(UID, 9001);
end

-- 사냥 완료시 시드와 미셀의 등장

if EVENT == 8155 then
   SelectMsg(UID, 1, 842, 8213, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9000);
end

local MonsterCount = 0;

if EVENT == 8157 then
   MonsterCount  = CountMonsterQuestSub(UID,842, 1);
   if  MonsterCount < 210 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 842, 8402, NPC, 10, 8158, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 842, 8220, NPC, 10, 8159, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8158 then
   ShowMap(UID, 516);
end

if EVENT == 8159 then
   Check = CheckExchange(UID, 948)
   if  Check ==1 then
   RunExchange(UID, 948);
   SaveEvent(UID, 8999);
   SaveEvent(UID, 9005);
   else
  Ret = 1;	
  end	 
end

-------------------------------
---------하웅가 사냥 끝--------
-------------------------------

-------------------------------
--------용아 병사 사냥---------
-------------------------------

if EVENT == 8550 then
   SelectMsg(UID, 1, 849, 8000, NPC, 14, 8551, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8551 then
   SaveEvent(UID, 9045);
end

local MonsterSub = 0;

if EVENT == 8552 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 849, 8001, NPC, 10, 8560, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 849, 8399, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8560 then
   SelectMsg(UID, 4, 849, 8002, NPC, 22, 8553, 23, 8554, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8553 then
   SaveEvent(UID, 9046);
end

if EVENT == 8554 then
   SaveEvent(UID, 9049);
end

-- 사냥 완료시 시드와 미셀의 등장

if EVENT == 8555 then
   SelectMsg(UID, 1, 849, 8003, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9048);
end

local MonsterCount = 0;

if EVENT == 8557 then
   MonsterCount  = CountMonsterQuestSub(UID,849, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 849, 8402, NPC, 10, 8558, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 849, 8004, NPC, 10, 8559, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8558 then
   ShowMap(UID, 585);
end

if EVENT == 8559 then
   Check = CheckExchange(UID, 1001)
   if  Check ==1 then
   RunExchange(UID, 1001);
   SaveEvent(UID, 9047);
   SaveEvent(UID, 9053);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------용아 병사 사냥 끝-------
-------------------------------

-------------------------------
--------용아 기사 사냥---------
-------------------------------

if EVENT == 9000 then
   SelectMsg(UID, 1, 868, 8000, NPC, 14, 9001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9001 then
   SaveEvent(UID, 9081);
end

local MonsterSub = 0;

if EVENT == 9002 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 868, 8013, NPC, 10, 9010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 868, 8399, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9010 then
   SelectMsg(UID, 4, 868, 8014, NPC, 22, 9003, 23, 9004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 9003 then
   SaveEvent(UID, 9082);
end

if EVENT == 9004 then
   SaveEvent(UID, 9085);
end

-- 사냥 완료시 시드와 미셀의 등장

if EVENT == 9005 then
   SelectMsg(UID, 1, 868, 8003, NPC, 3014, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9084);
end

local MonsterCount = 0;

if EVENT == 9007 then
   MonsterCount  = CountMonsterQuestSub(UID,868, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 868, 8402, NPC, 10, 9008, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 868, 8220, NPC, 10, 9009, 27, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9008 then
   ShowMap(UID, 519);
end

if EVENT == 9009 then
   Check = CheckExchange(UID, 942)
   if  Check ==1 then
   RunExchange(UID, 942);
   SaveEvent(UID, 9083);
   SaveEvent(UID, 9089);
   else
  Ret = 1;	
  end	 
end

-------------------------------
-------용아 기사 사냥 끝-------
-------------------------------
--EARRING OF LEGEND
if EVENT == 9472 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 915, 8765, NPC, 10, 9475, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 915, 8766, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9475 then
    SelectMsg(UID, 4, 915, 8764, NPC, 22, 8273, 23, 8274, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--PENDANT OF LEGEND
if EVENT == 9492 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 917, 8765, NPC, 10, 9475, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 917, 8766, NPC, 10, 153, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 9495 then
    SelectMsg(UID, 4, 917, 8764, NPC, 22, 8273, 23, 8274, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

return Ret;