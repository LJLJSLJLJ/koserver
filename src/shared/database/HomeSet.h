#pragma once

class CHomeSet : public OdbcRecordset
{
public:
	CHomeSet(OdbcConnection * dbConnection, HomeArray * pMap) 
		: OdbcRecordset(dbConnection), m_pMap(pMap) {}

	virtual tstring GetTableName() { return _T("HOME"); }
	virtual tstring GetColumns() { return _T("Nation, ElmoZoneX, ElmoZoneZ, ElmoZoneLX, ElmoZoneLZ, KarusZoneX, KarusZoneZ, KarusZoneLX, KarusZoneLZ, FreeZoneX, FreeZoneZ, FreeZoneLX, FreeZoneLZ, BattleZoneX, BattleZoneZ, BattleZoneLX, BattleZoneLZ, BattleZone2X, BattleZone2Z, BattleZone2LX, BattleZone2LZ"); }

	virtual bool Fetch()
	{
		_HOME_INFO *pData = new _HOME_INFO;

		_dbCommand->FetchByte(1, pData->bNation);
		_dbCommand->FetchUInt32(2, pData->ElmoZoneX);
		_dbCommand->FetchUInt32(3, pData->ElmoZoneZ);
		_dbCommand->FetchByte(4, pData->ElmoZoneLX);
		_dbCommand->FetchByte(5, pData->ElmoZoneLZ);
		_dbCommand->FetchUInt32(6, pData->KarusZoneX);
		_dbCommand->FetchUInt32(7, pData->KarusZoneZ);
		_dbCommand->FetchByte(8, pData->KarusZoneLX);
		_dbCommand->FetchByte(9, pData->KarusZoneLZ);
		_dbCommand->FetchUInt32(10, pData->FreeZoneX);
		_dbCommand->FetchUInt32(11, pData->FreeZoneZ);
		_dbCommand->FetchByte(12, pData->FreeZoneLX);
		_dbCommand->FetchByte(13, pData->FreeZoneLZ);
		_dbCommand->FetchUInt32(14, pData->BattleZoneX);
		_dbCommand->FetchUInt32(15, pData->BattleZoneZ);
		_dbCommand->FetchByte(16, pData->BattleZoneLX);
		_dbCommand->FetchByte(17, pData->BattleZoneLZ);

		if (!m_pMap->PutData(pData->bNation, pData))
			delete pData;
	
		return true;
	}

	HomeArray *m_pMap;
};