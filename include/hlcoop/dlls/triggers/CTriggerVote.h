#pragma once
#include "TextMenu.h"

class CTriggerVote : public CPointEntity
{
public:
	void KeyValue(KeyValueData* pkvd);
	void Use(CBaseEntity* pActivator, CBaseEntity* pCaller, USE_TYPE useType, float value);
	void VoteThink();
	void MenuCallback(TextMenu* menu, edict_t* player, int itemNumber, TextMenuItem& item);

	string_t m_iszYesString;
	string_t m_iszNoString;
	TextMenu* m_textMenu;
	bool isActive;
	int m_yesVotes;
	int m_noVotes;
};