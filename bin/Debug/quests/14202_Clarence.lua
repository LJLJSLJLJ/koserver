-----
-- Script for [Secret Agent] Clarence in Elmorad (Asga Village)
-----

pUser = nil
pNpc = nil
bSelectedReward = -1

local eventMap = {
	[190] = BaseMenu,
	[191] = HandleNPCSelection,
	[193] = HandleClose,
	[220] = HandleBorderDefendingBattleInfo,
	[231] = HandleBorderDefendingBattleInfo1,
	[221] = HandleBorderDefenceBattleShowMapSaveEvent,
	[222] = HandleSeedMaxMagicShieldQuestPrompt,
	[232] = HandleSeedMaxMagicShieldQuestPrompt1,
	[233] = HandleSeedMaxMagicShieldShowMapSaveEvent,
	[223] = HandleMagicShield,
	[224] = HandleMagicShieldInfo,
	[225] = HandleMagicShieldSaveEvent,
	[226] = HandleSeedMaxMagicShieldFulfilled,
	[228] = HandleMagicShieldCheckRequiredItems,
	[230] = HandleMagicShieldExchange,
	[603] = HandleAsgaBerries,
	[604] = HandleAsgaBerriesDecide,
	[605] = HandleAsgaBerriesAccept,
	[608] = HandleAsgaBerriesRequiredItems,
	[610] = HandleAsgaBerriesExchange,
}

function Main(event)
						print("Event: " .. event .. ", selected reward: " .. bSelectedReward)
						local func = eventMap[event]
	if (func and type(func) == "function") then
						func()
	end
end

function BaseMenu()
						-- pUser:NpcMsg(3825) -- This returns the crazy new NPC menu with buttons, However clicking the buttons does nothing.
						HandleNPCSelection()  -- This bridges/bypasses BaseMenu() with HandleNPCSelection().
end						

function HandleNPCSelection()
	local sQuest = pUser:SearchQuest()
		if (sQuest == 0) then
						pUser:SelectMsg(2, -1, 3825, 10, CancleButton)
		elseif (sQuest > 1 and  sQuest < 100) then
						pUser:NpcMsg(3825)
		else
						Main(sQuest)
		end
end

function HandleClose()
						print("HIT Close!")
						return
end

function HandleAsgaBerries()
						print("HIT AsgaBerries!")
						pUser:SelectMsg(2, 317, 3124, 10, 604)
end

function HandleAsgaBerriesDecide()
						print("HIT AsgaBerriesDecide!")
						pUser:SelectMsg(4, 317, 3125, 22, 605, 23, CancleButton)
end

function HandleAsgaBerriesAccept()
						print("HIT AsgaBerriesAccept!")
						pUser:SaveEvent(3283)
end

function HandleAsgaBerriesRequiredItems()
						print("HIT AsgaBerriesRequiredItems!")
		if (not pUser:CheckExistItem(910082000)) then
						pUser:SelectMsg(2, 317, 3128, 10, CancleButton)
		else
						pUser:SelectMsg(4, 317, 3130, 10, 610, 27, CancleButton)
		end
end

function HandleAsgaBerriesExchange()
						print("HIT AsgaBerriesExchange!")
						pUser:RobItem(910082000)
						pUser:GoldGain(100000)
						pUser:SaveEvent(3286) 
end

function HandleBorderDefendingBattleInfo()
						pUser:SelectMsg(1, 313, 3114, 3013, 231)
end


function HandleBorderDefendingBattleInfo1()
						pUser:SelectMsg(1, 313, 3115, 3003, 221)
end

function HandleBorderDefenceBattleShowMapSaveEvent()
						pUser:ShowMap(306)
						pUser:SaveEvent(3202)
end

function HandleSeedMaxMagicShieldQuestPrompt()
						pUser:SelectMsg(1, 313, 3112, 3013, 232)
end

function HandleSeedMaxMagicShieldQuestPrompt1()
						pUser:SelectMsg(1, 313, 3113, 3003, 233)
end

function HandleSeedMaxMagicShieldShowMapSaveEvent()
						pUser:ShowMap(307)
						pUser:SaveEvent(3202)
end


function HandleMagicShield()
						pUser:SelectMsg(2, 313, 3088, 3000, 224)
end

function HandleMagicShieldInfo()
						pUser:SelectMsg(4, 313, 3089, 22, 225, 23, 193)
end

function HandleMagicShieldSaveEvent()
						pUser:SaveEvent(3203)
end

local NATION = 0

function HandleSeedMaxMagicShieldFulfilled()
						pUser:SaveEvent(3205)
	NATION = pUser:CheckNation(UID)
	if NATION == 1 then
						pUser:SelectMsg(1, 313, 3093, 32, 193)
	else
						pUser:SelectMsg(1, 313, 3094, 32, 193)
	end
end


local ITEM_COUNTA = 0
local ITEM_COUNTB = 0
local ITEM_COUNTC = 0

function HandleMagicShieldCheckRequiredItems()
	ITEM_COUNTA = HowmuchItem(330310014)
	ITEM_COUNTB = HowmuchItem(389075000)
	ITEM_COUNTC = HowmuchItem(900000000)
	if (ITEM_COUNTA  > 0 and ITEM_COUNTB  > 29 and ITEM_COUNTC  > 4999999) then
						pUser:SelectMsg(4, 313, 3095, 14202, 10, 230, 27, 193)
	else
		if  ITEM_COUNTA <= 0 then
						pUser:SelectMsg(2, 313, 3092, 14202, 10, 193)
		elseif  ITEM_COUNTB <= 29 then
						pUser:SelectMsg(2, 313, 3092, 14202, 10, 193)
		else
						pUser:SelectMsg(2, 313, 3092, 14202, 10, 193)
      end   
	end
end


if EVENT == 229 then
   pUser:ShowMap(7)
end

local Check

function HandleMagicShieldExchange()
   Check = pUser:CheckExchange(313)
   if  Check ==1 then
   pUser:RunExchange(313)
   pUser:SaveEvent(3206)
   else
  return
  end	 
end

--[[
--????? ???
--local SHOW_MAP; -- ?? ???? ?? ??? ???

if EVENT == 300 then
  pUser:SelectMsg(1, 314, 3001, 28, 301)
end

if EVENT == 301 then
   pUser:ShowMap(5)
   SaveEvent(3222)
end

if EVENT == 302 then
  pUser:SelectMsg(1, 314, 3002, 28, 301)
end

--????? 311?? ?? 0? 4?? ??

if EVENT == 303 then
  pUser:SelectMsg(2, 314, 3096, 3011, 304)
end

if EVENT == 304 then
  pUser:SelectMsg(4, 314, 3097, 22, 305, 23, 193)
end

if EVENT == 305 then
   SaveEvent(3223)
end

-- ??? ? ??? ? 
local NATION = 0;--?? ??

if EVENT == 306 then
   SaveEvent(3225)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, 314, 3101, 32, 193)
   else -- ????
     pUser:SelectMsg(1, 314, 3102, 21, 193)
   end
end

local ITEM_COUNTA=0;
local ITEM_COUNTB=0;
local ITEM_COUNTC=0;
local RUN_EXCHANGE ;--?? ?? ?? ??? ??? 

if EVENT == 308 then
   ITEM_COUNTA = HowmuchItem(379113000)
   ITEM_COUNTB = HowmuchItem(379201000)
   ITEM_COUNTC = HowmuchItem(379014000)
   if  ITEM_COUNTA  > 4 and  ITEM_COUNTB  > 49 and  ITEM_COUNTC  > 29 then --??? ???? 
     pUser:SelectMsg(4, 314, 3103, 10, 310, 27, 193)
   else -- ??? ???
      if ITEM_COUNTA <= 4 then -- A ?? ???
       pUser:SelectMsg(2, 314, 3100, 10, 193)
      elseif  ITEM_COUNTB <= 49 then -- B ?? ??? 
       pUser:SelectMsg(2, 314, 3100, 10, 193)
      else -- C ?? ???
     pUser:SelectMsg(2, 314, 3100, 10, 193)
      end
    end
end

if EVENT == 309 then
   pUser:ShowMap(7)
end

local Check;

if EVENT == 310 then
   Check = CheckExchange(400)
   if  Check ==1 then
   RunExchange(314)
   SaveEvent(3226)
   else
  Ret = 1;	
  end	 
end

--????? ???
--local SHOW_MAP; -- ?? ???? ?? ??? ???

if EVENT == 400 then
  pUser:SelectMsg(1, 315, 3001, 28, 401)
end

if EVENT == 401 then
   pUser:ShowMap(5)
   SaveEvent(3242)
end

if EVENT == 402 then
  pUser:SelectMsg(1, 315, 3002, 28, 401)
end

--????? 315?? ?? 0? 4?? ??

if EVENT == 403 then
  pUser:SelectMsg(2, 315, 3104, 10, 404)
end

if EVENT == 404 then
  pUser:SelectMsg(4, 315, 3105, 22, 405, 23, 193)
end

if EVENT == 405 then
   SaveEvent(3243)
end

-- ??? ? ??? ? 
local NATION = 0;--?? ??

if EVENT == 406 then
   SaveEvent(3245)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, 315, 3109, 32, 193)
   else -- ????
     pUser:SelectMsg(1, 315, 3110, 21, 193)
   end
end

local ITEM_COUNTA=0;
local ITEM_COUNTB=0;
local ITEM_COUNTC=0;
local RUN_EXCHANGE ;--?? ?? ?? ??? ??? 

if EVENT == 408 then
   ITEM_COUNTA = HowmuchItem(379045000)
   ITEM_COUNTB = HowmuchItem(379042000)
   ITEM_COUNTC = HowmuchItem(379067000)
   if  ITEM_COUNTA  > 19 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 then --??? ???? 
     pUser:SelectMsg(4, 315, 3111, 10, 410, 27, 193)
   else -- ??? ???
      if ITEM_COUNTA <= 19 then -- A ?? ???
       pUser:SelectMsg(2, 315, 3108, 10, 193)
      elseif  ITEM_COUNTB <= 0 then -- B ?? ??? 
       pUser:SelectMsg(2, 315, 3108, 10, 193)
      else -- C ?? ???
       pUser:SelectMsg(2, 315, 3108, 10, 193)
      end
    end
end

if EVENT == 409 then
   pUser:ShowMap(7)
end

local Check;

if EVENT == 410 then
   Check = CheckExchange(315)
   if  Check ==1 then
   RunExchange(315)
   SaveEvent(3246)
   else
  Ret = 1;	
  end	 
end

--???? ???
--local SHOW_MAP; -- ?? ???? ?? ??? ???

if EVENT == 500 then
  pUser:SelectMsg(1, 316, 3112, 28, 1000)
end

if EVENT == 1000 then
  pUser:SelectMsg(1, 316, 3113, 28, 501)
end

if EVENT == 501 then
   pUser:ShowMap(306)
   SaveEvent(3262)
end

if EVENT == 502 then
  pUser:SelectMsg(1, 316, 3114, 28, 1001)
end

if EVENT == 1001 then
  pUser:SelectMsg(1, 316, 3115, 28, 501)
end

--???? 316?? ?? 0? 4?? ??

if EVENT == 503 then
  pUser:SelectMsg(2, 316, 3116, 10, 504)
end

if EVENT == 504 then
  pUser:SelectMsg(4, 316, 3117, 22, 505, 23, 193)
end

if EVENT == 505 then
   SaveEvent(3263)
end

-- ??? ? ??? ? 
local NATION = 0;--?? ??

if EVENT == 506 then
   SaveEvent(3265)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, 316, 3121, 32, 193)
   else -- ????
     pUser:SelectMsg(1, 316, 3122, 21, 193)
   end
end

local ITEM_COUNTA=0;
local ITEM_COUNTB=0;
local ITEM_COUNTC=0;
local ITEM_COUNTD=0;
local RUN_EXCHANGE ;--?? ?? ?? ??? ??? 

if EVENT == 508 then
   ITEM_COUNTA = HowmuchItem(379040000)
   ITEM_COUNTB = HowmuchItem(379041000)
   ITEM_COUNTC = HowmuchItem(379042000)
   ITEM_COUNTD = HowmuchItem(379014000)
   if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0 and  ITEM_COUNTC  > 0 and  ITEM_COUNTD  > 9 then --??? ???? 
     pUser:SelectMsg(4, 316, 3123, 10, 510, 27, 193)
   else -- ??? ???
      if ITEM_COUNTA <= 0 then -- A ?? ???
       pUser:SelectMsg(2, 316, 3120, 10, 193)
      elseif  ITEM_COUNTB <= 0 then -- B ?? ??? 
       pUser:SelectMsg(2, 316, 3120, 10, 193)
      elseif  ITEM_COUNTB <= 0 then -- C ?? ??? 
       pUser:SelectMsg(2, 316, 3120, 10, 193)
      else -- D ?? ???
       pUser:SelectMsg(2, 316, 3120, 10, 193)
      end
    end
end

if EVENT == 509 then
   pUser:ShowMap(7)
end

local Check;

if EVENT == 510 then
   Check = CheckExchange(316)
   if  Check ==1 then
   RunExchange(316)
   SaveEvent(3266)
   else
  Ret = 1;	
  end	 
end

--????? ???
--local SHOW_MAP; -- ?? ???? ?? ??? ???

if EVENT == 600 then
  pUser:SelectMsg(1, 317, 3001, 28, 601)
end

if EVENT == 601 then
   pUser:ShowMap(5)
   SaveEvent(3282)
end

if EVENT == 602 then
  pUser:SelectMsg(1, 317, 3002, 28, 601)
end

--????? 317?? ?? 0? 4?? ??


-- ??? ? ??? ? 
local NATION = 0;--?? ??

if EVENT == 606 then
   SaveEvent(3285)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, 317, 3005, 32, 193)
   else -- ????
     pUser:SelectMsg(1, 317, 3129, 32, 193)
   end
end



function BerriesRequiredItems()
	if (not pUser:CheckExistItem(910082000)) then
						pUser:SelectMsg(2, 317, 3128, 10, 193)
	else
						pUser:SelectMsg(4, 317, 3130, 10, 610, 27, 193)
	end
end

if EVENT == 609 then
   pUser:ShowMap(314)
end

local Check;

function BerriesExchange() -- 610
						pUser:RobItem(910082000)
						pUser:GoldGain(100000)
						pUser:SaveEvent(3286) 
end

--????? ???
--local SHOW_MAP; -- ?? ???? ?? ??? ???

if EVENT == 700 then
  pUser:SelectMsg(1, 318, 3001, 28, 701)
end

if EVENT == 701 then
   pUser:ShowMap(5)
   SaveEvent(3292)
end

if EVENT == 702 then
  pUser:SelectMsg(1, 318, 3002, 28, 701)
end

--????? 318?? ?? 0? 4?? ??

if EVENT == 703 then
  pUser:SelectMsg(2, 318, 3131, 10, 704)
end

if EVENT == 704 then
  pUser:SelectMsg(4, 318, 3132, 22, 705, 23, 193)
end

if EVENT == 705 then
   SaveEvent(3293)
end

-- ??? ? ??? ? 
local NATION = 0;--?? ??

if EVENT == 706 then
   SaveEvent(3295)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, 318, 3136, 3015, 193)
   else -- ????
     pUser:SelectMsg(1, 318, 3006, 3015, 193)
   end
end

local ITEM_COUNT=0;
local RUN_EXCHANGE ;--?? ?? ?? ??? ??? 

if EVENT == 708 then
	ITEM_COUNT = GetMaxExchange(318) --exchange ??? ???? 
      if  ITEM_COUNT == 0 then -- ?? ???
      pUser:SelectMsg(2, 318, 3135, 10, 193)
       else-- ?? ???
      pUser:SelectMsg(4, 318, 3137, 10, 710, 27, 193)
      end
end

if EVENT == 709 then
   pUser:ShowMap(314)
end

local Check;

if EVENT == 710 then
   Check = CheckExchange(400)
   if  Check ==1 then
   min_count = GetMaxExchange(318)
 	RunCountExchange(318, min_count)	
   SaveEvent(3296)
   else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 2? ?? ?? 
--******************************************************--

local NPC = 14202;
local savenum = 408;

-- ???? ??

if EVENT == 530 then
   Class = CheckClass (UID)
   if Class == 7 then -- 2??? ??? ??
   SaveEvent(4099) --helper ?? ?? 
   NATION = CheckNation(UID)
      if NATION == 1 then --??? ?? 
     pUser:SelectMsg(1, savenum, 4094, NPC, 4080, 193)
      else -- ????
     pUser:SelectMsg(1, savenum, 4095, NPC, 4080, 193)
      end
   else -- 2? ??? ???, 1? ??? ?? ??
    Ret = 1;
   end
end

-- ???? 408?? ?? 0? 4?? ??

if EVENT == 532 then   
Level = CheckLevel(UID)
   if Level > 59 then -- ??? 60?????   
   Class = CheckClass (UID)
      if Class == 5 or Class == 7 or Class == 9 or Class == 11 then -- 1? ?? ??? ??
      pUser:SelectMsg(4, savenum, 4098, NPC, 22, 533, 23, 534)
      else --1? ??? ?? ???
      SaveEvent(4101)
     pUser:SelectMsg(2, savenum, 4097, NPC, 10, 193)
      end
   else --??? 60???? 
  pUser:SelectMsg(2, savenum, 4096, NPC, 10, 193)
   end
end

if EVENT == 533 then
   SaveEvent(4100) --???
end

if EVENT == 534 then
   SaveEvent(4103) -- ??? 
end

-- ??? ? ??? ? 
local NATION = 0;--?? ??

if EVENT == 535 then
   SaveEvent(4102)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, savenum, 4101, NPC, 4080, 193)
   else -- ????
     pUser:SelectMsg(1, savenum, 4102, NPC, 4080, 193)
   end
end

-- ???? 408?? ?? 1? 3?? ??

if EVENT == 536 then
   ITEM_COUNTA = HowmuchItem(379241000) --?? ??
   ITEM_COUNTB = HowmuchItem(379236000) -- ??? ????
    if  ITEM_COUNTA  > 0 and  ITEM_COUNTB  > 0  then --??? ???? 
     pUser:SelectMsg(2, savenum, 4103, NPC, 4062, 537, 4063, 193)
    else -- ??? ???
       if ITEM_COUNTA <= 0 then -- A ?? ???
      pUser:SelectMsg(2, savenum, 4099, NPC, 10, 193)
       else -- B ?? ??? 
      pUser:SelectMsg(2, savenum, 4100, NPC, 10, 193)
       end
   end
end

if EVENT == 537 then
   SaveEvent(4101)
   RobItem(379241000, 1)
   RobItem(379236000, 1)
   PromoteUser(UID)
   NATION = CheckNation(UID)
   if NATION == 1 then --??? ?? 
  pUser:SelectMsg(1, savenum, 4092, NPC, 4064, 193)
   else -- ????
  pUser:SelectMsg(1, savenum, 4093, NPC, 4064, 193)
   end
end

--******************************************************--
-- 2? ?? ? 
--******************************************************--
--******************************************************--
-- 70Lv skill - start
--******************************************************--

--seed or misel call

if EVENT == 820 then
  pUser:SelectMsg(1, 52, 3225, 3006, 821)
end

if EVENT == 821 then
   pUser:ShowMap(306)
   SaveEvent(3422)
end

if EVENT == 822 then
  pUser:SelectMsg(1, 52, 3224, 3006, 821)
end

-- 70Lv skill no.52 type 0 or 4

if EVENT == 823 then
   Class = CheckClass (UID)
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2? ?? ??? ?? 
  pUser:SelectMsg(2, 52, 3226, 10, 824)
    else --2? ??? ???? 
  pUser:SelectMsg(2, 52, 4711, 10, 193)
    end
end

if EVENT == 823 then
  pUser:SelectMsg(2, 52, 3226, 10, 824)
end

if EVENT == 824 then
  pUser:SelectMsg(4, 52, 3227, 22, 825, 23, 831)
end

if EVENT == 825 then
   SaveEvent(3423)
  pUser:SelectMsg(2, 52, 3228, 10, 193)
end

if EVENT == 831 then
  pUser:SelectMsg(2, 52, 3229, 10, 193)
end

-- collect all
local NATION = 0;--nation check

if EVENT == 826 then
   SaveEvent(3425)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, 52, 3231, 32, 193)
   else -- ????
     pUser:SelectMsg(1, 52, 3232, 32, 193)
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local RUN_EXCHANGE ;

if EVENT == 828 then
   ITEM_COUNT1 = HowmuchItem(379245000)
   ITEM_COUNT2 = HowmuchItem(379246000)
   ITEM_COUNT3 = HowmuchItem(379064000)
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 0 and ITEM_COUNT3  > 0 then-- ?? ????
     pUser:SelectMsg(4, 52, 3233, 41, 830, 27, 193)
   else
      if ITEM_COUNT1 <= 0 then -- 1?? ???
       pUser:SelectMsg(2, 52, 3230, 10, 193)
      elseif ITEM_COUNT2 <= 0 then -- 2?? ???
        pUser:SelectMsg(2, 52, 3230, 10, 193)
      else -- 3?? ???
        pUser:SelectMsg(2, 52, 3230, 10, 193)
      end
   end
end


local Check;

if EVENT == 830 then
        Check = CheckExchange(330)
        if  Check == 1 then
            Exchange =RunExchange(330)
            if  Exchange ==0 then
            SaveEvent(3424)
            else
            Ret = 1;	
            end	 
        else
        Ret = 1;	
        end	 
end
--******************************************************--
-- 70Lv skill - end
--******************************************************--

--******************************************************--
-- 72Lv skill - start
local savenum = 512;
local NPC = 14202;
--******************************************************--

--seed or misel call

if EVENT == 920 then
  pUser:SelectMsg(1, savenum, 5122, NPC, 3006, 921)
end
--??

if EVENT == 921 then
   pUser:ShowMap(306)
   SaveEvent(5125)
end

if EVENT == 922 then
  pUser:SelectMsg(1, savenum, 5123, NPC, 3006, 921)
end
--??

--  type 0 or 4

if EVENT == 923 then
   Class = CheckClass (UID)
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2? ?? ??? ?? 
   pUser:SelectMsg(2, savenum, 5125, NPC, 10, 924)
    else --2? ??????? 
   pUser:SelectMsg(2, savenum, 5124, NPC, 10, 193)
   end
end

if EVENT == 924 then
  pUser:SelectMsg(4, savenum, 5126, NPC, 22, 925, 23, 931)
end

if EVENT == 925 then
   SaveEvent(5126)
  pUser:SelectMsg(2, savenum, 5127, NPC, 10, 193)
end

if EVENT == 931 then
  pUser:SelectMsg(2, savenum, 5128, NPC, 10, 193)
end

-- collect all
local NATION = 0;--nation check

if EVENT == 926 then
   SaveEvent(5128)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, savenum, 5130, NPC, 32, 193)
   else -- ????
     pUser:SelectMsg(1, savenum, 5131, NPC, 32, 193)
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 928 then
   ITEM_COUNT1 = HowmuchItem(379241000)
   ITEM_COUNT2 = HowmuchItem(379236000)
   ITEM_COUNT3 = HowmuchItem(900000000)
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- ?? ????
     pUser:SelectMsg(4, savenum, 5132, NPC, 41, 930, 27, 193)
   else
      if ITEM_COUNT1 <= 0 then -- 1?? ???
       pUser:SelectMsg(2, savenum, 5129, NPC, 10, 193)
      elseif ITEM_COUNT2 <= 0 then -- 2?? ???
        pUser:SelectMsg(2, savenum, 5129, NPC, 10, 193)
      elseif ITEM_COUNT3 <= 0 then -- 3?? ???
        pUser:SelectMsg(2, savenum, 5129, NPC, 10, 193)
      else -- 4?? ???
        pUser:SelectMsg(2, savenum, 5129, NPC, 10, 193)
      end
   end
end


local Check;

if EVENT == 930 then
   Check = CheckExchange(522)
   if  Check == 1 then
   Exchange =RunExchange(522)
        if  Exchange ==0 then
        SaveEvent(5127)
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 72Lv skill - end
--******************************************************--

--******************************************************--
-- 75Lv skill - start
local savenum = 513;
--******************************************************--

--seed or misel call

if EVENT == 1020 then
  pUser:SelectMsg(1, savenum, 5133, NPC, 3006, 1021)
end
--??

if EVENT == 1021 then
   pUser:ShowMap(306)
   SaveEvent(5137)
end

if EVENT == 1022 then
  pUser:SelectMsg(1, savenum, 5134, NPC, 3006, 1021)
end
--??

--  type 0 or 4

if EVENT == 1023 then
   Class = CheckClass (UID)
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2? ?? ??? ?? 
   pUser:SelectMsg(2, savenum, 5136, NPC, 10, 1024)
    else --2? ??????? 
   pUser:SelectMsg(2, savenum, 5135, NPC, 10, 193)
   end
end

if EVENT == 1024 then
  pUser:SelectMsg(4, savenum, 5137, NPC, 22, 1025, 23, 1031)
end

if EVENT == 1025 then
   SaveEvent(5138)
  pUser:SelectMsg(2, savenum, 5138, NPC, 10, 193)
end

if EVENT == 1031 then
  pUser:SelectMsg(2, savenum, 5139, NPC, 10, 193)
end

-- collect all
local NATION = 0;--nation check

if EVENT == 1026 then
   SaveEvent(5140)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, savenum, 5141, NPC, 32, 193)
   else -- ????
     pUser:SelectMsg(1, savenum, 5142, NPC, 32, 193)
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 1028 then
   ITEM_COUNT1 = HowmuchItem(379246000)
   ITEM_COUNT2 = HowmuchItem(379236000)
   ITEM_COUNT3 = HowmuchItem(900000000)
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- ?? ????
     pUser:SelectMsg(4, savenum, 5143, NPC, 41, 1030, 27, 193)
   else
      if ITEM_COUNT1 <= 0 then -- 1?? ???
       pUser:SelectMsg(2, savenum, 5140, NPC, 10, 193)
      elseif ITEM_COUNT2 <= 0 then -- 2?? ???
        pUser:SelectMsg(2, savenum, 5140, NPC, 10, 193)
      elseif ITEM_COUNT3 <= 0 then -- 3?? ???
        pUser:SelectMsg(2, savenum, 5140, NPC, 10, 193)
      else -- 4?? ???
        pUser:SelectMsg(2, savenum, 5140, NPC, 10, 193)
      end
   end
end


local Check;

if EVENT == 1030 then
   Check = CheckExchange(523)
   if  Check == 1 then
   Exchange =RunExchange(523)
        if  Exchange ==0 then
        SaveEvent(5139)
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 75Lv skill - end
--******************************************************--

--******************************************************--
-- 80Lv skill - start
local savenum = 514;
--******************************************************--

--seed or misel call

if EVENT == 1120 then
  pUser:SelectMsg(1, savenum, 5144, NPC, 3006, 1121)
end
--??

if EVENT == 1121 then
   pUser:ShowMap(306)
   SaveEvent(5149)
end

if EVENT == 1122 then
  pUser:SelectMsg(1, savenum, 5145, NPC, 3006, 1121)
end
--??

--  type 0 or 4

if EVENT == 1123 then
   Class = CheckClass (UID)
    if Class == 6 or Class == 8 or Class == 10 or Class == 12 then -- 2? ?? ??? ?? 
   pUser:SelectMsg(2, savenum, 5147, NPC, 10, 1124)
    else --2? ??????? 
   pUser:SelectMsg(2, savenum, 5146, NPC, 10, 193)
   end
end

if EVENT == 1124 then
  pUser:SelectMsg(4, savenum, 5148, NPC, 22, 1125, 23, 1131)
end

if EVENT == 1125 then
   SaveEvent(5150)
  pUser:SelectMsg(2, savenum, 5149, NPC, 10, 193)
end

if EVENT == 1131 then
  pUser:SelectMsg(2, savenum, 5150, NPC, 10, 193)
end

-- collect all
local NATION = 0;--nation check

if EVENT == 1126 then
   SaveEvent(5152)
   NATION = CheckNation(UID)
   if NATION == 1 then -- ??? ??
     pUser:SelectMsg(1, savenum, 5152, NPC, 32, 193)
   else -- ????
     pUser:SelectMsg(1, savenum, 5153, NPC, 32, 193)
   end
end

local ITEM_COUNT1=0;
local ITEM_COUNT2=0;
local ITEM_COUNT3=0;
local ITEM_COUNT4=0;
local RUN_EXCHANGE ;

if EVENT == 1128 then
   ITEM_COUNT1 = HowmuchItem(379245000)
   ITEM_COUNT2 = HowmuchItem(379236000)
   ITEM_COUNT3 = HowmuchItem(900000000)
   if ITEM_COUNT1  > 0 and ITEM_COUNT2  > 2 and ITEM_COUNT3 > 9999999 then-- ?? ????
     pUser:SelectMsg(4, savenum, 5154, NPC, 41, 1130, 27, 193)
   else
      if ITEM_COUNT1 <= 0 then -- 1?? ???
       pUser:SelectMsg(2, savenum, 5151, NPC, 10, 193)
      elseif ITEM_COUNT2 <= 0 then -- 2?? ???
        pUser:SelectMsg(2, savenum, 5151, NPC, 10, 193)
      elseif ITEM_COUNT3 <= 0 then -- 3?? ???
        pUser:SelectMsg(2, savenum, 5151, NPC, 10, 193)
      else -- 4?? ???
        pUser:SelectMsg(2, savenum, 5151, NPC, 10, 193)
      end
   end
end


local Check;

if EVENT == 1130 then
   Check = CheckExchange(524)
   if  Check == 1 then
   Exchange =RunExchange(524)
        if  Exchange ==0 then
        SaveEvent(5151)
        else
        Ret = 1;	
        end	 
  else
  Ret = 1;	
  end	 
end

--******************************************************--
-- 80Lv skill - end
--******************************************************--



return Ret;
]]
