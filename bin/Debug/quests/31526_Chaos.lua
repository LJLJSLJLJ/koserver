-----
-- Script for [White Shadow Captain] Sirin in Moradon
-----

pUser = nil
pNpc = nil

function Main(event)
	if (event == 100) then
						BaseMenu()
	elseif (event == 3001) then
						Guide()
	elseif (event == 3002) then
						DailyDistributionMap()
	elseif (event == 3003) then
						ExchangeMapExchangeCoupon()
	elseif (event == 3004) then
						ExchangeRewardWing()
	elseif (event == 3005) then
						ExchangeEmblemChaos()
	end
end

function BaseMenu()
						pUser:SelectMsg(3,
										-1,
										9264, -- Greetings! I'm Sirin.
										7143,3001, -- [Guide] Chaos Battle.
										7139,3002, -- [Daily Distribution] Map of Chaos.
										7116,3003, -- [Exchange] Map of Chaos Exchange Coupon.
										7117,3004, -- [Exchange / Special] Reward Wing.
										7149,3005) -- [Exchange] Emblem of Chaos.
end

function Guide()
						pUser:NpcMsg(31526)
end

function DailyDistributionMap()
						return -- Function to check weather of not pUser has obtained the distributed Map of Chaos for the day.
end

function ExchangeMapExchangeCoupon()
						return
end

function ExchangeRewardWing()
						return
end

function ExchangeEmblemChaos()
						return
end
