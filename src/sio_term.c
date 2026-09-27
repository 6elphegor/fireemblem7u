#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_term.c

extern s8 gUnk_Sio_0203DD24;
extern struct ProcCmd CONST_DATA ProcScr_AtMenu[];

void sub_08047DA4(void);
void sub_08047F1C(void);
void EndLinkArenaButtonSpriteDraw(void);
void sub_08044ED8(void);

extern struct Font Font_0203DB64;
extern struct Text gSioTexts[];

/* https://decomp.me/scratch/lXFC6 */
ASM_FUNC("asm/nonmatching/code_080412E0.s");

//! FE8U = 0x08046C64
void sub_08041584(int * cur, u8 bottom, u8 top, int * buf, u8 total)
{
    if (((gpKeySt->repeated & DPAD_UP) != 0) &&
        (*cur > top || gpKeySt->repeated == gpKeySt->pressed))
    {
        do
        {
            *cur -= 1;

            if (*cur < 0)
            {
                *cur = total - 1;
            }
        } while (buf[*cur] == -1);
    }

    if (((gpKeySt->repeated & DPAD_DOWN) != 0) &&
        (*cur < bottom || gpKeySt->repeated == gpKeySt->pressed))
    {
        do
        {
            *cur += 1;
            *cur = *cur % total;
        } while (buf[*cur] == -1);
    }

    return;
}

//! FE8U = 0x08046CF0
void sub_08041610(struct SioTermProc * proc)
{
    int current = proc->unk_48;

    sub_08041584(&proc->unk_48, proc->unk_50, proc->unk_4c, proc->unk_38, 3);
    PutUiHand(24, 40 + proc->unk_48 * 32);

    if (current != proc->unk_48)
    {
        SioPlaySoundEffect(3);
    }

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        SioPlaySoundEffect(2);
        Proc_Break(proc);
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Goto(proc, 4);
    }

    return;
}

//! FE8U = 0x08046D6C
void sub_0804168C(struct SioTermProc * proc)
{
    ReadGameSave(proc->unk_48);

    gPlaySt.chapterStateBits &= ~(PLAY_FLAG_COMPLETE);
    gPlaySt.config_window_theme = 0;
    gLinkArenaSt.unk_04 = proc->unk_48;

    ApplyUnitSpritePalettes();
    sub_08044ED8();

    SetBgOffset(BG_1, 0, 0);

    return;
}

//! FE8U = 0x08046DB4
void sub_080416D4(ProcPtr proc)
{
    if (gLinkArenaSt.unk_03 == 0xFF)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x08046DD0
void sub_080416F0(ProcPtr proc)
{
    if (gLinkArenaSt.unk_04 == 0xFF)
    {
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x08046DEC
void sub_0804170C(ProcPtr proc)
{
    if (Proc_Find(ProcScr_AtMenu) == NULL)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08046E0C
void sub_0804172C(ProcPtr proc)
{
    if (gUnk_Sio_0203DD24 == 0)
    {
        return;
    }

    sub_0803DC28();
    BMapVSync_End();
    sub_08047CA8();
    sub_08047DA4();
    sub_08047F1C();
    EndLinkArenaButtonSpriteDraw();
    StartPrepAtMenu();

    Proc_Goto(proc, 5);

    return;
}

//! FE8U = 0x08046E4C
void sub_0804176C(void)
{
    SetBgOffset(BG_1, 0, 0);
    return;
}
