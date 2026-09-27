#include "gbafe.h"

/* auto-decls */
extern u16 gTmA_Banim[0xB58 / sizeof(u16)];
void StartClassReelSpellAnim(struct Anim * anim);
void sub_08054A8C(struct Anim *);
void sub_08050798(u32 val);

struct BanimUnkStructCommPriv
{
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x32);
    /* 32 */ s16 unk32;
    /* 34 */ STRUCT_PAD(0x34, 0x3A);
    /* 3A */ s16 unk3A;
    /* 3C */ STRUCT_PAD(0x3C, 0x4C);
    /* 4C */ int unk4C;
};

struct ProcEkrUnitMainMini
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ void * unk_5C;
};
extern ProcPtr gpProcEfxAnimeDrv;
extern struct ProcCmd gProc_efxAnimeDrvProc[];
extern struct ProcCmd ProcScr_ekrUnitMainMini[];
extern u32 AnimScr_EkrMainMini_L_Close[];
extern u32 AnimScr_EkrMainMini_L_Far[];
extern u32 AnimScr_EkrMainMini_R_Close[];
extern u32 AnimScr_EkrMainMini_R_Far[];
extern void *TsaConfs_BanimTmA[];
extern u32 gEkrInitPosReal;
// MISSING var gTmA_Banim
extern u16 gBg2Tm[32 * 32];
extern u16 gUnknown_081D85AE[];
extern u32 gUnknown_0201775C;

void sub_080548CC(struct AnimBuffer * pAnimBuf, struct Anim * anim);
void sub_08054A68(struct Anim * anim);
void InitMainMiniAnim(struct AnimBuffer * pAnimBuf);
void sub_08054E00(struct AnimBuffer * pAnimBuf, int animId, int charPalId);
void sub_08054E2C(struct AnimBuffer * pAnimBuf, u16 layer);
bool sub_08054E3C(struct AnimBuffer * pAnimBuf);
bool sub_08054E70(struct AnimBuffer * pAnimBuf);
void ExecAllAIS(void);
void EkrUnitMainMiniMain(struct ProcEkrUnitMainMini * proc);
void sub_080552DC(struct BanimUnkStructComm * buf);
void sub_08055308(struct BanimUnkStructComm * buf, s16 a, s16 b, s16 c, s16 d);
void sub_08055320(struct BanimUnkStructComm * buf);
void sub_08055468(s16 distance, s16 position);



void sub_080548CC(struct AnimBuffer * pAnimBuf, struct Anim * anim)
{
    int state;

    if (anim == NULL)
        return;

    state = anim->state2 & 0xF000;
    if (state == 0)
        return;

    if (state & 0x1000)
    {
    _loop:
        {
            if (anim->commandQueueSize == 0)
                goto _exit;

            switch (anim->commandQueue[anim->commandQueueSize - 1])
            {
            case 1:
            case 2:
                sub_08054A68(anim);
                break;

            case 5:
                if (GetAISLayerId(anim) == 0)
                    StartClassReelSpellAnim(anim);

                // fallthrough

            case 3:
            case 4:
                anim->pScrCurrent++;
                break;

            case 13:
                sub_08054A8C(anim);
                break;

            case 24:
                sub_08054A68(anim);
                break;

            case 0:
            case 50:
            default:
                break;
            }

            anim->commandQueueSize--;
            goto _loop;
        }

    _exit:
        anim->state2 &= 0xE700;
    }

    if (state & 0x2000)
    {
        if ((GetAISLayerId(anim) == 0) && (pAnimBuf->unk_2C != anim->pImgSheet))
        {
            RegisterAISSheetGraphics(anim);
            pAnimBuf->unk_2C = anim->pImgSheet;
        }

        anim->state2 &= 0xD700;
    }

    if (state & 0x4000)
        anim->nextRoundId = -1;
}

// 0.57 ekrmainmini:sub_805A580
void sub_08054A68(struct Anim * anim)
{
    anim->nextRoundId = -2;

    if (anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED)
    {
        anim->state3 &= ANIM_BIT3_HIT_EFFECT_APPLIED;
        anim->nextRoundId = 0;
        anim->pScrCurrent++;
    }

    return;
}

void sub_08054A8C(struct Anim * anim)
{
    struct AnimBuffer * pAnimBuffer = anim->pUnk44;

    if (GetAISLayerId(anim) == 0)
    {
        int mode = BanimDefaultModeConfig[0x18];
        struct BattleAnim * banim = &banim_data[pAnimBuffer->animId];
        int * modes = banim->modes;

        struct Anim * anim1 = pAnimBuffer->anim1;
        struct Anim * anim2 = pAnimBuffer->anim2;

        const void * unk28 = pAnimBuffer->unk_28;
        register struct BanimModeData * frameData asm("r1");
        register int off asm("r0") = modes[mode];
        frameData = (void *)unk28 + off;

        anim1->pImgSheet = frameData->img;
        unk28 = anim1->pSpriteDataPool;
        anim1->pSpriteData = unk28 += frameData->unk2;

        unk28 = anim2->pSpriteDataPool;
        anim2->pSpriteData = unk28 += 0x000057F0;

        if (pAnimBuffer->unk_2C != anim->pImgSheet)
        {
            NewEkrChienCHR(anim);
            pAnimBuffer->unk_2C = anim->pImgSheet;
        }
    }
}

#if NONMATCHING
// 0.59 ekrmainmini:InitMainMiniAnim
void InitMainMiniAnim(struct AnimBuffer * pAnimBuf)
{
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[pAnimBuf->roundType * 4];
    configA = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 1];
    modeB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 2];
    configB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 3];

    LZ77UnCompWram(ba[pAnimBuf->animId].script, (void *)pAnimBuf->unk_28);

    ba2 = ba + pAnimBuf->animId;
    modes = ba2->modes;
    scr = (u32 *)pAnimBuf->unk_28;

    scrA = AnimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = AnimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (pAnimBuf->state2 == 0)
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = AnimCreate(scrA, configA);

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (pAnimBuf->state2 << 9) | 0x400 | anim->state2;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    pAnimBuf->anim1 = anim;
    anim->pUnk44 = pAnimBuf;

    anim = AnimCreate(scrB, configB);

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (pAnimBuf->state2 << 9) | 0x500 | anim->state2;

    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    pAnimBuf->anim2 = anim;
    anim->pUnk44 = pAnimBuf;

    LZ77UnCompWram(ba[pAnimBuf->animId].pal, pAnimBuf->unk_20);

    if (pAnimBuf->charPalId != -1)
    {
        struct BattleAnimCharaPal * cbap = &character_battle_animation_palette_table[pAnimBuf->charPalId];
        LZ77UnCompWram(cbap->pal, pAnimBuf->unk_20);
    }

    CpuFastSet(&PAL_BUF_COLOR(((u16 *)pAnimBuf->unk_20), pAnimBuf->genericPalId, 0), PAL_OBJ(pAnimBuf->oam2Pal), 8);

    EnablePalSync();

    pAnimBuf->unk_2C = 0;
}
#else
ASM_FUNC("asm/nonmatching/code_08054AF0.s");
#endif

#if NONMATCHING
void sub_08054C8C(struct AnimBuffer * pAnimBuf)
{
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[pAnimBuf->roundType * 4];
    modeB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 2];

    LZ77UnCompWram(ba[pAnimBuf->animId].script, (void *)pAnimBuf->unk_28);

    ba2 = ba + pAnimBuf->animId;
    modes = ba2->modes;
    scr = (u32 *)pAnimBuf->unk_28;

    scrA = AnimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = AnimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (pAnimBuf->state2 == 0)
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = pAnimBuf->anim1;

    anim->pScrStart = scrA;
    anim->pScrCurrent = scrA;

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    anim->commandQueueSize = 0;
    pAnimBuf->anim1 = anim;

    anim = pAnimBuf->anim2;

    anim->pScrStart = scrB;
    anim->pScrCurrent = scrB;

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    anim->commandQueueSize = 0;
    pAnimBuf->anim2 = anim;

    LZ77UnCompWram(ba[pAnimBuf->animId].pal, pAnimBuf->unk_20);

    if (pAnimBuf->charPalId != -1)
    {
        struct BattleAnimCharaPal * cbap = &character_battle_animation_palette_table[pAnimBuf->charPalId];
        LZ77UnCompWram(cbap->pal, pAnimBuf->unk_20);
    }

    CpuFastCopy(pAnimBuf->unk_20 + pAnimBuf->genericPalId * 0x20, pAnimBuf->oam2Pal * 0x10 + gPal + 0x100, 0x20);

    EnablePalSync();

    return;
}
#else
ASM_FUNC("asm/nonmatching/code_08054C8C.s");
#endif

// 1.00 ekrmainmini:sub_805A930
void sub_08054E00(struct AnimBuffer * pAnimBuf, int animId, int charPalId)
{
    pAnimBuf->animId = animId;
    pAnimBuf->charPalId = charPalId;

    sub_08054C8C(pAnimBuf);

    return;
}

// 1.00 ekrmainmini:sub_805A940
void sub_08054E10(struct AnimBuffer * pAnimBuf, s16 x, s16 y)
{
    struct Anim * anim;

    pAnimBuf->xPos = x;
    pAnimBuf->yPos = y;

    anim = pAnimBuf->anim1;
    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim = pAnimBuf->anim2;
    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    return;
}

// 1.00 ekrmainmini:sub_805A95C
void sub_08054E2C(struct AnimBuffer * pAnimBuf, u16 layer)
{
    struct Anim * anim;

    anim = pAnimBuf->anim1;
    anim->oam2Base = layer << 10;

    anim = pAnimBuf->anim2;
    anim->oam2Base = layer << 10;

    return;
}

// 0.53 ekrmainmini:sub_805A96C
bool sub_08054E3C(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim1 = pAnimBuf->anim1;
    struct Anim * anim2 = pAnimBuf->anim2;

    if (anim1->nextRoundId == (u16)-2)
    {
        return true;
    }

    if (anim2->nextRoundId == (u16)-2)
    {
        return true;
    }

    return false;
}

// 0.70 ekrmainmini:sub_805A990
void sub_08054E5C(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim;

    anim = pAnimBuf->anim1;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    anim = pAnimBuf->anim2;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    return;
}

// 0.64 ekrmainmini:sub_805A9A4
bool sub_08054E70(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim = pAnimBuf->anim1;

    if (anim->nextRoundId != (u16)-1)
    {
        return false;
    }

    return true;
}

// 0.87 ekrmainmini:NewEfxAnimeDrvProc
void NewEfxAnimeDrvProc(void)
{
    void ** ptr = &gpProcEfxAnimeDrv;
    *ptr = Proc_Start(gProc_efxAnimeDrvProc, PROC_TREE_4);

    AnimClearAll();

    return;
}

// 0.80 ekrmainmini:EndEfxAnimeDrvProc
void EndEfxAnimeDrvProc(void)
{
    Proc_End(gpProcEfxAnimeDrv);
    return;
}

// 1.00 ekrmainmini:ExecAllAIS
void ExecAllAIS(void)
{
    AnimUpdateAll();
    return;
}

// 0.88 ekrmainmini:NewEkrUnitMainMini
void NewEkrUnitMainMini(struct AnimBuffer * pAnimBuf)
{
    struct ProcEkrUnitMainMini * proc = Proc_Start(ProcScr_ekrUnitMainMini, PROC_TREE_4);
    InitMainMiniAnim(pAnimBuf);

    proc->unk_5C = pAnimBuf;

    pAnimBuf->unk_34 = proc;
    pAnimBuf->unk_00 = 1;

    return;
}

// 1.00 ekrmainmini:sub_805AA28
void sub_08054EF0(struct AnimBuffer * pAnimBuf)
{
    AnimDelete(pAnimBuf->anim1);
    AnimDelete(pAnimBuf->anim2);

    pAnimBuf->anim1 = 0;
    pAnimBuf->anim2 = 0;

    Proc_End(pAnimBuf->unk_34);

    return;
}

// 1.00 ekrmainmini:EkrUnitMainMiniMain
void EkrUnitMainMiniMain(struct ProcEkrUnitMainMini * proc)
{
    struct AnimBuffer * pAnimBuf = proc->unk_5C;

    sub_080548CC(pAnimBuf, pAnimBuf->anim1);
    sub_080548CC(pAnimBuf, pAnimBuf->anim2);

    return;
}

// 0.67 ekrmainmini:sub_805AA68
void sub_08054F30(struct BanimUnkStructComm * buf)
{
    struct BattleAnimTerrain * a;
    struct BattleAnimTerrain * b;
    void * vramA;
    void * vramB;
    void * palA;
    void * palB;
    s16 oam2Pal;
    u16 oam2;

    a = &battle_terrain_table[buf->unk00];
    b = &battle_terrain_table[buf->unk06];

    if (buf->unk00 != -1)
    {
        LZ77UnCompWram(a->tileset, buf->unk20);
    }

    if (buf->unk06 != -1)
    {
        LZ77UnCompWram(b->tileset, buf->unk20 + 0x1000);
    }

    switch (buf->unk0C) {
    case 0:
    case 4:
        vramA = buf->unk20;
        vramB = buf->unk20 + 0x1000;
        break;

    case 1:
    case 2:
    case 3:
    default:
        vramA = buf->unk20 + 0x800;
        vramB = buf->unk20 + 0x1800;
        break;
    }

    palA = a->palette;
    palB = b->palette;

    switch (buf->unk0E) {
    case -1:
    case 0:
    case 1:
    case 2:
    case 3:
        break;

    default:
        break;
    }

    if (buf->unk0E != -1)
    {
        if (buf->unk0E >= -1)
        {
            if (buf->unk0E < 4)
            {
                int vram = ((buf->unk04 + 0x40) * 0x20 + VRAM);
                RegisterDataMove(vramA, (void *)(buf->unk1C + vram), 0x800);
                vram = (buf->unk0A * 0x20 + VRAM);
                RegisterDataMove(vramB, (void *)(buf->unk1C + vram), 0x800);

                CpuFastCopy(palA, gPal + buf->unk02 * 0x10, 0x20);
                CpuFastCopy(palB, gPal + buf->unk08 * 0x10, 0x20);

                EnablePalSync();
                sub_08055320(buf);
            }
        }
    }
    else
    {
        if (buf->unk00 != -1)
        {
            RegisterDataMove(vramA, (void *)(buf->unk1C + buf->unk04 * 0x20), 0x800);
            CpuFastCopy(palA, buf->unk02 * 0x10 + gPal + 0x100, 0x20);
        }

        if (buf->unk06 != -1)
        {
            RegisterDataMove(vramB, (void *)(buf->unk1C + buf->unk0A * 0x20), 0x800);
            CpuFastCopy(palB, buf->unk08 * 0x10 + gPal + 0x100, 0x20);
        }

        EnablePalSync();
    }

    switch (buf->unk0E) {
    case 0:
        EnableBgSync(BG0_SYNC_BIT);
        return;

    case 1:
        EnableBgSync(BG1_SYNC_BIT);
        return;

    case 2:
        EnableBgSync(BG2_SYNC_BIT);
        return;

    case 3:
        EnableBgSync(BG3_SYNC_BIT);
        return;

    case -1:
        buf->proc14 = NULL;
        buf->proc18 = NULL;

        if ((buf->unk00 != -1))
        {
            switch (buf->unk0C) {
            case 0:
            case 4:
                oam2Pal = buf->unk02;
                oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x48, 0x68, AnimScr_EkrMainMini_R_Close, 2, oam2, 0, PROC_TREE_4);
                break;

            case 1:
                oam2Pal = buf->unk02;
                oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x20, 0x68, AnimScr_EkrMainMini_R_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 2:
                oam2Pal = buf->unk02;
                oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x40, 0x68, AnimScr_EkrMainMini_R_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 3:
                oam2Pal = buf->unk02;
                oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                buf->proc14 = NewEkrsubAnimeEmulator(0x78, 0x68, AnimScr_EkrMainMini_R_Close, 2, oam2, 0, PROC_TREE_4);
                break;
            }
        }

        if (buf->unk06 != -1)
        {
            switch (buf->unk0C) {
            case 0:
            case 4:
                oam2Pal = buf->unk08;
                oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0xa8, 0x68, AnimScr_EkrMainMini_L_Close, 2, oam2, 0, PROC_TREE_4);
                break;

            case 1:
                oam2Pal = buf->unk08;
                oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0xb0, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 2:
                oam2Pal = buf->unk08;
                oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0xb0, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;

            case 3:
                oam2Pal = buf->unk08;
                oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                buf->proc18 = NewEkrsubAnimeEmulator(0x80, 0x68, AnimScr_EkrMainMini_L_Far, 2, oam2, 0, PROC_TREE_4);
                break;
            }
        }

        break;
    }
}

// 1.00 ekrmainmini:sub_805AE14
void sub_080552DC(struct BanimUnkStructComm * buf)
{
    if (buf->unk0E == -1)
    {
        if (buf->proc14)
            Proc_End(buf->proc14);

        if (buf->proc18)
            Proc_End(buf->proc18);
    }
}

// 1.00 ekrmainmini:sub_805AE40
void sub_08055308(struct BanimUnkStructComm * buf, s16 a, s16 b, s16 c, s16 d)
{
    struct BanimUnkStructCommPriv * priv;

    priv = buf->proc14;
    priv->unk32 = a;
    priv->unk3A = b;

    priv = buf->proc18;
    priv->unk32 = c;
    priv->unk3A = d;
}

// 0.92 ekrmainmini:sub_805AE58
void sub_08055320(struct BanimUnkStructComm * buf)
{
    int tmp;
    int offsetC;

    int offsetA = 0;
    int offsetB = 0;

    u16 * tmA = TsaConfs_BanimTmA[buf->unk0C * 2 + 0];
    u16 * tmB = TsaConfs_BanimTmA[buf->unk0C * 2 + 1];

    sub_08050798(0);

    switch (buf->unk0C)
    {
        case 0:
        case 4:
            offsetA = 33;
            offsetB = 48;

            offsetC = 0;

            break;

        case 1:
            offsetA = 29;
            offsetB = 48;

            if (gEkrInitPosReal == 1)
            {
                offsetC = 0;
            }
            else
            {
                offsetC = -4;
            }

            break;

        case 2:
            offsetA = 3;
            offsetB = 48;

            if (gEkrInitPosReal == 1)
            {
                offsetC = 0;
            }
            else
            {
                offsetC = -30;
            }

            break;

        case 3:
        default:
            if (buf->unk00 != -1)
            {
                offsetA = 39;
                offsetB = 3;
            }

            if (buf->unk06 != -1)
            {
                offsetA = 3;
                offsetB = 42;
            }

            offsetC = 0;

            break;
    }

    tmp = 0x35A;

    EfxTmCpyExt(tmA, -1, gTmA_Banim + 0x35A + offsetA, 0x42, 0xf, 5, buf->unk02, buf->unk04);
    EfxTmCpyExt(tmB, -1, gTmA_Banim + 0x35A + offsetB, 0x42, 0xf, 5, buf->unk08, buf->unk0A);

    EfxTmCpyExt((gTmA_Banim + tmp + offsetC) - 0x2B5, 0x42, gBg2Tm, 0x20, 0x20, 0x14, -1, -1);

    EnableBgSync(BG2_SYNC_BIT);

    return;
}

// 0.83 ekrmainmini:sub_805AFA0
void sub_08055468(s16 distance, s16 position)
{
    int offset;

    switch (distance)
    {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_PROMOTION:
            offset = 48;
            if (position == 0)
            {
                offset = 33;
            }

            break;

        case EKR_DISTANCE_FAR:
            offset = 48;
            if (position == 0)
            {
                offset = 29;
            }

            break;

        case EKR_DISTANCE_FARFAR:
        case EKR_DISTANCE_MONOCOMBAT:
        default:
            offset = 48;
            if (position == 0)
            {
                offset = 3;
            }

            break;
    }

    EfxTmCpyExt(gUnknown_081D85AE, -1, gTmA_Banim + 0x35A + offset, 0x42, 0xf, 5, -1, -1);

    return;
}
