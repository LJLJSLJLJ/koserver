#include "stdafx.h"
#include "Map.h"
#ifdef EBENEZER
#	include "EbenezerDlg.h"
#	include "MagicInstance.h"
#else
#	include "../AIServer/ServerDlg.h"
#	include "../AIServer/Npc.h"
#	include "../AIServer/User.h"
#endif
#include <cfloat>

Unit::Unit(UnitType unitType) 
	: m_pMap(nullptr), m_pRegion(nullptr), m_sRegionX(0), m_sRegionZ(0), m_unitType(unitType)
{
	Initialize();
}

void Unit::Initialize()
{
	m_pMap = nullptr;
	m_pRegion = nullptr;

	SetPosition(0.0f, 0.0f, 0.0f);
	m_bLevel = 0;
	m_bNation = 0;

	m_sTotalHit = 0;
	m_sTotalAc = 0;
	m_fTotalHitrate = 0.0f;
	m_fTotalEvasionrate = 0.0f;

	m_bResistanceBonus = 0;
	m_sFireR = m_sColdR = m_sLightningR = m_sMagicR = m_sDiseaseR = m_sPoisonR = 0;
	m_sDaggerR = m_sSwordR = m_sAxeR = m_sMaceR = m_sSpearR = m_sBowR = 0;		
	m_byDaggerRAmount = m_byBowRAmount = 100;

	FastGuard lock(m_equippedItemBonusLock);
	m_equippedItemBonuses.clear();

	m_bCanStealth = true;
	m_bReflectArmorType = 0;
	m_bIsBlinded = false;
	m_bCanUseSkills = m_bCanUsePotions = m_bCanTeleport = true;
	m_bInstantCast = false;
	m_bIsUndead = m_bIsKaul = false;

	m_bBlockPhysical = m_bBlockMagic = false;
	m_bBlockCurses = m_bReflectCurses = false;
	m_bMirrorDamage = false;
	m_byMirrorAmount = 0;

	m_sAttackSpeedAmount = 100;		// this is for the duration spells Type 4
	m_bSpeedAmount = 100;
	m_sACAmount = 0;
	m_sACPercent = 100;
	m_bAttackAmount = 100;
	m_sMagicAttackAmount = 0;
	m_sMaxHPAmount = m_sMaxMPAmount = 0;
	m_bHitRateAmount = 100;
	m_sAvoidRateAmount = 100;
	m_bAddFireR = m_bAddColdR = m_bAddLightningR = 0;
	m_bAddMagicR = m_bAddDiseaseR = m_bAddPoisonR = 0;
	m_bPctFireR = m_bPctColdR = m_bPctLightningR = 100;
	m_bPctMagicR = m_bPctDiseaseR = m_bPctPoisonR = 100;
	m_bMagicDamageReduction = 100;
	m_bManaAbsorb = 0;
	m_bRadiusAmount = 0;
	m_buffCount = 0;

	InitType3();
	InitType4(true);
}

/* 
NOTE: Due to KO messiness, we can really only calculate a 2D distance/
There are a lot of instances where the y (height level, in this case) coord isn't set,
which understandably screws things up a lot.
*/
// Calculate the distance between 2 2D points.
float Unit::GetDistance(float fx, float fz)
{
	return GetDistance(GetX(), GetZ(), fx, fz);
}

// Calculate the 2D distance between Units.
float Unit::GetDistance(Unit * pTarget)
{
	ASSERT(pTarget != nullptr);
	if (GetZoneID() != pTarget->GetZoneID())
		return -FLT_MAX;

	return GetDistance(pTarget->GetX(), pTarget->GetZ());
}

float Unit::GetDistanceSqrt(Unit * pTarget)
{
	ASSERT(pTarget != nullptr);
	if (GetZoneID() != pTarget->GetZoneID())
		return -FLT_MAX;

	return sqrtf(GetDistance(pTarget->GetX(), pTarget->GetZ()));
}

// Check to see if the Unit is in 2D range of another Unit.
// Range MUST be squared already.
bool Unit::isInRange(Unit * pTarget, float fSquaredRange)
{
	return (GetDistance(pTarget) <= fSquaredRange);
}

// Check to see if we're in the 2D range of the specified coordinates.
// Range MUST be squared already.
bool Unit::isInRange(float fx, float fz, float fSquaredRange)
{
	return (GetDistance(fx, fz) <= fSquaredRange);
}

// Check to see if the Unit is in 2D range of another Unit.
// Range must NOT be squared already.
// This is less preferable to the more common precalculated range.
bool Unit::isInRangeSlow(Unit * pTarget, float fNonSquaredRange)
{
	return isInRange(pTarget, pow(fNonSquaredRange, 2.0f));
}

// Check to see if the Unit is in 2D range of the specified coordinates.
// Range must NOT be squared already.
// This is less preferable to the more common precalculated range.
bool Unit::isInRangeSlow(float fx, float fz, float fNonSquaredRange)
{
	return isInRange(fx, fz, pow(fNonSquaredRange, 2.0f));
}

float Unit::GetDistance(float fStartX, float fStartZ, float fEndX, float fEndZ)
{
	return pow(fStartX - fEndX, 2.0f) + pow(fStartZ - fEndZ, 2.0f);
}

bool Unit::isInRange(float fStartX, float fStartZ, float fEndX, float fEndZ, float fSquaredRange)
{
	return (GetDistance(fStartX, fStartZ, fEndX, fEndZ) <= fSquaredRange);
}

bool Unit::isInRangeSlow(float fStartX, float fStartZ, float fEndX, float fEndZ, float fNonSquaredRange)
{
	return isInRange(fStartX, fStartZ, fEndX, fEndZ, pow(fNonSquaredRange, 2.0f));
}

#ifdef EBENEZER
void Unit::SetRegion(uint16 x /*= -1*/, uint16 z /*= -1*/) 
{
	m_sRegionX = x; m_sRegionZ = z; 
	m_pRegion = m_pMap->GetRegion(x, z); // TO-DO: Clean this up
}

bool Unit::RegisterRegion()
{
	uint16 
		new_region_x = GetNewRegionX(), new_region_z = GetNewRegionZ(), 
		old_region_x = GetRegionX(),	old_region_z = GetRegionZ();

	if (GetRegion() == nullptr
		|| (old_region_x == new_region_x && old_region_z == new_region_z))
		return false;

	AddToRegion(new_region_x, new_region_z);

	RemoveRegion(old_region_x - new_region_x, old_region_z - new_region_z);
	InsertRegion(new_region_x - old_region_x, new_region_z - old_region_z);	

	return true;
}

void Unit::RemoveRegion(int16 del_x, int16 del_z)
{
	ASSERT(GetMap() != nullptr);

	Packet result;
	GetInOut(result, INOUT_OUT);
	g_pMain->Send_OldRegions(&result, del_x, del_z, GetMap(), GetRegionX(), GetRegionZ());
}

void Unit::InsertRegion(int16 insert_x, int16 insert_z)
{
	ASSERT(GetMap() != nullptr);

	Packet result;
	GetInOut(result, INOUT_IN);
	g_pMain->Send_NewRegions(&result, insert_x, insert_z, GetMap(), GetRegionX(), GetRegionZ());
}
#endif

/* These should not be declared here, but it's necessary until the AI server better shares unit code */

/**
* @brief	Calculates damage for players attacking either monsters/NPCs or other players.
*
* @param	pTarget			Target unit.
* @param	pSkill			The skill used in the attack, if applicable..
* @param	bPreviewOnly	true to preview the damage only and not apply any item bonuses.
* 							Used by AI logic to determine who to target (by checking who deals the most damage).
*
* @return	The damage.
*/
short CUser::GetDamage(Unit *pTarget, _MAGIC_TABLE *pSkill /*= nullptr*/, bool bPreviewOnly /*= false*/)
{
	/*
	This seems identical to users attacking NPCs/monsters.
	The only differences are:
	- GetACDamage() is not called
	- the resulting damage is not divided by 3.
	*/
	int32 damage = 0;
	int random = 0;
	int32 temp_hit = 0, temp_ac = 0, temp_ap = 0, temp_hit_B = 0;
	uint8 result;

	if (pTarget == nullptr || pTarget->isDead())
		return -1;

	// Trigger item procs
	if (pTarget->isPlayer()
		&& !bPreviewOnly)
	{
		OnAttack(pTarget, AttackTypePhysical);
		pTarget->OnDefend(this, AttackTypePhysical);
	}

	temp_ac = pTarget->m_sTotalAc;

	// A unit's total AC shouldn't ever go below 0.
	if ((temp_ac - pTarget->m_sACAmount) <= 0)
		temp_ac = 0;
	else
		temp_ac += pTarget->m_sACAmount;

	temp_ap = m_sTotalHit * m_bAttackAmount;

#ifdef EBENEZER
	// Apply player vs player AC/AP bonuses.
	if (pTarget->isPlayer())
	{
		CUser * pTUser = TO_USER(pTarget);	// NOTE: using a = a*v instead of a *= v because the compiler assumes different 
		// types being multiplied, which results in these calcs not behaving correctly.

		// adjust player AP by percent, for skills like "Critical Point"
		temp_ap = temp_ap * m_bPlayerAttackAmount / 100; 

		// Now handle class-specific AC/AP bonuses.
		temp_ac = temp_ac * (100 + pTUser->m_byAcClassBonusAmount[GetBaseClassType() - 1]) / 100;
		temp_ap = temp_ap * (100 + m_byAPClassBonusAmount[pTUser->GetBaseClassType() - 1]) / 100;
	}
#endif

	// Allow for complete physical damage blocks.
	// NOTE: Unsure if we need to count skill usage as magic damage or if we 
	// should only block that in explicit magic damage skills (CMagicProcess::GetMagicDamage()).
	if (pTarget->m_bBlockPhysical)
		return 0;

	temp_hit_B = (int)((temp_ap * 200 / 100) / (temp_ac + 240));

	// Skill/arrow hit.    
	if (pSkill != nullptr)
	{
		// SKILL HIT! YEAH!	                                
		if (pSkill->bType[0] == 1)
		{
			_MAGIC_TYPE1 *pType1 = g_pMain->m_Magictype1Array.GetData(pSkill->iNum);
			if (pType1 == nullptr)
				return -1;     	                                

			// Non-relative hit.
			if (pType1->bHitType)
			{
				result = (pType1->sHitRate <= myrand(0, 100) ? FAIL : SUCCESS);
			}
			// Relative hit.
			else 
			{
				result = GetHitRate((m_fTotalHitrate / pTarget->m_fTotalEvasionrate) * (pType1->sHitRate / 100.0f));			
			}

			temp_hit = (int32)(temp_hit_B * (pType1->sHit / 100.0f));
		}
		// ARROW HIT! YEAH!
		else if (pSkill->bType[0] == 2)
		{
			_MAGIC_TYPE2 *pType2 = g_pMain->m_Magictype2Array.GetData(pSkill->iNum);
			if (pType2 == nullptr)
				return -1; 

			// Non-relative/Penetration hit.
			if (pType2->bHitType == 1 || pType2->bHitType == 2)
			{
				result = (pType2->sHitRate <= myrand(0, 100) ? FAIL : SUCCESS);
			}
			// Relative hit/Arc hit.
			else   
			{
				result = GetHitRate((m_fTotalHitrate / pTarget->m_fTotalEvasionrate) * (pType2->sHitRate / 100.0f));
			}

			if (pType2->bHitType == 1 /* || pType2->bHitType == 2 */) 
				temp_hit = (int32)(m_sTotalHit * m_bAttackAmount * (pType2->sAddDamage / 100.0f) / 100);
			else
				temp_hit = (int32)(temp_hit_B * (pType2->sAddDamage / 100.0f));
		}
	}
	// Normal hit (R attack)     
	else 
	{
		temp_hit = temp_ap / 100;
		result = GetHitRate(m_fTotalHitrate / pTarget->m_fTotalEvasionrate);
	}


	switch (result)
	{						// 1. Magical item damage....
	case GREAT_SUCCESS:
	case SUCCESS:
	case NORMAL:
		if (pSkill != nullptr)
		{	 // Skill Hit.
			damage = temp_hit;
			random = myrand(0, damage);
			if (pSkill->bType[0] == 1)
				damage = (short)((temp_hit + 0.3f * random) + 0.99f);
			else
				damage = (short)(((temp_hit * 0.6f) + 1.0f * random) + 0.99f);
		}
		else
		{	// Normal Hit.	
			damage = temp_hit_B;
			random = myrand(0, damage);
			damage = (short)((0.85f * temp_hit_B) + 0.3f * random);

			if (isGM() && !pTarget->isPlayer())
			{
				damage = 30000;
				return damage;
			}
		}		

		break;
	}	

	// Apply item bonuses
	damage = GetMagicDamage(damage, pTarget, bPreviewOnly);

	// These two only apply to players
	if (pTarget->isPlayer())
	{
		damage = GetACDamage(damage, pTarget);		// 3. Additional AC calculation....	

		// Give increased damage in war zones (as per official 1.298~1.325)
		// This may need to be revised to use the last nation to win the war, or more accurately, 
		// the nation that last won the war 3 times in a row (whether official behaves this way now is unknown).
		if (GetMap()->isWarZone())
			damage /= 2;
		else
			damage /= 3;
	}

	// Enforce damage cap
	if (damage > MAX_DAMAGE)
		damage = MAX_DAMAGE;

	return damage;
}

#if EBENEZER
void CUser::OnAttack(Unit * pTarget, AttackType attackType)
{
	if (!pTarget->isPlayer()
		|| attackType == AttackTypeMagic)
		return;

	// Trigger weapon procs for the attacker on attack
	static const uint8 itemSlots[] = { RIGHTHAND, LEFTHAND };
	foreach_array (i, itemSlots)
	{
		// If we hit an applicable weapon, don't try proc'ing the other weapon. 
		// It is only ever meant to proc on the dominant weapon.
		if (TriggerProcItem(itemSlots[i], pTarget, TriggerTypeAttack))
			break;
	}
}

void CUser::OnDefend(Unit * pAttacker, AttackType attackType)
{
	if (!pAttacker->isPlayer())
		return;

	// Trigger defensive procs for the defender when being attacked
	static const uint8 itemSlots[] = { LEFTHAND };
	foreach_array (i, itemSlots)
		TriggerProcItem(itemSlots[i], pAttacker, TriggerTypeDefend);
}

/**
* @brief	Trigger item procs.
*
* @param	bSlot	   	Slot of item to attempt to proc.
* @param	pTarget	   	Target of the skill (attacker/defender depending on the proc type).
* @param	triggerType	Which type of item to proc (offensive/defensive).
*
* @return	true if there's an applicable item to proc, false if not.
*/
bool CUser::TriggerProcItem(uint8 bSlot, Unit * pTarget, ItemTriggerType triggerType)
{
	// Don't proc weapon skills if our weapon is disabled.
	if (triggerType == TriggerTypeAttack && isWeaponsDisabled()) 
		return false;

	// Ensure there's an item in this slot, 
	_ITEM_DATA * pItem = GetItem(bSlot);
	if (pItem == nullptr
		// and that it doesn't need to be repaired.
			|| pItem->sDuration == 0)
			return false; // not an applicable item

	// Ensure that this item has an attached proc skill in the table
	_ITEM_OP * pData = g_pMain->m_ItemOpArray.GetData(pItem->nNum);
	if (pData == nullptr // no skill to proc
		|| pData->bTriggerType != triggerType) // don't use an offensive proc when we're defending (or vice versa)
		return false; // not an applicable item

	// At this point, we have determined there is an applicable item in the slot.
	// Should it proc now? (note: CheckPercent() checks out of 1000)
	if (!CheckPercent(pData->bTriggerRate * 10))
		return true; // it is an applicable item, it just didn't proc. No need to proc subsequent items.

	MagicInstance instance;

	instance.bIsItemProc = true;
	instance.sCasterID = GetID();
	instance.sTargetID = pTarget->GetID();
	instance.nSkillID = pData->nSkillID;

	// For AOE skills such as "Splash", the AOE should be focus on the target.
	instance.sData[0] = (uint16) pTarget->GetX();
	instance.sData[2] = (uint16) pTarget->GetZ();

	instance.Run();
	return true; // it is an applicable item, and it proc'd. No need to proc subsequent items.
}
#endif

short CNpc::GetDamage(Unit *pTarget, _MAGIC_TABLE *pSkill /*= nullptr*/, bool bPreviewOnly /*= false*/) 
{
	if (pTarget->isPlayer())
		return GetDamage(TO_USER(pTarget), pSkill);

	return GetDamage(TO_NPC(pTarget), pSkill);
}

/**
* @brief	Calculates damage for monsters/NPCs attacking players.
*
* @param	pTarget			Target player.
* @param	pSkill			The skill (not used here).
* @param	bPreviewOnly	true to preview the damage only and not apply any item bonuses (not used here).
*
* @return	The damage.
*/
short CNpc::GetDamage(CUser *pTarget, _MAGIC_TABLE *pSkill /*= nullptr*/, bool bPreviewOnly /*= false*/) 
{
	if (pTarget == nullptr)
		return 0;

	int32 damage = 0, HitB;
	int32 Ac = pTarget->m_sTotalAc;

	// A unit's total AC shouldn't ever go below 0.
	if ((Ac - pTarget->m_sACAmount) <= 0)
		Ac = 0;
	else
		Ac += pTarget->m_sACAmount;

	Ac = TO_USER(pTarget)->m_sItemAc + pTarget->GetLevel() 
		+ (Ac - pTarget->GetLevel() - TO_USER(pTarget)->m_sItemAc);
	HitB = (int)((m_sTotalHit * m_bAttackAmount * 200 / 100) / (Ac + 240));

	if (HitB <= 0)
		return 0;

	uint8 result = GetHitRate(m_fTotalHitrate / pTarget->m_fTotalEvasionrate);	
	switch (result)
	{
	case GREAT_SUCCESS:
		damage = (int)(0.3f * myrand(0, HitB));
		damage += (short)(0.85f * (float)HitB);
		damage = (damage * 3) / 2;
		break;

	case SUCCESS:
	case NORMAL:
		damage = (int)(0.3f * myrand(0, HitB));
		damage += (short)(0.85f * (float)HitB);
		break;
	}

	int nMaxDamage = (int)(2.6 * m_sTotalHit);
	if (damage > nMaxDamage)	
		damage = nMaxDamage;

	// Enforce overall damage cap
	if (damage > MAX_DAMAGE)
		damage = MAX_DAMAGE;

	return (short) damage;
}

/**
* @brief	Calculates damage for monsters/NPCs attacking other monsters/NPCs.
*
* @param	pTarget			Target NPC/monster.
* @param	pSkill			The skill (not used here).
* @param	bPreviewOnly	true to preview the damage only and not apply any item bonuses (not used here).
*
* @return	The damage.
*/
short CNpc::GetDamage(CNpc *pTarget, _MAGIC_TABLE *pSkill /*= nullptr*/, bool bPreviewOnly /*= false*/) 
{
	if (pTarget == nullptr)
		return 0;

	short damage = 0, Hit = m_sTotalHit, Ac = pTarget->m_sTotalAc;
	uint8 result = GetHitRate(m_fTotalHitrate / pTarget->m_fTotalEvasionrate);
	switch (result)
	{
	case GREAT_SUCCESS:
		damage = (short)(0.6 * Hit);
		if (damage <= 0)
		{
			damage = 0;
			break;
		}
		damage = myrand(0, damage);
		damage += (short)(0.7 * Hit);
		break;

	case SUCCESS:
	case NORMAL:
		if (Hit - Ac > 0)
		{
			damage = (short)(0.6 * (Hit - Ac));
			if (damage <= 0)
			{
				damage = 0;
				break;
			}
			damage = myrand(0, damage);
			damage += (short)(0.7 * (Hit - Ac));
		}
		break;
	}

	// Enforce damage cap
	if (damage > MAX_DAMAGE)
		damage = MAX_DAMAGE;

	return damage;	
}

short Unit::GetMagicDamage(int damage, Unit *pTarget, bool bPreviewOnly /*= false*/)
{
	if (pTarget->isDead())
		return 0;

	FastGuard lock(m_equippedItemBonusLock);
	int16 sReflectDamage = 0;

	// Check each item that has a bonus effect.
	foreach (itr, m_equippedItemBonuses)
	{
		// Each item can support multiple bonuses.
		// Thus, we must handle each bonus.
		foreach (bonusItr, itr->second)
		{
			short total_r = 0, temp_damage = 0;
			uint8 bType = bonusItr->first;
			int16 sAmount = bonusItr->second;

			bool bIsDrain = (bType >= ITEM_TYPE_HP_DRAIN && bType <= ITEM_TYPE_MP_DRAIN);
			if (bIsDrain)
				temp_damage = damage * sAmount / 100;

			switch (bType)
			{
			case ITEM_TYPE_FIRE: 
				total_r = (pTarget->m_sFireR + pTarget->m_bAddFireR) * pTarget->m_bPctFireR / 100;
				break;
			case ITEM_TYPE_COLD:
				total_r = (pTarget->m_sColdR + pTarget->m_bAddColdR) * pTarget->m_bPctColdR / 100;
				break;
			case ITEM_TYPE_LIGHTNING:
				total_r = (pTarget->m_sLightningR + pTarget->m_bAddLightningR) * pTarget->m_bPctLightningR / 100;
				break;
			case ITEM_TYPE_HP_DRAIN:
				HpChange(temp_damage);			
				break;
			case ITEM_TYPE_MP_DAMAGE:
				pTarget->MSpChange(-temp_damage);
				break;
			case ITEM_TYPE_MP_DRAIN:
				MSpChange(temp_damage);
				break;
			case ITEM_TYPE_MIRROR_DAMAGE:
				sReflectDamage += sAmount;
				break;
			}

			total_r += pTarget->m_bResistanceBonus;
			if (!bIsDrain)
			{
				if (total_r > 200) 
					total_r = 200;

				temp_damage = sAmount - sAmount * total_r / 200;
				damage += temp_damage;
			}
		}
	}

	// If any items have have damage reflection enabled, we should reflect this back to the client.
	// NOTE: This should only apply to shields, so it should only ever apply once.
	// We do this here to ensure it's taking into account the total calculated damage.
	if (sReflectDamage > 0)
	{
		short temp_damage = damage * sReflectDamage / 100;
		HpChange(-temp_damage);
	}

	return damage;
}

short Unit::GetACDamage(int damage, Unit *pTarget)
{
	// This isn't applicable to NPCs.
	if (!isPlayer() || !pTarget->isPlayer())
		return damage;

#ifdef EBENEZER
	if (pTarget->isDead())
		return 0;

	CUser * pUser  = TO_USER(this);
	if (pUser->isWeaponsDisabled())
		return damage;

	uint8 weaponSlots[] = { RIGHTHAND, LEFTHAND };

	foreach_array (slot, weaponSlots)
	{
		_ITEM_TABLE * pWeapon = pUser->GetItemPrototype(slot);
		if (pWeapon == nullptr)
			continue;

		if (pWeapon->isDagger())
			damage -= damage * pTarget->m_sDaggerR / 200;
		else if (pWeapon->isSword())
			damage -= damage * pTarget->m_sSwordR / 200;
		else if (pWeapon->isAxe())
			damage -= damage * pTarget->m_sAxeR / 200;
		else if (pWeapon->isMace())
			damage -= damage * pTarget->m_sMaceR / 200;
		else if (pWeapon->isSpear())
			damage -= damage * pTarget->m_sSpearR / 200;
		else if (pWeapon->isBow())
			damage -= damage * pTarget->m_sBowR / 200;
	}

#endif
	return damage;
}

uint8 Unit::GetHitRate(float rate)
{
	int random = myrand(1, 10000);
	if (rate >= 5.0f)
	{
		if (random >= 1 && random <= 3500)
			return GREAT_SUCCESS;
		else if (random >= 3501 && random <= 7500)
			return SUCCESS;
		else if (random >= 7501 && random <= 9800)
			return NORMAL;
	}
	else if (rate < 5.0f && rate >= 3.0f)
	{
		if (random >= 1 && random <= 2500)
			return GREAT_SUCCESS;
		else if (random >= 2501 && random <= 6000)
			return SUCCESS;
		else if (random >= 6001 && random <= 9600)
			return NORMAL;
	}
	else if (rate < 3.0f && rate >= 2.0f)
	{
		if (random >= 1 && random <= 2000)
			return GREAT_SUCCESS;
		else if (random >= 2001 && random <= 5000)
			return SUCCESS;
		else if (random >= 5001 && random <= 9400)
			return NORMAL;
	}
	else if (rate < 2.0f && rate >= 1.25f)
	{
		if (random >= 1 && random <= 1500)
			return GREAT_SUCCESS;
		else if (random >= 1501 && random <= 4000)
			return SUCCESS;
		else if (random >= 4001 && random <= 9200)
			return NORMAL;
	}
	else if (rate < 1.25f && rate >= 0.8f)
	{
		if (random >= 1 && random <= 1000)
			return GREAT_SUCCESS;
		else if (random >= 1001 && random <= 3000)
			return SUCCESS;
		else if (random >= 3001 && random <= 9000)
			return NORMAL;
	}	
	else if (rate < 0.8f && rate >= 0.5f)
	{
		if (random >= 1 && random <= 800)
			return GREAT_SUCCESS;
		else if (random >= 801 && random <= 2500)
			return SUCCESS;
		else if (random >= 2501 && random <= 8000)
			return NORMAL;
	}
	else if (rate < 0.5f && rate >= 0.33f)
	{
		if (random >= 1 && random <= 600)
			return GREAT_SUCCESS;
		else if (random >= 601 && random <= 2000)
			return SUCCESS;
		else if (random >= 2001 && random <= 7000)
			return NORMAL;
	}
	else if (rate < 0.33f && rate >= 0.2f)
	{
		if (random >= 1 && random <= 400)
			return GREAT_SUCCESS;
		else if (random >= 401 && random <= 1500)
			return SUCCESS;
		else if (random >= 1501 && random <= 6000)
			return NORMAL;
	}
	else
	{
		if (random >= 1 && random <= 200)
			return GREAT_SUCCESS;
		else if (random >= 201 && random <= 1000)
			return SUCCESS;
		else if (random >= 1001 && random <= 5000)
			return NORMAL;
	}

	return FAIL;
}

#ifdef EBENEZER
void Unit::SendToRegion(Packet *result)
{
	g_pMain->Send_Region(result, GetMap(), GetRegionX(), GetRegionZ());
}

// Handle it here so that we don't need to ref the class everywhere
void Unit::Send_AIServer(Packet *result)
{
	g_pMain->Send_AIServer(result);
}
#endif

void Unit::InitType3()
{
	for (int i = 0; i < MAX_TYPE3_REPEAT; i++)
		m_durationalSkills[i].Reset();

	m_bType3Flag = false;
}

void Unit::InitType4(bool bRemoveSavedMagic /*= false*/)
{
	// Remove all buffs that should not be recast.
	FastGuard lock(m_buffLock);
	Type4BuffMap buffMap = m_buffMap; // copy the map

	for (auto itr = buffMap.begin(); itr != buffMap.end(); itr++)
	{
#ifdef EBENEZER
		CMagicProcess::RemoveType4Buff(itr->first, this, bRemoveSavedMagic);
#endif
	}
}

/**
* @brief	Determine if this unit is basically able to attack the specified unit.
* 			This should only be called to handle the minimal shared logic between
* 			NPCs and players. 
* 			
* 			You should use the more appropriate CUser or CNpc specialization.
*
* @param	pTarget	Target for the attack.
*
* @return	true if we can attack, false if not.
*/
bool Unit::CanAttack(Unit * pTarget)
{
	if (pTarget == nullptr)
		return false;

	// Units cannot attack units in different zones.
	if (GetZoneID() != pTarget->GetZoneID())
		return false;

	// We cannot attack our target if we are incapacitated 
	// (should include debuffs & being blinded)
	if (isIncapacitated()
		// or if our target is in a state in which
			// they should not be allowed to be attacked
				|| pTarget->isDead()
				|| pTarget->isBlinking())
				return false;

	// Finally, we can only attack the target if we are hostile towards them.
	return isHostileTo(pTarget);
}

void Unit::OnDeath(Unit *pKiller)
{
#ifdef EBENEZER
	SendDeathAnimation(pKiller);
#endif
}

void Unit::SendDeathAnimation(Unit * pKiller /*= nullptr*/)
{
	try{
#ifdef EBENEZER
		Packet result(WIZ_DEAD);
		result << GetID();
		SendToRegion(&result);
#else
		Packet result(AG_DEAD);
		int16 tid = (pKiller == nullptr ? -1 : pKiller->GetID());
		result << GetID() << pKiller->GetID();
		g_pMain->Send(&result);
#endif
	}
	catch (std::exception & ex)
	{
		printf("Exception occurred: %s\n", ex.what());
	}
}

void Unit::AddType4Buff(uint8 bBuffType, _BUFF_TYPE4_INFO & pBuffInfo)
{
	FastGuard lock(m_buffLock);
	m_buffMap.insert(std::make_pair(bBuffType, pBuffInfo));

	if (pBuffInfo.isBuff())
		m_buffCount++;
}

/**************************************************************************
* The following methods should not be here, but it's necessary to avoid
* code duplication between AI and Ebenezer until they're better merged.
**************************************************************************/ 

/**
* @brief	Sets zone attributes for the loaded zone.
*
* @param	zoneNumber	The zone number.
*/
void KOMap::SetZoneAttributes(int zoneNumber)
{
	m_zoneFlags = 0;
	m_byTariff = 10; // defaults to 10 officially for zones that don't use it.
	m_byMinLevel = 1;
	m_byMaxLevel = MAX_LEVEL;

	switch (zoneNumber)
	{
	case ZONE_MORADON:
	case 51: // Orc Prisoner Quest arena
	case 52: // Blood Don Quest arena
	case 53: // Goblin Quest arena
	case ZONE_FORGOTTEN_TEMPLE: // Forgotten Temple
		m_zoneType = ZoneAbilityNeutral;
		m_zoneFlags = ZF_TRADE_OTHER_NATION | ZF_TALK_OTHER_NATION | ZF_FRIENDLY_NPCS;
#if __VERSION >= 1453
		if (zoneNumber == ZONE_MORADON)
			m_zoneFlags |= ZF_CLAN_UPDATE;
#endif
		break;

	case ZONE_CAITHAROS_ARENA: // Caitharos/Knight Quest arena
		m_zoneType = ZoneAbilityCaitharosArena;
		m_zoneFlags = ZF_TALK_OTHER_NATION | ZF_ATTACK_OTHER_NATION | ZF_FRIENDLY_NPCS;
		break;

	case 32: // Desperation abyss
	case 33: // Hell abyss
		m_zoneType = ZoneAbilityPVPNeutralNPCs;
		m_zoneFlags = ZF_TALK_OTHER_NATION | ZF_ATTACK_OTHER_NATION | ZF_FRIENDLY_NPCS;
		break;

	case ZONE_ARENA:
		m_zoneType = ZoneAbilityNeutral;
		m_zoneFlags = ZF_TALK_OTHER_NATION | ZF_ATTACK_OTHER_NATION | ZF_ATTACK_SAME_NATION | ZF_FRIENDLY_NPCS;
		break;

	case ZONE_KARUS:
	case ZONE_KARUS_ESLANT:
	case ZONE_ELMORAD:
	case ZONE_ELMORAD_ESLANT:
	case ZONE_RONARK_LAND:
	case ZONE_RONARK_LAND_BASE:
	case ZONE_ARDREAM:
		m_zoneType = ZoneAbilityPVP;
		m_zoneFlags = ZF_ATTACK_OTHER_NATION;

		if (zoneNumber == ZONE_KARUS_ESLANT || zoneNumber == ZONE_ELMORAD_ESLANT)
			m_byMinLevel = MIN_LEVEL_ESLANT;
		else if (zoneNumber == ZONE_RONARK_LAND)
			m_byMinLevel = MIN_LEVEL_RONARK_LAND;
		else if (zoneNumber == ZONE_ARDREAM)
			m_byMinLevel = MIN_LEVEL_ARDREAM;
		else if (zoneNumber == ZONE_RONARK_LAND_BASE)
			m_byMinLevel = MIN_LEVEL_RONARK_LAND_BASE, m_byMaxLevel = MAX_LEVEL_RONARK_LAND_BASE;
		else if (zoneNumber == ZONE_KARUS || zoneNumber == ZONE_ELMORAD)
			m_zoneFlags |= ZF_CLAN_UPDATE;
		break;

	case ZONE_BATTLE:
	case ZONE_BATTLE2:
	case ZONE_BATTLE3:
	case ZONE_SNOW_BATTLE:
		m_zoneType = ZoneAbilityPVP;
		m_zoneFlags = ZF_ATTACK_OTHER_NATION | ZF_WAR_ZONE;
		break;

	case ZONE_DELOS:
		m_zoneType = ZoneAbilitySiegeDisabled; // depends on current siege state
		m_zoneFlags = ZF_TRADE_OTHER_NATION | ZF_TALK_OTHER_NATION | ZF_FRIENDLY_NPCS; // also depends on current siege state, should be updated by CSW.
		break;

	case ZONE_BIFROST:
		m_zoneType = ZoneAbilityPVPNeutralNPCs;
		m_zoneFlags = ZF_ATTACK_OTHER_NATION | ZF_FRIENDLY_NPCS;
		break;

	case ZONE_KROWAZ_DOMINION:
		m_zoneType = ZoneAbilityPVPNeutralNPCs;
		m_zoneFlags = ZF_ATTACK_OTHER_NATION | ZF_TALK_OTHER_NATION | ZF_FRIENDLY_NPCS;
		m_byMinLevel = MIN_LEVEL_KROWAZ_DOMINION;
		break;

	default:
		m_zoneType = ZoneAbilityPVP;
		break;
	}
}

/**
* @brief	Determines if an NPC is hostile to a unit.
* 			Non-hostile units cannot be attacked.
*
* @param	pTarget	Target unit
*
* @return	true if hostile to, false if not.
*/
bool CNpc::isHostileTo(Unit * pTarget)
{
	if (pTarget == nullptr)
		return false;

	// Only players can attack these targets.
	if (pTarget->isPlayer())
	{
		// Scarecrows are NPCs that the client allows us to attack
		// however, since they're not a monster, and all NPCs in neutral zones
		// are friendly, we need to override to ensure we can attack them server-side.
		if (GetType() == NPC_SCARECROW)
			return true;
	}

	// A nation of 0 indicates friendliness to all
	if (GetNation() == Nation::ALL
		// Also allow for cases when all NPCs in this zone are inherently friendly.
			|| (!isMonster() && GetMap()->areNPCsFriendly()))
			return false;

	// A nation of 3 indicates hostility to all (or friendliness to none)
	if (GetNation() == Nation::NONE)
		return true;

	// An NPC cannot attack a unit of the same nation
	return (GetNation() != pTarget->GetNation());
}

/**
* @brief	Determines if a player is hostile to a unit.
* 			Non-hostile units cannot be attacked.
*
* @param	pTarget	Target unit
*
* @return	true if hostile to, false if not.
*/
bool CUser::isHostileTo(Unit * pTarget)
{
	if (pTarget == nullptr)
		return false;

	// For non-player hostility checks, refer to the appropriate override.
	if (!pTarget->isPlayer())
		return pTarget->isHostileTo(this);

	// Players can attack other players in the arena.
	if (isInArena() 
		&& TO_USER(pTarget)->isInArena())
		return true;

	// Players can attack opposing nation players when they're in PVP zones.
	if (GetNation() != pTarget->GetNation() 
		&& isInPVPZone())
		return true;

	// Players cannot attack other players in any other circumstance.
	return false;
}

/**
* @brief	Determine if this user is in an arena area.
*
* @return	true if in arena, false if not.
*/
bool CUser::isInArena()
{
	/*
	All of this needs to be handled more generically 
	(i.e. bounds loaded from the database, or their existing SMD method).
	*/

	// If we're in the Arena zone, assume combat is acceptable everywhere.
	// NOTE: This is why we need generic bounds checks, to ensure even attacks in the Arena zone are in one of the 4 arena locations.
	if (GetZoneID() == ZONE_ARENA)
		return true;

	// The only other arena is located in Moradon. If we're not in Moradon, then it's not an Arena.
	if (GetZoneID() != ZONE_MORADON)
		return false;

	// Moradon outside arena spawn bounds.
	return ((GetX() < 735.0f && GetX() > 684.0f) 
		&& ((GetZ() < 491.0f && GetZ() > 440.0f) || (GetZ() < 411.0f && GetZ() > 360.0f)));
}

/**
* @brief	Determine if this user is in a normal PVP zone.
* 			That is, they're in an PK zone that allows combat 
* 			against the opposite nation.
*
* @return	true if in PVP zone, false if not.
*/
bool CUser::isInPVPZone()
{
	if (GetMap()->canAttackOtherNation())
		return true;

#if defined(EBENEZER)
	// Native/home zones are classed as PVP zones during invasions.
	if ((GetZoneID() == KARUS && g_pMain->m_byKarusOpenFlag) 
		|| (GetZoneID() == ELMORAD && g_pMain->m_byElmoradOpenFlag))
		return true;
#endif

	return false;
}
