#pragma once

#define CONF_GAME_SERVER	"./gameserver.ini"

#define _LISTEN_PORT		15001
#define _UDP_PORT			8888
#define AI_SERVER_PORT		10020
#define CLIENT_SOCKSIZE		100

#define MAX_NPC_SIZE		30

#define MAX_TYPE3_REPEAT    40
#define MAX_TYPE4_BUFF		50

#define MAX_ITEM			28

#define NPC_HAVE_ITEM_LIST	6
#define ZONEITEM_MAX		2100000000
#define COIN_MAX			2100000000
#define LOYALTY_MAX			2100000000

#define MAX_CLASS			26			// ��� MAX
#define MAX_LEVEL			83			// �ְ�...
#define MAX_PLAYER_HP		14000
#define MAX_DAMAGE			32000		// Game uses a signed 2 byte integer, so the limit is technically 32,767. The game, however, caps it at 32,000.

#define MAX_MESSAGE_EVENT			12

///////////////// BBS RELATED //////////////////////////////
#define MAX_BBS_PAGE			22
#define MAX_BBS_MESSAGE			40
#define MAX_BBS_TITLE			20
#define MAX_BBS_POST			500

#define BUY_POST_PRICE			500
#define SELL_POST_PRICE			1000

#define REMOTE_PURCHASE_PRICE	5000
#define BBS_CHECK_TIME			36000

#define BATTLE				3

#define KARUS_ARRAY (KARUS - 1)
#define ELMORAD_ARRAY (ELMORAD - 1)

#define BATTLE_ZONE			101

////////////////////////////////////////////////////////////

// Attack Type
#define DIRECT_ATTACK		0
#define LONG_ATTACK			1
#define MAGIC_ATTACK		2
#define DURATION_ATTACK		3

enum InOutType
{
	INOUT_IN		= 1,
	INOUT_OUT		= 2,
	INOUT_RESPAWN	= 3,
	INOUT_WARP		= 4,
	INOUT_SUMMON	= 5
};

#define BLINK_TIME				(15) // in seconds
#define CLAN_SUMMON_TIME		(180)
#define PLAYER_IDLE_TIME		(300)

// ==================================================================
//	About Map Object
// ==================================================================
#define USER_BAND				0			// Map ��� ��� �ִ�.
#define NPC_BAND				10000		// Map ��� NPC(������)�� �ִ�.
#define INVALID_BAND			30000		// �߸�� ID BAND

#define EVENT_MONSTER			20			// Event monster �� ��

///////////////// snow event define //////////////////////////////
#define SNOW_EVENT_MONEY		2000
#define SNOW_EVENT_SKILL		490043

// Users under level 35 require 3,000 coins to shout.
#define SHOUT_COIN_REQUIREMENT	3000

// Battlezone Announcement
#define BATTLEZONE_OPEN					0x00
#define BATTLEZONE_CLOSE				0x01           
#define DECLARE_WINNER					0x02
#define DECLARE_LOSER					0x03
#define DECLARE_BAN						0x04
#define KARUS_CAPTAIN_NOTIFY			0x05
#define ELMORAD_CAPTAIN_NOTIFY			0x06
#define KARUS_CAPTAIN_DEPRIVE_NOTIFY	0x07
#define ELMORAD_CAPTAIN_DEPRIVE_NOTIFY	0x08
#define SNOW_BATTLEZONE_OPEN			0x09

// Battle define
#define NO_BATTLE				0
#define NATION_BATTLE			1
#define SNOW_BATTLE				2

// Zone IDs
#define ZONE_KARUS				1
#define ZONE_ELMORAD			2
#define ZONE_KARUS_ESLANT		11
#define ZONE_ELMORAD_ESLANT		12
#define ZONE_MORADON			21
#define ZONE_DELOS				30
#define ZONE_BIFROST			31
#define ZONE_ARENA				48
#define ZONE_CAITHAROS_ARENA	54
#define ZONE_FORGOTTEN_TEMPLE	55

#define ZONE_BATTLE_BASE		60

#define ZONE_BATTLE				ZONE_BATTLE_BASE + 1
#define ZONE_BATTLE2			ZONE_BATTLE_BASE + 2
#define ZONE_BATTLE3			ZONE_BATTLE_BASE + 3

#define ZONE_SNOW_BATTLE		111
#define	ZONE_RONARK_LAND		71
#define	ZONE_ARDREAM			72
#define	ZONE_RONARK_LAND_BASE	73

#define ZONE_KROWAZ_DOMINION	75

#define MAX_BATTLE_ZONE_USERS	150

// Zone level requirements (should really be in a database or something...)
#define MIN_LEVEL_ESLANT			60
#define MIN_LEVEL_RONARK_LAND		35 // or 69~83?
#define MIN_LEVEL_ARDREAM			35
#define MAX_LEVEL_ARDREAM			59
#define MIN_LEVEL_RONARK_LAND_BASE	45
#define MAX_LEVEL_RONARK_LAND_BASE	69
#define MIN_LEVEL_KROWAZ_DOMINION	70

// Where to respawn after dying in the Moradon arenas
#define MINI_ARENA_RESPAWN_X		734
#define MINI_ARENA_RESPAWN_Z		428
#define MINI_ARENA_RESPAWN_RADIUS	5

// Standard (pre-squared) range used for party rewards and such.
#define RANGE_50M					(50.0f * 50.0f)

// ID of the Cont Recovery item... shouldn't hardcode this, but seems there's no other way.
#define ITEM_CONT_RECOVERY		800370000

// ID of the "Scroll of Identity" item. At some point we should just pass this code off to a Lua script.
#define ITEM_SCROLL_OF_IDENTITY	800032000

// ID of the "Meat Dumpling" item, given on kills in PVP zones.
#define ITEM_MEAT_DUMPLING		508216000

#define KING_SCEPTER 910074311

// ID of the Seed quest, to be automatically started on first load.
#define STARTER_SEED_QUEST	500

enum UserStatus
{
	USER_STATUS_DOT	= 1,
	USER_STATUS_POISON = 2,
	USER_STATUS_SPEED = 3,
	USER_STATUS_BLIND = 4,
	USER_STATUS_BLACK = 5
};

enum UserStatusBehaviour
{
	USER_STATUS_CURE	= 0,
	USER_STATUS_INFLICT	= 1
};

enum LoyaltyType
{
	LOYALTY_NATIONAL_POINTS = 1,
	LOYALTY_MANNER_POINTS	= 2
};

enum AttributeType
{
	AttributeNone		= 0,
	AttributeFire		= 1,
	AttributeIce		= 2,
	AttributeLightning	= 3
};

typedef union{
	uint16		w;
	uint8		b[2];
} MYSHORT;

typedef union{
	uint64		i;
	uint8		b[8];
} MYINT64;

#define TO_USER(v)	static_cast<CUser *>(v)
#define TO_NPC(v)	static_cast<CNpc *>(v)

#include "../shared/globals.h"