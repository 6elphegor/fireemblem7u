#include "gbafe.h"

s32 sub_080991F8(s32);
void DrawPrepScreenMenuFrameAt(s32, s32);
void SetPrepScreenMenuItem(s32, void (*)(struct ProcAtMenu*), s32, s32, s32);
void SetPrepScreenMenuOnBPress(s32 (*)(struct ProcAtMenu*));
void SetPrepScreenMenuOnStartPress(s32 (*)(struct ProcAtMenu*));
void SetPrepScreenMenuSelectedItem(u8);
void StartPrepScreenMenu(); // StartPrepScreenMenu

void AtMenu_AddPrepScreenSupportMenuItem(struct ProcAtMenu *proc) {
    s32 var_r6 = 0;
    s32 i;

    proc->cmd_mask = var_r6;
    if (!(gPlaySt.chapterStateBits & 0x80)) {
        if (gPlaySt.chapterModeIndex == 1) {
            SetPrepScreenMenuItem(4, PrepScreenMenu_OnSupport, 1, 0x1146, var_r6);
            return;
        }
        i = 0;
        do {
            if ((sub_080991F8(i) << 0x18) != 0) {
                proc->cmd_mask = (u8)((1 << i) | proc->cmd_mask);
            }
            i += 1;
        } while (i <= 3);
        SetPrepScreenMenuItem(4, PrepScreenMenu_OnSupport, var_r6, 0x1146, 0);
    }
}

void InitPrepScreenMainMenu(struct ProcAtMenu *proc) {
    s8 canCheckMap;
    s8 inLinkArena;
    u8 chapterStateBits;

    StartPrepScreenMenu();
    inLinkArena = CheckInLinkArena();
    if (inLinkArena == 0) {
        SetPrepScreenMenuItem(0, PrepScreenMenu_OnPickUnits, 0, 0x113D, (s32) inLinkArena);
        SetPrepScreenMenuItem(1, PrepScreenMenu_OnItems, 0, 0x113E, (s32) inLinkArena);
        AtMenu_AddPrepScreenSupportMenuItem(proc);
        canCheckMap = (s8) CanPrepScreenCheckMap();
        if (canCheckMap != 0) {
            SetPrepScreenMenuItem(7, PrepScreenMenu_OnCheckMap, 0, 0x1141, (s32) inLinkArena);
        } else {
            SetPrepScreenMenuItem(7, PrepScreenMenu_OnCheckMap, 1, 0x1141, (s32) canCheckMap);
        }
        chapterStateBits = 0x80 & gPlaySt.chapterStateBits;
        if (chapterStateBits == 0) {
            SetPrepScreenMenuItem(2, PrepScreenMenu_OnSave, 0, 0x1140, (s32) chapterStateBits);
        }
    } else {
        SetPrepScreenMenuItem(0, PrepScreenMenu_OnPickUnits, 0, 0x113D, 0);
        SetPrepScreenMenuItem(1, PrepScreenMenu_OnItems, 0, 0x113E, 0);
        SetPrepScreenMenuItem(3, sub_0808DC3C, 0, 0x1152, 0);
    }
    SetPrepScreenMenuOnBPress(PrepScreenMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepScreenMenu_OnStartPress);
    TmFillRect_thm(gBg0Tm, 0xC, 0x13, 0);
    TmFillRect_thm(gBg1Tm, 0xC, 0x13, 0);
    DrawPrepScreenMenuFrameAt(1, 4);
    SetPrepScreenMenuSelectedItem(proc->cur_cmd);
}
