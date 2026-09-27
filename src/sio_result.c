#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_result.c

extern const char gSioStr_Pts[];
extern const int gSioRankMsgLut[];
extern const int gSioPlayerMsgLut[];
extern const u8 gUnknown_081D53CB[];
extern const u8 gUnknown_081D53D3[];
extern const u8 gUnknown_085ACEFC[];
extern const u16 Pal_LinkArenaActiveBannerFx[];
ProcPtr sub_080491F0(int x, int y, ProcPtr parent);
extern const u16 gUnknown_081C7FC4[];
extern const u8 Tsa_SioResultRankings[];
extern const u8 Img_LinkArenaRankIcons[];
extern const u16 Pal_LinkArenaRankIcons[];

//! FE8U = 0x08046E5C
void DrawLinkArenaRankIcon(u16 * tm, int base)
{
    u16 ref = base * 3 + 0x4060;

    if (base > 2)
        ref += 0x1000;

    tm[TM_OFFSET(0, 0)] = ref;
    tm[TM_OFFSET(1, 0)] = ref + 1;
    tm[TM_OFFSET(2, 0)] = ref + 2;
    tm[TM_OFFSET(0, 1)] = ref + 0x20;
    tm[TM_OFFSET(1, 1)] = ref + 0x21;
    tm[TM_OFFSET(2, 1)] = ref + 0x22;

    return;
}

//! FE8U = 0x08046E94
void DrawLinkArenaModeIcon(u16 * tm, u32 base)
{
    u16 ref = base * 4 + 0xA0;

    tm[TM_OFFSET(0, 0)] = ref + 0x6000;
    tm[TM_OFFSET(1, 0)] = ref + 0x6001;
    tm[TM_OFFSET(0, 1)] = ref + 0x6002;
    tm[TM_OFFSET(1, 1)] = ref + 0x6003;

    return;
}

//! FE8U = 0x08046EB8
void DrawLinkArenaRankingRow(struct Text * th, char * nameStr, u8 rank, u16 points, u8 playerCount)
{
    Text_InsertDrawString(th, 8, TEXT_COLOR_SYSTEM_WHITE, nameStr);

    SioDrawNumber(th, 96, 2, points);

    Text_InsertDrawString(th, 104, TEXT_COLOR_SYSTEM_WHITE, gSioStr_Pts);
    Text_InsertDrawString(th, 136, TEXT_COLOR_SYSTEM_BLUE, DecodeMsg(gSioRankMsgLut[rank]));
    Text_InsertDrawString(th, 162, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(gSioPlayerMsgLut[playerCount]));

    return;
}

//! FE8U = 0x08046F68
void DrawLinkArenaRankings(void)
{
    int i;

    for (i = 0; i < 10; i++)
    {
        ClearText(&Texts_0203DB14[i]);
        DrawLinkArenaRankingRow(
            &Texts_0203DB14[i], gSioResultRankings[i].name, gSioResultRankings[i].ranking + 1,
            gSioResultRankings[i].points, gSioResultRankings[i].player_count + 1);
        DrawLinkArenaRankIcon(gBg1Tm + TM_OFFSET(2, i * 2), i);
        PutText(&Texts_0203DB14[i], gBg1Tm + TM_OFFSET(5, i * 2));
        DrawLinkArenaModeIcon(gBg1Tm + TM_OFFSET(20, i * 2), gSioResultRankings[i].mode);
    }

    return;
}

void SioResult_Init(struct SioResultProc * proc)
{
    int i;
    u8 title[8];

    memcpy(title, gUnknown_081D53CB, 8);

    ClearSioBG();
    sub_08047B34();

    Decompress(Img_LinkArenaRankIcons, (void *)(GetBgChrOffset(BG_1) + 0x06000C00));
    ApplyPalettes(gUnknown_081C7FC4, 4, 2);
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    sub_08047BD4(0, 2);

    TmApplyTsa_thm(gBg2Tm + TM_OFFSET(1, 4), Tsa_SioResultRankings, TILEREF(0x0, 1));

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_36 = 200;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_34 = 0;

    SetBgOffset(BG_1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_0203DB14[i], 22);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 16, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x77F)); // "Name"
    Text_InsertDrawString(&gSioTexts[0], 84, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x780)); // "Points"
    Text_InsertDrawString(&gSioTexts[0], 120, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x781)); // "Rank"
    Text_InsertDrawString(&gSioTexts[0], 150, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x782)); // "Players"

    PutText(&gSioTexts[0], gBg0Tm + TM_OFFSET(5, 5));

    PutSioText(0x3C2, 1); // "+Control Pad: move/B Button: back."

    sub_080A1F2C(gSioResultRankings);
    DrawLinkArenaRankings();

    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 56, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWOutLayers(1, 0, 1, 1, 1);

    StartLinkArenaMenuScrollBar(216, 56, 10, 5, proc->unk_36 + 56, proc);
    StartLinkArenaTitleBanner(proc, 5);
    sub_08047E84(title, 8, 0, 8, gLinkArenaSt.unk_00, proc);
    StartLinkArenaButtonSpriteDraw(192, 16, proc);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x0804720C
void SioResult_Loop_Main(struct SioResultProc * proc)
{
    if (proc->unk_38 >= 1)
    {
        proc->unk_36 -= 4;
        proc->unk_38--;

        SetBgOffset(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        return;
    }

    if (proc->unk_38 < 0)
    {
        proc->unk_36 += 4;
        proc->unk_38++;

        SetBgOffset(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        return;
    }

    if (((gpKeySt->repeated & DPAD_UP) != 0) && (proc->unk_34 != 0))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 -= 4;
        proc->unk_34--;

        proc->unk_38 = 3;

        SetBgOffset(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);
    }

    if (((gpKeySt->repeated & DPAD_DOWN) != 0) && (proc->unk_34 + 5 < 10))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 += 4;
        proc->unk_34++;

        proc->unk_38 = -3;

        SetBgOffset(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08047308
u8 sub_08041C44(int var)
{
    int i;

    if (var > 6)
    {
        return 5;
    }

    i = var - 2;

    if (i < 0)
    {
        i = 0;
    }

    return i;
}

void SioResult_NewHS_Init(struct SioResultProc * proc)
{
    int i;
    u8 title[8];

    memcpy(title, gUnknown_081D53D3, 7);

    ClearSioBG();
    sub_08047B34();

    Decompress(Img_LinkArenaRankIcons, (void *)(GetBgChrOffset(BG_1) + 0x06000C00));
    ApplyPalettes(gUnknown_081C7FC4, 4, 2);
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    Decompress(gUnknown_085ACEFC, (void *)0x06016000);
    ApplyPalette(Pal_LinkArenaActiveBannerFx, 0x13);

    sub_08047BD4(0, 0);

    TmApplyTsa_thm(gBg2Tm + TM_OFFSET(1, 4), Tsa_SioResultRankings, TILEREF(0x0, 1));

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_34 = 5;
    proc->unk_36 = 280;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_35 = sub_08041C44(proc->unk_3c);
    proc->unk_40 = 0;

    SetBgOffset(BG_1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_0203DB14[i], 24);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 16, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x77F)); // "Name"
    Text_InsertDrawString(&gSioTexts[0], 84, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x780)); // "Points"
    Text_InsertDrawString(&gSioTexts[0], 120, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x781)); // "Rank"
    Text_InsertDrawString(&gSioTexts[0], 150, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x782)); // "Players"

    PutText(&gSioTexts[0], gBg0Tm + TM_OFFSET(5, 5));

    sub_080A1F2C(gSioResultRankings);
    DrawLinkArenaRankings();

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 56, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWin1Box(0, 24, DISPLAY_WIDTH, 56);
    SetWin1Layers(1, 0, 1, 1, 0);

    SetWOutLayers(1, 0, 1, 1, 1);

    sub_08047E84(title, 7, 0, 8, gLinkArenaSt.unk_00, proc);

    proc->unk_2c = sub_080491F0(14, proc->unk_3c * 16 - 24, proc);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08047570
void SioResult_NewHS_LoopScroll(struct SioResultProc * proc)
{
    struct SioResultProcUnk2C * otherProc = proc->unk_2c;

    proc->unk_40++;

    if (proc->unk_40 < 60)
    {
        return;
    }

    if (proc->unk_35 == 5)
    {
        Proc_Break(proc);
    }

    if (proc->unk_38 >= 1)
    {
        proc->unk_36 -= 2;
        proc->unk_38--;

        SetBgOffset(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        otherProc->unk_30 += 2;
    }
    else
    {
        if (proc->unk_35 != proc->unk_34)
        {
            proc->unk_36 -= 2;
            proc->unk_34--;

            proc->unk_38 = 7;

            SetBgOffset(BG_1, 0, proc->unk_36);
            UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

            otherProc->unk_30 += 2;
        }

        if ((proc->unk_38 == 0) && (proc->unk_34 == proc->unk_35))
        {
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x0804762C
void SioResult_NewHS_AwaitAPress(ProcPtr proc)
{
    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        FadeBgmOut(0);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd CONST_DATA ProcScr_SIORESULT[];

extern struct ProcCmd CONST_DATA ProcScr_SIORESULT_NewHighScore[];

//! FE8U = 0x08047654
void StartSioResultNewHighScore(int value, ProcPtr parent)
{
    struct SioResultProc * proc = Proc_StartBlocking(ProcScr_SIORESULT_NewHighScore, parent);

    proc->unk_3c = value;

    return;
}
