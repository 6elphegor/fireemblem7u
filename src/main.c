#include "gbafe.h"

// Data (not yet in C; FE7U addresses in symbols.ld)
extern const char gBuildDateStr[];
extern const char gBuildNameStr[];

void sub_080009FC(void);
void sub_08003F6C(void);
void StartGame(void);
void DebugPutStr(u16 * tm, const char * str);

// These were compiled with -mtpcs-frame, which old_agbcc doesn't support.
#if NONMATCHING
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
    sub_08003F6C();

    SetOnVBlank(OnVBlank);
    SetLang(0);

    StartGame();

    while (1)
    {
        RunMainFunc();
        SoftResetIfKeyCombo();
    }
}

#else
ASM_FUNC("asm/nonmatching/code_08000A50.s");
#endif

#if NONMATCHING
void PutBuildInfo(u16 * tm)
{
    DebugPutStr(tm, gBuildDateStr);
    DebugPutStr(tm - 0x20, gBuildNameStr);
}
#else
ASM_FUNC("asm/nonmatching/code_08000B1C.s");
#endif
