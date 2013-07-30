-- [고행자]베다

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24424;

-- [고행자]베다 클릭시 퀘스트 체크  

if EVENT == 190 then
	QuestNum = 2; --SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
			 SelectMsg(UID, 2, -1, 4513, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          NpcMsg(UID, 4514, NPC)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

--******************************************************--
-- 일곱 증표의 수호자 시작 
--******************************************************--

local savenum = 430;

-- 시드미셀 등장

if EVENT == 530 then
   NATION = CheckNation(UID);
      if NATION == 1 then --카루스 일때 
      SaveEvent(UID, 4266);
      SelectMsg(UID, 1, savenum, 4503, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      else -- 엘모일때
      SaveEvent(UID, 4271);
      SelectMsg(UID, 1, savenum, 4504, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
      end
end

-- 430 번의 속성 0번 4번일 경우

if EVENT == 532 then   
    SelectMsg(UID, 4, savenum, 4505, NPC, 22, 533, 23, 534, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 533 then
   SaveEvent(UID, 4267); --수락시
   GiveItem(UID, 910127000, 1);
end

if EVENT == 534 then
   SaveEvent(UID, 4270); -- 거절시 
end

-- 430 번의 속성 1번 3번일 경우

local ItemA
local ItemB

if EVENT == 536 then
ItemA = HowmuchItem(UID, 910134000); --7번째 증표
ItemB = HowmuchItem(UID, 910127000); -- 명령서
    if  ItemA == 0 then -- 재료가 없을때
       if ItemB == 0 then -- 명령서도  없을때
       GiveItem(UID, 910127000, 1);
       SelectMsg(UID, 2, savenum, 4507, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- B 재료 있을때 
       SelectMsg(UID, 2, savenum, 4508, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
    else --7번째 열쇠 있을때 
    SelectMsg(UID, 2, savenum, 4506, NPC, 4172, 537, 4173, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 537 then
    Check = CheckExchange(UID, 481)
        if  Check ==1 then
        SaveEvent(UID, 4268);
        RunExchange(UID, 481);
        else
        Ret = 1; 
        end  
end


--******************************************************--
-- 일곱 증표의 수호자 끝 
--******************************************************--

--******************************************************--
-- 몬스터로 부터의 위험 시작 
--******************************************************--

local savenum = 440;

-- 시드미셀 등장

if EVENT == 630 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4333);
    EVENT = 631
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4338);
    EVENT = 631
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4343);
    EVENT = 631
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4348);
     EVENT = 631
   end
end

if EVENT == 631 then
    SelectMsg(UID, 1, savenum, 4613, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


-- 440 번의 속성 0번 4번일 경우

local MonsterSub = 0;

if EVENT == 632 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 4, savenum, 4614, NPC, 22, 633, 23, 634, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, savenum, 4615, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end



if EVENT == 633 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4334);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4339);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4344);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4349);
   end
end


if EVENT == 634 then
   SaveEvent(UID, 4337); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 280 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 4336);
    EVENT = 281
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 4341);
    EVENT = 281
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 4346);
    EVENT = 281
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 4351);
     EVENT = 281
   end
end

if EVENT == 281 then
    SelectMsg(UID, 1, savenum, 4616, NPC, 14, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


-- 440의 1번 3번인 경우 

local MonsterCount01
local MonsterCount02
local MonsterCount03
local MonsterCount04


if EVENT == 636 then
   MonsterCount01  = CountMonsterQuestSub(UID, 1);
   MonsterCount02  = CountMonsterQuestSub(UID, 2);
   MonsterCount03  = CountMonsterQuestSub(UID, 3);
   MonsterCount04  = CountMonsterQuestSub(UID, 4);  
    if  MonsterCount01  > 0 and  MonsterCount02  > 0 and  MonsterCount03  > 0 and  MonsterCount04  > 0 then -- 사냥이 완료 되었을때 
      SelectMsg(UID, 5, savenum, 4621, NPC, 4161, 637, 4162, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 남았을때
       if MonsterCount01 <= 0 then -- A 사냥이 남았을때
       SelectMsg(UID, 2, savenum, 4617, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  MonsterCount02 <= 0 then -- B 사냥이 남았을때
       SelectMsg(UID, 2, savenum, 4618, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       elseif  MonsterCount03 <= 0 then -- C 사냥이 남았을때
       SelectMsg(UID, 2, savenum, 4619, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       else -- D 사냥이 남았을때
       SelectMsg(UID, 2, savenum, 4620, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
       end
   end
end

local Check;

if EVENT == 637 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 493)
        if  Check ==1 then        
        RunSelectExchange(UID, 493);
        SaveEvent(UID, 4335);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 494)
        if  Check ==1 then        
        RunSelectExchange(UID, 494);
        SaveEvent(UID, 4340);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 495)
        if  Check ==1 then        
        RunSelectExchange(UID, 495);
        SaveEvent(UID, 4345);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 496)
        if  Check ==1 then        
        RunSelectExchange(UID, 496);
        SaveEvent(UID, 4350);
        SaveEvent(UID, 4356);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end



--******************************************************--
-- 몬스터로 부터의 위험 끝 
--******************************************************--

return Ret;
