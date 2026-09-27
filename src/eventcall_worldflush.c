#include "gbafe.h"

void sub_0807764C(int x, int y, int r);
void sub_080777E4(void);

extern struct ProcCmd CONST_DATA ProcScr_EventWorldFlush[];

struct ProcWorldFlush
{
    PROC_HEADER;

    /* 2C */ int timer;
};

ASM_FUNC("asm/nonmatching/code_0807CC5C.s");

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

ASM_FUNC("asm/nonmatching/code_0807CDEC.s");

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
