#include "gbafe.h"

extern int const gMid_Hp;
extern int const gMid_Mag;
extern int const gMid_Str;

/**
 * Level-up window in battle animations (fireemblem8u: banim-ekrlvup.c)
 */

enum {
    EKRLVUP_STAT_HP,
    EKRLVUP_STAT_POW,
    EKRLVUP_STAT_SKL,
    EKRLVUP_STAT_SPD,
    EKRLVUP_STAT_LCK,
    EKRLVUP_STAT_DEF,
    EKRLVUP_STAT_RES,
    EKRLVUP_STAT_CON,

    EKRLVUP_STAT_MAX,
};

#define EKR_LVUP_UI_BASE 0x50

struct ProcEkrLevelup {
    PROC_HEADER;

    /* 29 */ u8 finished;
    /* 2A */ u8 is_promotion;

    STRUCT_PAD(0x2B, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 index;

    STRUCT_PAD(0x30, 0x44);

    /* 44 */ int unk_44;
    /* 48 */ int unk_48;
    /* 4C */ int unk_4C;
    /* 50 */ int unk_50;

    STRUCT_PAD(0x54, 0x5C);

    /* 5C */ struct Anim * ais_main;
    /* 60 */ struct Anim * ais_core;
};
PROC_SIZE_CHECK(struct ProcEkrLevelup);

extern struct ProcEkrLevelup * gpProcEkrLevelup;
extern u32 gUnknown_020200B0[8];
extern ProcPtr gpProcEfxPartsofScroll;
extern ProcPtr gpProcEfxleveluphb;
extern struct BanimUnkStructComm gUnknown_020200D8;
extern struct Unit * gpEkrLvupUnit;
extern struct BattleUnit * gpEkrLvupBattleUnit;
extern u16 gEkrLvupPreLevel;
extern u16 gEkrLvupPostLevel;
extern u16 gEkrLvupBaseStatus[EKRLVUP_STAT_MAX];
extern u16 gEkrLvupPostStatus[EKRLVUP_STAT_MAX];
extern u16 gEkrLvupScrollPos1;
extern u16 gEkrLvupScrollPos2;

extern const u16 sEfxLvupPartsPos[];
extern const struct FaceVramEnt gEkrLvupFaceConfig[];
extern const int * const EkrLvupMsgsStr[];
extern const int * const EkrLvupMsgsMag[];
extern const struct ProcCmd ProcScr_EkrLevelup[];
extern unsigned gMid_Lv;

extern const u8 Img_LevelUpBoxFrame[];
extern const u8 Tsa_LevelUpBoxFrame[];
extern const u16 Pal_LevelUpBoxFrame[];
extern const u8 Img_LvupApfx[];
extern const u16 Pal_LvupApfx[];

extern struct Font gBanimFont;
extern struct Text gBanimText[];
extern u8 gSpellAnimBgfx[];
extern u8 gBuf_Banim[];
extern s16 gBanimFloorfx[2];
extern s16 gEkrSnowWeather;
extern u32 gEkrInitPosReal;
extern u8 gUnk_Banim_020145C8[];
extern u16 gEkrGaugeHpBak[2];
extern s16 gBanimMaxHP[2];

int GetBattleAnimArenaFlag(void);
void NewEfxSpellCast(void);
void RegisterEfxSpellCastEnd(void);
void DisableEfxHpBarColorChange(void);
void EnableEfxHpBarColorChange(void);
void sub_080552DC(struct BanimUnkStructComm * conf);
void EndFaceById(int slot);
void M4aPlayWithPostionCtrl(int songid, int x, int flag);

ProcPtr NewEfxPartsofScroll(void);
void EfxUpdatePartsofScroll(void);
ProcPtr NewEfxPartsofScroll2(void);
ProcPtr NewEfxleveluphb(void);
void EkrLvupHBlank(void);
void EfxPartsofScroll2HBlank(void);
void NewEfxlvupbg(struct Anim * anim);
void NewEfxLvupBG2(struct Anim * anim);
void NewEfxLvupOBJ2(struct Anim * anim, int x, int y);
void NewEfxLvupBGCOL(struct Anim * anim);
void NewEkrLvupApfx(int chr, int pal);
void EkrLvupApfxEndEach(void);
void BanimDrawStatupAp(int chr, int pal, int x, int y, int index, int gain);

void EkrLvup_DrawUnitName(struct ProcEkrLevelup * proc);
void EkrLvup_DrawPreLevelValue(struct ProcEkrLevelup * proc);

bool CheckEkrLvupDone(void)
{
    if (gpProcEkrLevelup->finished == true)
        return true;
    else
        return false;
}

void EndEkrLevelUp(void)
{
    Proc_End(gpProcEkrLevelup);
}

void EkrLvup_InitStatusText(struct ProcEkrLevelup * proc)
{
    int i;
    struct BattleUnit * bunit, * bunit2;
    struct Unit * unit;
    struct Text * th;

    if (proc->ais_main == NULL)
    {
        bunit2 = gpEkrBattleUnitLeft;
        gpEkrLvupUnit = unit = &bunit2->unit;
        if (&gpEkrBattleUnitRight == &gpEkrBattleUnitRight)
            gpEkrLvupBattleUnit = bunit = gpEkrBattleUnitRight;
    }
    else
    {
        bunit2 = gpEkrBattleUnitRight;
        gpEkrLvupUnit = unit = &bunit2->unit;
        if (&gpEkrBattleUnitLeft == &gpEkrBattleUnitLeft)
            gpEkrLvupBattleUnit = bunit = gpEkrBattleUnitLeft;
    }

    if (proc->is_promotion == false)
    {
        unit = GetUnit(unit->index);
        gEkrLvupPreLevel = bunit2->levelPrevious;
        gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->maxHP;
        gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
        gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
        gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
        gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
        gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->pClassData->baseCon + unit->pCharacterData->baseCon;
        gEkrLvupPostLevel = bunit2->levelPrevious + 1;
        gEkrLvupPostStatus[EKRLVUP_STAT_HP] = unit->maxHP + bunit2->changeHP;
        gEkrLvupPostStatus[EKRLVUP_STAT_POW] = unit->pow + bunit2->changePow;
        gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = unit->skl + bunit2->changeSkl;
        gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = unit->lck + bunit2->changeLck;
        gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = unit->spd + bunit2->changeSpd;
        gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = unit->def + bunit2->changeDef;
        gEkrLvupPostStatus[EKRLVUP_STAT_RES] = unit->res + bunit2->changeRes;
        gEkrLvupPostStatus[EKRLVUP_STAT_CON] = unit->pClassData->baseCon + unit->pCharacterData->baseCon + bunit2->changeCon;
    }
    else
    {
        gEkrLvupPreLevel = unit->level;
        gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->maxHP;
        gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
        gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
        gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
        gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
        gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->pClassData->baseCon + unit->pCharacterData->baseCon;
        gEkrLvupPostLevel = 1;
        gEkrLvupPostStatus[EKRLVUP_STAT_HP] = bunit->unit.maxHP;
        gEkrLvupPostStatus[EKRLVUP_STAT_POW] = bunit->unit.pow;
        gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = bunit->unit.skl;
        gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = bunit->unit.lck;
        gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = bunit->unit.spd;
        gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = bunit->unit.def;
        gEkrLvupPostStatus[EKRLVUP_STAT_RES] = bunit->unit.res;
        gEkrLvupPostStatus[EKRLVUP_STAT_CON] = bunit->unit.pClassData->baseCon + bunit->unit.pCharacterData->baseCon;
    }

    InitTextFont(&gBanimFont, (void *)BG_VRAM + 0x2400, 0x120, 0);

    for (i = 0; i < EKRLVUP_STAT_MAX; i++)
    {
        const char * str;
        int x;

        if (!UnitHasMagicRank(unit))
            str = DecodeMsg(*EkrLvupMsgsStr[i]);
        else
            str = DecodeMsg(*EkrLvupMsgsMag[i]);

        InitText(&gBanimText[i], 3);

        x = GetStringTextLen(str);
        x = (0x10 - x) >> 1;
        if (x < 0)
            x = 0;

        Text_SetCursor(&gBanimText[i], x);
        Text_SetColor(&gBanimText[i], TEXT_COLOR_SYSTEM_GOLD);
        Text_DrawString(&gBanimText[i], str);
        PutText(&gBanimText[i], gBg2Tm + sEfxLvupPartsPos[i]);
    }

    for (i = 0; i < EKRLVUP_STAT_MAX; i++)
    {
        InitText(&gBanimText[EKRLVUP_STAT_MAX + i], 2);
        Text_SetCursor(&gBanimText[EKRLVUP_STAT_MAX + i], 8);
        Text_SetColor(&gBanimText[EKRLVUP_STAT_MAX + i], TEXT_COLOR_SYSTEM_BLUE);
        Text_DrawNumber(&gBanimText[EKRLVUP_STAT_MAX + i], gEkrLvupBaseStatus[i]);
        PutText(&gBanimText[EKRLVUP_STAT_MAX + i], gBg2Tm + 3 + sEfxLvupPartsPos[i]);
    }

    th = &gBanimText[EKRLVUP_STAT_MAX + 8];
    InitText(th, 8);
    Text_DrawString(th, DecodeMsg(gpEkrLvupUnit->pClassData->nameTextId));
    PutText(th, gBg2Tm + TM_OFFSET(2, 7));

    th = &gBanimText[EKRLVUP_STAT_MAX + 9];
    InitText(th, 3);
    Text_SetColor(th, TEXT_COLOR_SYSTEM_GOLD);
    Text_DrawString(th, DecodeMsg(gMid_Lv));
    PutText(th, gBg2Tm + TM_OFFSET(10, 7));

    th = &gBanimText[EKRLVUP_STAT_MAX + 10];
    InitText(th, 2);
    Text_SetCursor(th, 8);
    Text_SetColor(th, TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumber(th, gEkrLvupPreLevel);
    PutText(th, gBg2Tm + TM_OFFSET(13, 7));
}

void EkrLvup_DrawUpdatedStatus(struct ProcEkrLevelup * proc, int index)
{
    ClearText(&gBanimText[EKRLVUP_STAT_MAX + index]);
    Text_SetCursor(&gBanimText[EKRLVUP_STAT_MAX + index], 8);
    Text_SetColor(&gBanimText[EKRLVUP_STAT_MAX + index], TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumber(&gBanimText[EKRLVUP_STAT_MAX + index], gEkrLvupBaseStatus[index]);
    PutText(&gBanimText[EKRLVUP_STAT_MAX + index], gBg2Tm + 3 + sEfxLvupPartsPos[index]);
}

void EkrLvup_DrawUnitName(struct ProcEkrLevelup * proc)
{
    ClearText(&gBanimText[EKRLVUP_STAT_MAX + 8]);
    Text_DrawString(&gBanimText[EKRLVUP_STAT_MAX + 8], DecodeMsg(gpEkrLvupUnit->pClassData->nameTextId));
    PutText(&gBanimText[EKRLVUP_STAT_MAX + 8], gBg2Tm + TM_OFFSET(2, 7));
}

void EkrLvup_DrawPreLevelValue(struct ProcEkrLevelup * proc)
{
    ClearText(&gBanimText[EKRLVUP_STAT_MAX + 10]);
    Text_SetCursor(&gBanimText[EKRLVUP_STAT_MAX + 10], 8);
    Text_SetColor(&gBanimText[EKRLVUP_STAT_MAX + 10], TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumber(&gBanimText[EKRLVUP_STAT_MAX + 10], gEkrLvupPreLevel);
    PutText(&gBanimText[EKRLVUP_STAT_MAX + 10], gBg2Tm + TM_OFFSET(13, 7));
}

void NewEkrLevelup(struct Anim * ais)
{
    struct ProcEkrLevelup * proc;

    gpProcEkrLevelup = proc = Proc_Start(ProcScr_EkrLevelup, PROC_TREE_3);
    proc->ais_main = ais;
    proc->ais_core = GetAnimAnotherSide(ais);

    if (gEkrDistanceType != 4)
        proc->is_promotion = false;
    else
        proc->is_promotion = true;

    proc->timer = 0;
    proc->finished = false;
}

void EkrLvup_OnPrepare(struct ProcEkrLevelup * proc)
{
    int timer;

    if (proc->is_promotion)
    {
        Proc_Break(proc);
        return;
    }

    timer = ++proc->timer;

    if (timer == 1)
    {
        NewEfxSpellCast();
        NewEfxLvupOBJ2(proc->ais_main, 0x78, 0x58);
        return;
    }

    if (timer == 25)
    {
        NewEfxLvupBG2(proc->ais_main);
        NewEfxLvupBGCOL(proc->ais_main);
        return;
    }

    if (timer == 59)
    {
        NewEfxlvupbg(proc->ais_main);
        return;
    }

    if (timer == 73)
    {
        RegisterEfxSpellCastEnd();
        return;
    }

    if (timer == 83)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
}

void EkrLvup_InitScreen(struct ProcEkrLevelup * proc)
{
    struct BanimUnkStructComm * buf = &gUnknown_020200D8;

    CpuFastFill(0, gBg1Tm, 0x800);
    CpuFastFill(0, gBg2Tm, 0x800);
    RegisterDataMove(gBg1Tm, (void *)BG_VRAM + 0x6800, 0x800);
    RegisterDataMove(gBg1Tm, (void *)BG_VRAM + 0x7000, 0x800);
    RegisterDataMove(gBg2Tm, (void *)BG_VRAM + 0x5000, 0x800);
    RegisterDataMove(gBg2Tm, (void *)BG_VRAM + 0x5800, 0x800);

    buf->unk00 = gBanimFloorfx[POS_L];
    buf->unk02 = 3;
    buf->unk04 = 0x100;
    buf->unk06 = gBanimFloorfx[POS_R];
    buf->unk08 = 4;
    buf->unk0A = 0x140;
    buf->unk0C = gEkrDistanceType;
    buf->unk0E = -1;
    buf->unk1C = (void *)OBJ_VRAM0;
    buf->unk20 = gUnk_Banim_020145C8;
    buf->unk10 = (u16)gEkrSnowWeather;

    if (gEkrDistanceType == 2)
    {
        if (gEkrInitPosReal == 0)
            buf->unk06 = -1;
        else
            buf->unk00 = -1;
    }

    if (GetBattleAnimArenaFlag() == false)
    {
        struct ProcEkrSubAnimeEmulator * _buf;

        sub_08054F30(buf);

        _buf = buf->proc14;
        _buf->oam2Base &= (u16)~OAM2_LAYER(0x3);
        _buf->oam2Base |=       OAM2_LAYER(0x3);

        _buf = buf->proc18;
        _buf->oam2Base &= (u16)~OAM2_LAYER(0x3);
        _buf->oam2Base |=       OAM2_LAYER(0x3);
    }

    proc->ais_main->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_main->oam2Base |=  OAM2_LAYER(0x3);
    proc->ais_core->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_core->oam2Base |=  OAM2_LAYER(0x3);

    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg0_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    gEkrLvupScrollPos1 = 0x90;
    gEkrLvupScrollPos2 = 0x90;

    SetBgOffset(2, 0, 8);
    SetBgOffset(1, 0, 8);

    SetBgTilemapOffset(0, 0x6000);
    SetBgTilemapOffset(1, 0x6800);
    SetBgTilemapOffset(2, 0x5000);
    SetBgScreenSize(1, 1);
    SetBgScreenSize(2, 1);

    gpProcEfxPartsofScroll = NewEfxPartsofScroll();
    gpProcEfxleveluphb = NewEfxleveluphb();
    EfxUpdatePartsofScroll();

    EkrGauge_0804CC68(2);
    DisableEfxStatusUnits(proc->ais_main);
    DisableEfxStatusUnits(proc->ais_core);
    DisableEfxWeaponIcon();
    DisableEfxHpBarColorChange();

    SetWinEnable(0, 0, 0);
    SetBlendNone();

    Proc_Break(proc);
}

void EkrLvup_InitLevelUpBox(struct ProcEkrLevelup * proc)
{
    int portrait;
    struct BattleUnit * bu1 = gpEkrBattleUnitLeft;
    struct BattleUnit * bu2 = gpEkrBattleUnitRight;
    struct Anim * anim = proc->ais_main;

    LZ77UnCompWram(Img_LevelUpBoxFrame, gSpellAnimBgfx);
    LZ77UnCompWram(Tsa_LevelUpBoxFrame, gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm + TM_OFFSET(0, 6), 0x20, 0x14, 1, 0x100);
    RegisterDataMove(gSpellAnimBgfx, (void *)BG_VRAM + 0x2000, 0x400);
    CpuFastCopy(Pal_LevelUpBoxFrame, PAL_BG(1), 0x20);

    LZ77UnCompWram(Img_LvupApfx, gBuf_Banim);
    RegisterDataMove(gBuf_Banim, (void *)OBJ_VRAM0 + 0x1400, 0xC00);
    CpuFastCopy(Pal_LvupApfx, PAL_OBJ(1), 0x20);
    EnablePalSync();

    proc->timer = EKR_LVUP_UI_BASE;

    if (GetAnimPosition(anim) == POS_L)
        portrait = bu1->unit.pCharacterData->portraitId;
    else
        portrait = bu2->unit.pCharacterData->portraitId;

    SetFaceConfig(gEkrLvupFaceConfig);
    StartFace(0, portrait, 0xBC, EKR_LVUP_UI_BASE, 0x1042);
    gFaces[0]->y_disp = 0xA0;

    CpuFastFill(0, gBg2Tm, 0x800);
    EkrLvup_InitStatusText(proc);
    Proc_Break(proc);
}

void EkrLvup_SetBgs(struct ProcEkrLevelup * proc)
{
    SetOnHBlankA(EkrLvupHBlank);
    EnableBgSync(BG0_SYNC_BIT);
    EnableBgSync(BG2_SYNC_BIT);
    EnableBgSync(BG1_SYNC_BIT);
    EnablePalSync();
    Proc_Break(proc);
}

void EkrLvup_InitPalette(struct ProcEkrLevelup * proc)
{
    if (++proc->timer > EKR_LVUP_UI_BASE)
    {
        proc->timer = 0;
        proc->unk_44 = 0;
        proc->unk_48 = 0;
        proc->unk_4C = -2;
        proc->unk_50 = -4;
        CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);
        Proc_Break(proc);
    }
}

void EkrLvup_PutWindowOnScreen(struct ProcEkrLevelup * proc)
{
    int a, b, c, d, pos, pal;

    a = proc->unk_44;
    b = proc->unk_48;
    c = proc->unk_4C;
    d = proc->unk_50;

    LIMIT_AREA_(a, 0, 8);
    LIMIT_AREA_(b, 0, 8);
    LIMIT_AREA_(c, 0, 8);
    LIMIT_AREA_(d, 0, 8);

    proc->unk_44++;
    proc->unk_48++;
    proc->unk_4C++;
    proc->unk_50++;

    pos = Interpolate(INTERPOLATE_LINEAR, -EKR_LVUP_UI_BASE, 0, a, 8);
    pal = Interpolate(INTERPOLATE_LINEAR, 0, 8, b, 8);
    gEkrLvupScrollPos1 = Interpolate(INTERPOLATE_LINEAR, 0x90, 0, c, 8);
    gEkrLvupScrollPos2 = Interpolate(INTERPOLATE_LINEAR, 0x90, 0, d, 8);

    gFaces[0]->y_disp = EKR_LVUP_UI_BASE - pos;

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 2, 4, pal);
    EfxPalBlackInOut(PAL_BG(0), 0x13, 0xC, pal);
    EnablePalSync();

    if (++proc->timer > 0x14)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_PrepareApGfx(struct ProcEkrLevelup * proc)
{
    int i;

    NewEkrLvupApfx(0xA0, 1);

    for (i = 0; i < 8; i++)
        gUnknown_020200B0[i] = 0;

    Proc_Break(proc);
}

void EkrLvup_Promo_WindowScroll0(struct ProcEkrLevelup * proc)
{
    if (proc->is_promotion == false)
    {
        Proc_Break(proc);
        return;
    }

    SetOnHBlankA(EfxPartsofScroll2HBlank);
    Proc_End(gpProcEfxPartsofScroll);
    gpProcEfxPartsofScroll = NewEfxPartsofScroll2();

    EfxPlaySE(0x2CD, 0x100);
    M4aPlayWithPostionCtrl(0x2CD, 0x38, 0);

    proc->timer = 0;
    proc->index = 8;
    Proc_Break(proc);
}

void EkrLvup_Promo_DrawPromoNewClassName(struct ProcEkrLevelup * proc)
{
    if (proc->is_promotion == false)
    {
        Proc_Break(proc);
        return;
    }

    gEkrLvupScrollPos1 = Interpolate(1, 0, 0x1000, proc->timer, proc->index);

    if (++proc->timer > proc->index)
    {
        gpEkrLvupUnit = &gpEkrLvupBattleUnit->unit;
        EkrLvup_DrawUnitName(proc);
        gEkrLvupPreLevel = gEkrLvupPostLevel;
        EkrLvup_DrawPreLevelValue(proc);
        proc->timer = 0;
        proc->index = 8;
        Proc_Break(proc);
    }
}

void EkrLvup_Promo_WindowScroll1(struct ProcEkrLevelup * proc)
{
    if (proc->is_promotion == false)
    {
        Proc_Break(proc);
        return;
    }

    gEkrLvupScrollPos1 = Interpolate(4, 0x1000, 0, proc->timer, proc->index);

    if (++proc->timer > proc->index)
        Proc_Break(proc);
}

void EkrLvup_DrawNewLevel(struct ProcEkrLevelup * proc)
{
    if (proc->is_promotion == false)
    {
        proc->timer = 0;
        BanimDrawStatupAp(0xA0, 1, 0x84, 0x3C, 0, 0);
        gEkrLvupPreLevel = gEkrLvupPostLevel;
        EkrLvup_DrawPreLevelValue(proc);
        EfxPlaySE(0x2CD, 0x100);
        M4aPlayWithPostionCtrl(0x2CD, 0x38, 0);
        Proc_Break(proc);
    }
    else
    {
        Proc_End(gpProcEfxPartsofScroll);
        gpProcEfxPartsofScroll = NewEfxPartsofScroll();
        proc->timer = 0;
        proc->index = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_InitCounterForMainAnim(struct ProcEkrLevelup * proc)
{
    if (proc->is_promotion != false)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer < 0x1E)
    {
        proc->timer = 0;
        proc->index = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_MainAnime(struct ProcEkrLevelup * proc)
{
    int base, diff;

    if (++proc->timer == 0x14)
    {
        proc->timer = 0;

        for (; proc->index != EKRLVUP_STAT_MAX; proc->index++)
        {
            base = gEkrLvupBaseStatus[proc->index];
            diff = gEkrLvupPostStatus[proc->index] - base;

            if (diff != 0)
            {
                gEkrLvupBaseStatus[proc->index] = gEkrLvupPostStatus[proc->index];
                EkrLvup_DrawUpdatedStatus(proc, proc->index);
                EfxPlaySE(0x396, 0x100);
                M4aPlayWithPostionCtrl(0x396, 0x38, 0);
                BanimDrawStatupAp(0xA0, 1,
                    0x35 + (sEfxLvupPartsPos[proc->index] & 0x1F) * 8,
                    6 + (sEfxLvupPartsPos[proc->index] & 0x7E0) / 4,
                    proc->index + 1,
                    diff);

                if (proc->index == EKRLVUP_STAT_HP)
                {
                    gBanimMaxHP[1] = gEkrLvupBaseStatus[proc->index];
                    gEkrGaugeHpBak[1] = -1;
                }

                proc->timer = 0;
                break;
            }
        }
    }

    if (proc->index == EKRLVUP_STAT_MAX)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_SetHBlank(struct ProcEkrLevelup * proc)
{
    if (++proc->timer > 0x6D)
    {
        proc->timer = 0;
        EkrLvupApfxEndEach();
        SetOnHBlankA(EkrLvupHBlank);
        Proc_Break(proc);
    }
}

void EkrLvup_DoNothing(struct ProcEkrLevelup * proc)
{
    Proc_Break(proc);
}

void EkrLvup_PutWindowOffScreen(struct ProcEkrLevelup * proc)
{
    int i, pos, pal;

    gEkrLvupScrollPos1 = Interpolate(INTERPOLATE_LINEAR, 0, 0x90, proc->timer, 8);
    gEkrLvupScrollPos2 = Interpolate(INTERPOLATE_LINEAR, 0, 0x90, proc->timer, 8);
    pos = Interpolate(INTERPOLATE_LINEAR, 0, -EKR_LVUP_UI_BASE, proc->timer, 8);
    pal = Interpolate(INTERPOLATE_LINEAR, 8, 0, proc->timer, 8);

    gFaces[0]->y_disp = EKR_LVUP_UI_BASE - pos;

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 2, 4, pal);
    EfxPalBlackInOut(PAL_BG(0), 0x13, 0xC, pal);
    EnablePalSync();

    for (i = 7; i >= 0; i--)
        ;

    if (++proc->timer > 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrLvup_ResetScreen(struct ProcEkrLevelup * proc)
{
    struct BanimUnkStructComm * buf, _buf;

    buf = &gUnknown_020200D8;

    if (GetBattleAnimArenaFlag() == false)
        sub_080552DC(buf);

    SetBgTilemapOffset(0, 0x6000);
    SetBgTilemapOffset(1, 0x6800);
    SetBgTilemapOffset(2, 0x7000);
    SetBgScreenSize(1, 0);
    SetBgScreenSize(2, 0);

    buf = &_buf;
    buf->unk00 = gBanimFloorfx[0];
    buf->unk02 = 4;
    buf->unk04 = 0x280;
    buf->unk06 = gBanimFloorfx[1];
    buf->unk08 = 5;
    buf->unk0A = 0x280;
    buf->unk0C = gEkrDistanceType;
    buf->unk0E = 2;
    buf->unk1C = NULL;
    buf->unk20 = gUnk_Banim_020145C8;
    buf->unk10 = gEkrSnowWeather;

    if (GetBattleAnimArenaFlag() == false)
    {
        SetBgOffset(2, 0, 0);
        sub_08054F30(&_buf);
    }

    proc->ais_main->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_main->oam2Base |=  OAM2_LAYER(0x2);
    proc->ais_core->oam2Base &= ~OAM2_LAYER(0x3);
    proc->ais_core->oam2Base |=  OAM2_LAYER(0x2);

    CpuFastFill(0, gBg1Tm, 0x800);
    EnableBgSync(BG1_SYNC_BIT);
    EkrGauge_0804CC68(0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    EndFaceById(0);
    Proc_Break(proc);
}

void EkrLvup_OnEnd(struct ProcEkrLevelup * proc)
{
    Proc_End(gpProcEfxPartsofScroll);
    Proc_End(gpProcEfxleveluphb);
    EnableEfxStatusUnits(proc->ais_main);
    EnableEfxStatusUnits(proc->ais_core);
    EnableEfxWeaponIcon();
    EnableEfxHpBarColorChange();
    proc->finished = true;
}

SECTION(".rodata.08BDB5FC")
const struct ProcCmd ProcScr_EkrLevelup[] = {
    PROC_19,
    PROC_REPEAT(EkrLvup_OnPrepare),
    PROC_REPEAT(EkrLvup_InitScreen),
    PROC_SLEEP(1),
    PROC_REPEAT(EkrLvup_InitLevelUpBox),
    PROC_REPEAT(EkrLvup_SetBgs),
    PROC_REPEAT(EkrLvup_InitPalette),
    PROC_REPEAT(EkrLvup_PutWindowOnScreen),
    PROC_REPEAT(EkrLvup_PrepareApGfx),
    PROC_SLEEP(20),
    PROC_REPEAT(EkrLvup_Promo_WindowScroll0),
    PROC_REPEAT(EkrLvup_Promo_DrawPromoNewClassName),
    PROC_REPEAT(EkrLvup_Promo_WindowScroll1),
    PROC_REPEAT(EkrLvup_DrawNewLevel),
    PROC_REPEAT(EkrLvup_InitCounterForMainAnim),
    PROC_REPEAT(EkrLvup_MainAnime),
    PROC_REPEAT(EkrLvup_SetHBlank),
    PROC_REPEAT(EkrLvup_DoNothing),
    PROC_REPEAT(EkrLvup_PutWindowOffScreen),
    PROC_REPEAT(EkrLvup_ResetScreen),
    PROC_REPEAT(EkrLvup_OnEnd),
    PROC_END,
};

SECTION(".rodata.08BDB5BC")
const int * const EkrLvupMsgsStr[] = {
    &gMid_Hp,
    &gMid_Str,
    &gMid_Skl,
    &gMid_Spd,
    &gMid_Lck,
    &gMid_Def,
    &gMid_Res,
    &gMid_Con,
};

SECTION(".rodata.08BDB5DC")
const int * const EkrLvupMsgsMag[] = {
    &gMid_Hp,
    &gMid_Mag,
    &gMid_Skl,
    &gMid_Spd,
    &gMid_Lck,
    &gMid_Def,
    &gMid_Res,
    &gMid_Con,
};
