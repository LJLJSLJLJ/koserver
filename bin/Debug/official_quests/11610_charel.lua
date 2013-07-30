
-- [기사단서기관]델라가 

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공?

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC = 21610
local savenum = -1


-- [기사단서기관]델라가  클릭시 퀘스트 체크  


if EVENT == 240 then
   SelectMsg(UID, 3, savenum, 4150, NPC, 4150, 100, 4151, 360, 4155, 370, 4156, 380, 4154, 241, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2);
end

if EVENT == 241 then
	Ret = 1;
end

-----------------------------------------------------------
-- 기사단 승격 시작 
-----------------------------------------------------------
local Knight
local ClanGrade
local Chief

if EVENT == 100 then
	SelectMsg(UID, 3, savenum, 4150, NPC, 4333, 280, 4334, 110, 4335, 120, 4154, 241, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2);
end

--## ACRICATED START
if EVENT == 110 then
Knight = CheckKnight(UID)
    if Knight == 2 then -- 클랜 
    ClanGrade = CheckClanGrade(UID)
        if ClanGrade == 1 then -- 클랜 3등급 이상
        Chief = CheckChief(UID)
            if Chief == 1 then -- 클랜단장일때 
                SelectMsg(UID, 3, savenum, 6393, NPC, 4157, 111, 4158, 114, 4159, 115, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else-- 클랜단장 아닐때
            SelectMsg(UID, 2, savenum, 6384, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            end
        else-- 클랜 3등급 이상 아닐때
        SelectMsg(UID, 2, savenum, 6385, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else-- 클랜 아닐때
    SelectMsg(UID, 2, savenum, 6386, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 111 then
    SelectMsg(UID, 2, savenum, 6387, NPC, 4160, 112, 27, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 112 then
    SelectMsg(UID, 2, savenum, 6388, NPC, 4160, 113, 27, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 113 then
    SelectMsg(UID, 2, savenum, 6389, NPC, 27, 241, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 114 then
    SelectMsg(UID, 4, 953, 6390, NPC, 4161, 116, 4162, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 115 then
-- 명령어 나오면 그걸로 수정해야 될부분
	ZoneClanChange(UID, 93, 444, 350) -- 수정했음
end

if EVENT == 116 then
    ItemA = HowmuchItem(UID, 900000000);  --노아
    ItemB = HowmuchItem(UID, 389221000);  -- 켄타목 
    if ItemA < 10000000 then -- 노아
    SelectMsg(UID, 2, savenum, 6391, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif ItemB == 0 then
    SelectMsg(UID, 2, savenum, 6392, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- ok
    RunExchange(UID, 467);
    PromoteKnight(UID,3)
    end
end
--## ACRICATED END

--## ROYAL START
if EVENT == 120 then
Knight = CheckKnight(UID)
    if Knight == 7 then -- 클랜 
        Chief = CheckChief(UID)
            if Chief == 1 then -- 클랜단장일때 
                SelectMsg(UID, 3, savenum, 6392, NPC, 4157, 121, 4158, 124, 4159, 125, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else-- 클랜단장 아닐때
            SelectMsg(UID, 2, savenum, 6393, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            end
    else-- 클랜 아닐때
    SelectMsg(UID, 2, savenum, 6395, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 121 then
    SelectMsg(UID, 2, savenum, 6396, NPC, 4160, 122, 27, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 122 then
    SelectMsg(UID, 2, savenum, 6397, NPC, 4160, 123, 27, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 123 then
    SelectMsg(UID, 2, savenum, 6398, NPC, 27, 241, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 124 then
    SelectMsg(UID, 4, 954, 6399, NPC, 4161, 126, 4162, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 125 then
-- 명령어 나오면 그걸로 수정해야 될부분
	ZoneClanChange(UID, 94, 110, 20) -- 수정했음
end

if EVENT == 126 then
    ItemA = HowmuchItem(UID, 900000000);  --노아
    ItemB = HowmuchItem(UID, 389222000);  -- 켄타목 
    if ItemA < 100000000 then -- 노아
    SelectMsg(UID, 2, savenum, 6400, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif ItemB == 0 then
    SelectMsg(UID, 2, savenum, 6401, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- ok
    RunExchange(UID, 467);
    PromoteKnight(UID,8)
    end
end
--## ROYAL END

if EVENT == 280 then
Knight = CheckKnight(UID)
print(Knight," : Knight");
    if Knight == 1 then -- 클랜 
    ClanGrade = CheckClanGrade(UID)
	print(ClanGrade," : ClanGrade");
        if ClanGrade < 4 then -- 클랜 3등급 이상
        Chief = CheckChief(UID)
		print(Chief," : Chief");
            if Chief == 1 then -- 클랜단장일때 
                SelectMsg(UID, 3, savenum, 4165, NPC, 4157, 281, 4158, 286, 4159, 285, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            else-- 클랜단장 아닐때
            SelectMsg(UID, 2, savenum, 4164, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
            end
        else-- 클랜 3등급 이상 아닐때
        SelectMsg(UID, 2, savenum, 4163, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else-- 클랜 아닐때
    SelectMsg(UID, 2, savenum, 4162, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 281 then
    SelectMsg(UID, 2, savenum, 4166, NPC, 4160, 282, 27, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 282 then
    SelectMsg(UID, 2, savenum, 4167, NPC, 4160, 283, 27, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 283 then
    SelectMsg(UID, 2, savenum, 4168, NPC, 27, 241, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 285 then
-- 명령어 나오면 그걸로 수정해야 될부분
ZoneClanChange(UID, 54, 150, 150) -- 수정했음
end


local ItemA
local ItemB


if EVENT == 286 then
    SelectMsg(UID, 4, 415, 4172, NPC, 4161, 287, 4162, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 287 then
    ItemA = HowmuchItem(UID, 900000000);  --노아
    ItemB = HowmuchItem(UID, 910045000);  -- 켄타목 
    if ItemA < 10000000 then -- 노아
    SelectMsg(UID, 2, savenum, 4170, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif ItemB == 0 then
    SelectMsg(UID, 2, savenum, 4171, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- ok
    RunExchange(UID, 467);
    PromoteKnight(UID,2)
    end
end

-----------------------------------------------------------
-- 기사단 승격 끝 
-----------------------------------------------------------


local Loyalty
-----------------------------------------------------------
-- 기본 국가 기여도 시작
-----------------------------------------------------------

if EVENT == 360 then
Loyalty = CheckLoyalty(UID)
	  if  Loyalty > 100  then -- 기여도가 100이상일때 
	   SelectMsg(UID, 2, savenum, 4155, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	  else-- 기여도가 100이하로 충전 가능할때 
      SelectMsg(UID, 2, savenum, 4156, NPC, 4152, 361, 4153, 363, 4154, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	  end
end

if EVENT == 361 then --500충전 
ITEM_COUNT = HowmuchItem(UID, 900000000);
    if ITEM_COUNT < 1500000 then --노아가 1500000없을때
    SelectMsg(UID, 2, savenum, 4160, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	  else-- 기여도 충전 가능할때 
    SelectMsg(UID, 4, 413, 4157, NPC, 22, 362, 23, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end


if EVENT == 362 then --수락 
    RunExchange(UID, 465);
 end

if EVENT == 363 then --100충전 
ITEM_COUNT = HowmuchItem(UID, 900000000);
    if ITEM_COUNT < 350000 then --노아가 350000없을때
    SelectMsg(UID, 2, savenum, 4161, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	  else-- 기여도 충전 가능할때 
    SelectMsg(UID, 4, 414, 4159, NPC, 22, 364, 23, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 364 then --수락 
    RunExchange(UID, 466);
 end

-----------------------------------------------------------
-- 기본 국가 기여도 끝 ?
-----------------------------------------------------------



-- 0: 목록에 없음
-- 1: 녹봉지급
-- 2: 이미 받음

local Reward

-----------------------------------------------------------
-- 월간 기사 녹봉 시작
-----------------------------------------------------------

if EVENT == 370 then
Reward = RequestPersonalRankReward(UID)
    if  Reward == 0 then -- 목록에 없음
    SelectMsg(UID, 2, savenum, 4153, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif Reward == 2 then-- 이미 받음
    SelectMsg(UID, 2, savenum, 4154, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 녹봉지급
    Ret = 1; 
    end
end

-----------------------------------------------------------
-- 월간 기사 녹봉 끝 ?
-----------------------------------------------------------

-----------------------------------------------------------
-- 전리품 전달 시작
-----------------------------------------------------------

if EVENT == 470 then
Reward = MonthPersonalRankRequestReward(UID)
    if  Reward == 0 then -- 목록에 없음
    SelectMsg(UID, 2, savenum, 4802, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif Reward == 2 then-- 이미 받음
    SelectMsg(UID, 2, savenum, 4803, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 녹봉지급
    Ret = 1; 
    end
end

-----------------------------------------------------------
-- 전리품 전달 끝 
-----------------------------------------------------------


-----------------------------------------------------------
-- 국가 기사의 녹봉 시작
-----------------------------------------------------------
local Reward;

if EVENT == 380 then
Reward = RequestReward(UID)
    if  Reward == 0 then -- 목록에 없음
    SelectMsg(UID, 2, savenum, 4151, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif Reward == 2 then-- 이미 받음
    SelectMsg(UID, 2, savenum, 4152, NPC, 10, 241, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else-- 녹봉지급
    Ret = 1; 
    end
end
-----------------------------------------------------------
-- 국가 기사의 녹봉 끝 ?
-----------------------------------------------------------

return Ret;