#include "gbafe.h"
#include "gbafe/bmmenu.h"

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

extern struct SoundRoomEnt CONST_DATA gSoundRoomTable[];
extern char const sDebugBlankStr[];


struct DebugPrintProc {
    PROC_HEADER;

    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ u8 _pad_34[0x52 - 0x34];
    /* 52 */ u16 width;
    /* 54 */ const char * text;
};

extern struct ProcCmd CONST_DATA gProc_DebugPrintWithProc[];
extern const struct MenuDef gDebugMenuDef;

void NewKeyStSetter(int keys);
void EndMenu(struct MenuProc * proc);
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

void nullsub_38(void)
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

ASM_FUNC("asm/nonmatching/code_0801B528.s");

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

ASM_FUNC("asm/nonmatching/code_0801B814.s");

ASM_FUNC("asm/nonmatching/code_0801B8B8.s");

ASM_FUNC("asm/nonmatching/code_0801B8BC.s");

ASM_FUNC("asm/nonmatching/code_0801B8D4.s");

ASM_FUNC("asm/nonmatching/code_0801B900.s");

ASM_FUNC("asm/nonmatching/code_0801B924.s");

ASM_FUNC("asm/nonmatching/code_0801B990.s");

ASM_FUNC("asm/nonmatching/code_0801BA10.s");

ASM_FUNC("asm/nonmatching/code_0801BA54.s");

ASM_FUNC("asm/nonmatching/code_0801BB74.s");

ASM_FUNC("asm/nonmatching/code_0801BBE0.s");

ASM_FUNC("asm/nonmatching/code_0801BBF4.s");

ASM_FUNC("asm/nonmatching/code_0801BC08.s");

ASM_FUNC("asm/nonmatching/code_0801BC18.s");

ASM_FUNC("asm/nonmatching/code_0801BC1C.s");

ASM_FUNC("asm/nonmatching/code_0801BC38.s");

ASM_FUNC("asm/nonmatching/code_0801BC50.s");

ASM_FUNC("asm/nonmatching/code_0801BC80.s");

ASM_FUNC("asm/nonmatching/code_0801BCAC.s");

ASM_FUNC("asm/nonmatching/code_0801BCC4.s");

ASM_FUNC("asm/nonmatching/code_0801BCE4.s");

ASM_FUNC("asm/nonmatching/code_0801BD64.s");

ASM_FUNC("asm/nonmatching/code_0801BDBC.s");

ASM_FUNC("asm/nonmatching/code_0801BDC0.s");

ASM_FUNC("asm/nonmatching/code_0801BDCC.s");

ASM_FUNC("asm/nonmatching/code_0801BDDC.s");

ASM_FUNC("asm/nonmatching/code_0801BE84.s");

ASM_FUNC("asm/nonmatching/code_0801BF38.s");

ASM_FUNC("asm/nonmatching/code_0801BF54.s");

ASM_FUNC("asm/nonmatching/code_0801C070.s");

ASM_FUNC("asm/nonmatching/code_0801C164.s");

ASM_FUNC("asm/nonmatching/code_0801C168.s");
