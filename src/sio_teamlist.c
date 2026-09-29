#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_teamlist.c

#define LINKARENA_TEAMNAME_LEN 19

extern const struct ProcCmd ProcScr_SioTeamList[];

struct LinkArenaTeamEnt
{
    /* 00 */ char name[LINKARENA_TEAMNAME_LEN];
    /* 13 */ u8 unk_0f;
    /* 14 */ u8 unk_10;
    /* 15 */ STRUCT_PAD(0x15, 0x18);
};

extern struct LinkArenaTeamEnt gLinkArenaTeamList[];

struct LATeamListConfig
{
    /* 00 */ u8 kind;
    /* 01 */ STRUCT_PAD(0x01, 0x02);
    /* 02 */ u16 helpTextId; // Text that displays across the bottom
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ STRUCT_PAD(0x06, 0x08);
    /* 08 */ int menuTextId;
    /* 0C */ bool (*isValidFunc)(void);
};
GBA_SIZE_CHECK(struct LATeamListConfig, 0x10);

// Forward declarations

int sub_0803E358(u8, struct SioTeamListProc *);
bool CanBuildNewLinkArenaTeam(void);
bool sub_0803DF1C(void);

enum
{
    MULTIARENA_LIST_NONE = 0,
    MULTIARENA_LIST_BUILDTEAM = 1,
    MULTIARENA_LIST_SELECTTEAM = 2,
    MULTIARENA_LIST_UNITLIST = 3,
    MULTIARENA_LIST_SWAP = 4,
    MULTIARENA_LIST_CONFIRMSWAP = 5,
    MULTIARENA_LIST_DISBAND = 6,
    MULTIARENA_LIST_LINKMENU = 7,
    MULTIARENA_LIST_8 = 8,
};

extern const struct LATeamListConfig gSioTeamListConfig_1[];

extern const struct LATeamListConfig gSioTeamListConfig_2[];

extern const struct LATeamListConfig * const gSioTeamListConfigLut[];

extern char gUnk_Sio_0203DD50[][LINKARENA_TEAMNAME_LEN];
extern struct Text gUnk_Sio_0203DA88[];
extern struct Text Texts_0203DAB0;
extern struct Font Font_0203DB64;
extern const struct ProcCmd ProcScr_UnitListScreen_PrepMenu[];
extern u16 gSioList_085A93E0[];

extern const char gSioStr_NoData[]; // "NO DATA"
extern const char gSioStr_NotSelected[]; // "NOT SELECTED"
extern const char gSioStr_EraseBack[]; // "Erase    Back"
extern const u8 gUnknown_080D9D5E[];
extern const int gUnknown_081D5254[];
extern u8 * const gUnknown_08B98CA8[];
extern const u8 Img_TacticianSelObj[];
extern const u8 gUnknown_085ADF40[];
extern const u16 Pal_TacticianSelObj[];
extern const u8 gUnknown_085AC604[];
extern u16 Pal_SysBrownBox[];
extern const s8 gUnknown_080D9D61[];

void UpdateLinkArenaMenuScrollBar(u8 a, s16 b);
void InitSioBG(void);
ProcPtr sub_08048504(struct SioTeamListProc * parent, int numActiveOptions, u8 * buf);
void StartLinkArenaTitleBanner(ProcPtr parent, int size);
void sub_08047E84(u8 * str, int len, int x, int y, int palId, ProcPtr parent);
void ScrollMultiArenaTeamSprites(int amount);
void PutLinkArenaChoiceBannerSprite(int x, int y);
void StartUnitListScreenUnk(ProcPtr proc);
void sub_08047CA8(void);
void sub_08049220(void);

//! FE8U = 0x08043308
void StartLinkArenaTeamList(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_SioTeamList, parent);
    return;
}

//! FE8U = 0x0804331C
void SioTeamList_Init(struct SioTeamListProc * proc)
{
    proc->yBg1 = 216;
    proc->unk_48 = 0;
    proc->unk_40 = 0;
    proc->optionIdx = 0;
    proc->selectedOption = MULTIARENA_LIST_NONE;
    proc->unk_54 = 0xff;
    proc->selectedTeam = 0xff;
    proc->unk_4c = 0;
    return;
}

//! FE8U = 0x0804335C
bool CanBuildNewLinkArenaTeam(void)
{
    int i;

    if (gLinkArenaSt.unk_0A == 0)
    {
        return false;
    }

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        if ((gLinkArenaTeamList[i].unk_0f & 0x80) != 0)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x08043394
bool sub_0803DF1C(void)
{
    int i;

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        if ((gLinkArenaTeamList[i].unk_0f & 0x80) == 0)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x080433C0
int sub_0803DF48(int activeOption, u8 mode)
{
    int i;
    int count = 0;
    char buf[20];

    const struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    InitUnits();

    switch (mode)
    {
        case 0:
            for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[i].name) == 1)
                {
                    gLinkArenaTeamList[i].unk_10 = ptr[activeOption].unk_04;
                    gLinkArenaTeamList[i].unk_0f = i;
                }
                else
                {
                    SioStrCpy(gSioStr_NoData, gLinkArenaTeamList[i].name); // "NO DATA"
                    gLinkArenaTeamList[i].unk_10 = ptr[activeOption].unk_05;
                    gLinkArenaTeamList[i].unk_0f = i | 0x80;
                }

                ReadMultiArenaSaveTeam(i, GetUnit(i * 5 + 1), buf);
            }

            count = i;

            break;

        case 1:
        case 2:
            for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[count].name) == 1)
                {
                    gLinkArenaTeamList[count].unk_10 = ptr[activeOption].unk_04;
                    gLinkArenaTeamList[count].unk_0f = i;
                    ReadMultiArenaSaveTeam(i, GetUnit(count * 5 + 1), buf);

                    count++;
                }
            }

            break;
    }

    return count;
}

//! FE8U = 0x080434B4
void DrawLinkArenaTeamName(int idx)
{
    ClearText(&gLinkArenaSt.texts[idx]);
    Text_SetColor(&gLinkArenaSt.texts[idx], TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&gLinkArenaSt.texts[idx], gLinkArenaTeamList[idx].name);

    gLinkArenaSt.texts[idx].chr_position =
        (gLinkArenaSt.texts[idx].chr_position & 0xFFF) | ((gLinkArenaTeamList[idx].unk_10 & 0xf) << 0xc);

    PutText(&gLinkArenaSt.texts[idx], gBg1Tm + TM_OFFSET(11, idx * 2));

    return;
}

//! FE8U = 0x0804352C
void sub_0803E0B8(struct SioTeamListProc * proc)
{
    int i;

    for (i = 0; i < proc->unk_38; i++)
    {
        DrawLinkArenaTeamName(i);
    }

    return;
}

//! FE8U = 0x08043548
void sub_0803E0D4(struct SioTeamListProc * proc, u8 mode)
{
    int i;

    const struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    for (i = 0; i < proc->unk_38; i++)
    {
        if ((gLinkArenaTeamList[i].unk_0f & 0x80) == 0)
        {
            gLinkArenaTeamList[i].unk_10 = ptr[proc->optionIdx].unk_04;
        }
        else
        {
            gLinkArenaTeamList[i].unk_10 = ptr[proc->optionIdx].unk_05;
        }

        gLinkArenaSt.texts[i].chr_position =
            (gLinkArenaSt.texts[i].chr_position & 0xFFF) | ((gLinkArenaTeamList[i].unk_10 & 0xf) << 0xc);
        PutText(&gLinkArenaSt.texts[i], gBg1Tm + TM_OFFSET(11, i * 2));
    }

    EnableBgSync(BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x080435F0
void SioTeamList_EraseTeam(struct SioTeamListProc * proc)
{
    int team = proc->unk_40;

    const struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    struct Unit * unit = GetUnit(team * 5 + 1);

    WipeMultiArenaSaveTeam(gLinkArenaTeamList[team].unk_0f & 0x7f);
    ReadMultiArenaSaveTeam(team, unit, gLinkArenaTeamList[team].name);

    SioStrCpy(gSioStr_NoData, gLinkArenaTeamList[team].name); // "NO DATA"

    gLinkArenaTeamList[team].unk_10 = ptr[proc->optionIdx].unk_05;
    gLinkArenaTeamList[team].unk_0f = team | 0x80;
    DrawLinkArenaTeamName(team);

    if (!sub_0803DF1C())
    {
        sub_0803E358(gLinkArenaSt.unk_00, proc);
        Proc_Goto(proc, 2);
    }
    else if (proc->validOptions[0] == 0)
    {
        sub_0803E358(gLinkArenaSt.unk_00, proc);
    }

    UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

    EnableBgSync(BG1_SYNC_BIT);

    return;
}

void SioTeamList_SwapTeams(struct SioTeamListProc * proc)
{
    int tmp;
    struct Unit * unit;

    int teamB = proc->unk_40;
    int teamA = proc->selectedTeam;

    SwapMultiArenaSaveTeams(gLinkArenaTeamList[teamA].unk_0f & 0x7f, gLinkArenaTeamList[teamB].unk_0f & 0x7f);

    tmp = gLinkArenaTeamList[teamA].unk_10;
    gLinkArenaTeamList[teamA].unk_10 = gLinkArenaTeamList[teamB].unk_10;
    gLinkArenaTeamList[teamB].unk_10 = tmp;

    unit = GetUnit(teamA * 5 + 1);

    if (ReadMultiArenaSaveTeam(teamA, unit, gLinkArenaTeamList[teamA].name) == 0)
    {
        SioStrCpy(gSioStr_NoData, gLinkArenaTeamList[teamA].name);
        gLinkArenaTeamList[teamA].unk_0f = teamA | 0x80;
    }
    else
    {
        gLinkArenaTeamList[teamA].unk_0f = teamA;
    }

    unit = GetUnit(teamB * 5 + 1);

    if (ReadMultiArenaSaveTeam(teamB, unit, gLinkArenaTeamList[teamB].name) == 0)
    {
        SioStrCpy(gSioStr_NoData, gLinkArenaTeamList[teamB].name);
        gLinkArenaTeamList[teamB].unk_0f = teamB | 0x80;
    }
    else
    {
        gLinkArenaTeamList[teamB].unk_0f = teamB;
    }

    DrawLinkArenaTeamName(teamB);
    DrawLinkArenaTeamName(teamA);

    UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

    Proc_End(proc->pSioHoldProc);

    proc->selectedOption = MULTIARENA_LIST_SWAP;

    EnableBgSync(BG1_SYNC_BIT);
}

//! FE8U = 0x080437C0
int sub_0803E358(u8 mode, struct SioTeamListProc * proc)
{
    int color;

    int i = 0;
    const struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    if (mode == 1)
    {
        for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
        {
            SioStrCpy(gSioStr_NotSelected, gUnk_Sio_0203DD50[i]);
            ClearText(&gLinkArenaSt.unk_64[i]);
            PutDrawTextCentered(&gLinkArenaSt.unk_64[i], 1, i * 3 + 5, gUnk_Sio_0203DD50[i], 10);
        }

        return gLinkArenaSt.unk_05 + 2;
    }

    while (1)
    {
        if (ptr[i].menuTextId == 0)
        {
            return i;
        }

        proc->validOptions[i] = 1;
        color = TEXT_COLOR_SYSTEM_WHITE;

        if (ptr[i].isValidFunc != NULL && !ptr[i].isValidFunc())
        {
            proc->validOptions[i] = 0;
            color = TEXT_COLOR_SYSTEM_GRAY;
        }

        ClearText(&gUnk_Sio_0203DA88[i]);
        Text_SetColor(&gUnk_Sio_0203DA88[i], color);
        PutDrawTextCentered(&gUnk_Sio_0203DA88[i], 0, i * 2 + 5, DecodeMsg(ptr[i].menuTextId), 8);

        i++;
    }
}

//! FE8U = 0x080438C0
u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc)
{
    const struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    if (gLinkArenaSt.unk_00 != 1)
    {
        return ptr[proc->optionIdx].helpTextId;
    }

    if (proc->optionIdx == 0)
    {
        return 0x3C0;
    }
    else
    {
        return 0x3C1;
    }
}

//! FE8U = 0x08043904
void SioTeamList_SetupGfx(struct SioTeamListProc * proc)
{
    int i;
    u8 buf[8];

    u16 * textPalette = Pal_Text;

    ClearSioBG();
    InitSioBG();

    Decompress(Img_TacticianSelObj, (void *)(VRAM + 0x14800));
    sub_08047BD4(0, 2);
    TmApplyTsa_thm(gBg2Tm + TM_OFFSET(9, 4), gUnknown_085ADF40, TILEREF(0x0, 1));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    Decompress(gUnknown_085AC604, (void *)(VRAM + 0x16000));
    ApplyPalettes(Pal_SysBrownBox, 0x11, 2);

    gPal[0x20] = 0;

    for (i = 0; i < 3; i++)
    {
        gPal[0x21 + i] = textPalette[4 + i];
    }

    EnablePalSync();

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    sub_0803DCF0();

    ApplyUnitSpritePalettes();
    ResetUnitSprites();
    ForceSyncUnitSpriteSheet();

    proc->unk_38 = sub_0803DF48(proc->optionIdx, gLinkArenaSt.unk_00);

    for (i = 0; i < 5; i++)
    {
        buf[i] = 0;
    }

    buf[proc->optionIdx] = 1;

    proc->numActiveOptions = sub_0803E358(gLinkArenaSt.unk_00, proc);

    sub_0803E0B8(proc);

    proc->unk_2c = sub_08048504(proc, proc->numActiveOptions, buf);

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.unk_06[i] = 0xff;
    }

    proc->unk_5c = 0;

    SetBgOffset(BG_1, 0, proc->yBg1);

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 40, DISPLAY_WIDTH, 136);
    SetWin1Box(0, 136, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 0, 1, 1, 0);
    SetWOutLayers(1, 0, 1, 1, 1);

    StartLinkArenaTitleBanner(proc->unk_2c, gUnknown_080D9D5E[gLinkArenaSt.unk_00]);
    sub_08047E84(gUnknown_08B98CA8[gLinkArenaSt.unk_00], gUnknown_081D5254[gLinkArenaSt.unk_00], 0, 8, gLinkArenaSt.unk_00, proc->unk_2c);

    PutSioText(GetLATeamListHelpTextId(proc), 1);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08043B08
void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total)
{
    if ((gpKeySt->repeated & DPAD_UP) != 0)
    {
        if (*selection > min || gpKeySt->repeated == gpKeySt->pressed)
        {
            *selection = *selection - 1;

            if (*selection < 0)
            {
                *selection = total - 1;
            }
        }
    }

    if ((gpKeySt->repeated & DPAD_DOWN) != 0)
    {
        if (*selection < max || gpKeySt->repeated == gpKeySt->pressed)
        {
            *selection = *selection + 1;
            *selection = *selection % total;
        }
    }

    return;
}

//! FE8U = 0x08043B6C
void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc)
{
    int previous = proc->optionIdx;

    const struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    struct SioProc85AAA78 * unk_2C = proc->unk_2c;
    unk_2C->unk_44 = 1;
    unk_2C->unk_48 = -1;

    SioTeamList_Main_HandleDPadInput(&proc->optionIdx, proc->numActiveOptions - 1, 0, proc->numActiveOptions);

    if (previous != proc->optionIdx)
    {
        SioPlaySoundEffect(3);

        unk_2C->unk_3a[previous] = 0;
        unk_2C->unk_3a[proc->optionIdx] = 1;

        sub_0803E0D4(proc, gLinkArenaSt.unk_00);
        PutSioText(GetLATeamListHelpTextId(proc), 1);
    }

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        if (gLinkArenaSt.unk_00 != 1)
        {
            if (proc->validOptions[proc->optionIdx] != 0)
            {
                proc->selectedOption = ptr[proc->optionIdx].kind;

                if (proc->selectedOption == MULTIARENA_LIST_LINKMENU)
                {
                    SioPlaySoundEffect(1);
                    Proc_Goto(proc, 9);
                    gLinkArenaSt.unk_03 = 0xff;
                    return;
                }

                SioPlaySoundEffect(2);

                Proc_Break(proc);
            }
            else
            {
                SioPlaySoundEffect(0);
            }
        }
        else
        {
            SioPlaySoundEffect(2);

            proc->selectedOption = MULTIARENA_LIST_8;
            proc->selectedTeam = proc->optionIdx;
            proc->unk_44 = 0;

            Proc_Goto(proc, 5);

            return;
        }
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Goto(proc, 9);
        gLinkArenaSt.unk_03 = 0xff;
    }

    if (((gpKeySt->pressed & START_BUTTON) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(0x38A);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    return;
}

//! FE8U = 0x08043CF4
void SioTeamList_StartUnitList(struct SioTeamListProc * proc)
{
    u8 buf[20];
    struct Unit * unit;

    Proc_End(proc->unk_2c);
    sub_08047CA8();

    InitUnits();

    unit = GetUnit(1);
    ReadMultiArenaSaveTeam(gLinkArenaTeamList[proc->unk_40].unk_0f, unit, buf);

    StartUnitListScreenUnk(proc);

    return;
}

//! FE8U = 0x08043D3C
void SioTeamList_WaitForUnitListScreen(ProcPtr proc)
{
    if (Proc_Find(ProcScr_UnitListScreen_PrepMenu) == NULL)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08043D5C
int sub_0803E904(void)
{
    int i;

    for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
    {
        if (gLinkArenaSt.unk_06[i] == 0xFF)
        {
            return 0;
        }
    }

    return 1;
}

//! FE8U = 0x08043D8C
void SioTeamList_8043D8C(struct SioTeamListProc * proc)
{
    int unk_40 = proc->unk_40;
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    if ((IsKeyInputSequenceComplete(gSioList_085A93E0)) && ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0))
    {
        Proc_Goto(proc, 8);
        return;
    }

    unk_2C->unk_44 = 0;
    unk_2C->unk_48 = (proc->unk_40 - proc->unk_48) * 16 + 40;

    if (proc->unk_4c > 0)
    {
        proc->yBg1 -= 4;
        proc->unk_4c--;

        SetBgOffset(BG_1, 0, proc->yBg1);

        if (proc->pSioHoldProc != NULL)
        {
            sub_0803DBC8(proc->pSioHoldProc, +4);
        }

        ScrollMultiArenaTeamSprites(+4);

        PutUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
        UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

        return;
    }
    else if (proc->unk_4c < 0)
    {
        proc->yBg1 += 4;
        proc->unk_4c++;

        SetBgOffset(BG_1, 0, proc->yBg1);

        if (proc->pSioHoldProc != NULL)
        {
            sub_0803DBC8(proc->pSioHoldProc, -4);
        }

        ScrollMultiArenaTeamSprites(-4);

        PutUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
        UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

        return;
    }

    PutUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        switch (proc->selectedOption)
        {
            case MULTIARENA_LIST_BUILDTEAM:
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) != 0)
                {
                    SioPlaySoundEffect(2);
                    gLinkArenaSt.unk_03 = proc->unk_40;
                    Proc_Break(proc);

                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case MULTIARENA_LIST_SELECTTEAM:
                SioPlaySoundEffect(2);
                gLinkArenaSt.unk_03 = gLinkArenaTeamList[unk_40].unk_0f;
                Proc_Break(proc);

                return;

            case MULTIARENA_LIST_UNITLIST:
                // Unit List
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    Proc_Goto(proc, 4);
                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case MULTIARENA_LIST_SWAP:
                if (proc->unk_38 > 1)
                {
                    SioPlaySoundEffect(2);

                    proc->selectedTeam = unk_40;
                    proc->pSioHoldProc =
                        StartSioHold(proc, 80, (proc->selectedTeam - proc->unk_48) * 16 + 40, 0x88, 0x27);

                    if (unk_40 + 1 < proc->unk_38)
                    {
                        gpKeySt->repeated |= DPAD_DOWN;
                    }
                    else
                    {
                        gpKeySt->repeated |= DPAD_UP;
                    }

                    proc->selectedOption = MULTIARENA_LIST_CONFIRMSWAP;
                }

                break;

            case MULTIARENA_LIST_LINKMENU:
                break;

            case MULTIARENA_LIST_CONFIRMSWAP:
                SioPlaySoundEffect(2);
                SioTeamList_SwapTeams(proc);

                break;

            case MULTIARENA_LIST_DISBAND:
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    proc->pSioHoldProc = StartSioHold(proc, 80, (unk_40 - proc->unk_48) * 16 + 40, 0x88, 0x27);
                    Proc_Goto(proc, 7);
                }
                else
                {
                    SioPlaySoundEffect(0);
                }

                break;

            case MULTIARENA_LIST_8:
                // Team selected (Practice or Battle)
                SioPlaySoundEffect(2);

                SioStrCpy(gLinkArenaTeamList[unk_40].name, gUnk_Sio_0203DD50[proc->selectedTeam]);

                gLinkArenaSt.unk_06[proc->selectedTeam] = gLinkArenaTeamList[unk_40].unk_0f;

                ClearText(&gLinkArenaSt.unk_64[proc->selectedTeam]);
                PutDrawTextCentered(
                    &gLinkArenaSt.unk_64[proc->selectedTeam], 1, proc->selectedTeam * 3 + 5,
                    gUnk_Sio_0203DD50[proc->selectedTeam], 10);

                proc->unk_5c = sub_0803E904();

                if ((proc->unk_5c != 0) && (unk_2C->unk_40 == 0))
                {
                    unk_2C->unk_40 = 8;
                }

                proc->unk_44 = 0;

                Proc_Goto(proc, 6);

                break;
        }
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        if (proc->selectedOption == MULTIARENA_LIST_CONFIRMSWAP)
        {
            proc->selectedOption = MULTIARENA_LIST_SWAP;
            Proc_End(proc->pSioHoldProc);
            return;
        }

        if (proc->selectedOption != MULTIARENA_LIST_8)
        {
            Proc_Goto(proc, 2);
        }
        else
        {
            proc->unk_44 = 0;
            Proc_Goto(proc, 6);
        }
    }

    if (((gpKeySt->pressed & START_BUTTON) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(0x38A);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    if ((gpKeySt->repeated & DPAD_UP) != 0)
    {
        if ((proc->unk_48 != 0) && ((proc->unk_40 - proc->unk_48) < 2))
        {
            proc->yBg1 -= 4;

            if (proc->pSioHoldProc != NULL)
            {
                sub_0803DBC8(proc->pSioHoldProc, +4);
            }

            ScrollMultiArenaTeamSprites(+4);

            proc->unk_48--;
            proc->unk_4c = +3;
            proc->unk_40--;

            SetBgOffset(BG_1, 0, proc->yBg1);

            UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);
        }
        else
        {
            if (proc->unk_40 > 0)
            {
                proc->unk_40--;
            }
        }
    }

    if ((gpKeySt->repeated & DPAD_DOWN) != 0)
    {
        if (((proc->unk_38 > 6) && ((proc->unk_48 + 6) < proc->unk_38)) && ((proc->unk_40 - proc->unk_48) > 3))
        {
            proc->yBg1 += 4;

            if (proc->pSioHoldProc != 0)
            {
                sub_0803DBC8(proc->pSioHoldProc, -4);
            }

            ScrollMultiArenaTeamSprites(-4);

            proc->unk_48++;
            proc->unk_4c = -3;
            proc->unk_40++;

            SetBgOffset(BG_1, 0, proc->yBg1);

            UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);
        }
        else
        {
            if (proc->unk_40 < proc->unk_38 - 1)
            {
                proc->unk_40++;
            }
        }
    }

    if (unk_40 != proc->unk_40)
    {
        SioPlaySoundEffect(3);
    }

    return;
}

//! FE8U = 0x08044280
void sub_0803EE34(struct SioProc85AAA78 * proc, s8 b)
{
    int i;

    for (i = 0; i < 5; i++)
    {
        proc->unk_30[i] = -b - 8;
    }

    return;
}

//! FE8U = 0x0804429C
void SioTeamList_804429C(struct SioTeamListProc * proc)
{
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    s8 xPos = gUnknown_080D9D61[proc->unk_44];

    if (xPos == -1)
    {
        Proc_Goto(proc, 3);
    }

    proc->unk_44++;

    if (xPos == -2)
    {
        gDispIo.bg1_ct.priority = 0;
        gDispIo.bg2_ct.priority = 1;
        gDispIo.bg0_ct.priority = 2;
        gDispIo.bg3_ct.priority = 3;

        unk_2C->unk_44 = 0;
    }
    else
    {
        SetBgOffset(BG_0, xPos, 0);
        sub_0803EE34(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x08044324
void SioTeamList_8044324(struct SioTeamListProc * proc)
{
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    s8 xPos = gUnknown_080D9D61[proc->unk_44];

    if (xPos == -1)
    {
        Proc_Goto(proc, 2);
    }

    proc->unk_44++;

    if (xPos == -2)
    {
        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg2_ct.priority = 2;
        gDispIo.bg3_ct.priority = 3;

        unk_2C->unk_44 = 1;
        unk_2C->unk_48 = -1;
    }
    else
    {
        SetBgOffset(BG_0, xPos, 0);
        sub_0803EE34(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x080443B0
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc)
{
    int var;

    proc->unk_55 = 1;

    sub_08049220();

    var = proc->unk_40 - proc->unk_48;

    if (var > 2)
    {
        proc->unk_58 = var * 2 - 2;
    }
    else
    {
        proc->unk_58 = var * 2 + 5;
    }

    ClearText(&Texts_0203DAB0);
    Text_DrawString(&Texts_0203DAB0, gSioStr_EraseBack);
    PutText(&Texts_0203DAB0, gBg0Tm + TM_OFFSET(15, (proc->unk_58 + 4)));

    EnableBgSync(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08044430
void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc)
{
    PutLinkArenaChoiceBannerSprite(96, proc->unk_58 * 8 + 24);

    if (((gpKeySt->pressed & DPAD_LEFT) != 0) && (proc->unk_55 == 1))
    {
        proc->unk_55 = 0;
        SioPlaySoundEffect(3);
    }

    if (((gpKeySt->pressed & DPAD_RIGHT) != 0) && (proc->unk_55 == 0))
    {
        proc->unk_55 = 1;
        SioPlaySoundEffect(3);
    }

    PutUiHand(proc->unk_55 * 40 + 112, proc->unk_58 * 8 + 32);

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        Proc_End(proc->pSioHoldProc);

        TmFillRect_thm(gBg0Tm + TM_OFFSET(15, proc->unk_58 + 4), 12, 2, 0);
        EnableBgSync(BG0_SYNC_BIT);

        Proc_Break(proc);
    }
    else if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        Proc_End(proc->pSioHoldProc);

        if (proc->unk_55 == 0)
        {
            SioTeamList_EraseTeam(proc);
            SioPlaySoundEffect(2);
        }
        else
        {
            SioPlaySoundEffect(1);
        }

        TmFillRect_thm(gBg0Tm + TM_OFFSET(15, proc->unk_58 + 4), 12, 2, 0);
        EnableBgSync(BG0_SYNC_BIT);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08044530
void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc)
{
    // Probably dummied-out logic for the FE6 Link Arena password

    char buf[20];

    ReadMultiArenaSaveTeam(proc->unk_40, GetUnit(1), buf);

    return;
}

extern const struct ProcCmd ProcScr_SioTeamList[];


void FE6Link_Init();
void Set_0203DDDC();

SECTION(".rodata.08B98CB4")
const struct ProcCmd ProcScr_SioTeamList[] = {
    PROC_SLEEP(0),
    PROC_LABEL(0),
    PROC_CALL(SioTeamList_Init),
    PROC_LABEL(1),
    PROC_CALL(SioTeamList_SetupGfx),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(FE6Link_Init),
    PROC_LABEL(2),
    PROC_REPEAT(SioTeamList_Loop_MainKeyHandler),
    PROC_LABEL(3),
    PROC_REPEAT(SioTeamList_8043D8C),
    PROC_GOTO(9),
    PROC_LABEL(4),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(SioTeamList_StartUnitList),
    PROC_REPEAT(SioTeamList_WaitForUnitListScreen),
    PROC_CALL(SioTeamList_SetupGfx),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(FE6Link_Init),
    PROC_GOTO(2),
    PROC_LABEL(5),
    PROC_REPEAT(SioTeamList_804429C),
    PROC_LABEL(6),
    PROC_REPEAT(SioTeamList_8044324),
    PROC_LABEL(7),
    PROC_CALL(SioTeamList_StartEraseTeamSubMenu),
    PROC_REPEAT(SioTeamList_EraseTeam_KeyHandler),
    PROC_GOTO(3),
    PROC_LABEL(8),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_CALL(SioTeamList_LoadTeam_Dummy),
    PROC_SLEEP(0),
    PROC_GOTO(1),
    PROC_LABEL(9),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(0),
    PROC_END,
};

SECTION(".rodata.08B98BFC")
const struct LATeamListConfig gSioTeamListConfig_1[] = {
    {
        .kind = 1,
        .helpTextId = 0x3BA,
        .unk_04 = 1,
        .menuTextId = 0x774,
        .isValidFunc = CanBuildNewLinkArenaTeam,
    },
    {
        .kind = 3,
        .helpTextId = 0x3BB,
        .unk_05 = 1,
        .menuTextId = 0x776,
        .isValidFunc = sub_0803DF1C,
    },
    { .kind = 4, .helpTextId = 0x3BC, .menuTextId = 0x777 },
    {
        .kind = 6,
        .helpTextId = 0x3BD,
        .unk_05 = 1,
        .menuTextId = 0x778,
        .isValidFunc = sub_0803DF1C,
    },
    { .kind = 7, .helpTextId = 0x3BE, .menuTextId = 0x779 },
    { 0 },
};

SECTION(".rodata.08B98C5C")
const struct LATeamListConfig gSioTeamListConfig_2[] = {
    { .kind = 2, .helpTextId = 0x3BF, .unk_05 = 1, .menuTextId = 0x775 },
    { .kind = 3, .helpTextId = 0x3BB, .unk_05 = 1, .menuTextId = 0x776 },
    { .kind = 7, .helpTextId = 0x3BE, .unk_05 = 1, .menuTextId = 0x779 },
    { .unk_05 = 1 },
};

SECTION(".rodata.08B98C9C")
const struct LATeamListConfig * const gSioTeamListConfigLut[] = {
    gSioTeamListConfig_1,
    gSioTeamListConfig_2,
    gSioTeamListConfig_2,
};
