#include "gbafe.h"

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

extern struct EventListCmdInfo gEventListCmdInfoTable[];


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
ASM_FUNC("asm/nonmatching/code_080782FC.s");

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
ASM_FUNC("asm/nonmatching/code_08078760.s");
ASM_FUNC("asm/nonmatching/code_08078794.s");
ASM_FUNC("asm/nonmatching/code_080787F4.s");
ASM_FUNC("asm/nonmatching/code_08078820.s");
ASM_FUNC("asm/nonmatching/code_08078870.s");
ASM_FUNC("asm/nonmatching/code_08078888.s");
ASM_FUNC("asm/nonmatching/code_080788B0.s");
ASM_FUNC("asm/nonmatching/code_080788D8.s");
ASM_FUNC("asm/nonmatching/code_08078900.s");
ASM_FUNC("asm/nonmatching/code_08078928.s");
ASM_FUNC("asm/nonmatching/code_08078988.s");
ASM_FUNC("asm/nonmatching/code_080789B8.s");
ASM_FUNC("asm/nonmatching/code_080789FC.s");
ASM_FUNC("asm/nonmatching/code_08078A40.s");
ASM_FUNC("asm/nonmatching/code_08078A80.s");
ASM_FUNC("asm/nonmatching/code_08078AF4.s");
ASM_FUNC("asm/nonmatching/code_08078B4C.s");
ASM_FUNC("asm/nonmatching/code_08078BD0.s");
ASM_FUNC("asm/nonmatching/code_08078C14.s");
ASM_FUNC("asm/nonmatching/code_08078DFC.s");
ASM_FUNC("asm/nonmatching/code_08078E10.s");
ASM_FUNC("asm/nonmatching/code_08078E2C.s");
ASM_FUNC("asm/nonmatching/code_08078E54.s");
ASM_FUNC("asm/nonmatching/code_08078EB8.s");
ASM_FUNC("asm/nonmatching/code_08078EE0.s");
ASM_FUNC("asm/nonmatching/code_08078EFC.s");
ASM_FUNC("asm/nonmatching/code_08078F24.s");
ASM_FUNC("asm/nonmatching/code_08078F40.s");
ASM_FUNC("asm/nonmatching/code_08078F68.s");
ASM_FUNC("asm/nonmatching/code_08078F84.s");
ASM_FUNC("asm/nonmatching/code_08078FAC.s");
ASM_FUNC("asm/nonmatching/code_08078FBC.s");
ASM_FUNC("asm/nonmatching/code_08078FC8.s");
ASM_FUNC("asm/nonmatching/code_08079004.s");
ASM_FUNC("asm/nonmatching/code_0807905C.s");
ASM_FUNC("asm/nonmatching/code_080790B4.s");
ASM_FUNC("asm/nonmatching/code_080790B8.s");
ASM_FUNC("asm/nonmatching/code_080790BC.s");
ASM_FUNC("asm/nonmatching/code_080790C0.s");
ASM_FUNC("asm/nonmatching/code_080790C4.s");
ASM_FUNC("asm/nonmatching/code_08079104.s");
ASM_FUNC("asm/nonmatching/code_08079140.s");
ASM_FUNC("asm/nonmatching/code_08079180.s");
ASM_FUNC("asm/nonmatching/code_080791C0.s");
ASM_FUNC("asm/nonmatching/code_080791D0.s");
ASM_FUNC("asm/nonmatching/code_080791F0.s");
ASM_FUNC("asm/nonmatching/code_08079214.s");
ASM_FUNC("asm/nonmatching/code_08079280.s");
ASM_FUNC("asm/nonmatching/code_080792C4.s");
ASM_FUNC("asm/nonmatching/code_08079320.s");
ASM_FUNC("asm/nonmatching/code_08079368.s");
ASM_FUNC("asm/nonmatching/code_080793B0.s");
ASM_FUNC("asm/nonmatching/code_080793F8.s");
ASM_FUNC("asm/nonmatching/code_08079464.s");
ASM_FUNC("asm/nonmatching/code_08079514.s");
ASM_FUNC("asm/nonmatching/code_08079568.s");
ASM_FUNC("asm/nonmatching/code_08079624.s");
ASM_FUNC("asm/nonmatching/code_08079704.s");
ASM_FUNC("asm/nonmatching/code_08079734.s");
ASM_FUNC("asm/nonmatching/code_08079738.s");
ASM_FUNC("asm/nonmatching/code_0807973C.s");
ASM_FUNC("asm/nonmatching/code_08079740.s");
ASM_FUNC("asm/nonmatching/code_08079744.s");
ASM_FUNC("asm/nonmatching/code_08079748.s");
ASM_FUNC("asm/nonmatching/code_0807974C.s");
ASM_FUNC("asm/nonmatching/code_08079750.s");
ASM_FUNC("asm/nonmatching/code_08079754.s");
ASM_FUNC("asm/nonmatching/code_08079758.s");
ASM_FUNC("asm/nonmatching/code_0807975C.s");
ASM_FUNC("asm/nonmatching/code_08079760.s");
ASM_FUNC("asm/nonmatching/code_08079764.s");
ASM_FUNC("asm/nonmatching/code_08079798.s");
ASM_FUNC("asm/nonmatching/code_080797D4.s");
ASM_FUNC("asm/nonmatching/code_0807980C.s");
ASM_FUNC("asm/nonmatching/code_08079820.s");
ASM_FUNC("asm/nonmatching/code_08079858.s");
ASM_FUNC("asm/nonmatching/code_08079894.s");
ASM_FUNC("asm/nonmatching/code_080798D0.s");
ASM_FUNC("asm/nonmatching/code_080798E4.s");
ASM_FUNC("asm/nonmatching/code_080798F8.s");
ASM_FUNC("asm/nonmatching/code_08079910.s");
ASM_FUNC("asm/nonmatching/code_08079924.s");
ASM_FUNC("asm/nonmatching/code_0807992C.s");
ASM_FUNC("asm/nonmatching/code_08079930.s");
ASM_FUNC("asm/nonmatching/code_08079938.s");
ASM_FUNC("asm/nonmatching/code_0807993C.s");
ASM_FUNC("asm/nonmatching/code_08079954.s");
ASM_FUNC("asm/nonmatching/code_08079990.s");
ASM_FUNC("asm/nonmatching/code_080799C8.s");
ASM_FUNC("asm/nonmatching/code_08079A14.s");
ASM_FUNC("asm/nonmatching/code_08079A38.s");
ASM_FUNC("asm/nonmatching/code_08079A5C.s");
ASM_FUNC("asm/nonmatching/code_08079A90.s");
ASM_FUNC("asm/nonmatching/code_08079A9C.s");
