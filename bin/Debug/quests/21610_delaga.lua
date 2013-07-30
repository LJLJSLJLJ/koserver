-----
-- Script for [Knight Clerk] Delaga in Luferson Castle
-----

pUser = nil
pNpc = nil

function Main(event)
	if (event == 240) then
						BaseMenu()
	elseif (event == 241) then
						Close()
	elseif (event == 100) then
						KnightPrivileges()
	elseif (event == 110) then
						AcreditedTest()
	elseif (event == 111) then
						AcreditedTestStory()
	elseif (event == 112) then
						AcreditedTestStory1()
	elseif (event == 113) then
						AcreditedTestStory2()
	elseif (event == 114) then
						AcreditedRequiredItems()
	elseif (event == 115) then
						AcreditedTakeTest()
	elseif (event == 116) then
						AcreditedPromote()
	elseif (event == 120) then
						RoyalTest()
	elseif (event == 121) then
						RoyalTestStory()
	elseif (event == 122) then
						RoyalTestStory1()
	elseif (event == 123) then
						RoyalTestStory2()
	elseif (event == 124) then
						RoyalRequiredItems()
	elseif (event == 125) then
						RoyalTakeTest()
	elseif (event == 126) then
						RoyalPromote()
	elseif (event == 280) then
						TrainingTest()
	elseif (event == 281) then
						TrainingStory()
	elseif (event == 282) then
						TrainingStory1()
	elseif (event == 283) then
						TrainingStory2()
	elseif (event == 285) then					
						TrainingTakeTest() 
	elseif (event == 286) then					
						TrainingRequiredItems()
	elseif (event == 287) then				
						TrainingPromote()
	elseif (event == 360) then
						BuyLoyalty()
	elseif (event == 361) then
						Cont500()
	elseif (event == 362) then
						Cont500Exchange()
	elseif (event == 363) then
						Cont100()
	elseif (event == 364) then
						Cont100Exchange()
	elseif (event == 370) then
						RequestPersonalRankReward()
	elseif (event == 380) then
						RequestReward()
	end
end

function BaseMenu()
						pUser:SelectMsg(3,-1,4150,4150,100,4151,360,4155,370,4156,380,4154,241)
end

function Close()
						return
end

function KnightPrivileges()
						pUser:SelectMsg(3,-1,4150,4333,280,4334,110,4335,120,4154,241)
end

function AcreditedTest()
	if (pUser:GetClanRank() == 2) then
						print(pUser:GetClanRank()," : Knight")
		if (pUser:GetClanGrade() == 1) then
						print(pUser:GetClanGrade()," : ClanGrade")
			if (pUser:isClanLeader()) then
						print(pUser:isClanLeader()," : Chief")
						pUser:SelectMsg(3,-1,6393,4157,111,4158,114,4159,115)
			else
						pUser:SelectMsg(2,-1,6384,10,241)
			end
		else
						pUser:SelectMsg(2,-1,6385,10,241)
		end
	else
						pUser:SelectMsg(2,-1,6386,10,241)
	end
end

function AcreditedTestStory()
						pUser:SelectMsg(2,-1,6387,4160,112,27,241)
end

function AcreditedTestStory1()
						pUser:SelectMsg(2,-1,6388,4160,113,27,241)
end

function AcreditedTestStory2()
						pUser:SelectMsg(2,-1,6389,27,241)
end

function AcreditedRequiredItems()
						pUser:SelectMsg(4,953,6390,4161,116,4162,241)
end

function AcreditedTakeTest()
						pUser:ZoneChangeClan(93,444,350)
end

function AcreditedPromote()
	if (pUser:hasCoins(10000000)) then
		if (pUser:CheckExistItem(389221000)) then
						pUser:GoldLose(10000000)
						pUser:RobItem(389221000)
						pUser:PromoteKnight(3)
		else
						pUser:SelectMsg(2,-1,6392,10,241)
		end
	else
						pUser:SelectMsg(2,-1,6391,10,241)
	end
end

function RoyalTest()
	if (pUser:GetClanRank() == 7) then
						print(pUser:GetClanRank()," : Knight")
		if(pUser:isClanLeader()) then
						print(pUser:isClanLeader()," : Chief")
						pUser:SelectMsg(3, -1, 6392, 4157, 121, 4158, 124, 4159, 125)
		else
						pUser:SelectMsg(2, -1, 6393, 10, 241)
		end
	else
						pUser:SelectMsg(2, -1, 6395, 10, 241)
	end
end

function RoyalTestStory()
						pUser:SelectMsg(2, -1, 6396, 4160, 122, 27, 241)
end

function RoyalTestStory1()
						pUser:SelectMsg(2, -1, 6397, 4160, 123, 27, 241)
end

function RoyalTestStory2()
						pUser:SelectMsg(2, -1, 6398, 27, 241)
end

function RoyalRequiredItems()
						pUser:SelectMsg(4, 954, 6399, 4161, 126, 4162, 241)
end

function RoyalTakeTest()
						pUser:ZoneChangeClan(94, 110, 20)
end

function RoyalPromote()
	if (pUser:hasCoins(10000000)) then
		if (pUser:CheckExistItem(389222000)) then
						pUser:GoldLose(10000000)
						pUser:RobItem(389222000)
						pUser:PromoteKnight(8)
		else
						pUser:SelectMsg(2, -1, 6400, 10, 241)
		end
	else
						pUser:SelectMsg(2, -1, 6401, 10, 241)
	end
end

function TrainingTest()
	if (pUser:GetClanRank() == 1) then
						print(pUser:GetClanRank()," : Knight")
		if (pUser:GetClanGrade() < 4) then
						print(pUser:GetClanGrade()," : ClanGrade")
			if (pUser:isClanLeader()) then
						print(pUser:isClanLeader()," : Chief")
						pUser:SelectMsg(3, -1, 4165, 4157, 281, 4158, 286, 4159, 285)
			else
						pUser:SelectMsg(2, -1, 4164, 10, 241)
            end
		else
						pUser:SelectMsg(2, -1, 4163, 10, 241)
        end
	else
						pUser:SelectMsg(2, -1, 4162, 10, 241)
	end
end

function TrainingStory()
						pUser:SelectMsg(2, -1, 4166, 4160, 282, 27, 241)
end

function TrainingStory1()
						pUser:SelectMsg(2, -1, 4167, 4160, 283, 27, 241)
end

function TrainingStory2()
						pUser:SelectMsg(2, -1, 4168, 27, 241)
end

function TrainingTakeTest()
						pUser:ZoneChangeClan(54, 150, 150)
end

function TrainingRequiredItems()
						pUser:SelectMsg(4, 415, 4172, 4161, 287, 4162, 241)
end

function TrainingPromote()
	if (pUser:hasCoins(10000000)) then
		if (pUser:CheckExistItem(910045000)) then
						pUser:GoldLose(10000000)
						pUser:RobItem(910045000)
						pUser:PromoteKnight(2)
		else
						pUser:SelectMsg(2, -1, 4170, 10, 241)
		end
	else
						pUser:SelectMsg(2, -1, 4171, 10, 241)

	end
end

function BuyLoyalty()
	if (pUser:hasLoyalty(100)) then
						pUser:SelectMsg(2, -1, 4155, 10, 241)
	else
						pUser:SelectMsg(2, -1, 4156, 4152, 361, 4153, 363, 4154, 241)
	end
end

function Cont500()
	if (not pUser:hasCoins(1500000)) then
						pUser:SelectMsg(2, -1, 4160, 10, 241)
	else
						pUser:SelectMsg(4, 413, 4157, 22, 362, 23, 241)
    end
end

function Cont500Exchange()
						pUser:GoldLose(1500000)
						pUser:GiveLoyalty(500)
end

function Cont100()
	if (not pUser:hasCoins(350000)) then
						pUser:SelectMsg(2, -1, 4161, 10, 241)
	else
						pUser:SelectMsg(4, 414, 4159, 22, 364, 23, 241)
	end
end

function Cont100Exchange()
						pUser:GoldLose(350000)
						pUser:GiveLoyalty(100)
end

function RequestPersonalRankReward() -- Needs LUA function.
	if (pUser:RequestPersonalRankReward() == 0) then
						pUser:SelectMsg(2, -1, 4153, 10, 241)
	elseif (pUser:RequestPersonalRankReward() == 2) then
						pUser:SelectMsg(2, -1, 4154, 10, 241)
	else
						return -- a function to claim the monthly knight stipend.
	end
end

--[[ event 470
function MonthPersonalRankRequestReward() -- Needs LUA function however it was not implemented in 1886 "officially" it seems.
	if (pUser:MonthPersonalRankRequestReward() == 0) then
						pUser:SelectMsg(2, -1, 4802, 10, 241)
	elseif (pUser:MonthPersonalRankRequestReward() == 2) then
						pUser:SelectMsg(2, -1, 4803, 10, 241)
	else
						return -- a function to claim MonthPersonalRankRequestReward.
	end
end
]]

function RequestReward() -- Needs LUA function.
	if (pUser:RequestReward() == 0) then
						pUser:SelectMsg(2, -1, 4151, 10, 241)
	elseif (pUser:RequestReward() == 2) then
						pUser:SelectMsg(2, -1, 4152, 10, 241)
	else
						return -- a function to claim the daily national knight stipend.
	end
end
