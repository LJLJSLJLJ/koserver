-----
-- Script for [Trainer] Kate in Moradon
-----

pUser = nil
pNpc = nil

function Main(event)
	if (event == 500) then
						BaseMenu()
	elseif (event == 104) then
						UseVoucher()
	elseif (event == 3001) then
						Close()
	elseif (event == 101) then
						FamiliarHatchTrans()
	elseif (event == 102) then
						FamiliarNameChange()
	elseif (event == 103) then
						FamiliarRandom()
	elseif (event == 105) then
						ExchangeVoucherMagicBag()
	elseif (event == 106) then
						ExchangeVoucherAutoLoot()
	end
end

function BaseMenu()
						pUser:SelectMsg(3,-1,4834,4263,101,4264,102,4265,103,4337,104,4199,3001)
end

function UseVoucher()
						pUser:SelectMsg(3,-1,820,4344,105,4345,106,4199,3001)
end

function Close()
						return
end

function FamiliarHatchTrans() -- Some sort of "anvil type" U.I should open where you can either hatch an EGG into a PET or transform it's appearance!
						return
end

function FamiliarNameChange()
	if (pUser:CheckExistItem(800090000)) then
						return  -- Name Change U.I should open where you can change the name of your PET!
	else
						pUser:SelectMsg(2,-1,824,10,3001)
	end
end

function FamiliarRandom() -- Opens up a Shop U.I for your little fluffy one where you can buy milk, bread etc!
						return
end

function ExchangeVoucherMagicBag()
	if (pUser:RobItem(800440000)) then
						pUser:GiveItem(700011001)
	else
						pUser:SelectMsg(2,-1,824,10,3001)
	end
end

function ExchangeVoucherAutoLoot()
	if (pUser:RobItem(800450000)) then
						pUser:GiveItem(700012000)
	else
						pUser:SelectMsg(2,-1,824,10,3001)
	end
end
