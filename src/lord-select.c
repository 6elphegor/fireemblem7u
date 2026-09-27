#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_LordSelect[] = {
    PROC_19,
    PROC_YIELD,
    PROC_CALL(sub_080AED04),
    PROC_REPEAT(sub_080AEDF0),
PROC_LABEL(PROCLABEL_LORD_SELECT_4),
    PROC_CALL(sub_080AEEC0),
    PROC_SLEEP(60),
PROC_LABEL(5),
    PROC_CALL(ClassReel_OnEnd),
    PROC_SLEEP(30),
    PROC_END,
};

void sub_080AED04(struct ProcLordSelect * proc)
{
    gDispIo.disp_ct.mode = DISPCNT_MODE_0;

    InitBgs(NULL);

    NewEfxAnimeDrvProc();
    ResetClassReelSpell();

    proc->unk_38 = 0;
    proc->unk_3C = 0;

    SetDispEnable(0, 0, 0, 0, 0);

    SetBgOffset(BG_0, 0, 0);
    SetBgOffset(BG_1, 0, 0);
    SetBgOffset(BG_2, 0, 0);
    SetBgOffset(BG_3, 0, 0);

    proc->unk_34 = 0;
    proc->stat = LORD_SELECT_STAT_2;
    proc->unk_32 = 0;
}

void sub_080AED8C(struct ProcLordSelect * proc)
{
    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_BmFadeOUT));
    EndAllProcChildren(proc);

    FadeBgmOut(1);
    SetDispEnable(0, 0, 0, 0, 0);

    SetNextGameAction(GAME_ACTION_EVENT_RETURN);

    Proc_Goto(proc, PROCLABEL_LORD_SELECT_5);
}

void sub_080AEDF0(struct ProcLordSelect * proc)
{
    switch (proc->stat) {
    case LORD_SELECT_STAT_2:
        proc->unk_4C = GetClassReelEntry(proc->unk_33, proc->unk_34);

        if (proc->unk_4C == 0)
        {
            SetNextGameAction(GAME_ACTION_CLASS_REEL);
            Proc_Goto(proc, PROCLABEL_LORD_SELECT_4);
            return;
        }

        proc->unk_34++;
        proc->stat = LORD_SELECT_STAT_1;
        sub_080AF344(proc, proc->unk_4C);
        break;

    case LORD_SELECT_STAT_3:
        StartClassAnimDisplay(proc, proc->unk_4C);
        proc->stat = LORD_SELECT_STAT_1;
        break;

    case LORD_SELECT_STAT_1:
        if (gpKeySt->held & (A_BUTTON | B_BUTTON | START_BUTTON))
            sub_080AED8C(proc);

        break;

    default:
        break;
    }
}

bool sub_080AEE74(void)
{
    struct ProcLordSelect * proc = Proc_Find(ProcScr_LordSelect);

    if (proc && GetClassReelEntry(proc->unk_33, proc->unk_34) == 0)
        return true;

    return false;
}

void SetLordSelectState(int stat)
{
    struct ProcLordSelect * proc = Proc_Find(ProcScr_LordSelect);

    if (proc)
        proc->stat = stat;
}

void sub_080AEEC0(struct ProcLordSelect * proc)
{
    FadeBgmOut(3);
}

void ClassReel_OnEnd(struct ProcLordSelect * proc)
{
    EndAllProcChildren(proc);
    EndEfxAnimeDrvProc();

    sub_080126E4(0);
    EndActiveClassReelBgColorProc();
}

void StartLordSelect(u8 unk_33, ProcPtr parent)
{
    struct ProcLordSelect * proc = Proc_StartBlocking(ProcScr_LordSelect, parent);

    proc->unk_33 = unk_33;
}
