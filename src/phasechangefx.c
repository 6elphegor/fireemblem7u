#include "gbafe.h"

struct PhaseIntroSubProc {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 timer;
};


extern u8 const Img_PhaseChangeSquares[];
extern u8 const Img_PhaseChangePlayer[];
extern u16 const Pal_PhaseChangePlayer[];
extern u8 const Img_PhaseChangeEnemy[];
extern u16 const Pal_PhaseChangeEnemy[];
extern u8 const Img_PhaseChangeOther[];
extern u16 const Pal_PhaseChangeOther[];

int GetCurrentBgmSong(void);

#define REG_BLDCA (*(vu8 *) REG_ADDR_BLDALPHA)
#define REG_BLDCB (*(vu8 *) (REG_ADDR_BLDALPHA + 1))

#define BGCHR_PHASE_CHANGE_SQUARES 0x100
#define BGCHR_PHASE_CHANGE_NAME 0x140
#define BGPAL_PHASE_CHANGE 5

void PhaseIntroVMatchMid(void);
void PhaseIntroVMatchLo(void);

void PhaseIntroBlendBox_InLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroBlendBox_Init(struct PhaseIntroSubProc * proc);
void PhaseIntroBlendBox_OutLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroClearText(struct PhaseIntroSubProc * proc);
void PhaseIntroInitText(struct PhaseIntroSubProc * proc);
void PhaseIntroSquares_InLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroSquares_Init(struct PhaseIntroSubProc * proc);
void PhaseIntroSquares_OutLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroText_InLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroText_OutLoop(struct PhaseIntroSubProc * proc);
void PhaseIntroText_PutText(struct PhaseIntroSubProc * proc);

CONST_DATA struct ProcCmd gProcScr_PhaseIntroText[] = {
    PROC_CALL(PhaseIntroInitText),
    PROC_SLEEP(6),
    PROC_CALL(PhaseIntroText_PutText),
    PROC_REPEAT(PhaseIntroText_InLoop),
    PROC_SLEEP(14),
    PROC_REPEAT(PhaseIntroText_OutLoop),
    PROC_CALL(PhaseIntroClearText),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_PhaseIntroSquares[] = {
    PROC_CALL(PhaseIntroSquares_Init),
    PROC_REPEAT(PhaseIntroSquares_InLoop),
    PROC_REPEAT(PhaseIntroSquares_OutLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_PhaseIntroBlendBox[] = {
    PROC_CALL(PhaseIntroBlendBox_Init),
    PROC_REPEAT(PhaseIntroBlendBox_InLoop),
    PROC_REPEAT(PhaseIntroBlendBox_OutLoop),
    PROC_END,
};

void PhaseIntroVMatchHi(void)
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.alt_blend_b_ca;
    REG_BLDCB = gBmSt.alt_blend_b_cb;

    SetNextVCount(72);
    SetOnVMatch(PhaseIntroVMatchMid);
}

void PhaseIntroVMatchMid(void)
{
    REG_BLDCNT = BLDCNT_TGT1_BG0
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.alt_blend_a_ca;
    REG_BLDCB = gBmSt.alt_blend_a_cb;

    SetNextVCount(96);
    SetOnVMatch(PhaseIntroVMatchLo);
}

void PhaseIntroVMatchLo(void)
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.alt_blend_b_ca;
    REG_BLDCB = gBmSt.alt_blend_b_cb;

    SetNextVCount(0);
    SetOnVMatch(PhaseIntroVMatchHi);
}

void PhaseIntroText_PutText(struct PhaseIntroSubProc * proc)
{
    u16 * tm = gBg0Tm + TM_OFFSET(0, 9);
    int i;

    for (i = 0; i < 0x60; ++i)
        *tm++ = TILEREF(BGCHR_PHASE_CHANGE_NAME + i, BGPAL_PHASE_CHANGE);

    EnableBgSync(BG0_SYNC_BIT);
}

void PhaseIntroInitText(struct PhaseIntroSubProc * proc)
{
    if (GetCurrentBgmSong() != GetActiveMapSong())
        FadeBgmOut(4);

    PlaySoundEffect(0x393);

    proc->timer = 15;
}

void PhaseIntroText_InLoop(struct PhaseIntroSubProc * proc)
{
    SetBgOffset(0, Interpolate(2, -0x1C, -0x40, proc->timer, 0x10), 0);

    gBmSt.alt_blend_a_ca++;
    gBmSt.alt_blend_a_cb--;

    proc->timer--;

    if (proc->timer < 0)
    {
        proc->timer = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroText_OutLoop(struct PhaseIntroSubProc * proc)
{
    SetBgOffset(0, Interpolate(5, 0x24, -0x1C, proc->timer, 0x10), 0);

    gBmSt.alt_blend_a_ca--;
    gBmSt.alt_blend_a_cb++;

    proc->timer--;

    if (proc->timer < 0)
    {
        proc->timer = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroClearText(struct PhaseIntroSubProc * proc)
{
    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
}

void PhaseIntroSquares_Init(struct PhaseIntroSubProc * proc)
{
    proc->timer = 0x4;
}

void PhaseIntroSquares_InLoop(struct PhaseIntroSubProc * proc)
{
    int x, y;

    for (y = 10 - 1; y >= 0; --y)
    {
        for (x = 15 - 1; x >= 0; --x)
        {
            int val = (x - proc->timer) + (0x15 - y);
            int newX, newY;
            if (val > 0x10)
                val = 0x10;

            if (val < 0x0)
                val = 0x0;

            val = (0x10 - val) & 0xFE;

            newX = x * 2;
            newY = y * 2;

            gBg1Tm[TM_OFFSET(newX + 0, y * 2 + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE);
            gBg1Tm[TM_OFFSET(newX + 1, y * 2 + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE);
            gBg1Tm[TM_OFFSET(newX + 0, y * 2 + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE);
            gBg1Tm[TM_OFFSET(newX + 1, y * 2 + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE);
        }
    }

    proc->timer++;

    EnableBgSync(BG1_SYNC_BIT);

    if (0x22 == proc->timer)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void PhaseIntroSquares_OutLoop(struct PhaseIntroSubProc * proc)
{
    int ix, iy;

    for (iy = 10 - 1; iy >= 0; --iy)
    {
        for (ix = 15 - 1; ix >= 0; --ix)
        {
            int val = (1 - proc->timer) + (10 + ix) + (10 - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;

            if (val < 0)
                val = 0;

            val = val & 0xFE;

            newX = ix * 2;
            newY = iy * 2;

            gBg1Tm[TM_OFFSET(newX + 0, iy * 2 + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE) + 0x400;
            gBg1Tm[TM_OFFSET(newX + 1, iy * 2 + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE) + 0x400;
            gBg1Tm[TM_OFFSET(newX + 0, iy * 2 + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE) + 0x400;
            gBg1Tm[TM_OFFSET(newX + 1, iy * 2 + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE) + 0x400;
        }
    }

    proc->timer++;

    EnableBgSync(0x2);

    if (proc->timer == 0x24)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void PhaseIntroBlendBox_Init(struct PhaseIntroSubProc * proc)
{
    proc->timer = 4;
}

void PhaseIntroBlendBox_InLoop(struct PhaseIntroSubProc * proc)
{
    int yoff, blend;

    yoff = Interpolate(5, 16, 60, proc->timer, 0x20);

    SetWin0Box(0, 8 + yoff, DISPLAY_WIDTH, -0x60 - yoff);

    blend = Interpolate(0, 0, 7, proc->timer, 0x20);

    gBmSt.alt_blend_b_ca = blend;
    gBmSt.alt_blend_b_cb = 0x10 - blend;

    proc->timer++;

    if (proc->timer == 0x20)
        Proc_Break(proc);
}

void PhaseIntroBlendBox_OutLoop(struct PhaseIntroSubProc * proc)
{
    int yoff, blend;

    yoff = Interpolate(5, 0, 60, proc->timer, 0x20);

    SetWin0Box(0, 8 + yoff, DISPLAY_WIDTH, -0x60 - yoff);

    blend = Interpolate(0, 0, 7, proc->timer, 0x20);

    gBmSt.alt_blend_b_ca = blend;
    gBmSt.alt_blend_b_cb = 0x10 - blend;

    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void PhaseIntro_EndIfNoUnits(ProcPtr proc)
{
    if (CountFactionMoveableUnits(gPlaySt.faction) == 0)
        Proc_End(proc);
}

void PhaseIntro_InitGraphics(ProcPtr proc)
{
    Decompress(Img_PhaseChangeSquares, (void *) (BG_VRAM + BGCHR_PHASE_CHANGE_SQUARES * 0x20));

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    switch (gPlaySt.faction)
    {

    case FACTION_BLUE:
        Decompress(Img_PhaseChangePlayer, (void *) (BG_VRAM + BGCHR_PHASE_CHANGE_NAME * 0x20));
        ApplyPalette(Pal_PhaseChangePlayer, BGPAL_PHASE_CHANGE);
        break;

    case FACTION_RED:
        Decompress(Img_PhaseChangeEnemy, (void *) (BG_VRAM + BGCHR_PHASE_CHANGE_NAME * 0x20));
        ApplyPalette(Pal_PhaseChangeEnemy, BGPAL_PHASE_CHANGE);
        break;

    case FACTION_GREEN:
        Decompress(Img_PhaseChangeOther, (void *) (BG_VRAM + BGCHR_PHASE_CHANGE_NAME * 0x20));
        ApplyPalette(Pal_PhaseChangeOther, BGPAL_PHASE_CHANGE);
        break;

    }
}

void PhaseIntro_InitDisp(ProcPtr proc)
{
    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin0Layers(1, 0, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    gBmSt.alt_blend_b_ca = 0;
    gBmSt.alt_blend_b_cb = 0x10;

    gBmSt.alt_blend_a_ca = 0;
    gBmSt.alt_blend_a_cb = 0x10;

    SetBlendConfig(1, gBmSt.alt_blend_b_ca, gBmSt.alt_blend_b_cb, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetVCount(0);
    SetOnVMatch(PhaseIntroVMatchHi);
}

void PhaseIntro_WaitForEnd(ProcPtr proc)
{
    SetBlendConfig(1, gBmSt.alt_blend_b_ca, gBmSt.alt_blend_b_cb, 0);

    if (Proc_Find(gProcScr_PhaseIntroText) == NULL && Proc_Find(gProcScr_PhaseIntroSquares) == NULL && Proc_Find(gProcScr_PhaseIntroBlendBox) == NULL)
    {
        ClearUi();

        SetOnVMatch(NULL);

        SetBgOffset(0, 0, 0);
        SetBgOffset(1, 0, 0);
        SetBgOffset(2, 0, 0);

        Proc_Break(proc);
    }
}
