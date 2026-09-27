#include "gbafe.h"

struct BmxfadeProc {
    PROC_HEADER;

    /* 29 */ u8 _pad29[0x4C - 0x29];
    /* 4C */ s16 counter;
    /* 4E */ s16 game_lock;
};

void Destruct6CBMXFADE(struct BmxfadeProc * proc);
void bmxfade_init(struct BmxfadeProc * proc);
void bmxfade_loop(struct BmxfadeProc * proc);

CONST_DATA struct ProcCmd sProcScr_BMXFADE[] = {
    PROC_19,
    PROC_END_IF_DUPLICATE,
    PROC_SET_END_CB(Destruct6CBMXFADE),
    PROC_CALL(bmxfade_init),
    PROC_CALL(bmxfade_loop),
    PROC_REPEAT(bmxfade_loop),
    PROC_END,
};

void bmxfade_init(struct BmxfadeProc * proc)
{
    proc->counter = 0x10;

    InitBmBgLayers();

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);
}

void bmxfade_loop(struct BmxfadeProc * proc)
{
    SetBlendConfig(1, proc->counter, 0x10 - proc->counter, 0);

    if (--proc->counter >= 0)
        return;

    Proc_Break(proc);
    SetBlendNone();
    SetBgChrOffset(2, 0);
    TmFill(gBg2Tm, 0);
    EnableBgSync(4);
}

void Destruct6CBMXFADE(struct BmxfadeProc * proc)
{
    SetAllUnitNotBackSprite();

    if (0 != proc->game_lock)
        UnlockGame();
}

void StartMapFade(bool lock_game)
{
    struct BmxfadeProc * proc = Proc_Start(sProcScr_BMXFADE, PROC_TREE_3);
    proc->game_lock = lock_game;

    if (0 != lock_game)
        LockGame();
}

bool IsMapFadeActive(void)
{
    return Proc_Find(sProcScr_BMXFADE)
            ? 1
            : 0;
}
