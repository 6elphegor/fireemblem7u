#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_EventSnowStormfx[] = {
    PROC_YIELD,
    PROC_CALL(EventSnowStormfx_Init),
    PROC_YIELD,
    PROC_REPEAT(EventSnowStormfx_Loop1),
    PROC_REPEAT(EventSnowStormfx_Loop2),
    PROC_REPEAT(EventSnowStormfx_Loop3),
    PROC_CALL(EventSnowStormfx_End),
    PROC_END,
};

void EventSnowStormfx_Init(struct ProcEventSnowStormfx * proc);
ASM_FUNC("asm/nonmatching/code_08011118.s");


void EventSnowStormfx_Loop1(struct ProcEventSnowStormfx * proc)
{
    int bg_offset, time = ++proc->timer >> 1;

    SetBlendAlpha(time, (0x10 - time) >= 0xD ? 0x10 - time : 0xD);

    if (time == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    bg_offset = ++proc->bg_offset;

    proc->x += bg_offset * 3;
    proc->y += bg_offset;

    SetBgOffset(BG_2, -(proc->x >> 5), -(proc->y >> 5));
}

void EventSnowStormfx_Loop2(struct ProcEventSnowStormfx * proc)
{
    int bg_offset;

    if (++proc->timer >= proc->paluse_duration)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    bg_offset = proc->bg_offset;
    proc->x += bg_offset * 3;
    proc->y += bg_offset;

    SetBgOffset(BG_2, -(proc->x >> 5), -(proc->y >> 5));
}

void EventSnowStormfx_Loop3(struct ProcEventSnowStormfx * proc)
{
    int bg_offset, time = ++proc->timer >> 3;

    SetBlendAlpha(0x10 - time, (time + 0xD) >= 0x10 ? 0x10 : time + 0xD);

    bg_offset = proc->bg_offset;
    proc->x += bg_offset * 3;
    proc->y += bg_offset;

    SetBgOffset(BG_2, -(proc->x >> 5), -(proc->y >> 5));

    if (time == 0x10)
        Proc_Break(proc);
}

void EventSnowStormfx_End(struct ProcEventSnowStormfx * proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
}

int EventDF_SnowStormfx(struct EventProc * proc)
{
    struct ProcEventSnowStormfx * procfx;
    const u32 * args = proc->script;

    int paluse = args[1];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    procfx = Proc_StartBlocking(ProcScr_EventSnowStormfx, proc);
    procfx->paluse_duration = paluse;
    return EVENT_CMDRET_YIELD;
}
