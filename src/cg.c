#include "gbafe.h"

// FE8U: cg.c

struct CGDataEnt {
    /* 00 */ u8 isSplit;
    /* 04 */ void const * img; // single image, or 10 parts if split
    /* 08 */ u8 const * tsa;
    /* 0C */ u16 const * pal;
};

extern struct CGDataEnt CONST_DATA gCGDataTable[];

struct CGDataEnt const * GetCG(int idx)
{
    return gCGDataTable + idx;
}

void sub_080B6B68(void)
{
}

void PutCgBackground(u16 * tm, int offset, int palId, int palCount, int idx)
{
    int i;

    struct CGDataEnt const * cgEnt = GetCG(idx);

    if (cgEnt->isSplit == 0)
    {
        Decompress(cgEnt->img, (void *) (VRAM + offset));
    }
    else
    {
        for (i = 0; i < 10; i++)
            Decompress(((u8 const * const *) cgEnt->img)[i], (void *) (VRAM + offset + i * 0x800));
    }

    TmApplyTsa_thm(tm, cgEnt->tsa, (u16) ((palId << 12) + ((offset & 0x7FFF) >> 5)));

    ApplyPalettes(cgEnt->pal, palId, palCount);

    if (idx < 0x80)
        ModifySaveLinkArenaStruct2B(NULL, idx);
}
