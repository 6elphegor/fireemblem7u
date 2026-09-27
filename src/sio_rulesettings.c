#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_rulesettings.c

extern const u8 gUnknown_081D53E4[];

//! FE8U = 0x0804766C
void LoadLinkArenaRuleSettings(u8 * buf)
{
    buf[0] = gLinkArenaSt.unk_ec.unk_0_0;
    buf[1] = gLinkArenaSt.unk_ec.unk_0_1;
    buf[2] = gLinkArenaSt.unk_ec.unk_0_2;

    return;
}

//! FE8U = 0x0804768C
void SaveLinkArenaRuleSettings(u8 * buf)
{
    // FAKE? the flags are accessed as u32 bitfields here
    struct LinkArenaStMaybe * las = &gLinkArenaSt;
    struct { u32 unk_0_0 : 1; u32 unk_0_1 : 1; u32 unk_0_2 : 1; } * unk_ec = (void *)&las->unk_ec;

    unk_ec->unk_0_0 = buf[0];
    unk_ec->unk_0_1 = buf[1];
    unk_ec->unk_0_2 = buf[2];

    return;
}

//! FE8U = 0x080476CC
void sub_0804203C(int idx, int state)
{
    int i;

    
    const int textColorLut[2] =
    {
        TEXT_COLOR_SYSTEM_BLUE,
        TEXT_COLOR_SYSTEM_WHITE,
    };

    
    for (i = 0; i < 2; i++)
    {
        ClearText(&gUnk_Sio_0203DA88[(idx << 1) + i]);
        Text_SetColor(&gUnk_Sio_0203DA88[(idx << 1) + i], textColorLut[(state + i) & 1]);
        Text_DrawString(&gUnk_Sio_0203DA88[(idx << 1) + i], DecodeMsg(gLinkArenaRuleData[idx].optionTextId[i]));
        PutText(
            &gUnk_Sio_0203DA88[(idx << 1) + i],
            gBg0Tm + TM_OFFSET(gLinkArenaRuleData[idx].xPos[i], 6 + idx * 3));
    }

    EnableBgSync(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08047780
void SioRuleSettings_Init(struct ProcSioRuleSettings * proc)
{
    int i;
    u8 buf[4];
    u8 title[16];

    memcpy(title, gUnknown_081D53E4, 14);

    ClearSioBG();
    sub_08047B34();

    Decompress(Img_LinkArenaRankIcons, (void *)(GetBgChrOffset(BG_1) + 0x06000C00));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    sub_08047C38(0);

    SetTextFont(&Font_0203DB64);
    ResetTextFont();

    sub_0803DCF0();

    proc->unk_30 = 0;
    proc->unk_2c = StartRuleSettingSpriteDrawInteractive(proc);

    SetBgOffset(BG_1, 254, 0);

    LoadLinkArenaRuleSettings(buf);

    UpdateRuleSettingSprites(
        proc->unk_2c, proc->unk_30, gLinkArenaRuleData[proc->unk_30].xPos[buf[proc->unk_30]] * 8,
        ((proc->unk_30 * 3) * 8) + 48);

    for (i = 0; i < 3; i++)
    {
        ClearText(&gLinkArenaSt.texts[i]);
        Text_SetColor(&gLinkArenaSt.texts[i], TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(&gLinkArenaSt.texts[i], DecodeMsg(gLinkArenaRuleData[i].labelTextId));
        PutText(&gLinkArenaSt.texts[i], gBg0Tm + TM_OFFSET(6, 6 + i * 3));

        sub_0804203C(i, buf[i]);
    }

    DrawLinkArenaModeIcon(gBg1Tm + 0x11E + gLinkArenaRuleData[1].xPos[0], 0);
    DrawLinkArenaModeIcon(gBg1Tm + 0x11E + gLinkArenaRuleData[1].xPos[1], 1);

    StartLinkArenaTitleBanner(proc->unk_2c, 6);
    sub_08047E84(title, 14, 0, 8, gLinkArenaSt.unk_00, proc->unk_2c);

    PutSioText(0x3C3 + proc->unk_30, 1); // "Set whether to hide enemy units."

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08047928
void SioRuleSettings_Loop_Main(struct ProcSioRuleSettings * proc)
{
    u8 buf[4];
    u8 change = 0;
    int var = 0;

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        sub_080A1F54(&gSioSaveConfig);
        Proc_Break(proc);
    }

    LoadLinkArenaRuleSettings(buf);

    if (((gpKeySt->repeated & DPAD_UP) != 0) && (proc->unk_30 != 0))
    {
        proc->unk_30--;
        change = 1;
    }

    if (((gpKeySt->repeated & DPAD_DOWN) != 0) && (proc->unk_30 < 2))
    {
        proc->unk_30++;
        change++;
    }

    if ((gpKeySt->pressed & DPAD_LEFT) != 0)
    {
        buf[proc->unk_30] = (buf[proc->unk_30] - 1) & 1;
        sub_0804203C(proc->unk_30, buf[proc->unk_30]);
        change++;
    }

    if ((gpKeySt->pressed & DPAD_RIGHT) != 0)
    {
        buf[proc->unk_30] = (buf[proc->unk_30] + 1) & 1;
        sub_0804203C(proc->unk_30, buf[proc->unk_30]);
        change++;
    }

    SaveLinkArenaRuleSettings(buf);

    if (change != 0)
    {
        SioPlaySoundEffect(3);

        if (proc->unk_30 == 1)
        {
            var = -2;
        }

        UpdateRuleSettingSprites(
            proc->unk_2c, proc->unk_30, (gLinkArenaRuleData[proc->unk_30].xPos[buf[proc->unk_30]] + var) * 8,
            ((proc->unk_30 * 3) * 8) + 48);

        PutSioText(0x3C3 + proc->unk_30, 1);
    }

    return;
}

extern struct ProcCmd CONST_DATA ProcScr_SIO_RuleSettings[];

