#pragma once

class CItemExchangeSet : public OdbcRecordset
{
public:
	CItemExchangeSet(OdbcConnection * dbConnection, ItemExchangeArray *pMap) 
		: OdbcRecordset(dbConnection), m_pMap(pMap) {}

	virtual tstring GetTableName() { return _T("ITEM_EXCHANGE"); }
	virtual tstring GetColumns() 
	{
		return _T("nIndex, nNpcNum, bRandomFlag, "
					"nOriginItemNum1, nOriginItemCount1, nExchangeItemNum1, nExchangeItemCount1, "
					"nOriginItemNum2, nOriginItemCount2, nExchangeItemNum2, nExchangeItemCount2, "
					"nOriginItemNum3, nOriginItemCount3, nExchangeItemNum3, nExchangeItemCount3, "
					"nOriginItemNum4, nOriginItemCount4, nExchangeItemNum4, nExchangeItemCount4, "
					"nOriginItemNum5, nOriginItemCount5, nExchangeItemNum5, nExchangeItemCount5");
	}

	virtual bool Fetch()
	{
		_ITEM_EXCHANGE *pData = new _ITEM_EXCHANGE;

		int i = 1;
		_dbCommand->FetchUInt32(i++, pData->nIndex);
		_dbCommand->FetchUInt16(i++, pData->sNpcNum);
		_dbCommand->FetchByte(i++, pData->bRandomFlag);

		for (int j = 0; j < ITEMS_IN_EXCHANGE_GROUP; j++)
		{
			_dbCommand->FetchUInt32(i++, pData->nOriginItemNum[j]);
			_dbCommand->FetchUInt16(i++, pData->sOriginItemCount[j]);
			_dbCommand->FetchUInt32(i++, pData->nExchangeItemNum[j]);
			_dbCommand->FetchUInt16(i++, pData->sExchangeItemCount[j]);
		}

		if (!m_pMap->PutData(pData->nIndex, pData))
			delete pData;

		return true;
	}

	ItemExchangeArray * m_pMap;
};