#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_event.c

extern struct ProcCmd CONST_DATA ProcScr_TacticianNameSelection[];
extern int gUnk_Sio_0203DD8C;
extern u8 gUnk_Sio_02000000[];

#define SRAM_OFFSET_XMAP 0x7400
#define SRAM_SIZE_XMAP 0xC00

void InitTalkTextFont(void);


CONST_DATA EventScr EventScr_EraseSaveInfo[] = {
    0x3E, (EventScr) EnableAllGfx, 0x87, 0xD, 0x54, 0x3E, (EventScr) SioEvent_GotoLabel1UnlessYes, 0x11,
    0x55, 0x3E, (EventScr) sub_08043170, 0x11, 0x56, 0x3E, (EventScr) EraseSaveData, 0x44,
    1, 0xA, 0,
};

CONST_DATA u16 Sprite_085A9F98[] = {
    1, 0x4000, 0xC000, 0x3200,
};

/**
 * Contains Link Arena functions that are called by events
 */

//! FE8U = 0x08048260
void StartNameSelect(ProcPtr parent)
{
    struct ProcTactician * proc = Proc_StartBlocking(ProcScr_TacticianNameSelection, parent);
    proc->unk33 = 7;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x08048280
void StartTacticianNameSelect(ProcPtr parent)
{
    struct ProcTactician * proc;

    UnpackUiWindowFrameGraphics();
    UnsetBmStLinkArenaFlag();

    InitTextFont(&Font_0203DB64, (void *)(0x06001800), 0xc0, 0);

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    gPlaySt.config_window_theme = 0;

    proc = Proc_StartBlocking(ProcScr_TacticianNameSelection, parent);
    proc->unk33 = 7;
    proc->unk32 = 1;

    return;
}

extern struct SioMessage gUnknown_03004E80;

bool XMapTransfer_80482E0(ProcPtr proc)
{
    int i;

    int numTimeouts = 0;

    if (Proc_Find(ProcScr_SIOCON) != NULL)
    {
        if ((gpKeySt->pressed & B_BUTTON) != 0)
        {
            EventGotoLabel(proc, 4);
            return false;
        }

        return true;
    }

    if ((gSioSt->selfId > 1) || (gSioSt->playerStatus[gSioSt->selfId] == PLAYER_STATUS_2))
    {
        EventGotoLabel(proc, 0);
        return false;
    }

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if (!sub_0803CD64() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        EventGotoLabel(proc, 0);
        return false;
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

        if (gSioSt->selfId != 0)
        {
            EventGotoLabel(proc, 1);
        }

        return false;
    }

    return true;
}

//! FE8U = 0x080483F8
void XMapTransfer_80483F8(ProcPtr proc)
{
    if (gSioSt->unk_009 > 3)
    {
        EventGotoLabel(proc, 0);
    }

    return;
}

//! FE8U = 0x08048418
void XMapTransfer_8048418(ProcPtr proc)
{
    u8 buf[4];

    if (GetTalkChoiceResult() == 1)
    {
        gUnk_Sio_0203DD8C = 0;
    }
    else
    {
        gUnk_Sio_0203DD8C = 1;
    }

    buf[0] = gUnk_Sio_0203DD8C;
    SioEmitData(buf, sizeof(buf));

    if (gUnk_Sio_0203DD8C != 0)
    {
        EventGotoLabel(proc, 5);
    }

    return;
}

//! FE8U = 0x08048460
bool XMapTransfer_8048460(ProcPtr proc)
{
    u16 got;
    int i;
    u8 buf[4];
    u8 bufSenderId[4];

    int numTimeouts = 0;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if (!sub_0803CD64() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        EventGotoLabel(proc, 0);
        return 0;
    }

    got = SioReceiveData(buf, bufSenderId, NULL);

    if (got != 0)
    {
        if (buf[0] != 0)
        {
            EventGotoLabel(proc, 5);
        }

        return false;
    }

    return true;
}

void PutXMapProgressPercent(struct Text * th, const char * str, int number)
{
    ClearText(th);

    Text_InsertDrawString(th, 0, 0, str);
    SioDrawNumber(th, 54, 2, number);
    Text_InsertDrawString(th, 62, 0, "%");

    PutText(th, gBg0Tm + TM_OFFSET(15, 12));

    return;
}

//! FE8U = 0x08048524
void DrawXMapSendProgress(struct SioBigSendProc * proc)
{
    if (proc->unk_3C < proc->completionPercent)
    {
        PlaySoundEffect(0x7D);
        proc->unk_3C++;

        PutXMapProgressPercent(&gUnk_Sio_0203DA88[0], "Sending", proc->unk_3C);
        PutDrawUiGauge(
            0x100, 0xe, gBg0Tm + TM_OFFSET(14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        EnableBgSync(BG0_SYNC_BIT);
    }

    return;
}

//! FE8U = 0x08048594
void DrawXMapReceiveProgress(struct SioBigReceiveProc * proc)
{
    if (proc->unk_3C < proc->completionPercent)
    {
        PlaySoundEffect(0x7D);
        proc->unk_3C++;

        PutXMapProgressPercent(&gUnk_Sio_0203DA88[0], "Recving", proc->unk_3C);
        PutDrawUiGauge(
            0x100, 0xe, gBg0Tm + TM_OFFSET(14, 15), 0x6000, 100, proc->unk_3C, 100 - proc->unk_3C);
        EnableBgSync(BG0_SYNC_BIT);
    }

    return;
}

void StartXMapTransfer(struct SioBigSendProc * proc)
{
    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();

    if (gSioSt->selfId == 0)
    {
        ReadSramFast(CART_SRAM + SRAM_OFFSET_XMAP, gUnk_Sio_02000000, SRAM_SIZE_XMAP);
        StartSioBigSend(gUnk_Sio_02000000, SRAM_SIZE_XMAP, DrawXMapSendProgress, 0, proc);
    }
    else
    {
        StartSioBigReceive(gUnk_Sio_02000000, DrawXMapReceiveProgress, proc);
    }

    return;
}

bool XMapTransfer_AwaitCompletion(void)
{
    if (IsSioBigTransferActive())
    {
        return true;
    }

    PlaySoundEffect(0x7E);

    InitTalkTextFont();

    if (gSioSt->selfId != 0)
    {
        WriteAndVerifySramFast(gUnk_Sio_02000000, CART_SRAM + SRAM_OFFSET_XMAP, SRAM_SIZE_XMAP);
    }

    return false;
}

//! FE8U = 0x080486D4
void sub_08043068(void)
{
    gSioSt->unk_00A = 1 << gSioSt->selfId;
    return;
}

//! FE8U = 0x080486E8
bool sub_0804307C(void)
{
    gSioMsgBuf.kind = SIO_MSG_89;
    gSioMsgBuf.sender = gSioSt->selfId;
    gSioMsgBuf.param = 0;
    SioSend(&gSioMsgBuf, 4);

    if ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->unk_009)
    {
        gSioSt->unk_00A = 1 << gSioSt->selfId;
        return false;
    }

    return true;
}

//! FE8U = 0x08048730
void XMapTransfer_8048730(void)
{
    ApplyUiStatBarPal(6);
    DrawUiFrame2(0xd, 0xb, 0x10, 6, 0);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();

    PutXMapProgressPercent(&gUnk_Sio_0203DA88[0], DecodeMsg(0x771), 0);
    PutDrawUiGauge(0x100, 0xd, gBg0Tm + TM_OFFSET(14, 15), 0x6000, 100, 0, 100);

    EnableBgSync(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x0804879C
void sub_08043130(void)
{
    SetWOutLayers(1, 1, 1, 1, 1);
    return;
}

void SioEvent_GotoLabel1UnlessYes(ProcPtr proc)
{
    if (GetTalkChoiceResult() != 1)
    {
        EventGotoLabel(proc, 1);
    }

    return;
}

void sub_08043170(ProcPtr proc)
{
    if (GetTalkChoiceResult() == 1)
    {
        InitGlobalSaveInfo();
        ResetFe6LinkSaveInfo();
        EraseSaveRankData();
        EraseSoundRoomSaveData();
        EraseLinkArenaStruct2();
    }
    else
    {
        EventGotoLabel(proc, 1);
    }

    return;
}

void EraseSaveData(void)
{
    SoftReset(0xFF);
}


//! FE8U = 0x08009A00
void CallEraseSaveEvent(ProcPtr proc)
{
    StartEventLocking(EventScr_EraseSaveInfo, proc);
    return;
}

//! FE8U = 0x08048864 (sio_points.c in fireemblem8u)
void sub_080431C0(void)
{
    PutSprite(4, 56, 4, Sprite_085A9F98, 0);
    return;
}

extern const EventScr EventScr_08B99700[];

SECTION(".rodata.08B99700")
const EventScr EventScr_08B99700[] = {
    0x87, 0xD, 0x4F, 0x42, (uintptr_t) XMapTransfer_80482E0, 0x3E,
    (uintptr_t) XMapTransfer_80483F8, 0x11, 0x4E, 0x3E, (uintptr_t) XMapTransfer_8048418,
    0xA0002, 0x45, 2, 0x44, 0, 0x11, 0x52, 0xB40002, 0x45, 4, 0x44, 1, 0x3E,
    (uintptr_t) XMapTransfer_80483F8, 0x42, (uintptr_t) XMapTransfer_8048460, 0x44, 2, 0x3E,
    (uintptr_t) sub_080412C8, 0x3E, (uintptr_t) sub_08043068, 0x42, (uintptr_t) sub_0804307C,
    0x11, 0x50, 0x3E, (uintptr_t) sub_0803D5FC, 0xA0002, 0x3E, (uintptr_t) XMapTransfer_8048730,
    0x3E, (uintptr_t) sub_08043130, 0x3E, (uintptr_t) StartXMapTransfer, 0x10002, 0x42,
    (uintptr_t) XMapTransfer_AwaitCompletion, 0x3E, (uintptr_t) sub_080412D4, 0x11, 0x51,
    0xB40002, 0x45, 5, 0x44, 3, 0x11, 0x53, 0xB40002, 0x44, 5, 0x3E, (uintptr_t) sub_08043068,
    0x42, (uintptr_t) sub_0804307C, 0x44, 4, 0xA, 0,
};
