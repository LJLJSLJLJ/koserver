-- [신관] 이리스
-- 그냥 닫기 168

-- EVENT 는 100번 이상 부터 사용

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC =13015;



-- [신관] 이리스 클릭시 퀘스트 체크  

if EVENT == 165 then


-- 신전이 수정되면 아래 주석들 풀어주세요 

Level = CheckLevel(UID)
if Level > 59 then -- 레벨이 60이상인가 1긍급
SelectMsg(UID, 2, -1, 4134, NPC, 4075, 168, 4076, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
elseif Level >44 and Level < 60 then -- 레벨이 46~59인가?(2등급)
SelectMsg(UID, 2, -1, 4133, NPC, 4075, 170, 4076, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1); 
else
SelectMsg(UID, 2, -1, 4135, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

end

local Time;
local Count;
local ItemA;

if EVENT == 168 then -- 1등급 신전
    Time = CheckMonsterChallengeTime(UID)
    if Time == 3 then -- 1등급 신전이 열림
       Count = CheckMonsterChallengeUserCount(UID)
       if Count < 33 then -- 인원체크
          ItemA = HowmuchItem(UID, 900000000); 
          if ItemA > 100000 then -- 노아체크
          RobItem(UID, 900000000, 100000) --노아 뺏기
          ZoneChange(UID, 55, 150, 150)
         else -- 노아 부족 
         SelectMsg(UID, 2, -1, 4136, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
         end
      else -- 인원 채워짐
      SelectMsg(UID, 2, -1, 4137, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
     end
   else -- 신전이 오픈된 시간이 아닙니다.
	SelectMsg(UID, 2, -1, 4138, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

local StatA;
local StatB;
local StatC;
local StatD;
local StatE;
local Sum;

if EVENT == 170 then -- 2등급 신전 
    Time = CheckMonsterChallengeTime(UID)
    if Time == 2 then -- 2등급 신전이 열림
       Count = CheckMonsterChallengeUserCount(UID)
       if Count < 33 then -- 인원체크
         Class = CheckClass (UID);
         if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2차 전직인가 체크
          SelectMsg(UID, 2, -1, 4139, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);         
         else -- 2차전직 안한 경우
             StatA = CheckStatPoint(UID, 1)
             StatB = CheckStatPoint(UID, 2)
             StatC = CheckStatPoint(UID, 3)
             StatD = CheckStatPoint(UID, 4)
             StatE = CheckStatPoint(UID, 5)
             Sum = StatA+ StatB + StatC+ StatD + StatE 
             if Sum > 476 then -- 2차 전직인가 체크
             SelectMsg(UID, 2, -1, 4139, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);         
            else -- 2차전직 안한 경우 
             ZoneChange(UID, 55, 150, 150)
             end 
         end
      else -- 인원 채워짐
      SelectMsg(UID, 2, -1, 4137, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
     end
   else -- 신전이 오픈된 시간이 아닙니다.
	SelectMsg(UID, 2, -1, 4140, NPC, 10, 169, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   end
end

if EVENT == 169 then -- 1등급 신전 입장
    Ret = 1;
end

