#pragma once

class CPremiumItemSet : public OdbcRecordset
{
public:
	CPremiumItemSet(OdbcConnection * dbConnection, CPremiumItemArray * pMap) 
		: OdbcRecordset(dbConnection), m_pMap(pMap) {}

	virtual tstring GetTableName() { return _T("PREMIUM_ITEM"); }
	virtual tstring GetColumns() { return _T("Type, ExpPercentLevelBefore55, ExpPercentLevelAfter55, ExpPercentDeath, NoahPercent, DropPercent, BonusLoyalty, RepairDiscountPercent, ItemSellPercent"); }

	virtual bool Fetch()
	{
		_PREMIUM_ITEM * pData = new _PREMIUM_ITEM;

		_dbCommand->FetchByte(1, pData->Type);
		_dbCommand->FetchUInt16(2, pData->ExpPercentLevelBefore55);
		_dbCommand->FetchUInt16(3, pData->ExpPercentLevelAfter55);
		_dbCommand->FetchUInt16(4, pData->ExpPercentDeath);
		_dbCommand->FetchUInt16(5, pData->NoahPercent);
		_dbCommand->FetchUInt16(6, pData->DropPercent);
		_dbCommand->FetchUInt32(7, pData->BonusLoyalty);
		_dbCommand->FetchUInt16(8, pData->RepairDiscountPercent);
		_dbCommand->FetchUInt16(9, pData->ItemSellPercent);

		if (!m_pMap->PutData(pData->Type, pData))
			delete pData;

		return true;
	}

	CPremiumItemArray *m_pMap;
};