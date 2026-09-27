#include "gbafe.h"
#include "gbafe/bmcontainer.h"
#include "gbafe/bmtarget.h"
#include "gbafe/bmitemuse.h"
#include "gbafe/prep_sallycursor.h"

// Preparations map screen (FE8U: prep_sallycursor.c)

struct EventInfo
{
    /* 00 */ const void * listScript;
    /* 04 */ u32 script;
    /* 08 */ u32 flag;
    /* 0C */ u32 commandId;
    /* 10 */ u32 givenMoney;
    /* 14 */ u32 givenItem;
    /* 18 */ s8 xPos;
    /* 19 */ s8 yPos;
    /* 1A */ u8 pidA;
    /* 1B */ u8 pidB;
};

// Functions of other modules no header declares yet (FE8U names in comments)
const struct UnitDefinition * sub_08079280(void);  // GetChapterAllyUnitDataPointer
void TrySwitchViewedUnit(int x, int y);
void EndPlayerPhaseSideWindows(void);
void StartPrepScreenMenu(ProcPtr proc);                    // StartPrepScreenMenu
void SetPrepScreenMenuItem(int index, void * func, int color, int msg, int msgHelp);
void SetPrepScreenMenuOnBPress(void * func);
void SetPrepScreenMenuOnStartPress(void * func);
void SetPrepScreenMenuOnEnd(void * func);
void DrawPrepScreenMenuFrameAt(int x, int y);
void SetPrepScreenMenuSelectedItem(int index);
bool8 IsMapFadeActive(void);                        // DoesBMXFADEExist
int GetPlayerSelectKind(struct Unit * unit);
void UnitBeginAction(struct Unit * unit);
void StartPrepUnitSwap(ProcPtr parent, struct Unit * unit, int x, int y);
void sub_08018980(void);                            // LoadUnitPrepScreenPositions
void InitPlayerUnitPositionsForPrepScreen(void);                            // InitPlayerUnitPositionsForPrepScreen
void sub_080A3284(void);                            // StartMinimapPrepPhase
int SearchAvailableEvent(struct EventInfo * info);          // SearchAvailableEvent
void sub_080B03D4(struct Unit * unit, const u16 * items); // StartArmoryScreen
void sub_080B03F4(struct Unit * unit, const u16 * items); // StartVendorScreen
void SyncUnitDeploymentState(void);
void sub_08004234(void);
void RefreshBMapGraphics(void);

int GetPlayerLeaderUnitId(void)
{
    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_LYN:
            return CHARACTER_LYN_TUTORIAL;

        case CHAPTER_MODE_ELIWOOD:
            return CHARACTER_ELIWOOD;

        case CHAPTER_MODE_HECTOR:
            return CHARACTER_HECTOR;

        default:
            return 0;
    }
}

void Prep_ShowDeployableTiles(void)
{
    const struct UnitDefinition * uDef = sub_08079280();

    BmMapFillg(gBmMapRange, 0);
    BmMapFillg(gBmMapMovement, -1);

    uDef += CalcForceDeployedUnitCounts();

    for (; uDef->pid != 0; uDef++)
        gBmMapRange[uDef->y_move][uDef->x_move] = 1;

    DisplayMoveRangeGraphics(0x10);
}

void EndPrepScreenMenu_(void)
{
    EndPrepScreenMenu();
}

void PrepMapMenu_OnViewMap(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_VIEW_MAP;
    Proc_Break(proc);
    EndPrepScreenMenu_();
}

void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_FORMATION;

    TrySwitchViewedUnit(gBmSt.cursor.x, gBmSt.cursor.y);
    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y, 0);

    Proc_Break(proc);
    EndPrepScreenMenu_();
}

bool PrepMapMenu_OnStartPress(ProcPtr proc)
{
    Proc_Goto(proc, PL_SALLYCURSOR_END_PREP);
    return TRUE;
}

bool PrepMapMenu_OnBPress(ProcPtr proc)
{
    Proc_Goto(proc, PL_SALLYCURSOR_RETURN_TO_ATMENU);
    return TRUE;
}

static inline int GetChapterMerchantX(void)
{
    const struct ChapterInfo * info = GetChapterInfo(gPlaySt.chapterIndex);
    int hector = 0;
    const u8 * pos;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        hector = 1;

    pos = &info->merchantPosX;
    return pos[hector];
}

static inline int GetChapterMerchantY(void)
{
    const struct ChapterInfo * info = GetChapterInfo(gPlaySt.chapterIndex);
    int hector = 0;
    const u8 * pos;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        hector = 1;

    pos = &info->merchantPosY;
    return pos[hector];
}

void SALLYCURSOR_DeploySupplyUnit(void)
{
    struct Unit * unit = GetSupplyUnit();

    if (unit != NULL)
    {
        unit->state &= ~US_NOT_DEPLOYED;

        unit->xPos = GetChapterMerchantX();
        unit->yPos = GetChapterMerchantY();

        RefreshEntityMaps();
        RefreshUnitSprites();
    }
}

void PrepMapMenu_OnOptions(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_OPTIONS;
    Proc_Goto(proc, PL_SALLYCURSOR_OPTIONS);
}

void SALLYCURSOR_RemoveSupplyUnit(void)
{
    struct Unit * unit = GetSupplyUnit();

    if (unit)
    {
        unit->state |= US_NOT_DEPLOYED;

        unit->xPos = 0xFF;
        unit->yPos = 0xFF;

        RefreshEntityMaps();
        RefreshUnitSprites();
    }
}

void PrepMapMenu_OnSave(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_SAVE;
    Proc_Goto(proc, PL_SALLYCURSOR_SAVE);
}

void PrepScreenProc_SetCameraOnSupply(ProcPtr proc)
{
    EnsureCameraOntoPosition(proc, GetChapterMerchantX(), GetChapterMerchantY());
}

void PrepScreenProc_InitMapMenu(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_VIEW_MAP;
    PrepScreenProc_StartMapMenu(proc);
}

void PrepScreenProc_DimMapImmediate(void)
{
    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0xC0, 0xC0, 0xC0, 0xFF00FFF0);
}

void PrepScreenProc_StartBrightenMap(ProcPtr proc)
{
    sub_080139D8(0xC0, 0xC0, 0xC0, 0x100, 0x100, 0x100, 0xFF00FFF0, 0x40, proc);
}

void sub_08030570(ProcPtr proc)
{
    ArchiveCurrentPalettes();
    sub_080139D8(0x100, 0x100, 0x100, 0xC0, 0xC0, 0xC0, 0xFF00FFF0, 0x40, proc);
}

void PrepHelpPrompt_Init(struct ProcPrepSallyCursor * proc)
{
    StartHelpPromptSprite(176, 140, proc);
    Decompress(Img_PrepHelpButtonSprites, OBJ_VRAM0 + 0x7000);
    proc->lastCmd = PREP_MAPMENU_NONE;
}

void PrepHelpPrompt_Loop(void)
{
    PutSprite(4, 104, 140, Sprite_32x16, 0x38D);
    PutSprite(4, 136, 140, Sprite_32x16, 0x391);
    PutSprite(4, 168, 140, Sprite_16x16, 0x395);
    PutSprite(4, 16, 140, Sprite_8x16, 0x380);
    PutSprite(4, 24, 140, Sprite_32x16, 0x397);
    PutSprite(4, 56, 140, Sprite_32x16, 0x39B);
    PutSprite(4, 88, 140, Sprite_8x16, 0x39F);
}

void StartPrepHelpPrompt(ProcPtr proc)
{
    Proc_Start(ProcScr_PrepHelpPrompt, proc);
}

void PrepMapMenu_OnEnd(void)
{
    EndHelpPromptSprite();
    Proc_EndEach(ProcScr_PrepHelpPrompt);
}

void PrepScreenProc_StartMapMenu(struct ProcPrepSallyCursor * proc)
{
    LoadHelpBoxGfx(0, -1);
    ResetText();
    EndPlayerPhaseSideWindows();
    HideMoveRangeGraphics();

    StartPrepScreenMenu(proc);

    SetPrepScreenMenuItem(PREP_MAPMENU_VIEW_MAP, PrepMapMenu_OnViewMap, 0, 0x114F, 0x383);
    SetPrepScreenMenuItem(PREP_MAPMENU_FORMATION, PrepMapMenu_OnFormation, 0, 0x114E, 0x384);
    SetPrepScreenMenuItem(PREP_MAPMENU_OPTIONS, PrepMapMenu_OnOptions, 0, 0x114C, 0x382);

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP))
        SetPrepScreenMenuItem(PREP_MAPMENU_SAVE, PrepMapMenu_OnSave, 0, 0x1140, 0x37E);

    StartPrepHelpPrompt(proc);

    SetPrepScreenMenuOnBPress(PrepMapMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepMapMenu_OnStartPress);
    SetPrepScreenMenuOnEnd(PrepMapMenu_OnEnd);

    DrawPrepScreenMenuFrameAt(10, 2);

    SetPrepScreenMenuSelectedItem(proc->lastCmd);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

bool CanCharacterBePrepMoved(int pid)
{
    if (IsCharacterForceDeployed(pid))
        return FALSE;

    if (pid == 0x28)
        return FALSE;

    return TRUE;
}

void sub_0803079C(struct ProcPrepSallyCursor * proc)
{
    s16 x;

    proc->unk_4A = 0;

    proc->unk_2C = 0;
    proc->unk_30 = 0;
    proc->unk_34 = 2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - DISPLAY_WIDTH / 2;
}

void sub_080307C4(struct ProcPrepSallyCursor * proc)
{
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = 2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - DISPLAY_HEIGHT / 2;
}

void sub_080307E0(struct ProcPrepSallyCursor * proc)
{
    s16 x;

    proc->unk_34 = -2;
    proc->unk_38 = 0;

    x = gBmMapSize.x;
    proc->unk_4C = (x * 8) - DISPLAY_WIDTH / 2;
}

void sub_08030800(struct ProcPrepSallyCursor * proc)
{
    s16 y;

    proc->unk_34 = 0;
    proc->unk_38 = -2;

    y = gBmMapSize.y;
    proc->unk_4C = (y * 8) - DISPLAY_HEIGHT / 2;
}

void sub_0803081C(struct ProcPrepSallyCursor * proc)
{
    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | START_BUTTON))
        proc->unk_4A = 1;

    if (proc->unk_4A && !(proc->unk_2C & 15) && !(proc->unk_30 & 15))
    {
        Proc_Goto(proc, PL_SALLYCURSOR_START_ATMENU);
        return;
    }

    proc->unk_2C += proc->unk_34;
    proc->unk_30 += proc->unk_38;

    gBmSt.camera.x = proc->unk_2C;
    gBmSt.camera.y = proc->unk_30;

    proc->unk_4C--;

    if (proc->unk_4C <= 0)
        Proc_Break(proc);
}

void InitPrepScreenUnitsAndCamera(ProcPtr proc)
{
    if (!GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
    {
        Proc_End(proc);
        return;
    }

    sub_08018980();

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_PREPSCREEN))
    {
        SortPlayerUnitsForPrepScreen();
        InitPlayerUnitPositionsForPrepScreen();
        gPlaySt.chapterStateBits |= PLAY_FLAG_PREPSCREEN;
    }

    gBmSt.camera.x = GetCameraCenteredX(0);
    gBmSt.camera.y = GetCameraCenteredY(0);
    gBmSt.flags |= BM_FLAG_4;

    gPlaySt.chapterVisionRange = GetChapterInfo(gPlaySt.chapterIndex)->fog;

    RefreshEntityMaps();
    RenderMap();
}

void InitPrepScreenCursorPosition(void)
{
    struct Unit * unit = GetUnitFromCharId(GetPlayerLeaderUnitId());

    if (unit != NULL)
        SetMapCursorPosition(unit->xPos, unit->yPos);
    else
        SetMapCursorPosition(0, 0);

    gBmSt.camera.x = GetCameraCenteredX(gBmSt.cursor.x * 16);
    gBmSt.camera.y = GetCameraCenteredY(gBmSt.cursor.y * 16);
}

void PrepScreenProc_SetupMapIdle(struct ProcPrepSallyCursor * proc)
{
    if (!IsMapFadeActive())
    {
        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
            Prep_ShowDeployableTiles();

        Proc_Break(proc);
    }

    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y, 0);
}

void PrepScreenProc_MapIdle(struct ProcPrepSallyCursor * proc)
{
    HandlePlayerMapCursor();

    if (!IsMapFadeActive())
    {
        if (gpKeySt->pressed & L_BUTTON)
        {
            TrySwitchViewedUnit(gBmSt.cursor.x, gBmSt.cursor.y);
            PlaySoundEffect(0x38B);
        }
        else
        {
            if (gpKeySt->pressed & R_BUTTON)
            {
                if (gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x])
                {
                    EndAllMus();
                    EndPlayerPhaseSideWindows();
                    SetStatScreenExcludedUnitFlags(0x1F);
                    StartStatScreen(GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]), proc);
                    Proc_Goto(proc, PL_SALLYCURSOR_POST_STATSCREEN_IDLE);
                    return;
                }
            }

            if (gpKeySt->pressed & SELECT_BUTTON)
            {
                EndPlayerPhaseSideWindows();
                gPlaySt.xCursor = gBmSt.cursor.x;
                gPlaySt.yCursor = gBmSt.cursor.y;
                Proc_Goto(proc, PL_SALLYCURSOR_OPEN_MAP_MENU);
                PlaySoundEffect(0x389);
                return;
            }

            if (gpKeySt->pressed & A_BUTTON)
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

                switch (GetPlayerSelectKind(unit))
                {
                    case 0:
                    case 1:
                        EndPlayerPhaseSideWindows();
                        gPlaySt.xCursor = gBmSt.cursor.x;
                        gPlaySt.yCursor = gBmSt.cursor.y;

                        switch (gBmMapTerrain[gBmSt.cursor.y][gBmSt.cursor.x])
                        {
                            case TERRAIN_ARMORY:
                            case TERRAIN_VENDOR:
                                PlaySoundEffect(0x38A);
                                Proc_Goto(proc, PL_SALLYCURSOR_SHOP);
                                return;

                            default:
                                Proc_Goto(proc, PL_SALLYCURSOR_OPEN_MAP_MENU);
                                PlaySoundEffect(0x389);
                                return;
                        }

                    case 2:
                        UnitBeginAction(unit);
                        gActiveUnit->state &= ~US_HIDDEN;

                        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
                        {
                            Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SWAP);
                            return;
                        }

                        Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SELECTED);
                        return;

                    case 4:
                        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
                        {
                            PlaySoundEffect(0x38C);
                            return;
                        }

                        // fallthrough

                    case 3:
                        UnitBeginAction(unit);
                        gActiveUnit->state &= ~US_HIDDEN;

                        Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SELECTED);
                        return;
                }
            }

            if (gpKeySt->pressed & START_BUTTON)
            {
                EndPlayerPhaseSideWindows();
                sub_080A3284();
                Proc_Goto(proc, PL_SALLYCURSOR_MAP_IDLE);
                return;
            }
        }
    }

    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y, 0);
}

int sub_08030C10(void)
{
    ProcPtr proc = Proc_Find(ProcScr_SALLYCURSOR);
    Proc_Goto(proc, PL_SALLYCURSOR_RETURN_TO_ATMENU);
    return 0x17;
}

void PrepScreen_StartUnitSwap(struct ProcPrepSallyCursor * proc)
{
    struct SpriteAnim * anim = StartSpriteAnim(gSpriteAnim_WarpCursor, 0);
    anim->oam2 = 0;
    SetSpriteAnimId(anim, 0);

    proc->ap = anim;
    proc->unk_4A = 2;
    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    StartSubtitleHelp(proc, DecodeMsg(0x726));

    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    PlaySoundEffect(0x389);
}

void PrepScreen_UnitSwapIdle(struct ProcPrepSallyCursor * proc)
{
    s8 r7 = gBmMapRange[gBmSt.cursor.y][gBmSt.cursor.x];
    u32 xLoc;
    u32 yLoc;

    if (GetPlayerSelectKind(GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x])) == 4)
        r7 = 0;

    HandlePlayerMapCursor();

    xLoc = (proc->xCursor * 16) - gBmSt.camera.x;
    yLoc = (proc->yCursor * 16) - gBmSt.camera.y;

    if (((xLoc + 16) <= DISPLAY_WIDTH + 16) && ((yLoc + 32) <= DISPLAY_HEIGHT + 32))
        PutSprite(4, xLoc, yLoc - 12, Sprite_16x16, 6);

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (r7)
        {
            EndSpriteAnim(proc->ap);
            Proc_Break(proc);
            EndSubtitleHelp();
            return;
        }

        PlaySoundEffect(0x38C);
        return;
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        EndSpriteAnim(proc->ap);
        Proc_Goto(proc, PL_SALLYCURSOR_CANCEL_SWAP);
        EndSubtitleHelp();
        PlaySoundEffect(0x38B);
        return;
    }

    if (r7 != proc->unk_4A)
        SetSpriteAnimId(proc->ap, r7 == 0 ? 1 : 0);

    DisplaySpriteAnim(proc->ap, gBmSt.cursor_sprite.x - gBmSt.camera.x, gBmSt.cursor_sprite.y - gBmSt.camera.y);

    proc->unk_4A = r7;
}

void sub_08030DFC(ProcPtr proc)
{
    SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);
    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}

void PrepScreen_StartUnitSwapAnim(ProcPtr proc)
{
    struct Unit * activeUnit = gActiveUnit;
    struct Unit * targetUnit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

    if (targetUnit == NULL)
    {
        StartPrepUnitSwap(proc, activeUnit, gBmSt.cursor.x, gBmSt.cursor.y);
    }
    else
    {
        StartPrepUnitSwap(proc, activeUnit, targetUnit->xPos, targetUnit->yPos);
        StartPrepUnitSwap(proc, targetUnit, activeUnit->xPos, activeUnit->yPos);
    }

    PlaySoundEffect(0x381);
}

void InitMapChangeGraphicsIfFog(void)
{
    if (gPlaySt.chapterVisionRange != 0)
        RenderMapForFade();
}

void DisplayMapChangeIfFog(void)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderMap();
        StartMapFade(0);
    }
}

void PrepScreenProc_StartConfigMenu(ProcPtr proc)
{
    Proc_Start(ProcScr_Config_PrepMapMenu, PROC_TREE_3);
}

void PrepScreenProc_StartShopScreen(ProcPtr proc)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = gBmSt.cursor.x;
    info.yPos = gBmSt.cursor.y;

    if (!SearchAvailableEvent(&info))
        return;

    switch (info.commandId)
    {
        case 0x13:
            sub_080B03D4(NULL, (u16 *) info.script);
            break;

        case 0x14:
            sub_080B03F4(NULL, (u16 *) info.script);
            break;
    }
}

void PrepScreenProc_MapMovementLoop(ProcPtr proc)
{
    HandlePlayerMapCursor();

    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON))
    {
        EndAllMus();
        gActiveUnit->state &= ~US_HIDDEN;
        gBmSt.flags &= ~BM_FLAG_3;

        HideMoveRangeGraphics();
        RefreshEntityMaps();
        RefreshUnitSprites();

        PlaySoundEffect(0x38B);
        Proc_Goto(proc, PL_SALLYCURSOR_MAP_IDLE);
        return;
    }

    if (gpKeySt->pressed & R_BUTTON)
    {
        u8 uid = gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x];

        if (*(u32 *) &gActiveUnitMoveOrigin == *(u32 *) &gBmSt.cursor)
            uid = gActiveUnit->index;

        if (uid != 0)
        {
            EndAllMus();
            SetStatScreenExcludedUnitFlags(0x1F);
            StartStatScreen(GetUnit(uid), proc);
            Proc_Goto(proc, PL_SALLYCURSOR_POST_STATSCREEN_MOVE);
        }
    }

    if (gpKeySt->pressed & L_BUTTON)
    {
        if (gActiveUnit)
        {
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetMapCursorPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(0x38B);
        }
    }

    PutMapCursor(gBmSt.cursor_sprite.x, gBmSt.cursor_sprite.y, 1);
}

void PrepScreenProc_Cleanup(ProcPtr proc)
{
    InitBgs(NULL);
    EndAllProcChildren(proc);
}

void sub_080310A8(ProcPtr proc)
{
    if (gActiveUnit == NULL)
    {
        RefreshBMapGraphics();
        Proc_Goto(proc, PL_SALLYCURSOR_0C);
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    Proc_Goto(proc, PL_SALLYCURSOR_0B);
}

void StartPrepSaveScreen(ProcPtr proc)
{
    StartBgmVolumeChange(0x100, 0x80, 0x20, NULL);
    SyncUnitDeploymentState();
    sub_080A4E0C(proc);
}

void sub_08031148(void)
{
    StartBgmVolumeChange(0x80, 0x100, 0x20, NULL);
}

void PrepScreenProc_UpdateBgm(void)
{
    sub_08004234();
    CallSomeSoundMaybe(0x49, 0x100, 0x100, 0x18, NULL);
}

void ShrinkPlayerUnits(void)
{
    int i;

    if (!(PLAY_FLAG_EXTRA_MAP & gPlaySt.chapterStateBits))
        return;

    if (BM_FLAG_LINKARENA & gBmSt.flags)
        return;

    InitUnitStack(gBuf);

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->state & US_UNAVAILABLE))
            PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack2();
}

void EndPrepScreen(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        unit->state &= ~(US_UNSELECTABLE);

        if (unit->state & (US_DEAD | US_BIT16 | US_BIT25))
            continue;

        if (unit->state & US_NOT_DEPLOYED)
            PidStatsSubFavval100(unit->pCharacterData->number);
        else
            PidStatsAddDeployAmt(unit->pCharacterData->number);
    }

    ShrinkPlayerUnits();
    Proc_EndEach(ProcScr_SALLYCURSOR);
    gBmSt.flags &= ~BM_FLAG_4;
    gPlaySt.chapterStateBits &= ~PLAY_FLAG_PREPSCREEN;
}

bool IsPrepMapActive(void)
{
    return Proc_Find(ProcScr_SALLYCURSOR) ? TRUE : FALSE;
}
