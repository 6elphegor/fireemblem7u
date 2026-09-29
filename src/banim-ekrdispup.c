#include "gbafe.h"

/**
 * Battle name / weapon display (fireemblem8u: banim-ekrdispup.c)
 */

struct ProcEkrDispUP {
    PROC_HEADER;

    /* 29 */ u8 sync;
    /* 2A */ u8 asnyc;
    STRUCT_PAD(0x2B, 0x32);
    /* 32 */ u16 x;
    STRUCT_PAD(0x34, 0x3A);
    /* 3A */ u16 y;
    STRUCT_PAD(0x3C, 0x4C);
    /* 4C */ int unk4C;
    /* 50 */ int unk50;
};
PROC_SIZE_CHECK(struct ProcEkrDispUP);

extern struct ProcEkrDispUP * gpProcEkrDispUP;
extern const struct ProcCmd ProcScr_ekrDispUP[];

extern s16 gEkrDistanceType;
extern s16 gEkrDebugModeMaybe;
extern s16 gEkrInitialHitSide;
extern u8 gEkrPids[2];
extern s16 gBanimFloorfx[2];
extern s16 gEkrSnowWeather;
extern u8 gUnk_Banim_020145C8[];
extern void * gUnknown_0200003C[2];
extern u16 * gBanimTerrainPaletteMaybe[2];
extern const void * gUnknown_02000044[2];
extern void * TsaConfs_BanimTmA[];

extern struct Font gBanimFont;
extern struct Text gBanimText[];
extern const char gNopStr[];

extern const u8 Tsa_EkrDispUpLeft[];
extern const u8 Tsa_EkrDispUpRight[];
extern const u8 Img_EkrDispUpBase[];
extern const u8 Img_EfxLeftNameBox[];
extern const u8 Img_EfxLeftItemBox[];
extern const u8 Img_EfxRightNameBox[];
extern const u8 Img_EfxRightItemBox[];
extern const u16 Tsa_EkrDispUpSide[];
extern const u16 Pal_EkrDispUp[];

extern u32 gEkrHpBarCount;
extern u32 gEfxSpellAnimExists;
extern int gUnknown_02017730;
extern u32 gEkrDeadEventExist;
extern int gEfxQuakeExist;
extern int gEfxHitQuakeExist;
extern int gEfxFarAttackExist;
extern int gEfxBgSemaphore;
extern u32 gEfxHpBarResireFlag;
extern int gUnknown_02017754;
extern u32 gUnknown_0201775C;
extern s16 gUnknown_02017764[2];
extern s16 gEfxSpecalEffectExist[2];
extern s16 gEkrHitNow[2];
extern ProcPtr gpProcEfxSpellCast;
extern ProcPtr gpProcEfxHpBarColorChange;

void EkrDispUpClear4C50(void);
void ekrDispUPMain(struct ProcEkrDispUP * proc);
void sub_0804D0B8(void);
void EfxPrepareScreenFx(void);
int GetBattleAnimArenaFlag(void);
s8 CheckBattleTalk(u8 pida, u8 pidb);

void NewEkrDispUP(void)
{
    gpProcEkrDispUP = Proc_Start(ProcScr_ekrDispUP, PROC_TREE_5);
    EkrDispUP_SetPositionUnsync(0, 0);
    EkrDispUpClear4C50();
    UnAsyncEkrDispUP();
    UnsyncEkrDispUP();
}

void EndEkrDispUP(void)
{
    Proc_End(gpProcEkrDispUP);
}

void EkrDispUpClear4C50(void)
{
    gpProcEkrDispUP->unk4C = 0;
    gpProcEkrDispUP->unk50 = 0;
}

void EkrDispUpSet4C50(void)
{
    gpProcEkrDispUP->unk4C = 1;
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUpSet4C(void)
{
    gpProcEkrDispUP->unk4C = 1;
}

void EkrDispUpSet50(void)
{
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUP_SetPositionUnsync(u16 x, u16 y)
{
    gpProcEkrDispUP->x = x;
    gpProcEkrDispUP->y = y;
    gpProcEkrDispUP->sync = 0;
}

void EkrDispUP_SetPositionSync(u16 x, u16 y)
{
    gpProcEkrDispUP->x = x;
    gpProcEkrDispUP->y = y;
    gpProcEkrDispUP->sync = 1;
}

void SyncEkrDispUP(void)
{
    gpProcEkrDispUP->sync = true;
}

void UnsyncEkrDispUP(void)
{
    gpProcEkrDispUP->sync = false;
}

void AsyncEkrDispUP(void)
{
    gpProcEkrDispUP->asnyc = true;
}

void UnAsyncEkrDispUP(void)
{
    gpProcEkrDispUP->asnyc = false;
}

void ekrDispUPMain(struct ProcEkrDispUP * proc)
{
    int val0, iy, height, map_idx, ix1;
    int ix2 = 15;

    if (proc->asnyc == true)
        return;

    if (proc->sync != false)
        return;

    val0 = (proc->y << 0x10) >> 0x13;
    iy = val0 << 5;
    if (iy < 0)
        iy = 0;

    height = val0 + 7;
    if (height > 6)
        height = 6;

    map_idx = 30 * (6 - height);

    if (gEkrDistanceType >= 0)
    {
        if (gEkrDistanceType <= 2)
            ix1 = 0;
        else
            goto label;
    }
    else
    {
        ix1 = 0;
    label:
        ix1 = 15;
    }

    FillBGRect(gBg0Tm, 30, 7, 0, 0x9F);

    if (height > 0) {
        if (proc->unk4C == 0) {
            EfxTmCpyBG(&Tsa_EkrDispUpLeft[map_idx], gBg0Tm + iy + ix1, 15, height, -1, -1);
            sub_0806693C(gBg0Tm + iy + ix1, 15, height, 2, 0x80);
        }

        if (proc->unk50 == 0) {
            EfxTmCpyBG(&Tsa_EkrDispUpRight[map_idx], gBg0Tm + iy + ix2, ix2, height, -1, -1);
            sub_0806693C(gBg0Tm + iy + ix2, 15, height, 3, 0x80);
        }
    }

    EnableBgSync(BG0_SYNC_BIT);
}

void EfxClearScreenFx(void)
{
    gDispIo.disp_ct.mode = 0;
    SetDispEnable(1, 1, 1, 1, 1);
    gDispIo.disp_ct.obj_mapping = 0;

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    SetBgChrOffset(0, 0);
    SetBgChrOffset(1, 0);
    SetBgChrOffset(2, 0);
    SetBgChrOffset(3, 0x8000);

    SetBgTilemapOffset(0, 0x6000);
    SetBgTilemapOffset(1, 0x6800);
    SetBgTilemapOffset(2, 0x7000);
    SetBgTilemapOffset(3, 0x7800);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    CpuFastFill16(0, gBg0Tm, 0x800);
    CpuFastFill16(0, gBg1Tm, 0x800);
    CpuFastFill16(0, gBg2Tm, 0x800);

    if (GetBattleAnimArenaFlag() == false)
        sub_0804D0B8();
    else
        CpuFastFill16(0, gBg2Tm, 0x800);

    EfxPrepareScreenFx();
    EnablePalSync();

    EnableBgSync(BG0_SYNC_BIT);
    EnableBgSync(BG1_SYNC_BIT);
    EnableBgSync(BG2_SYNC_BIT);
    SetBlendNone();
}

void sub_0804D0B8(void)
{
    struct BanimUnkStructComm * conf = &EkrMainMiniConf_0201FAD0;
    struct BattleAnimTerrain * terrain1 = &battle_terrain_table[gBanimFloorfx[0]];
    struct BattleAnimTerrain * terrain2 = &battle_terrain_table[gBanimFloorfx[1]];

    switch (gEkrDistanceType) {
    case 0:
    case 4:
        gUnknown_0200003C[0] = &gUnk_Banim_020145C8[0];
        gUnknown_0200003C[1] = &gUnk_Banim_020145C8[0x1000];
        break;

    case 1:
    case 2:
    case 3:
        gUnknown_0200003C[0] = &gUnk_Banim_020145C8[0x800];
        gUnknown_0200003C[1] = &gUnk_Banim_020145C8[0x1800];
        break;
    }

    switch (gPlaySt.chapterWeatherId) {
    case WEATHER_SNOW:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;

    default:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;
    }

    gUnknown_02000044[0] = TsaConfs_BanimTmA[gEkrDistanceType * 2];
    gUnknown_02000044[1] = TsaConfs_BanimTmA[gEkrDistanceType * 2 + 1];

    conf->unk00 = gBanimFloorfx[0];
    conf->unk02 = 4;
    conf->unk04 = 640;
    conf->unk06 = gBanimFloorfx[1];
    conf->unk08 = 5;
    conf->unk0A = 640;
    conf->unk0C = gEkrDistanceType;
    conf->unk0E = 2;
    conf->unk1C = 0;
    conf->unk20 = &gUnk_Banim_020145C8[0];
    conf->unk10 = (u16)gEkrSnowWeather;
    sub_08054F30(conf);
}

void EfxPrepareScreenFx(void)
{
    const char * str;

    ApplyPalette(Pal_Text, 2);
    ApplyPalette(Pal_Text, 3);
    InitTextFont(&gBanimFont, (void *)(VRAM + 0x1400), 0xA0, 2);
    SetTextDrawNoClear();
    LZ77UnCompVram(Img_EkrDispUpBase, (void *)(VRAM + 0x1000));

    /* left unit name */
    if (gBanimValid[EKR_POS_L] == false)
        str = gNopStr;
    else
        str = DecodeMsg(gpEkrBattleUnitLeft->unit.pCharacterData->nameTextId);

    InitText(&gBanimText[0], 6);
    Text_SetCursor(&gBanimText[0], GetStringTextCenteredPos(0x30, str));
    LZ77UnCompVram(Img_EfxLeftNameBox, (void *)(VRAM + 0x1400));
    Text_DrawString(&gBanimText[0], str);

    /* left unit item */
    if (gBanimValid[EKR_POS_L] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitLeft->weaponBefore);

    InitText(&gBanimText[2], 7);
    Text_SetCursor(&gBanimText[2], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(Img_EfxLeftItemBox, (void *)(VRAM + 0x1580));
    Text_DrawString(&gBanimText[2], str);

    /* right unit name */
    if (gBanimValid[EKR_POS_R] == false)
        str = gNopStr;
    else
        str = DecodeMsg(gpEkrBattleUnitRight->unit.pCharacterData->nameTextId);

    InitText(&gBanimText[3], 6);
    Text_SetCursor(&gBanimText[3], GetStringTextCenteredPos(0x30, str));
    LZ77UnCompVram(Img_EfxRightNameBox, (void *)(VRAM + 0x1740));
    Text_DrawString(&gBanimText[3], str);

    /* right unit item */
    if (gBanimValid[EKR_POS_R] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitRight->weaponBefore);

    InitText(&gBanimText[1], 7);
    Text_SetCursor(&gBanimText[1], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(Img_EfxRightItemBox, (void *)(VRAM + 0x18C0));
    Text_DrawString(&gBanimText[1], str);

    TmFill(gBg0Tm, 0x9F);
    EfxTmCpyBG(Tsa_EkrDispUpSide, gBg0Tm + 0x1E, 2, 20, -1, -1);
    sub_0806693C(gBg0Tm + 0x1F, 1, 20, 2, 0x80);
    sub_0806693C(gBg0Tm + 0x1E, 1, 20, 3, 0x80);
    EnableBgSync(BG0_SYNC_BIT);

    CpuFastCopy(&PAL_BUF_COLOR(Pal_EkrDispUp, gBanimFactionPal[EKR_POS_L], 0), PAL_BG(0x2), 0x20);
    CpuFastCopy(&PAL_BUF_COLOR(Pal_EkrDispUp, gBanimFactionPal[EKR_POS_R], 0), PAL_BG(0x3), 0x20);
    EnablePalSync();

    gEkrBg0QuakeVec.x = 0;
    gEkrBg0QuakeVec.y = 0;
    SetBgOffset(0, 0, 0);
}

int GetBanimInitPosReal(void)
{
    int quote1, quote2;

    switch (gEkrDistanceType) {
    case 1:
        return gEkrInitialHitSide;

    case 0:
    case 3:
    case 4:
        return EKR_POS_R;

    case 2:
    default:
        quote2 = false;
        quote1 = false;

        if (gEkrDebugModeMaybe == 0) {
            quote1 = CheckBattleTalk(gEkrPids[EKR_POS_L], gEkrPids[EKR_POS_R]);
            quote2 = CheckBattleTalk(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);
        }

        if (quote1 == true)
            return EKR_POS_L;
        else if (quote2 == true)
            return EKR_POS_R;
        else
            return gEkrInitialHitSide;
    }
}

static inline void SetEkrBg2QuakeVec(int a, int b)
{
    gEkrBg2QuakeVec.x = a;
    gEkrBg2QuakeVec.y = b;
}

void EkrEfxStatusClear(void)
{
    gEkrHpBarCount = 0;
    gEfxSpellAnimExists = 0;
    gUnknown_02017730 = 0;
    gEkrDeadEventExist = 0;
    gEfxQuakeExist = 0;
    gEfxHitQuakeExist = 0;
    gEfxFarAttackExist = 0;
    gEfxBgSemaphore = 0;
    gEfxHpBarResireFlag = 0;
    gUnknown_02017754 = 0;
    gEfxTeonoState = 0;
    gUnknown_0201775C = 0;
    SetEkrBg2QuakeVec(0, 0);
    gUnknown_02017764[0] = 0;
    gUnknown_02017764[1] = 0;
    gEfxSpecalEffectExist[0] = 0;
    gEfxSpecalEffectExist[1] = 0;
    gEkrHitNow[0] = 0;
    gEkrHitNow[1] = 0;

    gpProcEfxStatusUnits[EKR_POS_L] = NULL;
    gpProcEfxStatusUnits[EKR_POS_R] = NULL;

    gpProcEfxSpellCast = NULL;
    gpProcEfxHpBarColorChange = NULL;
}

SECTION(".rodata.08B9ABAC")
const struct ProcCmd ProcScr_ekrDispUP[] = {
    PROC_19,
    PROC_REPEAT(ekrDispUPMain),
    PROC_END,
};
