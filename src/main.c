#include "gbafe.h"

// Data (not yet in C; FE7U addresses in symbols.ld)
extern const char gBuildDateStr[];
extern const char gBuildNameStr[];

void sub_080009FC(void);
void Sound_SetDefaultMaxNumChannels(void);
void StartGame(void);
void DebugPutStr(u16 * tm, const char * str);

// main.c is compiled with -mtpcs-frame (see Makefile): the original has
// TPCS backtrace frames. old_agbcc needs tools/agbcc-tpcs-frame.patch for it.
void AgbMain(void)
{
    DmaFill32(3, 0, (void *) IWRAM_START, 0x7F80);

    sub_080009FC();

    REG_WAITCNT = 0x45B4;

    IrqInit();
    SetOnVBlank(NULL);

    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = 1;

    InitKeySt(gpKeySt);
    RefreshKeySt(gpKeySt);

    InitRamFuncs();
    SramInit();
    Proc_Init();
    InitSpriteAnims();
    MU_Init();

    RandInitB(0x42D690E9);
    RandInit(RandNextB());

    LoadAndVerifySramSaveData();

    m4aSoundInit();
    Sound_SetDefaultMaxNumChannels();

    SetOnVBlank(OnVBlank);
    SetLang(0);

    StartGame();

    while (1)
    {
        RunMainFunc();
        SoftResetIfKeyCombo();
    }
}


void PutBuildInfo(u16 * tm)
{
    DebugPutStr(tm, gBuildDateStr);
    DebugPutStr(tm - 0x20, gBuildNameStr);
}
