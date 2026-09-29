#include "gbafe.h"

#undef DrawGlyph
#undef DecodeString
#undef PutOamHi
#undef PutOamLo
#undef MapFloodCoreStep
#undef MapFloodCore

extern u8 gRamFuncBuffer[];

extern void (* gRamFunc_DrawGlyph)(u16 const * cvtLut, void * chr, u32 const * glyph, int offset);
extern void (* gRamFunc_DecodeString)(char const * src, char * dst);
extern void (* gRamFunc_PutOamHi)(int x, int y, u16 const * oam_list, int oam2);
extern void (* gRamFunc_PutOamLo)(int x, int y, u16 const * oam_list, int oam2);
extern void (* gRamFunc_MapFloodCoreStep)(int connect, int x, int y);
extern void (* gRamFunc_MapFloodCore)(void);

void InitRamFuncs(void)
{
#if !PLATFORM_GBA
    // The host runs the C versions of the ARM routines (platform/armfunc.c)
    // where they are: nothing to copy.
    gRamFunc_DrawGlyph = DrawGlyph;
    gRamFunc_DecodeString = DecodeString;
    gRamFunc_PutOamHi = PutOamHi;
    gRamFunc_PutOamLo = PutOamLo;
    gRamFunc_MapFloodCoreStep = MapFloodCoreStep;
    gRamFunc_MapFloodCore = MapFloodCore;
#else
    int size = ArmCodeEnd - ArmCodeStart;

    CpuCopy16(ArmCodeStart, gRamFuncBuffer, size);

    gRamFunc_DrawGlyph = (void *) gRamFuncBuffer + ((u8 const *) DrawGlyph - ArmCodeStart);
    gRamFunc_DecodeString = (void *) gRamFuncBuffer + ((u8 const *) DecodeString - ArmCodeStart);
    gRamFunc_PutOamHi = (void *) gRamFuncBuffer + ((u8 const *) PutOamHi - ArmCodeStart);
    gRamFunc_PutOamLo = (void *) gRamFuncBuffer + ((u8 const *) PutOamLo - ArmCodeStart);
    gRamFunc_MapFloodCoreStep = (void *) gRamFuncBuffer + ((u8 const *) MapFloodCoreStep - ArmCodeStart);
    gRamFunc_MapFloodCore = (void *) gRamFuncBuffer + ((u8 const *) MapFloodCore - ArmCodeStart);
#endif
}

void DrawGlyphRam(u16 const * cvtLut, void * chr, u32 const * glyph, int offset)
{
    gRamFunc_DrawGlyph(cvtLut, chr, glyph, offset);
}

void DecodeStringRam(char const * src, char * dst)
{
    gRamFunc_DecodeString(src, dst);
}

void PutOamHiRam(int x, int y, u16 const * oam_list, int oam2)
{
    gRamFunc_PutOamHi(x, y, oam_list, oam2);
}

void PutOamLoRam(int x, int y, u16 const * oam_list, int oam2)
{
    gRamFunc_PutOamLo(x, y, oam_list, oam2);
}

void MapFloodCoreStepRam(int connect, int x, int y)
{
    gRamFunc_MapFloodCoreStep(connect, x, y);
}

void MapFloodCoreRam(void)
{
    gRamFunc_MapFloodCore();
}
