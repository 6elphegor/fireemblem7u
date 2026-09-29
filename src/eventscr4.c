#include "gbafe.h"
#include "gbafe/cgtext.h"

/* functions from other modules */
ProcPtr Proc_FindNonBlocked(const struct ProcCmd * script);
ProcPtr Proc_FindWithMark(int mark);
void SetTalkFlag(int talk_flags);
void ClearTalkFaceRefs(void);
void SetBgmVolume(int volume);
void SetWeather(int weather);

void HandleGiveUnitItem(struct Unit * unit, int item, ProcPtr parent);
struct UnitDefinition const * sub_08079280(void);

void m4aMPlayFadeOut(struct MusicPlayerInfo * mplayInfo, u16 speed);
void m4aMPlayFadeOutPause(struct MusicPlayerInfo * mplayInfo, u16 speed);
void m4aMPlayFadeInContinue(struct MusicPlayerInfo * mplayInfo, u16 speed);


/* world map */
void EndWM(void);
void WmMergeFace(int a, int b, int c, int d, int e, int f, int g);
void WmMergeMonsters(void);
void sub_080B4F70(void);
void sub_080B4F74(int a, int b);
void WmStartFadeCamera(int a, int b, int c, int d);
void WmStartScrollCamera(int x, int y, int speed);
void StartWmSpotlight(int a, int b);
void EndWmSpotlightProc(void);
void sub_080B4D4C(int a, int b, u16 c);
void sub_080B4E88(int a, u16 b);
void WmStartTalk(int a);
void OpenWmTextBox(int a);
void CloseWmTextBox(void);
void StartWmMuMove(int a, int b, int c, int d);
void EndWmMu(int a);
void StartWmSpriteAnim(int a, int b);
void EndWmSpriteAnim(int a);
void EndAllWmSpriteAnims(void);
void StartWmPalFadeOut(int a);
void StartWmPalFadeIn(int a);
void WmMu_EndFlash(int a);
void WmMu_StartFlash(int a);
void nullsub_5(int a, int b, int c);
void nullsub_6(void);
void sub_080B4C60(int a, s16 b, s16 c, u8 d);
void StartWmIcon2(int idx, s16 x, s16 y, u8 pal);
void EndWmIcon2(int a);
void sub_080B4B8C(int a, s16 b, s16 c, u8 d);
void StartWmIcon(int idx, s16 x, s16 y, u8 pal);
void EndWmIcon(int a);
void sub_080B4F9C(int a, int b);

void SetScriptedBattle(struct BattleHit * hits);
void SetMenuOverride(int a, int b, void * func);
int MenuAlwaysNotShown();
int MenuAlwaysDisabled();
int MenuAlwaysEnabled();
int Get8(void);
void StartBoxDialogueSimple(int x, int y, int msg, ProcPtr parent);
bool IsTactFemale(void);
void StartNoBoxTalk(ProcPtr parent);
void StartTutorialCursors(int kind);
void SetkeyStIgnoredMask(int mask);
void StartEventWarpAnim(ProcPtr parent, int x, int y, s8 kind, s8 flag);
void StartWarpEffect_08020A64(ProcPtr parent, int x, int y, s8 kind);
int WmToScreenX(int x);
int WmToScreenY(int y);
void Event_CgTalkOnSkip(struct EventProc * proc);




extern struct MusicPlayerInfo gUnk_03005D20;

struct GiveItemProc {
    /* 00 */ PROC_HEADER;
    STRUCT_PAD(0x29, 0x54);
    /* 54 */ struct Unit * unit;
    /* 58 */ int item;
};

#define EVT_ARG_U16(proc, n) (((u16 const *)(proc)->script)[n])

struct GiveItemProc;
struct EventFaceDeamonProc;
void EventFaceDeamonDelete(struct EventFaceDeamonProc * proc);
void GiveItem_DoGiveItem(struct GiveItemProc * proc);
void GiveItem_DoPopup(struct GiveItemProc * proc);
void sub_0800F5AC(void);
void sub_0800F5B0(void);
void sub_0800F604(void);
void sub_0800F608(void);

CONST_DATA struct FaceVramEnt gFaceConfig_08B91AB8[] = {
    { 0x800, 3 },
    { 0x800, 3 },
    { 0x800, 3 },
    { 0x800, 3 },
};

CONST_DATA EventScr EventScr_08B91AD8[] = {
    0x13, 2, 0xA, 0,
};

CONST_DATA EventScr EventScr_08B91AE8[] = {
    2, 0x3E, (EventScr) sub_0800EDAC, 0x13, 9, 0x3E, (EventScr) sub_0800EF3C, 0x10002,
    0xA, 0,
};

CONST_DATA EventScr EventScr_08B91B10[] = {
    6, 0x10008F, 0x93, 0x13, 0x10008E, 0x92, 0x10002, 0xA,
    0,
};

CONST_DATA struct PopupInstruction gPopup_08B91B34[] = {
    { 0xC, 0x37C },
    { 8, 2 },
    { 3, 0 },
    { 1, 1 },
    { 9, 0 },
    { 1, 1 },
    { 8, 0 },
    { 6, 0x751 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction gPopup_08B91B7C[] = {
    { 0xC, 0x37C },
    { 8, 2 },
    { 3, 0 },
    { 1, 1 },
    { 9, 0 },
    { 1, 1 },
    { 8, 0 },
    { 6, 0x752 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction gPopup_08B91BC4[] = {
    { 0xC, 0x37A },
    { 0xA, 0 },
    { 6, 0x750 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction PopupScr_GotGold[] = {
    { 0xC, 0x37A },
    { 8, 0 },
    { 6, 0x754 },
    { 8, 2 },
    { 0xB, 0 },
    { 1, 3 },
    { 8, 0 },
    { 6, 0x753 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction PopupScr_GoldWasStole[] = {
    { 0xC, 0x37C },
    { 8, 2 },
    { 0xB, 0 },
    { 1, 3 },
    { 8, 0 },
    { 6, 0x756 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction PopupScr_GotItem[] = {
    { 0xC, 0x37A },
    { 8, 0 },
    { 6, 0x754 },
    { 8, 2 },
    { 4, 0 },
    { 1, 1 },
    { 9, 0 },
    { 8, 0 },
    { 1, 1 },
    { 6, 0x12B2 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction PopupScr_ItemWasPilfered[] = {
    { 0xC, 0x37C },
    { 8, 2 },
    { 3, 0 },
    { 1, 1 },
    { 9, 0 },
    { 1, 1 },
    { 8, 0 },
    { 6, 0x757 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction gPopup_08B91D04[] = {
    { 0xC, 0x37A },
    { 8, 0 },
    { 6, 0x755 },
    { 8, 2 },
    { 4, 0 },
    { 1, 1 },
    { 9, 0 },
    { 1, 1 },
    { 8, 0 },
    { 6, 0x12B2 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction gPopup_08B91D5C[] = {
    { 0xC, 0x37C },
    { 8, 2 },
    { 3, 0 },
    { 1, 1 },
    { 9, 0 },
    { 1, 1 },
    { 8, 0 },
    { 6, 0x758 },
    { 0, 0 },
};

CONST_DATA struct PopupInstruction gPopup_08B91DA4[] = {
    { 0xC, 0x37A },
    { 8, 0 },
    { 6, 0x759 },
    { 0, 0 },
};

CONST_DATA struct ProcCmd ProcScr_GiveItem[] = {
    PROC_YIELD,
    PROC_CALL(GiveItem_DoPopup),
    PROC_YIELD,
    PROC_CALL(GiveItem_DoGiveItem),
    PROC_YIELD,
    PROC_END,
};

CONST_DATA EventScr EventScr_08B91DF4[] = {
    0x86, 0x93, 0x5B, 0, 0xA, 0,
};

CONST_DATA EventScr EventScr_08B91E0C[] = {
    0x86, 0x93, 0x5C, 0, 0, 0xA, 0,
};

CONST_DATA EventScr EventScr_08B91E28[] = {
    0x86, 0x93, 0x5E, 0, 0xA, 0,
};

CONST_DATA EventScr EventScr_08B91E40[] = {
    0xFFFF005F, 0xA, 0,
};

CONST_DATA EventScr EventScr_08B91E4C[] = {
    0xFFFF005F, 0x86, 0x93, 0x5B, 0, 0xA, 0,
};

CONST_DATA EventScr EventScr_08B91E68[] = {
    0xFFFF005F, 0x86, 0x93, 0x5E, 0, 0xA, 0, 0x8000F,
    0, 0xE, 0, 2, (EventScr) sub_0800F5AC, 3, (EventScr) sub_0800F5B0, 0,
    0, 0x8000F, 0, 4, (EventScr) EventFaceDeamonDelete, 0xE, 0, 2,
    (EventScr) sub_0800F604, 3, (EventScr) sub_0800F608, 0, 0,
};

int Event00_(struct EventProc * proc)
{
    bool jumped = FALSE;

    if (proc->script_return != NULL)
    {
        proc->script_start = proc->script_return;
        proc->script = proc->script_return_pc;
        proc->script_return = NULL;
        proc->script_return_pc = NULL;
        jumped = TRUE;
    }
    else
    {
        Proc_Break(proc);
    }

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        if (Proc_Find(ProcScr_Face))
            ClearTalk();
    }
    else if (!(proc->flags & EVENT_FLAG_DISABLETEXTSKIP))
    {
        EventClearTalkDisplayed(proc);
    }

    if (jumped)
        return EVENT_CMDRET_JUMPED;

    return EVENT_CMDRET_YIELD;
}

int Event01(struct EventProc * proc)
{
    return Event00_(proc);
}

void EventClearTalkDisplayed(struct EventProc * proc)
{
    if (proc->unk_4D)
    {
        ClearTalk();
    }
    else if (Proc_Find(ProcScr_Face))
    {
        ClearTalkBubble();
        Proc_ForEach(ProcScr_Face, (ProcFunc) StartFaceFadeOut);

        proc->sleep_duration = 8;
        StartTemporaryLock(proc, 8);
    }
}

void ClearTalk(void)
{
    ClearTalkBubble();
    Proc_EndEach(ProcScr_Face);
    InitFaces();
    ClearTalkFaceRefs();
}

void sub_0800ED18(void)
{
}

void sub_0800ED1C(void)
{
}

bool IsEventRunning(void)
{
    return Proc_FindWithMark(6) ? TRUE : FALSE;
}

bool sub_0800ED34(void)
{
    return Proc_FindNonBlocked(ProcScr_UnkEvt) ? TRUE : FALSE;
}

void sub_0800ED4C(void)
{
    Proc_EndEachMarked(6);
    Proc_EndEachMarked(7);
    Proc_EndEachMarked(5);
    EndAllMus();
}

void sub_0800ED68(void)
{
    SetFaceConfig(gFaceConfig_08B91AB8);
}

ProcPtr sub_0800ED78(int msg)
{
    struct EventProc * proc = StartEvent(EventScr_08B91AD8);
    proc->talk_auto_msg = msg;
    return proc;
}

ProcPtr CallMapSupportEvent(int msg, int song)
{
    struct EventProc * proc = StartEvent(EventScr_08B91AE8);
    proc->talk_auto_msg = msg;
    proc->unk_58 = song;
    return proc;
}

void sub_0800EDAC(struct EventProc * proc)
{
    if (proc->unk_58 != 0)
        StartBgm(proc->unk_58, NULL);
    else
        SetBgmVolume(0x90);
}

ProcPtr CallSupportViewerEvent(int msg)
{
    struct EventProc * proc = StartEvent(EventScr_08B91B10);
    proc->talk_auto_msg = msg;
    return proc;
}

void sub_0800EDE0(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopup_Simple(gPopup_08B91B34, 0x60, 0, parent);
}

void sub_0800EE04(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopup_Simple(gPopup_08B91B7C, 0x60, 0, parent);
}

void sub_0800EE28(u16 item, ProcPtr parent)
{
    SetPopupItem(item);
    NewPopup_Simple(gPopup_08B91BC4, 0x60, 0, parent);
}

void StartPopup_800EE4C(int num, ProcPtr parent)
{
    SetPopupNumber(num);

    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        NewPopup_Simple(PopupScr_GotGold, 0x60, 0, parent);
    else
        NewPopup_Simple(PopupScr_GoldWasStole, 0x60, 0, parent);
}

void StartPopup_800EE90(int num, ProcPtr parent)
{
    SetPopupNumber(num);
    NewPopup_Simple(PopupScr_GotGold, 0x60, 0, parent);
}

void StartPopup_800EEB0(struct Unit * unit, u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (UNIT_FACTION(unit) == FACTION_BLUE)
        NewPopup_Simple(PopupScr_GotItem, 0x60, 0, parent);
    else
        NewPopup_Simple(PopupScr_ItemWasPilfered, 0x60, 0, parent);
}

void StartStoleItemPopup(u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (UNIT_FACTION(gActiveUnit) == FACTION_BLUE)
        NewPopup_Simple(gPopup_08B91D04, 0x60, 0, parent);
    else
        NewPopup_Simple(gPopup_08B91D5C, 0x60, 0, parent);
}

void sub_0800EF3C(ProcPtr parent)
{
    NewPopup_Simple(gPopup_08B91DA4, 0x60, 0, parent);
}

void StartGiveItem(struct Unit * unit, u16 item, ProcPtr parent)
{
    struct GiveItemProc * proc;

    if ((uintptr_t) parent < 8)
        proc = Proc_Start(ProcScr_GiveItem, parent);
    else
        proc = Proc_StartBlocking(ProcScr_GiveItem, parent);

    proc->item = item;
    proc->unit = unit;

    if (UNIT_FACTION(unit) == FACTION_RED)
        unit->state |= US_DROP_ITEM;
}

void GiveItem_DoPopup(struct GiveItemProc * proc)
{
    StartPopup_800EEB0(proc->unit, proc->item, proc);
}

void GiveItem_DoGiveItem(struct GiveItemProc * proc)
{
    struct Unit * unit = proc->unit;
    HandleGiveUnitItem(unit, MakeNewItem(proc->item), proc);
}

void sub_0800EFCC(u16 iid)
{
    struct EventProc * proc = StartEvent(EventScr_08B91DF4);
    proc->iid_param = iid;
}

void sub_0800EFE8(u16 pid, u16 iid)
{
    struct EventProc * proc = StartEvent(EventScr_08B91E0C);
    proc->pid_param = pid;
    proc->iid_param = iid;
}

void sub_0800F010(int gold)
{
    struct EventProc * proc = StartEvent(EventScr_08B91E28);
    proc->unk_58 = gold;
}

void sub_0800F028(u8 param)
{
    struct EventProc * proc = StartEvent(EventScr_08B91E40);
    proc->map_change_param = param;
}

void sub_0800F044(u16 iid, u8 param)
{
    struct EventProc * proc = StartEvent(EventScr_08B91E4C);
    proc->iid_param = iid;
    proc->map_change_param = param;
}

void sub_0800F06C(int gold, u8 param)
{
    struct EventProc * proc = StartEvent(EventScr_08B91E68);
    proc->unk_58 = gold;
    proc->map_change_param = param;
}

void sub_0800F08C(void)
{
    struct EventProc * proc = Proc_Find(ProcScr_UnkEvt);

    if (proc != NULL)
        proc->flags |= EVENT_FLAG_TEXTSKIPPED;
}

struct ChapterMerchantPos {
    STRUCT_PAD(0x00, 0x86);
    /* 86 */ u8 x[2];
    /* 88 */ u8 y[2];
};

#define MERCHANT_X(info) (((struct ChapterMerchantPos const *) (info))->x[gPlaySt.chapterModeIndex == 3 ? 1 : 0])
#define MERCHANT_Y(info) (((struct ChapterMerchantPos const *) (info))->y[gPlaySt.chapterModeIndex == 3 ? 1 : 0])

int GetChapterAllyUnitCount(void)
{
    struct UnitDefinition const * udef = sub_08079280();
    int count = 0;

    for (; udef->pid != 0; udef++)
        count++;

    return count;
}

void InitPlayerUnitPositionsForPrepScreen(void)
{
    int i;
    struct UnitDefinition const * udef = sub_08079280();

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (udef->pid == 0)
        {
            unit->xPos = -1;
            continue;
        }

        if (unit->state & (US_UNAVAILABLE | US_BIT25))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
        {
            unit->xPos = MERCHANT_X(GetChapterInfo(gPlaySt.chapterIndex));
            unit->yPos = MERCHANT_Y(GetChapterInfo(gPlaySt.chapterIndex));
            continue;
        }

        unit->xPos = udef->x_move;
        unit->yPos = udef->y_move;
        udef++;
    }
}

void SyncUnitDeploymentState(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->state & US_NOT_DEPLOYED)
        {
            unit->xPos = -1;
            unit->state |= US_HIDDEN;
            continue;
        }

        unit->state &= ~US_HIDDEN;

        if (unit->xPos == -1)
            AssignUnitToFreeDeploySlot(unit);
    }
}

void AssignUnitToFreeDeploySlot(struct Unit * unit)
{
    int i;
    struct UnitDefinition const * udef = sub_08079280();

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
    {
        unit->xPos = MERCHANT_X(GetChapterInfo(gPlaySt.chapterIndex));
        unit->yPos = MERCHANT_Y(GetChapterInfo(gPlaySt.chapterIndex));
        return;
    }

    while (udef->pid != 0)
    {
        bool found = FALSE;

        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
        {
            struct Unit * other = GetUnit(i);

            if (!UNIT_IS_VALID(other))
                continue;

            if (other->state & (US_DEAD | US_NOT_DEPLOYED))
                continue;

            if (other->xPos != udef->x_move || other->yPos != udef->y_move)
                continue;

            found = TRUE;
            break;
        }

        if (!found)
        {
            unit->xPos = udef->x_move;
            unit->yPos = udef->y_move;
            return;
        }

        udef++;
    }
}

void sub_0800F278(void)
{
}

void sub_0800F27C(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
        {
            unit->xPos = MERCHANT_X(GetChapterInfo(gPlaySt.chapterIndex));
            unit->yPos = MERCHANT_Y(GetChapterInfo(gPlaySt.chapterIndex));
            unit->state &= ~US_HIDDEN;
        }
    }
}

void Event_SetExitMap(struct EventProc * proc)
{
    proc->unk_4D = TRUE;
}

void Event_SetEnterMap(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        proc->unk_4D = FALSE;
}

void sub_0800F318(void)
{
    SetWeather(0);
}

void sub_0800F324(void)
{
    SetWeather(6);
}

void sub_0800F330(void)
{
    m4aMPlayFadeOut(&gUnk_03005D20, 3);
}

void sub_0800F344(void)
{
    m4aMPlayFadeOutPause(&gUnk_03005B10, 3);
}

void sub_0800F358(void)
{
    m4aMPlayFadeInContinue(&gUnk_03005B10, 2);
}

void StartWorldMap(u8 a, int x, int y, int c);
void WorldMap_StartBgm(int c);

int sub_0800F36C(struct EventProc * proc)
{
    int a = proc->script[1];
    int x = SCR_LO16_SIGN(proc->script[2]);
    int y = SCR_HI16_SIGN(proc->script[2]);
    int c = proc->script[3];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    StartWorldMap(a, x, y, c);
    WorldMap_StartBgm(c);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F3D4(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        return EVENT_CMDRET_CONTINUE;
    }

    StartSlowLockingFadeToBlack(proc);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F418(struct EventProc * proc)
{
    EndWM();
    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F424(struct EventProc * proc)
{
    int a = SCR_LO16_SIGN(proc->script[1]);
    u16 b_raw = EVT_ARG_U16(proc, 3);
    int b = b_raw & 0x8000 ? -1 : b_raw;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    sub_080B4F74(a, b);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F478(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    sub_080B4F70();
    return EVENT_CMDRET_YIELD;
}

int sub_0800F494(struct EventProc * proc)
{
    int a = SCR_LO16_SIGN(proc->script[1]);
    u16 b_raw = EVT_ARG_U16(proc, 3);
    int b = b_raw & 0x8000 ? -1 : b_raw;
    int c = proc->script[2];
    int d = proc->script[3];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    WmStartFadeCamera(a, b, c, d);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F4EC(struct EventProc * proc)
{
    int a = SCR_LO16_SIGN(proc->script[1]);
    u16 b_raw = EVT_ARG_U16(proc, 3);
    int b = b_raw & 0x8000 ? -1 : b_raw;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    StartWmSpotlight(a, b);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F540(struct EventProc * proc)
{
    EndWmSpotlightProc();

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    return EVENT_CMDRET_YIELD;
}

int sub_0800F560(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    int c = proc->script[3];
    int d = proc->script[4];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (!skipped)
    {
        if (d != 0)
            WmMergeFace(d, 6, a, b, skipped, skipped, c);
        else
            sub_080B4D4C(a, b, c);
    }

    return EVENT_CMDRET_CONTINUE;
}

void sub_0800F5AC(void)
{
}

void sub_0800F5B0(void)
{
}

int sub_0800F5B4(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    int c = proc->script[3];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (skipped)
        EndFaceById(a);
    else if (c != 0)
        WmMergeFace(c, 7, a, 0, skipped, skipped, b);
    else
        sub_080B4E88(a, b);

    return EVENT_CMDRET_CONTINUE;
}

void sub_0800F604(void)
{
}

void sub_0800F608(void)
{
}

struct EventFaceDeamonProc {
    /* 00 */ PROC_HEADER;
    STRUCT_PAD(0x29, 0x2A);
    /* 2A */ s16 face_slot;
};

void EventFaceDeamonDelete(struct EventFaceDeamonProc * proc)
{
    EndFaceById(proc->face_slot);
}

int sub_0800F61C(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    WmStartTalk(proc->script[1]);
    proc->idle_func = EventEndTalk;

    if (proc->flags & EVENT_FLAG_NOSKIPTALK)
        SetTalkFlag(4);

    return EVENT_CMDRET_YIELD;
}

int sub_0800F65C(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    OpenWmTextBox(1);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F67C(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    OpenWmTextBox(0);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F69C(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    CloseWmTextBox();
    return EVENT_CMDRET_YIELD;
}

int sub_0800F6B8(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = SCR_LO16_SIGN(proc->script[2]);
    u16 c_raw = EVT_ARG_U16(proc, 5);
    int c = c_raw & 0x8000 ? -1 : c_raw;
    int d = proc->script[3];
    int e = proc->script[4];

    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        if (e != 0)
            WmMergeFace(e, 0, a, 0, b, c, d);
        else
            StartWmMuMove(a, b, c, d);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F730(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (!skipped)
    {
        if (b != 0)
            WmMergeFace(b, 1, a, 0, skipped, skipped, skipped);
        else
            EndWmMu(a);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F770(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    int c = proc->script[3];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (!skipped)
    {
        if (c != 0)
            WmMergeFace(c, 2, a, b, skipped, skipped, skipped);
        else
            StartWmSpriteAnim(a, b);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F7B8(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (skipped)
        return EVENT_CMDRET_CONTINUE;

    if (b != 0)
        WmMergeFace(b, 3, a, 0, skipped, skipped, skipped);
    else
        EndWmSpriteAnim(a);

    return EVENT_CMDRET_YIELD;
}

void sub_0800F7FC(struct EventProc * proc)
{
    proc->idle_func = NULL;
}

int sub_0800F804(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EndAllWmSpriteAnims();
    return EVENT_CMDRET_YIELD;
}

void sub_0800F820(struct EventProc * proc)
{
    proc->idle_func = NULL;
}

int sub_0800F828(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    WmMergeMonsters();
    return EVENT_CMDRET_YIELD;
}

int sub_0800F844(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (!skipped)
    {
        if (b != 0)
            WmMergeFace(b, 10, 0, 0, skipped, skipped, a);
        else
            StartWmPalFadeOut(a);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F884(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (!skipped)
    {
        if (b != 0)
            WmMergeFace(b, 9, 0, 0, skipped, skipped, a);
        else
            StartWmPalFadeIn(a);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F8C4(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (!skipped)
    {
        if (b != 0)
            WmMergeFace(b, 12, 0, 0, skipped, skipped, a);
        else
            WmMu_EndFlash(a);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F904(struct EventProc * proc)
{
    int a = proc->script[1];
    int b = proc->script[2];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (!skipped)
    {
        if (b != 0)
            WmMergeFace(b, 11, 0, 0, skipped, skipped, a);
        else
            WmMu_StartFlash(a);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F944(struct EventProc * proc)
{
    int a = SCR_LO16_SIGN(proc->script[1]);
    u16 b_raw = EVT_ARG_U16(proc, 3);
    int b = b_raw & 0x8000 ? -1 : b_raw;
    int c = proc->script[2];

    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        nullsub_5(a, b, c);

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F998(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        nullsub_6();

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800F9B0(struct EventProc * proc)
{
#if NONMATCHING
    int y_raw;
    EventScr const * script;
    int pal;
    int b;
    EventScr xr;
#else
    register EventScr const * script asm("r1");
    register int pal asm("r3");
    register int b asm("r2");
    register EventScr xr asm("r2");
    register int y_raw asm("r3");
#endif
    int a = proc->script[1];
    int x;
    int y;

    xr = proc->script[2];
    x = SCR_LO16_SIGN(xr);

    script = proc->script;
    y_raw = ((u16 const *) script)[5];
    y = y_raw & 0x8000 ? -1 : y_raw;
    pal = script[3];
    b = script[4];

    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        if (b != 0)
            WmMergeFace(b, 5, a, 0, x, y, pal);
        else
            StartWmIcon2(a, x, y, pal);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800FA30(struct EventProc * proc)
{
    int a = proc->script[1];

    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        EndWmIcon2(a);

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800FA50(struct EventProc * proc)
{
#if NONMATCHING
    int y_raw;
    EventScr const * script;
    int pal;
    int b;
    EventScr xr;
#else
    register EventScr const * script asm("r1");
    register int pal asm("r3");
    register int b asm("r2");
    register EventScr xr asm("r2");
    register int y_raw asm("r3");
#endif
    int a = proc->script[1];
    int x;
    int y;

    xr = proc->script[2];
    x = SCR_LO16_SIGN(xr);

    script = proc->script;
    y_raw = ((u16 const *) script)[5];
    y = y_raw & 0x8000 ? -1 : y_raw;
    pal = script[3];
    b = script[4];

    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        if (b != 0)
            WmMergeFace(b, 4, a, 0, x, y, pal);
        else
            StartWmIcon(a, x, y, pal);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800FAD0(struct EventProc * proc)
{
    int a = proc->script[1];

    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        EndWmIcon(a);

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800FAF0(struct EventProc * proc)
{
#if NONMATCHING
    EventScr const * script;
    int b;
#else
    register EventScr const * script asm("r3");
    register int b asm("r3");
#endif
    int x = SCR_LO16_SIGN(proc->script[1]);
    u16 y_raw;
    int y;
    int c;

    script = proc->script;
    y_raw = ((u16 const *) script)[3];
    y = y_raw & 0x8000 ? -1 : y_raw;
    c = script[2];
    b = script[3];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (b != 0)
        WmMergeFace(b, 8, 0, 0, x, y, c);
    else
        WmStartScrollCamera(x, y, c);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SetKeyIgnore(struct EventProc * proc)
{
    SetkeyStIgnoredMask(proc->script[1]);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SetFightScriptOverride(struct EventProc * proc)
{
    SetScriptedBattle((struct BattleHit *) proc->script[1]);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_ClearMenuOverrides(struct EventProc * proc)
{
    ClearMenuOverrides();
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MenuOverrideHide(struct EventProc * proc)
{
    SetMenuOverride(proc->script[1], 1, MenuAlwaysNotShown);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MenuOverrideDisable(struct EventProc * proc)
{
    SetMenuOverride(proc->script[1], 1, MenuAlwaysDisabled);
    SetMenuOverride(proc->script[1], 2, Get8);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MenuOverrideEnable(struct EventProc * proc)
{
    SetMenuOverride(proc->script[1], 1, MenuAlwaysEnabled);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_BoxTalk(struct EventProc * proc)
{
    u16 cfg = EVT_ARG_U16(proc, 1);
    u16 flags = 0;

    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        u16 y_raw;

        StartBoxDialogueSimple(SCR_LO16_SIGN(proc->script[1]), (y_raw = EVT_ARG_U16(proc, 3)) & 0x8000 ? -1 : y_raw, proc->script[2], 0);

        if (cfg & 1)
            flags |= 0x10;

        if (cfg & 2)
            flags |= 0x80;

        if (cfg & 4)
            flags |= 0x100;

        if (cfg & 8)
            flags |= 0x20;

        if (cfg != 0)
            SetDialogueBoxConfig(flags);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_BoxTalkByTactGender(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
    {
        u16 y_raw;

        if (!IsTactFemale())
            StartBoxDialogueSimple(SCR_LO16_SIGN(proc->script[1]), (y_raw = EVT_ARG_U16(proc, 3)) & 0x8000 ? -1 : y_raw, proc->script[2], 0);
        else
            StartBoxDialogueSimple(SCR_LO16_SIGN(proc->script[1]), (y_raw = EVT_ARG_U16(proc, 3)) & 0x8000 ? -1 : y_raw, proc->script[3], 0);
    }

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800FD34(struct EventProc * proc)
{
    if (!(proc->flags & EVENT_FLAG_SKIPPED))
        StartNoBoxTalk(NULL);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_TutorialCursorsTargetMove(struct EventProc * proc)
{
    StartTutorialCursors(0);
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_TutorialCursors(struct EventProc * proc)
{
    if (proc->script[1] == 0)
        StartTutorialCursors(1);
    else
        StartTutorialCursors(proc->script[1]);

    return EVENT_CMDRET_CONTINUE;
}

int sub_0800FD7C(struct EventProc * proc)
{
    EventScr const * script = (EventScr const *) proc->script[1];

    proc->script_return = proc->script_start;
    proc->script_return_pc = proc->script + 2;
    proc->script = script;
    proc->script_start = script;

    return EVENT_CMDRET_JUMPED;
}

int EventCD_Warp(struct EventProc * proc)
{
    int x = SCR_LO16_SIGN(proc->script[1]);
    u16 y_raw = EVT_ARG_U16(proc, 3);
    int y = y_raw & 0x8000 ? -1 : y_raw;
    int kind = proc->script[2];
    u16 skipped = proc->flags & EVENT_FLAG_SKIPPED;

    if (skipped)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_SLOWTALK)
        StartEventWarpAnim(proc, x, y, kind, skipped);
    else
        StartEventWarpAnim(proc, x, y, kind, 1);

    return EVENT_CMDRET_YIELD;
}

int sub_0800FE18(struct EventProc * proc)
{
    int kind = proc->script[2];
    struct Unit * unit = GetUnitFromCharId(proc->script[1]);
    u16 skipped;
    int x, y;

    if ((skipped = proc->flags & EVENT_FLAG_SKIPPED))
        return EVENT_CMDRET_CONTINUE;

    x = unit->xPos;
    y = unit->yPos;

    if (proc->flags & EVENT_FLAG_SLOWTALK)
        StartEventWarpAnim(proc, x, y, kind, skipped);
    else
        StartEventWarpAnim(proc, x, y, kind, 1);

    return EVENT_CMDRET_YIELD;
}

int sub_0800FE80(struct EventProc * proc)
{
    int x = SCR_LO16_SIGN(proc->script[1]);
    u16 y_raw = EVT_ARG_U16(proc, 3);
    int y = y_raw & 0x8000 ? -1 : y_raw;
    int kind = proc->script[2];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    StartWarpEffect_08020A64(proc, WmToScreenX(x) - 0x10, WmToScreenY(y) - 0x28, kind);
    return EVENT_CMDRET_YIELD;
}

void EventStartCgTalk(int msg, int kind, int flags, struct EventProc * proc)
{
    ApplySystemObjectsGraphics();
    InitTalk(0x80, 0, 1);
    EnableBgSync(BG0_SYNC_BIT);

    switch (kind)
    {
    case 0:
        StartCgText(3, 2, 0x14, 4, msg, (void *) OBJ_VRAM0 + 0x1000, -1, NULL);

    case 1:
        StartCgText(3, 0x12, 0x14, 4, msg, (void *) OBJ_VRAM0 + 0x1000, -1, NULL);
    }

    proc->idle_func = Event_CgTalkOnSkip;

    if (proc->flags & EVENT_FLAG_NOSKIPTALK)
        flags |= 0x40;

    if (proc->flags & EVENT_FLAG_SLOWTALK)
    {
        flags |= 0x2820;
        EventForceSlowTextSpeed(proc);
    }

    SetCgTextFlags(flags);
}

int EvtCmd_CgTalk(struct EventProc * proc)
{
    int flags = 0x400;
    int msg = proc->script[1];
    int kind = proc->script[2];

    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartCgTalk(msg, kind, flags, proc);
    return EVENT_CMDRET_YIELD;
}

int sub_0800FFD0(struct EventProc * proc)
{
    int msg = proc->script[1];
    int kind = proc->script[2];
    int flags = proc->script[3] | 0x400;

    proc->flags &= ~EVENT_FLAG_TEXTSKIPPED;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartCgTalk(msg, kind, flags, proc);
    return EVENT_CMDRET_YIELD;
}

int sub_08010010(struct EventProc * proc)
{
    int flags = 0x400;
    int msg = proc->script[1];
    int kind = proc->script[2];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->flags & EVENT_FLAG_TEXTSKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EventStartCgTalk(msg, kind, flags, proc);
    return EVENT_CMDRET_YIELD;
}

int sub_08010048(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    EndCgText();
    return EVENT_CMDRET_YIELD;
}

int EvtCmd_CgBackground(struct EventProc * proc)
{
    u16 id = EVT_ARG_U16(proc, 1);

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    if (proc->background == -1)
    {
        LockBmDisplay();
        LockMus();
    }

    proc->background = 0x61;

    PutCgBackground(gBg3Tm, GetBgChrOffset(3), 8, 8, id);
    EnableBgSync(BG3_SYNC_BIT);
    SetBgOffset(3, 0, 0);

    return EVENT_CMDRET_YIELD;
}

int sub_080100D0(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_PaletteFadeFromBlack(struct EventProc * proc)
{
    int kind = EVT_ARG_U16(proc, 1);

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    switch (kind)
    {
    case 0:
        NewBlockedFadeIn(0x10, proc);
        break;

    case 1:
        NewBlockedFadeIn(8, proc);
        break;

    case 2:
        NewBlockedFadeIn(4, proc);
        break;

    case 3:
        NewBlockedFadeIn(2, proc);
        break;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_PaletteFadeToBlack(struct EventProc * proc)
{
    int kind = EVT_ARG_U16(proc, 1);

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    switch (kind)
    {
    case 0:
        NewBlockedFadeOut(0x10, proc);
        break;

    case 1:
        NewBlockedFadeOut(8, proc);
        break;

    case 2:
        NewBlockedFadeOut(4, proc);
        break;

    case 3:
        NewBlockedFadeOut(2, proc);
        break;
    }

    return EVENT_CMDRET_YIELD;
}

void Event_CgTalkOnSkip(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EndCgText();
        sub_0800AF20(proc);
        proc->idle_func = NULL;
    }
    else if (!CgTextExists())
    {
        sub_0800AF20(proc);
        proc->idle_func = NULL;
    }
}
