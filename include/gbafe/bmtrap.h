#pragma once

#include "global.h"
#include "proc.h"

// Traps (FE8U: bmtrap.c)

struct TrapData {
    /* 00 */ u8 type;
    /* 01 */ u8 xPos;
    /* 02 */ u8 yPos;
    /* 03 */ u8 subtype;
    /* 04 */ u8 turn_counter;
    /* 05 */ u8 turn;
} __attribute__((packed));

struct ProcBmTrap {
    /* 00 */ PROC_HEADER;

    STRUCT_PAD(0x29, 0x50);

    /* 50 */ s16 post_exec_type;

    /* 54 */ struct Unit * unit;
};

void RegisterTrapDeathBWL(struct ProcBmTrap * proc);
void ExecFireTileTrapAnim1(struct ProcBmTrap * proc);
void ExecFireTileTrapAnim2(struct ProcBmTrap * proc);
void ApplyTrapDamageAnim(struct ProcBmTrap * proc);
void ApplyTrapDamageReal(struct ProcBmTrap * proc);
int GetPickTrapType(struct Unit * unit);
int ExecTrap(ProcPtr proc, struct Unit * unit, int exec_type);
bool HandlePostActionTraps(ProcPtr proc);
bool ExecTrapAfterWarp(ProcPtr proc);
bool ExecTrapAfterDropAction(ProcPtr proc, struct Unit * unit);
bool ExecTrapAfterDeathDrop(ProcPtr proc, struct Unit * unit);
void LoadChapterTraps(void);

extern struct ProcCmd CONST_DATA sProcScr_ExecTrap8[];
extern struct ProcCmd CONST_DATA sProcScr_ExecTrapMine[];
