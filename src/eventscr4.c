#include "gbafe.h"

/* functions from other modules */
ProcPtr Proc_FindNonBlocked(const struct ProcCmd * script);
ProcPtr sub_080046F4(int mark);
void SetTalkFlag(int talk_flags);
void ClearTalkFaceRefs(void);
void SetBgmVolume(int volume);
void SetWeather(int weather);
void StartSlowLockingFadeFromBlack(ProcPtr parent);
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
void sub_080B4F78(int a, int b, int c, int d);
void sub_080B5B44(int a, int b);
void sub_080B5B6C(void);
void sub_080B4D4C(int a, int b, u16 c);
void sub_080B4E88(int a, u16 b);
void sub_080B4FE4(int a);
void sub_080B3D20(int a);
void sub_080B3D78(void);
void sub_080B4904(int a, int b, int c, int d);
void sub_080B4ADC(int a);
void sub_080B39D8(int a, int b);
void sub_080B3AFC(int a);
void sub_080B3B70(void);
void sub_080B5844(int a);
void sub_080B5934(int a);
void sub_080B4890(int a);
void sub_080B4828(int a);
void nullsub_5(int a, int b, int c);
void nullsub_6(void);

extern struct FaceVramEnt CONST_DATA gFaceConfig_08B91AB8[];
extern EventScr CONST_DATA EventScr_08B91AD8[];
extern EventScr CONST_DATA EventScr_08B91AE8[];
extern EventScr CONST_DATA EventScr_08B91B10[];
extern EventScr CONST_DATA EventScr_08B91DF4[];
extern EventScr CONST_DATA EventScr_08B91E0C[];
extern EventScr CONST_DATA EventScr_08B91E28[];
extern EventScr CONST_DATA EventScr_08B91E40[];
extern EventScr CONST_DATA EventScr_08B91E4C[];
extern EventScr CONST_DATA EventScr_08B91E68[];

extern struct PopupInstruction CONST_DATA gPopup_08B91B34[];
extern struct PopupInstruction CONST_DATA gPopup_08B91B7C[];
extern struct PopupInstruction CONST_DATA gPopup_08B91BC4[];
extern struct PopupInstruction CONST_DATA gPopup_08B91BE4[];
extern struct PopupInstruction CONST_DATA gPopup_08B91C2C[];
extern struct PopupInstruction CONST_DATA gPopup_08B91C64[];
extern struct PopupInstruction CONST_DATA gPopup_08B91CBC[];
extern struct PopupInstruction CONST_DATA gPopup_08B91D04[];
extern struct PopupInstruction CONST_DATA gPopup_08B91D5C[];
extern struct PopupInstruction CONST_DATA gPopup_08B91DA4[];

extern struct ProcCmd CONST_DATA ProcScr_GiveItem[];

extern struct MusicPlayerInfo gUnk_03005D20;

struct GiveItemProc {
    /* 00 */ PROC_HEADER;
    STRUCT_PAD(0x29, 0x54);
    /* 54 */ struct Unit * unit;
    /* 58 */ int item;
};

#define EVT_ARG_U16(proc, n) (((u16 const *)(proc)->script)[n])

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
    return sub_080046F4(6) ? TRUE : FALSE;
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
        NewPopup_Simple(gPopup_08B91BE4, 0x60, 0, parent);
    else
        NewPopup_Simple(gPopup_08B91C2C, 0x60, 0, parent);
}

void StartPopup_800EE90(int num, ProcPtr parent)
{
    SetPopupNumber(num);
    NewPopup_Simple(gPopup_08B91BE4, 0x60, 0, parent);
}

void StartPopup_800EEB0(struct Unit * unit, u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (UNIT_FACTION(unit) == FACTION_BLUE)
        NewPopup_Simple(gPopup_08B91C64, 0x60, 0, parent);
    else
        NewPopup_Simple(gPopup_08B91CBC, 0x60, 0, parent);
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

void sub_080B5554(u8 a, int x, int y, int c);
void sub_080B55BC(int c);

int sub_0800F36C(struct EventProc * proc)
{
    int a = proc->script[1];
    int x = SCR_LO16_SIGN(proc->script[2]);
    int y = SCR_HI16_SIGN(proc->script[2]);
    int c = proc->script[3];

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    sub_080B5554(a, x, y, c);
    sub_080B55BC(c);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F3D4(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        return EVENT_CMDRET_CONTINUE;
    }

    StartSlowLockingFadeFromBlack(proc);
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

    sub_080B4F78(a, b, c, d);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F4EC(struct EventProc * proc)
{
    int a = SCR_LO16_SIGN(proc->script[1]);
    u16 b_raw = EVT_ARG_U16(proc, 3);
    int b = b_raw & 0x8000 ? -1 : b_raw;

    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    sub_080B5B44(a, b);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F540(struct EventProc * proc)
{
    sub_080B5B6C();

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

    sub_080B4FE4(proc->script[1]);
    proc->idle_func = EventEndTalk;

    if (proc->flags & EVENT_FLAG_NOSKIPTALK)
        SetTalkFlag(4);

    return EVENT_CMDRET_YIELD;
}

int sub_0800F65C(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    sub_080B3D20(1);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F67C(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    sub_080B3D20(0);
    return EVENT_CMDRET_YIELD;
}

int sub_0800F69C(struct EventProc * proc)
{
    if (proc->flags & EVENT_FLAG_SKIPPED)
        return EVENT_CMDRET_CONTINUE;

    sub_080B3D78();
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
            sub_080B4904(a, b, c, d);
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
            sub_080B4ADC(a);
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
            sub_080B39D8(a, b);
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
        sub_080B3AFC(a);

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

    sub_080B3B70();
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
            sub_080B5844(a);
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
            sub_080B5934(a);
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
            sub_080B4890(a);
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
            sub_080B4828(a);
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
