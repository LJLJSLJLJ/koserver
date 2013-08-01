#include "stdafx.h"

void CUser::RentalSystem(Packet & pkt)
{
	if (isDead())
		return;

	uint8 opcode = pkt.read<uint8>();

	// TO-DO
	/*if (opcode == 1)
	PremiumRentalProcess(pBuf + index);
	else if (opcode == 2)
	PvPRentalProcess(pBuf + index);*/
}

