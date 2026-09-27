#pragma once

#include "global.h"

// FE8U: bmarena.c (struct ArenaSt / gArenaSt are in arena.h)

void ArenaBeginInternal(struct Unit * unit);
void ArenaBegin(struct Unit * unit);
void ArenaResume(struct Unit * unit);
int GetUnitBestWRankType(struct Unit * unit);
int GetClassBestWRankType(const struct ClassData * class);
int ArenaGenerateOpposingClassId(int weaponType);
s8 IsWeaponMagic(int weaponType);
int ArenaGetOpposingLevel(int level);
int ArenaGetPowerRanking(struct Unit * unit, s8 opponentIsMagic);
void ArenaGenerateOpponentUnit(void);
void ArenaGenerateBaseWeapons(void);
u16 ArenaGetUpgradedWeapon(u16 item);
s8 ArenaAdjustOpponentDamage(void);
s8 ArenaAdjustOpponentPowerRanking(void);
void ArenaGenerateMatchupGoldValue(void);
int ArenaGetMatchupGoldValue(void);
int ArenaGetResult(void);
void ArenaSetResult(int result);
void ArenaContinueBattle(void);
s8 ArenaIsUnitAllowed(struct Unit * unit);
void ArenaSetFallbackWeaponForUnit(struct Unit * unit, u16 * pItem);
void ArenaSetFallbackWeaponsMaybe(void);
