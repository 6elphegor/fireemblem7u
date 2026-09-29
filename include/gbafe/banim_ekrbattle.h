#pragma once

#include "global.h"
#include "proc.h"
#include "anime.h"

struct ProcEkrBattle {
    PROC_HEADER;

    /* 29 */ u8 speedup;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 end;
    /* 30 */ STRUCT_PAD(0x30, 0x44);
    /* 44 */ int side;
    /* 48 */ int counter;
    /* 4C */ STRUCT_PAD(0x4C, 0x54);
    /* 54 */ int quote;
    /* 58 */ int unk58;
    /* 5C */ struct Anim * anim;
};
PROC_SIZE_CHECK(struct ProcEkrBattle);

extern struct ProcEkrBattle * gpProcEkrBattle;

void SetBanimLinkArenaFlag(int unk);
int GetBanimLinkArenaFlag(void);
void NewEkrBattleDeamon(void);
void EndEkrBattleDeamon(void);
s8 IsBattleDeamonActive(void);
void EkrBattleDeamon_OnEnd(void);
void EkrBattleDeamonMain(ProcPtr proc);
void NewEkrBattle(void);
void InBattleMainRoutine(void);
void MainUpdateEkrBattle(void);
void EkrBattle_End(struct ProcEkrBattle * proc);
void EkrBattle_Init(struct ProcEkrBattle * proc);
void EkrBattle_Main(struct ProcEkrBattle * proc);
void EkrBattleStartBattleQuote(struct ProcEkrBattle * proc);
void EkrBattleWaitBattleQuote(struct ProcEkrBattle * proc);
void EkrBattleWaitWindowAppear(struct ProcEkrBattle * proc);
void EkrBattlePreDragonIntro(struct ProcEkrBattle * proc);
void EkrBattleExecDragonIntro(struct ProcEkrBattle * proc);
void EkrBattleWaitDragonIntro(struct ProcEkrBattle * proc);
void EkrBattlePostDragonIntro(struct ProcEkrBattle * proc);
void ekrBattle_8050290(struct ProcEkrBattle * proc);
void ekrBattleSetFlashingEffect(struct ProcEkrBattle * proc);
void ekrBattleExecTriangleAtk(struct ProcEkrBattle * proc);
void ekrBattleWaitTriangleIdle(struct ProcEkrBattle * proc);
void ekrBattleTriggerNewRoundStart(struct ProcEkrBattle * proc);
void ekrBattle_80503EC(struct ProcEkrBattle * proc);
void ekrBattle_StartPromotion(struct ProcEkrBattle * proc);
void ekrBattle_WaitPromotionIdle(struct ProcEkrBattle * proc);
void ekrBattleInRoundIdle(struct ProcEkrBattle * proc);
void ekrBattleOnBattleEnd(struct ProcEkrBattle * proc);
void ekrBattle_8050600(struct ProcEkrBattle * proc);
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle * proc);
void ekrBattleExecExpGain(struct ProcEkrBattle * proc);
void ekrBattle_80508F0(struct ProcEkrBattle * proc);
void ekrBattle_8050940(struct ProcEkrBattle * proc);
void ekrBattleWaitExpBarIdle(struct ProcEkrBattle * proc);
void ekrBattlePostExpBarIdle(struct ProcEkrBattle * proc);
void ekrBattle_8050AB8(struct ProcEkrBattle * proc);
void EkrBattleLvupHanlder(struct ProcEkrBattle * proc);
void EkrBattleExecEkrLvup(struct ProcEkrBattle * proc);
void EkrBattleWaitLvup(struct ProcEkrBattle * proc);
void EkrBattleExecPopup(struct ProcEkrBattle * proc);
void EkrBattleWaitPopup(struct ProcEkrBattle * proc);
void EkrBattlePrepareEnding(struct ProcEkrBattle * proc);
void EkrBattleStartDragonEnding(struct ProcEkrBattle * proc);
void EkrBattleWaitDragonEnding(struct ProcEkrBattle * proc);
void EkrBattlePostDragonEnding(struct ProcEkrBattle * proc);
void EkrBattlePostEndDelay(struct ProcEkrBattle * proc);
