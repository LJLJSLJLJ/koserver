#pragma once

//////////////////// ��� Define ////////////////////
#define KARUWARRIOR		101		// ī�����
#define KARUROGUE			102		// ī��α�
#define KARUWIZARD			103		// ī�縶��
#define KARUPRIEST			104		// ī����
#define BERSERKER			105		// ��Ŀ
#define GUARDIAN			106		// �����
#define HUNTER				107		// ����
#define PENETRATOR			108		// ���Ʈ������
#define SORSERER			109		// �Ҽ���
#define NECROMANCER			110		// ��ũ�θǼ�
#define SHAMAN				111		// ����
#define DARKPRIEST			112		// ��ũ�����Ʈ

#define ELMORWARRRIOR		201		// �������
#define ELMOROGUE			202		// ����α�
#define ELMOWIZARD			203		// ���𸶹�
#define ELMOPRIEST			204		// ������
#define BLADE				205		// ���̵�
#define PROTECTOR			206		// �������
#define RANGER				207		// �����
#define ASSASSIN			208		// ��ؽ�
#define MAGE				209		// ������
#define ENCHANTER			210		// ��þ��
#define CLERIC				211		// Ŭ����
#define DRUID				212		// ����̵�
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
// Race Define
/////////////////////////////////////////////////////
#define KARUS_BIG			1
#define KARUS_MIDDLE		2
#define KARUS_SMALL			3
#define KARUS_WOMAN			4
#define BABARIAN			11
#define ELMORAD_MAN			12
#define ELMORAD_WOMAN		13

// Ÿ�ݺ� ����� //
#define GREAT_SUCCESS			0X01		// �뼺��
#define SUCCESS					0X02		// ����
#define NORMAL					0X03		// ����
#define	FAIL					0X04		// ���� 

enum ItemMovementType
{
	ITEM_INVEN_SLOT			= 1,
	ITEM_SLOT_INVEN			= 2,
	ITEM_INVEN_INVEN		= 3,
	ITEM_SLOT_SLOT			= 4,
	ITEM_INVEN_ZONE			= 5,
	ITEM_ZONE_INVEN			= 6,
	ITEM_INVEN_TO_COSP		= 7,  // Inventory -> Cospre bag
	ITEM_COSP_TO_INVEN		= 8,  // Cospre bag -> Inventory
	ITEM_INVEN_TO_MBAG		= 9,  // Inventory -> Magic bag
	ITEM_MBAG_TO_INVEN		= 10, // Magic bag -> Inventory
	ITEM_MBAG_TO_MBAG		= 11  // Magic bag -> Magic bag
};

enum ItemSlotType
{
	ItemSlot1HEitherHand		= 0,
	ItemSlot1HRightHand			= 1,
	ItemSlot1HLeftHand			= 2,
	ItemSlot2HRightHand			= 3,
	ItemSlot2HLeftHand			= 4,
	ItemSlotPauldron			= 5,
	ItemSlotPads				= 6,
	ItemSlotHelmet				= 7,
	ItemSlotGloves				= 8,
	ItemSlotBoots				= 9,
	ItemSlotEarring				= 10,
	ItemSlotNecklace			= 11,
	ItemSlotRing				= 12,
	ItemSlotShoulder			= 13,
	ItemSlotBelt				= 14,
	ItemSlotBag					= 25,
	ItemSlotCospreGloves		= 100,
	ItemSlotCosprePauldron		= 105,
	ItemSlotCospreHelmet		= 107,
	ItemSlotCospreWings			= 110
};

// Item Weapon Type Define
#define WEAPON_DAGGER			1
#define WEAPON_SWORD			2
#define WEAPON_2H_SWORD			22 // Kind field as-is
#define WEAPON_AXE				3
#define WEAPON_2H_AXE			32 // Kind field as-is
#define WEAPON_MACE				4
#define WEAPON_2H_MACE			42 // Kind field as-is
#define WEAPON_SPEAR			5
#define WEAPON_2H_SPEAR			52 // Kind field as-is
#define WEAPON_SHIELD			6
#define WEAPON_BOW				7
#define WEAPON_LONGBOW			8
#define WEAPON_LAUNCHER			10
#define WEAPON_STAFF			11
#define WEAPON_ARROW			12	// ��ų ���
#define WEAPON_JAVELIN			13	// ��ų ���
#define WEAPON_MACE2			18
#define WEAPON_WORRIOR_AC		21	// ��ų ���
#define WEAPON_LOG_AC			22	// ��ų ���
#define WEAPON_WIZARD_AC		23	// ��ų ���
#define WEAPON_PRIEST_AC		24	// ��ų ���
#define WEAPON_PICKAXE			61	// Unlike the others, this is just the Kind field as-is (not / 10).

#define ITEM_KIND_COSPRE		252

////////////////////////////////////////////////////////////
// User Status //
#define USER_STANDING			0X01		// �� �ִ�.
#define USER_SITDOWN			0X02		// �ɾ� �ִ�.
#define USER_DEAD				0x03		// ��Ŷ�
//#define USER_BLINKING			0x04		// ��� ��Ƴ���!!!

////////////////////////////////////////////////////////////
// Durability Type
#define ATTACK				0x01
#define DEFENCE				0x02
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
// Knights Authority Type
/*
#define CHIEF				0x06
#define VICECHIEF			0x05*/
#define OFFICER				0x04
#define KNIGHT				0x03
//#define TRAINEE				0x02
#define PUNISH				0x01	

#define CHIEF				0x01	// ����
#define VICECHIEF			0x02	// �δ���
#define TRAINEE				0x05	// ���
#define COMMAND_CAPTAIN		100		// ���ֱ���
////////////////////////////////////////////////////////////

#define CLAN_COIN_REQUIREMENT	500000
#define CLAN_LEVEL_REQUIREMENT	20

#define ITEM_GOLD			900000000	// �� ������ ��ȣ...
#define ITEM_NO_TRADE		900000001	// Cannot be traded, sold or stored.

////////////////////////////////////////////////////////////
// EVENT MISCELLANOUS DATA DEFINE
#define ZONE_TRAP_INTERVAL	   1		// Interval is one second (in seconds) right now.
#define ZONE_TRAP_DAMAGE	   10		// HP Damage is 10 for now :)

////////////////////////////////////////////////////////////

#define RIVALRY_DURATION	(180)	// 3 minutes
#define RIVALRY_NP_BONUS	(150)	// 150 additional NP on kill

#define MAX_ANGER_GAUGE		(5)		// Maximum of 5 deaths in a PVP zone to fill your gauge.

////////////////////////////////////////////////////////////
// SKILL POINT DEFINE
#define ORDER_SKILL			0x01
#define MANNER_SKILL		0X02
#define LANGUAGE_SKILL		0x03
#define BATTLE_SKILL		0x04
#define PRO_SKILL1			0x05
#define PRO_SKILL2			0x06
#define PRO_SKILL3			0x07
#define PRO_SKILL4			0x08

enum SkillPointCategory
{
	SkillPointFree		= 0,
	SkillPointCat1		= 5,
	SkillPointCat2		= 6,
	SkillPointCat3		= 7,
	SkillPointMaster	= 8
};

/////////////////////////////////////////////////////////////
// ITEM TYPE DEFINE
#define ITEM_TYPE_FIRE				0x01
#define ITEM_TYPE_COLD				0x02
#define ITEM_TYPE_LIGHTNING			0x03
#define ITEM_TYPE_POISON			0x04
#define ITEM_TYPE_HP_DRAIN			0x05
#define ITEM_TYPE_MP_DAMAGE			0x06
#define ITEM_TYPE_MP_DRAIN			0x07
#define ITEM_TYPE_MIRROR_DAMAGE		0x08

/////////////////////////////////////////////////////////////
// JOB GROUP TYPES
#define GROUP_WARRIOR				1
#define GROUP_ROGUE					2
#define GROUP_MAGE					3
#define GROUP_CLERIC				4
#define GROUP_ATTACK_WARRIOR		5
#define GROUP_DEFENSE_WARRIOR		6
#define GROUP_ARCHERER				7
#define GROUP_ASSASSIN				8
#define GROUP_ATTACK_MAGE			9
#define GROUP_PET_MAGE				10
#define GROUP_HEAL_CLERIC			11
#define GROUP_CURSE_CLERIC			12

//////////////////////////////////////////////////////////////
// USER ABNORMAL STATUS TYPES
enum AbnormalType
{
	ABNORMAL_INVISIBLE		= 0,	// Hides character completely (for GM visibility only).
	ABNORMAL_NORMAL			= 1,	// Shows character. This is the default for players.
	ABNORMAL_GIANT			= 2,	// Enlarges character.
	ABNORMAL_DWARF			= 3,	// Shrinks character.
	ABNORMAL_BLINKING		= 4,	// Forces character to start blinking.
	ABNORMAL_GIANT_TARGET	= 6		// Enlarges character and shows "Hit!" effect.
};

//////////////////////////////////////////////////////////////
// Object Type
#define NORMAL_OBJECT		0
#define SPECIAL_OBJECT		1

//////////////////////////////////////////////////////////////
// REGENE TYPES
#define REGENE_NORMAL		0
#define REGENE_MAGIC		1
#define REGENE_ZONECHANGE	2

struct _CLASS_COEFFICIENT
{
	uint16	sClassNum;
	float	ShortSword;
	float	Sword;
	float	Axe;
	float	Club;
	float	Spear;
	float	Pole;
	float	Staff;
	float	Bow;
	float	HP;
	float	MP;
	float	SP;
	float	AC;
	float	Hitrate;
	float	Evasionrate;
};

// Dropped loot/chest.
#define LOOT_ITEMS	4
struct _LOOT_ITEM
{
	uint32 nItemID;
	uint16 sCount;

	_LOOT_ITEM(uint32 nItemID, uint32 sCount)
	{
		this->nItemID = nItemID;
		this->sCount = sCount;
	}
};

struct _LOOT_BUNDLE
{
	uint32 nBundleID;
	std::vector<_LOOT_ITEM> Items;
	float x, z, y;
	time_t tDropTime;
};

struct	_EXCHANGE_ITEM
{
	uint32	nItemID;
	uint32	nCount;
	uint16	sDurability;
	uint8	bSrcPos;
	uint8	bDstPos;
	uint64	nSerialNum;
};

enum ItemRace
{
	RACE_TRADEABLE_IN_48HR	= 19, // These items can't be traded until 48 hours from the time of creation
	RACE_UNTRADEABLE		= 20  // Cannot be traded or sold.
};

enum SellType
{
	SellTypeNormal		= 0, // sell price is 1/4 of the purchase price
	SellTypeFullPrice	= 1, // sell price is the same as the purchase price
	SellTypeNoRepairs	= 2  // sell price is 1/4 of the purchase price, item cannot be repaired.
};

struct _ITEM_TABLE
{
	uint32	m_iNum;
	uint8	m_bKind;
	uint8	m_bSlot;
	uint8	m_bRace;
	uint8	m_bClass;
	uint16	m_sDamage;
	uint16	m_sDelay;
	uint16	m_sRange;
	uint16	m_sWeight;
	uint16	m_sDuration;
	uint32	m_iBuyPrice;
	uint32	m_iSellPrice;
	int16	m_sAc;
	uint8	m_bCountable;
	uint32	m_iEffect1;
	uint32	m_iEffect2;
	uint8	m_bReqLevel;
	uint8	m_bReqLevelMax;
	uint8	m_bReqRank;
	uint8	m_bReqTitle;
	uint8	m_bReqStr;
	uint8	m_bReqSta;
	uint8	m_bReqDex;
	uint8	m_bReqIntel;
	uint8	m_bReqCha;
	uint8	m_bSellingGroup;
	uint8	m_ItemType;
	uint16	m_sHitrate;
	uint16	m_sEvarate;
	uint16	m_sDaggerAc;
	uint16	m_sSwordAc;
	uint16	m_sMaceAc;
	uint16	m_sAxeAc;
	uint16	m_sSpearAc;
	uint16	m_sBowAc;
	uint8	m_bFireDamage;
	uint8	m_bIceDamage;
	uint8	m_bLightningDamage;
	uint8	m_bPoisonDamage;
	uint8	m_bHPDrain;
	uint8	m_bMPDamage;
	uint8	m_bMPDrain;
	uint8	m_bMirrorDamage;
	int16	m_sStrB;
	int16	m_sStaB;
	int16	m_sDexB;
	int16	m_sIntelB;
	int16	m_sChaB;
	int16	m_MaxHpB;
	int16	m_MaxMpB;
	int16	m_bFireR;
	int16	m_bColdR;
	int16	m_bLightningR;
	int16	m_bMagicR;
	int16	m_bPoisonR;
	int16	m_bCurseR;

	INLINE bool isStackable() { return m_bCountable != 0; }

	INLINE uint8 GetKind() { return m_bKind; }
	INLINE uint8 GetItemGroup() { return m_bKind / 10; }

	INLINE bool isDagger() { return GetItemGroup() == WEAPON_DAGGER; }
	INLINE bool isSword() { return GetItemGroup() == WEAPON_SWORD; }
	INLINE bool is2HSword() { return GetKind() == WEAPON_2H_SWORD; }
	INLINE bool isAxe() { return GetItemGroup() == WEAPON_AXE; }
	INLINE bool is2HAxe() { return GetKind() == WEAPON_2H_AXE; }
	INLINE bool isMace() { return GetItemGroup() == WEAPON_MACE || GetItemGroup() == WEAPON_MACE2; }
	INLINE bool is2HMace() { return GetKind() == WEAPON_2H_MACE || GetItemGroup() == WEAPON_MACE2; }
	INLINE bool isSpear() { return GetItemGroup() == WEAPON_SPEAR; }
	INLINE bool is2HSpear() { return GetKind() == WEAPON_2H_SPEAR; }
	INLINE bool isShield() { return GetItemGroup() == WEAPON_SHIELD; }
	INLINE bool isStaff() { return GetItemGroup() == WEAPON_STAFF; }
	INLINE bool isBow() { return GetItemGroup() == WEAPON_BOW || GetItemGroup() == WEAPON_LONGBOW; }
	INLINE bool isPickaxe() { return GetKind() == WEAPON_PICKAXE; }

	INLINE bool is2Handed() { return m_bSlot == ItemSlot2HLeftHand || m_bSlot == ItemSlot2HRightHand; }
};

struct _ZONE_SERVERINFO
{
	short		sServerNo;
	std::string	strServerIP;
};

struct _HOME_INFO
{
	uint8	bNation;
	uint32	ElmoZoneX;
	uint32	ElmoZoneZ;
	uint8	ElmoZoneLX;
	uint8	ElmoZoneLZ;
	uint32	KarusZoneX;
	uint32	KarusZoneZ;
	uint8	KarusZoneLX;
	uint8	KarusZoneLZ;
	uint32	FreeZoneX;
	uint32	FreeZoneZ;
	uint8	FreeZoneLX;
	uint8	FreeZoneLZ;
	uint32	BattleZoneX;
	uint32	BattleZoneZ;
	uint8	BattleZoneLX;
	uint8	BattleZoneLZ;
};

struct _KNIGHTS_CAPE
{
	uint16	sCapeIndex;
	uint32	nReqCoins;
	uint32	nReqClanPoints;	// clan point requirement
	uint8	byGrade;		// clan grade requirement
	uint8	byRanking;		// clan rank requirement (e.g. royal, accredited, etc)
};

struct _KNIGHTS_ALLIANCE
{
	uint16	sMainAllianceKnights;
	uint16	sSubAllianceKnights;
	uint16	sMercenaryClan_1;
	uint16	sMercenaryClan_2;
};

struct _START_POSITION
{
	uint16	ZoneID;
	uint16	sKarusX;
	uint16	sKarusZ;
	uint16	sElmoradX;
	uint16	sElmoradZ;
	uint16	sKarusGateX;
	uint16	sKarusGateZ;
	uint16	sElmoradGateX;
	uint16	sElmoradGateZ;
	uint8	bRangeX;
	uint8	bRangeZ;
};

struct _KNIGHTS_RATING
{
	uint32 nRank;
	uint16 sClanID;
	uint32 nPoints;
};

struct _USER_RANK
{
	uint16	nRank;  // shIndex for USER_KNIGHTS_RANK
	std::string strUserID[2];
	uint32	nSalary; // nMoney for USER_KNIGHTS_RANK
	uint32	nLoyalty[2]; // nKarusLoyaltyMonthly/nElmoLoyaltyMonthly for USER_PERSONAL_RANK
};

// TO-DO: Rewrite this system to be less script dependent for exchange logic.
// Coin requirements should be in the database, and exchanges should be grouped.
#define ITEMS_IN_EXCHANGE_GROUP 5
struct _ITEM_EXCHANGE
{
	uint32	nIndex;
	uint16	sNpcNum;
	uint8	bRandomFlag;

	uint32	nOriginItemNum[ITEMS_IN_EXCHANGE_GROUP];
	uint16	sOriginItemCount[ITEMS_IN_EXCHANGE_GROUP];

	uint32	nExchangeItemNum[ITEMS_IN_EXCHANGE_GROUP];
	uint16	sExchangeItemCount[ITEMS_IN_EXCHANGE_GROUP];
};

#define MAX_ITEMS_REQ_FOR_UPGRADE 8
struct _ITEM_UPGRADE
{
	uint32	nIndex;
	uint16	sNpcNum;
	int8	bOriginType;
	uint16	sOriginItem;
	uint32	nReqItem[MAX_ITEMS_REQ_FOR_UPGRADE];
	uint32	nReqNoah;
	uint8	bRateType;
	uint16	sGenRate;
	int32	nGiveItem;
};

enum ItemTriggerType
{
	TriggerTypeAttack = 3,
	TriggerTypeDefend = 13
};

struct _ITEM_OP
{
	uint32	nItemID;
	uint8	bTriggerType;
	uint32	nSkillID;
	uint8	bTriggerRate;
};

struct _SET_ITEM
{
	uint32 SetIndex;

	uint16 HPBonus;
	uint16 MPBonus;
	uint16 StrengthBonus;
	uint16 StaminaBonus;
	uint16 DexterityBonus;
	uint16 IntelBonus;
	uint16 CharismaBonus;
	uint16 FlameResistance;
	uint16 GlacierResistance;
	uint16 LightningResistance;
	uint16 PoisonResistance;
	uint16 MagicResistance;
	uint16 CurseResistance;

	uint16 XPBonusPercent;
	uint16 CoinBonusPercent;

	uint16 APBonusPercent;		// +AP% for all classes
	uint16 APBonusClassType;	// defines a specific class for +APBonusClassPercent% to be used against
	uint16 APBonusClassPercent;	// +AP% for APBonusClassType only

	uint16 ACBonus;				// +AC amount for all classes
	uint16 ACBonusClassType;	// defines a specific class for +ACBonusClassPercent% to be used against
	uint16 ACBonusClassPercent;	// +AC% for ACBonusClassType only

	uint16 MaxWeightBonus;
	uint16 NPBonus;
};

struct _QUEST_HELPER
{
	uint32	nIndex;
	uint8	bMessageType;
	uint8	bLevel;
	uint32	nExp;
	uint8	bClass;
	uint8	bNation;
	uint8	bQuestType;
	uint8	bZone;
	uint16	sNpcId;
	uint16	sEventDataIndex;
	int8	bEventStatus;
	uint32	nEventTriggerIndex;
	uint32	nEventCompleteIndex;
	uint32	nExchangeIndex;
	uint32	nEventTalkIndex;
	std::string strLuaFilename;
};

struct _USER_SEAL_ITEM
{
	uint64 nSerialNum;
	uint32 nItemID;
	uint8 bSealType;
};

#define QUEST_MOB_GROUPS		4
#define QUEST_MOBS_PER_GROUP	4
struct _QUEST_MONSTER
{
	uint16	sQuestNum;
	uint16	sNum[QUEST_MOB_GROUPS][QUEST_MOBS_PER_GROUP]; 
	uint16	sCount[QUEST_MOB_GROUPS];

	_QUEST_MONSTER()
	{
		memset(&sCount, 0, sizeof(sCount));
		memset(&sNum, 0, sizeof(sNum));
	}
};

enum SpecialQuestIDs
{
	QUEST_KILL_GROUP1	= 32001,
	QUEST_KILL_GROUP2	= 32002,
	QUEST_KILL_GROUP3	= 32003,
	QUEST_KILL_GROUP4	= 32004,
};

struct _RENTAL_ITEM
{
	uint32	nRentalIndex;
	uint32	nItemID;
	uint16	sDurability;
	uint64	nSerialNum;
	uint8	byRegType;
	uint8	byItemType;
	uint8	byClass;
	uint16	sRentalTime;
	uint32	nRentalMoney;
	std::string strLenderCharID;
	std::string strBorrowerCharID;
};

enum BuffType
{
	BUFF_TYPE_NONE					= 0,
	BUFF_TYPE_HP_MP					= 1,
	BUFF_TYPE_AC					= 2,
	BUFF_TYPE_SIZE					= 3,
	BUFF_TYPE_DAMAGE				= 4,
	BUFF_TYPE_ATTACK_SPEED			= 5,
	BUFF_TYPE_SPEED					= 6,
	BUFF_TYPE_STATS					= 7,
	BUFF_TYPE_RESISTANCES			= 8,
	BUFF_TYPE_ACCURACY				= 9,
	BUFF_TYPE_MAGIC_POWER			= 10,
	BUFF_TYPE_EXPERIENCE			= 11,
	BUFF_TYPE_WEIGHT				= 12,
	BUFF_TYPE_WEAPON_DAMAGE			= 13,
	BUFF_TYPE_WEAPON_AC				= 14,
	BUFF_TYPE_LOYALTY				= 15,
	BUFF_TYPE_NOAH_BONUS			= 16,
	BUFF_TYPE_PREMIUM_MERCHANT		= 17,
	BUFF_TYPE_ATTACK_SPEED_ARMOR	= 18,  // Berserker
	BUFF_TYPE_DAMAGE_DOUBLE			= 19,  // Critical Point
	BUFF_TYPE_DISABLE_TARGETING		= 20,  // Smoke Screen / Light Shock
	BUFF_TYPE_BLIND					= 21,  // Blinding (Strafe)
	BUFF_TYPE_FREEZE				= 22,  // Freezing Distance
	BUFF_TYPE_INSTANT_MAGIC			= 23,  // Instantly Magic
	BUFF_TYPE_DECREASE_RESIST		= 24,  // Minor resist
	BUFF_TYPE_MAGE_ARMOR			= 25,  // Fire / Ice / Lightning Armor
	BUFF_TYPE_PROHIBIT_INVIS		= 26,  // Source Marking
	BUFF_TYPE_RESIS_AND_MAGIC_DMG	= 27,  // Elysian Web
	BUFF_TYPE_TRIPLEAC_HALFSPEED	= 28,  // Wall of Iron
	BUFF_TYPE_BLOCK_CURSE			= 29,  // Counter Curse
	BUFF_TYPE_BLOCK_CURSE_REFLECT	= 30,  // Curse Refraction
	BUFF_TYPE_MANA_ABSORB			= 31,  // Outrage / Frenzy
	BUFF_TYPE_IGNORE_WEAPON			= 32,  // Weapon cancellation
	BUFF_TYPE_VARIOUS_EFFECTS		= 33,  // ... whatever the event item grants.
	BUFF_TYPE_PASSION_OF_SOUL		= 35,  // Passion of the Soul
	BUFF_TYPE_FIRM_DETERMINATION	= 36,  // Firm Determination
	BUFF_TYPE_SPEED2				= 40,  // Cold Wave
	BUFF_TYPE_UNK_EXPERIENCE		= 42,  // unknown buff type, used for something relating to XP.
	BUFF_TYPE_ATTACK_RANGE_ARMOR	= 43,  // Inevitable Murderous
	BUFF_TYPE_MIRROR_DAMAGE_PARTY	= 44,  // Minak's Thorn
	BUFF_TYPE_DAGGER_BOW_DEFENSE	= 45,  // Eskrima
	BUFF_TYPE_LOYALTY_AMOUNT		= 55,  // Santa's Present
	BUFF_TYPE_NO_RECALL				= 150, // "Cannot use against the ones to be summoned"
	BUFF_TYPE_REDUCE_TARGET			= 151, // "Reduction" (reduces target's stats, but enlarges their character to make them easier to attack)
	BUFF_TYPE_SILENCE_TARGET		= 152, // Silences the target to prevent them from using any skills (or potions)
	BUFF_TYPE_NO_POTIONS			= 153, // "No Potion" prevents target from using potions.
	BUFF_TYPE_KAUL_TRANSFORMATION	= 154, // Transforms the target into a Kaul (a pig thing), preventing you from /town'ing or attacking, but increases defense.
	BUFF_TYPE_UNDEAD				= 155, // User becomes undead, increasing defense but preventing the use of potions and converting all health received into damage.
	BUFF_TYPE_UNSIGHT				= 156, // Blocks the caster's sight (not the target's).
	BUFF_TYPE_BLOCK_PHYSICAL_DAMAGE	= 157, // Blocks all physical damage.
	BUFF_TYPE_BLOCK_MAGICAL_DAMAGE	= 158, // Blocks all magical/skill damage.
	BUFF_TYPE_UNK_POTION			= 159, // unknown potion, "Return of the Warrior", "Comeback potion", perhaps some sort of revive?
	BUFF_TYPE_SLEEP					= 160, // Zantman (Sandman)
	BUFF_TYPE_INVISIBILITY_POTION	= 163, // "Unidentified potion"
	BUFF_TYPE_GODS_BLESSING			= 164, // Increases your defense/max HP 
	BUFF_TYPE_HELP_COMPENSATION		= 165, // Compensation for using the help system (to help, ask for help, both?)
};

enum FlyingSantaOrAngel
{
	FLYING_NONE		= 0,
	FLYING_SANTA	= 1,
	FLYING_ANGEL	= 2
};

#include "../shared/database/structs.h"