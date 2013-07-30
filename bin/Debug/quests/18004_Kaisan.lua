pUser = nil
pNpc = nil

-- Assign names to our otherwise magic event numbers so that we can make sense of them.
local CancelButton			= 101 -- any event that doesn't exist.
local FirstJobChange		= 404
local DistributeStatPoints	= 408

-- Map the events to functions
local eventMap = {
	-- Default event for this NPC
	[100]						= HandleNPCSelection,

	[400]						= Event400,
	[403]						= Event403,
	[FirstJobChange]			= HandleFirstJobChange,
	[407]						= 
		function()
			pUser:SaveEvent(4070)
			pUser:SelectMsg(2, 407, 4070, 4070, DistributeStatPoints, 10, CancelButton)
		end,
	[DistributeStatPoints]		= function() pUser:StatPointDistribute() end,
	[500]						= function() pUser:SelectMsg(3, 453, 4704, 4238, 501, 4239, 502, 4240, 503) end,
	[501]						= function() pUser:SelectMsg(9, 453, 4704, 4070, DistributeStatPoints, 10, CancelButton) end,
	[502]						= function() pUser:SelectMsg(9, 453, 4704) end,
	[503]						= function() pUser:SelectMsg(9, 453, 4704) end,
}

function Main(event)
	print("Event: " .. event)
	local func = eventMap[event]
	if (func and type(func) == "function") then
		func()
	end
end

-- Default event when clicking on the NPC
function HandleNPCSelection()
	pUser:ShowNpcEffect(31033)
	local sQuest = pUser:SearchQuest()
	if (sQuest == 0) then 
		pUser:SelectMsg(2, -1, 146, 10, 101)
	elseif (sQuest > 1) and (sQuest < 100) then 
		pUser:NpcMsg(147)
	else
		Main(sQuest)
	end
end

function Event400()
	local sClass = pUser:GetClass() % 100
	
	-- If we're not a beginner class (i.e. we haven't job changed or we're mastered),
	-- we don't need to change our job.
	if (sClass > 4) then
		pUser:SelectMsg(2, 406, 4068, 10, CancelButton)
		return
	end

	pUser:SaveEvent(4061)
	if (pUser:GetNation() == 1) then
		pUser:SelectMsg(1, 406, 4062, 4061, CancelButton)
	else
		pUser:SelectMsg(1, 406, 4063, 4061, CancelButton)
	end
end

function Event403()
	-- We need to be level 10 or above for our first job change.
	if (pUser:GetLevel() < 10) then
		pUser:SelectMsg(2, 406, 4068, 10, CancelButton)
		return
	end
	
	-- If we're not a beginner class (i.e. we haven't job changed or we're mastered),
	-- we don't need to change our job.
	local sClass = pUser:GetClass() % 100
	if (sClass > 4) then
		pUser:SelectMsg(2, 406, 4068, 10, CancelButton)
		return
	end

	-- Make sure we have enough coins for a job change.
	if (not pUser:hasCoins(3000)) then
		pUser:SelectMsg(2, 406, 4065, 10, CancelButton)
	else
		pUser:SelectMsg(2, 406, 4064, 4062, FirstJobChange, 4063, CancelButton)
	end
end

function HandleFirstJobChange()
	pUser:SaveEvent(4063)
	pUser:PromoteUserNovice()
	pUser:GoldLose(3000)

	if (pUser:GetNation() == 1) then
		pUser:SelectMsg(1, 406, 4066, 4064, CancelButton)
	else
		pUser:SelectMsg(1, 406, 4067, 4064, CancelButton)
	end
end
