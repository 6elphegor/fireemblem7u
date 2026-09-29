#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_menu.c

extern struct ProcCmd CONST_DATA ProcScr_DebugMonitor[];
void sub_08044ED8(void);
void sub_08044FFC(void);
extern struct ProcCmd CONST_DATA ProcScr_SIOTERM[];
extern const struct ProcCmd ProcScr_SIOPRA[];
extern const struct ProcCmd ProcScr_SIOBAT[];
extern struct ProcCmd CONST_DATA ProcScr_SIORESULT[];
extern struct ProcCmd CONST_DATA ProcScr_SIO_RuleSettings[];
void sub_08047F50(int x, int y);
void sub_08047F8C(int palId);
ProcPtr StartSioMenuBurstFx(ProcPtr parent, int x, int y);
void sub_08047F6C(int x, int y);
extern const u8 Img_LinkArenaMenu[];
extern const u16 Pal_LinkArenaMenu[];
extern struct FaceVramEnt CONST_DATA FaceConfig_085A9E48[];
extern struct FaceVramEnt CONST_DATA FaceConfig_085A9E68[];

//! FE8U = 0x08047A54
int SioMenu_GetItemHelpText(struct SioMenuProc * proc, int lineNum)
{
    
    int linkMenuMsgLut[] =
    {
        0x3B4, -1, // "Build or edit a multiplayer team."
        0x3B5, 0x3B6, // "Battle the computer." / "Set team # with + Control Pad."
        0x3B7, -1, // "Battle against a linked player."
        0x3B8, -1, // "Confirm battle records to date."
        0x3B9, -1, // "Set combat rules."
    };

    
    if (lineNum == 0)
    {
        if (proc->unk_58 == 0)
        {
            return 0x3B3; // "Select Edit Teams to build a team."
        }
    }
    else
    {
        if (proc->unk_58 == 0)
        {
            return -1;
        }
    }

    return linkMenuMsgLut[proc->unk_48 * 2 + lineNum];
}

const u8 gUnknown_080D9EF0[] = {
    0x80, 0x10, 0x68, 0x24, 0x50, 0x38, 0x38, 0x4C, 0x20, 0x60,
};

const u8 gUnknown_081D5426[] = {
    0x0C, 0x04, 0x0D, 0x14, 0x1A,
};

//! FE8U = 0x08047AB8
bool CheckSomethingSaveRelated(void)
{
    int i;
    struct PlaySt playSt;

    for (i = 0; i < 3; i++)
    {
        if (!IsSaveValid(i))
        {
            continue;
        }

        ReadGameSavePlaySt(i, &playSt);

        if (IsGameNotFirstChapter(&playSt))
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x08047AF4
void SioMenu_Init(void)
{
    int i;

    gLinkArenaSt.unk_0A = CheckSomethingSaveRelated();

    for (i = 0; i < 0x10; i++)
    {
        gKeyInputSequenceBuffer[i] = 0;
    }

    gCurrentKeyInSeqIndex = gTargetKeyInSeqIndex = gKeyInputSequenceTimer = 0;

    return;
}


void SioMenu_LoadGraphics(struct SioMenuProc * proc)
{
    int enabled;
    int i;
    u8 title[8];

    memcpy(title, gUnknown_081D5426, 5);

    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    proc->unk_59 = gSioSaveConfig._unk3_;

    InitSioBG();

    Decompress(Img_LinkArenaMenu, (void *)0x06014800);
    ApplyPalettes(Pal_LinkArenaMenu, 0x13, 3);

    sub_08047BD4(0, 4);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    sub_0803DCF0();

    proc->unk_4c = 0;

    proc->unk_58 = IsMultiArenaSaveReady();
    proc->menuItemState[0] = true;

    enabled = proc->unk_58 != 0;
    proc->menuItemState[1] = enabled;
    proc->menuItemState[2] = enabled;
    proc->menuItemState[3] = enabled;

    if (proc->unk_59 == 0)
    {
        enabled = false;
        proc->unk_50 = 3;
    }
    else
    {
        enabled = true;
        proc->unk_50 = 4;
    }

    proc->menuItemState[4] = enabled;

    proc->unk_48 = gLinkArenaSt.unk_01;
    proc->menuItemState[proc->unk_48] = 2;

    for (i = 4; i >= 0; i--)
    {
        proc->menuItems[i] = StartSioMenuItem(proc, 176, 160, i, proc->menuItemState[i]);
    }

    StartLinkArenaTitleBanner(proc->menuItems[0], 0);
    sub_08047E84(title, 5, 0, 0xA8, 0, proc->menuItems[0]);

    SetFaceConfig(FaceConfig_085A9E48);
    StartFace(3, 0xDF, 208, 80, 2);

    proc->unk_54 = 0;

    StartBgm(0x47, 0);
    sub_08044FFC();

    return;
}


void SioMenu_8047C60(struct SioMenuProc * proc)
{
    int i;

    int x = Interpolate(INTERPOLATE_RSQUARE, -80, gUnknown_080D9EF0[0], proc->unk_54, 32);
    int y = Interpolate(INTERPOLATE_RCUBIC, 160, gUnknown_080D9EF0[1], proc->unk_54, 32);

    for (i = 4; i >= 0; i--)
    {
        SioMenuItem_SetPosition(proc->menuItems[i], x, y);
    }

    sub_08047F6C(0, y + 8);

    if (proc->unk_54 >= 32)
    {
        proc->unk_54 = 0;

        PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
        PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);

        sub_08047F6C(0, gUnknown_080D9EF0[1] + 8);

        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

//! FE8U = 0x08047CF0
void sub_08042690(struct SioMenuProc * proc)
{
    int i;

    int idx = proc->unk_48 * 2;

    for (i = 4; i >= 0; i--)
    {
        int x = Interpolate(
            INTERPOLATE_RSQUARE, gUnknown_080D9EF0[idx + 0], gUnknown_080D9EF0[i * 2 + 0], proc->unk_54, 16);
        int y = Interpolate(
            INTERPOLATE_RSQUARE, gUnknown_080D9EF0[idx + 1], gUnknown_080D9EF0[i * 2 + 1], proc->unk_54, 16);
        SioMenuItem_SetPosition(proc->menuItems[i], x, y);
    }

    if (proc->unk_54 >= 16)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

extern struct FaceVramEnt CONST_DATA FaceConfig_085A9E68[];

void SioMenu_RestartGraphicsMaybe(struct SioMenuProc * proc)
{
    int enabled;
    int i;
    int idx;
    u8 title[8];

    memcpy(title, gUnknown_081D5426, 5);

    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    proc->unk_59 = gSioSaveConfig._unk3_;

    InitSioBG();

    Decompress(Img_LinkArenaMenu, (void *)0x06014800);
    ApplyPalettes(Pal_LinkArenaMenu, 0x13, 3);

    sub_08047BD4(0, 4);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    sub_0803DCF0();

    proc->unk_4c = 0;

    proc->unk_58 = IsMultiArenaSaveReady();
    proc->menuItemState[0] = true;

    enabled = proc->unk_58 != 0;
    proc->menuItemState[1] = enabled;
    proc->menuItemState[2] = enabled;
    proc->menuItemState[3] = enabled;

    if (proc->unk_59 == 0)
    {
        enabled = false;
        proc->unk_50 = 3;
    }
    else
    {
        enabled = true;
        proc->unk_50 = 4;
    }

    proc->menuItemState[4] = enabled;

    proc->unk_48 = gLinkArenaSt.unk_01;
    proc->menuItemState[proc->unk_48] = 2;

    idx = proc->unk_48 * 2;

    for (i = 4; i >= 0; i--)
    {
        proc->menuItems[i] = StartSioMenuItem(proc, gUnknown_080D9EF0[idx + 0], gUnknown_080D9EF0[idx + 1], i, proc->menuItemState[i]);
    }

    StartLinkArenaTitleBanner(proc->menuItems[0], 0);
    sub_08047E84(title, 5, 0, gUnknown_080D9EF0[proc->unk_48 * 2 + 1] + 8, 0, proc->menuItems[0]);

    SetFaceConfig(FaceConfig_085A9E68);
    StartFace(3, 0xDF, 208, 80, 2);

    PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
    PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);
    sub_08044FFC();

    StartBgm(0x47, 0);

    proc->unk_54 = 0;

    return;
}

//! FE8U = 0x08047EF8
void SioMenu_HandleDPadInput(struct SioMenuProc * proc, u8 b)
{
    if (proc->unk_48 == 1)
    {
        if ((gpKeySt->pressed & DPAD_LEFT) != 0)
        {

            gLinkArenaSt.unk_05--;
            if (gLinkArenaSt.unk_05 > 2)
            {
                gLinkArenaSt.unk_05 = 2;
            }

            SioMenuItem_SetArrowConfig(proc->menuItems[1], -6, 0x34, 0x1f, 4);
            SioPlaySoundEffect(3);
        }

        if ((gpKeySt->pressed & DPAD_RIGHT) != 0)
        {
            gLinkArenaSt.unk_05++;
            gLinkArenaSt.unk_05 = gLinkArenaSt.unk_05 % 3;

            SioMenuItem_SetArrowConfig(proc->menuItems[1], 0, 0x3a, 4, 0x1f);
            SioPlaySoundEffect(3);
        }
    }

    if (((gpKeySt->repeated & DPAD_UP) != 0) &&
        ((proc->unk_48 > proc->unk_4c) || (gpKeySt->repeated == gpKeySt->pressed)))
    {
        do
        {
            proc->unk_48--;
            if (proc->unk_48 < 0)
            {
                proc->unk_48 = b - 1;
            }
        } while (proc->menuItemState[proc->unk_48] == 0);
    }

    if (((gpKeySt->repeated & DPAD_DOWN) != 0) &&
        ((proc->unk_48 < proc->unk_50) || (gpKeySt->repeated == gpKeySt->pressed)))
    {
        do
        {
            proc->unk_48++;
            proc->unk_48 = proc->unk_48 % b;
        } while (proc->menuItemState[proc->unk_48] == 0);
    }
    return;
}

void SioMenu_Loop_HandleKeyInput(struct SioMenuProc * proc)
{
    int idx;

    idx = proc->unk_48;
    SioMenu_HandleDPadInput(proc, 5);

    if (idx != proc->unk_48)
    {
        struct SioMenuItemProc * child;

        SioPlaySoundEffect(3);

        child = proc->menuItems[idx];
        child->state = 1;

        child = proc->menuItems[proc->unk_48];
        child->state = 2;

        StartSioMenuBurstFx(child, child->xBase, child->yBase);

        PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
        PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);

        sub_08047F50(0, gUnknown_080D9EF0[proc->unk_48 * 2 + 1] + 8);
        sub_08047F8C(proc->unk_48);
    }

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        proc->unk_54 = 0;
        SioPlaySoundEffect(2);
        gLinkArenaSt.unk_00 = proc->unk_48;
        Proc_Break(proc);
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        FadeBgmOut(2);
        gLinkArenaSt.unk_00 = 0xff;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080480B4
void SioMenu_80480B4(struct SioMenuProc * proc)
{
    int r2;
    int i;

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        Proc_Break(proc);
    }

    r2 = gLinkArenaSt.unk_00;

    if (proc->unk_54 <= 16)
    {
        for (i = 4; i >= 0; i--)
        {
            int x = Interpolate(
                INTERPOLATE_RSQUARE, gUnknown_080D9EF0[i * 2 + 0], gUnknown_080D9EF0[r2 * 2 + 0], proc->unk_54, 0x10);
            int y = Interpolate(
                INTERPOLATE_RSQUARE, gUnknown_080D9EF0[i * 2 + 1], gUnknown_080D9EF0[r2 * 2 + 1], proc->unk_54, 0x10);
            SioMenuItem_SetPosition(proc->menuItems[i], x, y);
        }
    }

    if (proc->unk_54 > 32)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

void SioMenu_End(struct SioMenuProc * proc)
{
    int i;

    const struct ProcCmd * SioMenuProcLut[5] = {
        ProcScr_SIOTERM, // Edit Teams
        ProcScr_SIOPRA, // Practice
        ProcScr_SIOBAT, // Linked Battle
        ProcScr_SIORESULT, // Battle Data
        ProcScr_SIO_RuleSettings, // Rule Settings
    };

    EndFaceById(3);

    for (i = 0; i < 5; i++)
    {
        Proc_End(proc->menuItems[i]);
    }

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        BMapVSync_End();
        sub_08047CA8();

        UnsetBmStLinkArenaFlag();

        Proc_EndEach(ProcScr_DebugMonitor);
        Proc_End(proc);
    }
    else
    {
        gLinkArenaSt.unk_01 = gLinkArenaSt.unk_00;
        Proc_StartBlocking(SioMenuProcLut[gLinkArenaSt.unk_00], proc);
    }

    return;
}

extern struct ProcCmd CONST_DATA ProcScr_SIOMENU[];

//! FE8U = 0x080481E0
void StartLinkArenaMainMenu(ProcPtr parent)
{
    UnpackUiWindowFrameGraphics();
    InitTextFont(&Font_0203DB64, (void *)0x06001800, 0xc0, 0);

    if (!IsSaveValid(5))
    {
        WriteNewMultiArenaSave();
    }

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    SetBmStLinkArenaFlag();
    sub_08044ED8();

    StartBmVSync();

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_COMPLETE;
    gPlaySt.config_window_theme = 0;

    Proc_StartBlocking(ProcScr_SIOMENU, parent);
    Proc_Start(ProcScr_DebugMonitor, PROC_TREE_3);

    return;
}

void EndLinkArenaVersusSpriteDraw();
void FE6Link_Init();
extern const struct ProcCmd ProcScr_LinkArenaPostBattle_DrawSprites[];
void Set_0203DDDC();
void sub_08047DA4();
void sub_08047F1C();

SECTION(".rodata.08B98F9C")
const struct ProcCmd ProcScr_SIOPRA[] = {
    PROC_19,
    PROC_SLEEP(0),
    PROC_CALL(StartLinkArenaTeamList),
    PROC_SLEEP(0),
    PROC_CALL(sub_080416D4),
    PROC_CALL(sub_08040444),
    PROC_CALL(sub_08047CA8),
    PROC_CALL(sub_08047DA4),
    PROC_CALL(sub_08047F1C),
    PROC_SLEEP(0),
    PROC_CALL(New6C_SIOMAIN2),
    PROC_SLEEP(0),
    PROC_REPEAT(SIOPRA_Loop),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_START_CHILD_BLOCKING(&ProcScr_LinkArenaPostBattle_DrawSprites[5]),
    PROC_SLEEP(0),
    PROC_CALL(sub_0803DDD0),
    PROC_LABEL(4),
    PROC_LABEL(1),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_END,
};

SECTION(".rodata.08B99088")
const struct ProcCmd ProcScr_SIOBAT[] = {
    PROC_19,
    PROC_LABEL(0),
    PROC_CALL(StartLinkArenaTeamList),
    PROC_SLEEP(0),
    PROC_CALL(sub_080416D4),
    PROC_CALL(sub_08047CA8),
    PROC_CALL(sub_08047DA4),
    PROC_CALL(sub_08047F1C),
    PROC_CALL(sub_08040714),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(FE6Link_Init),
    PROC_CALL(sub_08040870),
    PROC_LABEL(3),
    PROC_REPEAT(sub_080408B8),
    PROC_CALL(sub_080412C8),
    PROC_REPEAT(sub_08040AE0),
    PROC_CALL(sub_0803DB10),
    PROC_REPEAT(sub_0803DB24),
    PROC_CALL(sub_08040B80),
    PROC_REPEAT(sub_08040C24),
    PROC_CALL(sub_0803DB10),
    PROC_REPEAT(sub_0803DB24),
    PROC_REPEAT(sub_08040CFC),
    PROC_SLEEP(10),
    PROC_CALL(sub_08040DB0),
    PROC_SLEEP(80),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(EndLinkArenaVersusSpriteDraw),
    PROC_CALL(sub_0804116C),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(FE6Link_Init),
    PROC_SLEEP(180),
    PROC_CALL(sub_0803DB10),
    PROC_REPEAT(sub_0803DB24),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(sub_08047CA8),
    PROC_CALL(sub_08047DA4),
    PROC_CALL(sub_08047F1C),
    PROC_CALL(sub_08041104),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(FE6Link_Init),
    PROC_CALL(sub_08040E08),
    PROC_REPEAT(sub_08040ED8),
    PROC_REPEAT(sub_0804105C),
    PROC_CALL(sub_0803DB10),
    PROC_REPEAT(sub_0803DB24),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(EndLinkArenaVersusSpriteDraw),
    PROC_CALL(sub_08047CA8),
    PROC_SLEEP(1),
    PROC_CALL(New6C_SIOMAIN2),
    PROC_SLEEP(0),
    PROC_REPEAT(SIOPRA_Loop),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(sub_080412D4),
    PROC_CALL(sub_08040610),
    PROC_START_CHILD_BLOCKING(&ProcScr_LinkArenaPostBattle_DrawSprites[5]),
    PROC_SLEEP(0),
    PROC_CALL(sub_08040634),
    PROC_CALL(sub_080403B0),
    PROC_SLEEP(0),
    PROC_CALL(sub_0803DDD0),
    PROC_CALL(sub_08047CA8),
    PROC_GOTO(1),
    PROC_LABEL(2),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(InitFaces),
    PROC_CALL(EndLinkArenaVersusSpriteDraw),
    PROC_GOTO(0),
    PROC_LABEL(4),
    PROC_CALL(sub_0803DB10),
    PROC_REPEAT(sub_0803DB24),
    PROC_SLEEP(1),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(sub_080412D4),
    PROC_CALL(sub_08040610),
    PROC_CALL(sub_08040634),
    PROC_LABEL(1),
    PROC_CALL(sub_0803C414),
    PROC_END,
};
