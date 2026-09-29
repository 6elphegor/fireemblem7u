#include "gbafe.h"
#include "gbafe/banim_ekrbattle.h"

/**
 * Battle animation main proc (fireemblem8u: banim-ekrbattle.c)
 */

EWRAM_DATA int gBanimLinkArenaFlag = 0;
EWRAM_DATA int gBattleDeamonActive = 0;
EWRAM_DATA struct Proc * gpProcEkrBattleDeamon = NULL;

extern int gEkrDebugTimer;
extern int gEkrDebugUnk1;
extern u32 gEkrBattleEndFlag;
extern s16 gEkrDebugModeMaybe;
extern s16 gEkrInitialHitSide;
extern u8 gEkrPids[2];
extern u32 gEkrInitPosReal;
extern s16 gBanimEffectiveness[2];
extern s16 gBanimExpGain[2];
extern s16 gBanimExpPrevious[2];
extern s16 gEkrGaugeHp[2];
extern u32 gEkrHpBarCount;
extern u32 gEkrDeadEventExist;
extern u16 gEkrBarfxBuf[0x180];

extern const u8 Img_EkrExpBar[];
extern const u16 Tsa_EkrExpBar[];
extern const u16 Pal_ExpBar[];
extern const u16 Img_EkrExpBarChange[];
extern const u16 Img_BarNumfx[];

s8 CheckBattleTalk(u8 pida, u8 pidb);
void StartBattleTalk(u8 pida, u8 pidb);
int GetBattleAnimArenaFlag(void);
void ArenaSetResult(int result);
void ArenaContinueBattle(void);
void sub_0805555C(void);
s8 CheckEkrNamewinAppearUnexist(void);
void nullsub_10(void);
void EkrEfxStatusClear(void);
void EkrPlayMainBGM(void);
void EkrRestoreBGM(void);
void EkrBattleEndRountine(void);
void UnregisterEfxSoundSeExist(void);
void EnableEkrGauge(void);
void DisableEkrGauge(void);
void EfxPrepareScreenFx(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void NewEfxHpBarColorChange(struct Anim * anim);
void EndEfxHPBarColorChange(void);
void NewEkrTriangle(struct Anim * anim);
s8 CheckEkrTriangleInvalid(void);
void NewEkrClassChg(struct Anim * anim);
s8 EkrClasschgFinished(void);
void EndEkrClasschg(void);
void M4aPlayWithPostionCtrl(int songid, int x, int flag);
void DoM4aSongNumStop(int songid);
void NewEkrLevelup(struct Anim * anim);
s8 CheckEkrLvupDone(void);
void EndEkrLevelUp(void);
void NewEkrPopup(void);
s8 CheckEkrPopupDone(void);
void EndEkrPopup(void);

CONST_DATA struct ProcCmd ProcScr_ekrBattleDeamon[] = {
    PROC_19,
    PROC_SET_END_CB(EkrBattleDeamon_OnEnd),
    PROC_REPEAT(EkrBattleDeamonMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ekrBattle[] = {
    PROC_19,
    PROC_SET_END_CB(EkrBattle_End),
    PROC_REPEAT(EkrBattle_Init),
    PROC_REPEAT(EkrBattle_Main),
    PROC_END,
};

void SetBanimLinkArenaFlag(int flag)
{
    gBanimLinkArenaFlag = flag;
}

int GetBanimLinkArenaFlag(void)
{
    return gBanimLinkArenaFlag;
}

void NewEkrBattleDeamon(void)
{
    gpProcEkrBattleDeamon = Proc_Start(ProcScr_ekrBattleDeamon, PROC_TREE_3);
    gBattleDeamonActive = true;
    LockGame();
}

void EndEkrBattleDeamon(void)
{
    Proc_End(gpProcEkrBattleDeamon);
}

s8 IsBattleDeamonActive(void)
{
    if (gBattleDeamonActive == true)
        return true;

    return false;
}

void EkrBattleDeamon_OnEnd(void)
{
    gBattleDeamonActive = false;
    UnlockGame();
}

void EkrBattleDeamonMain(ProcPtr proc)
{
    return;
}

void NewEkrBattle(void)
{
    AnimClearAll();
    gpProcEkrBattle = Proc_Start(ProcScr_ekrBattle, PROC_TREE_3);
    SetMainFunc(InBattleMainRoutine);
    EkrEfxStatusClear();

    gEkrBattleEndFlag = 0;
    gEkrDebugTimer = 0;
    gEkrDebugUnk1 = 0;
    gEkrDebugUnk2 = 0;
    gAnimC01Blocking = 0;

    if (0 == gEkrDebugModeMaybe)
        EkrPlayMainBGM();
}

void InBattleMainRoutine(void)
{
    RefreshKeySt(gpKeySt);

    if (gEkrDebugUnk1 == 0)
        MainUpdateEkrBattle();
    else if (gEkrDebugUnk2 == 1)
        MainUpdateEkrBattle();

    switch (gEkrBattleEndFlag) {
    case 0:
        break;

    case 1:
        if (0 == gEkrDebugModeMaybe) {
            Proc_End(gpProcEkrBattle);
            EkrBattleEndRountine();
        }
        break;

    case 2:
        if (0 == gEkrDebugModeMaybe) {
            Proc_End(gpProcEkrBattle);
            EkrBattleEndRountine();
        } else {
            Proc_End(gpProcEkrBattle);
            EndEkrGauge();
        }
        break;

    default:
        break;
    }

    gBmSt.main_loop_ended = true;
    gBmSt.main_loop_end_scanline = REG_VCOUNT;
    VBlankIntrWait();
}

void MainUpdateEkrBattle(void)
{
    ClearSprites();
    UnregisterEfxSoundSeExist();

    if (GetGameLock() == 0)
        Proc_Run(gProcTreeRootArray[2]);

    Proc_Run(gProcTreeRootArray[3]);
    Proc_Run(gProcTreeRootArray[5]);

    PutSpriteLayerOam(0);

    Proc_Run(gProcTreeRootArray[1]);

    AnimUpdateAll();
    BattleAIS_ExecCommands();

    Proc_Run(gProcTreeRootArray[4]);

    gEkrDebugUnk2 = 0;

    if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) != 2)
        gEkrDebugTimer++;

    PutSpriteLayerOam(0xD);
}

void EkrBattle_End(struct ProcEkrBattle * proc)
{
    return;
}

void EkrBattle_Init(struct ProcEkrBattle * proc)
{
    gEkrBgPosition = 0;
    if (gEkrInitPosReal == 0) {
        if (gEkrDistanceType == EKR_DISTANCE_FAR)
            gEkrBgPosition = -0x20;
        else
            gEkrBgPosition = -0xF0;
    }

    InitMainAnims();
    InitEkrDragonStatus();

    gAnimC01Blocking = 1;

    if (true == GetBattleAnimArenaFlag())
        proc->timer = 0;
    else
        proc->timer = 0x1E;

    if (EKR_POS_L == gEkrInitialHitSide)
        proc->quote = CheckBattleTalk(gEkrPids[EKR_POS_L], gEkrPids[EKR_POS_R]);
    else
        proc->quote = CheckBattleTalk(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);

    proc->unk58 = 0;
    Proc_Break(proc);
}

void EkrBattle_Main(struct ProcEkrBattle * proc)
{
    if (++proc->timer == 0x1F) {
        if (GetBanimLinkArenaFlag() != 1 && (proc->quote == true || proc->unk58 == true)) {
            NewEkrWindowAppear(1, 7);
            NewEkrNamewinAppear(1, 7, 0);
            proc->proc_idleCb = (ProcFunc)EkrBattleStartBattleQuote;
            proc->timer = 0;
        } else {
            proc->proc_idleCb = (ProcFunc)EkrBattlePreDragonIntro;
            proc->timer = 0;
        }
    }
}

void EkrBattleStartBattleQuote(struct ProcEkrBattle * proc)
{
    if (CheckEkrWindowAppearUnexist() != true)
        return;

    EnableEkrGauge();
    AsyncEkrDispUP();
    CpuFastFill(0, gBg0Tm, 0x800);
    SetBgOffset(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
    SetBgOffset(BG_1, 0, 0);
    EnableBgSync(BG0_SYNC_BIT);
    EkrGauge_Set4C50();

    if (proc->quote == true) {
        if (gEkrInitialHitSide == EKR_POS_L)
            StartBattleTalk(gEkrPids[EKR_POS_L], gEkrPids[EKR_POS_R]);
        else
            StartBattleTalk(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);

        proc->quote = false;
    }

    proc->proc_idleCb = (ProcFunc)EkrBattleWaitBattleQuote;
}

void EkrBattleWaitBattleQuote(struct ProcEkrBattle * proc)
{
    if (IsEventRunning() != false)
        return;

    EfxPrepareScreenFx();
    EnableBgSync(BG0_SYNC_BIT);
    NewEkrWindowAppear(0, 7);
    NewEkrNamewinAppear(0, 7, 0);
    DisableEkrGauge();
    UnAsyncEkrDispUP();
    EkrGauge_Clr4C50();
    proc->proc_idleCb = (ProcFunc)EkrBattleWaitWindowAppear;
}

void EkrBattleWaitWindowAppear(struct ProcEkrBattle * proc)
{
    if (CheckEkrWindowAppearUnexist() == true) {
        proc->proc_idleCb = (ProcFunc)EkrBattlePreDragonIntro;
        proc->timer = 0;
    }
}

void EkrBattlePreDragonIntro(struct ProcEkrBattle * proc)
{
    proc->side = gEkrInitialHitSide;
    proc->counter = 0;
    proc->proc_idleCb = (ProcFunc)EkrBattleExecDragonIntro;
}

void EkrBattleExecDragonIntro(struct ProcEkrBattle * proc)
{
    if (proc->counter == 2) {
        proc->proc_idleCb = (ProcFunc)EkrBattlePostDragonIntro;
        return;
    }

    if (proc->side == EKR_POS_L) {
        proc->anim = gAnims[EKR_POS_L * 2];
        if (GetEkrDragonStatusType(proc->anim) != 0) {
            NewEkrDragon(proc->anim);
            proc->proc_idleCb = (ProcFunc)EkrBattleWaitDragonIntro;
        }
        proc->side = EKR_POS_R;
    } else {
        proc->anim = gAnims[EKR_POS_R * 2];
        if (GetEkrDragonStatusType(proc->anim) != 0) {
            NewEkrDragon(proc->anim);
            proc->proc_idleCb = (ProcFunc)EkrBattleWaitDragonIntro;
        }
        proc->side = EKR_POS_L;
    }

    proc->counter++;
}

void EkrBattleWaitDragonIntro(struct ProcEkrBattle * proc)
{
    if (EkrDragonIntroDone(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)EkrBattleExecDragonIntro;
}

void EkrBattlePostDragonIntro(struct ProcEkrBattle * proc)
{
    if (gEkrInitialHitSide != gEkrInitPosReal) {
        NewEfxFarAttackWithDistance(gAnims[gEkrInitPosReal * 2], -1);
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050290;
    } else
        proc->proc_idleCb = (ProcFunc)ekrBattleSetFlashingEffect;
}

void ekrBattle_8050290(struct ProcEkrBattle * proc)
{
    if (++proc->timer == 8)
        proc->proc_idleCb = (ProcFunc)ekrBattleSetFlashingEffect;
}

void ekrBattleSetFlashingEffect(struct ProcEkrBattle * proc)
{
    NewEfxStatusUnit(gAnims[0]);
    NewEfxStatusUnit(gAnims[2]);
    NewEfxWeaponIcon(gBanimEffectiveness[0], gBanimEffectiveness[1]);

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
        DisableEfxStatusUnits(gAnims[0]);

    NewEfxHpBarColorChange(gAnims[0]);
    proc->proc_idleCb = (ProcFunc)ekrBattleExecTriangleAtk;
}

void ekrBattleExecTriangleAtk(struct ProcEkrBattle * proc)
{
    if (gpEkrTriangleUnits[0] != NULL) {
        NewEkrTriangle(gAnims[2]);
        proc->proc_idleCb = (ProcFunc)ekrBattleWaitTriangleIdle;
    } else
        proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
}

void ekrBattleWaitTriangleIdle(struct ProcEkrBattle * proc)
{
    if (CheckEkrTriangleInvalid() == true) {
        nullsub_10();
        proc->timer = 0x1E;
        proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
    }
}

void ekrBattleTriggerNewRoundStart(struct ProcEkrBattle * proc)
{
    struct Anim * anim;

    if (++proc->timer <= 0x1E)
        return;

    if (gBanimValid[0] == true) {
        anim = gAnims[0];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;

        anim = gAnims[1];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;
    }

    if (gBanimValid[1] == true) {
        anim = gAnims[2];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;

        anim = gAnims[3];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;
    }

    gBanimDoneFlag[0] = false;
    gBanimDoneFlag[1] = false;
    proc->proc_idleCb = (ProcFunc)ekrBattle_80503EC;
}

void ekrBattle_80503EC(struct ProcEkrBattle * proc)
{
    gAnimC01Blocking = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_StartPromotion;
}

void ekrBattle_StartPromotion(struct ProcEkrBattle * proc)
{
    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
        NewEkrClassChg(gAnims[2]);
        proc->proc_idleCb = (ProcFunc)ekrBattle_WaitPromotionIdle;
    } else {
        proc->speedup = false;
        proc->proc_idleCb = (ProcFunc)ekrBattleInRoundIdle;
    }
}

void ekrBattle_WaitPromotionIdle(struct ProcEkrBattle * proc)
{
    if (EkrClasschgFinished() == true) {
        EndEkrClasschg();
        gBanimExpGain[0] = 1;
        proc->proc_idleCb = (ProcFunc)EkrBattleExecEkrLvup;
    }
}

void ekrBattleInRoundIdle(struct ProcEkrBattle * proc)
{
    int ret = 0;

    if (gpKeySt->held & B_BUTTON)
        proc->speedup = true;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) == 2) {
            if (GetBattleAnimArenaFlag() == 0)
                ret = 1;
            else {
                gBanimExpGain[0] = gpEkrBattleUnitLeft->expGain;
                gBanimExpGain[1] = gpEkrBattleUnitRight->expGain;

                if (gEkrGaugeHp[0] == 0) {
                    ArenaSetResult(1);
                    ret = 1;
                } else if (gEkrGaugeHp[1] == 0) {
                    ArenaSetResult(2);
                    gBanimExpGain[1] = 0;
                    ret = 1;
                } else if (proc->speedup == true) {
                    sub_0805555C();
                    ArenaSetResult(4);
                    gBanimExpGain[1] = 0;
                    ret = 1;
                } else {
                    ArenaContinueBattle();
                    ParseBattleHitToBanimCmd();
                    AnimClearAll();
                    UpdateBanimFrame();
                    InitMainAnims();

                    proc->timer = 0;
                    proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
                }
            }
        }
        break;

    case EKR_DISTANCE_MONOCOMBAT:
        if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) == 1)
            ret = 1;
        break;

    case EKR_DISTANCE_PROMOTION:
        ret = 1;
        break;
    }

    if (ret == 1)
        proc->proc_idleCb = (ProcFunc)ekrBattleOnBattleEnd;
}

void ekrBattleOnBattleEnd(struct ProcEkrBattle * proc)
{
    proc->speedup = false;
    proc->proc_idleCb = (ProcFunc)ekrBattle_8050600;
}

void ekrBattle_8050600(struct ProcEkrBattle * proc)
{
    int pos, ret;

    if (gEkrHpBarCount != 0)
        return;

    if (gEkrDeadEventExist != 0)
        return;

    ret = CheckEkrNamewinAppearUnexist();
    if (ret != true)
        return;

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_WaitForPostBattleAct;

    if (CheckEfxDragonDeadFallHead(gAnims[0]) != false)
        return;

    if (gBanimExpGain[EKR_POS_L] != 0)
        pos = EKR_POS_L;
    else
        pos = EKR_POS_R;

    if (pos != gEkrInitPosReal)
        proc->speedup = ret;

    if (proc->speedup == true)
        NewEfxFarAttackWithDistance(gAnims[gEkrInitPosReal * 2], -1);
}

void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle * proc)
{
    if (++proc->timer < 0x1E)
        return;

    if (GetBanimLinkArenaFlag() != 1 && gBanimExpGain[EKR_POS_L] != -gBanimExpGain[EKR_POS_R])
        proc->proc_idleCb = (ProcFunc)ekrBattleExecExpGain;
    else
        proc->proc_idleCb = (ProcFunc)EkrBattleExecPopup;
}

void ekrBattleExecExpGain(struct ProcEkrBattle * proc)
{
    int i;
    u32 val0, val1, val2, val3;

    u16 * buf = gEkrBarfxBuf;
    u16 * buf0 = gEkrBarfxBuf + 0x80;

    SetBgOffset(BG_1, 0, 0);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0x94, 0xF0, 0x94);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 0;
    gDispIo.win_ct.wout_enable_blend = 0;

    RegisterDataMove(Img_EkrExpBar, (void *)(VRAM + 0x2000), 0x300);
    EfxTmCpyBG(Tsa_EkrExpBar, gBg1Tm + TM_OFFSET(6, 17), 18, 3, 1, 0x100);
    CpuFastCopy(Pal_ExpBar, PAL_BG(1), 0x20);
    EnableBgSync(BG1_SYNC_BIT);
    EnablePalSync();

    gDispIo.bg1_ct.priority = 0;
    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    EkrGauge_0804CC68(1);

    if (gBanimExpGain[EKR_POS_L] != 0)
        val0 = gBanimExpPrevious[EKR_POS_L];
    else
        val0 = gBanimExpPrevious[EKR_POS_R];

    val1 = DivRem(val0, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    EkrModifyBarfx(gEkrBarfxBuf, val1);

    for (i = 0; i < 13; i++)
        CpuFastCopy(&Img_EkrExpBarChange[buf[i] * 0x10], &buf0[0x10 * i], 0x20);

    CpuFastCopy(&Img_BarNumfx[val2 * 0x10], &buf0[0xD0], 0x20);
    CpuFastCopy(&Img_BarNumfx[val3 * 0x10], &buf0[0xE0], 0x20);
    RegisterDataMove(buf0, (void *)(VRAM + 0x20E0), 0x1E0);

    proc->timer = 0;
    proc->proc_idleCb = (ProcFunc)ekrBattle_80508F0;
}

void ekrBattle_80508F0(struct ProcEkrBattle * proc)
{
    if (++proc->timer > 12) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050940;
    } else {
        SetWin0Box(0, -108 - proc->timer, 240, proc->timer - 108);
    }
}

void ekrBattle_8050940(struct ProcEkrBattle * proc)
{
    if (++proc->timer > 10) {
        if (gBanimExpGain[0] != 0) {
            proc->timer = gBanimExpPrevious[0];
            proc->end = gBanimExpPrevious[0] + gBanimExpGain[0];
        } else if (gBanimExpGain[1] != 0) {
            proc->timer = gBanimExpPrevious[1];
            proc->end = gBanimExpPrevious[1] + gBanimExpGain[1];
        }

        proc->proc_idleCb = (ProcFunc)ekrBattleWaitExpBarIdle;
        EfxPlaySE(0x394, 0x100);
        M4aPlayWithPostionCtrl(0x394, 0x78, 0);
    }
}

void ekrBattleWaitExpBarIdle(struct ProcEkrBattle * proc)
{
    int i, val1, val2, val3;

    u16 * buf0;
    u16 * buf;
    buf = gEkrBarfxBuf;
    buf0 = gEkrBarfxBuf + 0x80;

    val1 = DivRem(proc->timer, 100);
    val2 = Div(val1, 10);
    val3 = val1 - val2 * 10;

    if (val2 == 0)
        val2 = 10;

    EkrModifyBarfx(buf, val1);

    for (i = 0; i < 13; i++)
        CpuFastSet(&Img_EkrExpBarChange[buf[i] * 0x10], &buf0[0x10 * i], 8);

    CpuFastSet(&Img_BarNumfx[val2 * 0x10], &buf0[0xD0], 8);
    CpuFastSet(&Img_BarNumfx[val3 * 0x10], &buf0[0xE0], 8);
    RegisterDataMove(buf0, (void *)(VRAM + 0x20E0), 0x1E0);

    if (++proc->timer > proc->end) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattlePostExpBarIdle;
    }
}

void ekrBattlePostExpBarIdle(struct ProcEkrBattle * proc)
{
    if (proc->timer == 0)
        DoM4aSongNumStop(0x394);

    if (++proc->timer > 30) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)ekrBattle_8050AB8;
    }
}

void ekrBattle_8050AB8(struct ProcEkrBattle * proc)
{
    if (++proc->timer > 12) {
        proc->timer = 0;
        proc->proc_idleCb = (ProcFunc)EkrBattleLvupHanlder;
    } else {
        SetWin0Box(0, proc->timer - 120, 240, -96 - proc->timer);
    }
}

void EkrBattleLvupHanlder(struct ProcEkrBattle * proc)
{
    int c;

    if (++proc->timer == 0x18) {
        if (gBanimExpGain[EKR_POS_L] != 0)
            c = gBanimExpPrevious[EKR_POS_L] + gBanimExpGain[EKR_POS_L];
        else
            c = gBanimExpPrevious[EKR_POS_R] + gBanimExpGain[EKR_POS_R];
        if (c >= 100)
            NewEkrLvlupFan();
    }

    if (proc->timer <= 0x28)
        return;

    SpellFx_ClearBG1();
    EkrGauge_0804CC68(0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetWin0Box(0, 0, 0xF0, 0xA0);

    if (gBanimExpGain[EKR_POS_L] != 0)
        c = gBanimExpPrevious[EKR_POS_L] + gBanimExpGain[EKR_POS_L];
    else
        c = gBanimExpPrevious[EKR_POS_R] + gBanimExpGain[EKR_POS_R];
    if (c >= 100)
        proc->proc_idleCb = (ProcFunc)EkrBattleExecEkrLvup;
    else
        proc->proc_idleCb = (ProcFunc)EkrBattleExecPopup;
}

void EkrBattleExecEkrLvup(struct ProcEkrBattle * proc)
{
    struct Anim * anim;

    if (gBanimExpGain[EKR_POS_L] != 0)
        anim = gAnims[EKR_POS_L * 2];
    else
        anim = gAnims[EKR_POS_R * 2];

    NewEkrLevelup(anim);
    proc->proc_idleCb = (ProcFunc)EkrBattleWaitLvup;
}

void EkrBattleWaitLvup(struct ProcEkrBattle * proc)
{
    if (CheckEkrLvupDone() == true) {
        EndEkrLevelUp();
        proc->proc_idleCb = (ProcFunc)EkrBattleExecPopup;
    }
}

void EkrBattleExecPopup(struct ProcEkrBattle * proc)
{
    NewEkrPopup();
    proc->proc_idleCb = (ProcFunc)EkrBattleWaitPopup;
}

void EkrBattleWaitPopup(struct ProcEkrBattle * proc)
{
    if (CheckEkrPopupDone() == true) {
        EndEkrPopup();
        proc->proc_idleCb = (ProcFunc)EkrBattlePrepareEnding;
    }
}

void EkrBattlePrepareEnding(struct ProcEkrBattle * proc)
{
    EndEfxStatusUnits(gAnims[0]);
    EndEfxStatusUnits(gAnims[2]);
    EndProcEfxWeaponIcon();
    EndEfxHPBarColorChange();
    proc->side = gEkrInitialHitSide;
    proc->counter = 0;
    proc->proc_idleCb = (ProcFunc)EkrBattleStartDragonEnding;
}

void EkrBattleStartDragonEnding(struct ProcEkrBattle * proc)
{
    if (proc->counter == 2) {
        proc->proc_idleCb = (ProcFunc)EkrBattlePostDragonEnding;
        return;
    }

    if (proc->side == EKR_POS_L) {
        proc->anim = gAnims[0];
        if (GetEkrDragonStatusType(proc->anim) != 0) {
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)EkrBattleWaitDragonEnding;
        }
        proc->side = EKR_POS_R;
    } else {
        proc->anim = gAnims[2];
        if (GetEkrDragonStatusType(proc->anim) != 0) {
            SetEkrDragonExit(proc->anim);
            proc->proc_idleCb = (ProcFunc)EkrBattleWaitDragonEnding;
        }
        proc->side = EKR_POS_L;
    }

    proc->counter++;
}

void EkrBattleWaitDragonEnding(struct ProcEkrBattle * proc)
{
    if (CheckEkrDragonEndingDone(proc->anim) == true)
        proc->proc_idleCb = (ProcFunc)EkrBattleStartDragonEnding;
}

void EkrBattlePostDragonEnding(struct ProcEkrBattle * proc)
{
    gEkrBattleEndFlag = 1;

    if (gEkrDebugModeMaybe == 0) {
        NewEkrNamewinAppear(2, 7, 0);
        EkrRestoreBGM();
    }

    proc->proc_idleCb = (ProcFunc)EkrBattlePostEndDelay;
}

void EkrBattlePostEndDelay(struct ProcEkrBattle * proc)
{
    return;
}
