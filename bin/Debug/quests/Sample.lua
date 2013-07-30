-----
-- Sample Lua script.
-----

-- Globals
pUser = nil
pNpc = nil

function Main(event)
	-- Debug
	print(pUser:GetName() .. ": Running event " .. event .. " from NPC " .. pNpc:GetName())

	-- Default event, show menu.
	if (event == 190) then
		DefaultMenu()
	-- Main menu event
	elseif (event == 10) then
		HandleSomeButton()
	end
end

function DefaultMenu()
	-- Sample menu
	pUser:SelectMsg(2,	-- unknown flag
		-1,				-- quest ID
		191,			-- menu header text/type
		11, 10,			-- text | event
		20, 20)
		
	-- Sample new-style menu/dialog (does whatever's needed by the NPC, apparently)
	-- pUser:NpcMsg(193, 16079)

	-- Other sample uses
	-- pUser:GiveItem(910014000, 1) -- give player the Kiss item
	-- pUser:RobItem(910014000, 1) -- take Kiss item from player
	-- pUser:ShowMap(1)
end

function HandleSomeButton()
	pUser:KissUser()
end