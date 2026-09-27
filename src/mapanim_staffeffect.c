#include "gbafe.h"

// not yet declared in headers
void SetDefaultManimScreenConf(void);

extern u8 const Img_ManimLatona1[];
extern u8 const Img_ManimLatona2[];
extern u16 const Pal_ManimLatona[];
extern s16 const gManimLatonaShinePos[];
extern struct ProcCmd CONST_DATA ProcScr_ManimLatonaShine[];
extern struct ProcCmd CONST_DATA ProcScr_ManimLatona[];

extern u8 const Img_ManimAntitoxinFrames[];
extern u8 CONST_DATA gManimAntitoxinFrameLut[];
extern struct ProcCmd CONST_DATA ProcScr_ManimAntitoxin[];
extern struct ProcCmd CONST_DATA ProcScr_ManimStatusHealSe[];

void StartManimLatonaFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimLatona, PROC_TREE_3);

    proc->unit = unit;

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}

void ManimLatonaFx_Init(struct ManimEffectProc * proc)
{
    SetDefaultManimScreenConf();
    SetBgOffset(2, 0, 0);

    Decompress(Img_ManimLatona1, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);

    SetBlendConfig(1, 16, 16, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    proc->frame = 0;
    proc->timer = 0;

    StartPaletteAnimatorReverse(Pal_ManimLatona, 0x80, 0x20, 2, proc);
}

void ManimLatonaFx_Main(struct ManimEffectProc * proc)
{
    if (proc->timer > 2)
    {
        DeleteAllPaletteAnimator();
        StartPaletteAnimatorNormal(Pal_ManimLatona, 0x80, 0x20, 4, proc);

        Decompress(Img_ManimLatona2, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);

        StartManimLatonaShine(proc->x / 8 - 4, proc->y / 8 - 4, 8, 60, 0, proc);

        Proc_Break(proc);

        PlaySeSpacial(0x8C, proc->x);
    }
    else
    {
        int x_off = gManimLatonaShinePos[proc->timer * 2 + 0];
        int y_off = gManimLatonaShinePos[proc->timer * 2 + 1];

        StartManimLatonaShine(proc->x / 8 + x_off - 3, proc->y / 8 + y_off - 3, 6, 10, 8, proc);

        PlaySeSpacial(0x89, proc->x);

        proc->timer++;
    }
}

void ManimLatonaFx_ClearBg2(ProcPtr proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);
}

void ManimLatonaBlink_Init(struct ManimEffectProc * proc)
{
    DeleteAllPaletteAnimator();

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk_64 = 0x40;

    ManimLatonaBlink_Main(proc);
}

void ManimLatonaBlink_Main(struct ManimEffectProc * proc)
{
    SetBlendConfig(2, 0, 0, (proc->unk_64--) >> 2);

    if (proc->unk_64 == 0)
    {
        SetBlendNone();
        Proc_Break(proc);
    }
}

void StartManimLatonaShine(int x, int y, int size, int duration, int fade_duration, ProcPtr parent)
{
    struct ManimShineProc * proc = Proc_StartBlocking(ProcScr_ManimLatonaShine, parent);

    proc->x = x;
    proc->y = y;
    proc->size = size;
    proc->fade_duration = fade_duration;
    proc->timer = duration;
}

void ManimLatonaShine_End(ProcPtr proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);
}

void ManimLatonaShine_Init(ProcPtr proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);
}

void ManimLatonaShine_Start(struct ManimShineProc * proc)
{
    sub_080147BC(gBg2Tm, proc->x, proc->y, TILEREF(0x140, 4), proc->size, proc->size);

    EnableBgSync(BG2_SYNC_BIT);
    SetBlendConfig(1, 0, 0x10, 0);
    proc->timer2 = 0;
}

void ManimLatonaShine_FadeIn(struct ManimShineProc * proc)
{
    proc->timer2 += 2;

    SetBlendConfig(1, proc->timer2, 0x10, 0);

    if (proc->timer2 > 7)
    {
        proc->timer2 = 0;
        Proc_Break(proc);
    }
}

void ManimLatonaShine_Wait(struct ManimShineProc * proc)
{
    if (--proc->timer == -1)
        Proc_Break(proc);
}

void ManimLatonaShine_FadeOut(struct ManimShineProc * proc)
{
    int blend;

    if (proc->fade_duration == 0)
    {
        Proc_Break(proc);
        return;
    }

    blend = Interpolate(0, 8, 0, proc->timer2++, proc->fade_duration);
    SetBlendConfig(1, blend, 0x10, 0);

    if (proc->timer2 >= proc->fade_duration)
    {
        proc->timer2 = 0;
        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);
        Proc_Break(proc);
    }
}

void StartManimAntitoxinFx(struct Unit * unit, u8 const * img, u16 const * pal)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimAntitoxin, PROC_TREE_3);

    proc->unit = unit;

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;

    proc->img = img;
    proc->pal = pal;
}

void ManimAntitoxinFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0xB6, proc->x);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 2;

    SetBgOffset(2, 0, 0);

    Decompress(proc->img, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);
    ApplyPalette(proc->pal, 4);

    SetDefaultManimScreenConf();
    SetBlendConfig(1, 0x10, 0x10, 0);

    proc->frame = 0;
}

void ManimAntitoxinFx_Main(struct ManimEffectProc * proc)
{
    sub_080148FC(
        gBg2Tm,
        proc->x / 8 - 3,
        proc->y / 8 - 3,
        TILEREF(0x140, 4),
        6, 6,
        (u16 const *)Img_ManimAntitoxinFrames,
        gManimAntitoxinFrameLut[proc->frame / 2]);

    EnableBgSync(BG2_SYNC_BIT);

    proc->frame++;

    if (gManimAntitoxinFrameLut[proc->frame / 2] == 0xFF)
        Proc_Break(proc);
}

void StartManimStatusHealSe(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimStatusHealSe, PROC_TREE_3);

    proc->x = (SCREEN_TILE_X(unit->xPos) << 1) * 8 + 8;
    proc->y = (SCREEN_TILE_Y(unit->yPos) << 1) * 8 + 8;
}

void ManimStatusHealSe_Play(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x10F, proc->x);
}

ASM_FUNC("asm/nonmatching/code_08072124.s");
ASM_FUNC("asm/nonmatching/code_08072180.s");
ASM_FUNC("asm/nonmatching/code_080722C0.s");
ASM_FUNC("asm/nonmatching/code_08072424.s");
ASM_FUNC("asm/nonmatching/code_08072588.s");
ASM_FUNC("asm/nonmatching/code_08072620.s");
ASM_FUNC("asm/nonmatching/code_080726C0.s");
ASM_FUNC("asm/nonmatching/code_0807272C.s");
ASM_FUNC("asm/nonmatching/code_08072784.s");
ASM_FUNC("asm/nonmatching/code_08072898.s");
ASM_FUNC("asm/nonmatching/code_080728F0.s");
ASM_FUNC("asm/nonmatching/code_08072A18.s");
ASM_FUNC("asm/nonmatching/code_08072B10.s");
ASM_FUNC("asm/nonmatching/code_08072C0C.s");
ASM_FUNC("asm/nonmatching/code_08072C20.s");
ASM_FUNC("asm/nonmatching/code_08072C90.s");
ASM_FUNC("asm/nonmatching/code_08072D10.s");
ASM_FUNC("asm/nonmatching/code_08072D7C.s");
ASM_FUNC("asm/nonmatching/code_08072D98.s");
ASM_FUNC("asm/nonmatching/code_08072E5C.s");
ASM_FUNC("asm/nonmatching/code_08072F00.s");
ASM_FUNC("asm/nonmatching/code_08072FC0.s");
ASM_FUNC("asm/nonmatching/code_08073060.s");
ASM_FUNC("asm/nonmatching/code_080730C8.s");
ASM_FUNC("asm/nonmatching/code_080730F4.s");
ASM_FUNC("asm/nonmatching/code_08073198.s");
ASM_FUNC("asm/nonmatching/code_08073200.s");
ASM_FUNC("asm/nonmatching/code_0807326C.s");
ASM_FUNC("asm/nonmatching/code_080732AC.s");
ASM_FUNC("asm/nonmatching/code_080732E8.s");
ASM_FUNC("asm/nonmatching/code_08073354.s");
ASM_FUNC("asm/nonmatching/code_08073438.s");
ASM_FUNC("asm/nonmatching/code_080734C4.s");
ASM_FUNC("asm/nonmatching/code_08073550.s");
ASM_FUNC("asm/nonmatching/code_080735B8.s");
ASM_FUNC("asm/nonmatching/code_080736EC.s");
ASM_FUNC("asm/nonmatching/code_080737D8.s");
ASM_FUNC("asm/nonmatching/code_08073878.s");
ASM_FUNC("asm/nonmatching/code_080738E0.s");
ASM_FUNC("asm/nonmatching/code_080739B0.s");
ASM_FUNC("asm/nonmatching/code_08073A54.s");
ASM_FUNC("asm/nonmatching/code_08073ABC.s");
ASM_FUNC("asm/nonmatching/code_08073AF0.s");
ASM_FUNC("asm/nonmatching/code_08073B14.s");
ASM_FUNC("asm/nonmatching/code_08073C50.s");
ASM_FUNC("asm/nonmatching/code_08073D0C.s");
ASM_FUNC("asm/nonmatching/code_08073D80.s");
ASM_FUNC("asm/nonmatching/code_08073EF4.s");
ASM_FUNC("asm/nonmatching/code_08073F70.s");
ASM_FUNC("asm/nonmatching/code_08073F88.s");
