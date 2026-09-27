#include "gbafe.h"

/**
 * Level-up fanfare (fireemblem8u: banim-ekrlvupfan.c)
 */

struct ProcEkrLvupFan {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
};

void SetBgmVolume(int volume);
void M4aPlayWithPostionCtrl(int songid, int x, int flag);

void EkrLvupFanMain(struct ProcEkrLvupFan * proc);

CONST_DATA struct ProcCmd ProcScr_ekrLvupFan[] = {
    PROC_19,
    PROC_REPEAT(EkrLvupFanMain),
    PROC_END,
};

void NewEkrLvlupFan(void)
{
    struct ProcEkrLvupFan * proc = Proc_Start(ProcScr_ekrLvupFan, PROC_TREE_3);
    proc->timer = 0;
    SetBgmVolume(0x80);
}

void EkrLvupFanMain(struct ProcEkrLvupFan * proc)
{
    int timer = ++proc->timer;
    if (timer == 0x10) {
        EfxPlaySE(0x37B, 0x100);
        M4aPlayWithPostionCtrl(0x37B, 0x78, 0);
    } else if (timer == 0x74) {
        SetBgmVolume(0x100);
        Proc_Break(proc);
    }
}
