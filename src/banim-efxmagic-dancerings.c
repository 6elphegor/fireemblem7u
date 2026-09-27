#include "gbafe.h"

/* auto-decls */
void StartSubSpell_efxSongBG(struct Anim * anim, int kind);
void StartSubSpell_efxSongOBJ(struct Anim * anim, int kind);
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
extern struct ProcCmd ProcScr_efxDancepara[];

void StartSpellAnimFillasMight(struct Anim * anim);
void StartSpellAnimThorsIre(struct Anim * anim);
void StartSpellAnimNinisGrace(struct Anim * anim);
void StartSpellAnimSetsLitany(struct Anim * anim);
void efxDancepara_Loop(struct ProcEfx * proc);



// 9.99 efxmagic-dancerings:StartSpellAnimFillasMight
void StartSpellAnimFillasMight(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 1;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-dancerings:StartSpellAnimThorsIre
void StartSpellAnimThorsIre(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 2;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-dancerings:StartSpellAnimNinisGrace
void StartSpellAnimNinisGrace(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 3;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-dancerings:StartSpellAnimSetsLitany
void StartSpellAnimSetsLitany(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 4;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-dancerings:efxDancepara_Loop
void efxDancepara_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25)
    {
        StartSubSpell_efxSongBG(anim, proc->unk44);
        StartSubSpell_efxSongOBJ(anim, proc->unk44);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }
    if (proc->timer == 125)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 165)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
