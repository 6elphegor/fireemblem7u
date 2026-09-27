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

void LoadSparkGfx(void);

extern u8 const Img_ManimWarpFlashy[];
extern u16 const Pal_ManimWarpFlashy[];
extern u8 const Img_ManimWarpFlashyFrames[];
extern u8 CONST_DATA gManimWarpFlashyFrameLut[];
extern struct ProcCmd CONST_DATA ProcScr_ManimEffectAnimator[];
extern struct ProcCmd CONST_DATA ProcScr_ManimWarpFlashy[];

void sub_0807689C(void);
void sub_080769CC(int x, int y, int radius);

extern u8 const Img_ManimTorch[];
extern u16 const Pal_ManimTorch[];
extern u16 const SpriteAnim_ManimTorch[];
extern struct ProcCmd CONST_DATA ProcScr_ManimTorch[];

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

void StartManimEffectAnimator(struct Unit * unit, void const * img, void const * pal, u16 song)
{
    struct ManimAnimatorProc * proc = Proc_Start(ProcScr_ManimEffectAnimator, PROC_TREE_3);

    proc->unit = unit;
    proc->img = img;
    proc->pal = pal;
    proc->song = song;
}

void ManimEffectAnimator_Init(struct ManimAnimatorProc * proc)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 2;

    SetBgOffset(2, 0, 0);

    Decompress(proc->img, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);

    sub_080147BC(
        gBg2Tm,
        (SCREEN_TILE_X(proc->unit->xPos) << 1) - 2,
        (SCREEN_TILE_Y(proc->unit->yPos) << 1) - 2,
        TILEREF(0x140, 4), 6, 6);

    EnableBgSync(BG2_SYNC_BIT);

    StartPaletteAnimatorNormal(proc->pal, 4 * 0x20, 0x20, 4, proc);

    proc->ca = 0;
    proc->cb = 0x10;

    PlaySeSpacial(proc->song, ((SCREEN_TILE_X(proc->unit->xPos) << 1) + 1) * 8);
}

void ManimEffectAnimator_FadeIn(struct ManimAnimatorProc * proc)
{
    proc->ca++;

    if (proc->ca == 0x10)
        Proc_Break(proc);

    proc->cb = 0x16 - proc->ca;

    if (proc->cb > 0x10)
        proc->cb = 0x10;

    SetBlendAlpha(proc->ca, proc->cb);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);
}

void ManimEffectAnimator_FadeOut(struct ManimAnimatorProc * proc)
{
    proc->ca--;

    if (proc->ca == 0)
        Proc_Break(proc);

    proc->cb = 0x16 - proc->ca;

    if (proc->cb > 0x10)
        proc->cb = 0x10;

    SetBlendAlpha(proc->ca, proc->cb);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);
}

void ManimSpellAnim_End(ProcPtr proc)
{
    DeleteAllPaletteAnimator();

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendNone();
    SetWinEnable(0, 0, 0);
}

void ManimSpellAnim_EndWithHBlank(ProcPtr proc)
{
    SetOnHBlankA(NULL);

    DeleteAllPaletteAnimator();

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendNone();
    SetWinEnable(0, 0, 0);
}

void StartManimWarpFlashy(struct Unit * unit, int arg_1, int arg_2)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimWarpFlashy, PROC_TREE_3);

    proc->unit = unit;
    proc->x = SCREEN_TILE_X(proc->unit->xPos) << 1;
    proc->y = SCREEN_TILE_Y(proc->unit->yPos) << 1;
}

void ManimWarpFlashy_Init(struct ManimEffectProc * proc)
{
    SetBgOffset(2, 0, 0);

    Decompress(Img_ManimWarpFlashy, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);
    ApplyPalette(Pal_ManimWarpFlashy, 4);

    LoadSparkGfx();

    proc->frame = 0;
}

void ManimWarpFlashy_Main(struct ManimEffectProc * proc)
{
    sub_080148FC(
        gBg2Tm,
        proc->x - 1,
        proc->y - 3,
        TILEREF(0x140, 4),
        4, 6,
        (u16 const *)Img_ManimWarpFlashyFrames,
        gManimWarpFlashyFrameLut[proc->frame / 2]);

    EnableBgSync(BG2_SYNC_BIT);

    proc->frame++;

    if (gManimWarpFlashyFrameLut[proc->frame / 2] == 0xFF)
        Proc_Break(proc);

    SetDefaultManimScreenConf();
    SetBlendAlpha(12, 12);
}

void StartManimTorchFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimTorch, PROC_TREE_3);

    proc->unit = unit;
    proc->x = SCREEN_TILE_IX(gActionSt.x_target);
    proc->y = SCREEN_TILE_IY(gActionSt.y_target);
}

void ManimTorchFx_Init(struct ManimEffectProc * proc)
{
    PlaySoundEffect(0xB3);

    Decompress(Img_ManimTorch, OBJ_VRAM0 + 0x1C0 * 0x20);
    ApplyPalette(Pal_ManimTorch, 0x10 + 4);

    SetWhitePal(4);
    sub_08014B94((void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20, 0x20 / sizeof(u16), 0xFFFF);
    sub_08014B94(gBg2Tm, 0x400, TILEREF(0x140, 4));

    EnableBgSync(BG2_SYNC_BIT);

    proc->frame = 0;
    proc->timer = 0;

    StartSpriteAnimProc(SpriteAnim_ManimTorch, proc->x + 4, proc->y, TILEREF(0x1C0, 4), 0, 2);

    InitScanlineEffect();
    sub_0807689C();
    SetDefaultManimScreenConf();

    SetBlendAlpha(0, 0x10);
}

void ManimTorchFx_Expand(struct ManimEffectProc * proc)
{
    int radius, ca;

    radius = Interpolate(5, 1, 160, proc->frame, 80);
    sub_080769CC(proc->x + 8, proc->y + 8, radius);

    proc->frame++;

    ca = (proc->frame * 0x10) / 40;

    if (ca >= 0x10)
        ca = 0x10;

    SetBlendAlpha(ca, 0x10);

    if (proc->frame >= 40)
    {
        Proc_Break(proc);
        EndEachSpriteAnimProc();
    }
}

void ManimTorchFx_Fade(struct ManimEffectProc * proc)
{
    int radius, ca;

    radius = Interpolate(5, 1, 160, proc->frame, 80);
    sub_080769CC(proc->x + 8, proc->y + 8, radius);

    proc->frame++;

    ca = 0x10 - ((proc->frame - 40) * 0x10) / 30;

    if (ca <= 0)
        ca = 0;

    SetBlendAlpha(ca, 0x10);

    if (proc->frame >= 70)
        Proc_Break(proc);
}

void ManimTorchFx_ResetHBlank(struct ManimEffectProc * proc)
{
    ResetScanLineHBlank();
}

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
