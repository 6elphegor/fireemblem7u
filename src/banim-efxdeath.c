#include "gbafe.h"
#include "gbafe/banim_ekrdragon.h"

/**
 * Unit death effects (fireemblem8u: banim-efxdeath.c)
 */

struct ProcEfxDead {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim * anim1;
    /* 60 */ struct Anim * anim2;
};
PROC_SIZE_CHECK(struct ProcEfxDead);

extern u32 gEkrHpBarCount;
extern u32 gEkrDeadEventExist;
extern int gEkrDeadExist;
extern u32 gEfxSpellAnimExists;
extern int gEfxBgSemaphore;
extern u32 gEkrInitPosReal;
extern s16 gEkrDistanceType;
extern u8 gEkrPids[2];

void NewEfxDead(struct Anim * anim1, struct Anim * anim2);
void NewEfxDeadPika(struct Anim * anim1, struct Anim * anim2);
void NewEfxDeadAlpha(struct Anim * anim1, struct Anim * anim2);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EnableEkrGauge(void);
void DisableEkrGauge(void);
void EfxPrepareScreenFx(void);
void PlayDeathSoundForArena(void);
void DisplayDefeatTalkForPid(u8 pid);
void M4aPlayWithPostionCtrl(int songid, int x, int flag);

void EfxDeadAlphaMain(struct ProcEfxDead * proc);
void EfxDeadPikaMain(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_A(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_B(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_C(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_D(struct ProcEfxDead * proc);
void efxDeadEvent_Loop_E(struct ProcEfxDead * proc);
void efxDead_Loop_A(struct ProcEfxDead * proc);
void efxDead_Loop_B(struct ProcEfxDead * proc);

CONST_DATA struct ProcCmd ProcScr_efxDeadEvent[] = {
    PROC_19,
    PROC_REPEAT(efxDeadEvent_Loop_A),
    PROC_REPEAT(efxDeadEvent_Loop_B),
    PROC_REPEAT(efxDeadEvent_Loop_C),
    PROC_REPEAT(efxDeadEvent_Loop_D),
    PROC_REPEAT(efxDeadEvent_Loop_E),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxDead[] = {
    PROC_19,
    PROC_REPEAT(efxDead_Loop_A),
    PROC_REPEAT(efxDead_Loop_B),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxDeadPika[] = {
    PROC_19,
    PROC_REPEAT(EfxDeadPikaMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxDeadAlpha[] = {
    PROC_19,
    PROC_REPEAT(EfxDeadAlphaMain),
    PROC_END,
};

void NewEfxDeadEvent(struct Anim * anim1, struct Anim * anim2)
{
    struct ProcEfxDead * proc;
    proc = Proc_Start(ProcScr_efxDeadEvent, PROC_TREE_3);
    proc->anim1 = anim1;
    proc->anim2 = anim2;

    gEkrDeadEventExist = true;
}

void efxDeadEvent_Loop_A(struct ProcEfxDead * proc)
{
    struct Anim * ais_core1 = GetAnimAnotherSide(proc->anim1);
    int ret = false;

    if (gEfxBgSemaphore == 0 && gEfxSpellAnimExists == 0) {
        if (gBanimDoneFlag[GetAnimPosition(ais_core1)] == true)
            ret = true;
    }

    if (ret != true)
        return;

    proc->timer = 7;

    if (gEkrDistanceType != 0 && GetAnimPosition(proc->anim1) != gEkrInitPosReal) {
        NewEfxFarAttackWithDistance(ais_core1, -1);
        proc->timer = 0;
    }

    Proc_Break(proc);
}

void efxDeadEvent_Loop_B(struct ProcEfxDead * proc)
{
    if (++proc->timer == 8) {
        NewEkrWindowAppear(1, 7);
        NewEkrNamewinAppear(1, 7, 0);
        Proc_Break(proc);
    }
}

void efxDeadEvent_Loop_C(struct ProcEfxDead * proc)
{
    if (CheckEkrWindowAppearUnexist() == true) {
        EnableEkrGauge();
        AsyncEkrDispUP();

        CpuFastFill(0, gBg0Tm, 0x800);
        SetBgOffset(0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        SetBgOffset(1, 0, 0);
        EnableBgSync(BG0_SYNC_BIT);

        EkrGauge_Set4C50();

        DisplayDefeatTalkForPid(gEkrPids[GetAnimPosition(proc->anim1)]);
        Proc_Break(proc);
    }
}

void efxDeadEvent_Loop_D(struct ProcEfxDead * proc)
{
    if (IsEventRunning() == false) {
        PlayDeathSoundForArena();
        NewEfxDead(proc->anim1, proc->anim2);
        EfxPrepareScreenFx();
        gBanimValid[GetAnimPosition(proc->anim1)] = false;
        EnableBgSync(BG0_SYNC_BIT);
        NewEkrWindowAppear(0, 7);
        NewEkrNamewinAppear(0, 7, 0);

        DisableEkrGauge();
        UnAsyncEkrDispUP();
        EkrGauge_Clr4C50();
        Proc_Break(proc);
    }
}

void efxDeadEvent_Loop_E(struct ProcEfxDead * proc)
{
    if (CheckEkrWindowAppearUnexist() == true) {
        gEkrDeadEventExist = false;
        Proc_Break(proc);
    }
}

void NewEfxDead(struct Anim * anim1, struct Anim * anim2)
{
    struct ProcEfxDead * proc;
    gEkrHpBarCount++;
    gEkrDeadExist = 1;

    proc = Proc_Start(ProcScr_efxDead, PROC_TREE_3);
    proc->anim1 = anim1;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 0;
    DisableEfxStatusUnits(anim1);
}

void efxDead_Loop_A(struct ProcEfxDead * proc)
{
    if (gEfxBgSemaphore == false && gEfxSpellAnimExists == false) {
        if (CheckInEkrDragon() != false)
            SetEfxDragonDeadFallHead(proc->anim1);
        else
            NewEfxDeadPika(proc->anim1, proc->anim2);

        proc->terminator = 0x32;
        Proc_Break(proc);
    }
}

void efxDead_Loop_B(struct ProcEfxDead * proc)
{
    struct Anim * anim = proc->anim1;
    s16 time = ++proc->timer;

    if (time == 0x1E) {
        if (CheckEfxDragonDeadFallHead(anim) == true)
            return;

        NewEfxDeadAlpha(proc->anim1, proc->anim2);
        EfxPlaySE(0xD6, 0x100);
        M4aPlayWithPostionCtrl(0xD6, anim->xPosition, 1);
        proc->terminator = 0x32;
        return;
    }

    if (time == proc->terminator) {
        gEkrHpBarCount--;
        gEkrDeadExist = 0;
        Proc_Break(proc);
    }
}

void NewEfxDeadPika(struct Anim * anim1, struct Anim * anim2)
{
    struct ProcEfxDead * proc;
    proc = Proc_Start(ProcScr_efxDeadPika, PROC_TREE_3);

    proc->anim1 = anim1;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 0;
}

void EfxDeadPikaMain(struct ProcEfxDead * proc)
{
    struct Anim * anim1 = proc->anim1;
    struct Anim * anim2 = proc->anim2;

    if (++proc->timer > 0x6) {
        anim1->state &= ~0x2;
        anim2->state &= ~0x2;

        proc->timer = 0;
        proc->terminator++;
    } else {
        anim1->state |= 0x2;
        anim2->state |= 0x2;
    }

    if (proc->terminator > 0x5) {
        proc->timer = 0;
        proc->terminator = 0;
        Proc_Break(proc);
    }
}

void NewEfxDeadAlpha(struct Anim * anim1, struct Anim * anim2)
{
    struct ProcEfxDead * proc;
    proc = Proc_Start(ProcScr_efxDeadAlpha, PROC_TREE_3);

    proc->anim1 = anim1;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 0;

    anim1->drawLayerPriority = 0xA;
    anim2->drawLayerPriority = 0xA;
    AnimSort();

    SetBlendConfig(0, 0x10, 0x10, 0x0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 0);

    gDispIo.blend_ct.target2_enable_bd = true;
}

void EfxDeadAlphaMain(struct ProcEfxDead * proc)
{
    struct Anim * anim1 = proc->anim1;
    struct Anim * anim2 = proc->anim2;
    int alpha;

    anim1->oamBase |= 0x400;
    anim2->oamBase |= 0x400;

    if (++proc->timer > 0x3C) {
        anim1->state |= 0x2;
        anim2->state |= 0x2;

        anim1->oamBase &= ~0x400;
        anim2->oamBase &= ~0x400;

        SetBlendNone();
        Proc_Break(proc);
        return;
    }

    alpha = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x3C);
    SetBlendConfig(0, alpha, 0x10, 0);
}
