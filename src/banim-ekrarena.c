#include "gbafe.h"

extern u16 Pal_ArenaBattleBg_B[], Pal_ArenaBattleBg_C[];

struct ProcEkrTogi
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
};

/* auto-decls */
extern const u16 NewEkrTogiColor_frames[];
void DoM4aSongNumStop(int songid);
void EfxClearScreenFx(void);
void EndEkrTogiColor(void);
extern int gBaArenaFlag;
extern u16 gEfxFrameTmap[0x2520 / 2];
// MISSING var 0x8F
// MISSING var 0x8E
extern u32 gEkrInitPosReal;
void MainUpdate_8055C68(void);
extern const struct ProcCmd gProc_ekrTogiInit[];
extern s16 gEkrInitialHitSide;
extern u16 Pal_ArenaBattleBg_A[];
extern u8 Img_ArenaBattleBg[];
extern u8 Tsa_ArenaBattleBg[];
extern const struct ProcCmd gProc_ekrTogiEnd[];
extern struct ProcEfxBGCOL * gpProcEkrTogiColor;
extern const struct ProcCmd gProc_ekrTogiColor[];
extern u16 * const PalArray_ArenaBattleBg[];

int GetBattleAnimArenaFlag(void);
void sub_080554FC(int x);
void PlayDeathSoundForArena(void);
void sub_0805555C(void);
void BeginAnimsOnBattle_Arena(void);
void ExecBattleAnimArenaExit(void);
void NewEkrTogiInitPROC(void);
void ekrTogiInit_Init(ProcPtr proc);
void ekrTogiInit_LoadGfx(struct ProcEkrTogi * proc);
void ekrTogiInit_Loop(struct ProcEkrTogi * proc);
void ekrTogiInit_End(ProcPtr proc);
void NewEkrTogiEndPROC(void);
void ekrTogiEnd_Init(struct ProcEkrTogi * proc);
void ekrTogiEnd_Loop(struct ProcEkrTogi * proc);
void ekrTogiEnd_End(ProcPtr proc);
void NewEkrTogiColor(void);
void ekrTogiColor_Loop(struct ProcEfxBGCOL * proc);



void SetBanimArenaFlag(int flag)
{
    gBaArenaFlag = flag;
}

// 0.60 ekrarena:GetBattleAnimArenaFlag
int GetBattleAnimArenaFlag(void)
{
    return gBaArenaFlag;
}

// 0.94 ekrarena:sub_805B034
void sub_080554FC(int x)
{
    int x1 = x >> 3;
    int x2 = x & 7;

    SetBgOffset(BG_3, x2, 0);
    EfxTmCpyExt(gEfxFrameTmap + 8 + x1, 66, gBg3Tm, 32, 32, 22, -1, -1);

    EnableBgSync(BG3_SYNC_BIT);

    return;
}

// 1.00 ekrarena:PlayDeathSoundForArena
void PlayDeathSoundForArena(void)
{
    if (GetBattleAnimArenaFlag() != 0)
    {
        EfxPlaySE(0x8F, 0x100);
    }

    return;
}

// 1.00 ekrarena:sub_805B094
void sub_0805555C(void)
{
    if (GetBattleAnimArenaFlag() != 0)
    {
        DoM4aSongNumStop(0x8E);
    }

    return;
}

// 0.92 ekrarena:BeginAnimsOnBattle_Arena
void BeginAnimsOnBattle_Arena(void)
{
    u32 pos;

    NewEkrBattleDeamon();
    AnimClearAll();

    pos = GetBanimInitPosReal();
    gEkrInitPosReal = pos;

    NewEkrTogiInitPROC();
    SetOnHBlankA(NULL);

    return;
}

// 0.78 ekrarena:ExecBattleAnimArenaExit
void ExecBattleAnimArenaExit(void)
{
    AnimClearAll();
    NewEkrTogiEndPROC();

    SetMainFunc(MainUpdate_8055C68);

    return;
}

// 0.75 ekrarena:NewEkrTogiInitPROC
void NewEkrTogiInitPROC(void)
{
    Proc_Start(gProc_ekrTogiInit, PROC_TREE_3);
    return;
}

// 0.90 ekrarena:ekrTogiInit_Init
void ekrTogiInit_Init(ProcPtr proc)
{
    InitOam(0);

    gEkrInitPosReal = gEkrInitialHitSide;

    EfxClearScreenFx();
    UpdateBanimFrame();

    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();

    CpuFastCopy(Pal_ArenaBattleBg_A, gPal + 0x60, 0x80);
    CpuFastCopy(gPal, gEfxPal, 0x400);
    CpuFastCopy(gEfxPal, gPal, 0x400);
    EfxPalBlackInOut(gPal, 0, 0x20, 0x10);

    EnablePalSync();

    Proc_Break(proc);

    return;
}

// 0.89 ekrarena:ekrTogiInit_LoadGfx
void ekrTogiInit_LoadGfx(struct ProcEkrTogi * proc)
{
    LZ77UnCompVram(Img_ArenaBattleBg, (void *)(VRAM + 0x8000));
    LZ77UnCompWram(Tsa_ArenaBattleBg, gEkrTsaBuffer);
    EfxTmCpyExt(gEkrTsaBuffer, -1, gEfxFrameTmap, 66, 46, 20, 6, 0);
    sub_080554FC(0);

    EnableBgSync(BG3_SYNC_BIT);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    EfxPlaySE(0x8E, 0x100);

    Proc_Break(proc);

    return;
}

// 0.95 ekrarena:ekrTogiInit_Loop
void ekrTogiInit_Loop(struct ProcEkrTogi * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->unk_2c, proc->unk_2e);

    CpuFastCopy(gEfxPal, gPal, 0x400);

    EfxPalBlackInOut(gPal, 0, 0x20, ret);
    EnablePalSync();

    if (++proc->unk_2c == proc->unk_2e + 1)
    {
        Proc_Break(proc);
    }

    return;
}

// 1.00 ekrarena:ekrTogiInit_End
void ekrTogiInit_End(ProcPtr proc)
{
    NewEkrTogiColor();
    Proc_Break(proc);
    return;
}

// 0.78 ekrarena:NewEkrTogiEndPROC
void NewEkrTogiEndPROC(void)
{
    Proc_Start(gProc_ekrTogiEnd, PROC_TREE_3);
    EndEkrTogiColor();
    return;
}

// 0.89 ekrarena:ekrTogiEnd_Init
void ekrTogiEnd_Init(struct ProcEkrTogi * proc)
{
    CpuFastCopy(gPal, gEfxPal, 0x400);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    Proc_Break(proc);

    return;
}

// 0.95 ekrarena:ekrTogiEnd_Loop
void ekrTogiEnd_Loop(struct ProcEkrTogi * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->unk_2c, proc->unk_2e);

    CpuFastCopy(gEfxPal, gPal, 0x400);
    EfxPalBlackInOut(gPal, 0, 0x20, ret);

    EnablePalSync();

    if (++proc->unk_2c == proc->unk_2e + 1)
    {
        Proc_Break(proc);
    }

    return;
}

// 0.87 ekrarena:ekrTogiEnd_End
void ekrTogiEnd_End(ProcPtr proc)
{
    EndEkrBattleDeamon();
    EndEkrGauge();

    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);

    Proc_Break(proc);

    return;
}

// 0.78 ekrarena:NewEkrTogiColor
void NewEkrTogiColor(void)
{

    gpProcEkrTogiColor = Proc_Start(gProc_ekrTogiColor, PROC_TREE_3);

    gpProcEkrTogiColor->timer = 0;

    gpProcEkrTogiColor->frame = 0;
    gpProcEkrTogiColor->frame_config = NewEkrTogiColor_frames;
    gpProcEkrTogiColor->pal = (void *) PalArray_ArenaBattleBg;

    return;
}

void EndEkrTogiColor(void)
{
    Proc_End(gpProcEkrTogiColor);
}

// 0.92 ekrarena:ekrTogiColor_Loop
void ekrTogiColor_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret > -1)
    {
        u16 * const * pal = proc->pal;
        CpuFastCopy(*(pal + ret), gPal + 0x60, 0x80);
        EnablePalSync();
    }

    return;
}

SECTION(".rodata.08B9B30C")
const struct ProcCmd gProc_ekrTogiInit[] = {
    PROC_19,
    PROC_REPEAT(ekrTogiInit_Init),
    PROC_REPEAT(ekrTogiInit_LoadGfx),
    PROC_REPEAT(ekrTogiInit_Loop),
    PROC_REPEAT(ekrTogiInit_End),
    PROC_END,
};

SECTION(".rodata.08B9B33C")
const struct ProcCmd gProc_ekrTogiEnd[] = {
    PROC_19,
    PROC_REPEAT(ekrTogiEnd_Init),
    PROC_REPEAT(ekrTogiEnd_Loop),
    PROC_REPEAT(ekrTogiEnd_End),
    PROC_END,
};

SECTION(".rodata.08B9B364")
const struct ProcCmd gProc_ekrTogiColor[] = {
    PROC_19,
    PROC_REPEAT(ekrTogiColor_Loop),
    PROC_END,
};

SECTION(".rodata.08B9B37C")
u16 * const PalArray_ArenaBattleBg[] = {
    Pal_ArenaBattleBg_A,
    Pal_ArenaBattleBg_B,
    Pal_ArenaBattleBg_C,
};
