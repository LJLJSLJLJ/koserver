#include "stdafx.h"
#include "Map.h"

void CUser::MoveProcess(Packet & pkt)
{
	ASSERT(GetMap() != nullptr);
	if (m_bWarp || isDead()) 
		return;
		
	uint16 will_x, will_z, will_y;
	int16 speed=0;
	float real_x, real_z, real_y;
	uint8 echo;

	pkt >> will_x >> will_z >> will_y >> speed >> echo;
	real_x = will_x/10.0f; real_z = will_z/10.0f; real_y = will_y/10.0f;

	if (!isGM())
	{
		// TO-DO: Handle proper speed checks against server-side amounts.
		// We should also avoid relying on what the client has sent us.
		if (speed > 200)	// What is the signifance of this number? Considering 90 is light feet...
							// We shouldn't be using magic numbers at all here.
		{
			Disconnect();
			return;
		}
	}

	if (!GetMap()->IsValidPosition(real_x, real_z, real_y)) 
		return;

	if (m_oldx != GetX()
		|| m_oldz != GetZ())
	{
		m_oldx = GetX();
		m_oldy = GetY();
		m_oldz = GetZ();
	}

	// TO-DO: Ensure this is checked properly to prevent speedhacking
	SetPosition(real_x, real_y, real_z);

	if (RegisterRegion())
	{
		g_pMain->RegionNpcInfoForMe(this);
		g_pMain->RegionUserInOutForMe(this);
		g_pMain->MerchantUserInOutForMe(this);
	}

	if (m_bInvisibilityType == INVIS_DISPEL_ON_MOVE)
		CMagicProcess::RemoveStealth(this, INVIS_DISPEL_ON_MOVE);

	Packet result(WIZ_MOVE);
	result << GetSocketID() << will_x << will_z << will_y << speed << echo;
	SendToRegion(&result);

	GetMap()->CheckEvent(real_x, real_z, this);

	result.Initialize(AG_USER_MOVE);
	result << GetSocketID() << m_curx << m_curz << m_cury << speed;
	Send_AIServer(&result);
}

void CUser::AddToRegion(int16 new_region_x, int16 new_region_z)
{
	GetRegion()->Remove(this);
	SetRegion(new_region_x, new_region_z);
	GetRegion()->Add(this);
}

void CUser::GetInOut(Packet & result, uint8 bType)
{
	result.Initialize(WIZ_USER_INOUT);
	result << uint16(bType) << GetID();
	if (bType != INOUT_OUT)
		GetUserInfo(result);
}

void CUser::UserInOut(uint8 bType)
{
	if (GetRegion() == nullptr)
		return;

	Packet result;

	if (bType != INOUT_OUT)
		ResetGMVisibility();

	GetInOut(result, bType);

	if (bType == INOUT_OUT)
		GetRegion()->Remove(this);
	else
		GetRegion()->Add(this);

	SendToRegion(&result, this);

	if (bType == INOUT_OUT || !isBlinking())
	{
		result.Initialize(AG_USER_INOUT);
		result.SByte();
		result << bType << GetSocketID() << GetName() << m_curx << m_curz;
		Send_AIServer(&result);
	}
}

void CUser::GetUserInfo(Packet & pkt)
{
	pkt.SByte();
	pkt		<< GetName()
			<< uint16(GetNation()) << GetClanID() << GetFame();

	CKnights * pKnights = g_pMain->GetClanPtr(GetClanID());
	if (pKnights == nullptr)
	{
		pkt	<< uint32(0) << uint16(0) << uint8(0) << uint16(-1) << uint32(0) << uint8(0);
	}
	else
	{
		pkt	<< pKnights->GetAllianceID()
				<< pKnights->m_strName
				<< pKnights->m_byGrade << pKnights->m_byRanking
				<< uint16(pKnights->m_sMarkVersion) // symbol/mark version
				<< uint16(pKnights->m_sCape) // cape ID
				<< pKnights->m_bCapeR << pKnights->m_bCapeG << pKnights->m_bCapeB << uint8(0) // this is stored in 4 bytes after all.
				// not sure what this is, but it (just?) enables the clan symbol on the cape 
				// value in dump was 9, but everything tested seems to behave as equally well...
				// we'll probably have to implement logic to respect requirements.
				<< uint8(1); 
	}

	// There are two event-driven invisibility states; dispel on attack, and dispel on move.
	// These are handled primarily server-side; from memory the client only cares about value 1 (which we class as 'dispel on move').
	// As this is the only place where this flag is actually sent to the client, we'll just convert 'dispel on attack' 
	// back to 'dispel on move' as the client expects.
	uint8 bInvisibilityType = m_bInvisibilityType;
	if (bInvisibilityType != INVIS_NONE)
		bInvisibilityType = INVIS_DISPEL_ON_MOVE;

	pkt	<< GetLevel() << m_bRace << m_sClass
		<< GetSPosX() << GetSPosZ() << GetSPosY()
		<< m_bFace << m_nHair
		<< m_bResHpType << uint32(m_bAbnormalType)
		<< m_bNeedParty
		<< m_bAuthority
		<< m_bPartyLeader // is party leader (bool)
		<< bInvisibilityType // visibility state
		<< uint8(m_teamColour) // team colour (i.e. in soccer, 0=none, 1=blue, 2=red)
		<< m_bIsHidingHelmet // either this is correct and items are super buggy, or it causes baldness. You choose.
		<< m_sDirection // direction 
		<< m_bIsChicken // chicken/beginner flag
		<< m_bRank // king flag
		<< m_bPersonalRank << m_bKnightsRank; // NP ranks (total, monthly)

	uint8 equippedItems[] = 
	{
		BREAST, LEG, HEAD, GLOVE, FOOT, SHOULDER, RIGHTHAND, LEFTHAND,
		CWING, CTOP, CHELMET, CRIGHT, CLEFT
	};

	foreach_array (i, equippedItems) 
	{
		_ITEM_DATA * pItem = GetItem(equippedItems[i]);
		pkt << pItem->nNum << pItem->sDuration << pItem->bFlag;
	}

	pkt << GetZoneID() << uint8(-1) << uint8(-1) << uint16(0) << uint16(0) << uint16(0);
}

void CUser::Rotate(Packet & pkt)
{
	if (isDead())
		return;

	Packet result(WIZ_ROTATE);
	pkt >> m_sDirection;
	result << GetSocketID() << m_sDirection;
	SendToRegion(&result, this);
}

bool CUser::CanChangeZone(C3DMap * pTargetMap, WarpListResponse & errorReason)
{
	// While unofficial, game masters should be allowed to teleport anywhere.
	if (isGM())
		return true;

	// Generic error reason; this should only be checked when the method returns false.
	errorReason = WarpListGenericError;

	// Ensure the user meets the zone's level requirements
	if (GetLevel() < pTargetMap->GetMinLevelReq()
		|| GetLevel() > pTargetMap->GetMaxLevelReq())
	{
		// TO-DO: Implement overrides for zone-specific behaviour (e.g. wars)
		errorReason = WarpListMinLevel;
		return false;
	}

	switch (pTargetMap->GetID())
	{
	case ZONE_ELMORAD:
	case ZONE_KARUS:
		// Users may enter Luferson (1)/El Morad (2) if they are that nation, 
		if (GetNation() == pTargetMap->GetID())
			return true;

		// Users may also enter if there's a war invasion happening in that zone.
		if (GetNation() == KARUS)
			return g_pMain->m_byElmoradOpenFlag;
		else
			return g_pMain->m_byKarusOpenFlag;

	case ZONE_KARUS_ESLANT:
		return GetNation() == KARUS;

	case ZONE_ELMORAD_ESLANT:
		return GetNation() == ELMORAD;

	// Delos (30) may be entered by anybody, unless CSW is started -- in which case, it should only allow members of the clans competing for the castle (right?).
	case ZONE_DELOS: // TO-DO: implement CSW logic
		return true;

	// Bifrost (31) may only be entered if the zone is open by the event. 
	// If it's open, it should only be open for the zone in control of the monument in the first stage. 
	// After that, it's open to both zones (note: this extended logic won't be implemented until we actually implement the event -- #84).
	case ZONE_BIFROST: // TO-DO: implement Bifrost logic
		return true;

	case ZONE_RONARK_LAND:
	case ZONE_ARDREAM:
	case ZONE_RONARK_LAND_BASE:
		// PVP zones such as Ronark Land/Ardream (do we include both?) may only be entered if a war is not started. 
		if (g_pMain->m_byBattleOpen != NO_BATTLE)
		{
			errorReason = WarpListNotDuringWar;
			return false;
		}

		// They may also not be entered if the user has no NP.
		if (GetLoyalty() <= 0)
		{
			errorReason = WarpListNeedNP;
			return false;
		}
		break;

	default:
		// War zones may only be entered if that war zone is active.
		if (pTargetMap->isWarZone())
		{
			if ((ZONE_BATTLE_BASE - pTargetMap->GetID()) != g_pMain->m_byBattleZone)
				return false;
		}
	}

	return true;
}

void CUser::ZoneChange(uint16 sNewZone, float x, float z)
{
	C3DMap * pMap = g_pMain->GetZoneByID(sNewZone);
	if (pMap == nullptr) 
		return;

	WarpListResponse errorReason;
	if (!CanChangeZone(pMap, errorReason))
	{
		Packet result(WIZ_WARP_LIST, uint8(2));

		result << uint8(errorReason);

		if (errorReason == WarpListMinLevel)
			result << pMap->GetMinLevelReq();

		Send(&result);
		return;
	}

	m_bWarp = true;
	m_bZoneChangeFlag = true;

	UserInOut(INOUT_OUT);

	if (sNewZone == ZONE_SNOW_BATTLE)
		SetMaxHp(1);

	if (GetZoneID() != sNewZone)
	{
		SetZoneAbilityChange(sNewZone);

		// Reset the user's anger gauge when leaving the zone
		// Unknown if this is official behaviour, but it's logical.
		if (GetAngerGauge() > 0)
			UpdateAngerGauge(0);

		/* 
			Here we also send a clan packet with subopcode 0x16 (with a byte flag of 2) if war zone/Moradon
			or subopcode 0x17 (with nWarEnemyID) for all else
		*/
#if 0
		if (isInClan())
		{
			CKnights * pKnights = g_pMain->GetClanPtr(GetClanID());
			if (pKnights != nullptr
					&& pKnights->bKnightsWarStarted)
			{
				Packet clanPacket(WIZ_KNIGHTS_PROCESS);
				if (pMap->isWarZone() || sNewZone == ZONE_MORADON)
					clanPacket << uint8(0x17) << uint8(2);
				else 
					clanPacket << uint16(0x16) << uint16(0 /*nWarEnemyID*/);

				Send(&clanPacket);
			}
		}
#endif


		if (sNewZone == ZONE_SNOW_BATTLE)
			SetMaxHp();

		if (isInParty())
			PartyRemove(GetSocketID());

		if (hasRival())
			RemoveRival();

		ResetWindows();
	}

	m_bZone = (uint8) sNewZone; // this is 2 bytes to support the warp data loaded from SMDs. It should not go above a byte, however.
	SetPosition(x, 0.0f, z);
	m_pMap = pMap;

	if (g_pMain->m_nServerNo != pMap->m_nServerNo)
	{
		_ZONE_SERVERINFO *pInfo = g_pMain->m_ServerArray.GetData(pMap->m_nServerNo);
		if (pInfo == nullptr) 
			return;

		UserDataSaveToAgent();

		m_bLogout = 2;	// server change flag
		SendServerChange(pInfo->strServerIP, 2);
		return;
	}
	
	SetRegion(GetNewRegionX(), GetNewRegionZ());

	Packet result(WIZ_ZONE_CHANGE, uint8(ZoneChangeTeleport));
	result << uint16(GetZoneID()) << GetSPosX() << GetSPosZ() << GetSPosY() << g_pMain->m_byOldVictory;
	Send(&result);

	if (!m_bZoneChangeSameZone)
	{
		m_sWhoKilledMe = -1;
		m_iLostExp = 0;
		m_bRegeneType = 0;
		m_tLastRegeneTime = 0;
		m_sBind = -1;
		InitType3();
		InitType4();
		CMagicProcess::CheckExpiredType9Skills(this, true);
		SetUserAbility();
	}	

	result.Initialize(AG_ZONE_CHANGE);
	result << GetSocketID() << GetZoneID();
	Send_AIServer(&result);

	m_bZoneChangeSameZone = false;
	m_bZoneChangeFlag = false;
}

/**
 * @brief	Changes the zone of all party members within the user's zone.
 * 			If the user is not in a party, they should still be teleported.
 *
 * @param	sNewZone	ID of the new zone.
 * @param	x			The x coordinate.
 * @param	z			The z coordinate.
 */
void CUser::ZoneChangeParty(uint16 sNewZone, float x, float z)
{
	_PARTY_GROUP * pParty = g_pMain->GetPartyPtr(GetPartyID());
	if (pParty == nullptr)
		return ZoneChange(sNewZone, x, z);

	for (int i = 0; i < MAX_PARTY_USERS; i++)
	{
		CUser * pUser = g_pMain->GetUserPtr(pParty->uid[i]);
		if (pUser != nullptr 
			&& pUser->GetZoneID() == GetZoneID())
			pUser->ZoneChange(sNewZone, x, z);
	}
}

/**
 * @brief	Changes the zone of all clan members in home/neutral zones (including Eslant).
 * 			If the user is not in a clan, they should not be teleported.
 *
 * @param	sNewZone	ID of the new zone.
 * @param	x			The x coordinate.
 * @param	z			The z coordinate.
 */
void CUser::ZoneChangeClan(uint16 sNewZone, float x, float z)
{
	CKnights * pKnights = g_pMain->GetClanPtr(GetClanID());
	if (pKnights == nullptr)
		return;

	for (int i = 0; i < MAX_CLAN_USERS; i++)
	{
		_KNIGHTS_USER * p = &pKnights->m_arKnightsUser[i];
		CUser * pUser = p->pSession;
		if (p->byUsed && pUser != nullptr
			&& pUser->GetZoneID() < ZONE_DELOS)
			pUser->ZoneChange(sNewZone, x, z);
	}
}

void CUser::Warp(uint16 sPosX, uint16 sPosZ)
{
	ASSERT(GetMap() != nullptr);
	if (m_bWarp)
		return;

	float real_x = sPosX / 10.0f, real_z = sPosZ / 10.0f;
	if (!GetMap()->IsValidPosition(real_x, real_z, 0.0f)) 
	{
		TRACE("Invalid position %f,%f\n", real_x, real_z);
		return;
	}

	Packet result(WIZ_WARP);
	result << sPosX << sPosZ;
	Send(&result);

	UserInOut(INOUT_OUT);

	m_curx = real_x;
	m_curz = real_z;

	SetRegion(GetNewRegionX(), GetNewRegionZ());

	UserInOut(INOUT_WARP);
	g_pMain->UserInOutForMe(this);
	g_pMain->NpcInOutForMe(this);
	g_pMain->MerchantUserInOutForMe(this);

	ResetWindows();
}

void CUser::RecvWarp(Packet & pkt)
{
	uint16 warp_x, warp_z;
	pkt >> warp_x >> warp_z;
	Warp(warp_x, warp_z);	
}

void CUser::RecvZoneChange(Packet & pkt)
{
	if (isDead()) // we also need to make sure we're actually waiting on this request...
		return;

	uint8 opcode = pkt.read<uint8>();
	if (opcode == ZoneChangeLoading)
	{
		g_pMain->UserInOutForMe(this);
		g_pMain->NpcInOutForMe(this);
		g_pMain->MerchantUserInOutForMe(this);

		Packet result(WIZ_ZONE_CHANGE, uint8(ZoneChangeLoaded)); // finalise the zone change
		Send(&result);
	}
	else if (opcode == ZoneChangeLoaded)
	{
		UserInOut(INOUT_RESPAWN);

		// TO-DO: Fix all this up (it's too messy/confusing)
		if (!m_bZoneChangeSameZone)
		{
			BlinkStart();
			RecastSavedMagic();
		}

		m_bZoneChangeFlag = false;
		m_bWarp = false;
	}
}

