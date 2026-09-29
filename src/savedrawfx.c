#include "gbafe.h"

#include "gbafe/savemenu.h"

struct SaveDrawCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u16 unk_2a;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
};

struct SaveDrawProcFx
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);
    /* 34 */ struct SaveDrawCursorProc * unk_34;
};

struct SqMaskProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ u8 unk_2b;
};

extern const struct ProcCmd ProcScr_SaveDrawCursor[];
extern const struct ProcCmd ProcScr_SqMask[];
extern const struct ProcCmd ProcScr_SaveBgUp[];
extern int CONST_DATA SaveMenuSubSelBoxTexts[];
extern struct Font gSaveMenuSubBoxFont;
extern struct Text gSaveMenuSubBoxText;
extern u16 CONST_DATA Sprite_08CE41AC[];

void SaveMenuDrawSubSelBoxExt(int msgId, s8 draw_en);

void SpinRotation_Init(struct ProcSpinRotation * proc)
{
    proc->unk_39 = 0;
    proc->ro = 0;
    proc->unk_35 = 0;
    proc->unk_36 = 0;
    proc->unk_37 = 0;
    proc->unk_38 = 0;
    proc->unk_3A = 0;
    proc->unk_3B = 0;
    proc->unk_3D = 0;
    proc->unk_34 = 0;
}

void SpinRotation_Loop(struct ProcSpinRotation * proc)
{
    proc->ro++;
    proc->angle -= 4;

    /**
     * The spin image is slightly scaled down.
     *
     * Rate = (0x10000/0x180)/0x100 = 66.7%
     */
    BgAffinRotScaling(BG_2, proc->angle, 0, 0, 0x180, 0x180);
    BgAffinScaling(BG_2, 2 << 8, 1 << 8);

    /**
     * [120, 160] is the author in screen space, where the pattern need to display
     * [76, 76] is the center of the spin image
     */
    BgAffinAnchoring(BG_2, 120, 160, 76, 76);

    SyncDispIo();
}

struct ProcCmd CONST_DATA ProcScr_SpinRotation[] = {
    PROC_NAME_DEBUG("SpinRotation"),
    PROC_MARK(13),
    PROC_CALL(SpinRotation_Init),
    PROC_REPEAT(SpinRotation_Loop),
    PROC_END,
};

ProcPtr StartSpinRotation(ProcPtr parent)
{
    struct ProcSpinRotation * proc;
    proc = Proc_Start(ProcScr_SpinRotation, PROC_TREE_VSYNC);
    proc->savedraw = parent;
    return proc;
}

void SaveDrawCursor_Init(struct SaveDrawCursorProc * proc)
{
    proc->unk_31 = 0;
    proc->unk_2a = 0;
    proc->unk_2d = 0;
    proc->unk_2e = 0;
    proc->unk_2f = 0;
    proc->unk_30 = 0;
    proc->unk_32 = 0;
    proc->unk_33 = 0;
    proc->unk_35 = 0;
    proc->unk_2c = 0;
}
void SaveDrawCursor_Loop(struct SaveDrawCursorProc * proc)
{
    u8 y;
    u8 x;
    u8 x2;

    u8 yOffsetLut[] = {
        0, 1, 2, 3, 3, 2, 1, 0,
    };

    proc->unk_2a++;

    if (proc->unk_2c < 4)
        proc->unk_2c++;

    if (proc->unk_31 != 0)
    {
        y = proc->unk_2f;
        x = proc->unk_2d;

        if (proc->unk_2c < 4)
        {
            y = (proc->unk_30 + y) >> 1;
            x = (proc->unk_2e + x) >> 1;
        }

        if (proc->unk_35 == 0)
            x2 = x + 0x86;
        else
            x2 = x + 0xb0;

        proc->unk_30 = proc->unk_2f;
        proc->unk_2e = proc->unk_2d;

        if (proc->unk_35 == 0)
        {
            PutSpriteExt(4, x, y + yOffsetLut[proc->unk_2a >> 3 & 7], Sprite_08CE41AC, 0x1000);
            PutSpriteExt(4, x2 | 0x1000, y + yOffsetLut[proc->unk_2a >> 3 & 7], Sprite_08CE41AC, 0x1000);
        }
        else
        {
            PutSpriteExt(4, 4, y + yOffsetLut[proc->unk_2a >> 3 & 7], Sprite_08CE41AC, 0x2000);
        }

        proc->unk_2c = 0;
    }
    else if (proc->unk_2c == 4)
    {
        proc->unk_31 = 0;
    }

    if (proc->unk_33 != 0)
        PutSpriteExt(4, 6, proc->unk_32, Sprite_08CE41AC, 0x2000);

    if (proc->unk_34 != 0)
        proc->unk_33 = 0;

    proc->unk_31 = 0;
    proc->unk_34 = 1;
}
void sub_080A5E8C(int a, int b, int c, struct SaveDrawProcFx * proc)
{
    struct SaveDrawCursorProc * cursor = proc->unk_34;

    cursor->unk_2f = c;
    cursor->unk_2d = b;
    cursor->unk_31 = 1;
    cursor->unk_35 = a;
}
void sub_080A5EAC(int a, int b, struct SaveDrawProcFx * proc)
{
    struct SaveDrawCursorProc * cursor = proc->unk_34;

    cursor->unk_32 = b;
    cursor->unk_33 = 1;
    cursor->unk_35 = a;
    cursor->unk_34 = 0;
}
ProcPtr StartSaveDrawCursor(ProcPtr parent)
{
    return Proc_Start(ProcScr_SaveDrawCursor, parent);
}
void SaveMenuInitSubBoxText(void)
{
    InitTextFont(&gSaveMenuSubBoxFont, (void *) 0x0600C020, 1, 4);
    InitText(&gSaveMenuSubBoxText, 10);
}
void SaveMenuDrawSubSelBoxExt(int msgId, s8 draw_en)
{
    const char * str;

    if (draw_en != 0)
    {
        str = DecodeMsg(msgId);

        SetTextFont(&gSaveMenuSubBoxFont);

        ClearText(&gSaveMenuSubBoxText);
        Text_SetCursor(&gSaveMenuSubBoxText, 0);
        Text_SetColor(&gSaveMenuSubBoxText, 0);
        Text_DrawString(&gSaveMenuSubBoxText, str);

        Text_SetCursor(&gSaveMenuSubBoxText, 0x28);
        Text_DrawString(&gSaveMenuSubBoxText, DecodeMsg(0x1265));

        PutText(&gSaveMenuSubBoxText, gBg1Tm + TM_OFFSET(7, 17));
    }
    else
    {
        TmFillRect_thm(gBg1Tm + TM_OFFSET(7, 17), 10, 1, 0);
    }

    EnableBgSync(BG1_SYNC_BIT);
}
void SaveMenuDrawSubSelBox(struct SaveMenuProc * proc, s8 flag)
{
    SaveMenuDrawSubSelBoxExt(SaveMenuSubSelBoxTexts[BitfileToIndex(proc->action_flag)], flag);

    if (flag == 0)
        proc->unk_36 = 0;
}
void sub_080A5FD0(void)
{
    CpuFastFill(0, (void *) 0x06008000, 0x800);
    CpuFastFill(0, (void *) 0x0600C000, 0x800);
}
void AddMainMenuOption(struct SaveMenuProc * proc, int option)
{
    proc->unk_30 |= option;
    proc->unk_31++;
}
void AddExtraMenuOption(struct SaveMenuProc * proc, int option)
{
    proc->unk_32 |= option;
    proc->unk_33++;
}
void InitSaveMenuChoice(struct SaveMenuProc * proc)
{
    int i;
    int count = 0;

    proc->unk_31 = 0;
    proc->unk_30 = 0;
    proc->unk_32 = 0;
    proc->unk_33 = 0;

    if (proc->unk_44 == 0x100)
        AddMainMenuOption(proc, 1);

    for (i = 0; i < 3; i++)
        if (proc->unk_37[i] != (u8) -1)
            count++;

    if (count > 0)
    {
        AddMainMenuOption(proc, 2);

        if (count < 3)
            AddMainMenuOption(proc, 4);

        AddMainMenuOption(proc, 8);
    }

    if (count < 3)
        AddMainMenuOption(proc, 0x10);

    if (IsExtraLinkArenaEnabled())
        AddExtraMenuOption(proc, 1);

    if (IsExtraSoundRoomEnabled())
        AddExtraMenuOption(proc, 2);

    if (IsExtraSupportViewerEnabled())
        AddExtraMenuOption(proc, 4);

    if (GetRankDataValidBitMap())
        AddExtraMenuOption(proc, 8);

    if (IsExtraBonusClaimEnabled())
        AddExtraMenuOption(proc, 0x20);

    if (proc->unk_32 != 0)
    {
        proc->unk_30 |= 0x20;
        proc->unk_31++;
    }
}
u8 SaveMenuModifySaveSlot(u8 slot, bool valid, s8 position)
{
    u8 i;

    if (position > 0)
    {
        for (i = 0; i < 3; i++)
        {
            if ((IsSaveValid(slot) == valid))
                return slot;

            if (slot == 2)
                slot = 0;
            else
                slot++;
        }
    }
    else
    {
        for (i = 0; i < 3; i++)
        {
            if ((IsSaveValid(slot) == valid))
                return slot;

            if (slot == 0)
                slot = 2;
            else
                slot--;
        }
    }

    return -1;
}
bool SaveMenuTryMoveSaveSlotCursor(struct SaveMenuProc * proc, s8 position)
{
    s8 flag = 0;
    u8 previous = proc->copy_from_id;

    switch (proc->action_flag)
    {
    case 0x80:
        flag = 1;
        break;

    case 4:
        if (proc->unk_2D == (u8) -1)
            flag = 1;
        break;

    case 2:
    case 8:
        flag = 1;
        break;

    case 0x10:
        break;

    case 1:
        return 0;
    }

    if (position >= 1)
    {
        if (proc->copy_from_id == 2)
            proc->copy_from_id = 0;
        else
            proc->copy_from_id++;
    }
    else
    {
        if (proc->copy_from_id == 0)
            proc->copy_from_id = 2;
        else
            proc->copy_from_id--;
    }

    if (proc->action_flag == 0x40)
        return true;

    proc->copy_from_id = SaveMenuModifySaveSlot(proc->copy_from_id, flag, position);

    if (previous == proc->copy_from_id)
        return false;

    return true;
}
bool SaveMenuHasOptions(struct SaveMenuProc * proc)
{
    if (proc->action_flag & proc->unk_30)
        return true;

    return false;
}
void SqMask_Loop(struct SqMaskProc * proc)
{
    proc->unk_29 += proc->unk_2b;

    SetWinEnable(0, 1, 0);

    if (proc->unk_2a >= 1)
    {
        SetWin1Box(proc->unk_29 * 3, proc->unk_29 * 2, -0x10 - (proc->unk_29 * 3), -0x60 - (proc->unk_29 * 2));
    }
    else
    {
        SetWin1Box(0x78 - (proc->unk_29 * 3), 0x50 - (proc->unk_29 * 2), proc->unk_29 * 3 + 0x78, proc->unk_29 * 2 + 0x50);
    }

    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    if (proc->unk_29 > 0x27)
        Proc_Break(proc);
}
void StartSqMask(ProcPtr parent, u8 b, u8 c)
{
    struct SqMaskProc * proc = Proc_StartBlocking(ProcScr_SqMask, parent);

    proc->unk_2a = b;
    proc->unk_2b = c;
    proc->unk_29 = 0;
}
void SaveBgUp_Loop(void)
{
    RegisterDataMove(gBg2Tm, (void *) 0x06007000, 0x800);
}
ProcPtr StartSaveBgUp(ProcPtr parent)
{
    return Proc_Start(ProcScr_SaveBgUp, parent);
}

SECTION(".rodata.08CE433C")
const struct ProcCmd ProcScr_SaveDrawCursor[] = {
    PROC_19,
    PROC_CALL(SaveDrawCursor_Init),
    PROC_REPEAT(SaveDrawCursor_Loop),
    PROC_END,
};

SECTION(".rodata.08CE4378")
const struct ProcCmd ProcScr_SqMask[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_REPEAT(SqMask_Loop),
    PROC_END,
};

SECTION(".rodata.08CE4398")
const struct ProcCmd ProcScr_SaveBgUp[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_REPEAT(SaveBgUp_Loop),
    PROC_END,
};
