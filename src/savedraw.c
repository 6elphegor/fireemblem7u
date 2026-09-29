#include "gbafe.h"

#include "gbafe/bonusclaim.h"

#include "gbafe/savemenu.h"

struct SaveDrawProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u16 unk_2e;
    /* 30 */ u16 unk_30;
    /* 32 */ s8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ ProcPtr unk_34;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 unk_3c;
};

#define SAVE_MENU_PARENT(proc) ((struct SaveMenuProc *) (proc)->proc_parent)

extern u16 CONST_DATA ApConf_SaveMenuCursor[];
extern struct ProcCmd CONST_DATA ProcScr_SaveDraw[];

ProcPtr StartSaveDrawCursor(ProcPtr parent);

extern u16 CONST_DATA Sprite_08A2051C[];
extern u16 * CONST_DATA SpriteArray_08A209B8[];
extern u16 * CONST_DATA SpriteArray_08A2099C[];
extern u16 gUnk_Savemenu_02000004[];
void SaveMenuInitSlotPalette(u8 slot);
void sub_080A652C(int a, int b);
void sub_080A5148(int time);
void sub_080A5E8C(int a, int b, int c, ProcPtr proc);
void sub_080A5EAC(int a, int b, ProcPtr proc);
extern u16 * CONST_DATA SpriteArray_08CE45B4[];
extern u16 * CONST_DATA SpriteArray_08CE45A8[];
extern u16 CONST_DATA Sprite_08CE41B4[];
extern u16 CONST_DATA Sprite_08CE4172[];
extern u16 CONST_DATA Sprite_08CE41BC[];
extern u16 CONST_DATA Sprite_08CE4286[];
extern u16 * CONST_DATA SpriteArray_08CE4294[];
extern u16 * CONST_DATA SpriteArray_08CE42C0[];

struct SaveBonusHelpProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
};

extern struct ProcCmd CONST_DATA ProcScr_08CE40F8[];

void sub_080A4E58(void)
{
    InitBgs(BgConfig_SaveMenu);

    gDispIo.disp_ct.mode = DISPCNT_MODE_1;
    gDispIo.bg2_ct.size = BGCNT_SIZE_AFF256x256; /* in mode1, bg2 is not reg but *aff* */
    gDispIo.bg2_ct.wrap = false;

    gDispIo.bg0_ct.priority = 3;
    gDispIo.bg1_ct.priority = 0;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 2;

    EndAllMus();

    SetDispEnable(0, 0, 0, 0, 0);

    gUnk_Savemenu_02000001 = 10;
    gUnk_Savemenu_02000000 = 100;

    SetOnHBlankA(SaveMenuOnHBlank);

    ApplyPalettes(Pal_SaveMenuWindow, OBJPAL_SAVEMENU_WINDOW + 0x10, 8);
    ApplyPalettes(Pal_SaveMenuBackground, BGPAL_SAVEMENU_BG, 3);

    Decompress(Img_MuralBackground, (void *)BG_VRAM + GetBgChrOffset(BG_0));
    TmApplyTsa(gBg0Tm, Tsa_SaveMenuBackground, 0);

    Decompress(Img_SpinRotation, (void *)BG_VRAM + GetBgChrOffset(BG_2));
    sub_08001F3C(gBg3Tm, Tsa_SpinRotation, 0, 5);

    EnableBgSync(BG3_SYNC_BIT);
}

void sub_080A4F74(struct SaveBonusHelpProc * proc)
{
    int i;

    CpuFill16(0, gpSaveDrawBonusClaimData, 0x284);

    if (!LoadBonusContentData(gpSaveDrawBonusClaimData))
    {
        Proc_Goto(proc, 10);
        return;
    }

    proc->unk_5c = 0;
    proc->unk_58 = 0;

    for (i = 0; i < 0x20; i++)
    {
        struct BonusClaimEnt * ent = &gpSaveDrawBonusClaimData[i];
        int state = ent->unseen & 3;

        if (state == 1)
        {
            if (ent->kind == 3)
            {
                proc->unk_58 = state;
                ent->unseen = (ent->unseen & 0xFC) + 2;
                UnlockSoundRoomSong(NULL, 0x75);
            }

            ent = &gpSaveDrawBonusClaimData[i];

            if (ent->kind == 4)
            {
                proc->unk_5c = state;
                ent->unseen = (ent->unseen & 0xFC) + 2;
                UnlockSoundRoomSong(NULL, 0x76);
            }
        }
    }

    if (proc->unk_58 == 0 && proc->unk_5c == 0)
    {
        Proc_Goto(proc, 10);
        return;
    }

    LoadHelpBoxGfx((void *) 0x06013800, 9);
}
void sub_080A503C(struct SaveBonusHelpProc * proc)
{
    if (proc->unk_58 != 0)
    {
        proc->timer = 0;
        StartHelpBoxExt_Unk(0x40, 0x30, 0x765);
        PlaySoundEffect(0x37B);
    }
    else
    {
        Proc_Goto(proc, 0);
    }
}
void sub_080A5084(struct SaveBonusHelpProc * proc)
{
    if (proc->unk_5c != 0)
    {
        proc->timer = 0;
        StartHelpBoxExt_Unk(0x40, 0x30, 0x766);
        PlaySoundEffect(0x37B);
    }
    else
    {
        Proc_Goto(proc, 1);
    }
}
void sub_080A50CC(struct SaveBonusHelpProc * proc)
{
    if (proc->timer > 0x1E)
    {
        if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | START_BUTTON))
        {
            CloseHelpBox();
            Proc_Break(proc);
        }
    }
    else
    {
        proc->timer++;
    }
}
void sub_080A5108(void)
{
    SaveBonusContentData(gpSaveDrawBonusClaimData);
}
void sub_080A511C(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_08CE40F8, parent);
}
void SaveMenuCopyPalette(u16 * src, u16 * dst, int count)
{
    u16 * src_;
    count = count * 0x10;

    if (count <= 0)
        return;

    for (src_ = src; count != 0; count--)
        *dst++ = *src_++;
}
// FAKEMATCH (found by an Opus 5.5 agent): b | g pinned to r3 in a statement
// expression gives the original operand order of the final orrs.
void sub_080A5148(int time)
{
    int i;
    int b, g, r;
    int c1, c2;
#if !NONMATCHING
    register int m2 asm("r4");
#endif

    time &= 0x3F;

    if (time & 0x20)
        time = 0x20 - (time & 0x1F);

    for (i = 1; i < 0x10; i++)
    {
        if (i >= 8 && i <= 10)
            continue;

        c1 = gPal[0x120 + i];
        c2 = gUnk_Savemenu_02000004[0x10 + i];

        b = ((((c1 & 0x7C00) * (0x20 - time) + (c2 & 0x7C00) * time) >> 5) & 0x7C00);
        g = ((((c1 & 0x3E0) * (0x20 - time) + (c2 & 0x3E0) * time) >> 5) & 0x3E0);
        r = (((c1 & 0x1F) * (0x20 - time) + (c2 & 0x1F) * time) >> 5);
#if NONMATCHING
        gPal[0x110 + i] = (r & 0x1F) | b | g;
#else
        m2 = 0x1F;
        r &= m2;

        gPal[0x110 + i] = r | ({ register int x asm("r3") = b | g; x; });
#endif
    }

    EnablePalSync();
}
void sub_080A5214(struct SaveDrawProc * proc)
{
    int x;
    int y;
    u16 hours;
    u16 minutes;
    u16 seconds;

    struct SaveMenuProc * saveMenuProc = SAVE_MENU_PARENT(proc);

    y = (((0x20 - ((saveMenuProc->unk_2F * 0x20) / 220)) << 0x18) + 0x92000000) >> 0x18;

    x = 143;

    if (saveMenuProc->action_flag == 1)
    {
        FormatTime(saveMenuProc->unk_54, &hours, &minutes, &seconds);
    }
    else
    {
        FormatTime(saveMenuProc->unk_48[saveMenuProc->copy_from_id], &hours, &minutes, &seconds);
    }

    PutSpriteExt(13, x + 8, y - 14, Sprite_08CE41BC, OAM2_PAL(2));
    PutSpriteExt(13, x + 16, y - 16, Sprite_08CE4286, OAM2_PAL(6));

    if (hours > 99)
    {
        PutSpriteExt(13, x + 18, y - 8, SpriteArray_08CE42C0[(hours / 100)], OAM2_PAL(6));
        hours = hours - ((hours / 100) * 100);
    }

    if (hours > 9)
    {
        PutSpriteExt(13, x + 26, y - 8, SpriteArray_08CE42C0[(hours / 10)], OAM2_PAL(6));
    }

    PutSpriteExt(13, x + 34, y - 8, SpriteArray_08CE42C0[(hours % 10)], OAM2_PAL(6));
    PutSpriteExt(13, x + 42, y - 7, SpriteArray_08CE42C0[10], OAM2_PAL(6));
    PutSpriteExt(13, x + 50, y - 8, SpriteArray_08CE42C0[(minutes / 10)], OAM2_PAL(6));
    PutSpriteExt(13, x + 58, y - 8, SpriteArray_08CE42C0[(minutes % 10)], OAM2_PAL(6));
    PutSpriteExt(13, x + 66, y + 1, SpriteArray_08CE4294[10], OAM2_PAL(6));
    PutSpriteExt(13, x + 74, y, SpriteArray_08CE4294[(seconds / 10)], OAM2_PAL(6));
    PutSpriteExt(13, x + 82, y, SpriteArray_08CE4294[(seconds % 10)], OAM2_PAL(6));
}
void SaveDraw_Init(struct SaveDrawProc * proc)
{
    proc->unk_2c = 0;
    proc->unk_2e = 0x100;
    proc->unk_3a = 0;
    proc->unk_3b = 40;
    proc->unk_30 = 0;
    proc->unk_32 = 0;

    SetObjAffine(0, 0x100, 0, 0, 0x100);
    SetObjAffine(1, 0x100, 0, 0, 0x100);
    SetObjAffine(2, 0x100, 0, 0, 0x100);

    proc->unk_2a = 0;
    proc->unk_34 = StartSaveDrawCursor(proc);
    proc->unk_39 = 0;

    if (SAVE_MENU_PARENT(proc)->unk_3F == 0xff)
    {
        SAVE_MENU_PARENT(proc)->approc = NULL;
    }
    else
    {
        SAVE_MENU_PARENT(proc)->approc =
            StartSpriteAnimProc(ApConf_SaveMenuCursor, 320, SAVE_MENU_PARENT(proc)->unk_3F * 32 + 48, 0x160, 0, 4);
    }

    proc->unk_3c = SAVE_MENU_PARENT(proc)->copy_from_id;
}
void sub_080A54C8(s8 flag, u16 color)
{
    if (flag != 0)
        gPal[0x168] = gPal[0x190 + ((color >> 2) & 0xf)];
    else
        gPal[0x168] = gPal[0x19D];

    EnablePalSync();
}
void sub_080A5514(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, Sprite_08A2051C, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 9, SpriteArray_08A209B8[spriteIdx], OAM2_PAL(palIdB));
}
void sub_080A5590(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, Sprite_08A2051C, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 9, SpriteArray_08A2099C[spriteIdx], OAM2_PAL(palIdB));
}
void sub_080A560C(struct SaveDrawProc * proc)
{
    if (proc->unk_3c != SAVE_MENU_PARENT(proc)->copy_from_id)
    {
        SaveMenuInitSlotPalette(SAVE_MENU_PARENT(proc)->copy_from_id);
        proc->unk_3c = SAVE_MENU_PARENT(proc)->copy_from_id;
    }

    sub_080A652C(proc->unk_2a, proc->unk_3c);

    gPal[0x11A] = gUnk_Savemenu_02000004[(proc->unk_2a >> 2) & 0xF];
    EnablePalSync();

    if (SAVE_MENU_PARENT(proc)->unk_3F != 0xff)
    {
        if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 < 0x10)
            {
                SAVE_MENU_PARENT(proc)->unk_3F = 0xff;
            }
            else
            {
                SetObjAffine(
                    3,
                    Div(+COS_Q12(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(-SIN_Q12(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+SIN_Q12(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+COS_Q12(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44));
            }

            SAVE_MENU_PARENT(proc)->unk_44 -= 16;
        }
    }

    sub_080A5148(proc->unk_2a);
    proc->unk_2a++;
}
void sub_080A5748(struct SaveDrawProc * proc)
{
    struct SaveMenuProc * saveMenuProc;
    u8 spriteIdx;

    u16 y = (((SAVE_MENU_PARENT(proc)->unk_2F * 48) / 0xdc) + 0x1d0) & 0x1FF;

    PutSpriteExt(4, 56, y, Sprite_08A2051C, OAM2_PAL(2));

    saveMenuProc = SAVE_MENU_PARENT(proc);

    if (saveMenuProc->unk_46 != 0)
    {
        if (BitfileToIndex(saveMenuProc->unk_35) == 6)
            PutSpriteExt(4, 64, (y + 9) & 0x1FF, SpriteArray_08A209B8[9], OAM2_PAL(3));
        else
            PutSpriteExt(4, 64, (y + 9) & 0x1FF, SpriteArray_08A209B8[8], OAM2_PAL(3));
    }
    else
    {
        spriteIdx = BitfileToIndex(saveMenuProc->action_flag);
        PutSpriteExt(4, 64, (y + 9) & 0x1FF, SpriteArray_08A209B8[spriteIdx], OAM2_PAL(3));
    }
}
void sub_080A5818(struct SaveDrawProc * proc)
{
    int i;
    int xOffset;
    int yBase;
    int yMult;
    int spriteIdx;

    if (SAVE_MENU_PARENT(proc)->action_flag < 0x100)
    {
        if (SAVE_MENU_PARENT(proc)->action_flag == 0x20)
            proc->unk_33 = SAVE_MENU_PARENT(proc)->unk_35;
        else
            proc->unk_33 = SAVE_MENU_PARENT(proc)->action_flag;
    }

    xOffset = SAVE_MENU_PARENT(proc)->unk_2F + SAVE_MENU_PARENT(proc)->unk_46;

    if (xOffset < 220)
    {
        int y = 68 - SAVE_MENU_PARENT(proc)->unk_31 * 12;

        if (y < 2)
            y = 2;

        for (i = 0; i < SAVE_MENU_PARENT(proc)->unk_31; i++)
        {
            spriteIdx = BitfileToIndex(SaveMenuIndexToValidBitfile(SAVE_MENU_PARENT(proc)->unk_30, i));

            if (i == SAVE_MENU_PARENT(proc)->selected_id)
                sub_080A5514(proc, 56 - xOffset, y + i * 24, spriteIdx, 1, 3);
            else
                sub_080A5514(proc, 56 - xOffset, y + i * 24, spriteIdx, 4, 8);
        }

        if (SAVE_MENU_PARENT(proc)->unk_2E == 2)
            sub_080A5E8C(0, 36, (u8) (y + SAVE_MENU_PARENT(proc)->selected_id * 24), proc);
    }

    if ((u16) (SAVE_MENU_PARENT(proc)->unk_46 - 1) <= 438)
    {
        if (SAVE_MENU_PARENT(proc)->unk_33 == 7)
        {
            yBase = 2;
            yMult = 21;
        }
        else
        {
            yBase = 68 - SAVE_MENU_PARENT(proc)->unk_33 * 12;

            if (yBase < 2)
                yBase = 2;

            yMult = 24;
        }

        for (i = 0; i < SAVE_MENU_PARENT(proc)->unk_33; i++)
        {
            spriteIdx = BitfileToIndex(SaveMenuIndexToValidBitfile(SAVE_MENU_PARENT(proc)->unk_32, i));

            if (i == SAVE_MENU_PARENT(proc)->unk_34)
                sub_080A5590(proc, 276 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 1, 3);
            else
                sub_080A5590(proc, 276 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 4, 8);
        }

        if (SAVE_MENU_PARENT(proc)->unk_2E == 10)
            sub_080A5E8C(0, 36, (u8) (yBase + SAVE_MENU_PARENT(proc)->unk_34 * yMult), proc);
    }

    if (SAVE_MENU_PARENT(proc)->unk_2F != 0)
    {
        sub_080A5214(proc);
        sub_080A5748(proc);

        for (i = 0; i < 3; i++)
        {
            int y;

            if ((SAVE_MENU_PARENT(proc)->unk_2E == 6) && (SAVE_MENU_PARENT(proc)->copy_from_id == i))
                y = 0x100;
            else
                y = 0;

            PutSpriteExt(
                4, OAM1_X(232 - SAVE_MENU_PARENT(proc)->unk_2F), y + 32 + (i * 32), SpriteArray_08CE45B4[i],
                OAM2_PAL(i * 2 + 10));
            PutSpriteExt(
                4, OAM1_X(244 - SAVE_MENU_PARENT(proc)->unk_2F), (y + 33 + (i * 32)) + 8, SpriteArray_08CE45A8[i],
                OAM2_PAL(i * 2 + 11));
        }

        if (SAVE_MENU_PARENT(proc)->unk_3F != 0xff)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
            {
                if (SAVE_MENU_PARENT(proc)->approc != NULL)
                {
                    EndSpriteAnimProc(SAVE_MENU_PARENT(proc)->approc);
                    SAVE_MENU_PARENT(proc)->approc = NULL;
                }

                if (SAVE_MENU_PARENT(proc)->action_flag & 1)
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->unk_3F * 0x20 + 0x1e, Sprite_08CE41B4, 0);
                else
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->unk_3F * 0x20 + 0x1e, Sprite_08CE41B4, 0x6000);
            }
            else
            {
                if (SAVE_MENU_PARENT(proc)->action_flag == 1)
                {
                    SetSpriteAnimProcParameters(
                        SAVE_MENU_PARENT(proc)->approc, 436 - SAVE_MENU_PARENT(proc)->unk_2F,
                        SAVE_MENU_PARENT(proc)->unk_3F * 32 + 52, 0x160);
                }
                else
                {
                    SetSpriteAnimProcParameters(
                        SAVE_MENU_PARENT(proc)->approc, 320, SAVE_MENU_PARENT(proc)->unk_3F * 32 + 52, 0x160);
                    PutSpriteExt(
                        4, 422 - SAVE_MENU_PARENT(proc)->unk_2F, SAVE_MENU_PARENT(proc)->unk_3F * 32 + 30,
                        Sprite_08CE41B4, 0x6000);
                }
            }
        }
    }

    if (SAVE_MENU_PARENT(proc)->unk_2E == 5 || SAVE_MENU_PARENT(proc)->unk_2E == 6)
    {
        if (SAVE_MENU_PARENT(proc)->unk_36 != 0)
        {
            PutSpriteExt(4, 40, 128, Sprite_08CE4172, OAM2_PAL(2));
            PutUiHand(((SAVE_MENU_PARENT(proc)->unk_36 - 1) % 2) * 40 + 52, 136);
            sub_080A5E8C(1, 12, (u8) (SAVE_MENU_PARENT(proc)->copy_from_id * 32 + 32), proc);
        }
        else if (SAVE_MENU_PARENT(proc)->copy_from_id != 0xff)
            sub_080A5E8C(1, 12, (u8) (SAVE_MENU_PARENT(proc)->copy_from_id * 32 + 32), proc);

        if (SAVE_MENU_PARENT(proc)->unk_2D != 0xff)
            sub_080A5EAC(1, (u8) (SAVE_MENU_PARENT(proc)->unk_2D * 32 + 32), proc);
    }

    sub_080A560C(proc);
}
ProcPtr StartSaveDraw(ProcPtr parent)
{
    return Proc_Start(ProcScr_SaveDraw, parent);
}
