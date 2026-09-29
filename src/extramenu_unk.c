#include "gbafe.h"

struct ExtraMenuUnkProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ ProcPtr spin_proc;
    /* 58 */ int unk_58;
};

extern u16 const gUnk_08CE4158[];
extern u16 const * const gUnk_08CE456C[];
extern u8 const gGfx_SupportMenu[];
extern u8 const Img_GameMainMenuObjs[];

void sub_080AC904(struct ExtraMenuUnkProc * proc);
void sub_080AC940(struct ExtraMenuUnkProc * proc);
void sub_080ACA3C(struct ExtraMenuUnkProc * proc);
void sub_080ACA48(struct ExtraMenuUnkProc * proc);

CONST_DATA u16 const gUnk_08CE5734[] = {
    0, 0x6000, 0, 0, 0x6800, 0, 0x8000, 0x7800,
    0, 0x8000, 0x7800, 0,
};

CONST_DATA struct ProcCmd ProcScr_08CE574C[] = {
    PROC_CALL(sub_080AC904),
    PROC_CALL(sub_080AC940),
    PROC_SET_END_CB(sub_080ACA3C),
    PROC_REPEAT(sub_080ACA48),
    PROC_END,
};

void sub_080AC8A0(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160)
        vcount = 0;

    if ((vcount & 1) == 0)
    {
        if (vcount < 100)
        {
            REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_DARKEN;
            *(vu16 *) REG_ADDR_BLDY = (100 - vcount) * 16 / 100;
        }
        else
        {
            REG_BLDCNT = BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0;
            REG_BLDALPHA = BLDALPHA_BLEND(10, 16);
        }
    }
}
void sub_080AC904(struct ExtraMenuUnkProc * proc)
{
    proc->unk_58 = 4;

    InitBgs(gUnk_08CE5734);

    gDispIo.disp_ct.mode = DISPCNT_MODE_1;
    gDispIo.bg2_ct.size = BGCNT_SIZE_AFF256x256;
    gDispIo.bg2_ct.wrap = false;
}
void sub_080AC940(struct ExtraMenuUnkProc * proc)
{
    ApplyPalettes(Pal_SaveMenuBackground, 0, 3);
    Decompress(Img_MuralBackground, (void *) 0x06001000);
    TmApplyTsa(gBg0Tm, Tsa_SaveMenuBackground, 0x80);
    EnableBgSync(BG0_SYNC_BIT);

    ApplyPalettes(Pal_SaveMenuWindow, 0x11, 8);
    Decompress(gGfx_SupportMenu, (void *) 0x06010800);
    Decompress(Img_GameMainMenuObjs, (void *) 0x06013800);

    SetOnHBlankA(sub_080AC8A0);

    Decompress(Img_SpinRotation, (void *) BG_VRAM + GetBgChrOffset(BG_2));
    sub_08001F3C(gBg3Tm, Tsa_SpinRotation, 0, 5);
    EnableBgSync(BG3_SYNC_BIT);

    SetWinEnable(0, 0, 0);

    proc->spin_proc = StartSpinRotation(proc);

    gDispIo.bg0_ct.priority = 3;
    gDispIo.bg1_ct.priority = 0;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 2;
}
void sub_080ACA3C(struct ExtraMenuUnkProc * proc)
{
    Proc_End(proc->spin_proc);
}
void sub_080ACA48(struct ExtraMenuUnkProc * proc)
{
    if (proc->unk_58 >= 0)
    {
        PutSpriteExt(4, 56, 8, gUnk_08CE4158, 0x2000);
        PutSpriteExt(4, 64, 16, gUnk_08CE456C[proc->unk_58], 0x3000);
    }
}
void sub_080ACA90(ProcPtr parent)
{
    Proc_Start(ProcScr_08CE574C, parent);
}
void sub_080ACAA4(int unk)
{
    struct ExtraMenuUnkProc * proc = Proc_Find(ProcScr_08CE574C);
    proc->unk_58 = unk;
}
