-----
-- Script for [Coliseum] Artes in Moradon
-----

pUser = nil

function Main(event)
	if (event == 165) then
					BaseMenu()
	elseif (event == 168) then
					Accept()
	elseif (event == 169) then
					Decline()
	end
end

function BaseMenu()
					pUser:SelectMsg(2,-1,4132,4073,168,4074,169)
end

function Accept()
					pUser:ZoneChange(48,133,118)
end

function Decline()
					return
end
