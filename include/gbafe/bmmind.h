#pragma once

#include "global.h"
#include "proc.h"

// FE8U: bmmind.c (struct Action / gActionSt are in action.h)

struct MuProc;

struct AfterDropActionProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29[0x54 - 0x29];
    /* 54 */ struct Unit * unit;
};
PROC_SIZE_CHECK(struct AfterDropActionProc);

struct CombatActionProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29[0x54 - 0x29];
    /* 54 */ struct MuProc * unk_54;
    /* 58 */ u8 unk_58[0x64 - 0x58];
    /* 64 */ s16 unitIdA;
    /* 66 */ s16 unitIdB;
};
PROC_SIZE_CHECK(struct CombatActionProc);

struct DeathDropAnimProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ int xDrop, yDrop;
    /* 38 */ short xFrom, yFrom;
    /* 3C */ short xTo, yTo;
    /* 40 */ short yOffset;
    /* 42 */ short ySpeed;
    /* 44 */ short yAccel;
    /* 46 */ short clock;
    /* 48 */ short clockEnd;
};
PROC_SIZE_CHECK(struct DeathDropAnimProc);

void StoreRNStateToActionStruct(void);
void LoadRNStateFromActionStruct(void);
s8 DoAction(ProcPtr proc);
s8 DoRescueAction(ProcPtr proc);
s8 AfterDrop_CheckTrapAfterDropMaybe(struct AfterDropActionProc * proc);
int sub_0802F38C(void);
s8 DoRescueDropAction(ProcPtr proc);
s8 ActionVisitAndSeize(ProcPtr proc);
s8 ActionCombat(ProcPtr proc);
s8 ActionArena(ProcPtr proc);
s8 ActionDance(ProcPtr proc);
s8 ActionTalk(ProcPtr proc);
s8 ActionSupport(ProcPtr proc);
s8 ActionSteal(ProcPtr proc);
void DeathDropSpriteAnim_Loop(struct DeathDropAnimProc * proc);
void DeathDropSpriteAnim_ExecAnyTrap(struct DeathDropAnimProc * proc);
void DeathDropSpriteAnim_End(void);
void DropRescueOnDeath(ProcPtr proc, struct Unit * unit);
void KillUnitOnCombatDeath(struct Unit * unitA, struct Unit * unitB);
void KillUnitOnArenaDeathMaybe(struct Unit * unit);
void BATTLE_GOTO1_IfNobodyIsDead(ProcPtr proc);
bool8 DidUnitDie(struct Unit * unit);
void BATTLE_PostCombatDeathFades(struct CombatActionProc * proc);
void BATTLE_DeleteLinkedMOVEUNIT(struct CombatActionProc * proc);
void BATTLE_HandleCombatDeaths(struct CombatActionProc * proc);
void sub_0802F9A4(void);
bool8 BATTLE_HandleItemDrop(struct CombatActionProc * proc);
void sub_0802FA6C(ProcPtr proc);
void BATTLE_HandleArenaDeathsMaybe(ProcPtr proc);
