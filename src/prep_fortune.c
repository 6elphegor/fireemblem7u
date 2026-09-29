#include "gbafe.h"

void StartCgText(int x, int y, int width, int height, int msg, void * vram, int pal, ProcPtr parent);
void SetCgTextFlags(int flags);
void EndCgText(void);

extern const struct ProcCmd gProcScr_FortuneSubMenu[];
extern int CONST_DATA gUnk_08CC50C0[];

void sub_08098F88(struct PrepProcA1962C * proc)
{
    StartCgText(10, 7, 17, 4, proc->unk_2c, (void *) 0x06011000, -1, 0);
    SetCgTextFlags(0x7C);
}
void FortuneSubMenu_Init_Null(void)
{
    return;
}
void sub_08098FC0(void)
{
    return;
}
s8 sub_08098FC4(struct PrepProcA1962C * proc)
{
    int previous = proc->unk_29;

    if ((gpKeySt->repeated & DPAD_LEFT) && ((proc->unk_29 % 2) != 0))
        proc->unk_29--;

    if ((gpKeySt->repeated & DPAD_RIGHT) && ((proc->unk_29 % 2) == 0))
        proc->unk_29++;

    if ((gpKeySt->repeated & DPAD_DOWN) && ((proc->unk_29 / 2) == 0))
        proc->unk_29 += 2;

    if ((gpKeySt->repeated & DPAD_UP) && (proc->unk_29 / 2) != 0)
        proc->unk_29 -= 2;

    if (previous != proc->unk_29)
    {
        PlaySoundEffect(0x385);
        return 1;
    }

    return 0;
}
void sub_08099068(struct PrepProcA1962C * proc)
{
    if (gpKeySt->pressed & A_BUTTON)
    {
        if (proc->unk_30[proc->unk_29] == 1)
        {
            switch (proc->unk_29)
            {
            case 0:
                Proc_Goto(proc, 2);
                PlaySoundEffect(0x38A);
                return;

            case 2:
                Proc_Goto(proc, 3);
                PlaySoundEffect(0x38A);
                return;

            case 3:
                Proc_Goto(proc, 4);
                PlaySoundEffect(0x38A);
                return;

            case 1:
                Proc_Goto(proc, 5);
                PlaySoundEffect(0x38A);
                return;
            }
        }

        PlaySoundEffect(0x38C);
        return;
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        Proc_Goto(proc, 6);
        PlaySoundEffect(0x38B);
        return;
    }

    if (sub_08098FC4(proc))
    {
        ShowSysHandCursor((proc->unk_29 & 1) * 112 + 28, (proc->unk_29 >> 1) * 16 + 80, 8, 0x800);
        proc->unk_2c = gUnk_08CC50C0[proc->unk_29];
        sub_08098F88(proc);
    }
}
void FortuneSubMenu_OnOptionSelected(ProcPtr proc)
{
    EndCgText();
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndFaceById(0);
    SetOnHBlankA(NULL);
}
void FortuneSubMenu_HandleOptionSwitch(struct PrepProcA1962C * proc)
{
    switch (proc->unk_29)
    {
    case 0:
        Proc_Goto(proc, 2);
        break;

    case 2:
        Proc_Goto(proc, 3);
        break;

    case 3:
        Proc_Goto(proc, 4);
        break;

    case 1:
        Proc_Goto(proc, 5);
        break;
    }
}
// FAKEMATCH (found by Astra): pinning proc to r1 and keeping it live
// reproduces the original's dead "adds r1, r0, #0".
void StartFortuneSubMenu(int option, ProcPtr parent)
{
#if NONMATCHING
    struct PrepProcA1962C * proc = Proc_StartBlocking(gProcScr_FortuneSubMenu, parent);
    proc->unk_29 = option;
#else
    register struct PrepProcA1962C * proc asm("r1") = Proc_StartBlocking(gProcScr_FortuneSubMenu, parent);
    proc->unk_29 = option;
    asm("" : : "r"(proc));
#endif
}

s8 sub_080991F8(int var)
{
    switch (var)
    {
    case 2:
        return sub_080992F4();

    case 3:
        return sub_08099330();

    case 1:
        if (!gPlaySt.tact_enabled)
            break;
        /* fallthrough */

    case 0:
        return 1;
    }

    return 0;
}

struct DivinationTextIds {
    u16 id[2];
};

int GetChapterDivinationTextIdHectorStory(void)
{
    const struct ChapterInfo * info = GetChapterInfo(gPlaySt.chapterIndex);
    return ((struct DivinationTextIds const *) &info->divinationTextIdInEliwoodStory)
        ->id[gPlaySt.chapterModeIndex == 3 ? 1 : 0];
}

int GetChapterDivinationTextIdBeginning(void)
{
    return GetChapterInfo(gPlaySt.chapterIndex)->divinationTextIdBeginning;
}
int GetChapterDivinationTextIdEnding(void)
{
    return GetChapterInfo(gPlaySt.chapterIndex)->divinationTextIdEnding;
}
int GetChapterDivinationFee(void)
{
    return GetChapterInfo(gPlaySt.chapterIndex)->divinationFee;
}
int GetChapterDivinationPortrait(void)
{
    return GetChapterInfo(gPlaySt.chapterIndex)->divinationPortrait;
}
s8 sub_080992D8(void)
{
    if (!GetChapterDivinationTextIdHectorStory())
        return 0;

    if (GetChapterDivinationTextIdBeginning())
        return 0;

    return 1;
}
s8 sub_080992F4(void)
{
    if ((gPlaySt.chapterStateBits & 0x40) || !GetChapterDivinationTextIdHectorStory())
        return 0;

    return 1;
}
s8 sub_0809931C(void)
{
    if (GetChapterDivinationPortrait() == 0x41)
        return 1;

    return 0;
}
s8 sub_08099330(void)
{
    return sub_0809931C();
}
s8 sub_08099340(void)
{
    if (gPlaySt.chapterIndex > 0x12)
        return 1;

    return 0;
}

void StartSupportScreenFromPrepScreen();
extern const struct ProcCmd gUnk_08CC5134[];
extern const struct ProcCmd gUnk_08CC55A8[];
extern const struct ProcCmd gUnk_08CC58E4[];

SECTION(".rodata.08CC4FE0")
const struct ProcCmd gProcScr_FortuneSubMenu[] = {
    PROC_SLEEP(0),
    PROC_CALL(FortuneSubMenu_Init_Null),
    PROC_LABEL(0),
    PROC_CALL(FortuneSubMenu_HandleOptionSwitch),
    PROC_LABEL(1),
    PROC_LABEL(2),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),
    PROC_START_CHILD_BLOCKING(gUnk_08CC5134),
    PROC_GOTO(6),
    PROC_LABEL(3),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),
    PROC_START_CHILD_BLOCKING(gUnk_08CC55A8),
    PROC_GOTO(6),
    PROC_LABEL(4),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),
    PROC_CALL(StartSupportScreenFromPrepScreen),
    PROC_SLEEP(0),
    PROC_GOTO(6),
    PROC_LABEL(5),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),
    PROC_START_CHILD_BLOCKING(gUnk_08CC58E4),
    PROC_GOTO(6),
    PROC_LABEL(6),
    PROC_END,
};
