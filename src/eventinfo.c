#include "gbafe.h"

extern const u32 EvList_Ch00_TutorialA[];
extern const u32 EvList_Ch00_TutorialB[];
extern const u32 EvList_Ch00_TutorialC[];
extern const u32 EvList_Ch00_TutorialD[];
extern const u32 EvList_Ch01_TutorialA[];
extern const u32 EvList_Ch01_TutorialB[];
extern const u32 EvList_Ch01_TutorialC[];
extern const u32 EvList_Ch01_TutorialD[];
extern const u32 EvList_Ch02_TutorialA[];
extern const u32 EvList_Ch02_TutorialB[];
extern const u32 EvList_Ch02_TutorialC[];
extern const u32 EvList_Ch02_TutorialD[];
extern const u32 EvList_Ch03_TutorialA[];
extern const u32 EvList_Ch03_TutorialB[];
extern const u32 EvList_Ch03_TutorialC[];
extern const u32 EvList_Ch03_TutorialD[];
extern const u32 EvList_Ch04_TutorialA[];
extern const u32 EvList_Ch04_TutorialB[];
extern const u32 EvList_Ch04_TutorialC[];
extern const u32 EvList_Ch04_TutorialD[];
extern const u32 EvList_Ch05_TutorialA[];
extern const u32 EvList_Ch05_TutorialB[];
extern const u32 EvList_Ch05_TutorialC[];
extern const u32 EvList_Ch05_TutorialD[];
extern const u32 EvList_Ch06_TutorialA[];
extern const u32 EvList_Ch06_TutorialB[];
extern const u32 EvList_Ch06_TutorialC[];
extern const u32 EvList_Ch06_TutorialD[];
extern const u32 EvList_Ch07_TutorialA[];
extern const u32 EvList_Ch07_TutorialB[];
extern const u32 EvList_Ch07_TutorialC[];
extern const u32 EvList_Ch07_TutorialD[];
extern const u32 EvList_Ch08_TutorialA[];
extern const u32 EvList_Ch08_TutorialB[];
extern const u32 EvList_Ch08_TutorialC[];
extern const u32 EvList_Ch08_TutorialD[];
extern const u32 EvList_Ch09_TutorialA[];
extern const u32 EvList_Ch09_TutorialB[];
extern const u32 EvList_Ch09_TutorialC[];
extern const u32 EvList_Ch09_TutorialD[];
extern const u32 EvList_Ch0A_TutorialA[];
extern const u32 EvList_Ch0A_TutorialB[];
extern const u32 EvList_Ch0A_TutorialC[];
extern const u32 EvList_Ch0A_TutorialD[];
extern const u32 EvList_Ch0B_TutorialA[];
extern const u32 EvList_Ch0B_TutorialB[];
extern const u32 EvList_Ch0B_TutorialC[];
extern const u32 EvList_Ch0B_TutorialD[];

extern const EventScr EventScr_08CBFBFC[];
extern const EventScr EventScr_08CC0E50[];
extern const EventScr EventScr_08CC0E6C[];
extern const EventScr EventScr_08CC0E88[];
extern const EventScr EventScr_08CC0EA4[];
extern const EventScr EventScr_08CC0EC0[];
extern const EventScr EventScr_08CC0EDC[];

extern const EventScr EventScr_08CC0EF8[];
extern const EventScr EventScr_08CC0F14[];

extern const EventScr EventScr_08CC06D8[];
extern const EventScr EventScr_08CC06F4[];
extern const EventScr EventScr_08CC0708[];
extern const EventScr EventScr_08CC071C[];
extern const EventScr EventScr_08CC0738[];
extern const EventScr EventScr_08CC0754[];
extern const EventScr EventScr_08CC0768[];
extern const EventScr EventScr_08CC077C[];
extern const EventScr EventScr_08CC0790[];
extern const EventScr EventScr_08CC07A4[];
extern const EventScr EventScr_08CC07B8[];
extern const EventScr EventScr_08CC07CC[];
extern const EventScr EventScr_08CC07E0[];
extern const EventScr EventScr_08CC07F4[];
extern const EventScr EventScr_08CC0808[];
extern const EventScr EventScr_08CC081C[];
extern const EventScr EventScr_08CC0830[];
extern const EventScr EventScr_08CC0844[];
extern const EventScr EventScr_08CC0860[];
extern const EventScr EventScr_08CC0874[];
extern const EventScr EventScr_08CC0888[];
extern const EventScr EventScr_08CC089C[];
extern const EventScr EventScr_08CC08B0[];
extern const EventScr EventScr_08CC08C4[];
extern const EventScr EventScr_08CC08D8[];
extern const EventScr EventScr_08CC08EC[];
extern const EventScr EventScr_08CC0900[];
extern const EventScr EventScr_08CC0914[];

#define EVT_CMD_LO(cmd) (((cmd) & 0x0000FFFF))
#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)
#define EVT_CMD_B1(cmd) (((cmd) & 0x000000FF))
#define EVT_CMD_B2(cmd) (((cmd) & 0x0000FF00) >> 8)
#define EVT_CMD_B3(cmd) (((cmd) & 0x00FF0000) >> 16)
#define EVT_CMD_B4(cmd) (((cmd) & 0xFF000000) >> 24)

#define EVENT_NOSCRIPT 1

struct EventInfo
{
    /* 00 */ u32 const * listScript;
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

struct EventListCmdInfo
{
    /* 00 */ int (* func)(struct EventInfo * info);
    /* 04 */ int length;
};

struct EvCheck01
{
    /* 00 */ u32 unk0;
    /* 04 */ u32 script;
    /* 08 */ u16 flag;
};

struct EvCheck0F
{
    /* 00 */ u32 unk0;
    /* 04 */ u32 unk4;
    /* 08 */ u32 script;
    /* 0C */ u32 unkC;
};

struct EvCheck02
{
    /* 00 */ u32 unk0;
    /* 04 */ u32 script;
    /* 08 */ u32 unk8;
    /* 0C */ u32 unkC;
};

struct EvCheck04
{
    /* 00 */ u32 unk0;
    /* 04 */ u32 script;
    /* 08 */ u32 unk8;
    /* 0C */ s8 (* func)(struct EventInfo * info);
};

struct EvCheck07
{
    /* 00 */ u32 unk0;
    /* 04 */ u16 item;
    /* 06 */ u16 money;
    /* 08 */ u32 unk8;
};

struct EvCheck0E
{
    /* 00 */ u32 unk0;
    /* 04 */ u32 script;
    /* 08 */ s8 (* func)(struct EventInfo * info);
};

struct EvCheck0E_Area
{
    /* 00 */ u16 cmd;
    /* 02 */ u16 flag;
    /* 04 */ u8 const * list;
};

extern const struct EventListCmdInfo gEventListCmdInfoTable[];

struct TutorialEventEnt
{
    /* 00 */ u32 const * a;
    /* 04 */ u32 const * b;
    /* 08 */ u32 const * c;
    /* 0C */ u32 const * d;
};

extern const struct TutorialEventEnt gTutorialEventTable[];

bool sub_0807CEFC(void);
bool sub_0807821C(struct EventInfo * info);
void SetEventInfoFlag(struct EventInfo * info);
bool ShouldCallEndEvent(void);
void CallEndEvent(void);

struct BattleTalkEnt
{
    /* 00 */ u8 pid;
    /* 01 */ u8 chapter;
    /* 04 */ uintptr_t msg;   // message id, or an event (defeat lists)
    /* 08 */ u32 flag;
};

struct BattleTalkExtEnt
{
    /* 00 */ u8 pidA;
    /* 01 */ u8 pidB;
    /* 02 */ u8 chapter;
    /* 04 */ u32 msg;
    /* 08 */ uintptr_t event;
    /* 0C */ u32 flag;
};

struct DefeatTalkExtEnt
{
    /* 00 */ u8 pid;
    /* 01 */ u8 chapter;
    /* 04 */ u32 msg;
    /* 08 */ uintptr_t event;
    /* 0C */ u32 flag;
};

extern const struct BattleTalkExtEnt gBattleTalkExtList[];
extern struct BattleTalkEnt const gBattleTalkList[];
extern struct BattleTalkEnt const gTriangleAttackTalkList[];
extern const struct DefeatTalkExtEnt gDefeatTalkExtList[];
extern const struct BattleTalkEnt gDefeatTalkList[];
extern const struct BattleTalkEnt gDefeatTalkList_Tutorial[];

void sub_0807D7E0(void);
int LoadUnits(struct UnitDefinition const * units);
void sub_080799C8(void);
bool BattleIsTriangleAttack(void);
void UnitGetDeathDropLocation(struct Unit * unit, int * x, int * y);

struct ForceDeployEnt
{
    /* 00 */ u8 unk0;
    /* 01 */ u8 pid;
    /* 02 */ u8 pad[6];
};

struct HardBonusLevelEnt
{
    /* 00 */ u8 pid;
    /* 04 */ int levels;
};

extern u8 gPermanentFlagBits[];
extern u8 gChapterFlagBits[];
extern u8 const gFlagBitMaskLut[];
extern struct ForceDeployEnt const gForceDeployList[];
extern struct HardBonusLevelEnt const gHardBonusLevelList[];
extern u8 const gUnk_08CA0538[];

int IsTutorialDisabled(void);
bool8 CheckPermanentFlag(int flag);
bool CheckChapterFlag(int flag);

void sub_0800ADB8(void);
void sub_0800F028(u8 mapChangeId);
void sub_0800F044(u16 item, u8 mapChangeId);
void sub_0800F06C(int money, u8 mapChangeId);
void StartArmoryScreenOrphaned(struct Unit * unit, u16 * shopItems);
void StartVendorScreenOrphaned(struct Unit * unit, u16 * shopItems);
void StartSecretShopScreenOrphaned(struct Unit * unit, u16 * shopItems);

struct EventInfo * SearchAvailableEvent(struct EventInfo * info);
struct EventInfo * SearchNextAvailableEvent(struct EventInfo * info);
void StartEventFromInfo(struct EventInfo * info);
int GetSupportTalkSong(struct SupportTalkEnt const * it, u8 pidA, u8 pidB, int rank);
bool CheckWin(void);
void MaybeCallEndEvent(void);



void StartEventFromInfo(struct EventInfo * info)
{
    if (info->script != 0)
    {
        SetFlag(info->flag);

        if (info->script != EVENT_NOSCRIPT)
            StartEvent((void const *) info->script);
    }
}

void SetEventInfoFlag(struct EventInfo * info)
{
    SetFlag(info->flag);
}

struct EventInfo * SearchAvailableEvent(struct EventInfo * info)
{
    int cmd;

    info->script = 0;
    info->flag = 0;

    while (cmd = EVT_CMD_LO(info->listScript[0]),
        CheckFlag(EVT_CMD_HI(info->listScript[0])) || gEventListCmdInfoTable[cmd].func(info) != 1)
    {
        info->listScript += gEventListCmdInfoTable[cmd].length;
    }

    if (info->script)
        return info;

    return NULL;
}

struct EventInfo * SearchNextAvailableEvent(struct EventInfo * info)
{
    if (info != NULL)
    {
        int cmdId = EVT_CMD_LO(info->listScript[0]);
        info->listScript += gEventListCmdInfoTable[cmdId].length;

        return SearchAvailableEvent(info);
    }
    return NULL;
}

int EvCheck00_Always(struct EventInfo * info)
{
    return 1;
}

int EvCheck01_AFEV(struct EventInfo * info)
{
    if (CheckFlag(((struct EvCheck01 const *) info->listScript)->flag) != 0)
    {
        info->script = ((struct EvCheck01 const *) info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck01 const *) info->listScript)->unk0);
        return 1;
    }

    return 0;
}

int EvCheck0F_(struct EventInfo * info)
{
    int unk = EVT_CMD_LO(((struct EvCheck0F const *) info->listScript)->unkC);
    int unk2 = EVT_CMD_HI(((struct EvCheck0F const *) info->listScript)->unk0);

    if ((CheckFlag(unk2) == 0) && (CheckFlag(unk) != 0))
    {
        info->script = ((struct EvCheck0F const *) info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck0F const *) info->listScript)->unk0);
        return 1;
    }

    return 0;
}

bool sub_0807821C(struct EventInfo * info)
{
    u8 i = 0;
    u8 x = gBmSt.cursor.x;
    u8 y = gBmSt.cursor.y;
    struct EvCheck0E_Area const * ls = (void const *) info->listScript;
    u8 const * list = ls->list;

    if (list != NULL)
    {
        switch (ls->cmd)
        {
        case 0xF:
            for (; list[i * 4] != 0xFF; i++)
            {
                if (x == list[i * 4] && y == list[i * 4 + 1])
                    return TRUE;
            }
            break;

        case 0x10:
            if (gBmMapMovement[y][x] > 0x77)
                break;

            if (x < list[0] || y < list[1] || x > list[4] || y > list[5])
                break;

            return TRUE;

        default:
            return TRUE;
        }
    }
    else
    {
        if (x == gActiveUnit->xPos && y == gActiveUnit->yPos)
            return TRUE;
    }

    return FALSE;
}

int EvCheck10_(struct EventInfo * info)
{
    int unk = EVT_CMD_LO(((struct EvCheck0F const *) info->listScript)->unkC);
    int unk2 = EVT_CMD_HI(((struct EvCheck0F const *) info->listScript)->unk0);

    if ((CheckFlag(unk2) == 0) && (CheckFlag(unk) != 0))
    {
        info->script = ((struct EvCheck0F const *) info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck0F const *) info->listScript)->unk0);
        return 1;
    }

    return 0;
}
int EvCheck02_TURN(struct EventInfo * info)
{
    struct EvCheck02 const * ls = (void const *) info->listScript;

    int turn = EVT_CMD_B1(ls->unk8);
    int maxTurn = EVT_CMD_B2(ls->unk8);
    int faction = EVT_CMD_B3(ls->unk8);

    switch (ls->unkC)
    {
    case 1:
        if (gPlaySt.chapterModeIndex == 2 && !(gPlaySt.chapterStateBits & 0x40))
            break;

        return 0;

    case 2:
        if (gPlaySt.chapterModeIndex == 3 && !(gPlaySt.chapterStateBits & 0x40))
            break;

        return 0;

    case 3:
        if ((gPlaySt.chapterStateBits & 0x40) && gPlaySt.chapterModeIndex == 2)
            break;

        return 0;

    case 4:
        if ((gPlaySt.chapterStateBits & 0x40) && gPlaySt.chapterModeIndex == 3)
            break;

        return 0;

    case 5:
        if (gPlaySt.chapterStateBits & 0x40)
            break;

        return 0;

    default:
        goto check_turn;
    }

    if (CheckFlag(2))
        return 0;

check_turn:
    if (maxTurn == 0)
    {
        if (gPlaySt.chapterTurnNumber != turn)
            goto fail;

        if (gPlaySt.faction != faction)
            goto fail;

        goto success;
    }

    if (gPlaySt.chapterTurnNumber < turn)
        goto fail;

    if (gPlaySt.chapterTurnNumber > maxTurn)
        goto fail;

    if (gPlaySt.faction != faction)
        goto fail;

success:
    info->script = ((struct EvCheck02 const *) info->listScript)->script;
    info->flag = EVT_CMD_HI(((struct EvCheck02 const *) info->listScript)->unk0);
    return 1;

fail:
    return 0;
}

int EvCheck03_CHAR(struct EventInfo * info)
{
    struct EvCheck02 const * ls = (void const *) info->listScript;

    int pidA = EVT_CMD_B1(ls->unk8);
    int pidB = EVT_CMD_B2(ls->unk8);

    switch (EVT_CMD_B1(ls->unkC))
    {
    case 1:
        if (gPlaySt.chapterModeIndex != 2)
            return 0;

        break;

    case 2:
        if (gPlaySt.chapterModeIndex != 3)
            return 0;

        break;

    case 3:
        if (!CheckFlag(EVT_CMD_HI(ls->unkC)))
            return 0;

        break;
    }

    if ((info->pidA == pidA || pidA == 0) && info->pidB == pidB)
    {
        info->script = ((struct EvCheck02 const *) info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck02 const *) info->listScript)->unk0);
        return 1;
    }

    return 0;
}

int EvCheck04_CHARASM(struct EventInfo * info)
{
    struct EvCheck04 const * ls = (void const *) info->listScript;

    int pidA = EVT_CMD_B1(ls->unk8);
    int pidB = EVT_CMD_B2(ls->unk8);

    if (ls->func(info) != 0 && (info->pidA == pidA || pidA == 0) && info->pidB == pidB)
    {
        info->script = ((struct EvCheck04 const *) info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck04 const *) info->listScript)->unk0);
        return 1;
    }

    return 0;
}

int EvCheck05_LOCA(struct EventInfo * info)
{
    struct EvCheck02 const * ls = (void const *) info->listScript;

    int x = EVT_CMD_B1(ls->unk8);
    int y = EVT_CMD_B2(ls->unk8);
    int cmdId = EVT_CMD_B3(ls->unk8);

    info->givenMoney = 0;

    if ((x == info->xPos) && (y == info->yPos))
    {
        info->script = ls->script;
        info->flag = EVT_CMD_HI(ls->unk0);
        info->commandId = cmdId;

        if (cmdId == 0x12)
            info->givenItem = 0;

        return 1;
    }

    return 0;
}

int EvCheck06_VILL(struct EventInfo * info)
{
    int result = EvCheck05_LOCA(info);
    info->givenMoney = 3;
    return result;
}

int EvCheck07_CHES(struct EventInfo * info)
{
    struct EvCheck07 const * ls = (void const *) info->listScript;

    u8 x = EVT_CMD_B1(ls->unk8);
    int y = EVT_CMD_B2(ls->unk8);
    int cmdId = EVT_CMD_B3(ls->unk8);
    int money = EVT_CMD_B4(ls->unk8);

    if ((x == info->xPos) && (y == info->yPos))
    {
        info->script = 1;
        info->flag = EVT_CMD_HI(ls->unk0);
        info->commandId = cmdId;
        info->givenMoney = money;
        info->givenItem = ls->item;
        info->givenMoney = ls->money;

        return 1;
    }

    return 0;
}

int EvCheck08_DOOR(struct EventInfo * info)
{
    struct EvCheck02 const * ls = (void const *) info->listScript;

    int x = EVT_CMD_B1(ls->unk8);
    int y = EVT_CMD_B2(ls->unk8);
    int cmdId = EVT_CMD_B3(ls->unk8);
    int money = EVT_CMD_B4(ls->unk8);

    if ((x == info->xPos) && (y == info->yPos))
    {
        info->script = ls->script;
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(((struct EvCheck02 const *) info->listScript)->unk0);
        info->commandId = cmdId;
        info->givenMoney = money;

        return 1;
    }

    return 0;
}

int EvCheck09_(struct EventInfo * info)
{
    struct EvCheck02 const * ls = (void const *) info->listScript;

    int x = EVT_CMD_B1(ls->unk8);
    int y = EVT_CMD_B2(ls->unk8);
    int cmdId = EVT_CMD_B3(ls->unk8);
    int money = EVT_CMD_B4(ls->unk8);

    if ((x == info->xPos) && (y == info->yPos))
    {
        info->script = ls->script;
#if !NONMATCHING
        asm("":::"memory");
#endif
        info->flag = EVT_CMD_HI(((struct EvCheck02 const *) info->listScript)->unk0);
        info->commandId = cmdId;
        info->givenMoney = money;

        return 1;
    }

    return 0;
}

int EvCheck0A_SHOP(struct EventInfo * info)
{
    struct EvCheck02 const * ls = (void const *) info->listScript;

    int x = EVT_CMD_B1(ls->unk8);
    int y = EVT_CMD_B2(ls->unk8);
    int cmdId = EVT_CMD_B3(ls->unk8);

    if ((x == info->xPos) && (y == info->yPos))
    {
        if (cmdId != 0x15 || GetUnitItemSlot(gActiveUnit, 0x71) != -1)
        {
            info->script = ((struct EvCheck02 const *) info->listScript)->script;
            info->flag = EVT_CMD_HI(((struct EvCheck02 const *) info->listScript)->unk0);
            info->commandId = cmdId;
            return 1;
        }
    }

    return 0;
}

int EvCheck0B_AREA(struct EventInfo * info)
{
    s8 x = gActiveUnit->xPos;
    s8 y = gActiveUnit->yPos;

    s8 x1 = EVT_CMD_B1(((struct EvCheck02 const *) info->listScript)->unk8);
    s8 y1 = EVT_CMD_B2(((struct EvCheck02 const *) info->listScript)->unk8);
    s8 x2 = EVT_CMD_B3(((struct EvCheck02 const *) info->listScript)->unk8);
    s8 y2 = EVT_CMD_B4(((struct EvCheck02 const *) info->listScript)->unk8);

    if (x1 <= x && y1 <= y && x2 >= x && y2 >= y)
    {
        info->script = ((struct EvCheck02 const *) info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck02 const *) info->listScript)->unk0);
        return 1;
    }

    return 0;
}

int EvCheck0C_(struct EventInfo * info)
{
    if (gPlaySt.chapterModeIndex == 2 && !CheckFlag(2))
        return EvCheck0B_AREA(info);

    return 0;
}

int EvCheck0D_(struct EventInfo * info)
{
    if (gPlaySt.chapterModeIndex == 3 && !CheckFlag(2))
        return EvCheck0B_AREA(info);

    return 0;
}

int EvCheck0E_(struct EventInfo * info)
{
    if (((struct EvCheck0E const *) info->listScript)->func(info) != 0)
    {
        info->script = ((struct EvCheck0E const *) info->listScript)->script;
        info->flag = EVT_CMD_HI(((struct EvCheck0E const *) info->listScript)->unk0);
        return 1;
    }

    return 0;
}

bool EventInfoCheckTalk(struct EventInfo * info, u8 pidA, u8 pidB)
{
    if ((info->pidA == pidA) && (info->pidB == pidB))
    {
        info->script = info->listScript[1];
        info->flag = EVT_CMD_HI(info->listScript[0]);

        return TRUE;
    }

    return FALSE;
}
bool CheckActiveUnitArea(int x1, int y1, int x2, int y2)
{
    if ((gActiveUnit->xPos >= x1) && (gActiveUnit->xPos <= x2) && (gActiveUnit->yPos >= y1) && (gActiveUnit->yPos <= y2))
        return TRUE;

    return FALSE;
}

bool CheckAnyBlueUnitArea(int x1, int y1, int x2, int y2)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if ((unit->xPos >= x1) && (unit->xPos <= x2) && (unit->yPos >= y1) && (unit->yPos <= y2))
            return TRUE;
    }

    return FALSE;
}

bool CheckAnyBlueUnitArea1(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    if (CheckAnyBlueUnitArea(0, 15, 25, 23))
        return 0;

    return 1;
}

bool CheckAnyBlueUnitArea2(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    if (CheckAnyBlueUnitArea(0, 24, 16, 27))
        return 1;

    if (CheckAnyBlueUnitArea(0, 21, 2, 23))
        return 1;

    if (CheckAnyBlueUnitArea(3, 20, 5, 22))
        return 1;

    return 0;
}

bool CheckAnyBlueUnitArea3(void)
{
    return CheckAnyBlueUnitArea(12, 21, 31, 24);
}

bool CheckAnyBlueUnitArea4(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(17, 21, 31, 35);
}

bool CheckAnyBlueUnitArea5(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(0, 15, 8, 18);
}

bool CheckAnyBlueUnitArea6(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(0, 24, 12, 27);
}

bool CheckAnyBlueUnitArea7(void)
{
    if (gPlaySt.faction != FACTION_RED)
        return 0;

    return CheckAnyBlueUnitArea(21, 0, 30, 6);
}

bool CheckAnyRedUnitArea(int x1, int y1, int x2, int y2)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if ((unit->xPos >= x1) && (unit->xPos <= x2) && (unit->yPos >= y1) && (unit->yPos <= y2))
            return TRUE;
    }

    return FALSE;
}

bool CheckAvailableTurnEvent(void)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->turnBasedEvents;

    if (SearchAvailableEvent(&info))
        return TRUE;

    return FALSE;
}

void StartAvailableTurnEvents(void)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->turnBasedEvents;

    if (SearchAvailableEvent(&info))
    {
        StartEventFromInfo(&info);

        while (SearchNextAvailableEvent(&info))
            StartEventFromInfo(&info);
    }
}

bool CheckForCharacterEvents(u8 pidA, u8 pidB)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->characterBasedEvents;
    info.pidA = pidA;
    info.pidB = pidB;

    if (SearchAvailableEvent(&info))
        return TRUE;

    return FALSE;
}

void StartCharacterEvent(u8 pidA, u8 pidB)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->characterBasedEvents;
    info.pidA = pidA;
    info.pidB = pidB;

    if (SearchAvailableEvent(&info))
        StartEventFromInfo(&info);
}

void StartSupportTalk(u8 pidA, u8 pidB, int rank)
{
    u32 msg = 0;
    struct SupportTalkEnt const * it;

    for (it = gSupportTalkList; it->pidA != 0; it++)
    {
        if ((it->pidA == pidA && it->pidB == pidB) || (it->pidB == pidA && it->pidA == pidB))
        {
            if (rank == 1)
                msg = it->msg[0];

            if (rank == 2)
                msg = it->msg[1];

            if (rank == 3)
                msg = it->msg[2];

            break;
        }
    }

    if (msg != 0)
    {
        CallMapSupportEvent(msg, GetSupportTalkSong(it, pidA, pidB, rank));
        sub_0800ADB8();
        UpdateBestGlobalSupportValue(pidA, pidB, rank);
    }
}

void StartSupportViewerTalk(u8 pidA, u8 pidB, int rank)
{
    u32 msg = 0;
    struct SupportTalkEnt const * it;

    for (it = gSupportTalkList; it->pidA != 0; it++)
    {
        if ((it->pidA == pidA && it->pidB == pidB) || (it->pidB == pidA && it->pidA == pidB))
        {
            if (rank == 1)
                msg = it->msg[0];

            if (rank == 2)
                msg = it->msg[1];

            if (rank == 3)
                msg = it->msg[2];

            break;
        }
    }

    if (msg != 0)
    {
        CallSupportViewerEvent(msg);
        sub_0800ADB8();
    }
}

int GetSupportTalkSong(struct SupportTalkEnt const * ent, u8 pidA, u8 pidB, int rank)
{
    struct SupportTalkEnt const * it = ent;

    if (it == NULL)
    {
        for (it = gSupportTalkList; it->pidA != 0; it++)
        {
            if ((it->pidA == pidA && it->pidB == pidB) || (it->pidB == pidA && it->pidA == pidB))
                break;
        }
    }

    if (it->songs != 0)
    {
        switch ((it->songs >> ((rank - 1) * 8)) & 0xFF)
        {
        case 0:
            return 0;

        case 1:
            return 0x41;

        case 2:
            return 0x4C;

        case 3:
        case 4:
            return 0x6A;
        }
    }

    return 0;
}

int GetAvailableTileEventCommand(s8 x, s8 y)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = x;
    info.yPos = y;

    if (!SearchAvailableEvent(&info))
        return 0;

    return info.commandId;
}

void StartAvailableTileEvent(s8 x, s8 y)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = x;
    info.yPos = y;

    if (SearchAvailableEvent(&info) == NULL)
        return;

    switch (info.commandId)
    {
    case 0x0E:
    case 0x0F:
        StartEventFromInfo(&info);

        if (info.givenMoney != 3)
            break;

        // fallthrough

    case 0x1D:
        sub_0800F028(GetMapChangeIdAt(info.xPos, info.yPos));
        sub_0800ADB8();
        break;

    case 0x10:
    case 0x11:
        if (info.script == 1)
        {
            sub_0800F028(GetMapChangeIdAt(info.xPos, info.yPos));
            SetFlag(info.flag);
        }
        else
        {
            StartEventFromInfo(&info);
        }

        sub_0800ADB8();
        break;

    case 0x12:
        if (info.givenItem == 0)
        {
            sub_0800F028(GetMapChangeIdAt(info.xPos, info.yPos));
            StartEventFromInfo(&info);
        }
        else if (info.givenItem != 0x76)
        {
            sub_0800F044(info.givenItem, GetMapChangeIdAt(info.xPos, info.yPos));
        }
        else
        {
            sub_0800F06C(info.givenMoney, GetMapChangeIdAt(info.xPos, info.yPos));
        }

        sub_0800ADB8();
        SetFlag(info.flag);
        break;

    case 0x13:
        StartArmoryScreenOrphaned(gActiveUnit, (u16 *) info.script);
        break;

    case 0x14:
        StartVendorScreenOrphaned(gActiveUnit, (u16 *) info.script);
        break;

    case 0x15:
        StartSecretShopScreenOrphaned(gActiveUnit, (u16 *) info.script);
        break;

    case 0x16:
#if !NONMATCHING
        asm("nop");
#endif
        break;

    case 0x00:
#if !NONMATCHING
        asm("nop");
#endif
        break;
    }
}

void sub_08078DFC(s8 x, s8 y)
{
    StartAvailableTileEvent(x, y);
}

bool sub_08078E10(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == 0x0E)
        return TRUE;

    return FALSE;
}

void sub_08078E2C(s8 x, s8 y)
{
    if (sub_08078E10(x, y))
        StartAvailableTileEvent(x, y);
}

bool sub_08078E54(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == 0x13)
        return TRUE;

    if (GetAvailableTileEventCommand(x, y) == 0x14)
        return TRUE;

    if (GetAvailableTileEventCommand(x, y) == 0x15)
        if (GetUnitItemSlot(gActiveUnit, 0x71) != -1)
            return TRUE;

    if (GetAvailableTileEventCommand(x, y) == 0x16)
        return TRUE;

    return FALSE;
}

bool sub_08078E54(s8 x, s8 y);

void sub_08078EB8(s8 x, s8 y)
{
    if (sub_08078E54(x, y))
        StartAvailableTileEvent(x, y);
}

bool IsThereClosedChestAt(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == 0x12)
        return TRUE;

    return FALSE;
}

void StartAvailableChestTileEvent(s8 x, s8 y)
{
    if (IsThereClosedChestAt(x, y))
        StartAvailableTileEvent(x, y);
}

bool IsThereClosedDoorAt(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == 0x10)
        return TRUE;

    return FALSE;
}

void StartAvailableDoorTileEvent(s8 x, s8 y)
{
    if (IsThereClosedDoorAt(x, y))
        StartAvailableTileEvent(x, y);
}

bool sub_08078F68(s8 x, s8 y)
{
    if (GetAvailableTileEventCommand(x, y) == 0x11)
        return TRUE;

    return FALSE;
}

void sub_08078F84(s8 x, s8 y)
{
    if (sub_08078F68(x, y))
        StartAvailableTileEvent(x, y);
}

bool ShouldCallEndEvent(void)
{
    return CheckWin();
}

void MaybeCallEndEvent_(void)
{
    MaybeCallEndEvent();
}
s8 sub_08078FC8(void)
{
    struct EventInfo info;
    u16 chapter = gPlaySt.chapterIndex;

    info.listScript = gTutorialEventTable[chapter].a;

    if (chapter < 12 && SearchAvailableEvent(&info))
        StartEventFromInfo(&info);

    return 0;
}

s8 sub_08079004(void)
{
    struct EventInfo info;
    u16 chapter = gPlaySt.chapterIndex;

    info.listScript = gTutorialEventTable[chapter].c;

    if (chapter < 12 && SearchAvailableEvent(&info))
    {
        StartEventFromInfo(&info);

        if (chapter == 1 && sub_0807CEFC())
            return 1;
    }

    return 0;
}

s8 sub_0807905C(void)
{
    struct EventInfo info;
    u16 chapter = gPlaySt.chapterIndex;

    info.listScript = gTutorialEventTable[chapter].b;

    if (chapter < 12 && SearchAvailableEvent(&info))
    {
        if (sub_0807821C(&info) != 1)
        {
            StartEventFromInfo(&info);
            return 1;
        }

        SetEventInfoFlag(&info);
    }

    return 0;
}

s8 sub_080790B4(void)
{
    return 0;
}

s8 sub_080790B8(void)
{
    return 0;
}

s8 sub_080790BC(void)
{
    return 0;
}

s8 sub_080790C0(void)
{
    return 0;
}

s8 sub_080790C4(void)
{
    struct EventInfo info;
    u16 chapter = gPlaySt.chapterIndex;

    info.listScript = gTutorialEventTable[chapter].d;

    if (chapter < 12 && SearchAvailableEvent(&info))
        StartEventFromInfo(&info);

    return 0;
}

bool sub_08079104(void)
{
    struct EventInfo info;
    u16 chapter = gPlaySt.chapterIndex;

    info.listScript = gTutorialEventTable[chapter].d;

    if (chapter < 12 && SearchAvailableEvent(&info))
        return TRUE;

    return FALSE;
}

bool CheckForWaitEvents(void)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->miscBasedEvents;
    info.xPos = gActiveUnit->xPos;
    info.yPos = gActiveUnit->yPos;

    if (SearchAvailableEvent(&info))
        return TRUE;

    return FALSE;
}

void RunWaitEvents(void)
{
    struct EventInfo info;

    info.listScript = GetChapterEventInfo(gPlaySt.chapterIndex)->miscBasedEvents;
    info.xPos = gActiveUnit->xPos;
    info.yPos = gActiveUnit->yPos;

    if (SearchAvailableEvent(&info))
        StartEventFromInfo(&info);
}

bool CheckWin(void)
{
    return CheckFlag(3);
}

void MaybeCallEndEvent(void)
{
    if (!CheckFlag(3))
        return;

    if (!ShouldCallEndEvent())
        return;

    CallEndEvent();
}

void const * sub_080791F0(void)
{
    struct ChapterEventGroup const * group = GetChapterEventInfo(gPlaySt.chapterIndex);

    if (gPlaySt.chapterModeIndex == 3)
        return group->trapsHector;

    return group->traps;
}
void sub_08079214(void)
{
    struct EventInfo info;
    u32 const * group = (void const *) GetChapterEventInfo(gPlaySt.chapterIndex);

    info.flag = 0;

    if (gPlaySt.chapterIndex == 0x27)
        sub_0807D7E0();

    if (gPlaySt.chapterModeIndex == 3)
    {
        if (gPlaySt.chapterStateBits & 0x40)
        {
            info.script = group[0x24 / 4];
            LoadUnits((struct UnitDefinition const *) info.script);
        }
        else
        {
            info.script = group[0x20 / 4];
            LoadUnits((struct UnitDefinition const *) info.script);
        }
    }
    else
    {
        if (gPlaySt.chapterStateBits & 0x40)
        {
            info.script = group[0x1C / 4];
            LoadUnits((struct UnitDefinition const *) info.script);
        }
        else
        {
            info.script = group[0x18 / 4];
            LoadUnits((struct UnitDefinition const *) info.script);
        }
    }

    sub_080799C8();
    RefreshEntityMaps();
    RefreshUnitSprites();
}

struct UnitDefinition const * sub_08079280(void)
{
    u32 const * group = (void const *) GetChapterEventInfo(gPlaySt.chapterIndex);

    if (gPlaySt.chapterModeIndex == 3)
    {
        if (gPlaySt.chapterStateBits & 0x40)
            return (void const *) group[0x34 / 4];

        return (void const *) group[0x30 / 4];
    }

    if (gPlaySt.chapterStateBits & 0x40)
        return (void const *) group[0x2C / 4];

    return (void const *) group[0x28 / 4];
}

struct BattleTalkExtEnt const * sub_080792C4(u8 pidA, u8 pidB)
{
    struct BattleTalkExtEnt const * it = gBattleTalkExtList;

    if (gPlaySt.chapterStateBits & 0x80)
        return NULL;

    for (; it->pidB != 0; it++)
    {
        if ((pidA == it->pidA && pidB == it->pidB) || (pidA == it->pidB && pidB == it->pidA))
        {
            if (it->chapter == 0x43)
                return it;

            if (gPlaySt.chapterIndex == it->chapter)
                return it;
        }
    }

    return NULL;
}

struct BattleTalkEnt const * sub_08079320(u8 pid, struct BattleTalkEnt const * it)
{
    for (; it->pid != 0; it++)
    {
        if (CheckFlag(it->flag))
            continue;

        if (pid == it->pid)
        {
            if (it->chapter == 0x43)
                return it;

            if (gPlaySt.chapterIndex == it->chapter)
                return it;
        }
    }

    return NULL;
}

struct DefeatTalkExtEnt const * sub_08079368(u8 pid, struct DefeatTalkExtEnt const * it)
{
    for (; it->pid != 0; it++)
    {
        if (CheckFlag(it->flag))
            continue;

        if (pid == it->pid)
        {
            if (it->chapter == 0x43)
                return it;

            if (gPlaySt.chapterIndex == it->chapter)
                return it;
        }
    }

    return NULL;
}

struct BattleTalkEnt const * sub_080793B0(u8 pid, struct BattleTalkEnt const * it)
{
    for (; it->pid != 0; it++)
    {
        if (CheckFlag(it->flag))
            continue;

        if (pid == it->pid)
        {
            if (it->chapter == 0x43)
                return it;

            if (gPlaySt.chapterIndex == it->chapter)
                return it;
        }
    }

    return NULL;
}

bool CheckBattleTalk(u8 pidA, u8 pidB)
{
    struct BattleTalkExtEnt const * ent = sub_080792C4(pidA, pidB);

    if (ent != NULL)
    {
        if (CheckFlag(ent->flag))
            return FALSE;

        return TRUE;
    }

    if (sub_08079320(pidA, gBattleTalkList) != NULL)
        return TRUE;

    if (sub_08079320(pidB, gBattleTalkList) != NULL)
        return TRUE;

    if (sub_08079320(pidA, gTriangleAttackTalkList) != NULL && BattleIsTriangleAttack())
        return TRUE;

    return FALSE;
}

void StartBattleTalk(u8 pidA, u8 pidB)
{
    struct BattleTalkExtEnt const * ext = sub_080792C4(pidA, pidB);
    struct BattleTalkEnt const * ent;

    if (ext != NULL)
    {
        if (CheckFlag(ext->flag))
            return;

        if (ext->msg != 0)
            sub_0800ED78(ext->msg);
        else
            StartEvent(ext->event);

        sub_0800ADB8();
        SetFlag(ext->flag);
        return;
    }

    ent = sub_08079320(pidA, gBattleTalkList);

    if (ent != NULL)
    {
        if (ent->msg != 0)
        {
            sub_0800ED78(ent->msg);
            sub_0800ADB8();
        }

        SetFlag(ent->flag);
        return;
    }

    ent = sub_08079320(pidB, gBattleTalkList);

    if (ent != NULL)
    {
        if (ent->msg != 0)
        {
            sub_0800ED78(ent->msg);
            sub_0800ADB8();
        }

        SetFlag(ent->flag);
        return;
    }

    ent = sub_08079320(pidA, gTriangleAttackTalkList);

    if (ent != NULL && BattleIsTriangleAttack())
    {
        sub_0800ED78(ent->msg);
        sub_0800ADB8();
        SetFlag(ent->flag);
    }
}

bool CheckBattleDefeatTalk(u8 pid)
{
    struct BattleTalkEnt const * list;

    if (sub_08079368(pid, gDefeatTalkExtList) != NULL)
        return TRUE;

    list = gPlaySt.chapterModeIndex == 1 ? gDefeatTalkList_Tutorial : gDefeatTalkList;

    if (sub_080793B0(pid, list) != NULL)
        return TRUE;

    if (gPlaySt.chapterModeIndex != 1 && (pid == 0x0F || pid == 0x15))
        return TRUE;

    return FALSE;
}

void sub_08079568(u16 pid)
{
    struct Unit * unit;
    int i;
    int x;
    int y;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number != pid)
            continue;

        if (unit->state & US_DEAD)
            continue;

        PidStatsRecordDefeatInfo(pid, 0, 7);
        UnitKill(unit);
        SetUnitHp(unit, 0);

        if (gBattleActor.unit.index == unit->index)
            gBattleActor.unit = *unit;

        if (gBattleTarget.unit.index == unit->index)
            gBattleTarget.unit = *unit;

        if (unit->state & US_RESCUED)
            UnitDrop(GetUnit(unit->rescue), 0, 0);

        if (!(unit->state & US_RESCUING))
            return;

        UnitGetDeathDropLocation(unit, &x, &y);
        UnitDrop(unit, x, y);

        return;
    }
}

void DisplayDefeatTalkForPid(u8 pid)
{
    struct BattleTalkEnt const * list;
    struct BattleTalkEnt const * ent;
    struct DefeatTalkExtEnt const * ext;

    list = gPlaySt.chapterModeIndex == 1 ? gDefeatTalkList_Tutorial : gDefeatTalkList;

    ent = sub_080793B0(pid, list);

    if (ent != NULL)
    {
        if (ent->msg != 0)
            StartEvent((void const *) ent->msg);

        sub_0800ADB8();
        SetFlag(ent->flag);

        if (ent->flag == 0x65)
        {
            StartBgm(0x2B, NULL);
            gPlaySt.cfgDisableBgm = TRUE;
        }
        else if (UNIT_FACTION(GetUnitFromCharId(pid)) == FACTION_BLUE)
        {
            StartBgm(0x2C, NULL);
        }

        return;
    }

    ext = sub_08079368(pid, gDefeatTalkExtList);

    if (ext != NULL)
    {
        if (ext->msg != 0)
            sub_0800ED78(ext->msg);
        else if (ext->event != 0)
            StartEvent((void const *) ext->event);

        sub_0800ADB8();
        SetFlag(ext->flag);

        if (UNIT_FACTION(GetUnitFromCharId(pid)) == FACTION_BLUE)
            StartBgm(0x2C, NULL);
    }

    switch (pid)
    {
    case 0x0F:
        sub_08079568(0x15);
        break;

    case 0x15:
        sub_08079568(0x0F);
        break;
    }
}
void sub_08079704(void)
{
    SetFlag(0x65);
    StartBgm(0x2B, NULL);
    gPlaySt.cfgDisableBgm = TRUE;
    StartEvent(gEvent_GameOver);
}

s8 sub_08079734(void)
{
    return 0;
}

void sub_08079738(void)
{
}

void sub_0807973C(void)
{
}

s8 sub_08079740(void)
{
    return 0;
}

void sub_08079744(void)
{
}

s8 sub_08079748(void)
{
    return 0;
}

s8 sub_0807974C(void)
{
    return 0;
}

void sub_08079750(void)
{
}

void sub_08079754(void)
{
}

void sub_08079758(void)
{
}

void sub_0807975C(void)
{
}

void sub_08079760(void)
{
}

void SetChapterFlag(int flag)
{
    if (flag == 0)
        return;

    flag = flag - 1;

    gChapterFlagBits[flag / 8] |= gFlagBitMaskLut[flag % 8];
}

bool CheckChapterFlag(int flag)
{
    if (flag == 0)
        return FALSE;

    flag = flag - 1;

    if ((gChapterFlagBits[flag / 8] & gFlagBitMaskLut[flag % 8]) != 0)
        return TRUE;

    return FALSE;
}

void ClearChapterFlag(int flag)
{
    u8 mask;

    if (flag == 0)
        return;

    flag = flag - 1;

    mask = ~gFlagBitMaskLut[flag % 8];
    gChapterFlagBits[flag / 8] = mask & gChapterFlagBits[flag / 8];
}

void ResetChapterFlags(void)
{
    int i;

    for (i = 0; i < 6; i++)
        gChapterFlagBits[i] = 0;
}

void SetPermanentFlag(int flag)
{
    if (flag < 100)
        return;

    if (flag == 100)
        return;

    flag = flag - 100 - 1;

    gPermanentFlagBits[flag / 8] |= gFlagBitMaskLut[flag % 8];
}

bool8 CheckPermanentFlag(int flag)
{
    if (flag < 100 || flag == 100)
        return FALSE;

    flag = flag - 100 - 1;

    if ((gPermanentFlagBits[flag / 8] & gFlagBitMaskLut[flag % 8]) != 0)
        return TRUE;

    return FALSE;
}

void ClearPermanentFlag(int flag)
{
    u8 mask;

    if (flag < 100)
        return;

    if (flag == 100)
        return;

    flag = flag - 100 - 1;

    mask = ~gFlagBitMaskLut[flag % 8];
    gPermanentFlagBits[flag / 8] = mask & gPermanentFlagBits[flag / 8];
}

void ResetPermanentFlags(void)
{
    int i;

    for (i = 0; i < 8; i++)
        gPermanentFlagBits[i] = 0;
}

void SetFlag(int flag)
{
    if (flag < 100)
        SetChapterFlag(flag);
    else
        SetPermanentFlag(flag);
}

bool CheckFlag(int flag)
{
    if (flag < 100)
        return CheckChapterFlag(flag);
    else
        return CheckPermanentFlag(flag);
}

void ClearFlag(int flag)
{
    if (flag < 100)
        ClearChapterFlag(flag);
    else
        ClearPermanentFlag(flag);
}

u8 * GetPermanentFlagBits(void)
{
    return gPermanentFlagBits;
}

int GetPermanentFlagBitsSize(void)
{
    return 8;
}

u8 * GetChapterFlagBits(void)
{
    return gChapterFlagBits;
}

int GetChapterFlagBitsSize(void)
{
    return 6;
}

u8 CheckDifficultMode(void)
{
    if (gPlaySt.chapterStateBits & 0x40)
        return TRUE;

    return FALSE;
}

bool sub_08079954(struct Unit * unit)
{
    struct ForceDeployEnt const * it = gForceDeployList;

    for (; it->unk0 != 0; it++)
    {
        if (unit->pCharacterData->number == it->pid && (unit->state & US_BIT16))
            return TRUE;
    }

    return FALSE;
}

int sub_08079990(u8 pid)
{
    struct HardBonusLevelEnt const * it;

    for (it = gHardBonusLevelList; it->pid != 0; it++)
    {
        if (it->pid == pid)
            return it->levels;
    }

    return GetChapterInfo(gPlaySt.chapterIndex)->hard_bonus_levels;
}

void sub_080799C8(void)
{
    int i;

    if (!(gPlaySt.chapterStateBits & 0x40))
        return;

    if (gPlaySt.chapterModeIndex != 3)
        return;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);
        int levels;

        if (!UNIT_IS_VALID(unit))
            continue;

        levels = sub_08079990(unit->pCharacterData->number);

        if (levels != 0)
            UnitApplyBonusLevels(unit, levels);
    }
}

bool sub_08079A14(struct Unit * unit)
{
    u8 const * it = gUnk_08CA0538;
    int pid = unit->pCharacterData->number;

    for (; *it != 0; it++)
    {
        if (*it == pid)
            return TRUE;
    }

    return FALSE;
}

void CallEndEvent(void)
{
    StartEvent(GetChapterEventInfo(gPlaySt.chapterIndex)->endingSceneEvents);
    SetFlag(0x91);
}

s8 sub_08079A5C(void)
{
    int ret = 0;

    if (!(gPlaySt.chapterStateBits & 0x40) && !IsTutorialDisabled())
        ret = CheckFlag(0x9C) != 0;

    return ret;
}

void sub_08079A90(void)
{
    SetFlag(0x8F);
}

bool sub_08079A9C(void)
{
    if (CheckFlag(0x8F))
        return TRUE;

    return FALSE;
}

SECTION(".rodata.08C9F16C")
const struct BattleTalkEnt gDefeatTalkList_Tutorial[] = {
    { .pid = 3, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0808, .flag = 0x65 },
    { .pid = 0x9E, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0844, .flag = 0x65 },
    { .pid = 0x17, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0754 },
    { .pid = 0x18, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0768 },
    { .pid = 0x1D, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0790 },
    { .pid = 0xD, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC06F4 },
    { .pid = 0x23, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC07A4 },
    { .pid = 0x26, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC07B8 },
    { .pid = 8, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC06D8 },
    { .pid = 0x11, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC071C },
    { .pid = 0x13, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0738 },
    { .pid = 0x1C, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC077C },
    { .pid = 0x10, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0708 },
    { .pid = 0x2C, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC07CC },
    { 0 },
    { 0 },
};

SECTION(".rodata.08C9F22C")
const struct BattleTalkEnt gDefeatTalkList[] = {
    { .pid = 1, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC07E0, .flag = 0x65 },
    { .pid = 2, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC07F4, .flag = 0x65 },
    { .pid = 0x2D, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC081C, .flag = 0x65 },
    { .pid = 0x28, .chapter = 0x10, .msg = (uintptr_t) EventScr_08CC089C, .flag = 0x65 },
    { .pid = 0x28, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0888 },
    { .pid = 0x7A, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0830, .flag = 0x65 },
    { .pid = 0xC, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0860, .flag = 0x65 },
    { .pid = 0x29, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0874, .flag = 0x65 },
    { .pid = 0x1A, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC08B0 },
    { .pid = 0x27, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC08C4 },
    { .pid = 0xB, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC08D8 },
    { .pid = 0x25, .chapter = 0x1C, .msg = (uintptr_t) EventScr_08CC0900 },
    { .pid = 0x25, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC08EC },
    { .pid = 0x26, .chapter = 0x43, .msg = (uintptr_t) EventScr_08CC0914 },
    { 0 },
    { 0 },
};

SECTION(".rodata.08C9EDA0")
const struct BattleTalkExtEnt gBattleTalkExtList[] = {
    { .pidA = 0x8E, .pidB = 3, .chapter = 0x43, .msg = 0x8D3, .flag = 6 },
    { .pidA = 0x8E, .pidB = 0x1D, .chapter = 0x43, .msg = 0x8D4, .flag = 7 },
    { .pidA = 0xBE, .pidB = 3, .chapter = 0x43, .msg = 0x9D2, .flag = 0xA },
    { .pidA = 0xBE, .pidB = 0x17, .chapter = 0x43, .msg = 0x9D3, .flag = 0xB },
    { .pidA = 0xBE, .pidB = 0x18, .chapter = 0x43, .msg = 0x9D4, .flag = 0xC },
    { .pidA = 0xBE, .pidB = 0x2C, .chapter = 0x43, .msg = 0x9D5, .flag = 0xD },
    { .pidA = 0xC5, .pidB = 3, .chapter = 0x43, .msg = 0x9E2, .flag = 6 },
    { .pidA = 0xC5, .pidB = 0x17, .chapter = 0x43, .msg = 0x9E3, .flag = 7 },
    { .pidA = 0xC5, .pidB = 0x18, .chapter = 0x43, .msg = 0x9E4, .flag = 8 },
    { .pidA = 0x3D, .pidB = 2, .chapter = 0x43, .msg = 0xA15, .flag = 9 },
    { .pidA = 0x3D, .pidB = 0x23, .chapter = 0x43, .msg = 0xA16, .flag = 9 },
    { .pidA = 0x40, .pidB = 1, .chapter = 0x43, .msg = 0xA58, .flag = 0xA },
    { .pidA = 0x40, .pidB = 2, .chapter = 0x43, .msg = 0xA59, .flag = 0xB },
    { .pidA = 0x45, .pidB = 1, .chapter = 0x43, .msg = 0xA8D, .flag = 0xB },
    { .pidA = 0x45, .pidB = 2, .chapter = 0x43, .msg = 0xA8E, .flag = 0xC },
    { .pidA = 0x4B, .pidB = 1, .chapter = 0x43, .msg = 0xB66, .flag = 9 },
    { .pidA = 0x4B, .pidB = 2, .chapter = 0x43, .msg = 0xB67, .flag = 0xA },
    { .pidA = 0x4B, .pidB = 0x2D, .chapter = 0x43, .msg = 0xB68, .flag = 0xB },
    { .pidA = 0x4B, .pidB = 6, .chapter = 0x43, .msg = 0xB69, .flag = 0xC },
    { .pidA = 0x4D, .pidB = 1, .chapter = 0x43, .msg = 0xBBE, .flag = 8 },
    { .pidA = 0x4D, .pidB = 2, .chapter = 0x43, .msg = 0xBBF, .flag = 9 },
    { .pidA = 0x4D, .pidB = 0x2D, .chapter = 0x43, .msg = 0xBC0, .flag = 0xA },
    { .pidA = 0x4F, .pidB = 1, .chapter = 0x43, .msg = 0xBF9, .flag = 0xD },
    { .pidA = 0x50, .pidB = 0x20, .chapter = 0x1C, .msg = 0xC1A, .flag = 9 },
    { .pidA = 0x63, .pidB = 1, .chapter = 0x1F, .msg = 0xC85, .flag = 0xC },
    { .pidA = 0x63, .pidB = 2, .chapter = 0x1F, .msg = 0xC86, .flag = 0xD },
    { .pidA = 0x64, .pidB = 1, .chapter = 0x20, .msg = 0xCB1, .flag = 0xE },
    { .pidA = 0x64, .pidB = 2, .chapter = 0x20, .msg = 0xCB2, .flag = 0xF },
    { .pidA = 0x2B, .pidB = 0x20, .chapter = 0x22, .msg = 0xD1D, .flag = 9 },
    { .pidA = 0x51, .pidB = 0x24, .chapter = 0x25, .msg = 0xD83, .flag = 0xB },
    { .pidA = 0x51, .pidB = 0x14, .chapter = 0x25, .msg = 0xD84, .flag = 0xC },
    { .pidA = 0x5B, .pidB = 0x14, .chapter = 0x26, .msg = 0xDB3, .flag = 8 },
    { .pidA = 0x5B, .pidB = 0x24, .chapter = 0x26, .msg = 0xDB4, .flag = 9 },
    { .pidA = 0x66, .pidB = 0x24, .chapter = 0x27, .msg = 0xDD5, .flag = 0x21 },
    { .pidA = 0x65, .pidB = 0x24, .chapter = 0x27, .msg = 0xDD6, .flag = 0x21 },
    { .pidA = 0x66, .pidB = 0x14, .chapter = 0x27, .msg = 0xDD7, .flag = 0x22 },
    { .pidA = 0x66, .pidB = 0x36, .chapter = 0x27, .msg = 0xDD9, .flag = 0x23 },
    { .pidA = 0x65, .pidB = 0x36, .chapter = 0x27, .msg = 0xDDA, .flag = 0x23 },
    { .pidA = 0x66, .pidB = 1, .chapter = 0x27, .msg = 0xDDB, .flag = 0x24 },
    { .pidA = 0x65, .pidB = 1, .chapter = 0x27, .msg = 0xDDC, .flag = 0x24 },
    { .pidA = 0x66, .pidB = 2, .chapter = 0x27, .msg = 0xDDD, .flag = 0x25 },
    { .pidA = 0x65, .pidB = 2, .chapter = 0x27, .msg = 0xDDE, .flag = 0x25 },
    { .pidA = 0xF4, .pidB = 0x36, .chapter = 0x2E, .msg = 0xEF5, .flag = 0x1B },
    { .pidA = 0xF4, .pidB = 0x14, .chapter = 0x2E, .msg = 0xEF6, .flag = 0x1C },
    { .pidA = 0xF5, .pidB = 0x36, .chapter = 0x2E, .msg = 0xEF8, .flag = 0x1D },
    { .pidA = 0xF5, .pidB = 0x14, .chapter = 0x2E, .msg = 0xEF9, .flag = 0x1E },
    { .pidA = 0xF7, .pidB = 0x36, .chapter = 0x2E, .msg = 0xEFC, .flag = 0x1F },
    { .pidA = 0xF6, .pidB = 0x36, .chapter = 0x2E, .msg = 0xEFE, .flag = 0x20 },
    { .pidA = 0xF6, .pidB = 0x14, .chapter = 0x2E, .msg = 0xEFF, .flag = 0x21 },
    {
        .pidA = 0x44,
        .pidB = 1,
        .chapter = 0x2E,
        .event = (uintptr_t) EventScr_08CC0EF8,
        .flag = 0x22,
    },
    {
        .pidA = 0x44,
        .pidB = 2,
        .chapter = 0x2E,
        .event = (uintptr_t) EventScr_08CC0F14,
        .flag = 0x23,
    },
    { .pidA = 0x44, .pidB = 0x2D, .chapter = 0x2E, .msg = 0xF10, .flag = 0x24 },
    { .pidA = 0x44, .pidB = 0x27, .chapter = 0x2E, .msg = 0xF11, .flag = 0x25 },
    { .pidA = 0x44, .pidB = 0x12, .chapter = 0x2E, .msg = 0xF12, .flag = 0x26 },
    { .pidA = 0x44, .pidB = 0x24, .chapter = 0x2E, .msg = 0xF13, .flag = 0x27 },
    { .pidA = 0x44, .pidB = 0x14, .chapter = 0x2E, .msg = 0xF14, .flag = 0x28 },
    { 0 },
};

SECTION(".rodata.08C9F2EC")
const struct DefeatTalkExtEnt gDefeatTalkExtList[] = {
    { .pid = 4, .chapter = 0x43, .msg = 0x7DA },
    { .pid = 5, .chapter = 0x43, .msg = 0x7EB },
    { .pid = 6, .chapter = 0x43, .msg = 0x7D1 },
    { .pid = 7, .chapter = 0x43, .msg = 0x7F2 },
    { .pid = 8, .chapter = 0x43, .msg = 0x7C9 },
    { .pid = 9, .chapter = 0x43, .msg = 0x7CA },
    { .pid = 0xB, .chapter = 0x43, .msg = 0x7CD },
    { .pid = 0x2E, .chapter = 0x43, .msg = 0x7D7 },
    { .pid = 0xE, .chapter = 0x43, .msg = 0x7CC },
    { .pid = 0xF, .chapter = 0x43, .msg = 0x7ED },
    { .pid = 0x10, .chapter = 0x43, .msg = 0x7D9 },
    { .pid = 0x11, .chapter = 0x43, .msg = 0x7CF },
    { .pid = 0x12, .chapter = 0x43, .msg = 0x7FC },
    { .pid = 0x13, .chapter = 0x43, .msg = 0x7D3 },
    { .pid = 0x14, .chapter = 0x43, .event = (uintptr_t) EventScr_08CC0E50 },
    { .pid = 0x15, .chapter = 0x1D, .msg = 0xC3A, .flag = 0x65 },
    { .pid = 0x15, .chapter = 0x43, .msg = 0x7EF, .flag = 0x7D },
    { .pid = 0x16, .chapter = 0x43, .event = (uintptr_t) EventScr_08CC0E6C },
    { .pid = 0x2F, .chapter = 0x43, .msg = 0x7D5 },
    { .pid = 0x30, .chapter = 0x43, .msg = 0x7D6 },
    { .pid = 0x19, .chapter = 0x43, .msg = 0x7C6 },
    { .pid = 0x1A, .chapter = 0x43, .msg = 0x7C7 },
    { .pid = 0x1B, .chapter = 0x43, .msg = 0x7D4 },
    { .pid = 0x32, .chapter = 0x43, .event = (uintptr_t) EventScr_08CC0E88 },
    { .pid = 0x31, .chapter = 0x43, .msg = 0x7D8 },
    { .pid = 0x1E, .chapter = 0x43, .msg = 0x7DE },
    { .pid = 0x1F, .chapter = 0x43, .msg = 0x7EC },
    { .pid = 0x20, .chapter = 0x43, .msg = 0x7E3 },
    { .pid = 0x21, .chapter = 0x43, .msg = 0x7F7, .flag = 0x89 },
    { .pid = 0x2B, .chapter = 0x43, .msg = 0x7F7, .flag = 0x89 },
    { .pid = 0x22, .chapter = 0x1D, .msg = 0x7E7, .flag = 0x81 },
    { .pid = 0x22, .chapter = 0x1E, .msg = 0x7E7, .flag = 0x81 },
    { .pid = 0x22, .chapter = 0x43, .event = (uintptr_t) EventScr_08CC0EA4 },
    { .pid = 0x23, .chapter = 0x43, .msg = 0x7D0 },
    { .pid = 0x24, .chapter = 0x43, .msg = 0x7F4, .flag = 0x82 },
    { .pid = 0x25, .chapter = 0x43, .msg = 0x7E1 },
    { .pid = 0x26, .chapter = 0x43, .msg = 0x7FA },
    { .pid = 0x27, .chapter = 0x43, .msg = 0x7FD },
    { .pid = 0x28, .chapter = 0x43, .msg = 0x7D2 },
    { .pid = 0x2C, .chapter = 0x43, .msg = 0x7EA },
    { .pid = 0x33, .chapter = 0x15, .msg = 0xB20, .flag = 0x88 },
    { .pid = 0x33, .chapter = 0x43, .msg = 0x7DD, .flag = 0x88 },
    { .pid = 0x34, .chapter = 0x43, .msg = 0x7E6 },
    { .pid = 0x36, .chapter = 0x43, .msg = 0x7DF },
    { .pid = 0x37, .chapter = 0x43, .msg = 0x7F8 },
    { .pid = 0x38, .chapter = 0x43, .msg = 0x7F1 },
    { .pid = 0x87, .msg = 0x832, .flag = 2 },
    { .pid = 0x89, .chapter = 1, .msg = 0x873, .flag = 2 },
    { .pid = 0x8D, .chapter = 2, .msg = 0x8A2, .flag = 2 },
    { .pid = 0x8E, .chapter = 3, .msg = 0x8D5, .flag = 2 },
    { .pid = 0x94, .chapter = 4, .msg = 0x8F6, .flag = 2 },
    { .pid = 0x99, .chapter = 5, .msg = 0x921, .flag = 2 },
    { .pid = 0x9F, .chapter = 6, .msg = 0x975, .flag = 2 },
    { .pid = 0xA6, .chapter = 7, .msg = 0x99A, .flag = 2 },
    { .pid = 0xAD, .chapter = 8, .msg = 0x9AD, .flag = 2 },
    { .pid = 0xB6, .chapter = 9, .msg = 0x9BC, .flag = 2 },
    { .pid = 0xBE, .chapter = 0xA, .msg = 0x9D7, .flag = 2 },
    { .pid = 0xC5, .chapter = 0xB, .msg = 0x9E6, .flag = 2 },
    { .pid = 0x3C, .chapter = 0xC, .msg = 0xA06, .flag = 2 },
    { .pid = 0x3D, .chapter = 0xD, .msg = 0xA17, .flag = 2 },
    { .pid = 0x3F, .chapter = 0xE, .msg = 0xA33, .flag = 2 },
    { .pid = 0x40, .chapter = 0xF, .msg = 0xA5A, .flag = 2 },
    { .pid = 0x41, .chapter = 0x10, .msg = 0xA67, .flag = 2 },
    { .pid = 0x45, .chapter = 0x11, .msg = 0xA8F, .flag = 2 },
    { .pid = 0x46, .chapter = 0x12, .msg = 0xA9E, .flag = 2 },
    { .pid = 0x47, .chapter = 0x13, .msg = 0xACB, .flag = 2 },
    { .pid = 0x48, .chapter = 0x14, .msg = 0xAF9, .flag = 2 },
    { .pid = 0x49, .chapter = 0x15, .msg = 0xB1D, .flag = 2 },
    { .pid = 0x4A, .chapter = 0x16, .msg = 0xB43, .flag = 2 },
    { .pid = 0x4B, .chapter = 0x17, .msg = 0xB6A, .flag = 2 },
    { .pid = 0x3B, .chapter = 0x18, .msg = 0xB8B, .flag = 0xA },
    { .pid = 0x4C, .chapter = 0x18, .msg = 0xB8C, .flag = 2 },
    { .pid = 0x5C, .chapter = 0x19, .msg = 0xBA1, .flag = 2 },
    { .pid = 0x4D, .chapter = 0x1A, .msg = 0xBC1, .flag = 2 },
    { .pid = 0x4F, .chapter = 0x1B, .msg = 0xBFB, .flag = 2 },
    { .pid = 0x50, .chapter = 0x1C, .msg = 0xC1B, .flag = 2 },
    { .pid = 0x54, .chapter = 0x1D, .msg = 0xC3B, .flag = 0xF },
    { .pid = 0x53, .chapter = 0x1D, .msg = 0xC3C, .flag = 0x10 },
    { .pid = 0x3B, .chapter = 0x1E, .msg = 0xC58, .flag = 2 },
    { .pid = 0x63, .chapter = 0x1F, .msg = 0xC87, .flag = 2 },
    { .pid = 0x64, .chapter = 0x20, .msg = 0xCB3, .flag = 2 },
    { .pid = 0x57, .chapter = 0x21, .msg = 0xCFE, .flag = 2 },
    { .pid = 0x2B, .chapter = 0x22, .msg = 0xD1E, .flag = 2 },
    { .pid = 0x58, .chapter = 0x23, .msg = 0xD43, .flag = 2 },
    { .pid = 0x59, .chapter = 0x24, .msg = 0xD60, .flag = 2 },
    { .pid = 0x51, .chapter = 0x25, .msg = 0xD85, .flag = 2 },
    { .pid = 0x5B, .chapter = 0x26, .msg = 0xDB5, .flag = 2 },
    { .pid = 0x66, .chapter = 0x27, .msg = 0xDE1, .flag = 2 },
    { .pid = 0x65, .chapter = 0x27, .msg = 0xDE2, .flag = 2 },
    { .pid = 0x5D, .chapter = 0x28, .event = (uintptr_t) EventScr_08CC0EC0, .flag = 2 },
    { .pid = 0x5E, .chapter = 0x29, .event = (uintptr_t) EventScr_08CC0EDC, .flag = 2 },
    { .pid = 0x60, .chapter = 0x2A, .msg = 0xE4B, .flag = 2 },
    { .pid = 0x85, .chapter = 0x2C, .msg = 0xE98, .flag = 2 },
    { .pid = 0x3B, .chapter = 0x2D, .msg = 0xEAD, .flag = 2 },
    { .pid = 0x44, .chapter = 0x2E, .event = (uintptr_t) EventScr_08CBFBFC, .flag = 2 },
    { .pid = 0xF4, .chapter = 0x2E, .msg = 0xF03, .flag = 0x13 },
    { .pid = 0xF5, .chapter = 0x2E, .msg = 0xF04, .flag = 0x14 },
    { .pid = 0xFA, .chapter = 0x2E, .msg = 0xF05, .flag = 0x15 },
    { .pid = 0xF7, .chapter = 0x2E, .msg = 0xF06, .flag = 0x16 },
    { .pid = 0xF6, .chapter = 0x2E, .msg = 0xF07, .flag = 0x17 },
    { .pid = 0x56, .chapter = 0x2E, .msg = 0xF08, .flag = 0x18 },
    { .pid = 0xF8, .chapter = 0x2E, .msg = 0xF09, .flag = 0x19 },
    { .pid = 0xF9, .chapter = 0x2E, .msg = 0xF0A, .flag = 0x1A },
    { .pid = 0x86, .chapter = 0x2F, .msg = 0xF61, .flag = 2 },
    { .pid = 0x75, .chapter = 0x14, .flag = 0xE },
    { .pid = 0x76, .chapter = 0x14, .flag = 0xF },
    { .pid = 0x77, .chapter = 0x14, .flag = 0x10 },
    { .pid = 0x7C, .chapter = 0x23, .flag = 9 },
    { .pid = 0x7D, .chapter = 0x23, .flag = 0xA },
    { .pid = 0x7E, .chapter = 0x23, .flag = 0xB },
    { 0 },
    { 0 },
};

SECTION(".rodata.08C9EA2C")
const struct TutorialEventEnt gTutorialEventTable[] = {
    {
        .a = EvList_Ch00_TutorialA,
        .b = EvList_Ch00_TutorialB,
        .c = EvList_Ch00_TutorialC,
        .d = EvList_Ch00_TutorialD,
    },
    {
        .a = EvList_Ch01_TutorialA,
        .b = EvList_Ch01_TutorialB,
        .c = EvList_Ch01_TutorialC,
        .d = EvList_Ch01_TutorialD,
    },
    {
        .a = EvList_Ch02_TutorialA,
        .b = EvList_Ch02_TutorialB,
        .c = EvList_Ch02_TutorialC,
        .d = EvList_Ch02_TutorialD,
    },
    {
        .a = EvList_Ch03_TutorialA,
        .b = EvList_Ch03_TutorialB,
        .c = EvList_Ch03_TutorialC,
        .d = EvList_Ch03_TutorialD,
    },
    {
        .a = EvList_Ch04_TutorialA,
        .b = EvList_Ch04_TutorialB,
        .c = EvList_Ch04_TutorialC,
        .d = EvList_Ch04_TutorialD,
    },
    {
        .a = EvList_Ch05_TutorialA,
        .b = EvList_Ch05_TutorialB,
        .c = EvList_Ch05_TutorialC,
        .d = EvList_Ch05_TutorialD,
    },
    {
        .a = EvList_Ch06_TutorialA,
        .b = EvList_Ch06_TutorialB,
        .c = EvList_Ch06_TutorialC,
        .d = EvList_Ch06_TutorialD,
    },
    {
        .a = EvList_Ch07_TutorialA,
        .b = EvList_Ch07_TutorialB,
        .c = EvList_Ch07_TutorialC,
        .d = EvList_Ch07_TutorialD,
    },
    {
        .a = EvList_Ch08_TutorialA,
        .b = EvList_Ch08_TutorialB,
        .c = EvList_Ch08_TutorialC,
        .d = EvList_Ch08_TutorialD,
    },
    {
        .a = EvList_Ch09_TutorialA,
        .b = EvList_Ch09_TutorialB,
        .c = EvList_Ch09_TutorialC,
        .d = EvList_Ch09_TutorialD,
    },
    {
        .a = EvList_Ch0A_TutorialA,
        .b = EvList_Ch0A_TutorialB,
        .c = EvList_Ch0A_TutorialC,
        .d = EvList_Ch0A_TutorialD,
    },
    {
        .a = EvList_Ch0B_TutorialA,
        .b = EvList_Ch0B_TutorialB,
        .c = EvList_Ch0B_TutorialC,
        .d = EvList_Ch0B_TutorialD,
    },
};

SECTION(".rodata.08C9E9A4")
const struct EventListCmdInfo gEventListCmdInfoTable[] = {
    { .func = EvCheck00_Always, .length = 1 },
    { .func = EvCheck01_AFEV, .length = 3 },
    { .func = EvCheck02_TURN, .length = 4 },
    { .func = EvCheck03_CHAR, .length = 4 },
    { .func = EvCheck04_CHARASM, .length = 4 },
    { .func = EvCheck05_LOCA, .length = 3 },
    { .func = EvCheck06_VILL, .length = 3 },
    { .func = EvCheck07_CHES, .length = 3 },
    { .func = EvCheck08_DOOR, .length = 3 },
    { .func = EvCheck09_, .length = 3 },
    { .func = EvCheck0A_SHOP, .length = 3 },
    { .func = EvCheck0B_AREA, .length = 3 },
    { .func = EvCheck0C_, .length = 3 },
    { .func = EvCheck0D_, .length = 3 },
    { .func = EvCheck0E_, .length = 3 },
    { .func = EvCheck0F_, .length = 4 },
    { .func = EvCheck10_, .length = 4 },
};
