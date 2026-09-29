#include "gbafe.h"

void sub_0807764C(int x, int y, int r);
void sub_080777E4(void);

extern struct ProcCmd CONST_DATA ProcScr_EventWorldFlush[];

struct ProcWorldFlush
{
    PROC_HEADER;

    /* 2C */ int timer;
};

#if NONMATCHING

void sub_0807CC5C(struct ProcWorldFlush * proc)
{
    proc->timer = 0;

    InitScanlineEffect();

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    SetWinEnable(1, 0, 0);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendBrighten(0);

    SetOnHBlankA(sub_080777E4);

    PlaySoundEffect(0x269);
}

#else

// FAKEMATCH: writing the win0 fields through a local pointer keeps each
// win_ct byte in a register so it is stored once, as in the original.
void sub_0807CC5C(struct ProcWorldFlush * proc)
{
    struct WinCnt * w;

    proc->timer = 0;

    InitScanlineEffect();

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    SetWinEnable(1, 0, 0);

    w = &gDispIo.win_ct;
    w->win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    w->win0_enable_bg0 = 1;
    w->win0_enable_bg1 = 1;
    w->win0_enable_bg2 = 1;
    w->win0_enable_bg3 = 1;
    w->win0_enable_obj = 1;
    SetWOutLayers(1, 1, 1, 1, 1);

    w->win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendBrighten(0);

    SetOnHBlankA(sub_080777E4);

    PlaySoundEffect(0x269);
}

#endif

void sub_0807CD4C(struct ProcWorldFlush * proc)
{
    int duration = 0x40;
    int max = DISPLAY_WIDTH;
    int t, r, y;

    t = ++proc->timer;

    r = (t * max * t) / (duration * duration);
    y = 0x10 - ((duration - t) * 0x10 * (duration - t)) / (duration * duration);

    sub_0807764C(120, 104, r);

    SetBlendBrighten(y);

    if (proc->timer >= duration)
        Proc_Break(proc);
}

void WorldFlushReload(struct ProcWorldFlush * proc)
{
    ApplyMapChange(1);
    AddMapChangeTrap(1);

    RefreshTerrainMap();
    UpdateRoofedUnits();
    RenderMap();

    proc->timer = 0;
}

void sub_0807CDEC(struct ProcWorldFlush * proc)
{
    int duration = 0x80;
#if NONMATCHING
    int r = DISPLAY_WIDTH;
#else
    register int r asm("r5") = DISPLAY_WIDTH;
#endif
    int t, y;

    t = ++proc->timer;

    r = ((duration - t) * r * (duration - t)) / (duration * duration);
    y = 0x10 - (t * 0x10 * t) / (duration * duration);

    sub_0807764C(120, 48, r);

    SetBlendBrighten(y);

    if (proc->timer >= duration)
        Proc_Break(proc);
}

void sub_0807CE60(struct ProcWorldFlush * proc)
{
    SetOnHBlankA(NULL);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    SetWinEnable(0, 0, 0);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;
}

void sub_0807CEB4(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_EventWorldFlush, proc);
}
