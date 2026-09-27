#include "gbafe.h"

struct ChapterStatusProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 restoreStateOnExit;
    /* 2A */ u8 focusUnitOnExit;
    /* 2B */ u8 timesCompleted;
    /* 2C */ u8 numObjectiveTextLines;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unitIndex;
    /* 2F */ u8 numAllyUnits;
    /* 30 */ u8 numEnemyUnits;

    /* 34 */ struct Unit * units[2];

    /* 3C */ u16 unk_3c;
    /* 3E */ u8 helpTextActive;
    /* 3F */ u8 unk_3f;

    /* 40 */ STRUCT_PAD(0x40, 0x64);

    /* 64 */ u16 unk_64;
};

struct StatusScreenSt {
    /* 00 */ struct Text th;
    /* 08 */ struct Font font;
};

extern struct Text gChapterStatusText[2];
extern struct StatusScreenSt gStatusScreenSt;

extern struct HelpBoxInfo const HelpInfo_ChapterStatus_AllyUnits;
extern u16 const Pal_ChapterStatusUi[];
extern u8 const Img_ChapterStatusUi[];
extern u8 const Tsa_ChapterStatusUi[];
extern u16 const Pal_ChapterStatusMural[];
extern u16 const Pal_StatusScreenLabelSprites[];
extern u16 const Pal_ChapterStatusSelectorSprite[];
extern u8 const Img_StatusScreenLabelSprites[];
extern struct TextInitInfo const gTextInitInfo_ChapterStatus[];
extern struct ProcCmd const gProcScr_ChapterStatusScreen[];
extern struct ProcCmd const ProcScr_ChapterStatusScreen_FromPrep[];
extern struct ProcCmd const ProcScr_StatusScreenSpriteDraw[];
extern struct ProcCmd const gProcScr_ADJUSTSFROMXI[];
extern u16 const Sprite_ChapterStatus_08CC2DF8[];
extern u16 const Sprite_ChapterStatus_PlayCountLabel[];
extern u16 const Sprite_ChapterStatus_08CC2E0E[];
extern u16 const Sprite_ChapterStatus_08CC2E1C[];
extern u16 const Sprite_ChapterStatus_08CC2E2A[];
extern u16 const Sprite_ChapterStatus_08CC2E32[];
extern u16 const Sprite_ChapterStatus_08CC2E46[];
extern u16 const Sprite_ChapterStatus_08CC2E4E[];
extern u16 const Sprite_ChapterStatus_08CC2E56[];
extern u16 const Sprite_ChapterStatus_08CC2E5E[];
extern u16 const Sprite_ChapterStatus_FactionSelector[];
extern u16 const Sprite_ChapterStatus_ChapterName[];

u32 GetGold(void);
void PutUnitSprite(int layer, int x, int y, struct Unit * unit);
void SyncUnitSpriteSheet(void);

void StartChapterStatusHelpBox(ProcPtr proc);
struct Unit * GetStatusSceenLeaderUnit(void);
struct Unit * GetEnemyBossUnit(void);
int CountEnemyBossUnits(void);
int CountUnitsByFaction(int faction);
void UpdateStatusFactionSelectorGlow(void);
char const * SplitObjectiveTextOnNewline(char const * str);
void UpdateUnitSpritePal(bool isHidden);
void DrawChapterStatusTextForUnit(struct Unit * unit);
void ChapterStatus_SetupFont(ProcPtr proc);
void DrawChapterStatusStatValues(void);

void StartChapterStatusHelpBox(ProcPtr proc)
{
    LoadHelpBoxGfx((void *) 0x06014800, 9);
    StartMovingHelpBox(&HelpInfo_ChapterStatus_AllyUnits, proc);
}

struct Unit * GetStatusSceenLeaderUnit(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_BLUE + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        return unit;
    }

    return NULL;
}

struct Unit * GetEnemyBossUnit(void)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS))
            continue;

        return unit;
    }

    return NULL;
}

int CountEnemyBossUnits(void)
{
    int count;
    int i;

    count = 0;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS))
            continue;

        count++;
    }

    return count;
}

int CountUnitsByFaction(int faction)
{
    int count;
    int i;

    count = 0;

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        count++;
    }

    return count;
}

void UpdateStatusFactionSelectorGlow(void)
{
    u16 * palPtr;
    u16 base;
    int mod;
    u16 color;

    mod = (GetGameTime() >> 1) & 0x1F;

    base = Pal_ChapterStatusSelectorSprite[0x2F];
    palPtr = &PAL_OBJ_COLOR(7, 11);

    if (mod > 16)
        mod = 16 - (mod & 15);

    color = ((((base & RED_MASK) * (16 - mod)) >> 4) & RED_MASK) +
        ((((base & GREEN_MASK) * (16 - mod)) >> 4) & GREEN_MASK) +
        ((((base & BLUE_MASK) * (16 - mod)) >> 4) & BLUE_MASK);

    palPtr[0x00] = color;
    palPtr[0x10] = color;

    EnablePalSync();
}

char const * SplitObjectiveTextOnNewline(char const * str)
{
    if (str == NULL)
        return NULL;

    if (*str == 0)
        return NULL;

    while (TRUE)
    {
        char c = *str;
        int width;

        if (c != 0)
        {
            if (c == 1)
                return str + 1;
        }
        else
        {
            return NULL;
        }

        str = GetCharTextLen(str, &width);
    }
}

void UpdateUnitSpritePal(bool isHidden)
{
    if (isHidden)
    {
        CpuFastFill16(0, PAL_OBJ(13), 0x20);
        EnablePalSync();
    }
    else
    {
        ApplyUnitSpritePalettes();
    }
}

void ChapterStatus_Init(struct ChapterStatusProc * proc)
{
    int i;

    InitBgs(NULL);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 2;

    ResetText();

    proc->unk_3c = 0;
    proc->helpTextActive = FALSE;
    proc->focusUnitOnExit = FALSE;

    SetBgOffset(0, -2, -4);
    SetBgOffset(1, 0, -2);
    SetBgOffset(2, 0, -20);
    SetBgOffset(3, 0, 0);

    ClearUi();

    ApplyPalettes(Pal_ChapterStatusUi, 1, 3);
    Decompress(Img_ChapterStatusUi, (void *) 0x06005800);
    sub_080AACD8(gBg2Tm, Tsa_ChapterStatusUi, TILEREF(0x2C0, 1));

    SetBlendNone();

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->unk_2d = 0;
    proc->unitIndex = 0;

    proc->units[0] = GetStatusSceenLeaderUnit();

    proc->numAllyUnits = CountUnitsByFaction(FACTION_BLUE);

    proc->timesCompleted = GetGlobalCompletionCount();

    if (proc->units[0]->state & US_UNSELECTABLE)
    {
        proc->units[0]->state &= ~US_UNSELECTABLE;
        proc->restoreStateOnExit = TRUE;
    }
    else
    {
        proc->restoreStateOnExit = FALSE;
    }

    if (CountEnemyBossUnits() != 0)
        proc->units[1] = GetEnemyBossUnit();
    else
        proc->units[1] = NULL;

    proc->numEnemyUnits = CountUnitsByFaction(FACTION_RED);

    ApplyUnitSpritePalettes();

    for (i = 0; i < 2; i++)
    {
        if (proc->units[i] == NULL)
            continue;

        UseUnitSprite(GetUnitSMSId(proc->units[i]));
    }

    ForceSyncUnitSpriteSheet();

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 40, 240, 72);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    StartMuralBackgroundAlt(proc, NULL, 14);

    ApplyPalettes(Pal_ChapterStatusMural, 14, 2);

    StartHelpPromptSprite(192, 14, proc);

    Proc_Start(ProcScr_StatusScreenSpriteDraw, proc);

    NewSysBlackBoxHandler(proc);

    SetDispEnable(0, 0, 0, 0, 0);
}

void DrawChapterStatusTextForUnit(struct Unit * unit)
{
    struct StatusScreenSt * ptr = &gStatusScreenSt;

    TmFillRect_thm(gBg0Tm + TM_OFFSET(25, 10), 3, 4, 0);

    SetTextFont(&ptr->font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&ptr->th, 0);

    if (unit != NULL)
    {
        if (unit->state & (US_UNDER_A_ROOF | US_CONCEALED))
        {
            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

            Text_SetCursor(&ptr->th, 128);
            Text_DrawString(&ptr->th, DecodeMsg(0x127C));

            Text_SetCursor(&ptr->th, 160);
            Text_DrawString(&ptr->th, DecodeMsg(0x127C));

            Text_SetCursor(&ptr->th, 184);
            Text_DrawString(&ptr->th, DecodeMsg(0x127C));

            UpdateUnitSpritePal(TRUE);
        }
        else
        {
            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_WHITE);
            Text_DrawString(&ptr->th, DecodeMsg(unit->pCharacterData->nameTextId));

            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

            Text_SetCursor(&ptr->th, 136);
            Text_DrawNumberOrBlank(&ptr->th, unit->level);

            if (GetUnitCurrentHp(unit) >= 100)
            {
                Text_SetCursor(&ptr->th, 160);
                Text_DrawString(&ptr->th, DecodeMsg(0x127C));
            }
            else
            {
                Text_SetCursor(&ptr->th, 168);
                Text_DrawNumberOrBlank(&ptr->th, GetUnitCurrentHp(unit));
            }

            if (GetUnitMaxHp(unit) >= 100)
            {
                Text_SetCursor(&ptr->th, 184);
                Text_DrawString(&ptr->th, DecodeMsg(0x127C));
            }
            else
            {
                Text_SetCursor(&ptr->th, 192);
                Text_DrawNumberOrBlank(&ptr->th, GetUnitMaxHp(unit));
            }

            PutFaceChibi(GetUnitMiniPortraitId(unit), gBg0Tm + TM_OFFSET(25, 10), 0x280, 4, 0);

            UpdateUnitSpritePal(FALSE);
        }
    }
    else
    {
        Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

        Text_SetCursor(&ptr->th, 128);
        Text_DrawString(&ptr->th, DecodeMsg(0x127C));

        Text_SetCursor(&ptr->th, 160);
        Text_DrawString(&ptr->th, DecodeMsg(0x127C));

        Text_SetCursor(&ptr->th, 184);
        Text_DrawString(&ptr->th, DecodeMsg(0x127C));
    }

    Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_WHITE);

    Text_SetCursor(&ptr->th, 177);
    Text_DrawString(&ptr->th, DecodeMsg(0x12B0));

    SetTextFont(NULL);

    EnableBgSync(BG0_SYNC_BIT);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendAlpha(7, 7);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
}

void ChapterStatus_ShowAllLayers(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void ChapterStatus_SetupFont(ProcPtr proc)
{
    ApplyPalette(Pal_Text, 0x1A);

    InitSpriteTextFont(&gStatusScreenSt.font, (void *) 0x06017800, 0x1A);

    SetTextFont(&gStatusScreenSt.font);
    SetTextFontGlyphs(0);

    InitSpriteText(&gStatusScreenSt.th);

    SetTextFont(NULL);
}

void DrawChapterStatusStatValues(void)
{
    TmFillRect_thm(gBg0Tm + TM_OFFSET(0, 13), 15, 7, 0);

    PutNumber(gBg0Tm + TM_OFFSET(12, 13), TEXT_COLOR_SYSTEM_BLUE, gPlaySt.chapterTurnNumber);
    PutNumber(gBg0Tm + TM_OFFSET(11, 15), TEXT_COLOR_SYSTEM_BLUE, GetGold());

    EnableBgSync(BG0_SYNC_BIT);
}

void ChapterStatus_DrawText(struct ChapterStatusProc * proc)
{
    char const * str;

    InitTextList(gTextInitInfo_ChapterStatus);

    ChapterStatus_SetupFont(proc);

    DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);

    PutNumber(gBg1Tm + TM_OFFSET(20, 6), TEXT_COLOR_SYSTEM_BLUE, proc->numAllyUnits);

    if (gPlaySt.chapterVisionRange != 0)
    {
        PutSpecialChar(gBg1Tm + TM_OFFSET(25, 6), TEXT_COLOR_SYSTEM_BLUE, 0x14);
        PutSpecialChar(gBg1Tm + TM_OFFSET(26, 6), TEXT_COLOR_SYSTEM_BLUE, 0x14);
    }
    else
    {
        PutNumber(gBg1Tm + TM_OFFSET(26, 6), TEXT_COLOR_SYSTEM_BLUE, proc->numEnemyUnits);
    }

    proc->numObjectiveTextLines = 1;

    str = DecodeMsg(GetChapterInfo(gPlaySt.chapterIndex)->statusObjectiveTextId);

    Text_InsertDrawString(gChapterStatusText, GetStringTextCenteredPos(112, str) - 2, TEXT_COLOR_SYSTEM_WHITE, str);

    str = SplitObjectiveTextOnNewline(str);

    if (str != NULL)
    {
        Text_InsertDrawString(gChapterStatusText + 1, GetStringTextCenteredPos(110, str), TEXT_COLOR_SYSTEM_WHITE, str);
        proc->numObjectiveTextLines = 2;
    }

    if (proc->numObjectiveTextLines == 2)
    {
        PutText(gChapterStatusText + 0, gBg0Tm + TM_OFFSET(1, 8));
        PutText(gChapterStatusText + 1, gBg0Tm + TM_OFFSET(1, 10));
    }
    else
    {
        PutText(gChapterStatusText + 0, gBg0Tm + TM_OFFSET(1, 9));
    }

    if (proc->timesCompleted != 0)
        PutNumberOrBlank(gBg0Tm + TM_OFFSET(25, 0), TEXT_COLOR_SYSTEM_BLUE, proc->timesCompleted + 1);

    DrawChapterStatusStatValues();

    EnableBgSync(BG0_SYNC_BIT);
}

void ChapterStatus_LoopKeyHandler(struct ChapterStatusProc * proc)
{
    int previous = proc->unitIndex;

    proc->helpTextActive = FALSE;

    if (gpKeySt->pressed & R_BUTTON)
    {
        proc->helpTextActive = TRUE;
        StartChapterStatusHelpBox(proc);

        return;
    }
    else if (gpKeySt->pressed & A_BUTTON)
    {
        if ((proc->units[proc->unitIndex] != NULL) && !(proc->units[proc->unitIndex]->state & (US_UNDER_A_ROOF | US_CONCEALED)))
        {
            SetStatScreenLastUnitId(proc->units[proc->unitIndex]->index);
            proc->focusUnitOnExit = TRUE;
        }

        PlaySoundEffect(0x38A);
        Proc_Goto(proc, 1);

        return;
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x38B);

        return;
    }

    if ((gpKeySt->repeated & DPAD_LEFT) && (proc->unitIndex != 0))
        proc->unitIndex--;

    if ((gpKeySt->repeated & DPAD_RIGHT) && (proc->unitIndex == 0))
        proc->unitIndex++;

    if (proc->unitIndex != previous)
    {
        PlaySoundEffect(0x386);
        DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);
    }
}

void ChapterStatus_OnEnd(struct ChapterStatusProc * proc)
{
    Proc_EndEach(ProcScr_StatusScreenSpriteDraw);
    EndHelpPromptSprite();

    if (proc->restoreStateOnExit)
        proc->units[0]->state |= US_UNSELECTABLE;
}

void ChapterStatus_FocusLeaderUnit(struct ChapterStatusProc * proc)
{
    if (proc->focusUnitOnExit)
        Proc_StartBlocking(gProcScr_ADJUSTSFROMXI, proc);
}

void NewChapterStatusScreen(ProcPtr parent)
{
    struct ChapterStatusProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(gProcScr_ChapterStatusScreen, parent);
        proc->unk_3f = 0;
    }
    else
    {
        proc = Proc_Start(gProcScr_ChapterStatusScreen, PROC_TREE_3);
        proc->unk_3f = 0;
    }
}

void StartChapterStatusScreen_FromPrep(ProcPtr parent)
{
    struct ChapterStatusProc * proc = Proc_StartBlocking(ProcScr_ChapterStatusScreen_FromPrep, parent);
    proc->unk_3f = 1;
}

void StatusScreenSpriteDraw_Init(struct ChapterStatusProc * proc)
{
    struct ChapterStatusProc * parent = proc->proc_parent;

    ApplySystemObjectsGraphics();

    ApplyPalettes(Pal_StatusScreenLabelSprites, 0x14, 3);
    ApplyPalettes(Pal_ChapterStatusSelectorSprite, 0x17, 2);

    Decompress(Img_StatusScreenLabelSprites, (void *) 0x06016000);

    proc->unk_64 = 0;

    SysBlackBoxSetGfx(0x300);

    if (parent->unk_3f == 0)
        EnableSysBlackBox(0, 7, 0x405, 0x17, 3, 0x800);

    if (parent->timesCompleted != 0)
        EnableSysBlackBox(1, 0xC2, 0x404, 5, 2, 0x800);

    EnableSysBlackBox(2, 0x84, 0x44E, 0xD, 6, 0x800);

    PutChapterTitlePalette(0x80, 0x13);
    PutChapterTitleGfx(0xB80, GetChapterTitle(&gPlaySt));
}

void StatusScreenSpriteDraw_Loop(struct ChapterStatusProc * proc)
{
    int i;

    struct ChapterStatusProc * parent = proc->proc_parent;

    if (parent->unk_3f == 0)
        PutSprite(4, 4, 9, Sprite_ChapterStatus_ChapterName, 0);

    PutSprite(4, parent->unitIndex * 52 + 128, 28, Sprite_ChapterStatus_FactionSelector, OAM2_PAL(parent->unitIndex));

    PutSprite(4, 138, 131, Sprite_ChapterStatus_08CC2DF8, 0);
    PutSprite(4, 139, 38, Sprite_ChapterStatus_08CC2E0E, 0);
    PutSprite(4, 192, 38, Sprite_ChapterStatus_08CC2E1C, 0);
    PutSprite(4, 18, 106, Sprite_ChapterStatus_08CC2E2A, 0);
    PutSprite(4, 18, 122, Sprite_ChapterStatus_08CC2E46, 0);
    PutSprite(4, 99, 124, Sprite_ChapterStatus_08CC2E4E, 0);
    PutSprite(4, 40, 48, Sprite_ChapterStatus_08CC2E32, 0);

    for (i = 0; i < 2; i++)
        PutSprite(4, 160 + (i * 32), 86, Sprite_32x16, 0xA3C0 + (i * 4));

    PutSprite(4, 136, 95, Sprite_ChapterStatus_08CC2E56, 0);
    PutSprite(4, 180, 97, Sprite_32x16, 0xA3D0);
    PutSprite(4, 136, 108, Sprite_ChapterStatus_08CC2E5E, 0);

    for (i = 0; i < 2; i++)
        PutSprite(4, 156 + (i * 32), 110, Sprite_32x16, 0xA3D4 + (i * 4));

    PutTime(gBg0Tm + TM_OFFSET(19, 16), TEXT_COLOR_SYSTEM_BLUE, GetGameTime(), FALSE);

    EnableBgSync(BG0_SYNC_BIT);

    if (parent->units[parent->unitIndex] != NULL)
        PutUnitSprite(4, 136, 82, parent->units[parent->unitIndex]);

    SyncUnitSpriteSheet();

    if (parent->timesCompleted != 0)
        PutSprite(4, 212, 3, Sprite_ChapterStatus_PlayCountLabel, 0);

    UpdateStatusFactionSelectorGlow();
}
