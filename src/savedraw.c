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

    CpuFill16(0, gpBonusClaimData, 0x284);

    if (!LoadBonusContentData(gpBonusClaimData))
    {
        Proc_Goto(proc, 10);
        return;
    }

    proc->unk_5c = 0;
    proc->unk_58 = 0;

    for (i = 0; i < 0x20; i++)
    {
        struct BonusClaimEnt * ent = &gpBonusClaimData[i];
        int state = ent->unseen & 3;

        if (state == 1)
        {
            if (ent->kind == 3)
            {
                proc->unk_58 = state;
                ent->unseen = (ent->unseen & 0xFC) + 2;
                UnlockSoundRoomSong(NULL, 0x75);
            }

            ent = &gpBonusClaimData[i];

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
    SaveBonusContentData(gpBonusClaimData);
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
ASM_FUNC("asm/nonmatching/code_080A5148.s");
ASM_FUNC("asm/nonmatching/code_080A5214.s");
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
ASM_FUNC("asm/nonmatching/code_080A560C.s");
ASM_FUNC("asm/nonmatching/code_080A5748.s");
ASM_FUNC("asm/nonmatching/code_080A5818.s");
ProcPtr StartSaveDraw(ProcPtr parent)
{
    return Proc_Start(ProcScr_SaveDraw, parent);
}
