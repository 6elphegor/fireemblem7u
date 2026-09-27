#include "gbafe.h"

/* auto-decls */
extern struct ProcCmd ProcScr_efxBolganoneWOUT[];
int sub_08004CC4(void);
void NewEfxSpellCast(void);
void sub_0805A928(struct Anim * anim, int idx);
void sub_0805AC1C(struct Anim * anim, int idx);
extern int gEfxBgSemaphore;
extern int gUnknown_0202003C;
extern struct ProcCmd ProcScr_efxBolganone[];
extern struct ProcCmd ProcScr_efxBolganoneBG[];
extern struct ProcCmd ProcScr_efxBolganoneBGCOL[];
extern struct ProcCmd ProcScr_efxBolganoneBG2[];
extern struct ProcCmd ProcScr_efxBolganoneBG3[];
extern struct ProcCmd ProcScr_efxBolganoneOBJ[];
extern struct ProcCmd ProcScr_efxBolganoneOBJ2[];
extern const s16 FrameConfig_BolganoneBG[];
extern const s16 FrameConfig_BolganoneBGCOL[];
extern const s16 FrameConfig_BolganoneBG2[];
extern const s16 FrameConfig_BolganoneBG3[];
extern u16 * TsaArray_BolganoneBG[];
extern u16 * TsaArray_BolganoneBG2[];
extern u16 * TsaArray_BolganoneBG3[];
extern u16 * ImgArray_BolganoneBG2[];
extern u16 * ImgArray_BolganoneBG3[];
extern u16 Img_BolganoneBG[];
extern u16 Pal_BolganoneBGCOL[];
extern u16 Pal_BolganoneBG2[];
extern u16 Pal_BolganoneBG3[];
extern u16 Img_BolganoneOBJ[];
extern u16 Pal_BolganoneOBJ[];
extern u16 Img_BolganoneOBJ2[];
extern u16 Pal_BolganoneOBJ2[];

void sub_0805ADF0(struct Anim * anim, int duration, int terminator);
void sub_0805AE28(struct ProcEfxOBJ * proc);



void sub_0805A3F0(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxBolganone, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

ASM_FUNC("asm/nonmatching/code_0805A42C.s");

void sub_0805A62C(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBG;
    proc->tsal = TsaArray_BolganoneBG;
    proc->tsar = TsaArray_BolganoneBG;

    SpellFx_RegisterBgGfx(Img_BolganoneBG, 0x2000);
    SpellFx_SetSomeColorEffect();
}

void sub_0805A680(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        FillBGRect(gBg1Tm + 30, 2, 20, 1, 0x11F);
    }

    if (++proc->terminator > proc->unk30)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void sub_0805A6F8(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBGCOL;
    proc->pal = Pal_BolganoneBGCOL;

    SpellFx_RegisterBgPal(Pal_BolganoneBGCOL, 0x20);
}

void sub_0805A740(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
    }

    if (++proc->timer2 == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void sub_0805A78C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBG2;
    proc->tsal = TsaArray_BolganoneBG2;
    proc->tsar = TsaArray_BolganoneBG2;
    proc->img = ImgArray_BolganoneBG2;

    SpellFx_RegisterBgPal(Pal_BolganoneBG2, 0x20);
    SpellFx_SetSomeColorEffect();
}

void sub_0805A7E0(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        FillBGRect(gBg1Tm + 30, 2, 20, 1, 0x11F);
    }
    else if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void sub_0805A864(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->unk44 = 2;
    proc->unk48 = 0;

    SpellFx_RegisterObjGfx(Img_BolganoneOBJ, 0x1000);
    SpellFx_RegisterObjPal(Pal_BolganoneOBJ, 0x20);
}

void sub_0805A8B4(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    if (++proc->terminator == proc->unk44)
    {
        proc->terminator = 0;
        proc->unk44 = 2;

        if (sub_08004CC4() > 4)
            sub_0805A928(proc->anim, proc->unk48++);

        if (sub_08004CC4() > 4)
            sub_0805A928(proc->anim, proc->unk48++);
    }
}

ASM_FUNC("asm/nonmatching/code_0805A928.s");

void sub_0805AA28(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    anim->yPosition = Interpolate(1, 0x78, 8, proc->timer, proc->terminator);
    proc->timer++;
}

void sub_0805AA7C(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBG3;
    proc->tsal = TsaArray_BolganoneBG3;
    proc->tsar = TsaArray_BolganoneBG3;
    proc->img = ImgArray_BolganoneBG3;

    SpellFx_RegisterBgPal(Pal_BolganoneBG3, 0x20);
    SpellFx_SetSomeColorEffect();
}

void sub_0805AAD8(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
    }

    if (++proc->terminator > proc->unk30)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void sub_0805AB44(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->unk44 = 2;
    proc->unk48 = 0;

    SpellFx_RegisterObjGfx(Img_BolganoneOBJ2, 0x1000);
    SpellFx_RegisterObjPal(Pal_BolganoneOBJ2, 0x20);
    gUnknown_0202003C = 0;
}

void sub_0805AB9C(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == (s16)proc->unk30)
    {
        gUnknown_0202003C = 1;
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    if (++proc->terminator == proc->unk44)
    {
        proc->terminator = 0;
        proc->unk44 = 2;

        if (sub_08004CC4() > 4)
            sub_0805AC1C(proc->anim, proc->unk48++);

        if (sub_08004CC4() > 4)
            sub_0805AC1C(proc->anim, proc->unk48++);
    }
}

ASM_FUNC("asm/nonmatching/code_0805AC1C.s");

ASM_FUNC("asm/nonmatching/code_0805AD44.s");

// 9.99 efxmagic-ivaldi:StartSubSpell_efxIvaldiWOUT
void sub_0805ADF0(struct Anim * anim, int duration, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneWOUT, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    NewEfxFlashBgWhite(anim, duration);

    return;
}

// 9.99 efxmagic-ivaldi:efxIvaldiWOUT_Loop
void sub_0805AE28(struct ProcEfxOBJ * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->terminator);

    CpuFastCopy(gPal, gEfxPal, 0x400);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, val);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
