#include "gbafe.h"

struct ProcWhiteCircleFx {
    PROC_HEADER;

    /* 2C */ int xPos;
    /* 30 */ int yPos;

    /* 34 */ u8 _pad_34[0x4C - 0x34];

    /* 4C */ s16 counter;
};

void ProcWhiteCircleFx_End(struct ProcWhiteCircleFx * proc);
void ProcWhiteCircleFx_Loop(struct ProcWhiteCircleFx * proc);

CONST_DATA struct ProcCmd ProcScr_WhiteCircleFx[] = {
    PROC_REPEAT(ProcWhiteCircleFx_Loop),
    PROC_CALL(ProcWhiteCircleFx_End),
    PROC_END,
};

void ProcWhiteCircleFx_Loop(struct ProcWhiteCircleFx * proc)
{
    u16 _sqrt;
    int x, y, xTile, yTile, wight;
    int val = 0x40 - proc->counter * 5;

    for (y = 0; y < 0x14; y++)
    {
        for (x = 0; x < 0x1E; x++)
        {
            xTile = ABS(proc->xPos - x * 8);
            yTile = ABS(proc->yPos - y * 8);

            _sqrt = Sqrt(xTile * xTile + yTile * yTile);
            wight = _sqrt + val;

            if (wight < 0)
                wight += 3;

            wight = 0xF - (wight >> 2);

            LIMIT_AREA(wight, 0, 0xF);

            gBg0Tm[TM_OFFSET(x, y)] = TILEREF(0x100 + wight, 2);
        }
    }

    EnableBgSync(BG0_SYNC_BIT);

    proc->counter++;

    if (proc->counter > 0x46)
        Proc_Break(proc);
}

void ProcWhiteCircleFx_End(struct ProcWhiteCircleFx * proc)
{
    SetBlendConfig(2, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);
    ClearUi();
}

void StartCircularFadeAnim(ProcPtr parent, int x, int y)
{
    int i, j;
    u32 r, b, g;
    struct ProcWhiteCircleFx * proc;
    u32 * cur = (void *) BG_VRAM + CHR_SIZE * 0x100;
    int val = 0;

    for (i = 0; i < 0x20; i++)
    {
        for (j = 0; j < 0x8; j++)
            *(cur++) = val;
        val += 0x11111111;
    }

    for (i = 0; i < 0x10; i++)
    {
        r = RGB(i * 2, 0, 0);
        b = RGB(0, 0, i * 2);
        g = RGB(0, i * 2, 0);
        b += g;
        b += r;
        gPal[0x20 + i] = b;
    }

    EnablePalSync();
    SetBlendConfig(1, 0x10, 0x10, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);
    SetBgOffset(0, 0, 0);
    ClearUi();
    SetBgChrOffset(0, 0);

    proc = Proc_Start(ProcScr_WhiteCircleFx, parent);
    proc->xPos = x;
    proc->yPos = y;
    proc->counter = 0;
}
