#include "gbafe.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 gUnk_0842566C[];
extern const u8 gUnk_0842FB50[];
extern const u8 gUnk_08430004[];
extern const u8 gUnk_084353F8[];
extern const u8 gUnk_084354F8[];
extern const u8 gUnk_0843AAD8[];
extern const u8 gUnk_0843ABD8[];
extern const u8 gUnk_08440344[];
extern const u8 gUnk_08440444[];
extern const u8 gUnk_084456B0[];
extern const u8 gUnk_084457B0[];
extern const u8 gUnk_0844AB24[];
extern const u8 gUnk_0844AC24[];
extern const u8 gUnk_08450224[];
extern const u8 gUnk_08450324[];
extern const u8 gUnk_0845579C[];
extern const u8 gUnk_0845589C[];
extern const u8 gUnk_0845AFB4[];
extern const u8 gUnk_0845B0B4[];
extern const u8 gUnk_08460768[];
extern const u8 gUnk_08460868[];
extern const u8 gUnk_08465EEC[];
extern const u8 gUnk_08465FEC[];
extern const u8 gUnk_084664A0[];
extern const u8 gUnk_0846B4A8[];
extern const u8 gUnk_0846B5A8[];
extern const u8 gUnk_0846BA5C[];
extern const u8 gUnk_08470844[];
extern const u8 gUnk_08470944[];
extern const u8 gUnk_08470DF8[];
extern const u8 gUnk_084759FC[];
extern const u8 gUnk_08475AFC[];
extern const u8 gUnk_08475FB0[];
extern const u8 gUnk_0847B04C[];
extern const u8 gUnk_0847B14C[];
extern const u8 gUnk_0847B600[];
extern const u8 gUnk_08480598[];
extern const u8 gUnk_08480698[];
extern const u8 gUnk_08480B4C[];
extern const u8 gUnk_08485864[];
extern const u8 gUnk_08485964[];
extern const u8 gUnk_08485E18[];
extern const u8 gUnk_0848B0E0[];
extern const u8 gUnk_0848B1E0[];
extern const u8 gUnk_0848B694[];
extern const u8 gUnk_08490AE0[];
extern const u8 gUnk_08490BE0[];
extern const u8 gUnk_08491094[];
extern const u8 gUnk_084963A8[];
extern const u8 gUnk_084964A8[];
extern const u8 gUnk_0849695C[];
extern const u8 gUnk_0849B8F4[];
extern const u8 gUnk_0849B9F4[];
extern const u8 gUnk_0849BEA8[];
extern const u8 gUnk_084A1158[];
extern const u8 gUnk_084A1258[];
extern const u8 gUnk_084A170C[];
extern const u8 gUnk_084A6A58[];
extern const u8 gUnk_084A6B58[];
extern const u8 gUnk_084A700C[];
extern const u8 gUnk_084AC160[];
extern const u8 gUnk_084AC260[];
extern const u8 gUnk_084AC714[];
extern const u8 gUnk_084B0F00[];
extern const u8 gUnk_084B1000[];
extern const u8 gUnk_084B14B4[];
extern const u8 gUnk_084B66AC[];
extern const u8 gUnk_084B67AC[];
extern const u8 gUnk_084B6C60[];
extern const u8 gUnk_084BB698[];
extern const u8 gUnk_084BB798[];
extern const u8 gUnk_084BBC4C[];
extern const u8 gUnk_084C0ADC[];
extern const u8 gUnk_084C0BDC[];
extern const u8 gUnk_084C1090[];
extern const u8 gUnk_084C5BC8[];
extern const u8 gUnk_084C5CC8[];
extern const u8 gUnk_084C617C[];
extern const u8 gUnk_084CB1C8[];
extern const u8 gUnk_084CB2C8[];
extern const u8 gUnk_084CB77C[];
extern const u8 gUnk_084D0450[];
extern const u8 gUnk_084D0550[];
extern const u8 gUnk_084D0A04[];
extern const u8 gUnk_084D5C84[];
extern const u8 gUnk_084D5D84[];
extern const u8 gUnk_084D6238[];
extern const u8 gUnk_084DB7E4[];
extern const u8 gUnk_084DB8E4[];
extern const u8 gUnk_084DBDE8[];
extern const u8 gUnk_084E0CE8[];
extern const u8 gUnk_084E0DE8[];
extern const u8 gUnk_084E129C[];
extern const u8 gUnk_084E456C[];
extern const u8 gUnk_084E466C[];
extern const u8 gUnk_084E4B20[];
extern const u8 gUnk_084E5F00[];
extern const u8 gUnk_084E6000[];
extern const u8 gUnk_084E64B4[];
extern const u8 gUnk_084EBA20[];
extern const u8 gUnk_084EBB20[];
extern const u8 gUnk_084EC024[];
extern const u8 gUnk_084F0E90[];
extern const u8 gUnk_084F0F90[];
extern const u8 gUnk_084F1444[];
extern const u8 gUnk_084F65A0[];
extern const u8 gUnk_084F66A0[];
extern const u8 gUnk_084F6B54[];
extern const u8 gUnk_084FBCC0[];
extern const u8 gUnk_084FBDC0[];
extern const u8 gUnk_084FC274[];
extern const u8 gUnk_0850135C[];
extern const u8 gUnk_0850145C[];
extern const u8 gUnk_08501910[];
extern const u8 gUnk_08506B08[];
extern const u8 gUnk_08506C08[];
extern const u8 gUnk_085070BC[];
extern const u8 gUnk_0850BD54[];
extern const u8 gUnk_0850BE54[];
extern const u8 gUnk_0850C308[];
extern const u8 gUnk_08511264[];
extern const u8 gUnk_08511364[];
extern const u8 gUnk_08511818[];
extern const u8 gUnk_0851614C[];
extern const u8 gUnk_0851624C[];
extern const u8 gUnk_08516700[];
extern const u8 gUnk_08519910[];
extern const u8 gUnk_08519A10[];
extern const u8 gUnk_08519EC4[];
extern const u8 gUnk_0851EED8[];
extern const u8 gUnk_0851EFD8[];
extern const u8 gUnk_0851F48C[];
extern const u8 gUnk_085242F8[];
extern const u8 gUnk_085243F8[];
extern const u8 gUnk_085248AC[];
extern const u8 gUnk_085297E0[];
extern const u8 gUnk_085298E0[];
extern const u8 gUnk_08529D94[];
extern const u8 gUnk_0852EAD8[];
extern const u8 gUnk_0852EBD8[];
extern const u8 gUnk_0852F08C[];
extern const u8 gUnk_08533D80[];
extern const u8 gUnk_08533E80[];
extern const u8 gUnk_08534334[];
extern const u8 gUnk_0853952C[];
extern const u8 gUnk_0853962C[];
extern const u8 gUnk_08539AE0[];
extern const u8 gUnk_0853E9E0[];
extern const u8 gUnk_0853EAE0[];
extern const u8 gUnk_0853EF94[];
extern const u8 gUnk_08544370[];
extern const u8 gUnk_08544470[];
extern const u8 gUnk_08544924[];
extern const u8 gUnk_08549AB4[];
extern const u8 gUnk_08549F68[];
extern const u8 gUnk_0854F280[];
extern const u8 gUnk_0854F734[];
extern const u8 gUnk_08554630[];
extern const u8 gUnk_08554730[];
extern const u8 gUnk_08554BE4[];
extern const u8 gUnk_08559B24[];
extern const u8 gUnk_08559C24[];
extern const u8 gUnk_0855A0D8[];
extern const u8 gUnk_0855ACB0[];
extern const u8 gUnk_0855ADB0[];
extern const u8 gUnk_0855B264[];
extern const u8 gUnk_0855FF7C[];
extern const u8 gUnk_0856007C[];
extern const u8 gUnk_08560530[];
extern const u8 gUnk_08565368[];
extern const u8 gUnk_08565468[];
extern const u8 gUnk_0856591C[];
extern const u8 gUnk_0856A994[];
extern const u8 gUnk_0856AA94[];
extern const u8 gUnk_0856AF48[];
extern const u8 gUnk_0856FCE8[];
extern const u8 gUnk_0856FDE8[];
extern const u8 gUnk_0857029C[];
extern const u8 gUnk_085743DC[];
extern const u8 gUnk_085744DC[];
extern const u8 gUnk_08CED6D0[];
extern const u8 gUnk_08CED6F8[];
extern const u8 gUnk_08CED720[];
extern const u8 gUnk_08CED748[];
extern const u8 gUnk_08CED770[];
extern const u8 gUnk_08CED798[];
extern const u8 gUnk_08CED7C0[];
extern const u8 gUnk_08CED7E8[];
extern const u8 gUnk_08CED810[];
extern const u8 gUnk_08CED838[];
extern const u8 gUnk_08CED860[];

// FE8U: cg.c

struct CGDataEnt {
    /* 00 */ u8 isSplit;
    /* 04 */ void const * img; // single image, or 10 parts if split
    /* 08 */ u8 const * tsa;
    /* 0C */ u16 const * pal;
};

CONST_DATA struct CGDataEnt gCGDataTable[] = {
    { 1, (void *) gUnk_08CED6D0, (u8 *) gUnk_084354F8, (u16 *) gUnk_084353F8 },
    { 1, (void *) gUnk_08CED6F8, (u8 *) gUnk_0843ABD8, (u16 *) gUnk_0843AAD8 },
    { 1, (void *) gUnk_08CED720, (u8 *) gUnk_08440444, (u16 *) gUnk_08440344 },
    { 1, (void *) gUnk_08CED748, (u8 *) gUnk_084457B0, (u16 *) gUnk_084456B0 },
    { 1, (void *) gUnk_08CED770, (u8 *) gUnk_0844AC24, (u16 *) gUnk_0844AB24 },
    { 1, (void *) gUnk_08CED798, (u8 *) gUnk_08450324, (u16 *) gUnk_08450224 },
    { 1, (void *) gUnk_08CED7C0, (u8 *) gUnk_0845589C, (u16 *) gUnk_0845579C },
    { 1, (void *) gUnk_08CED7E8, (u8 *) gUnk_0845B0B4, (u16 *) gUnk_0845AFB4 },
    { 1, (void *) gUnk_08CED810, (u8 *) gUnk_08460868, (u16 *) gUnk_08460768 },
    { 1, (void *) gUnk_08CED838, (u8 *) gUnk_08465FEC, (u16 *) gUnk_08465EEC },
    { 1, (void *) gUnk_08CED860, (u8 *) gUnk_0842FB50, (u16 *) gUnk_08430004 },
    { 0, (void *) gUnk_084664A0, (u8 *) gUnk_0846B5A8, (u16 *) gUnk_0846B4A8 },
    { 0, (void *) gUnk_0846BA5C, (u8 *) gUnk_08470944, (u16 *) gUnk_08470844 },
    { 0, (void *) gUnk_08470DF8, (u8 *) gUnk_08475AFC, (u16 *) gUnk_084759FC },
    { 0, (void *) gUnk_08475FB0, (u8 *) gUnk_0847B14C, (u16 *) gUnk_0847B04C },
    { 0, (void *) gUnk_0847B600, (u8 *) gUnk_08480698, (u16 *) gUnk_08480598 },
    { 0, (void *) gUnk_08480B4C, (u8 *) gUnk_08485964, (u16 *) gUnk_08485864 },
    { 0, (void *) gUnk_08485E18, (u8 *) gUnk_0848B1E0, (u16 *) gUnk_0848B0E0 },
    { 0, (void *) gUnk_0848B694, (u8 *) gUnk_08490BE0, (u16 *) gUnk_08490AE0 },
    { 0, (void *) gUnk_08491094, (u8 *) gUnk_084964A8, (u16 *) gUnk_084963A8 },
    { 0, (void *) gUnk_0849695C, (u8 *) gUnk_0849B9F4, (u16 *) gUnk_0849B8F4 },
    { 0, (void *) gUnk_0849BEA8, (u8 *) gUnk_084A1258, (u16 *) gUnk_084A1158 },
    { 0, (void *) gUnk_084A170C, (u8 *) gUnk_084A6B58, (u16 *) gUnk_084A6A58 },
    { 0, (void *) gUnk_084A700C, (u8 *) gUnk_084AC260, (u16 *) gUnk_084AC160 },
    { 0, (void *) gUnk_084AC714, (u8 *) gUnk_084B1000, (u16 *) gUnk_084B0F00 },
    { 0, (void *) gUnk_084B14B4, (u8 *) gUnk_084B67AC, (u16 *) gUnk_084B66AC },
    { 0, (void *) gUnk_084B6C60, (u8 *) gUnk_084BB798, (u16 *) gUnk_084BB698 },
    { 0, (void *) gUnk_084BBC4C, (u8 *) gUnk_084C0BDC, (u16 *) gUnk_084C0ADC },
    { 0, (void *) gUnk_084C1090, (u8 *) gUnk_084C5CC8, (u16 *) gUnk_084C5BC8 },
    { 0, (void *) gUnk_084C617C, (u8 *) gUnk_084CB2C8, (u16 *) gUnk_084CB1C8 },
    { 0, (void *) gUnk_084CB77C, (u8 *) gUnk_084D0550, (u16 *) gUnk_084D0450 },
    { 0, (void *) gUnk_084D0A04, (u8 *) gUnk_084D5D84, (u16 *) gUnk_084D5C84 },
    { 0, (void *) gUnk_084D6238, (u8 *) gUnk_084DB8E4, (u16 *) gUnk_084DB7E4 },
    { 0, (void *) gUnk_084DBDE8, (u8 *) gUnk_084E0DE8, (u16 *) gUnk_084E0CE8 },
    { 0, (void *) gUnk_084E129C, (u8 *) gUnk_084E466C, (u16 *) gUnk_084E456C },
    { 0, (void *) gUnk_084E4B20, (u8 *) gUnk_084E6000, (u16 *) gUnk_084E5F00 },
    { 0, (void *) gUnk_084E64B4, (u8 *) gUnk_084EBB20, (u16 *) gUnk_084EBA20 },
    { 0, (void *) gUnk_084EC024, (u8 *) gUnk_084F0F90, (u16 *) gUnk_084F0E90 },
    { 0, (void *) gUnk_084F1444, (u8 *) gUnk_084F66A0, (u16 *) gUnk_084F65A0 },
    { 0, (void *) gUnk_084F6B54, (u8 *) gUnk_084FBDC0, (u16 *) gUnk_084FBCC0 },
    { 0, (void *) gUnk_084FC274, (u8 *) gUnk_0850145C, (u16 *) gUnk_0850135C },
    { 0, (void *) gUnk_08501910, (u8 *) gUnk_08506C08, (u16 *) gUnk_08506B08 },
    { 0, (void *) gUnk_085070BC, (u8 *) gUnk_0850BE54, (u16 *) gUnk_0850BD54 },
    { 0, (void *) gUnk_0850C308, (u8 *) gUnk_08511364, (u16 *) gUnk_08511264 },
    { 0, (void *) gUnk_08511818, (u8 *) gUnk_0851624C, (u16 *) gUnk_0851614C },
    { 0, (void *) gUnk_08516700, (u8 *) gUnk_08519A10, (u16 *) gUnk_08519910 },
    { 0, (void *) gUnk_08519EC4, (u8 *) gUnk_0851EFD8, (u16 *) gUnk_0851EED8 },
    { 0, (void *) gUnk_0851F48C, (u8 *) gUnk_085243F8, (u16 *) gUnk_085242F8 },
    { 0, (void *) gUnk_085248AC, (u8 *) gUnk_085298E0, (u16 *) gUnk_085297E0 },
    { 0, (void *) gUnk_08529D94, (u8 *) gUnk_0852EBD8, (u16 *) gUnk_0852EAD8 },
    { 0, (void *) gUnk_0852F08C, (u8 *) gUnk_08533E80, (u16 *) gUnk_08533D80 },
    { 0, (void *) gUnk_08534334, (u8 *) gUnk_0853962C, (u16 *) gUnk_0853952C },
    { 0, (void *) gUnk_08539AE0, (u8 *) gUnk_0853EAE0, (u16 *) gUnk_0853E9E0 },
    { 0, (void *) gUnk_0853EF94, (u8 *) gUnk_08544470, (u16 *) gUnk_08544370 },
    { 0, (void *) gUnk_08544924, (u8 *) gUnk_08549AB4, gUnk_085499B4 },
    { 0, (void *) gUnk_08549F68, (u8 *) gUnk_0854F280, gUnk_0854F180 },
    { 0, (void *) gUnk_0854F734, (u8 *) gUnk_08554730, (u16 *) gUnk_08554630 },
    { 0, (void *) gUnk_08554BE4, (u8 *) gUnk_08559C24, (u16 *) gUnk_08559B24 },
    { 0, (void *) gUnk_0855A0D8, (u8 *) gUnk_0855ADB0, (u16 *) gUnk_0855ACB0 },
    { 0, (void *) gUnk_0855B264, (u8 *) gUnk_0856007C, (u16 *) gUnk_0855FF7C },
    { 0, (void *) gUnk_08560530, (u8 *) gUnk_08565468, (u16 *) gUnk_08565368 },
    { 0, (void *) gUnk_0856591C, (u8 *) gUnk_0856AA94, (u16 *) gUnk_0856A994 },
    { 0, (void *) gUnk_0856AF48, (u8 *) gUnk_0856FDE8, (u16 *) gUnk_0856FCE8 },
    { 0, (void *) gUnk_0857029C, (u8 *) gUnk_085744DC, (u16 *) gUnk_085743DC },
    { 0, (void *) gUnk_08544924, (u8 *) gUnk_0842566C, gUnk_085499B4 },
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
