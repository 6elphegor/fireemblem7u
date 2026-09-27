#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE6 <-> FE7 link / GameCube link (FE7-only, no FE8U counterpart)

extern u16 CONST_DATA gUnknown_08B99984[];
extern u16 CONST_DATA gUnknown_08B9997C[];
extern u16 CONST_DATA gUnknown_08B99968[];
extern u16 CONST_DATA gUnknown_08B9993C[];

extern const u16 gUnknown_08B99880[];

struct Fe6LinkMsgEnt
{
    /* 00 */ u16 msg;
    /* 02 */ u16 unk_02;
};

extern const struct Fe6LinkMsgEnt gUnknown_08B99894[];
extern struct Text gUnk_Sio_02000C40[];
extern struct Text gUnk_Sio_02000C58;
extern const u8 gUnknown_081D2B3C[];
extern const u16 gUnknown_081D3598[];

void sub_08043828(struct Text * th, int num, u8 center, int color);

extern struct ProcCmd CONST_DATA ProcScr_08B9998C[];
extern struct ProcCmd CONST_DATA ProcScr_08B99870[];
extern struct ProcCmd CONST_DATA ProcScr_08B999D8[];

void sub_080ACA90(ProcPtr proc);

struct Fe6LinkProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int unk_2c[3];
    /* 38 */ s16 unk_38[3];
    /* 3E */ s16 unk_3e[3];
    /* 44 */ int unk_44;
    /* 48 */ int unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
    /* 54 */ struct Fe6LinkProc * unk_54;
    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
    /* 60 */ int unk_60;
    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

struct Fe6LinkSaveInfo
{
    /* 00 */ u32 data[8];
    /* 20 */ u16 unk_20;
};

struct Fe6LinkRecvData
{
    /* 00 */ u8 kind;
    /* 01 */ u8 unk_01[3];
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05[3];
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09[3];
    /* 0C */ u32 unk_0c[3];
};

extern struct Fe6LinkRecvData gUnk_Sio_02000C04;
extern u8 gUnk_Sio_02000C1C[];

void ReadFe6LinkSaveInfo(void * buf);

extern u8 gUnk_Sio_02000C00[];
extern const char gUnknown_081D546C[]; // "END"

void sub_0800530C(int a, int b, const char * str);
void SoundVSyncOn_rev01(void);
void SoundVSyncOff_rev01(void);
void LoadHelpBoxGfx(void * vram, int palId);

ASM_FUNC("asm/nonmatching/code_080431E0.s");
ASM_FUNC("asm/nonmatching/code_080433F0.s");
void sub_080434EC(ProcPtr proc)
{
    u16 magic = 0x2586;

    Proc_Start(ProcScr_SIOVSYNC, PROC_TREE_VSYNC);
    Proc_Start(ProcScr_SIOMAIN, proc);
    Proc_Start(ProcScr_SIOCON, proc);

    SioSend16(&magic, -1);
    SoundVSyncOn_rev01();
}
void sub_08043538(ProcPtr proc)
{
    int i;
    int numTimeouts = 0;

    if (Proc_Find(ProcScr_SIOCON) != NULL)
        return;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if (!sub_0803CD64() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        Proc_Goto(proc, 10);
        return;
    }

    gUnknown_03004E80.kind = SIO_MSG_8C;
    gUnknown_03004E80.sender = gSioSt->selfId;
    gUnknown_03004E80.param = gSioSt->unk_000;
    SioSend(&gUnknown_03004E80, 10);

    if ((gSioSt->unk_009 & 3) == 3)
    {
        gSioSt->unk_009 = 3;
        sub_0803D674();

        gSioSt->unk_004 = 6;
        gSioSt->unk_01E = 0;

        sub_0803D500(3);
        Proc_Break(proc);
    }
}
void FE6Link_OnEnd(void)
{
    Proc_EndEach(ProcScr_SIOVSYNC);
    Proc_EndEach(ProcScr_SIOMAIN);
    Proc_EndEach(ProcScr_SIOCON);

    SioReleaseIrq();
    CloseHelpBox();
    sub_0803C414();
}
void sub_08043604(void)
{
    sub_0800530C(8, 16, gUnknown_081D546C);
}
bool sub_08043618(void * data)
{
    switch (*(u8 *)data)
    {
    case 0:
    case 1:
    case 2:
        return TRUE;

    default:
        return FALSE;
    }
}
void sub_0804362C(ProcPtr proc)
{
    u8 senderId[4];

    if ((u16)SioReceiveData(gUnk_Sio_02000C00, senderId, sub_08043618) != 0)
    {
        switch (gUnk_Sio_02000C00[0])
        {
        case 0:
            Proc_Break(proc);
            break;

        case 1:
        case 2:
            LoadHelpBoxGfx((void *)0x06015000, 6);
            StartHelpBoxExt_Unk(0x38, 0x38, 0x1193);
            Proc_Goto(proc, 10);
            break;
        }
    }
}
bool sub_08043690(void * data)
{
    if (*(u8 *)data == 0x55)
        return TRUE;

    return FALSE;
}
void sub_080436A0(struct Fe6LinkProc * proc)
{
    u8 senderId[4];

    if ((u16)SioReceiveData(&gUnk_Sio_02000C04, senderId, sub_08043690) != 0)
    {
        if (gUnk_Sio_02000C04.unk_04 == 0)
        {
            LoadHelpBoxGfx((void *)0x06015000, 6);
            StartHelpBoxExt_Unk(0x38, 0x38, 0x1194);
            Proc_Goto(proc, 10);
        }
        else
        {
            proc->unk_58 = 0;
            Proc_Break(proc);
        }
    }
}
void sub_08043700(struct Fe6LinkProc * proc)
{
    struct Fe6LinkProc * child = proc->unk_54;

    if ((gpKeySt->pressed & DPAD_UP) && child->unk_44 > 0)
    {
        child->unk_44--;
        SioPlaySoundEffect(3);
    }

    if ((gpKeySt->pressed & DPAD_DOWN) && child->unk_44 < 2)
    {
        child->unk_44++;
        SioPlaySoundEffect(3);
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (gUnk_Sio_02000C04.unk_01[child->unk_44] != 0)
        {
            SioPlaySoundEffect(2);
            child->unk_50 = 1;
            proc->unk_60 = child->unk_44;
            Proc_Break(proc);
        }
        else
        {
            SioPlaySoundEffect(0);
        }
    }
}
bool sub_08043788(void * data)
{
    if (*(u8 *)data == 0x66)
        return TRUE;

    return FALSE;
}
void sub_08043798(struct Fe6LinkProc * proc)
{
    struct Fe6LinkSaveInfo info;
    u8 senderId[4];
    int i;

    if ((u16)SioReceiveData(gUnk_Sio_02000C1C, senderId, sub_08043788) != 0)
    {
        CloseHelpBox();
        sub_0803D500(0);
        LoadHelpBoxGfx((void *)0x06016800, 13);
        StartHelpBoxExt_Unk(0x40, 0x48, 0x1195);

        ReadFe6LinkSaveInfo(&info);

        for (i = 0; i < 8; i++)
            info.data[i] = ((u32 *)(gUnk_Sio_02000C1C + 4))[i];

        if (gUnk_Sio_02000C04.unk_05[proc->unk_60] == 0x19)
            info.unk_20 = 2;
        else
            info.unk_20 = 1;

        WriteFe6LinkSaveInfo(&info);
        Proc_Break(proc);
    }
}
void sub_08043828(struct Text * th, int num, u8 center, int color)
{
    int widths[4];
    int total;
    int tens, ones;
    int half;
    const u16 * onesMsg;
    int x = 0;

    if (num == 0)
        return;

    if (num == 50)
    {
        total = GetStringTextLen(DecodeMsg(0x1186));

        if (center)
            x = (0x30 - total) >> 1;

        Text_InsertDrawString(th, x, color, DecodeMsg(0x1186));
        return;
    }

    // BUG: widths[0] is never initialized
    total = widths[0];

    tens = (num >> 1) / 10;
    ones = (num >> 1) % 10;

    if (tens != 0)
    {
        widths[1] = GetStringTextLen(DecodeMsg(gUnknown_08B99880[tens])) - 1;
        total += widths[1];
    }

    onesMsg = &gUnknown_08B99880[ones];
    widths[2] = GetStringTextLen(DecodeMsg(*onesMsg)) - 1;
    total += widths[2];

    widths[3] = GetStringTextLen(DecodeMsg(0x1185));
    total += widths[3];

    half = num & 1;

    if (half)
        total += GetStringTextLen(DecodeMsg(0x1188));

    if (center)
        x = (0x30 - total) >> 1;

    x += widths[0];

    if (tens != 0)
    {
        Text_InsertDrawString(th, x, color, DecodeMsg(gUnknown_08B99880[tens]));
        x += widths[1];
    }

    Text_InsertDrawString(th, x, color, DecodeMsg(*onesMsg));
    x += widths[2];

    Text_InsertDrawString(th, x, color, DecodeMsg(0x1185));
    x += widths[3];

    if (half)
        Text_InsertDrawString(th, x, color, DecodeMsg(0x1188));
}
void sub_0804397C(struct Text * th, int color, int idx)
{
    const struct Fe6LinkMsgEnt * table = gUnknown_08B99894;
    const struct Fe6LinkMsgEnt * ent = &table[idx];
    int flag = ent->unk_02;
    int x;

    sub_08043828(th, flag, 1, color);

    x = (0x46 - GetStringTextLen(DecodeMsg(ent->msg))) / 2;

    if (flag == 0)
        x -= 0x20;

    Text_InsertDrawString(th, x + 0x28, color, DecodeMsg(ent->msg));
}
void sub_080439D0(struct Text * th)
{
    Text_InsertDrawString(th, 0, 0, DecodeMsg(0x1191));
    Text_InsertDrawString(th, 0x80, 0, DecodeMsg(1));
    Text_InsertDrawString(th, 0xB0, 0, DecodeMsg(2));
}
ASM_FUNC("asm/nonmatching/code_08043A14.s");
void sub_08043B1C(int time)
{
    u16 hours, minutes, seconds;

    FormatTime(time, &hours, &minutes, &seconds);

    if (hours > 99)
    {
        hours = 99;
        seconds = 59;
        minutes = 59;
    }

    PutSprite(4, 0xD8, 0x90, gUnknown_08B99984, DivRem(seconds, 10));
    PutSprite(4, 0xD0, 0x90, gUnknown_08B99984, Div(seconds, 10));
    PutSprite(4, 0xC8, 0x90, gUnknown_08B99984, 10);

    PutSprite(4, 0xC0, 0x88, gUnknown_08B9997C, DivRem(minutes, 10));
    PutSprite(4, 0xB8, 0x88, gUnknown_08B9997C, Div(minutes, 10));
    PutSprite(4, 0xB0, 0x88, gUnknown_08B9997C, 10);

    PutSprite(4, 0xA8, 0x88, gUnknown_08B9997C, DivRem(hours, 10));

    if (Div(hours, 10) > 0)
        PutSprite(4, 0xA0, 0x88, gUnknown_08B9997C, Div(hours, 10));
}
void sub_08043C0C(struct Fe6LinkProc * proc)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        PutSprite(4, proc->unk_38[i], proc->unk_3e[i], gUnknown_08B99968, (proc->unk_2c[i] & 0xF) << 12);
        PutSprite(4, proc->unk_38[i] + 0x28, proc->unk_3e[i] + 8, gUnknown_08B9993C, i << 6);
    }

    sub_08043B1C(gUnk_Sio_02000C04.unk_0c[proc->unk_44]);

    PutUiHand(proc->unk_38[proc->unk_44] + 0x10, proc->unk_3e[proc->unk_44] + 8);

    if (proc->unk_50 == 1)
    {
        proc->unk_54 = 0;
        Proc_Break(proc);
    }
}
ASM_FUNC("asm/nonmatching/code_08043CC8.s");
ASM_FUNC("asm/nonmatching/code_08043DB8.s");
ProcPtr sub_08043EA0(ProcPtr parent)
{
    return Proc_Start(ProcScr_08B9998C, parent);
}
void sub_08043EB4(struct Fe6LinkProc * proc)
{
    ApplySystemGraphics();
    sub_080ACA90(proc);
    Proc_EndEach(ProcScr_08B99870);

    proc->unk_54 = sub_08043EA0(proc);

    UnpackUiWindowFrameGraphics();
    PutUiWindowFrame(gBg1Tm, 18, 16, 11, 4, 0, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}
void sub_08043F04(struct Fe6LinkProc * proc)
{
    if (proc->unk_54->unk_50 == 0)
        Proc_Break(proc);
}
void sub_08043F1C(struct Fe6LinkProc * proc)
{
    PutUiWindowFrame(gBg1Tm, 2, 9, 16, 6, 0, 0);
    EnableBgSync(BG1_SYNC_BIT);
    proc->unk_68 = 0;
}
ASM_FUNC("asm/nonmatching/code_08043F50.s");
void sub_0804408C(ProcPtr proc)
{
    if (gpKeySt->pressed & (A_BUTTON | START_BUTTON))
        Proc_Break(proc);
}
void FE6Link_CallBack(void)
{
    SoundVSyncOn_rev01();
}
void GC_ConnectToFE6(ProcPtr parent)
{
    UnpackUiWindowFrameGraphics();
    InitTextFont(&Font_0203DB64, (void *)0x06001800, 0xc0, 0);
    Proc_StartBlocking(ProcScr_08B999D8, parent);
}
