-- [황실근위병]

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 24406;


if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 1312, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 1313, NPC)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

-- [황실근위병] 클릭시 퀘스트 체크  

-------------------------------
------스켈레톤 사냥 시작-------
-------------------------------

if EVENT == 8730 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8187);
    EVENT = 8731
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8192);
    EVENT = 8731
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8197);
    EVENT = 8731
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8202);
     EVENT = 8731
   end
end

if EVENT == 8731 then
    SelectMsg(UID, 1, 823, 8096, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    ShowMap(UID, 47);
end

local MonsterSub = 0;

if EVENT == 8732 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 823, 8097, NPC, 10, 8735, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 823, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8735 then
    SelectMsg(UID, 4, 823, 8098, NPC, 22, 8733, 23, 8734, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8733 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8188);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8193);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8198);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8203);
   end
end

if EVENT == 8734 then
   SaveEvent(UID, 8191); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8740 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8190);
    EVENT = 8741
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8195);
    EVENT = 8741
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8200);
    EVENT = 8741
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8205);
    EVENT = 8741
   end
end

if EVENT == 8741 then
    SelectMsg(UID, 1, 823, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8736 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 823, 8099, NPC, 10, 8737, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 823, 8100, NPC, 10, 8738, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8737 then
   ShowMap(UID, 332);
end

local Check;

if EVENT == 8738 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 848)
        if  Check ==1 then        
        RunExchange(UID, 848);
        SaveEvent(UID, 8189);
        SaveEvent(UID, 8210);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 849)
        if  Check ==1 then        
        RunExchange(UID, 849);
        SaveEvent(UID, 8194);
        SaveEvent(UID, 8210);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 850)
        if  Check ==1 then        
        RunExchange(UID, 850);
        SaveEvent(UID, 8199);
        SaveEvent(UID, 8210);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 851)
        if  Check ==1 then        
        RunExchange(UID, 851);
        SaveEvent(UID, 8204);
        SaveEvent(UID, 8210);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
-------스켈레톤 사냥 끝--------
-------------------------------

-------------------------------
------페럴라이져 사냥 시작-----
-------------------------------

if EVENT == 8830 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8229);
    EVENT = 8831
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8234);
    EVENT = 8831
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8239);
    EVENT = 8831
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8244);
     EVENT = 8831
   end
end

if EVENT == 8831 then
    SelectMsg(UID, 1, 824, 8106, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8832 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 824, 8107, NPC, 10, 8835, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 824, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8835 then
    SelectMsg(UID, 4, 824, 8108, NPC, 22, 8833, 23, 8834, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8833 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8230);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8235);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8240);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8245);
   end
end

if EVENT == 8834 then
   SaveEvent(UID, 8233); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8840 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8232);
    EVENT = 8841
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8237);
    EVENT = 8841
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8242);
    EVENT = 8841
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8247);
    EVENT = 8841
   end
end

if EVENT == 8841 then
    SelectMsg(UID, 1, 824, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8836 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 824, 8099, NPC, 10, 8837, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 824, 8110, NPC, 10, 8838, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8837 then
   ShowMap(UID, 571);
end

local Check;

if EVENT == 8838 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 856)
        if  Check ==1 then        
        RunExchange(UID, 856);
        SaveEvent(UID, 8231);
        SaveEvent(UID, 8252);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 857)
        if  Check ==1 then        
        RunExchange(UID, 857);
        SaveEvent(UID, 8236);
        SaveEvent(UID, 8252);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 858)
        if  Check ==1 then        
        RunExchange(UID, 858);
        SaveEvent(UID, 8241);
        SaveEvent(UID, 8252);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 859)
        if  Check ==1 then        
        RunExchange(UID, 859);
        SaveEvent(UID, 8246);
        SaveEvent(UID, 8252);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-------페럴라이져 사냥 끝------
-------------------------------

-------------------------------
-----다이어 울프 사냥 시작-----
-------------------------------

if EVENT == 8930 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8271);
    EVENT = 8931
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8276);
    EVENT = 8931
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8281);
    EVENT = 8931
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8286);
     EVENT = 8931
   end
end

if EVENT == 8931 then
    SelectMsg(UID, 1, 826, 8115, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8932 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 826, 8116, NPC, 10, 8935, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 826, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8935 then
    SelectMsg(UID, 4, 826, 8117, NPC, 22, 8933, 23, 8934, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8933 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8272);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8277);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8282);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8287);
   end
end

if EVENT == 8934 then
   SaveEvent(UID, 8275); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8940 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8274);
    EVENT = 8941
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8279);
    EVENT = 8941
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8284);
    EVENT = 8941
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8589);
    EVENT = 8941
   end
end

if EVENT == 8941 then
    SelectMsg(UID, 1, 826, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8936 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 826, 8099, NPC, 10, 8937, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 826, 8118, NPC, 10, 8938, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8937 then
   ShowMap(UID, 524);
end

local Check;

if EVENT == 8938 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 864)
        if  Check ==1 then        
        RunExchange(UID, 864);
        SaveEvent(UID, 8273);
        SaveEvent(UID, 8294);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 865)
        if  Check ==1 then        
        RunExchange(UID, 865);
        SaveEvent(UID, 8278);
        SaveEvent(UID, 8294);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 866)
        if  Check ==1 then        
        RunExchange(UID, 866);
        SaveEvent(UID, 8283);
        SaveEvent(UID, 8294);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 867)
        if  Check ==1 then        
        RunExchange(UID, 867);
        SaveEvent(UID, 8288);
        SaveEvent(UID, 8294);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
------다이어 울프 사냥 끝------
-------------------------------

-------------------------------
-------스미르돈 사냥 시작------
-------------------------------

if EVENT == 8900 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8313);
    EVENT = 8901
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8318);
    EVENT = 8901
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8323);
    EVENT = 8901
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8328);
     EVENT = 8901
   end
end

if EVENT == 8901 then
    SelectMsg(UID, 1, 808, 8123, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8902 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 808, 8124, NPC, 10, 8905, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 808, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8905 then
    SelectMsg(UID, 4, 808, 8125, NPC, 22, 8903, 23, 8904, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8903 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8314);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8319);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8324);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8329);
   end
end

if EVENT == 8904 then
   SaveEvent(UID, 8317); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8910 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8316);
    EVENT = 8911
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8321);
    EVENT = 8911
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8326);
    EVENT = 8911
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8331);
    EVENT = 8911
   end
end

if EVENT == 8911 then
    SelectMsg(UID, 1, 808, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8906 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 808, 8099, NPC, 10, 8907, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 808, 8126, NPC, 10, 8908, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8907 then
   ShowMap(UID, 526);
end

local Check;

if EVENT == 8908 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 872)
        if  Check ==1 then        
        RunExchange(UID, 872);
        SaveEvent(UID, 8315);
        SaveEvent(UID, 8336);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 873)
        if  Check ==1 then        
        RunExchange(UID, 873);
        SaveEvent(UID, 8320);
        SaveEvent(UID, 8336);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 874)
        if  Check ==1 then        
        RunExchange(UID, 874);
        SaveEvent(UID, 8325);
        SaveEvent(UID, 8336);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 875)
        if  Check ==1 then        
        RunExchange(UID, 875);
        SaveEvent(UID, 8330);
        SaveEvent(UID, 8336);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-------스미르돈 사냥 끝--------
-------------------------------

-------------------------------
---와일드 스미르돈 사냥 시작---
-------------------------------

if EVENT == 8800 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8355);
    EVENT = 8801
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8360);
    EVENT = 8801
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8365);
    EVENT = 8801
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8370);
     EVENT = 8801
   end
end

if EVENT == 8801 then
    SelectMsg(UID, 1, 811, 8131, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8802 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 811, 8132, NPC, 10, 8805, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 811, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8805 then
    SelectMsg(UID, 4, 811, 8133, NPC, 22, 8803, 23, 8804, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8803 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8356);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8361);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8366);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8371);
   end
end

if EVENT == 8804 then
   SaveEvent(UID, 8359); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8810 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8358);
    EVENT = 8811
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8363);
    EVENT = 8811
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8368);
    EVENT = 8811
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8373);
    EVENT = 8811
   end
end

if EVENT == 8811 then
    SelectMsg(UID, 1, 811, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8806 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 10 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 811, 8099, NPC, 10, 8807, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 811, 8134, NPC, 10, 8808, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8807 then
   ShowMap(UID, 573);
end

local Check;

if EVENT == 8808 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 880)
        if  Check ==1 then        
        RunExchange(UID, 880);
        SaveEvent(UID, 8357);
        SaveEvent(UID, 8378);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 881)
        if  Check ==1 then        
        RunExchange(UID, 881);
        SaveEvent(UID, 8362);
        SaveEvent(UID, 8378);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 882)
        if  Check ==1 then        
        RunExchange(UID, 882);
        SaveEvent(UID, 8367);
        SaveEvent(UID, 8378);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 883)
        if  Check ==1 then        
        RunExchange(UID, 883);
        SaveEvent(UID, 8372);
        SaveEvent(UID, 8378);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
----와일드 스미르돈 사냥 끝----
-------------------------------

-------------------------------
-----세도우 시커 사냥 시작-----
-------------------------------

if EVENT == 8700 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8397);
    EVENT = 8701
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8402);
    EVENT = 8701
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8407);
    EVENT = 8701
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8412);
    EVENT = 8701
   end
end

if EVENT == 8701 then
    SelectMsg(UID, 1, 813, 8139, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8702 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 813, 8140, NPC, 10, 8705, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 813, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8705 then
    SelectMsg(UID, 4, 813, 8141, NPC, 22, 8703, 23, 8704, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8703 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8398);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8403);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8408);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8413);
   end
end

if EVENT == 8704 then
   SaveEvent(UID, 8401); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8710 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8400);
    EVENT = 8711
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8405);
    EVENT = 8711
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8410);
    EVENT = 8711
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8415);
    EVENT = 8711
   end
end

if EVENT == 8711 then
    SelectMsg(UID, 1, 813, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8706 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 813, 8099, NPC, 10, 8707, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       Class = CheckClass(UID);
        if Class == 1 or Class == 5 or Class == 6 or Class == 3 or Class == 9 or Class == 10 or Class == 4 or Class == 11 or Class == 12 then
        SelectMsg(UID, 4, 813, 8142, NPC, 10, 8708, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        elseif Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, 813, 8109, NPC, 10, 8708, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    end
end

if EVENT == 8707 then
   ShowMap(UID, 530);
end

local Check;

if EVENT == 8708 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 888)
        if  Check ==1 then        
        RunExchange(UID, 888);
        SaveEvent(UID, 8399);
        SaveEvent(UID, 8420);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 889)
        if  Check ==1 then        
        RunSelectExchange(UID, 889);
        SaveEvent(UID, 8404);
        SaveEvent(UID, 8420);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 890)
        if  Check ==1 then        
        RunExchange(UID, 890);
        SaveEvent(UID, 8409);
        SaveEvent(UID, 8420);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 891)
        if  Check ==1 then        
        RunExchange(UID, 891);
        SaveEvent(UID, 8414);
        SaveEvent(UID, 8420);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
-----세도우 시커 사냥 끝-------
-------------------------------

-------------------------------
------세이버 투스 사냥---------
-------------------------------

if EVENT == 8300 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8511);
    EVENT = 8301
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8516);
    EVENT = 8301
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8521);
    EVENT = 8301
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8526);
     EVENT = 8301
   end
end

if EVENT == 8301 then
    SelectMsg(UID, 1, 833, 8341, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8302 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 833, 8342, NPC, 10, 8305, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 833, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8305 then
    SelectMsg(UID, 4, 833, 8343, NPC, 22, 8303, 23, 8304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8303 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8512);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8517);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8522);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8527);
   end
end

if EVENT == 8304 then
   SaveEvent(UID, 8515); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8310 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8514);
    EVENT = 8311
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8519);
    EVENT = 8311
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8524);
    EVENT = 8311
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8529);
    EVENT = 8311
   end
end

if EVENT == 8311 then
    SelectMsg(UID, 1, 833, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8306 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 833, 8099, NPC, 10, 8307, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 833, 8344, NPC, 10, 8308, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8307 then
   ShowMap(UID, 532);
end

local Check;

if EVENT == 8308 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1013)
        if  Check ==1 then        
        RunExchange(UID, 1013);
        SaveEvent(UID, 8513);
        SaveEvent(UID, 8534);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1014)
        if  Check ==1 then        
        RunExchange(UID, 1014);
        SaveEvent(UID, 8518);
        SaveEvent(UID, 8534);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1015)
        if  Check ==1 then        
        RunExchange(UID, 1015);
        SaveEvent(UID, 8523);
        SaveEvent(UID, 8534);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1016)
        if  Check ==1 then        
        RunExchange(UID, 1016);
        SaveEvent(UID, 8528);
        SaveEvent(UID, 8534);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end
-------------------------------
------세이버투스  사냥 끝------
-------------------------------

-------------------------------
---스켈레톤 워리어 사냥 시작---
-------------------------------

if EVENT == 8200 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8553);
    EVENT = 8201
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8558);
    EVENT = 8201
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8563);
    EVENT = 8201
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8568);
     EVENT = 8201
   end
end

if EVENT == 8201 then
    SelectMsg(UID, 1, 834, 8131, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8202 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 834, 8348, NPC, 10, 8205, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 834, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8205 then
    SelectMsg(UID, 4, 834, 8349, NPC, 22, 8203, 23, 8204, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8203 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8554);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8559);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8564);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8569);
   end
end

if EVENT == 8204 then
   SaveEvent(UID, 8557); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8210 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8556);
    EVENT = 8211
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8561);
    EVENT = 8211
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8566);
    EVENT = 8211
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8571);
    EVENT = 8211
   end
end

if EVENT == 8211 then
    SelectMsg(UID, 1, 834, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8206 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 834, 8099, NPC, 10, 8207, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 834, 8350, NPC, 10, 8208, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8207 then
   ShowMap(UID, 575);
end

local Check;

if EVENT == 8208 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1021)
        if  Check ==1 then        
        RunExchange(UID, 1021);
        SaveEvent(UID, 8555);
        SaveEvent(UID, 8576);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1022)
        if  Check ==1 then        
        RunExchange(UID, 1022);
        SaveEvent(UID, 8560);
        SaveEvent(UID, 8576);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1023)
        if  Check ==1 then        
        RunExchange(UID, 1023);
        SaveEvent(UID, 8565);
        SaveEvent(UID, 8576);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1024)
        if  Check ==1 then        
        RunExchange(UID, 1024);
        SaveEvent(UID, 8570);
        SaveEvent(UID, 8576);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
----스켈레톤 워리어 사냥 끝----
-------------------------------

-------------------------------
---스켈레톤 나이트 사냥 시작---
-------------------------------

if EVENT == 8100 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8595);
    EVENT = 8101
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8600);
    EVENT = 8101
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8605);
    EVENT = 8101
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8610);
     EVENT = 8101
   end
end

if EVENT == 8101 then
    SelectMsg(UID, 1, 836, 8139, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8102 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 836, 8353, NPC, 10, 8105, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 836, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8105 then
    SelectMsg(UID, 4, 836, 8354, NPC, 22, 8103, 23, 8104, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8103 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8596);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8601);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8606);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8611);
   end
end

if EVENT == 8104 then
   SaveEvent(UID, 8599); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8110 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8598);
    EVENT = 8111
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8603);
    EVENT = 8111
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8608);
    EVENT = 8111
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8613);
    EVENT = 8111
   end
end

if EVENT == 8111 then
    SelectMsg(UID, 1, 836, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8106 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 836, 8099, NPC, 10, 8107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 836, 8344, NPC, 10, 8108, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8107 then
   ShowMap(UID, 534);
end

local Check;

if EVENT == 8108 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1029)
        if  Check ==1 then        
        RunExchange(UID, 1029);
        SaveEvent(UID, 8597);
        SaveEvent(UID, 8618);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1030)
        if  Check ==1 then        
        RunExchange(UID, 1030);
        SaveEvent(UID, 8602);
        SaveEvent(UID, 8618);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1031)
        if  Check ==1 then        
        RunExchange(UID, 1031);
        SaveEvent(UID, 8607);
        SaveEvent(UID, 8618);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1032)
        if  Check ==1 then        
        RunExchange(UID, 1032);
        SaveEvent(UID, 8612);
        SaveEvent(UID, 8618);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
----스켈레톤 나이트 사냥 끝----
-------------------------------

-------------------------------
-----데스 나이트 사냥 시작-----
-------------------------------

if EVENT == 8020 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8637);
    EVENT = 8021
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8342);
    EVENT = 8021
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8347);
    EVENT = 8021
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8352);
     EVENT = 8021
   end
end

if EVENT == 8021 then
    SelectMsg(UID, 1, 838, 8359, NPC, 3014, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8022 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 838, 8360, NPC, 10, 8025, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 838, 8333, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8025 then
    SelectMsg(UID, 4, 838, 8361, NPC, 22, 8023, 23, 8024, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8023 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8638);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8643);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8648);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8653);
   end
end

if EVENT == 8024 then
   SaveEvent(UID, 8641); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8030 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8640);
    EVENT = 8031
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8645);
    EVENT = 8031
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8650);
    EVENT = 8031
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8655);
    EVENT = 8031
   end
end

if EVENT == 8031 then
    SelectMsg(UID, 1, 838, 8335, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8026 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 838, 8099, NPC, 10, 8027, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 838, 8362, NPC, 10, 8028, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8027 then
   ShowMap(UID, 538);
end

local Check;

if EVENT == 8028 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1037)
        if  Check ==1 then        
        RunExchange(UID, 1037);
        SaveEvent(UID, 8639);
        SaveEvent(UID, 8660);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1038)
        if  Check ==1 then        
        RunExchange(UID, 1038);
        SaveEvent(UID, 8644);
        SaveEvent(UID, 8660);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1039)
        if  Check ==1 then        
        RunExchange(UID, 1039);
        SaveEvent(UID, 8649);
        SaveEvent(UID, 8660);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1040)
        if  Check ==1 then        
        RunExchange(UID, 1040);
        SaveEvent(UID, 8654);
        SaveEvent(UID, 8660);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
  end	 
end

-------------------------------
------데스 나이트 사냥 끝------
-------------------------------

-------------------------------
-----------호넷 사냥-----------
-------------------------------

if EVENT == 8050 then
   SelectMsg(UID, 1, 840, 8234, NPC, 3003, 8051, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8051 then
   SaveEvent(UID, 8973);
end

local MonsterSub = 0;

if EVENT == 8052 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 840, 8235, NPC, 10, 8060, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 840, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8060 then
   SelectMsg(UID, 4, 840, 8236, NPC, 22, 8053, 23, 8054, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8053 then --수락
   SaveEvent(UID, 8974);
end

if EVENT == 8054 then --거절
   SaveEvent(UID, 8977);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 8055 then
   SelectMsg(UID, 1, 840, 8416, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 8976);
end

local MonsterCount = 0;

if EVENT == 8057 then
   MonsterCount  = CountMonsterQuestSub(UID,840, 1);
   print("MonsterCount",MonsterCount);
   if  MonsterCount < 30 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 840, 8417, NPC, 10, 8058, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 840, 8237, NPC, 10, 8059, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8058 then
   ShowMap(UID, 545);
end

if EVENT == 8059 then
   Check = CheckExchange(UID, 951)
   if  Check ==1 then
   RunExchange(UID, 951);
   SaveEvent(UID, 8975);
   SaveEvent(UID, 8981);
   else
  Ret = 1;	
  end	 
end

-------------------------------
----------호넷 사냥 끝---------
-------------------------------

------------------------------------
---------HORNET HUNT REPEATABLE SOLO----
------------------------------------

if EVENT == 1000 then
   SelectMsg(UID, 1, 1840, 8157, NPC, 3003, 1001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1001 then
   SaveEvent(UID, 2157);
end

local MonsterSub = 0;

if EVENT == 1002 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 1840, 8158, NPC, 10, 1010, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 1840, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 1010 then
   SelectMsg(UID, 4, 1840, 8236, NPC, 22, 1003, 23, 1004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 1003 then --수락
   SaveEvent(UID, 2158);
end

if EVENT == 1004 then --거절
   SaveEvent(UID, 2161);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 1005 then
   SelectMsg(UID, 1, 1840, 8416, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 2160);
end

local MonsterCount = 0;

if EVENT == 1007 then
   MonsterCount  = CountMonsterQuestSub(UID,1840, 1);
   print("MonsterCount",MonsterCount);
   if  MonsterCount < 20 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 1840, 8417, NPC, 10, 1008, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 1840, 8237, NPC, 10, 1009, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 1008 then
   ShowMap(UID, 545);
end

if EVENT == 1009 then
   Check = CheckExchange(UID, 1202)
   if  Check ==1 then
   RunExchange(UID, 1202);
   SaveEvent(UID, 2159);
--   SaveEvent(UID, 8981);
   else
  Ret = 1;	
  end	 
end

-------------------------------
----------호넷 사냥 끝---------
-------------------------------

-------------- END ------------------
-------------------------------
-------하웅가 전사 사냥--------
-------------------------------

if EVENT == 8450 then
   SelectMsg(UID, 1, 848, 8238, NPC, 3003, 8451, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8451 then
   SaveEvent(UID, 9033);
end

local MonsterSub = 0;

if EVENT == 8452 then
   MonsterSub = ExistMonsterQuestSub(UID,848);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 848, 8239, NPC, 10, 8460, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 848, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8460 then
   SelectMsg(UID, 4, 848, 8240, NPC, 22, 8453, 23, 8454, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8453 then --수락
   SaveEvent(UID, 9034);
end

if EVENT == 8454 then --거절
   SaveEvent(UID, 9037);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 8455 then
   SelectMsg(UID, 1, 848, 8416, NPC, 3014, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9036);
end

local MonsterCount = 0;

if EVENT == 8457 then
   MonsterCount  = CountMonsterQuestSub(UID,848, 1);
   if  MonsterCount < 20 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 848, 8417, NPC, 10, 8458, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 848, 8241, NPC, 10, 8459, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8458 then
   ShowMap(UID, 58);
end

if EVENT == 8459 then
   Check = CheckExchange(UID, 940)
   if  Check ==1 then
   RunExchange(UID, 940);
   SaveEvent(UID, 9035);
   SaveEvent(UID, 9041);
   else
  Ret = 1;	
  end	 
end

-------------------------------
------하웅가 전사 사냥 끝------
-------------------------------

--GHOST WARRIOR HUNT
if EVENT == 9332 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 895, 8235, NPC, 10, 9340, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 895, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9340 then
   SelectMsg(UID, 4, 895, 8236, NPC, 22, 8053, 23, 8054, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--HOB GOBLIN HUNT
if EVENT == 9352 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 898, 8235, NPC, 10, 9360, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 898, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9360 then
   SelectMsg(UID, 4, 898, 8236, NPC, 22, 8053, 23, 8054, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--GREY ORC HUNT
if EVENT == 9512 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 919, 8235, NPC, 10, 9520, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 919, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 9520 then
   SelectMsg(UID, 4, 919, 8236, NPC, 22, 8053, 23, 8054, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


------groom hound hunt repeatable
if EVENT == 400 then
	SelectMsg(UID, 1, 1898, 8682, NPC, 3003, 401, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 401 then
	SaveEvent(UID, 2337);
end

local MonsterSub = 0;

if EVENT == 402 then
	MonsterSub = ExistMonsterQuestSub(UID);
	if MonsterSub == 0 then
		SelectMsg(UID, 2, 1898, 8158, NPC, 10, 410, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 2, 1898, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 410 then
	SelectMsg(UID, 4, 1898, 8236, NPC, 22, 403, 23, 1004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 403 then
	SaveEvent(UID, 2338);
end

if EVENT == 404 then
	SaveEvent(UID, 2341);
end

if EVENT == 405 then
	SelectMsg(UID, 1, 1898, 8416, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	SaveEvent(UID, 2340);
end

local MonsterCount = 0;

if EVENT == 407 then
	MonsterCount  = CountMonsterQuestSub(UID,1898, 1);
	if  MonsterCount < 20 then
		SelectMsg(UID, 2, 1898, 8417, NPC, 10, 408, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 4, 1898, 8237, NPC, 10, 409, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 408 then
	ShowMap(UID, 545);
end

if EVENT == 409 then
	Check = CheckExchange(UID, 11093)
	if  Check ==1 then
		RunExchange(UID, 11093);
		SaveEvent(UID, 2339);
	else
		Ret = 1;
	end
end



----- haunga warrior hunt repeat
if EVENT == 200 then
	SelectMsg(UID, 1, 1848, 8165, NPC, 3003, 201, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 201 then
	SaveEvent(UID, 2217);
end

local MonsterSub = 0;

if EVENT == 202 then
	MonsterSub = ExistMonsterQuestSub(UID);
	if MonsterSub == 0 then
		SelectMsg(UID, 2, 1848, 8158, NPC, 10, 210, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 2, 1848, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 210 then
	SelectMsg(UID, 4, 1848, 8236, NPC, 22, 203, 23, 1004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 203 then
	SaveEvent(UID, 2218);
end

if EVENT == 204 then
	SaveEvent(UID, 2221);
end

if EVENT == 205 then
	SelectMsg(UID, 1, 1848, 8416, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	SaveEvent(UID, 2220);
end

local MonsterCount = 0;

if EVENT == 207 then
	MonsterCount  = CountMonsterQuestSub(UID,1848, 1);
	if  MonsterCount < 20 then
		SelectMsg(UID, 2, 1848, 8417, NPC, 10, 208, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 4, 1848, 8237, NPC, 10, 209, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 208 then
	ShowMap(UID, 545);
end

if EVENT == 209 then
	Check = CheckExchange(UID, 1940)
	if  Check ==1 then
		RunExchange(UID, 1940);
		SaveEvent(UID, 2219);
	else
		Ret = 1;
	end
end


------ pfantom hunt repeat
if EVENT == 300 then
	SelectMsg(UID, 1, 1895, 8678, NPC, 3003, 301, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 301 then
	SaveEvent(UID, 2313);
end

local MonsterSub = 0;

if EVENT == 302 then
	MonsterSub = ExistMonsterQuestSub(UID);
	if MonsterSub == 0 then
		SelectMsg(UID, 2, 1895, 8158, NPC, 10, 310, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 2, 1895, 8253, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 310 then
	SelectMsg(UID, 4, 1895, 8236, NPC, 22, 303, 23, 1004, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 303 then
	SaveEvent(UID, 2314);
end

if EVENT == 304 then
	SaveEvent(UID, 2317);
end

if EVENT == 305 then
	SelectMsg(UID, 1, 1895, 8416, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	SaveEvent(UID, 2316);
end

local MonsterCount = 0;

if EVENT == 307 then
	MonsterCount  = CountMonsterQuestSub(UID,1895, 1);
	if  MonsterCount < 20 then
		SelectMsg(UID, 2, 1895, 8417, NPC, 10, 308, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
		SelectMsg(UID, 4, 1895, 8237, NPC, 10, 309, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 308 then
	ShowMap(UID, 545);
end

if EVENT == 309 then
	Check = CheckExchange(UID, 11090)
	if  Check ==1 then
		RunExchange(UID, 11090);
		SaveEvent(UID, 2315);
	else
		Ret = 1;
	end
end


return Ret;