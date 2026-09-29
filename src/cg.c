#include "gbafe.h"

extern const u8 Img_Cg_00_0[], Img_Cg_00_1[], Img_Cg_00_2[], Img_Cg_00_3[], Img_Cg_00_4[],
    Img_Cg_00_5[], Img_Cg_00_6[], Img_Cg_00_7[], Img_Cg_00_8[], Img_Cg_00_9[], Img_Cg_01_0[],
    Img_Cg_01_1[], Img_Cg_01_2[], Img_Cg_01_3[], Img_Cg_01_4[], Img_Cg_01_5[], Img_Cg_01_6[],
    Img_Cg_01_7[], Img_Cg_01_8[], Img_Cg_01_9[], Img_Cg_02_0[], Img_Cg_02_1[], Img_Cg_02_2[],
    Img_Cg_02_3[], Img_Cg_02_4[], Img_Cg_02_5[], Img_Cg_02_6[], Img_Cg_02_7[], Img_Cg_02_8[],
    Img_Cg_02_9[], Img_Cg_03_0[], Img_Cg_03_1[], Img_Cg_03_2[], Img_Cg_03_3[], Img_Cg_03_4[],
    Img_Cg_03_5[], Img_Cg_03_6[], Img_Cg_03_7[], Img_Cg_03_8[], Img_Cg_03_9[], Img_Cg_04_0[],
    Img_Cg_04_1[], Img_Cg_04_2[], Img_Cg_04_3[], Img_Cg_04_4[], Img_Cg_04_5[], Img_Cg_04_6[],
    Img_Cg_04_7[], Img_Cg_04_8[], Img_Cg_04_9[], Img_Cg_05_0[], Img_Cg_05_1[], Img_Cg_05_2[],
    Img_Cg_05_3[], Img_Cg_05_4[], Img_Cg_05_5[], Img_Cg_05_6[], Img_Cg_05_7[], Img_Cg_05_8[],
    Img_Cg_05_9[], Img_Cg_06_0[], Img_Cg_06_1[], Img_Cg_06_2[], Img_Cg_06_3[], Img_Cg_06_4[],
    Img_Cg_06_5[], Img_Cg_06_6[], Img_Cg_06_7[], Img_Cg_06_8[], Img_Cg_06_9[], Img_Cg_07_0[],
    Img_Cg_07_1[], Img_Cg_07_2[], Img_Cg_07_3[], Img_Cg_07_4[], Img_Cg_07_5[], Img_Cg_07_6[],
    Img_Cg_07_7[], Img_Cg_07_8[], Img_Cg_07_9[], Img_Cg_08_0[], Img_Cg_08_1[], Img_Cg_08_2[],
    Img_Cg_08_3[], Img_Cg_08_4[], Img_Cg_08_5[], Img_Cg_08_6[], Img_Cg_08_7[], Img_Cg_08_8[],
    Img_Cg_08_9[], Img_Cg_09_0[], Img_Cg_09_1[], Img_Cg_09_2[], Img_Cg_09_3[], Img_Cg_09_4[],
    Img_Cg_09_5[], Img_Cg_09_6[], Img_Cg_09_7[], Img_Cg_09_8[], Img_Cg_09_9[], Img_Cg_0A_0[],
    Img_Cg_0A_1[], Img_Cg_0A_2[], Img_Cg_0A_3[], Img_Cg_0A_4[], Img_Cg_0A_5[], Img_Cg_0A_6[],
    Img_Cg_0A_7[], Img_Cg_0A_8[], Img_Cg_0A_9[];

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 gUnk_0842566C[];
extern const u8 gUnk_0842FB50[];
extern const u8 Pal_Cg_0A[];
extern const u8 Pal_Cg_00[];
extern const u8 gUnk_084354F8[];
extern const u8 Pal_Cg_01[];
extern const u8 gUnk_0843ABD8[];
extern const u8 Pal_Cg_02[];
extern const u8 gUnk_08440444[];
extern const u8 Pal_Cg_03[];
extern const u8 gUnk_084457B0[];
extern const u8 Pal_Cg_04[];
extern const u8 gUnk_0844AC24[];
extern const u8 Pal_Cg_05[];
extern const u8 gUnk_08450324[];
extern const u8 Pal_Cg_06[];
extern const u8 gUnk_0845589C[];
extern const u8 Pal_Cg_07[];
extern const u8 gUnk_0845B0B4[];
extern const u8 Pal_Cg_08[];
extern const u8 gUnk_08460868[];
extern const u8 Pal_Cg_09[];
extern const u8 gUnk_08465FEC[];
extern const u8 Img_Cg_0B[];
extern const u8 Pal_Cg_0B[];
extern const u8 gUnk_0846B5A8[];
extern const u8 Img_Cg_0C[];
extern const u8 Pal_Cg_0C[];
extern const u8 gUnk_08470944[];
extern const u8 Img_Cg_0D[];
extern const u8 Pal_Cg_0D[];
extern const u8 gUnk_08475AFC[];
extern const u8 Img_Cg_0E[];
extern const u8 Pal_Cg_0E[];
extern const u8 gUnk_0847B14C[];
extern const u8 Img_Cg_0F[];
extern const u8 Pal_Cg_0F[];
extern const u8 gUnk_08480698[];
extern const u8 Img_Cg_10[];
extern const u8 Pal_Cg_10[];
extern const u8 gUnk_08485964[];
extern const u8 Img_Cg_11[];
extern const u8 Pal_Cg_11[];
extern const u8 gUnk_0848B1E0[];
extern const u8 Img_Cg_12[];
extern const u8 Pal_Cg_12[];
extern const u8 gUnk_08490BE0[];
extern const u8 Img_Cg_13[];
extern const u8 Pal_Cg_13[];
extern const u8 gUnk_084964A8[];
extern const u8 Img_Cg_14[];
extern const u8 Pal_Cg_14[];
extern const u8 gUnk_0849B9F4[];
extern const u8 Img_Cg_15[];
extern const u8 Pal_Cg_15[];
extern const u8 gUnk_084A1258[];
extern const u8 Img_Cg_16[];
extern const u8 Pal_Cg_16[];
extern const u8 gUnk_084A6B58[];
extern const u8 Img_Cg_17[];
extern const u8 Pal_Cg_17[];
extern const u8 gUnk_084AC260[];
extern const u8 Img_Cg_18[];
extern const u8 Pal_Cg_18[];
extern const u8 gUnk_084B1000[];
extern const u8 Img_Cg_19[];
extern const u8 Pal_Cg_19[];
extern const u8 gUnk_084B67AC[];
extern const u8 Img_Cg_1A[];
extern const u8 Pal_Cg_1A[];
extern const u8 gUnk_084BB798[];
extern const u8 Img_Cg_1B[];
extern const u8 Pal_Cg_1B[];
extern const u8 gUnk_084C0BDC[];
extern const u8 Img_Cg_1C[];
extern const u8 Pal_Cg_1C[];
extern const u8 gUnk_084C5CC8[];
extern const u8 Img_Cg_1D[];
extern const u8 Pal_Cg_1D[];
extern const u8 gUnk_084CB2C8[];
extern const u8 Img_Cg_1E[];
extern const u8 Pal_Cg_1E[];
extern const u8 gUnk_084D0550[];
extern const u8 Img_Cg_1F[];
extern const u8 Pal_Cg_1F[];
extern const u8 gUnk_084D5D84[];
extern const u8 Img_Cg_20[];
extern const u8 Pal_Cg_20[];
extern const u8 gUnk_084DB8E4[];
extern const u8 Img_Cg_21[];
extern const u8 Pal_Cg_21[];
extern const u8 gUnk_084E0DE8[];
extern const u8 Img_Cg_22[];
extern const u8 Pal_Cg_22[];
extern const u8 gUnk_084E466C[];
extern const u8 Img_Cg_23[];
extern const u8 Pal_Cg_23[];
extern const u8 gUnk_084E6000[];
extern const u8 Img_Cg_24[];
extern const u8 Pal_Cg_24[];
extern const u8 gUnk_084EBB20[];
extern const u8 Img_Cg_25[];
extern const u8 Pal_Cg_25[];
extern const u8 gUnk_084F0F90[];
extern const u8 Img_Cg_26[];
extern const u8 Pal_Cg_26[];
extern const u8 gUnk_084F66A0[];
extern const u8 Img_Cg_27[];
extern const u8 Pal_Cg_27[];
extern const u8 gUnk_084FBDC0[];
extern const u8 Img_Cg_28[];
extern const u8 Pal_Cg_28[];
extern const u8 gUnk_0850145C[];
extern const u8 Img_Cg_29[];
extern const u8 Pal_Cg_29[];
extern const u8 gUnk_08506C08[];
extern const u8 Img_Cg_2A[];
extern const u8 Pal_Cg_2A[];
extern const u8 gUnk_0850BE54[];
extern const u8 Img_Cg_2B[];
extern const u8 Pal_Cg_2B[];
extern const u8 gUnk_08511364[];
extern const u8 Img_Cg_2C[];
extern const u8 Pal_Cg_2C[];
extern const u8 gUnk_0851624C[];
extern const u8 Img_Cg_2D[];
extern const u8 Pal_Cg_2D[];
extern const u8 gUnk_08519A10[];
extern const u8 Img_Cg_2E[];
extern const u8 Pal_Cg_2E[];
extern const u8 gUnk_0851EFD8[];
extern const u8 Img_Cg_2F[];
extern const u8 Pal_Cg_2F[];
extern const u8 gUnk_085243F8[];
extern const u8 Img_Cg_30[];
extern const u8 Pal_Cg_30[];
extern const u8 gUnk_085298E0[];
extern const u8 Img_Cg_31[];
extern const u8 Pal_Cg_31[];
extern const u8 gUnk_0852EBD8[];
extern const u8 Img_Cg_32[];
extern const u8 Pal_Cg_32[];
extern const u8 gUnk_08533E80[];
extern const u8 Img_Cg_33[];
extern const u8 Pal_Cg_33[];
extern const u8 gUnk_0853962C[];
extern const u8 Img_Cg_34[];
extern const u8 Pal_Cg_34[];
extern const u8 gUnk_0853EAE0[];
extern const u8 Img_Cg_35[];
extern const u8 Pal_Cg_35[];
extern const u8 gUnk_08544470[];
extern const u8 gUnk_08544924[];
extern const u8 gUnk_08549AB4[];
extern const u8 gUnk_08549F68[];
extern const u8 gUnk_0854F280[];
extern const u8 Img_Cg_36[];
extern const u8 Pal_Cg_36[];
extern const u8 gUnk_08554730[];
extern const u8 Img_Cg_37[];
extern const u8 Pal_Cg_37[];
extern const u8 gUnk_08559C24[];
extern const u8 Img_Cg_38[];
extern const u8 Pal_Cg_38[];
extern const u8 gUnk_0855ADB0[];
extern const u8 Img_Cg_39[];
extern const u8 Pal_Cg_39[];
extern const u8 gUnk_0856007C[];
extern const u8 Img_Cg_3A[];
extern const u8 Pal_Cg_3A[];
extern const u8 gUnk_08565468[];
extern const u8 Img_Cg_3B[];
extern const u8 Pal_Cg_3B[];
extern const u8 gUnk_0856AA94[];
extern const u8 Img_Cg_3C[];
extern const u8 Pal_Cg_3C[];
extern const u8 gUnk_0856FDE8[];
extern const u8 Img_Cg_3D[];
extern const u8 Pal_Cg_3D[];
extern const u8 gUnk_085744DC[];
extern u8 const * const Cg_Parts_00[];
extern u8 const * const Cg_Parts_01[];
extern u8 const * const Cg_Parts_02[];
extern u8 const * const Cg_Parts_03[];
extern u8 const * const Cg_Parts_04[];
extern u8 const * const Cg_Parts_05[];
extern u8 const * const Cg_Parts_06[];
extern u8 const * const Cg_Parts_07[];
extern u8 const * const Cg_Parts_08[];
extern u8 const * const Cg_Parts_09[];
extern u8 const * const Cg_Parts_0A[];

// FE8U: cg.c

struct CGDataEnt {
    /* 00 */ u8 isSplit;
    /* 04 */ void const * img; // single image, or 10 parts if split
    /* 08 */ u8 const * tsa;
    /* 0C */ u16 const * pal;
};

CONST_DATA struct CGDataEnt gCGDataTable[] = {
    { 1, (void *) Cg_Parts_00, (u8 *) gUnk_084354F8, (u16 *) Pal_Cg_00 },
    { 1, (void *) Cg_Parts_01, (u8 *) gUnk_0843ABD8, (u16 *) Pal_Cg_01 },
    { 1, (void *) Cg_Parts_02, (u8 *) gUnk_08440444, (u16 *) Pal_Cg_02 },
    { 1, (void *) Cg_Parts_03, (u8 *) gUnk_084457B0, (u16 *) Pal_Cg_03 },
    { 1, (void *) Cg_Parts_04, (u8 *) gUnk_0844AC24, (u16 *) Pal_Cg_04 },
    { 1, (void *) Cg_Parts_05, (u8 *) gUnk_08450324, (u16 *) Pal_Cg_05 },
    { 1, (void *) Cg_Parts_06, (u8 *) gUnk_0845589C, (u16 *) Pal_Cg_06 },
    { 1, (void *) Cg_Parts_07, (u8 *) gUnk_0845B0B4, (u16 *) Pal_Cg_07 },
    { 1, (void *) Cg_Parts_08, (u8 *) gUnk_08460868, (u16 *) Pal_Cg_08 },
    { 1, (void *) Cg_Parts_09, (u8 *) gUnk_08465FEC, (u16 *) Pal_Cg_09 },
    { 1, (void *) Cg_Parts_0A, (u8 *) gUnk_0842FB50, (u16 *) Pal_Cg_0A },
    { 0, (void *) Img_Cg_0B, (u8 *) gUnk_0846B5A8, (u16 *) Pal_Cg_0B },
    { 0, (void *) Img_Cg_0C, (u8 *) gUnk_08470944, (u16 *) Pal_Cg_0C },
    { 0, (void *) Img_Cg_0D, (u8 *) gUnk_08475AFC, (u16 *) Pal_Cg_0D },
    { 0, (void *) Img_Cg_0E, (u8 *) gUnk_0847B14C, (u16 *) Pal_Cg_0E },
    { 0, (void *) Img_Cg_0F, (u8 *) gUnk_08480698, (u16 *) Pal_Cg_0F },
    { 0, (void *) Img_Cg_10, (u8 *) gUnk_08485964, (u16 *) Pal_Cg_10 },
    { 0, (void *) Img_Cg_11, (u8 *) gUnk_0848B1E0, (u16 *) Pal_Cg_11 },
    { 0, (void *) Img_Cg_12, (u8 *) gUnk_08490BE0, (u16 *) Pal_Cg_12 },
    { 0, (void *) Img_Cg_13, (u8 *) gUnk_084964A8, (u16 *) Pal_Cg_13 },
    { 0, (void *) Img_Cg_14, (u8 *) gUnk_0849B9F4, (u16 *) Pal_Cg_14 },
    { 0, (void *) Img_Cg_15, (u8 *) gUnk_084A1258, (u16 *) Pal_Cg_15 },
    { 0, (void *) Img_Cg_16, (u8 *) gUnk_084A6B58, (u16 *) Pal_Cg_16 },
    { 0, (void *) Img_Cg_17, (u8 *) gUnk_084AC260, (u16 *) Pal_Cg_17 },
    { 0, (void *) Img_Cg_18, (u8 *) gUnk_084B1000, (u16 *) Pal_Cg_18 },
    { 0, (void *) Img_Cg_19, (u8 *) gUnk_084B67AC, (u16 *) Pal_Cg_19 },
    { 0, (void *) Img_Cg_1A, (u8 *) gUnk_084BB798, (u16 *) Pal_Cg_1A },
    { 0, (void *) Img_Cg_1B, (u8 *) gUnk_084C0BDC, (u16 *) Pal_Cg_1B },
    { 0, (void *) Img_Cg_1C, (u8 *) gUnk_084C5CC8, (u16 *) Pal_Cg_1C },
    { 0, (void *) Img_Cg_1D, (u8 *) gUnk_084CB2C8, (u16 *) Pal_Cg_1D },
    { 0, (void *) Img_Cg_1E, (u8 *) gUnk_084D0550, (u16 *) Pal_Cg_1E },
    { 0, (void *) Img_Cg_1F, (u8 *) gUnk_084D5D84, (u16 *) Pal_Cg_1F },
    { 0, (void *) Img_Cg_20, (u8 *) gUnk_084DB8E4, (u16 *) Pal_Cg_20 },
    { 0, (void *) Img_Cg_21, (u8 *) gUnk_084E0DE8, (u16 *) Pal_Cg_21 },
    { 0, (void *) Img_Cg_22, (u8 *) gUnk_084E466C, (u16 *) Pal_Cg_22 },
    { 0, (void *) Img_Cg_23, (u8 *) gUnk_084E6000, (u16 *) Pal_Cg_23 },
    { 0, (void *) Img_Cg_24, (u8 *) gUnk_084EBB20, (u16 *) Pal_Cg_24 },
    { 0, (void *) Img_Cg_25, (u8 *) gUnk_084F0F90, (u16 *) Pal_Cg_25 },
    { 0, (void *) Img_Cg_26, (u8 *) gUnk_084F66A0, (u16 *) Pal_Cg_26 },
    { 0, (void *) Img_Cg_27, (u8 *) gUnk_084FBDC0, (u16 *) Pal_Cg_27 },
    { 0, (void *) Img_Cg_28, (u8 *) gUnk_0850145C, (u16 *) Pal_Cg_28 },
    { 0, (void *) Img_Cg_29, (u8 *) gUnk_08506C08, (u16 *) Pal_Cg_29 },
    { 0, (void *) Img_Cg_2A, (u8 *) gUnk_0850BE54, (u16 *) Pal_Cg_2A },
    { 0, (void *) Img_Cg_2B, (u8 *) gUnk_08511364, (u16 *) Pal_Cg_2B },
    { 0, (void *) Img_Cg_2C, (u8 *) gUnk_0851624C, (u16 *) Pal_Cg_2C },
    { 0, (void *) Img_Cg_2D, (u8 *) gUnk_08519A10, (u16 *) Pal_Cg_2D },
    { 0, (void *) Img_Cg_2E, (u8 *) gUnk_0851EFD8, (u16 *) Pal_Cg_2E },
    { 0, (void *) Img_Cg_2F, (u8 *) gUnk_085243F8, (u16 *) Pal_Cg_2F },
    { 0, (void *) Img_Cg_30, (u8 *) gUnk_085298E0, (u16 *) Pal_Cg_30 },
    { 0, (void *) Img_Cg_31, (u8 *) gUnk_0852EBD8, (u16 *) Pal_Cg_31 },
    { 0, (void *) Img_Cg_32, (u8 *) gUnk_08533E80, (u16 *) Pal_Cg_32 },
    { 0, (void *) Img_Cg_33, (u8 *) gUnk_0853962C, (u16 *) Pal_Cg_33 },
    { 0, (void *) Img_Cg_34, (u8 *) gUnk_0853EAE0, (u16 *) Pal_Cg_34 },
    { 0, (void *) Img_Cg_35, (u8 *) gUnk_08544470, (u16 *) Pal_Cg_35 },
    { 0, (void *) gUnk_08544924, (u8 *) gUnk_08549AB4, gUnk_085499B4 },
    { 0, (void *) gUnk_08549F68, (u8 *) gUnk_0854F280, gUnk_0854F180 },
    { 0, (void *) Img_Cg_36, (u8 *) gUnk_08554730, (u16 *) Pal_Cg_36 },
    { 0, (void *) Img_Cg_37, (u8 *) gUnk_08559C24, (u16 *) Pal_Cg_37 },
    { 0, (void *) Img_Cg_38, (u8 *) gUnk_0855ADB0, (u16 *) Pal_Cg_38 },
    { 0, (void *) Img_Cg_39, (u8 *) gUnk_0856007C, (u16 *) Pal_Cg_39 },
    { 0, (void *) Img_Cg_3A, (u8 *) gUnk_08565468, (u16 *) Pal_Cg_3A },
    { 0, (void *) Img_Cg_3B, (u8 *) gUnk_0856AA94, (u16 *) Pal_Cg_3B },
    { 0, (void *) Img_Cg_3C, (u8 *) gUnk_0856FDE8, (u16 *) Pal_Cg_3C },
    { 0, (void *) Img_Cg_3D, (u8 *) gUnk_085744DC, (u16 *) Pal_Cg_3D },
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

SECTION(".rodata.08CED6D0")
u8 const * const Cg_Parts_00[] = {
    Img_Cg_00_0,
    Img_Cg_00_1,
    Img_Cg_00_2,
    Img_Cg_00_3,
    Img_Cg_00_4,
    Img_Cg_00_5,
    Img_Cg_00_6,
    Img_Cg_00_7,
    Img_Cg_00_8,
    Img_Cg_00_9,
};

SECTION(".rodata.08CED6F8")
u8 const * const Cg_Parts_01[] = {
    Img_Cg_01_0,
    Img_Cg_01_1,
    Img_Cg_01_2,
    Img_Cg_01_3,
    Img_Cg_01_4,
    Img_Cg_01_5,
    Img_Cg_01_6,
    Img_Cg_01_7,
    Img_Cg_01_8,
    Img_Cg_01_9,
};

SECTION(".rodata.08CED720")
u8 const * const Cg_Parts_02[] = {
    Img_Cg_02_0,
    Img_Cg_02_1,
    Img_Cg_02_2,
    Img_Cg_02_3,
    Img_Cg_02_4,
    Img_Cg_02_5,
    Img_Cg_02_6,
    Img_Cg_02_7,
    Img_Cg_02_8,
    Img_Cg_02_9,
};

SECTION(".rodata.08CED748")
u8 const * const Cg_Parts_03[] = {
    Img_Cg_03_0,
    Img_Cg_03_1,
    Img_Cg_03_2,
    Img_Cg_03_3,
    Img_Cg_03_4,
    Img_Cg_03_5,
    Img_Cg_03_6,
    Img_Cg_03_7,
    Img_Cg_03_8,
    Img_Cg_03_9,
};

SECTION(".rodata.08CED770")
u8 const * const Cg_Parts_04[] = {
    Img_Cg_04_0,
    Img_Cg_04_1,
    Img_Cg_04_2,
    Img_Cg_04_3,
    Img_Cg_04_4,
    Img_Cg_04_5,
    Img_Cg_04_6,
    Img_Cg_04_7,
    Img_Cg_04_8,
    Img_Cg_04_9,
};

SECTION(".rodata.08CED798")
u8 const * const Cg_Parts_05[] = {
    Img_Cg_05_0,
    Img_Cg_05_1,
    Img_Cg_05_2,
    Img_Cg_05_3,
    Img_Cg_05_4,
    Img_Cg_05_5,
    Img_Cg_05_6,
    Img_Cg_05_7,
    Img_Cg_05_8,
    Img_Cg_05_9,
};

SECTION(".rodata.08CED7C0")
u8 const * const Cg_Parts_06[] = {
    Img_Cg_06_0,
    Img_Cg_06_1,
    Img_Cg_06_2,
    Img_Cg_06_3,
    Img_Cg_06_4,
    Img_Cg_06_5,
    Img_Cg_06_6,
    Img_Cg_06_7,
    Img_Cg_06_8,
    Img_Cg_06_9,
};

SECTION(".rodata.08CED7E8")
u8 const * const Cg_Parts_07[] = {
    Img_Cg_07_0,
    Img_Cg_07_1,
    Img_Cg_07_2,
    Img_Cg_07_3,
    Img_Cg_07_4,
    Img_Cg_07_5,
    Img_Cg_07_6,
    Img_Cg_07_7,
    Img_Cg_07_8,
    Img_Cg_07_9,
};

SECTION(".rodata.08CED810")
u8 const * const Cg_Parts_08[] = {
    Img_Cg_08_0,
    Img_Cg_08_1,
    Img_Cg_08_2,
    Img_Cg_08_3,
    Img_Cg_08_4,
    Img_Cg_08_5,
    Img_Cg_08_6,
    Img_Cg_08_7,
    Img_Cg_08_8,
    Img_Cg_08_9,
};

SECTION(".rodata.08CED838")
u8 const * const Cg_Parts_09[] = {
    Img_Cg_09_0,
    Img_Cg_09_1,
    Img_Cg_09_2,
    Img_Cg_09_3,
    Img_Cg_09_4,
    Img_Cg_09_5,
    Img_Cg_09_6,
    Img_Cg_09_7,
    Img_Cg_09_8,
    Img_Cg_09_9,
};

SECTION(".rodata.08CED860")
u8 const * const Cg_Parts_0A[] = {
    Img_Cg_0A_0,
    Img_Cg_0A_1,
    Img_Cg_0A_2,
    Img_Cg_0A_3,
    Img_Cg_0A_4,
    Img_Cg_0A_5,
    Img_Cg_0A_6,
    Img_Cg_0A_7,
    Img_Cg_0A_8,
    Img_Cg_0A_9,
};
