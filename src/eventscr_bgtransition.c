#include "gbafe.h"

struct EvtBgTransitionProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int background;
    /* 30 */ int clock;
    /* 34 */ int flags;
    /* 38 */ int speed;
    /* 3C */ s8 use_tsa;
    /* 3D */ STRUCT_PAD(0x3D, 0x40);
    /* 40 */ ProcPtr evproc;
    /* 44 */ int pal_count;
};

#define BGTRANS_FLAG_KEEP_LAYERS 0x100
#define BGTRANS_FLAG_UNK_200     0x200

extern struct ProcCmd gProcScr_EventEngine[];
extern struct ProcCmd CONST_DATA ProcScr_EvtBgFadeIn[];
extern struct ProcCmd CONST_DATA ProcScr_EvtBgFadeOut[];
extern struct ProcCmd CONST_DATA ProcScr_EvtBgFadeToMap[];

void ApplyUnitSpriteSepiaPalette(void);

void EvtBgFadeIn_Init(struct EvtBgTransitionProc * proc)
{
    SetDispEnable(1, 1, 0, 1, 1);

    SetBlendAlpha(0x10, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    SetBgOffset(2, 0, 0);

    if (!(proc->flags & BGTRANS_FLAG_KEEP_LAYERS))
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg2_ct.priority = 2;
        gDispIo.bg3_ct.priority = 3;

        proc->pal_count = 8;
    }
    else
    {
        proc->pal_count = 6;
    }

    proc->clock = 0;
    proc->evproc = Proc_Find(gProcScr_EventEngine);
}

void EvtBgFadeIn_CopyToBg2(struct EvtBgTransitionProc * proc)
{
    int i;
    u16 * src;
    u16 * dst;

    CpuFastCopy((void *) BG_VRAM + 0x8000, (void *) BG_VRAM + 0x1000, 0x5000);
    CpuFastCopy(gPal + 0x80, gPal, proc->pal_count * 0x20);

    for (i = 0; i < 0x400; i++)
        gBg2Tm[i] = gBg3Tm[i] + 0x8080;

    EnableBgSync(BG2_SYNC_BIT);
    EnablePalSync();

    SetDispEnable(1, 1, 1, 1, 1);
}

void EvtBgFadeIn_PutBackground(struct EvtBgTransitionProc * proc)
{
    if (proc->use_tsa)
    {
        Decompress(gBackgroundTable[proc->background].img, (void *) BG_VRAM + 0x8000);
        TmApplyTsa(gBg3Tm, gBackgroundTable[proc->background].tsa, 0x8000);
        ApplyPaletteExt(gBackgroundTable[proc->background].pal, 0x100, proc->pal_count * 0x20);
    }
    else
    {
        PutCgBackground(gBg3Tm, 0x8000, 8, proc->pal_count, proc->background);
    }

    EnableBgSync(BG3_SYNC_BIT);
}

void EvtBgFadeIn_Loop(struct EvtBgTransitionProc * proc)
{
    int blend;

    proc->clock += proc->speed;
    blend = proc->clock >> 4;

    SetBlendAlpha(0x10 - blend, blend);

    if (blend == 0x10)
        Proc_Break(proc);
}

void EvtBgFadeIn_End(struct EvtBgTransitionProc * proc)
{
    SetBgOffset(3, 0, 0);
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendNone();

    if (!(proc->flags & BGTRANS_FLAG_KEEP_LAYERS))
        InitBmBgLayers();
}

void StartEvtBgFadeIn(int flags, u8 use_tsa, int background, ProcPtr parent)
{
    struct EvtBgTransitionProc * proc = Proc_StartBlocking(ProcScr_EvtBgFadeIn, parent);

    proc->background = background;
    proc->flags = flags;
    proc->speed = flags & 0xFF;
    proc->use_tsa = use_tsa;
}

void EvtBgFadeOut_Init(struct EvtBgTransitionProc * proc)
{
    SetDispEnable(1, 1, 0, 1, 1);

    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    SetBgOffset(2, 0, 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    proc->pal_count = 6;
    proc->clock = 0;
    proc->evproc = Proc_Find(gProcScr_EventEngine);
}

void EvtBgFadeOut_PutBackground(struct EvtBgTransitionProc * proc)
{
    if (proc->use_tsa)
    {
        Decompress(gBackgroundTable[proc->background].img, (void *) BG_VRAM + 0x1000);
        TmApplyTsa(gBg2Tm, gBackgroundTable[proc->background].tsa, 0x80);
        ApplyPaletteExt(gBackgroundTable[proc->background].pal, 0, proc->pal_count * 0x20);
    }
    else
    {
        PutCgBackground(gBg2Tm, 0x1000, 0, proc->pal_count, proc->background);
    }

    EnableBgSync(BG2_SYNC_BIT);
    EnablePalSync();

    SetDispEnable(1, 1, 1, 1, 1);
}

void EvtBgFadeOut_Loop(struct EvtBgTransitionProc * proc)
{
    int blend;

    proc->clock += proc->speed;
    blend = proc->clock >> 4;

    SetBlendAlpha(blend, 0x10 - blend);

    if (blend == 0x10)
        Proc_Break(proc);
}

void EvtBgFadeOut_CopyToBg3(struct EvtBgTransitionProc * proc)
{
    int i;

    LockBmDisplay();
    LockMus();

    SetBgOffset(3, 0, 0);

    CpuFastCopy((void *) BG_VRAM + 0x1000, (void *) BG_VRAM + 0x8000, 0x5000);
    CpuFastCopy(gPal, gPal + 0x80, proc->pal_count * 0x20);

    for (i = 0; i < 0x400; i++)
        gBg3Tm[i] = gBg2Tm[i] + 0x7F80;

    EnableBgSync(BG3_SYNC_BIT);
}

void EvtBgFadeOut_End(struct EvtBgTransitionProc * proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendNone();

    InitBmBgLayers();
}

void StartEvtBgFadeOut(int flags, u8 use_tsa, int background, ProcPtr parent)
{
    struct EvtBgTransitionProc * proc = Proc_StartBlocking(ProcScr_EvtBgFadeOut, parent);

    proc->background = background;
    proc->flags = flags;
    proc->speed = flags & 0xFF;
    proc->use_tsa = use_tsa;
}

int EvtCmd_BgFadeIn(struct EventProc * proc)
{
    int background = proc->script[1];
    int flags = proc->script[2];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    proc->background = background;
    StartEvtBgFadeIn(flags, 1, background, proc);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_BgFade(struct EventProc * proc)
{
    int background = proc->script[1];
    int flags = proc->script[2];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->background == -1)
        StartEvtBgFadeOut(flags, 0, background, proc);
    else
        StartEvtBgFadeIn(flags, 0, background, proc);

    proc->background = 0x61;

    return EVENT_CMDRET_YIELD;
}

void EvtBgFadeToMap_Init(struct EvtBgTransitionProc * proc)
{
    SetDispEnable(1, 1, 0, 1, 1);

    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    SetBgOffset(2, 0, 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    proc->pal_count = 6;
    proc->clock = 0;
    proc->evproc = Proc_Find(gProcScr_EventEngine);
}

void EvtBgFadeToMap_CopyToBg2(struct EvtBgTransitionProc * proc)
{
    int i;

    CpuFastCopy((void *) BG_VRAM + 0x8000, (void *) BG_VRAM + 0x1000, 0x5000);
    CpuFastCopy(gPal + 0x80, gPal, proc->pal_count * 0x20);

    for (i = 0; i < 0x400; i++)
        gBg2Tm[i] = gBg3Tm[i] + 0x8080;

    EnableBgSync(BG2_SYNC_BIT);
    EnablePalSync();

    SetDispEnable(1, 1, 1, 1, 1);

    SetBlendAlpha(0x10, 0);
}

void EvtBgFadeToMap_RestoreMap(struct EvtBgTransitionProc * proc)
{
    UnpackChapterMapGraphics(gPlaySt.chapterIndex);
    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    RenderMap();
    RefreshUnitSprites();
    ApplyUnitSpritePalettes();

    if (proc->flags & BGTRANS_FLAG_UNK_200)
        ApplyUnitSpriteSepiaPalette();

    ForceSyncUnitSpriteSheet();
    UnlockBmDisplay();
    ReleaseMus();

    EnableBgSync(BG3_SYNC_BIT);
}

void EvtBgFadeToMap_Loop(struct EvtBgTransitionProc * proc)
{
    int blend;

    proc->clock += proc->speed;
    blend = proc->clock >> 4;

    SetBlendAlpha(0x10 - blend, blend);

    if (blend == 0x10)
        Proc_Break(proc);
}

void EvtBgFadeToMap_End(struct EvtBgTransitionProc * proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendNone();

    InitBmBgLayers();
    ApplySystemGraphics();
    InitSystemTextFont();
}

void StartEvtBgFadeToMap(int flags, ProcPtr parent)
{
    struct EvtBgTransitionProc * proc = Proc_StartBlocking(ProcScr_EvtBgFadeToMap, parent);

    proc->flags = flags;
    proc->speed = flags & 0xFF;
}

#if NONMATCHING
// one instruction short: the original has a dead 'ldrb r2, [r4]' before the ldrsb
int EvtCmd_BgFadeToMap(struct EventProc * proc)
{
    int flags = proc->script[1];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (skipped)
    {
        u8 * bg = (u8 *) &proc->background;

        if ((s8) *bg != -1)
        {
            *bg = 0xFF;

            RefreshBMapGraphics();
            UnlockBmDisplay();
            ReleaseMus();
        }

        return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        u8 * bg = (u8 *) &proc->background;

        StartEvtBgFadeToMap(flags, proc);

        *bg = 0xFF;
        proc->unk_4D = skipped;

        return EVENT_CMDRET_YIELD;
    }
}
#else
ASM_FUNC("asm/nonmatching/code_080110B8.s");
#endif
