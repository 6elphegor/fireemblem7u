#include "gbafe.h"

struct ColFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4E);

    /* 4E */ u16 current;

    /* 50 */ STRUCT_PAD(0x50, 0x58);

    /* 58 */ int color;
    /* 5C */ int start;
    /* 60 */ int amount;
    /* 64 */ u16 speed;
};

extern u16 gUnk_020144F8[];


void ColFadeIn_Init_Null(void);
void ColFadeIn_Loop(struct ColFadeProc * proc);
void ColFadeOut_Init(struct ColFadeProc * proc);
void ColFadeOut_Loop(struct ColFadeProc * proc);

CONST_DATA struct ProcCmd ProcScr_ColFadeOut[] = {
    PROC_19,
    PROC_SLEEP(2),
    PROC_CALL(ColFadeOut_Init),
    PROC_YIELD,
    PROC_REPEAT(ColFadeOut_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ColFadeIn[] = {
    PROC_19,
    PROC_SLEEP(2),
    PROC_CALL(ColFadeIn_Init_Null),
    PROC_YIELD,
    PROC_REPEAT(ColFadeIn_Loop),
    PROC_END,
};

void ColFadeOut_Init(struct ColFadeProc * proc)
{
    int i;

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        gUnk_020144F8[i] = gPal[i];
    }
}
void ColFadeIn_Init_Null(void)
{
}
void ColFadeOut_Loop(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->current;

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        int r, r1, r2;
        int g, g1, g2;
        int b, b1, b2;

        b1 = (gUnk_020144F8[i] & BLUE_MASK);
        b2 = (proc->color & BLUE_MASK);
        b2 = b1 - b2;
        b = ((b2 * val / 0x100) + proc->color) & BLUE_MASK;

        g1 = (gUnk_020144F8[i] & GREEN_MASK);
        g2 = (proc->color & GREEN_MASK);
        g2 = (g1 - g2);
        g = ((g2 * val / 0x100) + proc->color) & GREEN_MASK;

        r1 = (gUnk_020144F8[i] & RED_MASK);
        r2 = (proc->color & RED_MASK);
        r2 = r1 - r2;
        r = ((r2 * val / 0x100) + proc->color) & RED_MASK;

        gPal[i] = b | g | r;
    }

    EnablePalSync();

    proc->current += proc->speed;

    if (val == 0)
    {
        Proc_Break(proc);
    }
}
void ColFadeIn_Loop(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->current;

    if (val != 0)
    {
        for (i = proc->start; i < proc->start + proc->amount; i++)
        {
            int r, r1, r2;
            int g, g1, g2;
            int b, b1, b2;

            b1 = (proc->color & BLUE_MASK);
            b2 = (gUnk_020144F8[i] & BLUE_MASK);
            b2 = b1 - b2;
            b = ((b2 * val / 0x100) + gUnk_020144F8[i]) & BLUE_MASK;

            g1 = (proc->color & GREEN_MASK);
            g2 = (gUnk_020144F8[i] & GREEN_MASK);
            g2 = (g1 - g2);
            g = ((g2 * val / 0x100) + gUnk_020144F8[i]) & GREEN_MASK;

            r1 = (proc->color & RED_MASK);
            r2 = (gUnk_020144F8[i] & RED_MASK);
            r2 = r1 - r2;
            r = ((r2 * val / 0x100) + gUnk_020144F8[i]) & RED_MASK;

            gPal[i] = b | g | r;
        }
    }

    EnablePalSync();

    proc->current += proc->speed;

    if (val == 0)
    {
        for (i = proc->start; i < proc->start + proc->amount; i++)
        {
            gPal[i] = gUnk_020144F8[i];
            gPal[i] = gUnk_020144F8[i];
            gPal[i] = gUnk_020144F8[i];
        }

        Proc_Break(proc);
    }
}
void NewColFadeOut(int speed, int kind, int color, ProcPtr parent)
{
    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeOut, parent);

    proc->speed = speed;
    proc->color = color;
    proc->current = 0;

    switch (kind)
    {
    case 0:
        proc->start = 0x80;
        proc->amount = 0x80;
        break;

    case 1:
        proc->start = 0;
        proc->amount = 0x200;
        break;

    case 2:
        proc->start = 0;
        proc->amount = 0x400;
        break;
    }
}
void NewColFadeIn(int speed, int kind, int color, ProcPtr parent)
{
    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeIn, parent);

    proc->speed = speed;
    proc->color = color;
    proc->current = 0;

    switch (kind)
    {
    case 0:
        proc->start = 0x80;
        proc->amount = 0x80;
        break;

    case 1:
        proc->start = 0;
        proc->amount = 0x200;
        break;

    case 2:
        proc->start = 0;
        proc->amount = 0x400;
        break;
    }
}
