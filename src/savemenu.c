#include "gbafe.h"

EWRAM_OVERLAY(savemenu) u8 gUnk_Savemenu_02000000 = 0;
EWRAM_OVERLAY(savemenu) u8 gUnk_Savemenu_02000001 = 0;

extern u16 gUnk_Savemenu_02000004[];
extern u16 const gUnk_084139F0[];
extern u16 const gUnk_08413A10[];
extern u8 const gUnk_084130A4[];
extern u8 const gGfx_SupportMenu[];

void SaveMenuCopyPalette(u16 const * src, u16 * dst, int count);
void sub_080A5FD0(void);
void sub_080A6398(u8 slot, struct SaveMenuProc * proc);
void SaveMenuInitSlotPalette(u8 slot);
void SaveMenuInitSubBoxText(void);
struct SaveMenuUnkProc2 * StartSaveDraw(ProcPtr parent);
void InitSaveMenuChoice(struct SaveMenuProc * proc);
u8 SaveMenuGetValidMenuAmt(int flag, struct SaveMenuProc * proc);
u8 SaveMenuModifySaveSlot(u8 slot, int a, int b);
s8 SaveMenuTryMoveSaveSlotCursor(struct SaveMenuProc * proc, int dir);
void SaveMenuDrawSubSelBox(struct SaveMenuProc * proc, int flag);
void SaveMenuWriteNewGame(struct SaveMenuProc * proc);
void ExecSaveMenuMiscOption(struct SaveMenuProc * proc);
s8 SaveMenuHasOptions(struct SaveMenuProc * proc);
s8 sub_080A474C(struct SaveMenuProc * proc, int direction);
void sub_080A4830(int x, int y, int msgId, ProcPtr parent);
void StartSqMask(ProcPtr parent, int a, int b);

struct SaveMenuHelpProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x58);
    /* 58 */ int msgId;
};

extern struct ProcCmd CONST_DATA ProcScr_08CE3C24[];
extern struct ProcCmd CONST_DATA ProcScr_08CE3C54[];
extern struct ProcCmd CONST_DATA ProcScr_08CE3F24[];
extern struct ProcCmd CONST_DATA ProcScr_08CE4034[];
extern struct ProcCmd CONST_DATA ProcScr_08CC51D0[];

ProcPtr StartSoundRoomScreen(ProcPtr parent);
void StartSupportScreen(ProcPtr parent);
void sub_080A511C(ProcPtr parent);

CONST_DATA u16 BgConfig_SaveMenu[] = {
    0x0000, 0x6000, 0x0000, 
    0xC000, 0x6800, 0x0000, 
    0x8000, 0x7800, 0x0000, 
    0x8000, 0x7800, 0x0000,
};

void SaveMenuOnHBlank(void)
{
    int ret;
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount & 1)
        return;

    if (vcount < gUnk_Savemenu_02000000)
    {
        REG_BLDCNT = 0xC1;

        if (gUnk_Savemenu_02000000 != 0)
            ret = ((gUnk_Savemenu_02000000 - vcount) * 0x10) / gUnk_Savemenu_02000000;
        else
            ret = 0;

        REG_BLDY_16 = ret;
    }
    else
    {
        REG_BLDCNT = 0x144;
        REG_BLDALPHA = 0x1000 | gUnk_Savemenu_02000001;
    }
}

void SaveMenu_HandleExtraMiscOption(struct SaveMenuProc * proc)
{
    Proc_Goto(proc, 0x12);
    StartBgmVolumeChange(0xC0, 0x00, 0x10, NULL);
}

u8 SaveMenuIndexToValidBitfile(u8 byte, int num)
{
    int i, count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte >> i) & 1) != 0)
        {
            if (num == count)
                return 1 << i;

            count++;
        }
    }
    return UINT8_MAX;
}

u8 SaveMenuGetBitfileByMask(u8 byte1, u8 byte2)
{
    int i;
    int count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte1 >> i) & 1) != 0)
        {
            if (((byte2 >> i) & 1) != 0)
            {
                return count;
            }
            count++;
        }
    }
    return UINT8_MAX;
}

u8 BitfileToIndex(u8 byte)
{
    int i, count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte >> i) & 1) != 0)
            return i;
    }

    return UINT8_MAX;
}

void SaveMenu_StartHelpBox(struct SaveMenuProc * proc)
{
    if ((proc->unk_3F == 0xFF) || (proc->unk_36 == 0))
    {
        CloseHelpBox();
        proc->in_rtext = 0;
        return;
    }

    switch (proc->action_flag) {
    case SAVEMENU_ACTION_BITFILE_1:
    case SAVEMENU_ACTION_BITFILE_4:
    case SAVEMENU_ACTION_BITFILE_5:
        if (proc->unk_36 != 0 && proc->in_rtext == false)
        {
            LoadHelpBoxGfx((void *)0x06013800, 9);
            StartHelpBoxExt_Unk(0x30, 0x30, 0x3B2);
            proc->in_rtext = true;
        }
        break;

    default:
        break;
    }
}


int LoadSaveMenuHelpText(int slot)
{
    struct PlaySt playSt;

    if (!IsSaveValid(slot))
        return 0;

    ReadGameSavePlaySt(slot, &playSt);

    if (!playSt.tact_enabled)
    {
        gPlaySt.tact_enabled = FALSE;
        return 1;
    }

    gPlaySt.tact_enabled = TRUE;

    if (playSt.playerName[0] == 0)
        gPlaySt.playerName[0] = 0;
    else
        SetTacticianName(playSt.playerName);

    gPlaySt.tact_gender = playSt.tact_gender;
    gPlaySt.tact_birth = playSt.tact_birth;

    return 2;
}
bool SaveMenuPostChapterHandleHelpBox(struct SaveMenuProc * proc)
{
    int time, _timer_default = 8;

    if (proc->action_flag == 0x40)
        return FALSE;

    if (proc->unk_40 == 8)
    {
        if (gpKeySt->pressed & (B_BUTTON | R_BUTTON | DPAD_ANY))
        {
            CloseHelpBox();
            proc->unk_40 = 8 - 1;
        }
    }
    else if (gpKeySt->pressed & R_BUTTON)
    {
        switch (LoadSaveMenuHelpText(proc->copy_from_id))
        {
        case 0:
            PlaySoundEffect(0x38C);
            break;

        case 1:
        case 2:
            LoadHelpBoxGfx((void *) 0x06013800, 9);
            StartItemHelpBox(0x48, proc->copy_from_id * 0x20 + 0x2c, (u16) -1);
            proc->unk_40 = _timer_default;
            break;
        }
    }

    time = proc->unk_40;
    if (time == 0)
        return FALSE;

    if (time < _timer_default)
        proc->unk_40--;

    time = proc->unk_40;
    if (time != 0)
        return TRUE;

    return FALSE;
}
void SaveMenuPutChapterTitle(struct SaveMenuProc * proc)
{
    int i;

    PutChapterTitleBG(0xAC0);

    for (i = 0; i < 3; i++)
    {
        if (proc->unk_37[i] != (u8) -1)
            PutChapterTitleGfx(((0xB40 * 0x20 + (0x800 * (u32) i)) & 0x1FFFF) / 0x20, proc->unk_37[i]);
        else
            PutChapterTitleGfx(((0xB40 * 0x20 + (0x800 * (u32) i)) & 0x1FFFF) / 0x20, -1);
    }
}
void SaveMenu_Init(void)
{
    InitBgs(BgConfig_SaveMenu);
    ResetText();

    SetDispEnable(0, 0, 0, 0, 0);

    gDispIo.disp_ct.mode = DISPCNT_MODE_1;
    gDispIo.bg2_ct.size = BGCNT_SIZE_AFF256x256;
    gDispIo.bg2_ct.wrap = false;

    gDispIo.bg0_ct.priority = 3;
    gDispIo.bg1_ct.priority = 0;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 2;
}
void ProcSaveMenu_InitScreen(struct SaveMenuProc * proc)
{
    int i;

    ResetTextFont();
    ApplySystemObjectsGraphics();

    ApplyPalettes(Pal_SaveMenuBackground, 0, 3);
    Decompress(Img_MuralBackground, (void *) BG_VRAM + GetBgChrOffset(BG_0));
    TmApplyTsa(gBg0Tm, Tsa_SaveMenuBackground, 0);

    ApplyPalettes(Pal_SaveMenuWindow, 0x11, 8);
    ApplyPalette(gUnk_084139F0, 0x15);
    SaveMenuCopyPalette(gUnk_08413A10, gUnk_Savemenu_02000004, 2);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->anim_clock = 0;

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.win1_enable_blend = 1;

    Decompress(gGfx_SupportMenu, (void *) 0x06010800);

    proc->unk_36 = 0;
    proc->unk_2D = -1;
    proc->unk_3D = 0;

    sub_080A5FD0();

    for (i = 0; i < 4; i++)
    {
        SetObjAffine(
            i,
            Div(+COS_Q12(0) * 16, 0x100),
            Div(-SIN_Q12(0) * 16, 0x100),
            Div(+SIN_Q12(0) * 16, 0x100),
            Div(+COS_Q12(0) * 16, 0x100));
    }

    proc->unk_44 = 0x100;
    proc->unk_3F = -1;
    proc->in_rtext = FALSE;
    proc->unk_40 = 0;

    gUnk_Savemenu_02000000 = 100;
    gUnk_Savemenu_02000001 = 10;

    SetOnHBlankA(SaveMenuOnHBlank);

    Decompress(Img_SpinRotation, (void *) BG_VRAM + GetBgChrOffset(BG_2));
    sub_08001F3C(gBg3Tm, Tsa_SpinRotation, 0, 5);
    EnableBgSync(BG3_SYNC_BIT);

    for (i = 0; i < 4; i++)
        sub_080A6398(i, proc);

    SaveMenuInitSlotPalette(proc->copy_from_id);
    SaveMenuInitSubBoxText();

    EnableBgSync(BG1_SYNC_BIT);

    SetWinEnable(0, 0, 0);

    gPal[0] = 0;
    EnablePalSync();

    SaveMenuPutChapterTitle(proc);

    proc->proc2 = StartSaveDraw(proc);
    proc->proc3 = StartSpinRotation(proc);
}
void SaveMenu_LoadExtraMenuGraphics(struct SaveMenuProc * proc)
{
    Decompress(gUnk_084130A4, (void *) 0x06013800);
    InitSaveMenuChoice(proc);

    if (proc->action_flag == 0x20)
    {
        proc->selected_id = SaveMenuGetValidMenuAmt(0x20, proc);
    }
    else
    {
        proc->unk_2E = 2;
        proc->copy_from_id = 0;
        proc->selected_id = 0;
        proc->unk_34 = 0;
        proc->unk_46 = 0;
        proc->action_flag = SaveMenuIndexToValidBitfile(proc->unk_30, proc->selected_id);
    }

    if (proc->unk_2E == 2)
        proc->unk_2F = 0;

    if (proc->unk_2E == 5)
        proc->unk_2F = 0xdc;
}
void SaveMenuInit(struct SaveMenuProc * proc)
{
    proc->unk_2E = 5;
    proc->copy_from_id = ReadLastGameSaveId();
    proc->selected_id = 0;
    proc->unk_34 = 0;
    proc->unk_46 = 0;
    proc->unk_30 = 0x40;
    proc->action_flag = 0x40;
    proc->unk_31 = 0;
    proc->unk_2F = 0xdc;
}
void SaveMenuInitUnused(struct SaveMenuProc * proc)
{
    proc->unk_2E = 5;
    proc->copy_from_id = ReadLastGameSaveId();
    proc->selected_id = 0;
    proc->unk_34 = 0;
    proc->unk_46 = 0;
    proc->unk_30 = 0x80;
    proc->action_flag = 0x80;
    proc->unk_31 = 0;
    proc->unk_2F = 0xdc;
}
void SaveMenu_080A465C(struct SaveMenuProc * proc)
{
    Proc_Goto(proc, proc->unk_2E);
}
void Loop6C_savemenu(struct SaveMenuProc * proc)
{
    proc->unk_2E = 2;

    if (gpKeySt->repeated & DPAD_UP)
    {
        if (proc->selected_id != 0)
        {
            proc->selected_id--;
            PlaySoundEffect(0x386);
        }
        else
        {
            if (gpKeySt->pressed & DPAD_UP)
            {
                proc->selected_id = proc->unk_31 - 1;
                PlaySoundEffect(0x386);
            }
        }
    }
    else if (gpKeySt->repeated & DPAD_DOWN)
    {
        if (proc->selected_id < proc->unk_31 - 1)
        {
            proc->selected_id++;
            PlaySoundEffect(0x386);
        }
        else
        {
            if (gpKeySt->pressed & DPAD_DOWN)
            {
                proc->selected_id = 0;
                PlaySoundEffect(0x386);
            }
        }
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        proc->action_flag = SaveMenuIndexToValidBitfile(proc->unk_30, proc->selected_id);
        PlaySoundEffect(0x38A);
        proc->anim_clock = 0;

        switch (proc->action_flag)
        {
        case 0x01:
            proc->copy_from_id = proc->unk_3F;
            Proc_Goto(proc, 3);
            break;

        case 0x02:
            proc->copy_from_id = SaveMenuModifySaveSlot(ReadLastGameSaveId(), 1, 1);
            Proc_Goto(proc, 3);
            break;

        case 0x04:
            proc->copy_from_id = SaveMenuModifySaveSlot(ReadLastGameSaveId(), 1, 1);
            Proc_Goto(proc, 3);
            break;

        case 0x08:
            proc->copy_from_id = SaveMenuModifySaveSlot(ReadLastGameSaveId(), 1, 1);
            Proc_Goto(proc, 3);
            break;

        case 0x10:
            proc->copy_from_id = SaveMenuModifySaveSlot(proc->copy_from_id, 0, 1);

            if (sub_0809E9FC() == 0)
            {
                SaveMenu_SetDifficultyChoice(0, 0);
                Proc_Goto(proc, 3);
            }
            else
            {
                Proc_Goto(proc, 1);
                StartBgmVolumeChange(0xC0, 0x100, 0x10, NULL);
            }
            break;

        case 0x20:
            if (proc->unk_34 >= proc->unk_33)
                proc->unk_34 = 0;

            Proc_Goto(proc, 8);
            break;
        }
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        PlaySoundEffect(0x38B);
        Proc_Goto(proc, 0x12);
        proc->action_flag = 0x100;
    }
}
void SaveMenuWriteNewGame(struct SaveMenuProc * proc)
{
    int mode = 1;
    int isDifficult = proc->unk_3D != 0;

    if (proc->unk_2A == 1)
        mode = 2;

    if (proc->unk_2A == 2)
        mode = 3;

    WriteNewGameSave(proc->copy_from_id, isDifficult, mode);
}
void ExecSaveMenuMiscOption(struct SaveMenuProc * proc)
{
    if (proc->unk_36 == 0)
    {
        PlaySoundEffect(0x38A);

        switch (proc->action_flag)
        {
        case 0x04:
            if (proc->unk_2D == (u8) -1)
            {
                proc->unk_2D = proc->copy_from_id;
                SaveMenuTryMoveSaveSlotCursor(proc, 1);
                return;
            }

            CopyGameSave(proc->unk_2D, proc->copy_from_id);
            Proc_Goto(proc, 6);
            return;

        case 0x08:
            proc->unk_36 = 2;
            SaveMenuDrawSubSelBox(proc, 1);
            break;

        case 0x40:
            proc->unk_36 = 1;
            SaveMenuDrawSubSelBox(proc, 1);
            break;

        case 0x02:
        case 0x20:
        case 0x10:
            proc->unk_36 = 2;
            SaveMenuDrawSubSelBox(proc, 1);
            break;
        }

        SaveMenu_StartHelpBox(proc);
        return;
    }

    switch (proc->action_flag)
    {
    case 0x20:
        if (proc->unk_36 == 1)
        {
            proc->unk_44 = 0xf0;
            ReadGameSave(proc->copy_from_id);
            Proc_Goto(proc, 0xE);
            PlaySoundEffect(0x38A);
        }
        else
        {
            PlaySoundEffect(0x38B);
        }
        break;

    case 0x02:
        if (proc->unk_36 == 1)
        {
            proc->unk_44 = 0xf0;
            PlaySoundEffect(0x38A);
            SaveMenu_HandleExtraMiscOption(proc);
        }
        else
        {
            PlaySoundEffect(0x38B);
        }
        break;

    case 0x10:
        if (proc->unk_36 == 1)
        {
            SaveMenuWriteNewGame(proc);
            Proc_Goto(proc, 6);
            PlaySoundEffect(0x380);
        }
        else
        {
            PlaySoundEffect(0x38B);
        }
        break;

    case 0x08:
        if (proc->unk_36 == 1)
        {
            InvalidateGameSave(proc->copy_from_id);
            Proc_Goto(proc, 6);
            PlaySoundEffect(0x38A);
        }
        else
        {
            PlaySoundEffect(0x38B);
        }
        break;

    case 0x40:
        if (proc->unk_36 == 1)
        {
            WriteGameSave(proc->copy_from_id);
            Proc_Goto(proc, 6);
            PlaySoundEffect(0x380);
        }
        else
        {
            Proc_Goto(proc, 0x11);
            proc->action_flag |= 0x100;
            PlaySoundEffect(0x38B);
        }
        break;
    }

    SaveMenuDrawSubSelBox(proc, 0);
    SaveMenu_StartHelpBox(proc);
}
void SaveMenu_SaveSlotSelectLoop(struct SaveMenuProc * proc)
{
    proc->unk_2E = 5;

    if (SaveMenuPostChapterHandleHelpBox(proc))
        return;

    if (proc->unk_36 == 0)
    {
        if (gpKeySt->pressed & DPAD_UP)
        {
            if (SaveMenuTryMoveSaveSlotCursor(proc, -1) != 0)
                PlaySoundEffect(0x386);
        }
        else if (gpKeySt->pressed & DPAD_DOWN)
        {
            if (SaveMenuTryMoveSaveSlotCursor(proc, 1) != 0)
                PlaySoundEffect(0x386);
        }
    }
    else if (gpKeySt->pressed & DPAD_LEFT)
    {
        if (proc->unk_36 != 1)
        {
            proc->unk_36 = 1;
            PlaySoundEffect(0x387);
            SaveMenu_StartHelpBox(proc);
        }
    }
    else if (gpKeySt->pressed & DPAD_RIGHT)
    {
        if (proc->unk_36 != 2)
        {
            proc->unk_36 = 2;
            PlaySoundEffect(0x387);
            SaveMenu_StartHelpBox(proc);
        }
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        proc->anim_clock = 0;

        switch (proc->action_flag)
        {
        case 0x02:
            if (proc->unk_3F != (u8) -1)
            {
                ExecSaveMenuMiscOption(proc);
                return;
            }

            PlaySoundEffect(0x38A);
            SaveMenu_HandleExtraMiscOption(proc);
            return;

        case 0x80:
            if (proc->unk_3F != (u8) -1)
                proc->unk_44 = 0xf0;

            PlaySoundEffect(0x38A);
            SaveMenu_HandleExtraMiscOption(proc);
            return;

        case 0x01:
            PlaySoundEffect(0x38A);
            SaveMenu_HandleExtraMiscOption(proc);
            return;

        case 0x10:
            if (proc->unk_3F == (u8) -1)
                break;

            PlaySoundEffect(0x38A);
            ExecSaveMenuMiscOption(proc);
            return;

        case 0x04:
        case 0x08:
        case 0x40:
            ExecSaveMenuMiscOption(proc);
            return;

        default:
            return;
        }

        SaveMenuWriteNewGame(proc);
        Proc_Goto(proc, 6);
        PlaySoundEffect(0x380);
        return;
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        proc->anim_clock = 0;
        PlaySoundEffect(0x38B);

        if (proc->unk_36 != 0)
        {
            SaveMenuDrawSubSelBox(proc, 0);
            SaveMenu_StartHelpBox(proc);
            return;
        }

        if (proc->unk_2D != (u8) -1)
        {
            proc->copy_from_id = proc->unk_2D;
            proc->unk_2D = -1;
            return;
        }

        if (proc->action_flag & (0x80 | 0x40))
        {
            Proc_Goto(proc, 0x11);
            proc->action_flag |= 0x100;
            return;
        }

        Proc_Goto(proc, 4);
    }
}
void _ExecSaveMenuMiscOption(struct SaveMenuProc * proc)
{
    ExecSaveMenuMiscOption(proc);
}
void SaveMenuRegisterSlotSelected(struct SaveMenuProc * proc)
{
    proc->unk_2E = 6;
    proc->anim_clock = 0;
}
void SaveMenuWaitSlotBoxScrolling(struct SaveMenuProc * proc)
{
    if (proc->anim_clock == 8)
    {
        sub_080A6398(proc->copy_from_id, proc);
        sub_080A6398(4, proc);

        if (proc->unk_37[proc->copy_from_id] != (u8) -1)
            PutChapterTitleGfx(((u32) (proc->copy_from_id * 0x800 + 0xB40 * 0x20) & 0x0001FFFF) >> 5, proc->unk_37[proc->copy_from_id]);
        else
            PutChapterTitleGfx(((u32) (proc->copy_from_id * 0x800 + 0xB40 * 0x20) & 0x0001FFFF) >> 5, -1);

        SaveMenuInitSlotPalette(proc->copy_from_id);
    }
    else if (proc->anim_clock == 0x20)
    {
        InitSaveMenuChoice(proc);

        if (proc->action_flag == 0x10)
        {
            Proc_Goto(proc, 0x12);
            StartBgmVolumeChange(0xc0, 0, 0x10, NULL);
        }
        else if (proc->action_flag == 0x40)
        {
            Proc_Goto(proc, 0x11);
        }
        else if (SaveMenuHasOptions(proc))
        {
            if (proc->unk_2D != (u8) -1)
            {
                proc->copy_from_id = proc->unk_2D;
                proc->unk_2D = -1;
            }
            else
                proc->copy_from_id = SaveMenuModifySaveSlot(proc->copy_from_id, 1, 1);

            Proc_Goto(proc, 5);
        }
    }
    else if (proc->anim_clock == 0x30)
    {
        proc->copy_from_id = 0;
        proc->unk_2D = -1;
        proc->anim_clock = 0;
        proc->selected_id = 0;
        proc->action_flag = SaveMenuIndexToValidBitfile(proc->unk_30, 0);

        PlaySoundEffect(0x38B);
        Proc_Goto(proc, 4);

        return;
    }

    if (proc->anim_clock == 0x10)
    {
        SetObjAffine(
            proc->copy_from_id,
            Div(+COS_Q12(0) * 16, 0x100),
            Div(-SIN_Q12(0) * 16, 0x100),
            Div(+SIN_Q12(0) * 16, 0x100),
            Div(+COS_Q12(0) * 16, 0x100));
    }
    else
    {
        if ((proc->anim_clock <= 7))
        {
            SetObjAffine(
                proc->copy_from_id,
                Div(+COS_Q12(0) * 16, 0x100),
                Div(-SIN_Q12(0) * 16, (proc->anim_clock * -0x20) + 0x100),
                Div(+SIN_Q12(0) * 16, 0x100),
                Div(+COS_Q12(0) * 16, (proc->anim_clock * -0x20) + 0x100));
        }
        else if ((proc->anim_clock < 0x10))
        {
            SetObjAffine(
                proc->copy_from_id,
                Div(+COS_Q12(0) * 16, 0x100),
                Div(-SIN_Q12(0) * 16, (proc->anim_clock * 0x20) - 0xE0),
                Div(+SIN_Q12(0) * 16, 0x100),
                Div(+COS_Q12(0) * 16, (proc->anim_clock * 0x20) - 0xE0));
        }
    }

    proc->anim_clock++;
}
void SaveMenuScrollSlot(struct SaveMenuProc * proc)
{
    int unk;

    proc->unk_2E = 3;
    proc->anim_clock++;

    unk = 0xe - proc->anim_clock;
    proc->unk_2F = -0x24 - (unk * 0xdc * unk / 0xc4);

    if (proc->anim_clock == 0xe)
        Proc_Break(proc);
}
void SaveMenuScrollBackToMain(struct SaveMenuProc * proc)
{
    int unk;

    proc->unk_2E = 4;
    proc->anim_clock++;

    unk = 0xe - proc->anim_clock;
    proc->unk_2F = (unk * 0xdc * unk / 0xc4);

    if (proc->anim_clock == 0xe)
    {
        Decompress(gUnk_084130A4, (void *) 0x06013800);
        Proc_Break(proc);
    }
}
void sub_080A4478(struct SaveMenuProc * proc)
{
    int unk;

    proc->unk_2E = 8;
    proc->anim_clock++;

    unk = 0xe - proc->anim_clock;
    proc->unk_46 = 0xdc - (unk * 0xdc * unk / 0xc4);

    if (proc->anim_clock == 0xe)
        Proc_Goto(proc, 0xA);
}
void sub_080A44C0(struct SaveMenuProc * proc)
{
    int unk;

    proc->unk_2E = 8;
    proc->anim_clock++;

    unk = 0xe - proc->anim_clock;
    proc->unk_46 = (unk * 0xdc * unk / 0xc4);

    if (proc->anim_clock == 0xe)
        Proc_Goto(proc, 2);
}
void sub_080A4504(struct SaveMenuProc * proc)
{
    int unk;

    proc->unk_2E = 0xC;
    proc->anim_clock++;

    unk = 0xe - proc->anim_clock;

    proc->unk_46 = 0x1b8 - (unk * 0xdc * unk / 0xc4);
    proc->unk_2F = proc->unk_46 + 0x24;

    if (proc->anim_clock == 0xe)
        Proc_Goto(proc, 0xB);
}
void sub_080A4554(struct SaveMenuProc * proc)
{
    int unk;

    proc->unk_2E = 0xD;
    proc->anim_clock++;

    unk = 0xe - proc->anim_clock;

    proc->unk_46 = 0xdc + (unk * 0xdc * unk / 0xc4);
    proc->unk_2F = proc->unk_46 + 0x24;

    if (proc->anim_clock == 0xe)
        Proc_Goto(proc, 0xA);
}
void sub_080A45A0(struct SaveMenuProc * proc)
{
    int previous = proc->unk_34;

    proc->unk_2E = 0xA;

    if (gpKeySt->repeated & DPAD_UP)
    {
        if (proc->unk_34 != 0)
            proc->unk_34--;
        else if (gpKeySt->pressed & DPAD_UP)
            proc->unk_34 = proc->unk_33 - 1;
    }
    else if (gpKeySt->repeated & DPAD_DOWN)
    {
        if (proc->unk_34 < proc->unk_33 - 1)
            proc->unk_34++;
        else if (gpKeySt->pressed & DPAD_DOWN)
            proc->unk_34 = 0;
    }

    if (previous != proc->unk_34)
        PlaySoundEffect(0x386);

    if (gpKeySt->pressed & A_BUTTON)
    {
        proc->unk_35 = SaveMenuIndexToValidBitfile(proc->unk_32, proc->unk_34);
        PlaySoundEffect(0x38A);

        proc->anim_clock = 0;

        switch (proc->unk_35)
        {
        case 0x20:
        case 0x40:
            proc->copy_from_id = SaveMenuModifySaveSlot(ReadLastGameSaveId(), 1, 1);
            sub_080A474C(proc, 0);
            PlaySoundEffect(0x38A);
            Proc_Goto(proc, 0xC);
            break;

        case 0x02:
            CallSomeSoundMaybe(0, 0xc0, 0, 0x18, NULL);
            Proc_Goto(proc, 0xE);
            break;

        case 0x08:
            CallSomeSoundMaybe(0x29, 0xc0, 0x100, 0x18, NULL);
            Proc_Goto(proc, 0xE);
            break;

        case 0x04:
            CallSomeSoundMaybe(0x30, 0xc0, 0x100, 0x18, NULL);
            Proc_Goto(proc, 0xE);
            break;

        default:
            SaveMenu_HandleExtraMiscOption(proc);
            Proc_Goto(proc, 0x12);
            break;
        }
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        proc->anim_clock = 0;
        Proc_Goto(proc, 9);
        PlaySoundEffect(0x38B);
    }
}
s8 sub_080A474C(struct SaveMenuProc * proc, int direction)
{
    u8 unk = proc->copy_from_id;

    if (unk > 2)
        proc->copy_from_id = 0;

    if (direction == 0)
        return 1;

    if (direction > 0)
    {
        if (proc->copy_from_id < 2)
            proc->copy_from_id = proc->copy_from_id + 1;
        else
            proc->copy_from_id = 0;
    }
    else
    {
        if (proc->copy_from_id == 0)
            proc->copy_from_id = 2;
        else
            proc->copy_from_id = proc->copy_from_id - 1;
    }

    if (unk != proc->copy_from_id)
    {
        PlaySoundEffect(0x386);
        return 1;
    }

    return 0;
}
void sub_080A47B4(struct SaveMenuHelpProc * proc)
{
    LoadHelpBoxGfx((void *) 0x06013800, 9);
    StartHelpBoxExt_Unk(proc->x, proc->y, proc->msgId);
    PlaySoundEffect(0x390);
}
void sub_080A47EC(struct SaveMenuHelpProc * proc)
{
    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | R_BUTTON))
    {
        PlaySoundEffect(0x391);
        CloseHelpBox();
        Proc_Break(proc);
    }
}
void sub_080A4830(int x, int y, int msgId, ProcPtr parent)
{
    struct SaveMenuHelpProc * proc = Proc_StartBlocking(ProcScr_08CE3C24, parent);
    proc->msgId = msgId;
    proc->x = x;
    proc->y = y;
}
void sub_080A4850(struct SaveMenuProc * proc)
{
    proc->unk_2E = 5;

    if (proc->unk_36 == 0)
    {
        if (gpKeySt->pressed & DPAD_UP)
            sub_080A474C(proc, -1);
        else if (gpKeySt->pressed & DPAD_DOWN)
            sub_080A474C(proc, 1);
    }
    else if (gpKeySt->pressed & DPAD_LEFT)
    {
        if (proc->unk_36 != 1)
        {
            proc->unk_36 = 1;
            PlaySoundEffect(0x387);
        }
    }
    else if (gpKeySt->pressed & DPAD_RIGHT)
    {
        if (proc->unk_36 != 2)
        {
            proc->unk_36 = 2;
            PlaySoundEffect(0x387);
        }
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        switch (proc->unk_35)
        {
        case 0x40:
            if (((proc->unk_3A[proc->copy_from_id]) & 1) != 0)
            {
                if (proc->unk_3F == (u8) -1)
                {
                    ReadGameSave(proc->copy_from_id);
                    Proc_Goto(proc, 0xE);
                    PlaySoundEffect(0x38A);
                    return;
                }

                ExecSaveMenuMiscOption(proc);
                return;
            }

            sub_080A4830(0x40, 0x30, 0x768, proc);
            return;

        case 0x20:
            if (((proc->unk_3A[proc->copy_from_id]) & 2) != 0)
            {
                if (proc->unk_3F == (u8) -1)
                {
                    ReadGameSave(proc->copy_from_id);
                    Proc_Goto(proc, 0xE);
                    PlaySoundEffect(0x38A);
                    return;
                }

                ExecSaveMenuMiscOption(proc);
                return;
            }

            sub_080A4830(0x2e, 0x38, 0x767, proc);
            return;

        default:
            return;
        }
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        PlaySoundEffect(0x38B);

        if (proc->unk_36 != 0)
        {
            SaveMenuDrawSubSelBox(proc, 0);
            SaveMenu_StartHelpBox(proc);
            return;
        }

        Decompress(gUnk_084130A4, (void *) 0x06013800);
        proc->anim_clock = 0;
        Proc_Goto(proc, 0xD);
        return;
    }
}
void sub_080A4A0C(struct SaveMenuProc * proc)
{
    StartSqMask(proc, 1, 2);
    Proc_Break(proc);
}
void PostSaveMenuHandler(struct SaveMenuProc * proc)
{
    if (proc->approc != NULL)
        EndSpriteAnimProc(proc->approc);

    Proc_End(proc->proc2);
    Proc_End(proc->proc3);

    SetOnHBlankA(NULL);

    if (proc->action_flag == 0x20)
    {
        if (proc->unk_35 == 1)
            SetNextGameAction(6);
    }
    else if (proc->action_flag & 0x40)
    {
        return;
    }
    else if (proc->action_flag & 0x100)
    {
        StartBgmVolumeChange(0xc0, 0x100, 0x10, NULL);

        if ((proc->action_flag & 0x80) != 0)
            SetNextGameAction(0xB);
        else
            SetNextGameAction(5);
    }
    else if (proc->action_flag & 1)
    {
        ReadSuspendSave(3);
        SetNextGameAction(4);
    }
    else if (proc->action_flag & 0x82)
    {
        ReadGameSave(proc->copy_from_id);
        SetNextGameAction(proc->copy_from_id + 1);
    }
    else if (proc->action_flag & 0x10)
    {
        SetNextGameAction(0);
    }
}
void SaveMenuStartExtraMiscScreen(struct SaveMenuProc * proc)
{
    proc->action_flag = 0x20;

    Proc_End(proc->proc2);
    Proc_End(proc->proc3);

    SetOnHBlankA(NULL);

    if (proc->approc != NULL)
        EndSpriteAnimProc(proc->approc);

    switch (proc->unk_35)
    {
    default:
        return;

    case 0x20:
        StartBonusClaimScreen(proc);
        return;

    case 0x02:
        StartSoundRoomScreen(proc);
        return;

    case 0x04:
        StartSupportScreen(proc);
        return;

    case 0x08:
        Proc_StartBlocking(ProcScr_08CC51D0, proc);
        return;
    }
}
void SaveMenuPostExtraMiscScreen(struct SaveMenuProc * proc)
{
    switch (proc->unk_35)
    {
    case 0x20:
        Proc_Goto(proc, 0xB);
        return;

    case 0x02:
    case 0x04:
    case 0x08:
        Proc_Goto(proc, 0xA);
        return;
    }
}
void SaveMenu_ResetLcdFormDifficulty(struct SaveMenuProc * proc)
{
    proc->anim_clock = 0;

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);
}
void sub_080A4BD8(struct SaveMenuProc * proc)
{
    int unkA;
    int unkB;

    proc->anim_clock++;

    unkA = (0x10 - proc->anim_clock);

    unkB = 0x50 - ((unkA * 0x50 * unkA) / 256);

    gDispIo.win0_left = 0;
    gDispIo.win0_top = 0x50 - (unkB);
    gDispIo.win0_right = 0xf0;
    gDispIo.win0_bottom = unkB + 0x50;

    if (proc->anim_clock == 0x10)
        Proc_Break(proc);
}
void sub_080A4C34(struct SaveMenuProc * proc)
{
    int unkA;
    int unkB;

    proc->anim_clock++;

    unkA = (0x10 - proc->anim_clock);

    unkB = 0x50 - ((unkA * 0x50 * unkA) / 256);

    gDispIo.win0_left = 0;
    gDispIo.win0_top = unkB;
    gDispIo.win0_right = 0xf0;
    gDispIo.win0_bottom = -0x60 - unkB;

    if (proc->anim_clock == 0x10)
        Proc_Break(proc);
}
void SaveMenu_ReloadScreenFormDifficulty(struct SaveMenuProc * proc)
{
    SetBgOffset(1, 0, 0);
    TmFill(gBg1Tm, 0);

    ResetTextFont();
    ApplySystemObjectsGraphics();

    Decompress(gUnk_084130A4, (void *) 0x06013800);
    ApplyPalettes(Pal_SaveMenuWindow, 0x11, 8);
    Decompress(gGfx_SupportMenu, (void *) 0x06010800);
    TmApplyTsa(gBg0Tm, Tsa_SaveMenuBackground, 0);

    gUnk_Savemenu_02000000 = 100;
    gUnk_Savemenu_02000001 = 10;

    SaveMenuInitSubBoxText();
    SaveMenuPutChapterTitle(proc);
    SaveMenuInitSlotPalette(proc->copy_from_id);

    Proc_UnblockEachMarked(0xC);
    Proc_UnblockEachMarked(0xD);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    if (proc->unk_2A != 3)
    {
        proc->unk_2E = 5;
        proc->unk_2F = 0xdc;
    }
}
void SaveMenu_PostDifficultHandler(struct SaveMenuProc * proc)
{
    if (proc->unk_2A == 3)
        Proc_Goto(proc, 2);
    else
        Proc_Goto(proc, 5);
}
void SaveMenuSlotSelDrawSprite(struct SaveMenuProc * proc)
{
    if (!(proc->action_flag & 0x10))
        StartHelpPromptSprite(0xc0, 8, proc);
}
void SaveMenuStartBonusClaim(struct SaveMenuProc * proc)
{
    if (proc->unk_35 == 0x20)
        sub_080A511C(proc);
}
void SaveMenu_EndHelpPromptSprite(void)
{
    EndHelpPromptSprite();
}
void StartMainMenu(ProcPtr parent)
{
    struct SaveMenuProc * proc = Proc_StartBlocking(ProcScr_08CE3C54, parent);

    proc->action_flag = 0x100;
    proc->unk_35 = 0;

    gPlaySt.cfgTextSpeed = 2;
}
void sub_080A4DEC(struct SaveMenuProc * proc)
{
    if (!(gBmSt.flags & 0x10))
        Proc_Goto(proc, 0x14);
}
void sub_080A4E0C(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_08CE3F24, parent);
}
void sub_080A4E20(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_08CE4034, parent);
}
void SaveMenu_SetDifficultyChoice(s32 a, s32 b)
{
    struct SaveMenuProc * proc = Proc_Find(ProcScr_08CE3C54);

    if (proc != NULL)
    {
        proc->unk_2A = a;
        proc->unk_3D = b;
    }
}
