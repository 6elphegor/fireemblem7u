#include "gbafe.h"

/**
 * Battle hp-bar change effects (fireemblem8u: banim-efxhpbar.c)
 */

struct ProcEfxHpBar {
    PROC_HEADER;

    /* 29 */ u8 death;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 cur;
    STRUCT_PAD(0x30, 0x48);
    /* 48 */ int diff;
    /* 4C */ int this;
    /* 50 */ int next;
    /* 54 */ int timer2;
    /* 58 */ int finished;
    /* 5C */ struct Anim * anim_main_other;
    /* 60 */ struct Anim * anim_main_this;
    /* 64 */ struct Anim * anim_this;
};

extern const s16 gEfxNoDmgBgShakeOff[];

extern u32 gEkrHpBarCount;
extern u32 gEfxSpellAnimExists;
extern s16 gEkrHitNow[2];
extern s16 gEfxHpLutOff[2];
extern s16 gEkrGaugeHp[2];
extern u8 gEkrPids[2];
extern int gEfxBgSemaphore;
extern u32 gEfxHpBarResireFlag;
extern s16 gEkrDistanceType;

s8 CheckBattleDefeatTalk(u8 pid);
void PlayDeathSoundForArena(void);
void NewEfxDeadEvent(struct Anim * anim1, struct Anim * anim2);
void NewEfxDead(struct Anim * anim1, struct Anim * anim2);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void NewEfxDamageMojiEffect(struct Anim * anim, int hitted);
void M4aPlayWithPostionCtrl(int songid, int x, int flag);
void NewEfxNoDamageYure(struct Anim * anim1, struct Anim * anim2);

void EfxAvoidMain(struct ProcEfxHpBar * proc);
void EfxHPBarLiveMain(struct ProcEfxHpBar * proc);
void EfxHpBarResire_DeclineToDeath(struct ProcEfxHpBar * proc);
void EfxHpBarResire_SetAnotherSide(struct ProcEfxHpBar * proc);
void EfxHpBarResire_WaitOnCurrentSide(struct ProcEfxHpBar * proc);
void EfxHpBar_DeclineToDeath(struct ProcEfxHpBar * proc);
void EfxHpBar_MoveCameraOnEnd(struct ProcEfxHpBar * proc);
void EfxHpBar_WaitCameraMove(struct ProcEfxHpBar * proc);
void EfxNoDamageMain(struct ProcEfxHpBar * proc);
void EfxNoDamageYureMain(struct ProcEfxHpBar * proc);
void EfxStatusCHGMain(struct ProcEfxHpBar * proc);

CONST_DATA struct ProcCmd ProcScr_efxHPBar[] = {
    PROC_19,
    PROC_REPEAT(EfxHpBar_DeclineToDeath),
    PROC_REPEAT(EfxHpBar_MoveCameraOnEnd),
    PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_EfxHpBarResire[] = {
    PROC_19,
    PROC_REPEAT(EfxHpBarResire_WaitOnCurrentSide),
    PROC_REPEAT(EfxHpBarResire_SetAnotherSide),
    PROC_REPEAT(EfxHpBarResire_DeclineToDeath),
    PROC_REPEAT(EfxHpBar_MoveCameraOnEnd),
    PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_EfxAvoid[] = {
    PROC_19,
    PROC_REPEAT(EfxAvoidMain),
    PROC_REPEAT(EfxHpBar_MoveCameraOnEnd),
    PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxHPBarLive[] = {
    PROC_19,
    PROC_REPEAT(EfxHPBarLiveMain),
    PROC_REPEAT(EfxHpBar_MoveCameraOnEnd),
    PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxNoDamage[] = {
    PROC_19,
    PROC_REPEAT(EfxNoDamageMain),
    PROC_REPEAT(EfxHpBar_MoveCameraOnEnd),
    PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxNoDamageYure[] = {
    PROC_19,
    PROC_REPEAT(EfxNoDamageYureMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxStatusCHG[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxStatusCHGMain),
    PROC_REPEAT(EfxHpBar_MoveCameraOnEnd),
    PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};

int CheckEkrHitDone(void)
{
    if (gEkrHpBarCount == 0 && gEfxSpellAnimExists == 0)
        return true;
    else
        return false;
}

short EkrEfxIsUnitHittedNow(int pos)
{
    return gEkrHitNow[pos];
}

/* During dmage, cause hp bar change value effect */
void NewEfxHPBar(struct Anim * anim)
{
    s16 off_this, off_next;
    struct ProcEfxHpBar * proc;

    if (gEkrHpBarCount != 0)
        return;

    gEkrHpBarCount = 1;

    proc = Proc_Start(ProcScr_efxHPBar, PROC_TREE_3);
    proc->anim_this = anim;

    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        proc->anim_main_other = gAnims[EKR_POS_R * 2];
        proc->anim_main_this  = gAnims[EKR_POS_L * 2];
    }
    else
    {
        proc->anim_main_other = gAnims[EKR_POS_L * 2];
        proc->anim_main_this  = gAnims[EKR_POS_R * 2];
    }

    off_this = gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)];
    off_next = off_this + 1;

    proc->this = GetEfxHp(off_this * 2 + GetAnimPosition(proc->anim_main_this));
    proc->next = GetEfxHp(off_next * 2 + GetAnimPosition(proc->anim_main_this));

    if (proc->this > proc->next)
        proc->diff = -1;
    else
        proc->diff = 1;

    proc->timer = 0;
    proc->cur = proc->this;
    proc->timer2 = 0;
    proc->finished = false;
    gEkrHitNow[GetAnimPosition(proc->anim_main_this)] = 1;
}

void EfxHpBar_DeclineToDeath(struct ProcEfxHpBar * proc)
{
    struct Anim * anim_f = gAnims[GetAnimPosition(proc->anim_main_this) * 2];
    struct Anim * anim_b = gAnims[GetAnimPosition(proc->anim_main_this) * 2 + 1];

    if (proc->finished == false)
    {
        if (++proc->timer == 2)
        {
            proc->timer = 0;
            proc->cur += proc->diff;
            gEkrGaugeHp[GetAnimPosition(proc->anim_main_this)] += proc->diff;

            if (proc->cur == proc->next)
                proc->finished = true;
        }
    }

    if (proc->timer2 == 0x1E && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)]++;
        gEkrHitNow[GetAnimPosition(proc->anim_main_this)] = 0;
    
        if (proc->next == 0)
        {
            int ret;
            if (GetBanimLinkArenaFlag() == true)
                ret = 0;
            else
                ret = CheckBattleDefeatTalk(gEkrPids[GetAnimPosition(anim_f)]);

            if (ret == true)
                NewEfxDeadEvent(anim_f, anim_b);
            else
            {
                PlayDeathSoundForArena();
                NewEfxDead(anim_f, anim_b);
                gBanimValid[GetAnimPosition(proc->anim_main_this)] = false;
            }
        }

        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x1Eu)
        proc->timer2 = 0x1E;
}

void EfxHpBar_MoveCameraOnEnd(struct ProcEfxHpBar * proc)
{
    struct Anim * anim;

    if (gEfxBgSemaphore == 0 && gEfxSpellAnimExists == 0)
    {
        proc->timer = 0;
        proc->cur = 1;
        anim = GetAnimAnotherSide(proc->anim_this);

        if (CheckRound2(GetAnimNextRoundType(anim)) == 1)
        {
            switch (gEkrDistanceType) {
            case EKR_DISTANCE_CLOSE:
            case EKR_DISTANCE_FAR:
            case EKR_DISTANCE_MONOCOMBAT:
            case EKR_DISTANCE_PROMOTION:
                proc->cur = 16;
                NewEfxFarAttackWithDistance(GetAnimAnotherSide(anim), -1);
                break;

            case EKR_DISTANCE_FARFAR:
                proc->cur = 20;
                NewEfxFarAttackWithDistance(GetAnimAnotherSide(anim), -1);
                break;
            }
        }

        Proc_Break(proc);
    }
}

void EfxHpBar_WaitCameraMove(struct ProcEfxHpBar * proc)
{
    if (++proc->timer == (proc->cur - 4))
    {
        GetAnimAnotherSide(proc->anim_this);
        EnableBgSync(BG2_SYNC_BIT);
    }
    else if (proc->timer == proc->cur)
    {
        gEkrHpBarCount--;
        Proc_Break(proc);
    }
}

void NewEfxHpBarResire(struct Anim * anim)
{
    s16 off_this, off_next;
    struct ProcEfxHpBar * proc;

    if (gEkrHpBarCount != 0)
        return;

    gEkrHpBarCount = 1;

    proc = Proc_Start(ProcScr_EfxHpBarResire, PROC_TREE_3);
    proc->anim_this = GetAnimAnotherSide(anim);

    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        proc->anim_main_other = gAnims[EKR_POS_R * 2];
        proc->anim_main_this  = gAnims[EKR_POS_L * 2];
    }
    else
    {
        proc->anim_main_other = gAnims[EKR_POS_L * 2];
        proc->anim_main_this  = gAnims[EKR_POS_R * 2];
    }

    off_this = gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)];
    off_next = off_this + 1;

    proc->this = GetEfxHp(off_this * 2 + GetAnimPosition(proc->anim_main_this));
    proc->next = GetEfxHp(off_next * 2 + GetAnimPosition(proc->anim_main_this));

    if (proc->this > proc->next)
        proc->diff = -1;
    else
        proc->diff = 1;

    proc->death = false;
    proc->timer = 0;
    proc->cur = proc->this;
    proc->timer2 = 0;
    proc->finished = false;
    gEfxHpBarResireFlag = 0;
    gEkrHitNow[GetAnimPosition(proc->anim_main_this)] = 1;
}

void EfxHpBarResire_WaitOnCurrentSide(struct ProcEfxHpBar * proc)
{
    GetAnimPosition(proc->anim_main_this);
    GetAnimPosition(proc->anim_main_this);

    if (proc->finished == false)
    {
        if (++proc->timer == 2)
        {
            proc->timer = 0;
            proc->cur += proc->diff;
            gEkrGaugeHp[GetAnimPosition(proc->anim_main_this)] += proc->diff;

            if (proc->cur == proc->next)
                proc->finished = true;
        }
    }

    if (proc->timer2 == 0x54 && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)]++;
        gEkrHitNow[GetAnimPosition(proc->anim_main_this)] = 0;

        if (proc->next == 0)
            proc->death = true;

        proc->timer = 0;
        proc->cur = 10;
        gEfxHpBarResireFlag = 1;

        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x54u)
        proc->timer2 = 0x54;
}

void EfxHpBarResire_SetAnotherSide(struct ProcEfxHpBar * proc)
{
    s16 off_this, off_next;

    if (++proc->timer <= proc->cur)
        return;

    off_this = gEfxHpLutOff[GetAnimPosition(proc->anim_main_other)];
    off_next = off_this + 1;

    proc->this = GetEfxHp(off_this * 2 + GetAnimPosition(proc->anim_main_other));
    proc->next = GetEfxHp(off_next * 2 + GetAnimPosition(proc->anim_main_other));

    proc->timer = 0;
    proc->cur = proc->this;
    proc->timer2 = 0;
    proc->finished = false;

    if (proc->this == proc->next)
        proc->finished = true;

    if (proc->this > proc->next)
        proc->diff = -1;
    else
        proc->diff = 1;

    Proc_Break(proc);
    gEkrHitNow[GetAnimPosition(proc->anim_main_other)] = 2;
}

void EfxHpBarResire_DeclineToDeath(struct ProcEfxHpBar * proc)
{
    struct Anim * anim_main_other_f, * anim_main_other_b, * anim_main_this_f, * anim_main_this_b;

    anim_main_other_f = gAnims[GetAnimPosition(proc->anim_main_other) * 2];
    anim_main_other_b = gAnims[GetAnimPosition(proc->anim_main_other) * 2 + 1];
    anim_main_this_f  = gAnims[GetAnimPosition(proc->anim_main_this) * 2];
    anim_main_this_b  = gAnims[GetAnimPosition(proc->anim_main_this) * 2 + 1];

    if (proc->finished == false)
    {
        if (++proc->timer == 4)
        {
            proc->timer = 0;
            proc->cur += proc->diff;
            gEkrGaugeHp[GetAnimPosition(proc->anim_main_other)] += proc->diff;
            EfxPlaySE(0x395, 0x100);
            M4aPlayWithPostionCtrl(0x395, anim_main_other_f->xPosition, 1);

            if (proc->cur == proc->next)
                proc->finished = true;
        }
    }

    if (proc->timer2 == 30 && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_other)]++;
        gEkrHitNow[GetAnimPosition(proc->anim_main_other)] = 0;
    
        if (proc->death == true)
        {
            int ret;
            if (GetBanimLinkArenaFlag() == true)
                ret = 0;
            else
                ret = CheckBattleDefeatTalk(gEkrPids[GetAnimPosition(anim_main_this_f)]);

            if (ret == true)
                NewEfxDeadEvent(anim_main_this_f, anim_main_this_b);
            else
            {
                PlayDeathSoundForArena();
                NewEfxDead(anim_main_this_f, anim_main_this_b);
                gBanimValid[GetAnimPosition(proc->anim_main_this)] = false;
            }
        }
    
        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x1Eu)
        proc->timer2 = 0x1E;
}

void NewEfxAvoid(struct Anim * anim)
{
    s16 off_this, off_next;
    struct ProcEfxHpBar * proc;

    if (gEkrHpBarCount != 0)
        return;

    gEkrHpBarCount = 1;

    proc = Proc_Start(ProcScr_EfxAvoid, PROC_TREE_3);
    proc->timer = 0;

    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        proc->anim_main_other = gAnims[2];
        proc->anim_main_this = gAnims[0];
    }
    else
    {
        proc->anim_main_other = gAnims[0];
        proc->anim_main_this = gAnims[2];
    }

    NewEfxDamageMojiEffect(proc->anim_main_this, 1);
    proc->anim_this = anim;
    proc->death = false;
    EfxPlaySE(0xD7, 0x100);
    M4aPlayWithPostionCtrl(0xD7, anim->xPosition, 1);
}

void EfxAvoidMain(struct ProcEfxHpBar * proc)
{
    if (++proc->timer == 0x1E)
        Proc_Break(proc);
}

void NewEfxHpBarLive(struct Anim * anim)
{
    s16 off_this, off_next;
    struct ProcEfxHpBar * proc;

    if (gEkrHpBarCount != 0)
        return;

    gEkrHpBarCount = 1;

    proc = Proc_Start(ProcScr_efxHPBarLive, PROC_TREE_3);


    if (GetAnimPosition(anim) == EKR_POS_L)
    {
        proc->anim_main_other = gAnims[2];
        proc->anim_main_this  = gAnims[0];
    }
    else
    {
        proc->anim_main_other = gAnims[0];
        proc->anim_main_this  = gAnims[2];
    }

    off_this = gEfxHpLutOff[GetAnimPosition(proc->anim_main_this)];
    off_next = off_this + 1;

    proc->this = GetEfxHp(off_this * 2 + GetAnimPosition(proc->anim_main_this));
    proc->next = GetEfxHp(off_next * 2 + GetAnimPosition(proc->anim_main_this));

    proc->timer2 = 0;
    proc->finished = false;
    
    if (proc->this == proc->next)
        proc->finished = true;
    else if (proc->this > proc->next)
        proc->diff = -1;
    else
        proc->diff = 1;

    proc->timer = 0;
    proc->cur = proc->this;
    proc->anim_this = anim;
    gEkrHitNow[GetAnimPosition(proc->anim_main_other)] = 2;
}

void EfxHPBarLiveMain(struct ProcEfxHpBar * proc)
{
    struct Anim * anim = proc->anim_main_this;

    if (proc->finished == false)
    {
        if (++proc->timer == 4)
        {
            proc->timer = 0;
            proc->cur += proc->diff;
            gEkrGaugeHp[GetAnimPosition(anim)] += proc->diff;

            EfxPlaySE(0x395, 0x100);
            M4aPlayWithPostionCtrl(0x395, anim->xPosition, 1);

            if (proc->cur == proc->next)
                proc->finished = true;
        }
    }

    if (proc->timer2 == 0x1E && proc->finished == true)
    {
        gEfxHpLutOff[GetAnimPosition(anim)]++;
        gEkrHitNow[GetAnimPosition(anim)] = 0;
        Proc_Break(proc);
        return;
    }

    if (++proc->timer2 >= 0x1Eu)
        proc->timer2 = 0x1E;
}

void NewEfxNoDmage(struct Anim * anim1, struct Anim * anim2, int death)
{
    struct ProcEfxHpBar * proc;

    gEkrHpBarCount++;
    proc = Proc_Start(ProcScr_efxNoDamage, PROC_TREE_3);
    proc->anim_main_other = anim1;
    proc->anim_main_this = anim2;
    proc->timer = 0;
    proc->death = death;
    proc->anim_this = anim1;
    NewEfxDamageMojiEffect(proc->anim_main_other, 0);
    NewEfxNoDamageYure(proc->anim_main_other, proc->anim_main_this);
}

void EfxNoDamageMain(struct ProcEfxHpBar * proc)
{
    s32 time;
    struct Anim * anim = GetAnimAnotherSide(proc->anim_main_other);

    ++proc->timer;
    time = proc->timer;
    if (time == 8)
    {
        gEfxHpLutOff[GetAnimPosition(proc->anim_main_other)]++;
    
        if (proc->death == true)
            gEfxHpLutOff[GetAnimPosition(anim)]++;
    
        Proc_Break(proc);
    }
}

void NewEfxNoDamageYure(struct Anim * anim1, struct Anim * anim2)
{
    struct ProcEfxHpBar *proc = Proc_Start(ProcScr_efxNoDamageYure, PROC_TREE_3);
    proc->anim_main_other = anim1;
    proc->anim_main_this = anim2;
    proc->timer = 0;
    proc->cur = 0;
}

void EfxNoDamageYureMain(struct ProcEfxHpBar * proc)
{
    s16 off_this;
    struct Anim *anim1 = proc->anim_main_other;
    struct Anim *anim2 = proc->anim_main_this;

    if (gEfxNoDmgBgShakeOff[proc->timer] == -1)
    {
        anim1->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_other)] - gEkrBgPosition;
        anim2->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_this)]  - gEkrBgPosition;

        Proc_Break(proc);
    }
    else
    {
        if (GetAnimPosition(anim1) == 1)
            off_this = -gEfxNoDmgBgShakeOff[proc->timer];
        else
            off_this = gEfxNoDmgBgShakeOff[proc->timer];

        anim1->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_other)] - (s32)gEkrBgPosition + off_this;
        anim2->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_this)]  - (s32)gEkrBgPosition + off_this;
        proc->timer++;
    }
}

void NewEfxStatusCHG(struct Anim * anim)
{
    struct ProcEfxHpBar *proc;

    if (gEkrHpBarCount == 0) {
        gEkrHpBarCount = 1;
        proc = Proc_Start(ProcScr_efxStatusCHG, PROC_TREE_3);
        proc->timer = 0;
        proc->anim_this = anim;
    }
}

void EfxStatusCHGMain(struct ProcEfxHpBar * proc)
{
    if (++proc->timer == 0x11)
        Proc_Break(proc);
}

