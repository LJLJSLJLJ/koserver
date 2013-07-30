local UserClass;
local QuestNum;
local Ret = 0;
local NPC =13016;


if EVENT == 500 then
	SelectMsg(UID, 3, -1, 4834, NPC, 4263, 101, 4264, 102, 4265, 103, 4337, 104, 4199, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 104 then
	SelectMsg(UID, 3, -1, 820, NPC, 4344, 101, 4345, 102, 4199, 3001, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 3001 then
    Ret = 1;
end


return Ret;