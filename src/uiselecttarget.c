#include "gbafe.h"

enum
{
    TARGETSELECTION_FLAG_GAMELOCK = (1 << 0),
    TARGETSELECTION_FLAG_FROZEN = (1 << 6),
};

enum
{
    TARGETSELECTION_ACTION_ENDFAST = (1 << 0),
    TARGETSELECTION_ACTION_END = (1 << 1),
    TARGETSELECTION_ACTION_SE_6A = (1 << 2),
    TARGETSELECTION_ACTION_SE_6B = (1 << 3),
    TARGETSELECTION_ACTION_CLEARBGS = (1 << 4),
    TARGETSELECTION_ACTION_ENDFACE = (1 << 5),
};

struct SelectTargetProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ const struct SelectInfo * selectRoutines;
    /* 30 */ struct SelectTarget * currentTarget;
    /* 34 */ u8 flags;
    /* 38 */ u8 (* onAPress)(ProcPtr, struct SelectTarget *);
};

struct NearTargetLinkOffset
{
    s8 x, y;
};

extern struct Vec2 sSelectTargetRoot;
extern struct SelectTarget sSelectTargetList[];
extern int sSelectTargetCount;


void TargetSelection_HandleMoveInput(struct SelectTargetProc * proc);
int TargetSelection_HandleSelectInput(struct SelectTargetProc * proc);
struct SelectTarget * GetLinkedTargets(void);

void TargetSelection_Loop(struct SelectTargetProc * proc);

CONST_DATA struct ProcCmd ProcScr_TargetSelection[] = {
    PROC_LABEL(0),
    PROC_SLEEP(1),
    PROC_REPEAT(TargetSelection_Loop),
    PROC_SLEEP(1),
    PROC_CALL(RefreshBMapGraphics),
    PROC_GOTO(0),
    PROC_END,
};

CONST_DATA struct NearTargetLinkOffset gNearTargetLinkOrder[13] = {
    { 0, 0 },
    { 0, -2 },
    { 0, -1 },
    { 1, -1 },
    { 1, 0 },
    { 2, 0 },
    { 1, 1 },
    { 0, 1 },
    { 0, 2 },
    { -1, 1 },
    { -1, 0 },
    { -2, 0 },
    { -1, -1 },
};

void BeginTargetList(int x, int y)
{
    sSelectTargetRoot.x = x;
    sSelectTargetRoot.y = y;
    sSelectTargetCount = 0;
}

void EnlistTarget(int x, int y, int uid, int extra)
{
    sSelectTargetList[sSelectTargetCount].x = x;
    sSelectTargetList[sSelectTargetCount].y = y;
    sSelectTargetList[sSelectTargetCount].uid = uid;
    sSelectTargetList[sSelectTargetCount].extra = extra;

    sSelectTargetCount++;
}

inline int CountTargets(void)
{
    return sSelectTargetCount;
}

inline struct SelectTarget * GetTarget(int n)
{
    return &sSelectTargetList[n];
}

void LinkTargets(void)
{
    int i, last;

    for (i = 0; i < CountTargets(); i++)
    {
        GetTarget(i)->prev = GetTarget(i - 1);
        GetTarget(i)->next = GetTarget(i + 1);
    }

    last = CountTargets() - 1;

    GetTarget(0)->prev = GetTarget(last);
    GetTarget(last)->next = GetTarget(0);
}

void TargetSelection_GetRealCursorPosition(struct SelectTargetProc * proc, int * x, int * y)
{
    *x = proc->currentTarget->x * 16;
    *y = proc->currentTarget->y * 16;
}

void TargetSelection_Loop(struct SelectTargetProc * proc)
{
    int x, y;
    int actions;

    if (proc->flags & TARGETSELECTION_FLAG_FROZEN)
    {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        PutMapCursor(x, y, 4);
        return;
    }

    TargetSelection_HandleMoveInput(proc);

    actions = TargetSelection_HandleSelectInput(proc);

    if (actions & TARGETSELECTION_ACTION_END)
        EndTargetSelection(proc);

    if (actions & TARGETSELECTION_ACTION_SE_6A)
        PlaySoundEffect(0x38A);

    if (actions & TARGETSELECTION_ACTION_SE_6B)
        PlaySoundEffect(0x38B);

    if (actions & TARGETSELECTION_ACTION_CLEARBGS)
        ClearUi();

    if (actions & TARGETSELECTION_ACTION_ENDFACE)
        EndFaceById(0);

    if (!(actions & TARGETSELECTION_ACTION_ENDFAST))
    {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);

        if (EnsureCameraOntoPosition(proc, x >> 4, y >> 4) != 1)
            PutMapCursor(x, y, 2);
    }
}

ProcPtr StartMapSelect(const struct SelectInfo * info)
{
    struct SelectTargetProc * proc;

    LockGame();
    proc = Proc_Start(ProcScr_TargetSelection, PROC_TREE_3);

    proc->flags = TARGETSELECTION_FLAG_GAMELOCK;
    proc->selectRoutines = info;
    proc->currentTarget = GetLinkedTargets();
    proc->onAPress = NULL;

    if (proc->selectRoutines->onInit)
        proc->selectRoutines->onInit(proc);

    if (proc->selectRoutines->onUnk08)
        proc->selectRoutines->onUnk08(proc);

    if (proc->selectRoutines->onSwitchIn)
        proc->selectRoutines->onSwitchIn(proc, proc->currentTarget);

    gpKeySt->pressed = 0;

    return proc;
}

ProcPtr NewTargetSelection_Specialized(const struct SelectInfo * info, u8 (* onSelect)(ProcPtr, struct SelectTarget *))
{
    struct SelectTargetProc * proc = StartMapSelect(info);

    proc->onAPress = onSelect;
}

ProcPtr EndTargetSelection(ProcPtr proc)
{
    if (((struct SelectTargetProc *) proc)->selectRoutines->onEnd)
        ((struct SelectTargetProc *) proc)->selectRoutines->onEnd(proc);

    if (((struct SelectTargetProc *) proc)->flags & TARGETSELECTION_FLAG_GAMELOCK)
        UnlockGame();

    Proc_End(proc);

    return ((struct SelectTargetProc *) proc)->proc_parent;
}

void TargetSelection_HandleMoveInput(struct SelectTargetProc * proc)
{
    struct SelectTarget * current = proc->currentTarget;

    if ((DPAD_LEFT | DPAD_UP) & gpKeySt->repeated)
    {
        if (current->next != NULL)
            proc->currentTarget = current->next;
    }

    if ((DPAD_RIGHT | DPAD_DOWN) & gpKeySt->repeated)
    {
        if (proc->currentTarget->prev)
            proc->currentTarget = proc->currentTarget->prev;
    }

    if (proc->currentTarget == current)
        return;

    if (proc->selectRoutines->onSwitchOut)
        proc->selectRoutines->onSwitchOut(proc, current);

    if (proc->selectRoutines->onSwitchIn)
        proc->selectRoutines->onSwitchIn(proc, proc->currentTarget);

    PlaySoundEffect(0x387);
}

int TargetSelection_HandleSelectInput(struct SelectTargetProc * proc)
{
    int ret = 0;

    if (A_BUTTON & gpKeySt->pressed)
    {
        if (proc->onAPress)
            ret = proc->onAPress(proc, proc->currentTarget);
        else if (proc->selectRoutines->onSelect)
            ret = proc->selectRoutines->onSelect(proc, proc->currentTarget);
    }
    else if (B_BUTTON & gpKeySt->pressed)
    {
        if (proc->selectRoutines->onCancel)
            ret = proc->selectRoutines->onCancel(proc, proc->currentTarget);
    }
    else if (R_BUTTON & gpKeySt->pressed)
    {
        if (proc->selectRoutines->onHelp)
            ret = proc->selectRoutines->onHelp(proc, proc->currentTarget);
    }

    return ret;
}

void FreezeTargetSelection(void)
{
    struct SelectTargetProc * proc = Proc_Find(ProcScr_TargetSelection);

    if (proc)
        proc->flags |= TARGETSELECTION_FLAG_FROZEN;
}

void ResumeTargetSelection(void)
{
    struct SelectTargetProc * proc = Proc_Find(ProcScr_TargetSelection);

    if (proc)
        proc->flags &= ~TARGETSELECTION_FLAG_FROZEN;
}

int GetFurthestTargetDistance(void)
{
    int i, result = 0;
    struct SelectTarget * it = sSelectTargetList;

    for (i = 0; i < CountTargets(); i++, it++)
    {
        int distance = ABS(sSelectTargetRoot.x - it->x) + ABS(sSelectTargetRoot.y - it->y);

        if (result < distance)
            result = distance;
    }

    return result;
}

struct SelectTarget * GetLinkedTargetsNear(void)
{
    int i, j;

    struct SelectTarget * first = NULL;
    struct SelectTarget * last = NULL;

    for (i = 0; i < (int) ARRAY_COUNT(gNearTargetLinkOrder); i++)
    {
        struct SelectTarget * it;

        int x = sSelectTargetRoot.x + gNearTargetLinkOrder[i].x;
        int y = sSelectTargetRoot.y + gNearTargetLinkOrder[i].y;

        for (j = 0, it = sSelectTargetList; j < sSelectTargetCount; j++, it++)
        {
            if (x == it->x && y == it->y)
            {
                it->next = last;

                if (last != NULL)
                    last->prev = it;

                if (first == NULL)
                    first = it;

                last = it;
            }
        }
    }

    first->next = last;
    last->prev = first;

    return first;
}

struct SelectTarget * GetLinkedTargetsFar(void)
{
    LinkTargets();
    return sSelectTargetList;
}

struct SelectTarget * GetLinkedTargets(void)
{
    if (GetFurthestTargetDistance() > 2)
        return GetLinkedTargetsFar();

    return GetLinkedTargetsNear();
}
