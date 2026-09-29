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
extern const u8 gUnknown_081D5394[];

#if NONMATCHING

void sub_080412E0(struct SioTermProc * proc)
{
    int i;
    struct PlaySt playSt;
    u8 title[6];
    u8 flags[4];
    bool found = FALSE;

    memcpy(title, gUnknown_081D5394, 6);

    ClearSioBG();
    InitSioBG();

    Decompress(Img_TacticianSelObj, (u8 *) OBJ_VRAM0 + 0x4800);

    sub_08047BD4(0, 4);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    StartLinkArenaButtonSpriteDraw(192, 16, proc);

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    PutSioText(0x3CA, 0);
    PutSioText(0x3CB, 1);

    proc->unk_4c = -1;

    for (i = 2; i >= 0; i--)
    {
        flags[i] = 0;

        if (IsSaveValid(i))
        {
            ReadGameSavePlaySt(i, &playSt);
            proc->unk_2c[i] = GetChapterTitle(&playSt);

            if (playSt.chapterStateBits & 0x40)
                flags[i] |= 4;

            switch (playSt.chapterModeIndex)
            {
            case 1:
                flags[i] |= 0x10;
                break;

            case 2:
                flags[i] |= 0x20;
                break;

            case 3:
                flags[i] |= 0x40;
                break;
            }

            if (IsGameNotFirstChapter(&playSt))
                proc->unk_38[i] = proc->unk_2c[i];
            else
                proc->unk_38[i] = -1;

            if (proc->unk_38[i] != -1)
            {
                if (!found)
                {
                    proc->unk_50 = i;
                    found = TRUE;
                }
                else
                {
                    proc->unk_4c = i;
                }
            }
        }
        else
        {
            proc->unk_2c[i] = proc->unk_38[i] = -1;
        }
    }

    if (proc->unk_4c == -1)
    {
        proc->unk_4c = proc->unk_50;
        proc->unk_48 = proc->unk_50;
    }
    else
    {
        proc->unk_48 = proc->unk_4c;
    }

    SetBgOffset(1, 4, 0);

    PutChapterTitleBG(0x1A0);

    for (i = 0; i < 3; i++)
    {
        if (proc->unk_38[i] == -1)
            flags[i] |= 2;

        PutChapterTitlePalette(flags[i] | 1, i + 4);
        PutChapterTitlePalette(flags[i], i + 7);
        PutChapterTitleBgTsa(gBg1Tm + TM_OFFSET(2, 4 + i * 4), i + 4);
        PutChapterTitleGfx(((0x800 * (u32) i + 0x4400) & 0x1FFFF) / 0x20, proc->unk_2c[i]);
        PutChapterTitleNameTsa(gBg0Tm + TM_OFFSET(3, 5 + i * 4), i + 7);
    }

    SetWinEnable(0, 0, 0);

    StartLinkArenaTitleBanner(proc, 1);
    sub_08047E84(title, 6, 0, 8, gLinkArenaSt.unk_00, proc);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

#else

/* https://decomp.me/scratch/lXFC6 */
// FAKEMATCH (found by decomp-permuter): the notFirst local swaps r8/r9.
void sub_080412E0(struct SioTermProc * proc)
{
    int i;
    struct PlaySt playSt;
    u8 title[6];
    u8 flags[4];
    int local_38;
    int permuter, permuter2;
    u8 r1;
    bool notFirst;

    local_38 = 0;

    memcpy(title, gUnknown_081D5394, 6);

    ClearSioBG();
    InitSioBG();

    Decompress(Img_TacticianSelObj, (void *) (VRAM + 0x14800));

    sub_08047BD4(0, 4);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    StartLinkArenaButtonSpriteDraw(192, 16, proc);

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    PutSioText(0x3CA, 0);
    PutSioText(0x3CB, 1);

    proc->unk_4c = -1;

    for (i = 2; i >= 0; i--)
    {
        flags[i] = 0;

        if (IsSaveValid(i))
        {
            ReadGameSavePlaySt(i, &playSt);
            proc->unk_2c[i] = GetChapterTitle(&playSt);

            r1 = playSt.chapterStateBits;
            permuter2 = 0x40;

            permuter2 &= r1;
            if (permuter2)
                flags[i] |= 4;

            switch (playSt.chapterModeIndex)
            {
            case 1:
                flags[i] |= 0x10;
                break;

            case 2:
                flags[i] |= 0x20;
                break;

            case 3:
                flags[i] |= 0x40;
                break;

            }

            notFirst = IsGameNotFirstChapter(&playSt);
            if (notFirst)
                proc->unk_38[i] = proc->unk_2c[i];
            else
                proc->unk_38[i] = -1;

            if (proc->unk_38[i] != -1)
            {
                if (local_38 == 0)
                {
                    proc->unk_50 = i;
                    local_38 = 1;
                }
                else
                {
                    proc->unk_4c = i;
                }
            }
        }
        else
        {
            proc->unk_2c[i] = proc->unk_38[i] = -1;
        }
    }

    if (proc->unk_4c == -1)
    {
        proc->unk_4c = proc->unk_50;
        proc->unk_48 = proc->unk_50;
    }
    else
    {
        proc->unk_48 = proc->unk_4c;
    }

    SetBgOffset(1, 4, 0);

    PutChapterTitleBG(0x1A0);

    for (i = 0; i < 3; i++)
    {
        permuter = 4;

        if (proc->unk_38[i] == -1)
            flags[i] |= 2;

        PutChapterTitlePalette(flags[i] | 1, i + 4);
        PutChapterTitlePalette(flags[i], i + 7);
        PutChapterTitleBgTsa(gBg1Tm + TM_OFFSET(2, 4 + i * permuter), i + 4);
        PutChapterTitleGfx(((0x800 * (u32) i + 0x4400) & 0x1FFFF) / 0x20, proc->unk_2c[i]);
        PutChapterTitleNameTsa(gBg0Tm + TM_OFFSET(3, 5 + i * permuter), i + 7);
    }

    SetWinEnable(0, 0, 0);

    StartLinkArenaTitleBanner(proc, 1);
    sub_08047E84(title, 6, 0, 8, gLinkArenaSt.unk_00, proc);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

#endif

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
void SIOTERM_Loop_A(struct SioTermProc * proc)
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
void SIOTERM_Loop_B(ProcPtr proc)
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
