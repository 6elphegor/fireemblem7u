#include "gbafe.h"
#include "gbafe/sio_core.h"

CONST_DATA struct SioSt * gSioSt = (struct SioSt *) 0x0203A98C;

// Link arena misc (FE8U: sio_main.c)


u32 SioStrCpy(u8 const * src, u8 * dst)
{
    u32 ret = 0;
    while (*src != '\0')
    {
        *dst++ = *src++;
        ret++;
    }
    *dst = *src;
    return ret;
}

void SioDrawNumber(struct Text * text, int x, int color, int number)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, color);
    Text_DrawNumber(text, number);
}

void SioInit(void)
{
    SioRegisterIrq();
    sub_0803C414();

    gSioSt->unk_001 = 1;
    gSioSt->unk_004 = 0;
}

void SioPollingMsgAndAck(ProcPtr proc)
{
    u16 magic = 0x2586;
    if (SioPollingMsg() != -1)
    {
        gSioSt->unk_011 = 0;
        gSioSt->unk_004 = 5;
        gSioSt->selfId = GetSioIndex();
        SioSend16(&magic, -1);
        Proc_Break(proc);
    }
}

void SetBmStLinkArenaFlag(void)
{
    gBmSt.flags |= BM_FLAG_LINKARENA;
}

void UnsetBmStLinkArenaFlag(void)
{
    gBmSt.flags &= ~BM_FLAG_LINKARENA;
}

bool CheckInLinkArena(void)
{
    return !!(gBmSt.flags & BM_FLAG_LINKARENA);
}

void sub_0803DA24(void)
{
    gLinkArenaSt.unk_04 = -1;
}

void sub_0803DA30(struct Proc_Sio_085A93A0 * proc)
{
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    proc->timer = 0;
}

void sub_0803DA70(struct Proc_Sio_085A93A0 * proc)
{
    int time = (++proc->timer) & 0x3F;

    if (time >= 0x20)
        time = 0x40 - time;

    if (time > 0x10)
        time = 0x10;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);
    SetBlendAlpha(time, 0x10 - time);
}

void sub_0803DAD0(void)
{
    gDispIo.bg_off[BG_1].x++;
    gDispIo.bg_off[BG_2].x--;
}

void sub_0803DAE4(ProcPtr proc)
{
    gSioSt->unk_030 = 0x1286;
    if (gSioSt->unk_1B7E != 0)
        Proc_Break(proc);
}

void sub_0803DB10(void)
{
    gSioSt->unk_00A = 1 << gSioSt->selfId;
}

void sub_0803DB24(ProcPtr proc)
{
    gSioMsgBuf.kind = SIO_MSG_89;
    gSioMsgBuf.sender = gSioSt->selfId;
    gSioMsgBuf.param = 0;

    SioSend(&gSioMsgBuf, 4);

    if ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->unk_009)
    {
        gSioSt->unk_00A = 1 << gSioSt->selfId;
        Proc_Break(proc);
    }
}

