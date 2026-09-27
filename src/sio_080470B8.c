#include "gbafe.h"

/* FE8U: sio_804B920.c */

struct SioProc85AA7B4 {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x64);
    /* 64 */ s16 unk_64;
};

extern s8 gUnk_Sio_0203DDDC;

extern s16 gUnk_Sio_02000F00[];
extern s16 * gUnk_Sio_02001180;
extern s16 * gUnk_Sio_02001184;
extern s16 * gUnk_Sio_02001188;

extern struct ProcCmd CONST_DATA ProcScr_08B9A1E0[];
extern struct ProcCmd CONST_DATA ProcScr_08B9A218[];

void sub_08047184(s16 * a, int b, int c, int d, int e, int f, int g, int h, int i, s16 j, u16 k);

void Set_0203DDDC(void)
{
    gUnk_Sio_0203DDDC = 1;
}

void FE6Link_Init(void)
{
    gUnk_Sio_0203DDDC = 0;
}

void sub_080470D0(void)
{
    SetWinEnable(0, 0, 0);
    SetBlendConfig(0, 0, 0, 0);
}

void sub_08047108(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        gUnk_Sio_02001188 = gUnk_Sio_02001180;
        vcount = 0;
    }

    REG_WIN1H = (gUnk_Sio_02001188[vcount * 2 + 0] << 8) + gUnk_Sio_02001188[vcount * 2 + 1];
}

void sub_08047144(void)
{
    s16 * swap = gUnk_Sio_02001180;
    gUnk_Sio_02001180 = gUnk_Sio_02001184;
    gUnk_Sio_02001184 = swap;
}

void sub_0804715C(void)
{
    SetWinEnable(0, 0, 0);
    SetOnHBlankA(NULL);
}

void sub_08047184(s16 * a, int b, int c, int d, int e, int f, int g, int h, int i, s16 j, u16 k)
{
    int x1;
    int y1;
    int x2;
    int y2;
    int x3;
    int y3;
    int x4;
    int y4;

    b -= (DISPLAY_WIDTH / 2);
    c -= (DISPLAY_HEIGHT / 2);

    d -= (DISPLAY_WIDTH / 2);
    e -= (DISPLAY_HEIGHT / 2);

    f -= (DISPLAY_WIDTH / 2);
    g -= (DISPLAY_HEIGHT / 2);

    h -= (DISPLAY_WIDTH / 2);
    i -= (DISPLAY_HEIGHT / 2);

    x1 = (b * SIN_Q12(j)) + (c * COS_Q12(j));
    y1 = (b * COS_Q12(j)) - (c * SIN_Q12(j));

    x2 = (d * SIN_Q12(j)) + (e * COS_Q12(j));
    y2 = (d * COS_Q12(j)) - (e * SIN_Q12(j));

    x3 = (f * SIN_Q12(j)) + (g * COS_Q12(j));
    y3 = (f * COS_Q12(j)) - (g * SIN_Q12(j));

    x4 = (h * SIN_Q12(j)) + (i * COS_Q12(j));
    y4 = (h * COS_Q12(j)) - (i * SIN_Q12(j));

    x1 = ((k * (x1 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y1 = ((k * (y1 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x2 = ((k * (x2 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y2 = ((k * (y2 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x3 = ((k * (x3 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y3 = ((k * (y3 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x4 = ((k * (x4 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y4 = ((k * (y4 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    sub_080133C8(a, x1, y1, x2, y2);
    sub_080133C8(a, x2, y2, x3, y3);
    sub_080133C8(a, x3, y3, x4, y4);
    sub_080133C8(a, x4, y4, x1, y1);
}

void sub_080472F4(struct SioProc85AA7B4 * proc)
{
    gUnk_Sio_02001180 = gUnk_Sio_02000F00;

    gUnk_Sio_02001184 = gUnk_Sio_02000F00 - 320;
    gUnk_Sio_02001188 = gUnk_Sio_02000F00;

    sub_080133A8(gUnk_Sio_02001180);
    sub_080133A8(gUnk_Sio_02001184);

    proc->unk_4c = 0;

    SetOnHBlankA(sub_08047108);
}

void sub_08047340(struct SioProc85AA7B4 * proc)
{
    int a;
    int b;

    if (proc->unk_4c == proc->unk_64)
    {
        SetOnHBlankA(NULL);
        Proc_Break(proc);
        return;
    }

    a = Interpolate(INTERPOLATE_LINEAR, 0xa0, 0xc0, proc->unk_4c, proc->unk_64);
    b = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x110, proc->unk_4c, proc->unk_64);

    sub_080133A8(gUnk_Sio_02001184);
    sub_08047184(gUnk_Sio_02001184, 0, 0, DISPLAY_WIDTH, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, 0, DISPLAY_HEIGHT, a, b);
    sub_08047144();

    proc->unk_4c++;
}

void sub_080473D8(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 0, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
}

void sub_08047420(u16 a, ProcPtr parent)
{
    struct SioProc85AA7B4 * proc = Proc_StartBlocking(ProcScr_08B9A1E0, parent);
    proc->unk_64 = a;

    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 1, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    gDispIo.win_ct.win1_enable_blend = 1;
}

void sub_080474C8(ProcPtr parent)
{
    sub_08047420(0x40, parent);
}

void sub_080474D8(struct SioProc85AA7B4 * proc)
{
    int a;
    int b;

    if (proc->unk_4c == proc->unk_64)
    {
        SetOnHBlankA(NULL);
        Proc_Break(proc);
        return;
    }

    a = Interpolate(INTERPOLATE_RSQUARE, 0xc0, 0xa0, proc->unk_4c, proc->unk_64);
    b = Interpolate(INTERPOLATE_RCUBIC, 0x110, 0x10, proc->unk_4c, proc->unk_64);

    sub_080133A8(gUnk_Sio_02001184);
    sub_08047184(gUnk_Sio_02001184, 0, 0, DISPLAY_WIDTH, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, 0, DISPLAY_HEIGHT, a, b);
    sub_08047144();

    proc->unk_4c++;
}

void sub_08047570(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetWinEnable(0, 0, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
}

void sub_08047594(u16 a, ProcPtr parent)
{
    struct SioProc85AA7B4 * proc = Proc_StartBlocking(ProcScr_08B9A218, parent);
    proc->unk_64 = a;

    SetWinEnable(0, 1, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    gDispIo.win_ct.win1_enable_blend = 1;
}

void sub_08047620(ProcPtr parent)
{
    sub_08047594(0x40, parent);
}

void sub_08047630(ProcPtr proc)
{
    if (Proc_Find(ProcScr_08B9A1E0) == NULL)
        Proc_Break(proc);
}

void sub_08047650(ProcPtr proc)
{
    if (Proc_Find(ProcScr_08B9A218) == NULL)
        Proc_Break(proc);
}
