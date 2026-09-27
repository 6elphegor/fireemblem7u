#include "gbafe.h"

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

extern u8 const Img_ManimBerserk[];
extern u16 const Pal_ManimBerserk[];
extern u16 const SpriteAnim_ManimBerserk[];
extern u8 const Img_ManimRepair[];
extern u16 const Pal_ManimRepair[];
extern u8 const Tsa_ManimRepair[];
extern u8 const gManimRepairFrameLut[];
extern struct ProcCmd CONST_DATA ProcScr_ManimBerserk[];
extern struct ProcCmd CONST_DATA ProcScr_ManimRepair[];

extern u16 const Pal_ManimRestore[];
extern u8 const Tsa_ManimRestore[];
extern u8 const gManimRestoreFrameLut[];
extern u8 const Img_ManimSleep[];
extern u16 const Pal_ManimSleep[];
extern u16 const SpriteAnim_ManimSleep[];
extern struct ProcCmd CONST_DATA ProcScr_ManimRestore[];
extern struct ProcCmd CONST_DATA ProcScr_ManimSleep[];

void sub_08076A78(void);
void sub_08076D8C(int x, int y, int radius, int max, u8 const * lut);
void StartManimBgScroll(int bg, int x_inc, int y_inc, ProcPtr parent);

extern u8 CONST_DATA gManimWaveLut[];
extern struct ProcCmd CONST_DATA ProcScr_ManimShiftingSineWaveScanlineBuf[];
extern struct ProcCmd CONST_DATA ProcScr_ManimWaveFx[];

extern u8 const Img_ManimSilenceBg[];
extern u8 const Img_ManimSilenceObj[];
extern u16 const Pal_ManimSilence[];
extern u16 const SpriteAnim_ManimSilence[];
extern u8 const Img_ManimBarrier[];
extern u16 const Pal_ManimBarrier[];
extern u8 const Tsa_ManimBarrier[];
extern u8 const gManimBarrierFrameLut[];
extern struct ProcCmd CONST_DATA ProcScr_ManimSilence[];
extern struct ProcCmd CONST_DATA ProcScr_ManimBarrier[];

void StartAvailableDoorTileEvent(s8 x, s8 y);

extern u8 const Img_ManimUnlockBg[];
extern u8 const Tsa_ManimUnlockBg[];
extern u8 const Img_ManimUnlockObj[];
extern u16 const Pal_ManimUnlockObj[];
extern u16 const Pal_ManimUnlockBg[];
extern u16 const SpriteAnim_ManimUnlock[];
extern struct ProcCmd CONST_DATA ProcScr_ManimUnlock[];
extern struct ProcCmd CONST_DATA ProcScr_ManimBgScroll[];

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

void StartManimBerserkFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimBerserk, PROC_TREE_3);

    proc->unit = unit;
    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}

void ManimBerserkFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x87, proc->x);
    SetBgOffset(2, 0, 0);
    SetDefaultManimScreenConf();

    Decompress(Img_ManimBerserk, OBJ_VRAM0 + 0x1C0 * 0x20);
    ApplyPalette(Pal_ManimBerserk, 0x10 + 4);

    StartSpriteAnimProc(SpriteAnim_ManimBerserk, proc->x, proc->y, TILEREF(0x1C0, 4), 0, 2);

    proc->unk_48 = 1;
}

void StartManimRepairFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimRepair, PROC_TREE_3);

    proc->x = (SCREEN_TILE_X(unit->xPos) << 1) * 8 + 8;
    proc->y = (SCREEN_TILE_Y(unit->yPos) << 1) * 8 + 8;
}

void ManimRepairFx_PlaySe(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x86, proc->x);
}

void ManimRepairFx_Init(struct ManimEffectProc * proc)
{
    SetBgOffset(2, 0, 0);
    SetDefaultManimScreenConf();
    SetBlendAlpha(0x10, 0x10);

    Decompress(Img_ManimRepair, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);
    ApplyPalette(Pal_ManimRepair, 4);

    proc->unk_48 = 0;
    proc->frame_idx = 0;
}

void ManimRepairFx_Main(struct ManimEffectProc * proc)
{
    sub_080149A8(
        gBg2Tm,
        proc->x / 8 - 2, proc->y / 8 - 9,
        TILEREF(0x140, 4),
        4, 11, Tsa_ManimRepair,
        gManimRepairFrameLut[proc->unk_48++]);

    EnableBgSync(BG2_SYNC_BIT);

    if (gManimRepairFrameLut[proc->unk_48] == 0xFF)
        Proc_Break(proc);
}

ASM_FUNC("asm/nonmatching/code_08072F00.s");
void ManimRepairFx_FadeOut(struct ManimEffectProc * proc)
{
    SetBlendAlpha(Interpolate(0, 0x10, 0, proc->frame_idx++, 30), 0x10);

    if (proc->frame_idx > 30)
        Proc_Break(proc);
}

void StartManimRestoreFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimRestore, PROC_TREE_3);

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}

void ManimRestoreFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x82, proc->x);
    ApplyPalette(Pal_ManimRestore, 4);
}

void ManimRestoreFx_Main(struct ManimEffectProc * proc)
{
    sub_080149A8(
        gBg2Tm,
        proc->x / 8 - 2, proc->y / 8 - 9,
        TILEREF(0x140, 4),
        4, 11, Tsa_ManimRestore,
        gManimRestoreFrameLut[proc->unk_48++]);

    EnableBgSync(BG2_SYNC_BIT);

    if (gManimRestoreFrameLut[proc->unk_48] == 0xFF)
        Proc_Break(proc);
}

void StartManimSleepFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimSleep, PROC_TREE_3);

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}

void ManimSleepFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x85, proc->x);

    SetBgOffset(2, 0, 0);
    SetDefaultManimScreenConf();

    Decompress(Img_ManimSleep, OBJ_VRAM0 + 0x1C0 * 0x20);
    ApplyPalette(Pal_ManimSleep, 0x10 + 4);

    StartSpriteAnimProc(SpriteAnim_ManimSleep, proc->x, proc->y - 16, TILEREF(0x1C0, 4), 0, 2);
}

void ManimSleepFx_Anim1(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x85, proc->x);
    StartSpriteAnimProc(SpriteAnim_ManimSleep, proc->x, proc->y - 8, TILEREF(0x1C0, 4), 0, 2);
}

void ManimSleepFx_Anim2(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x85, proc->x);
    StartSpriteAnimProc(SpriteAnim_ManimSleep, proc->x, proc->y, TILEREF(0x1C0, 4), 0, 2);
}

void StartManimWaveFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimWaveFx, PROC_TREE_3);

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = (SCREEN_TILE_Y(unit->yPos) << 1) * 8 + 18;
}

void ManimWaveFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0xFD, proc->x);

    InitScanlineEffect();
    sub_0807689C();
    SetOnHBlankA(sub_08076A78);
    SetDefaultManimScreenConf();
    SetBlendAlpha(0x10, 0x10);

    TmApplyTsa_thm(gBg2Tm, gBuf, TILEREF(0x140, 4));
    EnableBgSync(BG2_SYNC_BIT);

    StartManimBgScroll(2, 0, 1, proc);
    Proc_Start(ProcScr_ManimShiftingSineWaveScanlineBuf, proc);

    proc->unk_48 = 0;
    proc->frame_idx = 0;
}

void ManimWaveFx_Expand(struct ManimEffectProc * proc)
{
    if (proc->unk_48 >= 12)
    {
        proc->unk_48--;
        Proc_Break(proc);
    }

    sub_08076D8C(proc->x, proc->y, ++proc->unk_48, 12, gManimWaveLut);
}

void ManimWaveFx_Shrink(struct ManimEffectProc * proc)
{
    if (proc->unk_48 <= 0)
    {
        proc->unk_48++;
        Proc_Break(proc);
    }

    sub_08076D8C(proc->x, proc->y, --proc->unk_48, 12, gManimWaveLut);
}

void StartManimSilenceFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimSilence, PROC_TREE_3);

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}

void ManimSilenceFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x83, proc->x);

    SetBgOffset(2, 0, 0);
    SetDefaultManimScreenConf();

    Decompress(Img_ManimSilenceBg, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);
    Decompress(Img_ManimSilenceObj, OBJ_VRAM0 + 0x1C0 * 0x20);
    ApplyPalette(Pal_ManimSilence, 4);
    ApplyPalette(Pal_ManimSilence, 0x10 + 4);

    StartSpriteAnimProc(SpriteAnim_ManimSilence, proc->x, proc->y | OAM0_BLEND, TILEREF(0x1C0, 4), 0, 2);

    proc->unk_48 = 0;

    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendBackdropA(0);
    SetBlendConfig(BLEND_EFFECT_NONE, 0x10, 0x10, 0);
}

void ManimSilenceFx_Start(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x84, proc->x);

    sub_080147BC(gBg2Tm, proc->x / 8 - 2, proc->y / 8 - 2, TILEREF(0x140, 4), 4, 4);

    EnableBgSync(BG2_SYNC_BIT);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendAlpha(0x10, 0x10);
}

void ManimSilenceFx_Main(struct ManimEffectProc * proc)
{
    SetBlendAlpha(Interpolate(0, 0x10, 0, proc->unk_48++, 30), 0x10);

    if (proc->unk_48 >= 30)
        Proc_Break(proc);
}

void StartManimBarrierFx(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimBarrier, PROC_TREE_3);

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}

void ManimBarrierFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x88, proc->x);

    SetBgOffset(2, 0, 0);
    SetDefaultManimScreenConf();

    SetBlendAlpha(0x10, 0x10);

    Decompress(Img_ManimBarrier, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);
    ApplyPalette(Pal_ManimBarrier, 4);

    proc->unk_48 = 0;
    proc->frame_idx = 0;
}

void ManimBarrierFx_Main(struct ManimEffectProc * proc)
{
    sub_080149A8(
        gBg2Tm,
        proc->x / 8 - 2, proc->y / 8 - 8,
        TILEREF(0x140, 4),
        4, 10, Tsa_ManimBarrier,
        gManimBarrierFrameLut[proc->unk_48++]);

    EnableBgSync(BG2_SYNC_BIT);

    if (gManimBarrierFrameLut[proc->unk_48] == 0xFF)
        Proc_Break(proc);
}

void StartManimUnlockFx(int x, int y)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimUnlock, PROC_TREE_3);

    proc->x = (SCREEN_TILE_X(x) << 1) * 8 + 8;
    proc->y = (SCREEN_TILE_Y(y) << 1) * 8 + 8;
}

void ManimUnlockFx_HideUnitAndOpenDoor(void)
{
    GetUnit(gActionSt.instigator)->state |= US_HIDDEN;
    StartAvailableDoorTileEvent(gActionSt.x_target, gActionSt.y_target);
}

void ManimUnlockFx_UnhideUnit(void)
{
    GetUnit(gActionSt.instigator)->state &= ~US_HIDDEN;
}

void ManimUnlockFx_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0x8D, proc->x);

    SetBgOffset(2, 0, 0);
    Decompress(Img_ManimUnlockBg, (void *)(VRAM) + GetBgChrOffset(2) + 0x140 * 0x20);

    sub_080149A8(
        gBg2Tm,
        proc->x / 8 - 2, proc->y / 8 - 2,
        TILEREF(0x140, 4),
        4, 4, Tsa_ManimUnlockBg, 0);

    EnableBgSync(BG2_SYNC_BIT);

    Decompress(Img_ManimUnlockObj, OBJ_VRAM0 + 0x1C0 * 0x20);
    ApplyPalette(Pal_ManimUnlockObj, 0x10 + 4);

    StartPaletteAnimatorReverse(Pal_ManimUnlockBg, 0x20 * 4, 0x20, 4, proc);

    InitScanlineEffect();
    sub_0807689C();
    SetDefaultManimScreenConf();

    SetBlendAlpha(0x10, 0x10);

    proc->unk_48 = 1;
}

void ManimUnlockFx_Open(struct ManimEffectProc * proc)
{
    int radius = Interpolate(5, 1, 0x10, proc->unk_48, 30);

    proc->unk_48++;

    sub_080769CC(proc->x, proc->y, radius);

    if (proc->unk_48 >= 30)
    {
        proc->unk_48 = 0;

        Proc_Break(proc);

        StartSpriteAnimProc(SpriteAnim_ManimUnlock, proc->x, proc->y, TILEREF(0x1C0, 4), 0, 2);
        StartSpriteAnimProc(SpriteAnim_ManimUnlock, proc->x, proc->y, TILEREF(0x1C0, 4), 1, 2);
    }
}

void ManimUnlockFx_Close(struct ManimEffectProc * proc)
{
    int radius = Interpolate(5, 0x10, 0, proc->unk_48, 30);

    proc->unk_48++;

    sub_080769CC(proc->x, proc->y, radius);

    if (proc->unk_48 >= 30)
        Proc_Break(proc);
}

void SetDefaultManimScreenConf(void)
{
    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 0;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 2;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);
}

void StartManimBgScroll(int bg, int x_inc, int y_inc, ProcPtr parent)
{
    struct ManimBgScrollProc * proc = Proc_Start(ProcScr_ManimBgScroll, parent);

    proc->bg = bg;

    proc->x = 0;
    proc->x_inc = x_inc;
    proc->y = 0;
    proc->y_inc = y_inc;
}

void EndManimBgScroll(void)
{
    Proc_EndEach(ProcScr_ManimBgScroll);
}

void ManimBgScroll_Main(struct ManimBgScrollProc * proc)
{
    SetBgOffset(proc->bg, proc->x, proc->y);

    proc->x += proc->x_inc;
    proc->y += proc->y_inc;
}

