#include "gbafe.h"

struct ModeSelectProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ s32 rotateTimer;
    /* 30 */ u16 unk_30;
    /* 32 */ u16 unk_32;
    /* 34 */ s32 unk_34;
    /* 38 */ void * unk_38;
    /* 3C */ void * pFaceProc; // pFaceProc
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u8 unk_42;
    /* 43 */ u8 unk_43[3];
    /* 46 */ STRUCT_PAD(0x46, 0x49);
    /* 49 */ u8 unk_49[3];
    /* 4C */ u8 activeLordCount;
    /* 50 */ s32 unk_50;
};

struct ModeSelectSpriteDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ s32 unk_2c;
    /* 30 */ s32 unk_30;
    /* 34 */ s32 unk_34;
    /* 38 */ s32 unk_38;
    /* 3C */ u8 unk_3c;
    /* 3E */ u16 unk_3e;
    /* 40 */ s32 unk_40;
    /* 44 */ s32 unk_44;
    /* 48 */ s32 unk_48;
    /* 4C */ u8 unk_4c;
    /* 4D */ u8 unk_4d;
    /* 4E */ u8 unk_4e;
};

struct UnkProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
};

extern struct AnimBuffer gUnk_0201E8D4[];
extern struct AnimMagicFxBuffer gUnk_0201E97C[];

extern u8 Img_ModeSelect_Menu[];
extern u16 Pal_ModeSelect_Menu[];

extern u8 Img_ModeSelect_Sprites[];
extern u16 Pal_ModeSelect_Sprites[];

struct Unk_020000A4
{
    struct Font font;
    struct Text text[7];
};
extern struct Unk_020000A4 gUnk_020000A4;

extern u16 gUnk_0201E9F4[];

// clang-format off

u8 * CONST_DATA gUnk_08CE480C[] = {
    (u8 *)0x020000F4,
    (u8 *)0x020020F4,
    (u8 *)0x020040F4,
};

u8 * CONST_DATA gUnk_08CE4818[] = {
    (u8 *)0x020060F4,
    (u8 *)0x0200B8F4,
    (u8 *)0x020110F4,
};

u8 * CONST_DATA gUnk_08CE4824[] = {
    (u8 *)0x020168F4,
    (u8 *)0x02016994,
    (u8 *)0x02016A34,
};

u8 * CONST_DATA gUnk_08CE4830[] = {
    (u8 *)0x02016AD4,
    (u8 *)0x020194D4,
    (u8 *)0x0201BED4,
};

u16 CONST_DATA Sprite_ModeSelect_Mode[] = {
    4,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0x40),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x44),
};

u16 CONST_DATA Sprite_ModeSelect_Select[] = {
    6,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x8),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0xC),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(64), OAM2_CHR(0x10),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0x60),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x64),
    OAM0_SHAPE_8x8 + OAM0_Y(16), OAM1_SIZE_8x8 + OAM1_X(64), OAM2_CHR(0x68),
};

u16 CONST_DATA Sprite_ModeSelect_PressStart[] = {
    5,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x11),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8, OAM2_CHR(0x49),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x31),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x4D),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(64), OAM2_CHR(0x55),
};

u16 CONST_DATA Sprite_ModeSelect_Change[] = {
    1,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x51),
};

u16 CONST_DATA Sprite_ModeSelect_ChapterRange[] = {
    4,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16, OAM2_CHR(0x16),
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x1A),
    OAM0_SHAPE_16x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x1E),
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(80), OAM2_CHR(0x56),
};

// clang-format on

void InitModeSelectAnims(s32 count, u8 * arg_1)
{
    s32 gUnk_08439348[] = {
        0x0E,
        0x00,
        0x06,
    };

    s32 i;

    for (i = 0; i < count; i++)
    {
        gUnk_0201E8D4[i].xPos = 320;
        gUnk_0201E8D4[i].yPos = 88;
        gUnk_0201E8D4[i].animId = gUnk_08439348[arg_1[i]];
        gUnk_0201E8D4[i].roundType = 6;
        gUnk_0201E8D4[i].genericPalId = 0;
        gUnk_0201E8D4[i].state2 = 1;
        gUnk_0201E8D4[i].oam2Tile = (i * 0x2000 + 0x2000) >> 5;
        gUnk_0201E8D4[i].oam2Pal = i + 0xd;

        gUnk_0201E8D4[i].pImgSheetBuf = gUnk_08CE480C[i];
        gUnk_0201E8D4[i].unk_24 = gUnk_08CE4818[i];
        gUnk_0201E8D4[i].unk_20 = gUnk_08CE4824[i];
        gUnk_0201E8D4[i].unk_28 = gUnk_08CE4830[i];

        gUnk_0201E8D4[i].charPalId = 0xffff;

        gUnk_0201E8D4[i].unk_30 = &gUnk_0201E97C[i];

        gUnk_0201E97C[i].magic_func_idx = 0;
        gUnk_0201E97C[i].x_offset_bg = 0;
        gUnk_0201E97C[i].y_offset_bg = 0;
        gUnk_0201E97C[i].x_offset_obj = 0;
        gUnk_0201E97C[i].y_offset_obj = 0;
        gUnk_0201E97C[i].obj_chr = 0;
        gUnk_0201E97C[i].obj_pal_id = 0;
        gUnk_0201E97C[i].bg_chr = 0;
        gUnk_0201E97C[i].bg_pal_id = 0;
        gUnk_0201E97C[i].bg = 0;

        gUnk_0201E97C[i].bg_tm_buf = 0;
        gUnk_0201E97C[i].bg_img_buf = 0;
        gUnk_0201E97C[i].bg_tsa_buf = 0;
        gUnk_0201E97C[i].obj_img_buf = 0;
        gUnk_0201E97C[i].reset_callback = 0;

        NewEkrUnitMainMini(&gUnk_0201E8D4[i]);
    }

    return;
}

int CONST_DATA gUnk_08CE48C0[][3] = {
    { 0x4DE, 0x12B3, 0x12B8 }, // Lyn
    { 0x4DC, 0x12B4, 0x12B8 }, // Eliwood
    { 0x4DD, 0x12B5, 0x12B9 }, // Hector
    { 0x12B6, 0, 0x12B7 },     // labels
};

void EndModeSelectAnims(s32 count)
{
    s32 i;

    for (i = 0; i < count; i++)
    {
        sub_08054EF0(&gUnk_0201E8D4[i]);
    }

    return;
}

void PutModeSelectLabelText(void)
{
    ClearText(&gUnk_020000A4.text[5]);
    ClearText(&gUnk_020000A4.text[6]);

    PutDrawText(&gUnk_020000A4.text[5], gBg1Tm + TM_OFFSET(14, 6), TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(gUnk_08CE48C0[3][0]));
    PutDrawText(&gUnk_020000A4.text[6], gBg1Tm + TM_OFFSET(14, 10), TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(gUnk_08CE48C0[3][2]));

    EnableBgSync(BG1_SYNC_BIT);

    return;
}


void PutModeSelectCharacterText(s32 index)
{
    ClearText(&gUnk_020000A4.text[2]);
    ClearText(&gUnk_020000A4.text[3]);
    ClearText(&gUnk_020000A4.text[4]);

    PutDrawText(
        &gUnk_020000A4.text[2], gBg1Tm + TM_OFFSET(14, 8), TEXT_COLOR_SYSTEM_BLUE, 0, 0, DecodeMsg(gUnk_08CE48C0[index][0]));
    PutDrawText(
        &gUnk_020000A4.text[4], gBg1Tm + TM_OFFSET(19, 10), TEXT_COLOR_SYSTEM_BLUE, 0, 0, DecodeMsg(gUnk_08CE48C0[index][2]));

    EnableBgSync(BG1_SYNC_BIT);

    return;
}


void PutModeSelectDifficultyText(struct ModeSelectProc * proc);
ASM_FUNC("asm/nonmatching/code_080A76F8.s");


struct FaceProc * StartModeSelectFace(s32 index);
ASM_FUNC("asm/nonmatching/code_080A77C0.s");


extern u8 Img_08435C64[];
extern u8 Img_08435D54[];
extern u8 Img_08435E44[];
extern u8 Img_08435EA8[];

extern u8 Img_08435F00[];
extern u8 Img_08436000[];
extern u8 Img_084360F4[];
extern u8 Img_08436158[];

extern u8 Img_084361B0[];
extern u8 Img_084362B0[];
extern u8 Img_084363A4[];
extern u8 Img_08436408[];

void LoadModeSelectChapterGfx(s32 index);
ASM_FUNC("asm/nonmatching/code_080A77F8.s");


void sub_080A7860(s32 palId)
{
    s32 i;

    u16 * palIt = gPal + (palId + 0xd) * 0x10 + 0x101;

    for (i = 0; i < 0xf; i++)
    {
        gUnk_0201E9F4[i + palId * 0xf] = *palIt++;
    }

    return;
}

void sub_080A7890(s32 palId, s32 amt)
{
    s32 i;

    u16 * r5 = (gPal + (palId + 0xd) * 0x10 + 0x101);

    if (amt > 0x40)
    {
        amt = 0x40;
    }

    amt = amt + (gUnk_Savemenu_02000001 - 10) * 2;

    for (i = 0; i < 0xf; i++)
    {
        s32 accum = 0;
        s32 r;
        s32 g;
        s32 b;

        r = (amt * (gUnk_0201E9F4[i + palId * 0xf] & (0x1f << 0))) >> 6;

        if (r <= 0x1f)
        {
            if (r < 0)
                r = 0;

            accum += r & 0x1f;
        }
        else
            accum += 0x1f;

        g = (amt * (gUnk_0201E9F4[i + palId * 0xf] & 0x3e0)) >> 6;

        if (g <= 0x3e0)
        {
            if (g < 0)
                g = 0;

            accum += g & 0x3e0;
        }
        else
            accum += 0x3e0;

        b = (amt * (gUnk_0201E9F4[i + palId * 0xf] & 0x7c00)) >> 6;

        if (b <= 0x7c00)
        {
            if (b < 0)
                b = 0;

            *r5 = accum + (b & 0x7c00);
        }
        else
        {
            *r5 = accum + 0x7c00;
        }

        r5++;
    }

    EnablePalSync();

    return;
}

void sub_080A793C(s32 palId, s32 b)
{
    s32 b_ = (b & 0xff);
    s32 tmp = (((b_ >= 0x81) ? b_ - 0x80 : 0x80 - b_) * 0x30 >> 7);
    sub_080A7890(palId, tmp + 0x10);

    return;
}

void ModeSelectSpriteDraw_Init(struct ModeSelectSpriteDrawProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_3e = 0;
    proc->unk_3c = 0;
    proc->unk_34 = 120;
    proc->unk_38 = 160;
    proc->unk_40 = 0;
    proc->unk_44 = 0;
    proc->unk_3c = 0;
    proc->unk_48 = 0;
    proc->unk_4c = 0;
    proc->unk_2c = 0;
    proc->unk_4e = 0;

    return;
}

void ModeSelectSpriteDraw_Loop(struct ModeSelectSpriteDrawProc * proc);
ASM_FUNC("asm/nonmatching/code_080A79A4.s");


// clang-format off

struct ProcCmd CONST_DATA ProcScr_ModeSelectSpriteDraw[] =
{
    PROC_CALL(ModeSelectSpriteDraw_Init),
    PROC_YIELD,

    PROC_REPEAT(ModeSelectSpriteDraw_Loop),

    PROC_END,
};

// clang-format on

void sub_080A7B7C(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_2c = 1;
    }

    return;
}

void sub_080A7B98(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_3c = 1;
    }

    return;
}

void sub_080A7BB4(s32 arg_0)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_40 = arg_0;
        proc->unk_44 = 0x100 / arg_0;
    }

    return;
}

void sub_080A7BDC(s32 arg_0, s32 arg_1)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_34 = arg_0;
        proc->unk_38 = arg_1;
    }

    gUnk_Savemenu_02000000 = arg_1 - 60;

    return;
}

void sub_080A7C08(u16 arg_0)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_3e = arg_0;
    }

    return;
}

void sub_080A7C24(u8 arg_0, u8 arg_1)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);

    if (proc != NULL)
    {
        proc->unk_4d = arg_0;
        proc->unk_4e = arg_1;
    }

    return;
}

s32 sub_080A7C4C(void)
{
    struct ModeSelectSpriteDrawProc * proc = Proc_Find(ProcScr_ModeSelectSpriteDraw);
    return proc->unk_44;
}

void sub_080A7C60(struct UnkProc * proc, s32 arg_1, s32 arg_2)
{
    if (proc != NULL)
    {
        proc->unk_34 = arg_1;
        proc->unk_36 = arg_2;
    }

    return;
}

void ModeSelect_InitGfxMaybe(struct ModeSelectProc * proc)
{
    if (proc->unk_42 & 1)
    {
        sub_080A4E58();
    }

    return;
}

struct FaceVramEnt CONST_DATA FaceConfig_ModeSelect[] = {
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
    {
        .chr_off = 0x1000,
        .palid = 0xC,
    },
};

void ModeSelect_Init(struct ModeSelectProc * proc);
ASM_FUNC("asm/nonmatching/code_080A7C84.s");


void ModeSelect_TransitionSplitOpen(struct ModeSelectProc * proc)
{
    s32 tmp;
    s32 unk_2c;

    unk_2c = proc->rotateTimer + 1;
    proc->rotateTimer = unk_2c;

    SetDispEnable(1, 1, 1, 1, 1);

    tmp = 0x48 - (((0x10 - unk_2c) * 0x48) * (0x10 - unk_2c) / 256);

    SetWin0Box(0, 0x50 - tmp, 0xf0, (tmp) + 0x50);

    if (unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

void ModeSelect_TransitionSplitClose(struct ModeSelectProc * proc)
{
    s32 tmp;
    s32 timer;

    timer = proc->rotateTimer + 1;
    proc->rotateTimer = timer;

    tmp = 0x48 - (((0x10 - timer) * 0x48) * (0x10 - timer) / 256);

    SetWin0Box(0, tmp + 8, 0xf0, -0x68 - (tmp));

    if (timer == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

void sub_080A8120(struct ModeSelectProc * proc)
{
    s32 i;

    for (i = 0; i < proc->activeLordCount; i++)
    {
        sub_08054E5C(&gUnk_0201E8D4[i]);
    }

    proc->unk_50 = 0;

    return;
}

void sub_080A8150(struct ModeSelectProc * proc, s32 arg_1)
{
    proc->unk_43[proc->unk_41] = arg_1;

    PutModeSelectDifficultyText(proc);
    sub_080A7C24(arg_1, proc->unk_42);

    return;
}

void ModeSelect_Loop_KeyHandler(struct ModeSelectProc * proc)
{
    if (((gpKeySt->repeated & DPAD_UP) != 0) && (proc->unk_43[proc->unk_41]) == 1)
    {
        PlaySoundEffect(0x386);
        sub_080A8150(proc, 0);
        return;
    }

    if ((gpKeySt->repeated & DPAD_DOWN) != 0)
    {
        if (proc->unk_43[proc->unk_41] == 0)
        {
            if ((proc->unk_49[proc->unk_41] == 0) && ((proc->unk_40 & 1) == 0))
            {
                PlaySoundEffect(0x38c);
                return;
            }

            if ((proc->unk_49[proc->unk_41] == 1) && ((proc->unk_40 & 4) == 0))
            {
                PlaySoundEffect(0x38c);
                return;
            }

            if ((proc->unk_49[proc->unk_41] == 2) && ((proc->unk_40 & 0x10) == 0))
            {
                PlaySoundEffect(0x38c);
                return;
            }

            PlaySoundEffect(0x386);
            sub_080A8150(proc, 1);

            return;
        }
    }

    if ((gpKeySt->held & (DPAD_LEFT | L_BUTTON)) != 0)
    {
        Proc_Goto(proc, 1);

        SetUiSpinningArrowFastMaybe(0);

        PlaySoundEffect(0x387);

        sub_080A8120(proc);

        return;
    }

    if ((gpKeySt->held & (DPAD_RIGHT | R_BUTTON)) != 0)
    {
        Proc_Goto(proc, 2);

        SetUiSpinningArrowFastMaybe(1);

        PlaySoundEffect(0x387);

        sub_080A8120(proc);

        return;
    }

    if ((gpKeySt->pressed & (START_BUTTON | A_BUTTON)) != 0)
    {
        proc->rotateTimer = 0;

        PlaySoundEffect(0x38a);

        Proc_Goto(proc, 3);

        gUnk_0201E8D4[proc->unk_41].roundType = 0;
        sub_08054C8C(&gUnk_0201E8D4[proc->unk_41]);

        if ((proc->unk_42 & 1) != 0)
        {
            if (proc->unk_41 == 0)
            {
                gPlaySt.chapterModeIndex = 2;
            }

            if (proc->unk_41 == 1)
            {
                gPlaySt.chapterModeIndex = 3;
            }

            if (proc->unk_43[proc->unk_41] != 0)
            {
                gPlaySt.chapterStateBits |= PLAY_FLAG_HARD;
            }
            else
            {
                gPlaySt.chapterStateBits &= ~PLAY_FLAG_HARD;
            }
        }
        else
        {
            SaveMenu_SetDifficultyChoice(proc->unk_49[proc->unk_41], proc->unk_43[proc->unk_41]);
            sub_080A7C24(proc->unk_43[proc->unk_41], proc->unk_42 | 2);
        }

        sub_080A7B7C();
        return;
    }

    if (((gpKeySt->pressed & B_BUTTON) != 0) && ((proc->unk_42 & 1) == 0))
    {
        proc->rotateTimer = 0;
        PlaySoundEffect(0x38b);

        Proc_Goto(proc, 4);
        SaveMenu_SetDifficultyChoice(3, 0);
    }

    proc->unk_50++;

    if ((proc->unk_50 & 0x1ff) == 0x20)
    {
        gUnk_0201E8D4[proc->unk_41].roundType = 2;
        sub_08054C8C(&gUnk_0201E8D4[proc->unk_41]);
    }

    if ((proc->unk_50 & 0x1ff) != 0x80)
    {
        return;
    }

    sub_08054E5C(&gUnk_0201E8D4[proc->unk_41]);

    return;
}

void ModeSelect_RotateRight(struct ModeSelectProc * proc)
{
    proc->unk_34 = -1;
    proc->rotateTimer = 0;

    StartFaceFadeOut(proc->pFaceProc);

    if (proc->unk_41 == 0)
    {
        proc->unk_41 = proc->activeLordCount - 1;
    }
    else
    {
        proc->unk_41--;
    }

    proc->unk_32 = (0x100 - sub_080A7C4C() * proc->unk_41) << 4;

    sub_080A8150(proc, proc->unk_43[proc->unk_41]);

    if (proc->unk_32 < proc->unk_30)
    {
        proc->unk_32 += 0x1000;
    }

    return;
}

void ModeSelect_RotateLeft(struct ModeSelectProc * proc)
{
    proc->unk_34 = 1;
    proc->rotateTimer = 0;

    StartFaceFadeOut(proc->pFaceProc);

    if (proc->unk_41 < (proc->activeLordCount - 1))
    {
        proc->unk_41++;
    }
    else
    {
        proc->unk_41 = 0;
    }

    proc->unk_32 = (0x100 - sub_080A7C4C() * proc->unk_41) << 4;

    sub_080A8150(proc, proc->unk_43[proc->unk_41]);

    if (proc->unk_32 > proc->unk_30)
    {
        proc->unk_30 += 0x1000;
    }

    return;
}

void ModeSelect_Loop_RotateCarousel(struct ModeSelectProc * proc)
{
    s32 a;
    s32 b;
    s32 c;
    u16 d;
    s32 r9;

    a = (proc->unk_32 - proc->unk_30) * proc->unk_34;
    r9 = 0x100;
    proc->rotateTimer++;

    b = a >> 2;

    c = b * (0x1e - proc->rotateTimer) * (0x1e - proc->rotateTimer) / 900;
    d = (proc->unk_30 + proc->unk_34 * 4 * (b - c));

    if (proc->rotateTimer == 0xd)
    {
        LoadModeSelectChapterGfx(proc->unk_49[proc->unk_41]);
    }

    if (proc->rotateTimer == 0xe)
    {
        proc->pFaceProc = StartModeSelectFace(proc->unk_49[proc->unk_41]);
    }

    if (proc->rotateTimer == 0x14)
    {
        PutModeSelectCharacterText(proc->unk_49[proc->unk_41]);
    }

    if (proc->rotateTimer == 0x1e)
    {
        d = proc->unk_32 & 0xfff;
        proc->unk_30 = proc->unk_32 & 0xfff;
        Proc_Break(proc);
    }

    SetObjAffineAuto(0, 0, r9, r9);

    sub_080A7C08(d);

    return;
}

void ModeSelect_End(struct ModeSelectProc * proc)
{
    EndModeSelectAnims(proc->activeLordCount);
    EndEfxAnimeDrvProc();
    EndFaceById(0);

    if (!(proc->unk_42 & 1))
    {
        StartBgmVolumeChange(0x100, 0xc0, 0x10, 0);
    }
    else
    {
        SetOnHBlankA(NULL);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ModeSelect[] =
{
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,

    PROC_CALL(ModeSelect_InitGfxMaybe),
    PROC_YIELD,

    PROC_CALL(ModeSelect_Init),
    PROC_YIELD,

    PROC_REPEAT(ModeSelect_TransitionSplitOpen),

PROC_LABEL(0),
    PROC_REPEAT(ModeSelect_Loop_KeyHandler),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(ModeSelect_RotateLeft),
    PROC_REPEAT(ModeSelect_Loop_RotateCarousel),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(ModeSelect_RotateRight),
    PROC_REPEAT(ModeSelect_Loop_RotateCarousel),

    PROC_GOTO(0),

PROC_LABEL(3),
    PROC_SLEEP(60),

PROC_LABEL(4),
    PROC_REPEAT(ModeSelect_TransitionSplitClose),

    PROC_CALL(ModeSelect_End),

    PROC_END,
};

// clang-format on

void sub_080A8664(ProcPtr parent)
{
    struct ModeSelectProc * proc = Proc_StartBlocking(ProcScr_ModeSelect, parent);
    proc->unk_42 = 0;
    return;
}

void StartModeSelect(ProcPtr parent)
{
    if (sub_0809E9FC() > 7)
    {
        struct ModeSelectProc * proc = Proc_StartBlocking(ProcScr_ModeSelect, parent);
        proc->unk_42 = 1;
    }

    return;
}
