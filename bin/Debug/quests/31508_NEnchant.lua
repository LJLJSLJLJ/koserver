-----
-- Script for [National Enchanter] in Moradon
-----

pUser = nil
pNpc = nil

function Main(event)
	if (event == 100) then
						BaseMenu()
	elseif (event == 7098) then
						VictoryMenu()
	elseif (event == 7099) then
						NoahMenu()
	elseif (event == 7091) then
						ShoutForChargeNoah()
	elseif (event == 7092) then
						FirmWillNoah()
	elseif (event == 7093) then
						EndlessPatienceNoah()
	elseif (event == 7100) then
						ShoutForChargeVictory()
	elseif (event == 7101) then
						FirmWillVictory()
	elseif (event == 7102) then
						EndlessPatienceVictory()
	end
end

function BaseMenu()
						pUser:SelectMsg(3,-1,9138,7098,7098,7099,7099)
end

function VictoryMenu()
	if (pUser:CheckExistItem(900017000)) then
						pUser:SelectMsg(3,-1,9138,7091,7100,7092,7101,7093,7102)
	else
						pUser:NpcMsg(9118)
	end		
end

function NoahMenu()
	if (pUser:hasCoins(53000)) then
						pUser:SelectMsg(3,-1,9138,7091,7091,7092,7092,7093,7093)
	else
						pUser:NpcMsg(9118)
	end					
end

function ShoutForChargeNoah()
		if (pUser:GetLevel() <20) then
				if (not pNpc:CastSkill(pUser,302327)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302327)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		elseif (pUser:GetLevel() <60) then
				if (not pNpc:CastSkill(pUser,302327)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302327)
						pUser:ShowNpcEffect(31033)
						pUser:GoldLose(3000)
						pUser:NpcMsg(9137)
		else
				if (not pNpc:CastSkill(pUser,302327)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302327)
						pUser:ShowNpcEffect(31033)
						pUser:GoldLose(50000)
						pUser:NpcMsg(9137)
		end
end

function FirmWillNoah()
		if (pUser:GetLevel() < 20) then
				if (not pNpc:CastSkill(pUser,302331)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302331)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		elseif (pUser:GetLevel() <60) then
				if (not pNpc:CastSkill(pUser,302332)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302332)
						pUser:ShowNpcEffect(31033)
						pUser:GoldLose(3000)
						pUser:NpcMsg(9137)
		else
				if (not pNpc:CastSkill(pUser,302333)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302333)
						pUser:ShowNpcEffect(31033)
						pUser:GoldLose(50000)
						pUser:NpcMsg(9137)
		end
end

function EndlessPatienceNoah()
		if (pUser:GetLevel() <20) then
				if (not pNpc:CastSkill(pUser,302328)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302328)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		elseif (pUser:GetLevel() <60) then
				if (not pNpc:CastSkill(pUser,302329)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302329)
						pUser:ShowNpcEffect(31033)
						pUser:GoldLose(3000)
						pUser:NpcMsg(9137)
		else
				if (not pNpc:CastSkill(pUser,302330)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302330)
						pUser:ShowNpcEffect(31033)
						pUser:GoldLose(50000)
						pUser:NpcMsg(9137)
		end
end

function ShoutForChargeVictory()
		if (pUser:GetLevel() <20) then
				if (not pNpc:CastSkill(pUser,302327)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302327)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		elseif (pUser:GetLevel() <60) then
				if (not pNpc:CastSkill(pUser,302327)) then
						pUser:NpcMsg(9140)
						return
				end
						pUser:RobItem(900017000,1)
						pNpc:CastSkill(pUser,302327)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		else
				if (not pNpc:CastSkill(pUser,302327)) then
						pUser:NpcMsg(9140)
						return
				end
						pUser:RobItem(900017000,2)
						pNpc:CastSkill(pUser,302327)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		end
end

function FirmWillVictory()
		if (pUser:GetLevel() < 20) then
				if (not pNpc:CastSkill(pUser,302331)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302331)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		elseif (pUser:GetLevel() <60) then
				if (not pNpc:CastSkill(pUser,302332)) then
						pUser:NpcMsg(9140)
						return
				end
						pUser:RobItem(900017000,1)
						pNpc:CastSkill(pUser,302332)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		else
				if (not pNpc:CastSkill(pUser,302333)) then
						pUser:NpcMsg(9140)
						return
				end
						pUser:RobItem(900017000,2)
						pNpc:CastSkill(pUser,302333)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		end
end

function EndlessPatienceVictory()
		if (pUser:GetLevel() <20) then
				if (not pNpc:CastSkill(pUser,302328)) then
						pUser:NpcMsg(9140)
						return
				end
						pNpc:CastSkill(pUser,302328)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		elseif (pUser:GetLevel() <60) then
				if (not pNpc:CastSkill(pUser,302329)) then
						pUser:NpcMsg(9140)
						return
				end
						pUser:RobItem(900017000,1)
						pNpc:CastSkill(pUser,302329)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		else
				if (not pNpc:CastSkill(pUser,302330)) then
						pUser:NpcMsg(9140)
						return
				end
						pUser:RobItem(900017000,2)
						pNpc:CastSkill(pUser,302330)
						pUser:ShowNpcEffect(31033)
						pUser:NpcMsg(9137)
		end
end
