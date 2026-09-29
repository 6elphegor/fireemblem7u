#include "gbafe.h"

extern int TacticianBirthAffins[12];

struct DebugChargeMsgs { int msg[3]; };

extern const struct DebugChargeMsgs sDebugChargeMsgs;
extern char const sDebugStr3rd[];
extern char const sDebugStr2nd[];
extern struct ProcCmd ProcScr_GameControl[];
extern const struct ProcCmd gProcScr_Debug_08B9335C[];


extern const struct MenuDef gDebugMenuDef_08B958B4;
extern const struct MenuDef gDebugMenuDef_08B9586C;
extern struct ProcCmd ProcScr_BmMain[];
extern u16 Pal_MuralBackground[];
extern u16 Pal_LinkArenaMuralBackground[];

void StartGame(void);
void sub_08012BAC(void);
void sub_08012BD0(void);
void SetVisionWithFade(int vision_range);
bool IsMapFadeActive(void);


extern const struct MenuDef gDebugClearMenuDef;
extern const struct MenuDef gDebugStartupMenuDef;
extern char const sDebugStartupStr[];

void WriteCompletedPlaythroughSaveData(void);
void SetTalkUnkStr(char const * str);
void PutBuildInfo(u16 * tm);
void RefreshBMapGraphics(void);


struct DebugMonitorProc {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x58 - 0x29];
    /* 58 */ int weather;
    /* 5C */ u8 _pad_5C[0x66 - 0x5C];
    /* 66 */ s16 displayInfo;
};

struct DebugOnOffMsgs { int msg[2]; };
struct DebugWeatherMsgs { int msg[7]; };

extern struct ProcCmd CONST_DATA ProcScr_DebugMonitor[];
extern const struct DebugOnOffMsgs sDebugOnOffMsgs;
extern const struct DebugWeatherMsgs sDebugWeatherMsgs;

void SetupDebugFontForOBJ(int vramOffset, int palId);
void SetWeather(int weather);


void DebugPutStr(u16 * tm, char const * str);
void EndMapMain(void);
void sub_08012B88(void);
int CountTotalSoundRoomSongs(void);
int GetCurrentBgmSong(void);

struct SoundRoomEnt
{
    /* 00 */ int bgmId;
    /* 04 */ int songLength;
    /* 08 */ s8 (* displayCondFunc)(ProcPtr proc);
    /* 0C */ int nameTextId;
};

extern const struct SoundRoomEnt gSoundRoomTable[];
extern struct SoundRoomEnt CONST_DATA gUnk_08CE5378[];
extern char const sDebugBlankStr[];


struct DebugPrintProc {
    PROC_HEADER;

    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ u8 _pad_34[0x52 - 0x34];
    /* 52 */ u16 width;
    /* 54 */ const char * text;
};

extern const struct ProcCmd gProc_DebugPrintWithProc[];
extern const struct MenuDef gDebugMenuDef;

void NewKeyStSetter(int keys);
void DebugInitBg(int bg, int vramOffset);

int Return2or3BySecondParity(void)
{
    int retVal;
    u16 hours;
    u16 minutes;
    u16 seconds;

    FormatTime(GetGameTime(), &hours, &minutes, &seconds);

    if ((seconds & 1) == 0)
        retVal = 2;
    else
        retVal = 3;

    return retVal;
}

int Return3or2BySecondParity(void)
{
    int retVal;
    u16 hours;
    u16 minutes;
    u16 seconds;

    FormatTime(GetGameTime(), &hours, &minutes, &seconds);

    if ((seconds & 1) != 0)
        retVal = 2;
    else
        retVal = 3;

    return retVal;
}

int Get8(void)
{
    return MENU_ACT_SND6B;
}

int Get23(void)
{
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

void DummyFunction(void)
{
}

void Loop6C_WaitForSelectPress(ProcPtr proc)
{
    if (gpKeySt->pressed & SELECT_BUTTON)
        Proc_Break(proc);
}

void SetNewKeyStatusWith16(void)
{
    NewKeyStSetter(DPAD_RIGHT);
}

void DummyFunction2(void)
{
}

void DebugPrintWithProc(struct DebugPrintProc * proc)
{
    struct Text text;

    int x = proc->x;
    int y = proc->y;
    int width = proc->width;
    const char * str = proc->text;

    InitText(&text, width);
    Text_DrawString(&text, str);
    DrawUiFrame2(x, y, width + 2, 4, 0);
    PutText(&text, gBg0Tm + TM_OFFSET(x + 1, y + 1));
    EnableBgSync(3);
}

void DebugPrint(int x, int y, int width, const char * text)
{
    struct DebugPrintProc * proc = Proc_Start(gProc_DebugPrintWithProc, PROC_TREE_3);
    proc->x = x;
    proc->y = y;
    proc->text = text;
    proc->width = width;
}

int StartDebugMenu(struct MenuProc * menuProc)
{
    EndMenu(menuProc);
    ClearUi();
    StartMenu(&gDebugMenuDef);
    DebugInitBg(2, 0);
    return 1;
}

u8 sub_0801B338(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (gpKeySt->repeated & DPAD_RIGHT)
        menuItemProc->itemNumber++;

    if (gpKeySt->repeated & DPAD_LEFT)
        menuItemProc->itemNumber--;

    if (menuItemProc->itemNumber > 0x42)
        menuItemProc->itemNumber = 0x42;

    if (menuItemProc->itemNumber < 0)
        menuItemProc->itemNumber = 0;

    if (gpKeySt->repeated & (DPAD_RIGHT | DPAD_LEFT))
    {
        DebugPutStr(gBg0Tm + TM_OFFSET(7, 3), sDebugBlankStr);
        DebugPutStr(gBg0Tm + TM_OFFSET(7, 3), GetChapterInfo(menuItemProc->itemNumber)->debug_name);
        EnableBgSync(BG0_SYNC_BIT);
    }

    return 0;
}

u8 sub_0801B3C4(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    EndMapMain();
    gPlaySt.chapterIndex = menuItemProc->itemNumber;
    CleanupUnitsBeforeChapter();
    sub_08012B88();
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

int sub_0801B3E8(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int songId;
    int i;

    int totalSongs = CountTotalSoundRoomSongs();

    menuItemProc->itemNumber = 0;

    songId = GetCurrentBgmSong();

    for (i = 0; i < totalSongs; i++)
    {
        if (songId == i)
        {
            menuItemProc->itemNumber = i;
            break;
        }
    }

    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 0, 0, DecodeMsg(gSoundRoomTable[menuItemProc->itemNumber].nameTextId));
    PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));
}

int sub_0801B470(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (gpKeySt->repeated & DPAD_RIGHT)
        menuItemProc->itemNumber++;

    if (gpKeySt->repeated & DPAD_LEFT)
        menuItemProc->itemNumber--;

    if (menuItemProc->itemNumber < 0)
        menuItemProc->itemNumber = 0;

    if (gSoundRoomTable[menuItemProc->itemNumber].bgmId < 0)
        menuItemProc->itemNumber--;

    if (gpKeySt->repeated & (DPAD_RIGHT | DPAD_LEFT))
    {
        ClearText(&menuItemProc->text);
        Text_InsertDrawString(&menuItemProc->text, 0, 0, DecodeMsg(gSoundRoomTable[menuItemProc->itemNumber].nameTextId));
        PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));
    }

    return 0;
}

u8 sub_0801B528(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (gSoundRoomTable == gUnk_08CE5378)
    {
        PlaySoundEffect(gSoundRoomTable[menuItemProc->itemNumber].bgmId);
    }
    else
    {
        StartBgmExt(gSoundRoomTable[menuItemProc->itemNumber].bgmId, 1, NULL);
    }

    return 0;
}

u8 EndMenuAndClear(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    EndMenu(menuProc);
    EndFaceById(0);
    ClearUi();

    return 1;
}

int DebugMapMenu_DisplayInfoDraw(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    struct DebugOnOffMsgs msgs = sDebugOnOffMsgs;
    struct DebugMonitorProc * proc = Proc_Find(ProcScr_DebugMonitor);

    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, 0, DecodeMsg(0x1247));
    Text_InsertDrawString(&menuItemProc->text, 64, 2, DecodeMsg(msgs.msg[proc->displayInfo]));
    PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

u8 DebugMapMenu_DisplayInfoIdle(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    struct DebugMonitorProc * proc = Proc_Find(ProcScr_DebugMonitor);

    if (gpKeySt->pressed & (A_BUTTON | DPAD_RIGHT | DPAD_LEFT))
    {
        proc->displayInfo ^= 1;
        DebugMapMenu_DisplayInfoDraw(menuProc, menuItemProc);
        SetupDebugFontForOBJ(-1, 9);
    }

    return 0;
}

u8 DebugMapMenu_DisplayInfoEffect(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    return 0;
}

int DebugMenu_WeatherDraw(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    struct DebugWeatherMsgs msgs = sDebugWeatherMsgs;
    struct DebugMonitorProc * proc = Proc_Find(ProcScr_DebugMonitor);

    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, 0, DecodeMsg(0x124F));
    Text_InsertDrawString(&menuItemProc->text, 64, 2, DecodeMsg(msgs.msg[proc->weather % 7]));
    PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

u8 DebugMenu_WeatherIdle(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    struct DebugMonitorProc * proc;

    if (gpKeySt->pressed & (A_BUTTON | DPAD_RIGHT | DPAD_LEFT))
    {
        proc = Proc_Find(ProcScr_DebugMonitor);
        proc->weather++;

        DebugMenu_WeatherDraw(menuProc, menuItemProc);

        switch (proc->weather % 7)
        {
        case 0:
            SetWeather(0);
            break;

        case 1:
            SetWeather(6);
            break;

        case 2:
            SetWeather(1);
            break;

        case 3:
            SetWeather(2);
            break;

        case 4:
            SetWeather(4);
            break;

        case 5:
            SetWeather(3);
            break;

        case 6:
            SetWeather(5);
            break;
        }
    }

    return 0;
}

u8 DebugMenu_WeatherEffect(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    return 0;
}

int DebugMenu_ClearDraw(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, 0, DecodeMsg(0x1250));
    Text_InsertDrawString(&menuItemProc->text, 0x48, 2, DecodeMsg(0x1251));
    Text_InsertDrawNumberOrBlank(&menuItemProc->text, 0x40, 2, GetGlobalCompletionCount() + 1);
    PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

u8 DebugMenu_ClearIdle(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int i;
    struct GlobalSaveInfo info;

    if (gpKeySt->repeated & (DPAD_RIGHT | DPAD_LEFT))
    {
        int count = GetGlobalCompletionCount();

        if (gpKeySt->repeated & DPAD_LEFT)
            if (count >= 0)
                count--;

        if (gpKeySt->repeated & DPAD_RIGHT)
            if (count < 12)
                count++;

        ReadGlobalSaveInfo(&info);

        for (i = 0; i < MAX_CLEARED_PLAYTHROUGHS; i++)
            info.cleared_playthroughs[i] = 0;

        for (i = 0; i < count; i++)
            RegisterCompletedPlaythrough(&info, i + 1);

        if (count == 0)
            info.completed = 0;
        else
            info.completed = 1;

        WriteGlobalSaveInfo(&info);

        DebugMenu_ClearDraw(menuProc, menuItemProc);
    }

    return 0;
}

u8 DebugMenu_ClearEffect(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

u8 DebugMenu_ErasedEffect(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    ClearUi();
    StartMenu(&gDebugClearMenuDef);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A);
}

u8 sub_0801B8D4(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    WriteCompletedPlaythroughSaveData();
    gPlaySt.chapterStateBits &= ~PLAY_FLAG_PREPSCREEN;
    CleanupUnitsBeforeChapter();
    WriteGameSave(ReadLastGameSaveId());
    SoftReset(0xFF);
}

int DebugMenuInit(void)
{
    DebugPutStr(gBg0Tm + TM_OFFSET(7, 3), GetChapterInfo(0)->debug_name);
    EnableBgSync(BG0_SYNC_BIT);
}

void sub_0801B924(void)
{
    struct MenuProc * menu;

    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);
    RefreshBMapGraphics();
    DebugInitBg(2, 0);
    SetTalkUnkStr(sDebugStartupStr);
    menu = StartMenu(&gDebugStartupMenuDef);

    gBmSt.flags |= BM_FLAG_LINKARENA;
    StartMuralBackgroundAlt(menu, (void *) 0x0600B000, -1);
    gBmSt.flags &= ~BM_FLAG_LINKARENA;

    PutBuildInfo(gBg2Tm + 0x20);
}

int sub_0801B990(struct MenuProc * menuProc)
{
    struct SaveBlockInfo block;

    menuProc->menuItems[4]->itemNumber = 0;

    EnableBgSync(BG0_SYNC_BIT);

    if ((ReadSaveBlockInfo(&block, 3) != 1) || (((block.checksum32 + (block.checksum32 >> 0x10)) & 0xff)) != 0)
    {
        StartFace(0, 0xB7, 32, 80, 0x103);
        StartFace(1, 0xB6, 208, 80, 0x102);
        return 0;
    }

    StartFace(0, 0xB4, 32, 80, 0x103);
    StartFace(1, 0xB2, 208, 80, 0x102);

    return 0;
}

int sub_0801BA10(void)
{
    EndFaceById(0);
    EndFaceById(1);
    SetDispEnable(0, 0, 0, 0, 0);
    gPal[0] = 0;
    EnablePalSync();
}

u8 sub_0801BA54(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int x = menuProc->rect.x + 2;
    int y = menuProc->rect.y + 10;

    if (gpKeySt->repeated & DPAD_RIGHT)
    {
        if (menuItemProc->itemNumber < 0x42)
            menuItemProc->itemNumber++;
        else if (gpKeySt->pressed & DPAD_RIGHT)
            menuItemProc->itemNumber = 0;
    }

    if (gpKeySt->repeated & DPAD_LEFT)
    {
        if (menuItemProc->itemNumber > 0)
            menuItemProc->itemNumber--;
        else if (gpKeySt->pressed & DPAD_LEFT)
            menuItemProc->itemNumber = 0x42;
    }

    if (gpKeySt->repeated & (DPAD_RIGHT | DPAD_LEFT))
    {
        DebugPutStr(gBg0Tm + TM_OFFSET(x, y), sDebugBlankStr);
        DebugPutStr(gBg0Tm + TM_OFFSET(x, y), GetChapterInfo(menuItemProc->itemNumber)->debug_name);
        EnableBgSync(BG0_SYNC_BIT);
    }

    if (gpKeySt->held & R_BUTTON)
    {
        gPlaySt.chapterModeIndex = 3;
        ApplyPalettes(Pal_MuralBackground, 0xE, 2);
    }
    else
    {
        gPlaySt.chapterModeIndex = 2;
        ApplyPalettes(Pal_LinkArenaMuralBackground, 0xE, 2);
    }

    if (menuItemProc->itemNumber <= 11)
        gPlaySt.chapterModeIndex = 1;

    EnablePalSync();

    return 0;
}

u8 sub_0801BB74(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    RandInit(GetGameTime());
    InitUnits();

    if (gpKeySt->held & L_BUTTON)
        WriteNewGameSave(0, 1, 0);
    else
        WriteNewGameSave(0, 0, 0);

    SetTacticianName(DecodeMsg(0x55B));

    gPlaySt.chapterIndex = menuItemProc->itemNumber;

    WriteGameSave(0);

    CleanupUnitsBeforeChapter();
    sub_08012B88();

    return 2;
}

u8 sub_0801BBE0(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    StartMenu(&gDebugMenuDef_08B958B4);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

u8 sub_0801BBF4(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    StartMenu(&gDebugMenuDef_08B9586C);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

u8 sub_0801BC08(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    sub_080A4E0C(PROC_TREE_3);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

u8 sub_0801BC18(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    return MENU_DISABLED;
}

u8 sub_0801BC1C(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int result;

    if (menuItemProc->availability == MENU_ENABLED)
    {
        WriteSuspendSave(4);
        result = (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
    }
    else
        result = MENU_ACT_SND6B;

    return result;
}

int DebugContinueMenu_IsManualContinueAvailable(const struct MenuItemDef * def, int number)
{
    return IsValidSuspendSave(4) ? MENU_ENABLED : MENU_DISABLED;
}

u8 DebugContinueMenu_ManualContinue(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (menuItemProc->availability != MENU_ENABLED)
        return MENU_ACT_SND6B;

    if (Proc_Find(ProcScr_BmMain))
        EndMapMain();

    ReadSuspendSave(4);
    sub_08012BAC();

    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

u8 DebugContinueMenu_InitializeFile(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (menuItemProc->availability != MENU_ENABLED)
        return MENU_ACT_SND6B;

    if (Proc_Find(ProcScr_BmMain))
        EndMapMain();

    sub_08012BD0();

    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

int DebugContinueMenu_IsContinueChapterAvailable(const struct MenuItemDef * def, int number)
{
    return IsValidSuspendSave(3) ? MENU_ENABLED : MENU_DISABLED;
}

u8 DebugContinueMenu_ContinueChapter(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int result;

    if (menuItemProc->availability == MENU_ENABLED)
    {
        ReadSuspendSave(3);
        sub_08012BAC();
        result = (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
    }
    else
        result = MENU_ACT_SND6B;

    return result;
}

int DebugMenu_FogDraw(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    struct DebugOnOffMsgs msgs = sDebugOnOffMsgs;

    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, 0, DecodeMsg(0x1253));
    Text_InsertDrawString(&menuItemProc->text, 64, 2, DecodeMsg(msgs.msg[gPlaySt.chapterVisionRange != 0]));
    PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

u8 DebugMenu_FogIdle(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    if (!IsMapFadeActive() && (gpKeySt->pressed & (A_BUTTON | DPAD_RIGHT | DPAD_LEFT)))
    {
        if (gPlaySt.chapterVisionRange == 0)
            SetVisionWithFade(GetChapterInfo(gPlaySt.chapterIndex)->fog);
        else
            SetVisionWithFade(0);

        DebugMenu_FogDraw(menuProc, menuItemProc);
    }

    return 0;
}

u8 DebugMenu_FogEffect(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    return 0;
}

u8 DebugContinueMenu_ReleaseEntry(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    StartGame();
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A);
}

u8 DebugMenu_GNightEffect(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    sub_08002D48(0x300);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

int DebugChargeMenu_Draw(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    struct DebugChargeMsgs msgs = sDebugChargeMsgs;
    int level = menuItemProc->itemNumber ? gPlaySt.debugControlGreen : gPlaySt.debugControlRed;

    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, 0, menuItemProc->itemNumber ? sDebugStr3rd : sDebugStr2nd);
    Text_InsertDrawString(&menuItemProc->text, 0x20, 2, DecodeMsg(msgs.msg[level]));
    PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}

u8 DebugChargeMenu_Idle(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int level;

    if (gpKeySt->pressed & (A_BUTTON | DPAD_RIGHT | DPAD_LEFT))
    {
        level = menuItemProc->itemNumber ? gPlaySt.debugControlGreen : gPlaySt.debugControlRed;

        if (gpKeySt->pressed & DPAD_LEFT)
            level--;

        if (gpKeySt->pressed & (A_BUTTON | DPAD_RIGHT))
            level++;

        if (level > 2)
            level = 2;

        if (level < 0)
            level = 0;

        if (menuItemProc->itemNumber)
            gPlaySt.debugControlGreen = level;
        else
            gPlaySt.debugControlRed = level;

        DebugChargeMenu_Draw(menuProc, menuItemProc);
    }

    return 0;
}

int sub_0801BF38(void)
{
    sub_08012B88();
    Proc_Goto(Proc_Find(ProcScr_GameControl), 15);
}

int Debug_GetChapterId(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int n;

    TmFillRect_thm(gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile), 8, 1, 0);

    if (gPlaySt.tact_enabled)
    {
        InitIcons();
        ApplyIconPalettes(4);

        ClearText(&menuItemProc->text);
        Text_InsertDrawNumberOrBlank(&menuItemProc->text, 0x30, 0, gPlaySt.tact_birth + 1);
        Text_InsertDrawNumberOrBlank(&menuItemProc->text, 0x48, 2, gPlaySt.unk2C_04);

        n = gPlaySt.unk2C_04 / 12;

        if (n > 10)
            n = 10;

        Text_InsertDrawNumberOrBlank(&menuItemProc->text, 0x58, 3, n);
        PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));
        PutIcon(gBg0Tm + TM_OFFSET(menuItemProc->xTile + 1, menuItemProc->yTile),
            TacticianBirthAffins[gPlaySt.tact_birth] + 0x79, 0x5000);
    }
    else
    {
        ClearText(&menuItemProc->text);
        Text_InsertDrawString(&menuItemProc->text, 8, 1, DecodeMsg(0x1290));
        PutText(&menuItemProc->text, gBg0Tm + TM_OFFSET(menuItemProc->xTile, menuItemProc->yTile));
    }

    EnableBgSync(BG0_SYNC_BIT);
}

u8 DebugMenuMapIdleCore(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    int v;

    if (gpKeySt->repeated & (L_BUTTON | R_BUTTON | DPAD_LEFT | DPAD_RIGHT | SELECT_BUTTON))
    {
        if ((gpKeySt->repeated & DPAD_LEFT) && gPlaySt.unk2C_04 > 0)
        {
            v = gPlaySt.unk2C_04 - 1;

            if (v > 0xFF)
                v = 0xFF;

            gPlaySt.unk2C_04 = v;
        }

        if (gpKeySt->repeated & DPAD_RIGHT)
        {
            v = gPlaySt.unk2C_04 + 1;

            if (v > 0xFF)
                v = 0xFF;

            gPlaySt.unk2C_04 = v;
        }

        if (gpKeySt->repeated & L_BUTTON)
            gPlaySt.tact_enabled = 0;

        if (gpKeySt->repeated & R_BUTTON)
            gPlaySt.tact_enabled = 1;

        if (gpKeySt->repeated & SELECT_BUTTON)
        {
            v = gPlaySt.tact_birth;

            if (v <= 10)
                gPlaySt.tact_birth = v + 1;
            else
                gPlaySt.tact_birth = 0;
        }

        Debug_GetChapterId(menuProc, menuItemProc);
    }

    return 0;
}

u8 sub_0801C164(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

u8 sub_0801C168(struct MenuProc * menuProc, struct MenuItemProc * menuItemProc)
{
    Proc_Start(gProcScr_Debug_08B9335C, PROC_TREE_3);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

SECTION(".rodata.08B93344")
const struct ProcCmd gProc_DebugPrintWithProc[] = {
    PROC_SLEEP(1),
    PROC_CALL(DebugPrintWithProc),
    PROC_END,
};

SECTION(".rodata.08B9335C")
const struct ProcCmd gProcScr_Debug_08B9335C[] = {
    PROC_CALL(StartNameSelect),
    PROC_SLEEP(0),
    PROC_END,
};

extern const struct MenuItemDef gDebugClearMenuItems[];
extern const struct MenuItemDef gUnk_08B94744[];
extern const struct MenuItemDef gUnk_08B947B0[];
extern const struct MenuItemDef gUnk_08B94864[];
extern const struct MenuItemDef gDebugMenuItems[];

SECTION(".rodata.08B9466C")
const struct MenuItemDef gDebugClearMenuItems[] = {
    {
        .name = gUnk_081C3D7C,
        .nameMsgId = 0x10B6,
        .overrideId = 3,
        .isAvailable = MenuAlwaysEnabled,
    },
    {
        .name = gUnk_081C3D70,
        .nameMsgId = 0x10B7,
        .overrideId = 4,
        .isAvailable = MenuAlwaysEnabled,
    },
    {
        .name = gUnk_081C3D58,
        .nameMsgId = 0x10B8,
        .overrideId = 5,
        .isAvailable = MenuAlwaysEnabled,
    },
    {
        .name = gUnk_081C3D40,
        .nameMsgId = 0x10B9,
        .overrideId = 6,
        .isAvailable = MenuAlwaysEnabled,
    },
    {
        .name = gUnk_081C3D28,
        .nameMsgId = 0x10BA,
        .color = 4,
        .overrideId = 7,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = sub_0801B8D4,
    },
    { 0 },
};

SECTION(".rodata.08B94744")
const struct MenuItemDef gUnk_08B94744[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 8,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = DebugChargeMenu_Draw,
        .onIdle = DebugChargeMenu_Idle,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 9,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = DebugChargeMenu_Draw,
        .onIdle = DebugChargeMenu_Idle,
    },
    { 0 },
};

SECTION(".rodata.08B947B0")
const struct MenuItemDef gUnk_08B947B0[] = {
    {
        .name = gUnk_081C3DC8,
        .nameMsgId = 0x10BB,
        .overrideId = 0xA,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = DebugContinueMenu_ReleaseEntry,
    },
    {
        .name = gUnk_081C3DB8,
        .nameMsgId = 0x10BC,
        .overrideId = 0xB,
        .isAvailable = (void *) DebugContinueMenu_IsContinueChapterAvailable,
        .onSelected = DebugContinueMenu_ContinueChapter,
    },
    {
        .name = gUnk_081C3DAC,
        .nameMsgId = 0x10BF,
        .overrideId = 0xC,
        .isAvailable = (void *) DebugContinueMenu_IsManualContinueAvailable,
        .onSelected = DebugContinueMenu_ManualContinue,
    },
    {
        .name = gUnk_081C3D98,
        .nameMsgId = 0x10BD,
        .overrideId = 0xD,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = DebugContinueMenu_InitializeFile,
    },
    { 0 },
};

SECTION(".rodata.08B94864")
const struct MenuItemDef gUnk_08B94864[] = {
    {
        .name = gUnk_081C3DDC,
        .nameMsgId = 0x10BE,
        .overrideId = 0xF,
        .isAvailable = (void *) sub_0801BC18,
        .onSelected = sub_0801BC1C,
    },
    { 0 },
};

SECTION(".rodata.08B948AC")
const struct MenuItemDef gDebugMenuItems[] = {
    {
        .name = gUnk_081C3E48,
        .nameMsgId = 0x10C0,
        .overrideId = 0x10,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = sub_0801B3C4,
        .onIdle = sub_0801B338,
    },
    {
        .name = gUnk_081C3E3C,
        .nameMsgId = 0x10C1,
        .overrideId = 0x11,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = DebugMapMenu_DisplayInfoDraw,
        .onSelected = DebugMapMenu_DisplayInfoEffect,
        .onIdle = DebugMapMenu_DisplayInfoIdle,
    },
    {
        .name = gUnk_081C3E34,
        .nameMsgId = 0x10C2,
        .overrideId = 0x12,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = DebugMenu_WeatherDraw,
        .onSelected = DebugMenu_WeatherEffect,
        .onIdle = DebugMenu_WeatherIdle,
    },
    {
        .name = gUnk_081C3E2C,
        .nameMsgId = 0x10C3,
        .overrideId = 0x13,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = DebugMenu_FogDraw,
        .onSelected = DebugMenu_FogEffect,
        .onIdle = DebugMenu_FogIdle,
    },
    {
        .name = gUnk_081C3E20,
        .nameMsgId = 0x10C4,
        .overrideId = 0x14,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = DebugMenu_ClearDraw,
        .onSelected = DebugMenu_ClearEffect,
        .onIdle = DebugMenu_ClearIdle,
    },
    {
        .name = gUnk_081C3E10,
        .nameMsgId = 0x10C5,
        .overrideId = 0x15,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = DebugMenu_ErasedEffect,
    },
    {
        .name = gUnk_081C3E00,
        .overrideId = 0x16,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = Debug_GetChapterId,
        .onSelected = sub_0801C164,
        .onIdle = DebugMenuMapIdleCore,
    },
    {
        .name = gUnk_081C3DEC,
        .nameMsgId = 0x10C6,
        .overrideId = 0x17,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = DebugMenu_GNightEffect,
    },
    {
        .name = gUnk_081C3DE8,
        .nameMsgId = 0x10C7,
        .overrideId = 0x18,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = sub_0801B528,
        .onIdle = (void *) sub_0801B470,
    },
    { 0 },
};

SECTION(".rodata.08B95848")
const struct MenuDef gDebugClearMenuDef = {
    .rect = { .x = 1, .y = 6, .w = 0xD },
    .menuItems = gDebugClearMenuItems,
    .onBPress = EndMenuAndClear,
};

SECTION(".rodata.08B9586C")
const struct MenuDef gDebugMenuDef_08B9586C = {
    .rect = { .x = 1, .y = 1, .w = 0xA },
    .menuItems = gUnk_08B94744,
    .onBPress = EndMenuAndClear,
};

SECTION(".rodata.08B95890")
const struct MenuDef gDebugStartupMenuDef = {
    .rect = { .x = 9, .y = 4, .w = 0xC },
    .menuItems = gUnk_08B947B0,
    .onInit = (void *) sub_0801B990,
    .onEnd = (void *) sub_0801BA10,
};

SECTION(".rodata.08B958B4")
const struct MenuDef gDebugMenuDef_08B958B4 = {
    .rect = { .x = 1, .y = 1, .w = 8 },
    .menuItems = gUnk_08B94864,
    .onBPress = EndMenuAndClear,
};

SECTION(".rodata.08B958D8")
const struct MenuDef gDebugMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xF },
    .menuItems = gDebugMenuItems,
    .onInit = (void *) DebugMenuInit,
    .onBPress = EndMenuAndClear,
};

extern const struct MenuItemDef gUnk_08B94600[];

SECTION(".rodata.08B94600")
const struct MenuItemDef gUnk_08B94600[] = {
    {
        .name = gUnk_081C3D0C,
        .nameMsgId = 0x10B4,
        .overrideId = 1,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = (void *) sub_08021610,
    },
    {
        .name = gUnk_081C3CF0,
        .nameMsgId = 0x10B5,
        .overrideId = 2,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = CallEvent_CompleteTraining,
    },
    { 0 },
};

extern const struct MenuDef gUnk_08B95824;

SECTION(".rodata.08B95824")
const struct MenuDef gUnk_08B95824 = {
    .rect = { .x = 8, .y = 9, .w = 0xE },
    .menuItems = gUnk_08B94600,
    .onBPress = MenuCancelSelect,
};
