-----
-- Script for [Grand Merchant's Daughter] Menissiah in Moradon
-----

-- Globals
pUser = nil
pNpc = nil
bSelectedReward = -1

local CancelButton				= 0 -- could be any event that doesn't exist

local WormSilkSpool				= 110
local WormSilkSpoolRequest		= 111
local WormSilkSpoolAccepted		= 112
local WormSilkSpoolFulfilled	= 120

local WormSilkSpoolMenu			= 280	
local WormSilkSpoolCompleted	= 281

local BandicootTeeth			= 200
local BandicootTeethRequest		= 201
local BandicootTeethAccepted	= 202
local BandicootTeethFulfilled	= 205
local BandicootTeethMenu		= 210
local BandicootTeethMap			= 213
local BandicootTeethCompleted	= 214

-- Map the events to functions
local eventMap = {
	-- Default event for this NPC
	[190]						= HandleNPCSelection,
	
	-- Unknown, possibly not even used.
	[105]						= Quest105,

	-- Also unknown, the only one that works (because there's no text references) is 196
	-- but that shows a map telling you where Menissiah is; the NPC we're talking to. 
	-- Probably not useful in this case.
	[195]						= function() pUser:SelectMsg(1, 102, 195, 28, 196) end,
	[196]						= function()
		pUser:ShowMap(5)
		pUser:SaveEvent(56)
	end,
	[197]						= function() pUser:SelectMsg(1, 102, 197, 29, 196) end,

	----
	-- Worm silk spool quest (level 2)
	----

	-- Worm silk spool quest menu.
	[WormSilkSpool]				= function() pUser:SelectMsg(2, 100, 150, 29, WormSilkSpoolRequest) end,
	-- Do you wish to accept this quest? Fancy new dialog. 
	[WormSilkSpoolRequest]		= function() pUser:SelectMsg(4, 100, 156, 22, WormSilkSpoolAccepted, 23, CancelButton) end, 
	-- Accepted the worm silk spool quest..
	[WormSilkSpoolAccepted]		= function() pUser:SaveEvent(7) end,
	-- Have we completed the silk spool quest?
	[WormSilkSpoolMenu]			= function()
		if (pUser:CheckExistItem(379048000, 3)) then
			pUser:SelectMsg(2, 100, 158, 4006, WormSilkSpoolCompleted, 27, CancelButton)
		else
			pUser:SelectMsg(2, 100, 157, 10, CancelButton)
		end
	end,
	-- Quest requirements have been fulfilled.
	[WormSilkSpoolFulfilled]	= function()
		pUser:SaveEvent(9)
		if (pUser:GetNation() == 1) then
			pUser:SelectMsg(1, 100, 131, 14, CancelButton)
		else
			pUser:SelectMsg(1, 100, 132, 14, CancelButton)
		end
	end,
	
	-- Completed, take the items and finish the quest.
	-- NOTE: Could just be the exchange.
	[WormSilkSpoolCompleted]		= function()
		if (pUser:RobItem(379048000, 3)) then
			pUser:ExpChange(300)
			pUser:GoldGain(500)
			pUser:SaveEvent(8)
		end
	end,

	----
	-- Bandicoot Teeth quest (level 4)
	----
	[BandicootTeeth]			= function() pUser:SelectMsg(2, 102, 200, 29, BandicootTeethRequest) end,
	[BandicootTeethRequest]		= function() pUser:SelectMsg(4, 102, 201, 22, BandicootTeethAccepted, 23, CancelButton) end,
	[BandicootTeethAccepted]	= function() pUser:SaveEvent(57) end,
	[BandicootTeethMenu]		= function()
		if (pUser:CheckExistItem(379078000, 2)) then
			pUser:SelectMsg(2, 102, 212, 4006, BandicootTeethCompleted, 27, CancelButton)
		else
			pUser:SelectMsg(2, 102, 211, 18, BandicootTeethMap)
		end
	end,
	[BandicootTeethMap]			= function() pUser:ShowMap(7) end,
	[BandicootTeethFulfilled]	= function()
	end,
	[BandicootTeethCompleted]	= function() 
		if (pUser:RobItem(379078000, 2)) then
			pUser:ExpChange(340)
			pUser:GoldGain(1500)
			pUser:SaveEvent(58)
		end
	end,
	
	----
	-- "Making antifebriles peletts" quest (level 5)
	-- i.e. Kill Kekoons and bring me back 5 of their gallbladders.
	----
	[300]						= function() pUser:SelectMsg(1, 105, 292, 28, 301) end,
	[301]						= function()
		pUser:ShowMap(5)
		pUser:SaveEvent(93)
	end,
	[302]						= function() pUser:SelectMsg(1, 105, 293, 29, 301) end,
	-- Accept the quest but don't let them select the reward yet.
	[303]						= function() pUser:SelectMsg(2, 105, 294, 29, 304) end, 
	[304]						= function() pUser:SelectMsg(4, 105, 295, 22, 305, 23, 193) end,
	[305]						= function() pUser:SaveEvent(94) end,
	[306]						= function()
		pUser:SaveEvent(96)
		if (pUser:GetNation() == 1) then
			pUser:SelectMsg(1, 105, 299, 32, 307)
		else
			pUser:SelectMsg(1, 105, 300, 4080, 307)
		end
	end,
	[307]						= function() pUser:ShowMap(50) end,
	[308]						= function()
		-- If we have the items, let them select their reward.
		if (pUser:CheckExistItem(379251000, 5)) then
			pUser:SelectMsg(5, 105, 301, 4006, 310, 27, 193) 
		else -- Nope? Where can we find them?
			pUser:SelectMsg(2, 105, 298, 18, 309)
		end
	end,
	[309]						= function() pUser:ShowMap(11) end,
	[310]						= function() 
		if (bSelectedReward < 0 or bSelectedReward > 4) then
			-- TO-DO: Needs an error. Need to log USKO for this.
			-- It should probably even be handled inside CUser::RecvSelectMsg()
			return
		end
		
		if (not pUser:isRoomForItem(389034000, 3)) then
			-- TO-DO: Should probably throw an error in here.
			-- New exchange code is meant to provide errors...
			-- so will have to better look into that.
			return
		end
		
		if (pUser:RobItem(379251000, 5)) then
			local nRewards = 
			{
				330150005, -- Red Pearl Ring (+5 Strength)
				330150015, -- Red Pearl Ring (+5 Health)
				330150025, -- Red Pearl Ring (+5 Dexterity) 
				330150035, -- Red Pearl Ring (+5 Intelligence)
				330150075  -- Red Pearl Ring (+5 Magic Power) 
			}
			
			pUser:GiveItem(nRewards[1+bSelectedReward])
			pUser:GiveItem(389034000, 3) -- 3 x Bezoar
			pUser:ExpChange(1400)
			pUser:GoldGain(3000)
			pUser:SaveEvent(95)
		end
	end,
	
}

function Main(event)
	print("Event: " .. event .. ", selected reward: " .. bSelectedReward)
	local func = eventMap[event]
	if (func and type(func) == "function") then
		func()
	end
end

function HandleNPCSelection()
	-- Lookup available quest (if none, it'll return 0)
	local sQuest = pUser:SearchQuest()
	
	-- Nothing to do, user's completed everything available for them.
	if (sQuest == 0) then
		pUser:SelectMsg(2, -1, 191, 10, CancelButton)
	-- Show main quest list
	elseif (sQuest > 1 and sQuest < 100) then
		pUser:NpcMsg(193)
	-- Handle individual quests
	else
		Main(sQuest)
	end
end

-- Possibly not used
function Quest105()
	pUser:SaveEvent(6)
	if (pUser:GetNation() == 1) then
		pUser:SelectMsg(1, 100, 105, 28, 107)
	else
		pUser:SelectMsg(1, 100, 111, 28, 107)
	end
end

-- Possibly not used
function Quest205()
	pUser:SaveEvent(59)
	if (pUser:GetNation() == 1) then
		pUser:SelectMsg(1, 102, 206, 32, 189)
	else
		pUser:SelectMsg(1, 102, 207, 4080, 189)
	end
end