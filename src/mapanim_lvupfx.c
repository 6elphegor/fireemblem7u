#include "gbafe.h"

extern u8 const Img_ManimLevelUpFrame[];
extern u8 const Tsa_ManimLevelUpFrame[];
extern u16 const Pal_ManimLevelUpFrame[];
extern u8 const Img_ManimLevelUpStatGain[];
extern u8 const Img_ManimLevelUpStatGainDigits[];
extern u16 const SpriteAnim_ManimLevelUpStatGain[];

extern int const gMid_Lv;
extern int const gMid_Hp;
extern int const gMid_Str;
extern int const gMid_Mag;
extern int const gMid_Skl;
extern int const gMid_Spd;
extern int const gMid_Lck;
extern int const gMid_Def;
extern int const gMid_Res;
extern int const gMid_Con;

CONST_DATA struct ManimLevelUpLabelInfo gManimLevelUpLabelInfoList[] = {
    { 9, 0, { 0 }, { &gMid_Lv, &gMid_Lv } },
    { 1, 4, { 0 }, { &gMid_Hp, &gMid_Hp } },
    { 1, 6, { 0 }, { &gMid_Str, &gMid_Mag } },
    { 1, 8, { 0 }, { &gMid_Skl, &gMid_Skl } },
    { 1, 10, { 0 }, { &gMid_Spd, &gMid_Spd } },
    { 9, 4, { 0 }, { &gMid_Lck, &gMid_Lck } },
    { 9, 6, { 0 }, { &gMid_Def, &gMid_Def } },
    { 9, 8, { 0 }, { &gMid_Res, &gMid_Res } },
    { 9, 10, { 0 }, { &gMid_Con, &gMid_Con } },
    { 0xFF, 0xFF },
};

CONST_DATA struct ProcCmd ProcScr_ManimLevelUpStatGainLabel[] = {
    PROC_SET_END_CB(ManimLevelUpStatGainLabel_Finish),
    PROC_BLOCK,
};

CONST_DATA struct ProcCmd ProcScr_ManimLevelUpLabelColor[] = {
    PROC_CALL(ManimLevelUpLabelColor_Init),
    PROC_REPEAT(ManimLevelUpLabelColor_Loop),
    PROC_END,
};

void PutManimLevelUpFrame(int actor, int x, int y)
{
    int i;

    TmFill(gBg1Tm, 0);

    Decompress(Img_ManimLevelUpFrame, (void *)(VRAM) + GetBgChrOffset(1) + 0x200 * 0x20);
    Decompress(Tsa_ManimLevelUpFrame, gBuf);
    PutTmLinear((u16 const *)gBuf, gBg1Tm, 0x20 * 0x1C, TILEREF(0x200, 5));
    ApplyPalette(Pal_ManimLevelUpFrame, 5);

    PutString(
        gBg0Tm + ((y << 5) + (x + 1)), 0,
        DecodeMsg(gManimSt.actor[actor].unit->pClassData->nameTextId));

    for (i = 0; gManimLevelUpLabelInfoList[i].x != 0xFF; i++)
    {
        PutStringCentered(
            gBg0Tm + (((gManimLevelUpLabelInfoList[i].y + y) << 5) + (gManimLevelUpLabelInfoList[i].x + x)),
            3, 3,
            DecodeMsg(*gManimLevelUpLabelInfoList[i].msg[UnitHasMagicRank(gManimSt.actor[actor].unit) == TRUE]));
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PutManimLevelUpStat(int actor, int x, int y, int stat_num, bool after_gain)
{
    PutNumberOrBlank(
        gBg0Tm + (((gManimLevelUpLabelInfoList[stat_num].y + y) << 5) + (gManimLevelUpLabelInfoList[stat_num].x + x + 4)),
        2,
        GetManimLevelUpBaseStat(actor, stat_num) + (after_gain ? GetManimLevelUpStatGain(actor, stat_num) : 0));
}

int GetManimLevelUpStatGain(int actor, int stat_num)
{
    switch (stat_num)
    {
    case 0:
        return 1;

    case 1:
        return gManimSt.actor[actor].bu->changeHP;

    case 2:
        return gManimSt.actor[actor].bu->changePow;

    case 3:
        return gManimSt.actor[actor].bu->changeSkl;

    case 4:
        return gManimSt.actor[actor].bu->changeSpd;

    case 5:
        return gManimSt.actor[actor].bu->changeLck;

    case 6:
        return gManimSt.actor[actor].bu->changeDef;

    case 7:
        return gManimSt.actor[actor].bu->changeRes;

    case 8:
        return gManimSt.actor[actor].bu->changeCon;

    default:
        return 0;
    }
}

int GetManimLevelUpBaseStat(int actor, int stat_num)
{
    struct Unit * unit = GetUnit(gManimSt.actor[actor].unit->index);

    switch (stat_num)
    {
    case 0:
        return gManimSt.actor[actor].bu->levelPrevious;

    case 1:
        return unit->maxHP;

    case 2:
        return unit->pow;

    case 3:
        return unit->skl;

    case 4:
        return unit->spd;

    case 5:
        return unit->lck;

    case 6:
        return unit->def;

    case 7:
        return unit->res;

    case 8:
        return UNIT_CON_BASE(unit);

    default:
        return 0;
    }
}

void ManimLevelUpStatGainLabel_Finish(struct ManimLevelUpStatGainLabelProc * proc)
{
    EndEachSpriteAnimProc();
}

void StartManimLevelUpStatGainLabels(int chr, int pal, int sprite_layer, ProcPtr parent)
{
    struct ManimLevelUpStatGainLabelProc * proc_a;
    struct ManimLevelUpLabelColorProc * proc_b;

    proc_a = Proc_Start(ProcScr_ManimLevelUpStatGainLabel, parent);

    proc_a->chr = chr;
    proc_a->pal = pal;
    proc_a->sprite_layer = sprite_layer;

    Decompress(Img_ManimLevelUpStatGain, OBJ_VRAM0 + (OAM2_CHR(chr) << 5));
    ApplyPalette(Pal_ManimLevelUpStatGain, 0x10 + pal);
    ApplyPalette(Pal_ManimLevelUpStatGain, 0x10 + pal + 1);

    proc_b = Proc_Start(ProcScr_ManimLevelUpLabelColor, proc_a);
    proc_b->pal = pal;
}

void EndManimLevelUpStatGainLabels(void)
{
    Proc_EndEach(ProcScr_ManimLevelUpStatGainLabel);
}

void StartManimLevelUpStatGainLabelAnim(int x, int y, int stat_num, int stat_gain)
{
    int stat_loss;
    int chr_common, chr_this_stat;
    struct ManimLevelUpStatGainLabelProc * proc;
    u8 const * digits_chr = Img_ManimLevelUpStatGainDigits;

    proc = Proc_Find(ProcScr_ManimLevelUpStatGainLabel);
    chr_common = proc->chr;
    chr_this_stat = proc->chr + (stat_num - 1) * 2;

    if (stat_num == 0)
    {
        StartSpriteAnimProc(SpriteAnim_ManimLevelUpStatGain,
            x - 18, y - 4,
            OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
            0, 2);
    }
    else
    {
        if (stat_gain > 0)
            stat_loss = 0;
        else
            stat_loss = 1;

        StartSpriteAnimProc(SpriteAnim_ManimLevelUpStatGain,
            x, y,
            OAM2_PAL(proc->pal + stat_loss) + chr_common + OAM2_LAYER(proc->sprite_layer),
            1 + stat_loss, 2);

        StartSpriteAnimProc(SpriteAnim_ManimLevelUpStatGain,
            x - 3, y,
            OAM2_PAL(proc->pal) + chr_this_stat + OAM2_LAYER(proc->sprite_layer),
            3 + stat_loss, 2);

        if (stat_gain > 0)
        {
            StartSpriteAnimProc(SpriteAnim_ManimLevelUpStatGain,
                x - 18, y - 4,
                OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
                0, 2);
        }

        if (stat_gain < 0)
        {
            VramCopy(digits_chr + 0x20 * 0x20,
                OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4C) << 5), 0x20);
        }

        VramCopy(digits_chr + (OAM2_CHR(ABS(stat_gain)) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x2D) << 5), 0x20);

        VramCopy(digits_chr + (OAM2_CHR(ABS(stat_gain) + 0x20) << 5),
            OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4D) << 5), 0x20);
    }
}

void StartPrepItemBoostStatGainLabelAnim(int x, int y, int stat_gain)
{
    int chr_common, chr_this_stat;
    struct ManimLevelUpStatGainLabelProc * proc;
    u8 const * digits_chr = Img_ManimLevelUpStatGainDigits;

    proc = Proc_Find(ProcScr_ManimLevelUpStatGainLabel);
    chr_common = proc->chr;
    chr_this_stat = proc->chr + (stat_gain - 1) * 2;

    StartSpriteAnimProc(SpriteAnim_ManimLevelUpStatGain,
        x, y,
        OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
        5, 2);

    StartSpriteAnimProc(SpriteAnim_ManimLevelUpStatGain,
        x - 3, y,
        OAM2_PAL(proc->pal) + chr_this_stat + OAM2_LAYER(proc->sprite_layer),
        3, 2);

    StartSpriteAnimProc(SpriteAnim_ManimLevelUpStatGain,
        x - 18, y - 4,
        OAM2_PAL(proc->pal) + chr_common + OAM2_LAYER(proc->sprite_layer),
        0, 2);

    VramCopy(digits_chr + (OAM2_CHR(stat_gain) << 5),
        OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x2D) << 5), 0x20);

    VramCopy(digits_chr + (OAM2_CHR(stat_gain + 0x20) << 5),
        OBJ_VRAM0 + (OAM2_CHR(chr_this_stat + 0x4D) << 5), 0x20);
}
