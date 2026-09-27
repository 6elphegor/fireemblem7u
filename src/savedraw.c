#include "gbafe.h"

struct SaveBonusHelpProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
};

extern void * CONST_DATA gpBonusContentSaveBuf;
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

ASM_FUNC("asm/nonmatching/code_080A4F74.s");
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
    SaveBonusContentData(gpBonusContentSaveBuf);
}
void sub_080A511C(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_08CE40F8, parent);
}
ASM_FUNC("asm/nonmatching/code_080A5130.s");
ASM_FUNC("asm/nonmatching/code_080A5148.s");
ASM_FUNC("asm/nonmatching/code_080A5214.s");
ASM_FUNC("asm/nonmatching/code_080A5420.s");
ASM_FUNC("asm/nonmatching/code_080A54C8.s");
ASM_FUNC("asm/nonmatching/code_080A5514.s");
ASM_FUNC("asm/nonmatching/code_080A5590.s");
ASM_FUNC("asm/nonmatching/code_080A560C.s");
ASM_FUNC("asm/nonmatching/code_080A5748.s");
ASM_FUNC("asm/nonmatching/code_080A5818.s");
ASM_FUNC("asm/nonmatching/code_080A5C48.s");
