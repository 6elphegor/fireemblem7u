#include "gbafe.h"

struct ProcEkrBaseKaiten {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 x1;
    /* 34 */ s16 x2;
    /* 36 */ STRUCT_PAD(0x36, 0x3A);
    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
    /* 3E */ STRUCT_PAD(0x3E, 0x44);
    /* 44 */ int type;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct Anim * anim;
};

struct ProcUnitKakudai {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x44);
    /* 44 */ int type;
    /* 48 */ STRUCT_PAD(0x48, 0x4C);
    /* 4C */ int valid_l;
    /* 50 */ int valid_r;
};

struct ProcEkrIntroWindow {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 ymax;
    /* 32 */ STRUCT_PAD(0x32, 0x44);
    /* 44 */ int type;
    /* 48 */ int ymax_name;
};

extern struct Vec2 gEkrBg0QuakeVec;
extern int gEkrWindowAppearExist;
extern int gEkrNamewinAppearExist;
extern int gProcEkrBaseAppearExist;

extern struct ProcCmd CONST_DATA ProcScr_ekrUnitKakudai[];
extern struct ProcCmd CONST_DATA ProcScr_ekrWindowAppear[];
extern struct ProcCmd CONST_DATA ProcScr_ekrNamewinAppear[];
extern struct ProcCmd CONST_DATA ProcScr_ekrBaseAppear[];

void EkrGauge_0804CC78(s16 x, s16 y);
void EkrGauge_ClrInitFlag(void);
void EkrGauge_SetInitFlag(void);
void EkrDispUP_SetPositionUnsync(u16 x, u16 y);
void UnsyncEkrDispUP(void);
void SyncEkrDispUP(void);
void EndEkrDispUP(void);

ASM_FUNC("asm/nonmatching/code_08051274.s");

void EkrBaseKaitenMain(struct ProcEkrBaseKaiten * proc)
{
    struct Anim * anim = proc->anim;

    if (proc->timer >= proc->terminator)
    {
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    if (proc->type == 0)
    {
        anim->xPosition = Interpolate(0, proc->x1, proc->x2, proc->timer, proc->terminator);
        anim->yPosition = Interpolate(0, proc->y1, proc->y2, proc->timer, proc->terminator);
    }
    else
    {
        anim->xPosition = Interpolate(0, proc->x2, proc->x1, proc->timer, proc->terminator);
        anim->yPosition = Interpolate(0, proc->y2, proc->y1, proc->timer, proc->terminator);
    }

    if (proc->timer <= proc->terminator)
        proc->timer++;
}

void NewEkrUnitKakudai(int identifier)
{
    struct ProcUnitKakudai * proc = Proc_Start(ProcScr_ekrUnitKakudai, PROC_TREE_3);

    proc->type = identifier;
    proc->valid_r = 0;
    proc->valid_l = 0;

    switch (gEkrDistanceType)
    {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
        if (gBanimValid[0] == TRUE && CheckInEkrDragon() == 0)
            proc->valid_l = 1;

        if (gBanimValid[1] == TRUE)
            proc->valid_r = 1;
        return;

    case EKR_DISTANCE_PROMOTION:
        if (identifier == 0)
        {
            proc->valid_l = 0;
            proc->valid_r = 1;
        }
        else
        {
            proc->valid_l = 1;
            proc->valid_r = 0;
        }
        break;

    default:
        break;
    }
}

ASM_FUNC("asm/nonmatching/code_0805175C.s");

ASM_FUNC("asm/nonmatching/code_080518E8.s");

void UnitKakudaiEndNop(struct ProcUnitKakudai * proc)
{
    Proc_Break(proc);
}

void NewEkrWindowAppear(int identifier, int duration)
{
    int iy;

    struct ProcEkrIntroWindow * proc = Proc_Start(ProcScr_ekrWindowAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = 0x39;

    if (identifier == 0)
        iy = 0x39;
    else
        iy = 0x00;

    EkrGauge_0804CC78(gEkrBg0QuakeVec.x, (u16) gEkrBg0QuakeVec.y + iy);
    gEkrWindowAppearExist = TRUE;
    EkrGauge_ClrInitFlag();
}

bool CheckEkrWindowAppearUnexist(void)
{
    if (gEkrWindowAppearExist == FALSE)
        return TRUE;

    return FALSE;
}

void EkrWindowAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gEkrWindowAppearExist = FALSE;
        EkrGauge_SetInitFlag();
        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, proc->ymax, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, proc->ymax, proc->timer, proc->terminator);

    EkrGauge_0804CC78(gEkrBg0QuakeVec.x, (u16) gEkrBg0QuakeVec.y + iy);
}

void NewEkrNamewinAppear(int identifier, int duration, int delay)
{
    struct ProcEkrIntroWindow * proc = Proc_Start(ProcScr_ekrNamewinAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = delay;
    proc->ymax_name = -49;

    if (identifier == 0)
        EkrDispUP_SetPositionUnsync(0, proc->ymax_name);
    else
        EkrDispUP_SetPositionUnsync(0, 0);

    gEkrNamewinAppearExist = TRUE;
    UnsyncEkrDispUP();
}

bool CheckEkrNamewinAppearUnexist(void)
{
    if (gEkrNamewinAppearExist == FALSE)
        return TRUE;

    return FALSE;
}

void EkrNamewinAppearDelay(struct ProcEkrIntroWindow * proc)
{
    if (proc->timer == proc->ymax)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void EkrNamewinAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gEkrNamewinAppearExist = FALSE;
        SyncEkrDispUP();

        if (proc->type == 2)
            EndEkrDispUP();

        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, proc->ymax_name, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, proc->ymax_name, proc->timer, proc->terminator);

    EkrDispUP_SetPositionUnsync(0, iy);
}

void NewEkrBaseAppear(int identifier, int duration)
{
    struct ProcEkrIntroWindow * proc = Proc_Start(ProcScr_ekrBaseAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;

    if (identifier == 0)
        SetBgOffset(2, 0, -0x58);
    else
        SetBgOffset(2, 0, 0);

    gProcEkrBaseAppearExist = TRUE;
}

bool CheckEkrBaseAppearUnexist(void)
{
    if (gProcEkrBaseAppearExist == FALSE)
        return TRUE;

    return FALSE;
}

void EkrBaseAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gProcEkrBaseAppearExist = FALSE;
        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, -0x50, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, -0x50, proc->timer, proc->terminator);

    SetBgOffset(2, 0, iy);
}

ASM_FUNC("asm/nonmatching/code_08051D50.s");

ASM_FUNC("asm/nonmatching/code_08052858.s");
