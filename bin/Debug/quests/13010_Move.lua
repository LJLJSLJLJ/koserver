-----
-- Script for Move NPC
-----

pUser = nil

function Main(event)
	if (event == 500) then
					BaseMenu()
	elseif (event == 501) then
					Accept()
	elseif (event == 502) then
					Decline()
	end
end

function BaseMenu()
					pUser:SelectMsg(2, -1, 4072, 4071, 501, 4072, 502)
end

function Accept()
					pUser:ZoneChange(21, 758, 476)
end

function Decline()
					return
end
