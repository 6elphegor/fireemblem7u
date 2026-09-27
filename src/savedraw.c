#include "gbafe.h"

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
ASM_FUNC("asm/nonmatching/code_080A503C.s");
ASM_FUNC("asm/nonmatching/code_080A5084.s");
ASM_FUNC("asm/nonmatching/code_080A50CC.s");
ASM_FUNC("asm/nonmatching/code_080A5108.s");
ASM_FUNC("asm/nonmatching/code_080A511C.s");
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
