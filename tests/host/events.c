// Host test for the event list readers (src/eventinfo.c), run by tools/hostevents.py.
//
// Linked with the host build of eventinfo.c, the chapter data and the converted event
// lists (src/events), where an event cell is 8 bytes.  Prints, for every chapter, the
// entries of its four event lists as the reader's own step (gEventListCmdInfoTable
// lengths, in cells) finds them, and the answers SearchAvailableEvent gives for a few
// queries.  tools/hostevents.py computes the same lines by walking the 32-bit lists
// in the built ROM and compares.

#include "gbafe.h"

extern int printf(const char * fmt, ...);

struct EventInfo * SearchAvailableEvent(struct EventInfo * info);

struct EventListCmdInfo
{
    int (* func)(struct EventInfo * info);
    int length;
};
extern const struct EventListCmdInfo gEventListCmdInfoTable[];

// stubs for the game state the readers look at (the flags are the real ones, eventinfo.c)
const unsigned char gFlagBitMaskLut[8] = { 1, 2, 4, 8, 0x10, 0x20, 0x40, 0x80 };
static struct Unit sActiveUnit;
struct Unit * gActiveUnit = &sActiveUnit;

int GetUnitItemSlot(struct Unit * unit, int item)
{
    return 0;
}

// entries of these kinds only need CheckFlag and the coordinates in the EventInfo
#define POS_CMDS ((1 << 1) | (1 << 5) | (1 << 6) | (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10))

#define LO(c) ((unsigned)(c) & 0xFFFF)
#define HI(c) (((unsigned)(c) >> 16) & 0xFFFF)
#define B(c, n) (((unsigned)(c) >> (8 * (n))) & 0xFF)

static const char * const kListNames[4] = { "turn", "char", "loc", "misc" };

static int WalkList(int ch, int li, const EventListScr * list)
{
    int k = 0;
    int mask = 0;

    for (;;)
    {
        unsigned cmd = LO(list[0]);
        int len = gEventListCmdInfoTable[cmd].length;

        if (cmd == 0)
            break;

        printf("E ch=%02X %s %d cmd=%X flag=%X len=%d", ch, kListNames[li], k, cmd, HI(list[0]), len);

        switch (cmd)
        {
        case 1:
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
            printf(" c2=%X", (unsigned)list[2]);
            break;

        case 2:
        case 3:
            printf(" c2=%X c3=%X", (unsigned)list[2], (unsigned)list[3]);
            break;

        case 7:
            printf(" c1=%X c2=%X", (unsigned)list[1], (unsigned)list[2]);
            break;
        }

        printf("\n");
        mask |= 1 << cmd;
        list += len;
        k++;
    }

    return mask;
}

// the answer of a search, in the format tools/hostevents.py writes
static void PrintResult(const EventListScr * list, struct EventInfo * info)
{
    const EventListScr * e = info->listScript;
    unsigned cmd = LO(e[0]);
    const EventListScr * w;
    int idx;

    // the entry number (the entries are 1 to 4 cells long)
    for (idx = 0, w = list; w != e; w += gEventListCmdInfoTable[LO(w[0])].length)
        idx++;

    printf(" idx=%d", idx);

    if (cmd == 1)
        printf(" flag=%X", info->flag);
    else
        printf(" cmd=%X cid=%X flag=%X", cmd, info->commandId, info->flag);

    printf(" script=%s", info->script == 0 ? "null" : info->script == 1 ? "noscript" : "ptr");

    if (info->script > 1)
        printf(" first=%X", LO(*(const EventScr *)info->script));

    if (cmd == 7)
        printf(" item=%X money=%X", info->givenItem, info->givenMoney);
    else if (cmd >= 5 && cmd <= 9)
        printf(" money=%X", info->givenMoney);

    printf("\n");
}

static void QueryPos(int ch, const EventListScr * list)
{
    const EventListScr * e;
    int k = 0;

    for (e = list; LO(e[0]) != 0; e += gEventListCmdInfoTable[LO(e[0])].length, k++)
    {
        unsigned cmd = LO(e[0]);
        struct EventInfo info;

        if (cmd < 5 || cmd > 9)
            continue;

        info.listScript = list;
        info.xPos = B(e[2], 0);
        info.yPos = B(e[2], 1);

        printf("Q ch=%02X loc from=%d ->", ch, k);

        if (SearchAvailableEvent(&info) == NULL)
            printf(" none\n");
        else
            PrintResult(list, &info);
    }
}

static void QueryAfev(int ch, const EventListScr * list)
{
    const EventListScr * e;
    int k = 0;

    for (e = list; LO(e[0]) != 0; e += gEventListCmdInfoTable[LO(e[0])].length, k++)
    {
        struct EventInfo info;
        unsigned flag = LO(e[2]);

        SetFlag(flag);
        info.listScript = list;

        printf("Q ch=%02X misc afev=%d ->", ch, k);

        if (SearchAvailableEvent(&info) == NULL)
            printf(" none\n");
        else
            PrintResult(list, &info);

        ClearFlag(flag);
    }
}


int main(void)
{
    int i;
    static const EventScr cells[2] = { 0x0D | ((EventScr)0x1234 << 16), 0xABCD | ((EventScr)0x5678 << 16) };

    // halfwords of a script: half k & 1 of cell k / 2
    printf("H %X %X %X\n", EVT_HALF(cells, 1), EVT_HALF(cells, 2), EVT_HALF(cells, 3));

    for (i = 0; i < 0x43; i++)
    {
        int id = gChapterDataTable[i].mapEventDataId;
        const struct ChapterEventGroup * g;
        const EventListScr * lists[4];
        int j;

        if (id == 0 || gChapterDataAssetTable[id] == NULL)
            continue;

        g = gChapterDataAssetTable[id];
        lists[0] = g->turnBasedEvents;
        lists[1] = g->characterBasedEvents;
        lists[2] = g->locationBasedEvents;
        lists[3] = g->miscBasedEvents;

        printf("C ch=%02X id=%02X\n", i, id);

        for (j = 0; j < 4; j++)
        {
            int mask;

            if (lists[j] == NULL)
                continue;

            mask = WalkList(i, j, lists[j]);

            if (j == 2 && (mask & ~POS_CMDS) == 0)
                QueryPos(i, lists[j]);

            if (j == 3 && (mask & ~(1 << 1)) == 0)
                QueryAfev(i, lists[j]);
        }
    }

    return 0;
}
