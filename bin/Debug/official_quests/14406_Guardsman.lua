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
local NPC = 14406;


if EVENT == 190 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
          -- SelectMsg(UID, 2. -1...........)
			 SelectMsg(UID, 2, -1, 559, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 --SetQuestStep(UID, EVENT, 1); -- 뭘 하는 걸까?
			 Ret = 1; -- 이건 왜 저장 시켜요? 그냥 RETURN은 안되나요?
		elseif QuestNum > 1 and  QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 560, NPC)
      else --해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 193 then
    Ret = 1;
end

-- [황실근위병] 클릭시 퀘스트 체크  

--------------------------------
------스켈레톤 사냥 시작-------
-------------------------------

if EVENT == 8730 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8208);
    EVENT = 8731
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8213);
    EVENT = 8731
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8218);
    EVENT = 8731
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8223);
     EVENT = 8731
   end
end

if EVENT == 8731 then
    SelectMsg(UID, 1, 805, 8091, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    ShowMap(UID, 31);
end

local MonsterSub = 0;

if EVENT == 8732 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 805, 8092, NPC, 10, 8735, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 805, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8735 then
    SelectMsg(UID, 4, 805, 8093, NPC, 22, 8733, 23, 8734, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8733 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8209);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8214);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8219);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8224);
   end
end

if EVENT == 8734 then
   SaveEvent(UID, 8212); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8740 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8211);
    EVENT = 8741
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8216);
    EVENT = 8741
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8221);
    EVENT = 8741
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8226);
    EVENT = 8741
   end
end

if EVENT == 8741 then
    SelectMsg(UID, 1, 805, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8736 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 805, 8094, NPC, 10, 8737, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 805, 8095, NPC, 10, 8738, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8737 then
   ShowMap(UID, 23);
end

local Check;

if EVENT == 8738 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 852)
        if  Check ==1 then        
        RunExchange(UID, 852);
        SaveEvent(UID, 8210);
        SaveEvent(UID, 8189);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 853)
        if  Check ==1 then        
        RunExchange(UID, 853);
        SaveEvent(UID, 8215);
        SaveEvent(UID, 8189);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 854)
        if  Check ==1 then        
        RunExchange(UID, 854);
        SaveEvent(UID, 8220);
        SaveEvent(UID, 8189);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 855)
        if  Check ==1 then        
        RunExchange(UID, 855);
        SaveEvent(UID, 8225);
        SaveEvent(UID, 8189);
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
    SaveEvent(UID, 8250);
    EVENT = 8831
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8255);
    EVENT = 8831
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8260);
    EVENT = 8831
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8265);
     EVENT = 8831
   end
end

if EVENT == 8831 then
    SelectMsg(UID, 1, 806, 8101, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8832 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 806, 8102, NPC, 10, 8835, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 806, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8835 then
    SelectMsg(UID, 4, 806, 8103, NPC, 22, 8833, 23, 8834, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8833 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8251);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8256);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8261);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8266);
   end
end

if EVENT == 8834 then
   SaveEvent(UID, 8254); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8840 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8253);
    EVENT = 8841
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8258);
    EVENT = 8841
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8263);
    EVENT = 8841
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8268);
    EVENT = 8841
   end
end

if EVENT == 8841 then
    SelectMsg(UID, 1, 806, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8836 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 806, 8094, NPC, 10, 8837, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 806, 8104, NPC, 10, 8838, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8837 then
   ShowMap(UID, 570);
end

local Check;

if EVENT == 8838 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 860)
        if  Check ==1 then        
        RunExchange(UID, 860);
        SaveEvent(UID, 8252);
        SaveEvent(UID, 8231);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 861)
        if  Check ==1 then        
        RunExchange(UID, 861);
        SaveEvent(UID, 8257);
        SaveEvent(UID, 8231);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 862)
        if  Check ==1 then        
        RunExchange(UID, 862);
        SaveEvent(UID, 8262);
        SaveEvent(UID, 8231);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 863)
        if  Check ==1 then        
        RunExchange(UID, 863);
        SaveEvent(UID, 8267);
        SaveEvent(UID, 8231);
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
    SaveEvent(UID, 8292);
    EVENT = 8931
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8297);
    EVENT = 8931
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8302);
    EVENT = 8931
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8307);
     EVENT = 8931
   end
end

if EVENT == 8931 then
    SelectMsg(UID, 1, 807, 8111, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8932 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 807, 8112, NPC, 10, 8935, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 807, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8935 then
    SelectMsg(UID, 4, 807, 8113, NPC, 22, 8933, 23, 8934, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8933 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8293);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8298);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8303);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8308);
   end
end

if EVENT == 8934 then
   SaveEvent(UID, 8296); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8940 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8295);
    EVENT = 8941
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8300);
    EVENT = 8941
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8305);
    EVENT = 8941
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8310);
    EVENT = 8941
   end
end

if EVENT == 8941 then
    SelectMsg(UID, 1, 807, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8936 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 807, 8094, NPC, 10, 8937, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 807, 8114, NPC, 10, 8938, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8937 then
   ShowMap(UID, 523);
end

local Check;

if EVENT == 8938 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 868)
        if  Check ==1 then        
        RunExchange(UID, 868);
        SaveEvent(UID, 8294);
        SaveEvent(UID, 8273);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 869)
        if  Check ==1 then        
        RunExchange(UID, 869);
        SaveEvent(UID, 8299);
        SaveEvent(UID, 8273);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 870)
        if  Check ==1 then        
        RunExchange(UID, 870);
        SaveEvent(UID, 8304);
        SaveEvent(UID, 8273);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 871)
        if  Check ==1 then        
        RunExchange(UID, 871);
        SaveEvent(UID, 8309);
        SaveEvent(UID, 8273);
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
    SaveEvent(UID, 8334);
    EVENT = 8901
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8339);
    EVENT = 8901
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8344);
    EVENT = 8901
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8349);
     EVENT = 8901
   end
end

if EVENT == 8901 then
    SelectMsg(UID, 1, 809, 8119, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8902 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 809, 8120, NPC, 10, 8905, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 809, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8905 then
    SelectMsg(UID, 4, 809, 8121, NPC, 22, 8903, 23, 8904, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8903 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8335);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8340);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8345);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8350);
   end
end

if EVENT == 8904 then
   SaveEvent(UID, 8338); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8910 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8337);
    EVENT = 8911
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8342);
    EVENT = 8911
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8347);
    EVENT = 8911
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8352);
    EVENT = 8911
   end
end

if EVENT == 8911 then
    SelectMsg(UID, 1, 809, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8906 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 809, 8094, NPC, 10, 8907, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 809, 8122, NPC, 10, 8908, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8907 then
   ShowMap(UID, 525);
end

local Check;

if EVENT == 8908 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 876)
        if  Check ==1 then        
        RunExchange(UID, 876);
        SaveEvent(UID, 8336);
        SaveEvent(UID, 8315);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 877)
        if  Check ==1 then        
        RunExchange(UID, 877);
        SaveEvent(UID, 8341);
        SaveEvent(UID, 8315);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 878)
        if  Check ==1 then        
        RunExchange(UID, 878);
        SaveEvent(UID, 8346);
        SaveEvent(UID, 8315);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 879)
        if  Check ==1 then        
        RunExchange(UID, 879);
        SaveEvent(UID, 8351);
        SaveEvent(UID, 8315);
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
    SaveEvent(UID, 8376);
    EVENT = 8801
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8381);
    EVENT = 8801
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8386);
    EVENT = 8801
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8391);
     EVENT = 8801
   end
end

if EVENT == 8801 then
    SelectMsg(UID, 1, 812, 8127, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8802 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 812, 8128, NPC, 10, 8805, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 812, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8805 then
    SelectMsg(UID, 4, 812, 8129, NPC, 22, 8803, 23, 8804, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8803 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8377);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8382);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8387);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8392);
   end
end

if EVENT == 8804 then
   SaveEvent(UID, 8380); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8810 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8379);
    EVENT = 8811
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8384);
    EVENT = 8811
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8389);
    EVENT = 8811
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8394);
    EVENT = 8811
   end
end

if EVENT == 8811 then
    SelectMsg(UID, 1, 812, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8806 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 10 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 812, 8094, NPC, 10, 8807, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 812, 8130, NPC, 10, 8808, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8807 then
   ShowMap(UID, 572);
end

local Check;

if EVENT == 8808 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 884)
        if  Check ==1 then        
        RunExchange(UID, 884);
        SaveEvent(UID, 8378);
        SaveEvent(UID, 8357);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 885)
        if  Check ==1 then        
        RunExchange(UID, 885);
        SaveEvent(UID, 8383);
        SaveEvent(UID, 8357);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 886)
        if  Check ==1 then        
        RunExchange(UID, 886);
        SaveEvent(UID, 8388);
        SaveEvent(UID, 8357);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 887)
        if  Check ==1 then        
        RunExchange(UID, 887);
        SaveEvent(UID, 8393);
        SaveEvent(UID, 8357);
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
    SaveEvent(UID, 8418);
    EVENT = 8701
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8423);
    EVENT = 8701
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8428);
    EVENT = 8701
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8433);
    EVENT = 8701
   end
end

if EVENT == 8701 then
    SelectMsg(UID, 1, 814, 8135, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8702 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 814, 8136, NPC, 10, 8705, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 814, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8705 then
    SelectMsg(UID, 4, 814, 8137, NPC, 22, 8703, 23, 8704, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8703 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8419);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8424);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8429);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8434);
   end
end

if EVENT == 8704 then
   SaveEvent(UID, 8422); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8710 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8421);
    EVENT = 8711
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8426);
    EVENT = 8711
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8431);
    EVENT = 8711
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8436);
    EVENT = 8711
   end
end

if EVENT == 8711 then
    SelectMsg(UID, 1, 814, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8706 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
       SelectMsg(UID, 2, 814, 8094, NPC, 10, 8707, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
       Class = CheckClass(UID);
        if Class == 1 or Class == 5 or Class == 6 or Class == 3 or Class == 9 or Class == 10 or Class == 4 or Class == 11 or Class == 12 then
        SelectMsg(UID, 4, 814, 8138, NPC, 10, 8708, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        elseif Class == 2 or Class == 7 or Class == 8 then
        SelectMsg(UID, 5, 814, 8104, NPC, 10, 8708, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    end
end

if EVENT == 8707 then
   ShowMap(UID, 529);
end

local Check;

if EVENT == 8708 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 892)
        if  Check ==1 then        
        RunExchange(UID, 892);
        SaveEvent(UID, 8420);
        SaveEvent(UID, 8399);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 893)
        if  Check ==1 then        
        RunSelectExchange(UID, 893);
        SaveEvent(UID, 8425);
        SaveEvent(UID, 8399);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 894)
        if  Check ==1 then        
        RunExchange(UID, 894);
        SaveEvent(UID, 8430);
        SaveEvent(UID, 8399);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 895)
        if  Check ==1 then        
        RunExchange(UID, 895);
        SaveEvent(UID, 8435);
        SaveEvent(UID, 8399);
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
    SaveEvent(UID, 8532);
    EVENT = 8301
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8537);
    EVENT = 8301
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8542);
    EVENT = 8301
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8547);
     EVENT = 8301
   end
end

if EVENT == 8301 then
    SelectMsg(UID, 1, 832, 8337, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8302 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 832, 8338, NPC, 10, 8305, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 832, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8305 then
    SelectMsg(UID, 4, 832, 8339, NPC, 22, 8303, 23, 8304, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8303 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8533);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8538);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8543);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8548);
   end
end

if EVENT == 8304 then
   SaveEvent(UID, 8536); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8310 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8535);
    EVENT = 8311
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8540);
    EVENT = 8311
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8545);
    EVENT = 8311
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8550);
    EVENT = 8311
   end
end

if EVENT == 8311 then
    SelectMsg(UID, 1, 832, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8306 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 832, 8094, NPC, 10, 8307, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 832, 8340, NPC, 10, 8308, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8307 then
   ShowMap(UID, 531);
end

local Check;

if EVENT == 8308 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1009)
        if  Check ==1 then        
        RunExchange(UID, 1009);
        SaveEvent(UID, 8534);
        SaveEvent(UID, 8513);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1010)
        if  Check ==1 then        
        RunExchange(UID, 1010);
        SaveEvent(UID, 8539);
        SaveEvent(UID, 8513);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1011)
        if  Check ==1 then        
        RunExchange(UID, 1011);
        SaveEvent(UID, 8544);
        SaveEvent(UID, 8513);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1012)
        if  Check ==1 then        
        RunExchange(UID, 1012);
        SaveEvent(UID, 8549);
        SaveEvent(UID, 8513);
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
    SaveEvent(UID, 8574);
    EVENT = 8201
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8579);
    EVENT = 8201
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8584);
    EVENT = 8201
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8589);
     EVENT = 8201
   end
end

if EVENT == 8201 then
    SelectMsg(UID, 1, 867, 8127, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8202 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 867, 8345, NPC, 10, 8205, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 867, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8205 then
    SelectMsg(UID, 4, 867, 8346, NPC, 22, 8203, 23, 8204, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8203 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8575);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8580);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8585);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8590);
   end
end

if EVENT == 8204 then
   SaveEvent(UID, 8578); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8210 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8577);
    EVENT = 8211
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8582);
    EVENT = 8211
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8587);
    EVENT = 8211
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8592);
    EVENT = 8211
   end
end

if EVENT == 8211 then
    SelectMsg(UID, 1, 867, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8206 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 867, 8094, NPC, 10, 8207, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 867, 8347, NPC, 10, 8208, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8207 then
   ShowMap(UID, 574);
end

local Check;

if EVENT == 8208 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1017)
        if  Check ==1 then        
        RunExchange(UID, 1017);
        SaveEvent(UID, 8576);
        SaveEvent(UID, 8555);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1018)
        if  Check ==1 then        
        RunExchange(UID, 1018);
        SaveEvent(UID, 8581);
        SaveEvent(UID, 8555);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1019)
        if  Check ==1 then        
        RunExchange(UID, 1019);
        SaveEvent(UID, 8586);
        SaveEvent(UID, 8555);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1020)
        if  Check ==1 then        
        RunExchange(UID, 1020);
        SaveEvent(UID, 8591);
        SaveEvent(UID, 8555);
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
    SaveEvent(UID, 8616);
    EVENT = 8101
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8621);
    EVENT = 8101
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8626);
    EVENT = 8101
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8631);
     EVENT = 8101
   end
end

if EVENT == 8101 then
    SelectMsg(UID, 1, 835, 8135, NPC, 4080, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8102 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 835, 8351, NPC, 10, 8105, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 835, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8105 then
    SelectMsg(UID, 4, 835, 8352, NPC, 22, 8103, 23, 8104, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8103 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8617);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8622);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8627);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8632);
   end
end

if EVENT == 8104 then
   SaveEvent(UID, 8620); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8110 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8619);
    EVENT = 8111
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8624);
    EVENT = 8111
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8629);
    EVENT = 8111
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8634);
    EVENT = 8111
   end
end

if EVENT == 8111 then
    SelectMsg(UID, 1, 835, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8106 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 30 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 835, 8094, NPC, 10, 8107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 835, 8340, NPC, 10, 8108, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8107 then
   ShowMap(UID, 533);
end

local Check;

if EVENT == 8108 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1025)
        if  Check ==1 then        
        RunExchange(UID, 1025);
        SaveEvent(UID, 8618);
        SaveEvent(UID, 8597);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1026)
        if  Check ==1 then        
        RunExchange(UID, 1026);
        SaveEvent(UID, 8623);
        SaveEvent(UID, 8597);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1027)
        if  Check ==1 then        
        RunExchange(UID, 1027);
        SaveEvent(UID, 8628);
        SaveEvent(UID, 8597);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1028)
        if  Check ==1 then        
        RunExchange(UID, 1028);
        SaveEvent(UID, 8633);
        SaveEvent(UID, 8597);
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
    SaveEvent(UID, 8658);
    EVENT = 8021
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8363);
    EVENT = 8021
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8368);
    EVENT = 8021
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8373);
     EVENT = 8021
   end
end

if EVENT == 8021 then
    SelectMsg(UID, 1, 837, 8355, NPC, 3014, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

local MonsterSub = 0;

if EVENT == 8022 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 837, 8356, NPC, 10, 8025, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else-- 몬스터 서브 퀘스트가 있을때
    SelectMsg(UID, 2, 837, 8334, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8025 then
    SelectMsg(UID, 4, 837, 8357, NPC, 22, 8023, 23, 8024, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8023 then --수락시
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8659);
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8664);
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8669);
    elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8674);
   end
end

if EVENT == 8024 then
   SaveEvent(UID, 8662); -- 거절시 
end


-- 재료를 다 모았을때 시드 또 등장 

if EVENT == 8030 then
   Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    SaveEvent(UID, 8661);
    EVENT = 8031
    elseif Class == 2 or Class == 7 or Class == 8 then
    SaveEvent(UID, 8666);
    EVENT = 8031
    elseif Class == 3 or Class == 9 or Class == 10 then
    SaveEvent(UID, 8671);
    EVENT = 8031
   elseif Class == 4 or Class == 11 or Class == 12 then
    SaveEvent(UID, 8676);
    EVENT = 8031
   end
end

if EVENT == 8031 then
    SelectMsg(UID, 1, 837, 8336, NPC, 3002, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8026 then
    MonsterCount  = CountMonsterQuestSub(UID, 1);
    if  MonsterCount < 20 then -- 사냥이 남았을때
     SelectMsg(UID, 2, 837, 8094, NPC, 10, 8027, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else -- 사냥이 완료 되었을때 
     SelectMsg(UID, 4, 837, 8358, NPC, 10, 8028, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 8027 then
   ShowMap(UID, 537);
end

local Check;

if EVENT == 8028 then
    Class = CheckClass(UID);
    if Class == 1 or Class == 5 or Class == 6 then
    Check = CheckExchange(UID, 1033)
        if  Check ==1 then        
        RunExchange(UID, 1033);
        SaveEvent(UID, 8660);
        SaveEvent(UID, 8639);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 2 or Class == 7 or Class == 8 then
    Check = CheckExchange(UID, 1034)
        if  Check ==1 then        
        RunExchange(UID, 1034);
        SaveEvent(UID, 8665);
        SaveEvent(UID, 8639);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 3 or Class == 9 or Class == 10 then
    Check = CheckExchange(UID, 1035)
        if  Check ==1 then        
        RunExchange(UID, 1035);
        SaveEvent(UID, 8670);
        SaveEvent(UID, 8639);
        ShowEffect(UID, 300391)
        else
        Ret = 1; 
        end  
    elseif Class == 4 or Class == 11 or Class == 12 then
    Check = CheckExchange(UID, 1036)
        if  Check ==1 then        
        RunExchange(UID, 1036);
        SaveEvent(UID, 8675);
        SaveEvent(UID, 8639);
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
   SelectMsg(UID, 1, 839, 8245, NPC, 3003, 8051, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8051 then
   SaveEvent(UID, 8979);
end

local MonsterSub = 0;

if EVENT == 8052 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
	SelectMsg(UID, 2, 839, 8246, NPC, 10, 8060, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 839, 8254, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8060 then
   SelectMsg(UID, 4, 839, 8247, NPC, 22, 8053, 23, 8054, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8053 then --수락
   SaveEvent(UID, 8980);
end

if EVENT == 8054 then --거절
   SaveEvent(UID, 8983);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 8055 then
   SelectMsg(UID, 1, 839, 8418, NPC, 3007, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 8982);
end

local MonsterCount = 0;

if EVENT == 8057 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 250 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 839, 8419, NPC, 10, 8058, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 839, 8248, NPC, 10, 8059, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8058 then
   ShowMap(UID, 27);
end

if EVENT == 8059 then
   Check = CheckExchange(UID, 952)
   if  Check ==1 then
   RunExchange(UID, 952);
   SaveEvent(UID, 8981);
   SaveEvent(UID, 8975);
   else
  Ret = 1;	
  end	 
end

-------------------------------
----------호넷 사냥 끝---------
-------------------------------

-------------------------------
-------하웅가 전사 사냥--------
-------------------------------

if EVENT == 8450 then
   SelectMsg(UID, 1, 847, 8249, NPC, 3003, 8451, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8451 then
   SaveEvent(UID, 9039);
end

local MonsterSub = 0;

if EVENT == 8452 then
   MonsterSub = ExistMonsterQuestSub(UID);
   if MonsterSub == 0 then -- 몬스터 서브 퀘스트가 없을때
    SelectMsg(UID, 2, 847, 8250, NPC, 10, 8460, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 몬스터 서브 퀘스트가 있을때
 	SelectMsg(UID, 2, 847, 8254, NPC, 10, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	end
end

if EVENT == 8460 then
   SelectMsg(UID, 4, 847, 8251, NPC, 22, 8453, 23, 8454, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 8453 then --수락
   SaveEvent(UID, 9040);
end

if EVENT == 8454 then --거절
   SaveEvent(UID, 9043);
end

-- 사냥 완료시 시드와 미셀의 등장
if EVENT == 8455 then
   SelectMsg(UID, 1, 847, 8418, NPC, 3014, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   SaveEvent(UID, 9042);
end

local MonsterCount = 0;

if EVENT == 8457 then
   MonsterCount  = CountMonsterQuestSub(UID, 1);
   if  MonsterCount < 240 then -- 사냥이 남았을때
      SelectMsg(UID, 2, 847, 8419, NPC, 10, 8458, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else-- 사냥이 완료 되었을때 
      SelectMsg(UID, 4, 847, 8252, NPC, 10, 8459, 27, 193, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 8458 then
   ShowMap(UID, 59);
end

if EVENT == 8459 then
   Check = CheckExchange(UID, 941)
   if  Check ==1 then
   RunExchange(UID, 941);
   SaveEvent(UID, 9041);
   SaveEvent(UID, 9035);
   else
  Ret = 1;	
  end	 
end

-------------------------------
------하웅가 전사 사냥 끝------
-------------------------------

return Ret;