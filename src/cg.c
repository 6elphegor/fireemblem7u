#include "gbafe.h"

// FE8U: cg.c

struct CGDataEnt {
    /* 00 */ u8 isSplit;
    /* 04 */ void const * img; // single image, or 10 parts if split
    /* 08 */ u8 const * tsa;
    /* 0C */ u16 const * pal;
};

CONST_DATA struct CGDataEnt gCGDataTable[] = {
    { 1, (void *) 0x08CED6D0, (u8 *) 0x084354F8, (u16 *) 0x084353F8 },
    { 1, (void *) 0x08CED6F8, (u8 *) 0x0843ABD8, (u16 *) 0x0843AAD8 },
    { 1, (void *) 0x08CED720, (u8 *) 0x08440444, (u16 *) 0x08440344 },
    { 1, (void *) 0x08CED748, (u8 *) 0x084457B0, (u16 *) 0x084456B0 },
    { 1, (void *) 0x08CED770, (u8 *) 0x0844AC24, (u16 *) 0x0844AB24 },
    { 1, (void *) 0x08CED798, (u8 *) 0x08450324, (u16 *) 0x08450224 },
    { 1, (void *) 0x08CED7C0, (u8 *) 0x0845589C, (u16 *) 0x0845579C },
    { 1, (void *) 0x08CED7E8, (u8 *) 0x0845B0B4, (u16 *) 0x0845AFB4 },
    { 1, (void *) 0x08CED810, (u8 *) 0x08460868, (u16 *) 0x08460768 },
    { 1, (void *) 0x08CED838, (u8 *) 0x08465FEC, (u16 *) 0x08465EEC },
    { 1, (void *) 0x08CED860, (u8 *) 0x0842FB50, (u16 *) 0x08430004 },
    { 0, (void *) 0x084664A0, (u8 *) 0x0846B5A8, (u16 *) 0x0846B4A8 },
    { 0, (void *) 0x0846BA5C, (u8 *) 0x08470944, (u16 *) 0x08470844 },
    { 0, (void *) 0x08470DF8, (u8 *) 0x08475AFC, (u16 *) 0x084759FC },
    { 0, (void *) 0x08475FB0, (u8 *) 0x0847B14C, (u16 *) 0x0847B04C },
    { 0, (void *) 0x0847B600, (u8 *) 0x08480698, (u16 *) 0x08480598 },
    { 0, (void *) 0x08480B4C, (u8 *) 0x08485964, (u16 *) 0x08485864 },
    { 0, (void *) 0x08485E18, (u8 *) 0x0848B1E0, (u16 *) 0x0848B0E0 },
    { 0, (void *) 0x0848B694, (u8 *) 0x08490BE0, (u16 *) 0x08490AE0 },
    { 0, (void *) 0x08491094, (u8 *) 0x084964A8, (u16 *) 0x084963A8 },
    { 0, (void *) 0x0849695C, (u8 *) 0x0849B9F4, (u16 *) 0x0849B8F4 },
    { 0, (void *) 0x0849BEA8, (u8 *) 0x084A1258, (u16 *) 0x084A1158 },
    { 0, (void *) 0x084A170C, (u8 *) 0x084A6B58, (u16 *) 0x084A6A58 },
    { 0, (void *) 0x084A700C, (u8 *) 0x084AC260, (u16 *) 0x084AC160 },
    { 0, (void *) 0x084AC714, (u8 *) 0x084B1000, (u16 *) 0x084B0F00 },
    { 0, (void *) 0x084B14B4, (u8 *) 0x084B67AC, (u16 *) 0x084B66AC },
    { 0, (void *) 0x084B6C60, (u8 *) 0x084BB798, (u16 *) 0x084BB698 },
    { 0, (void *) 0x084BBC4C, (u8 *) 0x084C0BDC, (u16 *) 0x084C0ADC },
    { 0, (void *) 0x084C1090, (u8 *) 0x084C5CC8, (u16 *) 0x084C5BC8 },
    { 0, (void *) 0x084C617C, (u8 *) 0x084CB2C8, (u16 *) 0x084CB1C8 },
    { 0, (void *) 0x084CB77C, (u8 *) 0x084D0550, (u16 *) 0x084D0450 },
    { 0, (void *) 0x084D0A04, (u8 *) 0x084D5D84, (u16 *) 0x084D5C84 },
    { 0, (void *) 0x084D6238, (u8 *) 0x084DB8E4, (u16 *) 0x084DB7E4 },
    { 0, (void *) 0x084DBDE8, (u8 *) 0x084E0DE8, (u16 *) 0x084E0CE8 },
    { 0, (void *) 0x084E129C, (u8 *) 0x084E466C, (u16 *) 0x084E456C },
    { 0, (void *) 0x084E4B20, (u8 *) 0x084E6000, (u16 *) 0x084E5F00 },
    { 0, (void *) 0x084E64B4, (u8 *) 0x084EBB20, (u16 *) 0x084EBA20 },
    { 0, (void *) 0x084EC024, (u8 *) 0x084F0F90, (u16 *) 0x084F0E90 },
    { 0, (void *) 0x084F1444, (u8 *) 0x084F66A0, (u16 *) 0x084F65A0 },
    { 0, (void *) 0x084F6B54, (u8 *) 0x084FBDC0, (u16 *) 0x084FBCC0 },
    { 0, (void *) 0x084FC274, (u8 *) 0x0850145C, (u16 *) 0x0850135C },
    { 0, (void *) 0x08501910, (u8 *) 0x08506C08, (u16 *) 0x08506B08 },
    { 0, (void *) 0x085070BC, (u8 *) 0x0850BE54, (u16 *) 0x0850BD54 },
    { 0, (void *) 0x0850C308, (u8 *) 0x08511364, (u16 *) 0x08511264 },
    { 0, (void *) 0x08511818, (u8 *) 0x0851624C, (u16 *) 0x0851614C },
    { 0, (void *) 0x08516700, (u8 *) 0x08519A10, (u16 *) 0x08519910 },
    { 0, (void *) 0x08519EC4, (u8 *) 0x0851EFD8, (u16 *) 0x0851EED8 },
    { 0, (void *) 0x0851F48C, (u8 *) 0x085243F8, (u16 *) 0x085242F8 },
    { 0, (void *) 0x085248AC, (u8 *) 0x085298E0, (u16 *) 0x085297E0 },
    { 0, (void *) 0x08529D94, (u8 *) 0x0852EBD8, (u16 *) 0x0852EAD8 },
    { 0, (void *) 0x0852F08C, (u8 *) 0x08533E80, (u16 *) 0x08533D80 },
    { 0, (void *) 0x08534334, (u8 *) 0x0853962C, (u16 *) 0x0853952C },
    { 0, (void *) 0x08539AE0, (u8 *) 0x0853EAE0, (u16 *) 0x0853E9E0 },
    { 0, (void *) 0x0853EF94, (u8 *) 0x08544470, (u16 *) 0x08544370 },
    { 0, (void *) 0x08544924, (u8 *) 0x08549AB4, gUnk_085499B4 },
    { 0, (void *) 0x08549F68, (u8 *) 0x0854F280, gUnk_0854F180 },
    { 0, (void *) 0x0854F734, (u8 *) 0x08554730, (u16 *) 0x08554630 },
    { 0, (void *) 0x08554BE4, (u8 *) 0x08559C24, (u16 *) 0x08559B24 },
    { 0, (void *) 0x0855A0D8, (u8 *) 0x0855ADB0, (u16 *) 0x0855ACB0 },
    { 0, (void *) 0x0855B264, (u8 *) 0x0856007C, (u16 *) 0x0855FF7C },
    { 0, (void *) 0x08560530, (u8 *) 0x08565468, (u16 *) 0x08565368 },
    { 0, (void *) 0x0856591C, (u8 *) 0x0856AA94, (u16 *) 0x0856A994 },
    { 0, (void *) 0x0856AF48, (u8 *) 0x0856FDE8, (u16 *) 0x0856FCE8 },
    { 0, (void *) 0x0857029C, (u8 *) 0x085744DC, (u16 *) 0x085743DC },
    { 0, (void *) 0x08544924, (u8 *) 0x0842566C, gUnk_085499B4 },
};

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
