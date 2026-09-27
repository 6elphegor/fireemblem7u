#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_bat.c

extern struct Text gUnk_Sio_0203DA78;
extern u8 gUnk_Sio_0203DAC0[];
extern int gUnk_Sio_0203DD28;
extern struct SioMessage gUnknown_03004E80;
extern struct MultiArenaSaveTeam * CONST_DATA gUnknown_085A9884;
extern const u16 gUnknown_085ADDA8[];
extern struct FaceVramEnt CONST_DATA gUnknown_085A9864[];
extern struct ProcCmd CONST_DATA gUnknown_085A93A0[];

void EndLinkArenaButtonSpriteDraw(void);
void EndLinkArenaVersusSpriteDraw(void);
void sub_08047C38(int a);
extern const u8 Img_LinkArenaRankIcons[];
extern const u16 Pal_LinkArenaRankIcons[];

//! FE8U = 0x08045930
int sub_08040280(u8 ranking, u32 playerCount, u32 mode, u32 points)
{
    u32 r4;
    int r2;
    int r7;

    r4 = points;

    for (r2 = 0; r2 < 10; r2++)
    {
        if (gSioResultRankings[r2].points >= r4)
        {
            continue;
        }

        r7 = r2;
        r2 = 9;

        if (r2 <= r7)
        {
            goto _080459E4;
        }
        else
        {
            goto _08045976;
        }
    }

    return -1;

_08045976:
    for (r2 = 9; r2 > r7; r2--)
    {
        gSioResultRankings[r2].ranking = gSioResultRankings[r2 - 1].ranking;
        gSioResultRankings[r2].points = gSioResultRankings[r2 - 1].points;
        gSioResultRankings[r2].player_count = gSioResultRankings[r2 - 1].player_count;
        gSioResultRankings[r2].mode = gSioResultRankings[r2 - 1].mode;
        SioStrCpy(gSioResultRankings[r2 - 1].name, gSioResultRankings[r2].name);
    }

_080459E4:
    gSioResultRankings[r7].ranking = ranking;
    gSioResultRankings[r7].points = points;
    gSioResultRankings[r7].player_count = playerCount;
    gSioResultRankings[r7].mode = mode;

    SioStrCpy(gUnk_Sio_0203DAC5[gSioSt->selfId], gSioResultRankings[r7].name);

    return r7;
}

//! FE8U = 0x08045A64
void sub_080403B0(struct SioBatProc * proc)
{
    int mode = gLinkArenaSt.unk_ec.unk_0_1;
    int playerCount = gLinkArenaSt.unk_A0 - 1;
    u8 ranking = sub_0804528C();
    int points = gUnk_Sio_0203DD90.currentScore[gSioSt->selfId];

    ReadMultiArenaSaveRankings(gSioResultRankings);

    proc->unk_58 = sub_08040280(ranking, playerCount, mode, points);

    WriteMultiArenaSaveRankings(gSioResultRankings);

    if (proc->unk_58 != -1)
    {
        StartSioResultNewHighScore(proc->unk_58, proc);
    }
    else
    {
        FadeBgmOut(1);
    }

    return;
}

#if NONMATCHING
// register allocation only (temporaries in r2 instead of r0/r1)
extern u8 const gUnk_081D5352[];

void sub_08040444(void)
{
    int i;
    int j;

    u8 hack[3];
    memcpy(hack, gUnk_081D5352, sizeof(hack));

    InitUnits();

    for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
    {
        int r4 = i * 0x40 + 1;

        struct Unit * unit = GetUnit(r4);
        ReadMultiArenaSaveTeam(gLinkArenaSt.unk_06[i], unit, gUnk_Sio_0203DAC5[i]);

        gLinkArenaSt.unk_05 = gLinkArenaSt.unk_05;

        for (j = 0; j < 5; j++)
        {
            u16 * fid = gUnk_Sio_0203DD90.unk_24 - -i;

            unit = GetUnit(r4 + j);

            unit->exp = 0;
            SetUnitStatus(unit, 0);
            unit->rescue = 0;

            if ((gSioSaveConfig._unk2_) == 0)
                sub_0803DD40(unit);
            else
                sub_08048E0C(unit);

            if (j == 0)
                *fid = GetUnitMiniPortraitId(unit);

            unit->index = r4 + j;

            if (i == 0)
                continue;

            if (gSioSaveConfig._unk0_ == 0)
                unit->state = 0x200;
        }
    }

    gUnk_Sio_0203DD90.unk_00 = 0;

    gSioSt->selfId = 0;
    gSioSt->unk_009 = hack[gLinkArenaSt.unk_05];
    gSioSt->unk_007 = gLinkArenaSt.unk_05 + 2;

    gLinkArenaSt.unk_A0 = gLinkArenaSt.unk_05 + 2;
}
#else
ASM_FUNC("asm/nonmatching/code_08040444.s");
#endif

extern struct ProcCmd CONST_DATA ProcScr_SIOMAIN2[];

//! FE8U = 0x08045C14
void New6C_SIOMAIN2(void)
{
    Proc_Start(ProcScr_SIOMAIN2, PROC_TREE_2);
    return;
}

//! FE8U = 0x08045C28
void sub_0804057C(ProcPtr proc)
{
    if (Proc_Find(ProcScr_SIOMAIN2) != NULL)
    {
        return;
    }

    if (gLinkArenaSt.unk_0B == 1)
    {
        Proc_Goto(proc, 1);
    }

    if (gLinkArenaSt.unk_0B == 2)
    {
        Proc_Goto(proc, 4);
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08045C68
void sub_080405BC(const char * str, int x, int y, ProcPtr parent)
{
    SetInitTalkTextFont();
    ClearTalkText();
    ResetTextFont();

    StartTalkExt(x, y, str, parent);

    SetTalkPrintColor(1);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetTalkPrintDelay(2);

    SetActiveTalkFace(1);

    return;
}

//! FE8U = 0x08045CBC
void sub_08040610(void)
{
    Proc_EndEach(ProcScr_SIOVSYNC);
    Proc_EndEach(ProcScr_SIOMAIN);
    Proc_EndEach(ProcScr_SIOCON);
    return;
}

//! FE8U = 0x08045CE0
void sub_08040634(void)
{
    SioReleaseIrq();
    return;
}

//! FE8U = 0x08045CEC
void sub_08040640(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        if (gLinkArenaSt.linking_status[i] != gSioSt->playerStatus[i])
        {
            gLinkArenaSt.linking_status[i] = gSioSt->playerStatus[i];

            ClearText(&gLinkArenaSt.texts[i]);
            Text_SetColor(&gLinkArenaSt.texts[i], 0);

            if (gLinkArenaSt.linking_status[i] < 5)
            {
                PutDrawTextCentered(
                    &gLinkArenaSt.texts[i], 10, 5 + i * 3,
                    DecodeMsg(gLinkArenaStatusMsg[gLinkArenaSt.linking_status[i]]), 10);
                ApplyPalette(gUnknown_085ADDA8, 0x13 + i);
            }
            else
            {
                PutDrawTextCentered(&gLinkArenaSt.texts[i], 10, 5 + i * 3, gLinkArenaSt.unk_A1[i], 10);
                ApplyPalette(Pal_TacticianSelObj + 0x10 * i, 0x13 + i);
            }

            EnableBgSync(BG0_SYNC_BIT);
        }
    }

    return;
}

void sub_08040714(struct SioBatProc * proc)
{
    int i;
    char buf[20];

    ClearSioBG();
    sub_08047B34();

    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    Decompress(Img_LinkArenaPlayerBanners, (void *)0x06016000);
    Decompress(gUnknown_085AC604, (void *)0x06016800);

    for (i = 0; i < 4; i++)
    {
        ApplyPalette(gUnknown_085ADDA8, 0x13 + i);
    }

    sub_08047BD4(0, 2);

    ReadMultiArenaSaveTeamName(gLinkArenaSt.unk_03, buf);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();
    sub_0803DCF0();

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.linking_status[i] = 0xff;
    }

    sub_08040640();

    for (i = 0; i < 19; i++)
    {
        gUnknown_03004E86[i] = buf[i];
    }

    proc->unk_34 = 0;
    proc->unk_30 = 0;

    StartLinkArenaButtonSpriteDraw(192, 16, proc);
    proc->unk_2c = StartLinkArenaVersusSpriteDraw(72, 32, proc);

    SetFaceConfig(gUnknown_085A9864);
    StartFace(3, 0xDF, 208, 80, 2);

    StartLinkArenaTitleBanner(proc->unk_2c, gUnknown_080D9D5E[gLinkArenaSt.unk_00]);
    sub_08047E84(gUnknown_08B98CA8[gLinkArenaSt.unk_00], gUnknown_081D5254[gLinkArenaSt.unk_00], 0, 8, gLinkArenaSt.unk_00, proc->unk_2c);

    PutSioText(0x3C6 + proc->unk_30, 1); // "Setting up. Please wait..."

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08045F00
void sub_08040870(ProcPtr proc)
{
    u16 data = 0x2586;

    Proc_Start(ProcScr_SIOVSYNC, PROC_TREE_VSYNC);
    Proc_Start(ProcScr_SIOMAIN, proc);
    Proc_Start(ProcScr_SIOCON, proc);

    SioSend16(&data, -1);

    return;
}

void sub_080408B8(struct SioBatProc * proc)
{
    int i;
    u8 buf[4];
    u8 recvBuf[4];

    int timeouts = 0;
    u16 got = 0;
    struct SioBatProc_Unk2C * unk_2c = proc->unk_2c;

    gUnk_Sio_0203DD28 = 0;
    buf[0] = 0;

    sub_08040640();

    if (Proc_Find(ProcScr_SIOCON) != NULL)
    {
        if ((gpKeySt->pressed & B_BUTTON) != 0)
        {
            SioPlaySoundEffect(1);
            EndLinkArenaButtonSpriteDraw();
            sub_08040610();
            sub_08040634();
            Proc_Goto(proc, 2);
        }

        return;
    }

    EndLinkArenaButtonSpriteDraw();

    unk_2c->unk_34 = gSioSt->selfId;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            timeouts++;
        }
    }

    if (gSioSt->playerStatus[gSioSt->selfId] == 2)
    {
        sub_08040610();
        sub_08040634();
        Proc_Goto(proc, 2);
        return;
    }

    if ((sub_0803CD64() == 0) || (gSioSt->unk_01E > 60) || (timeouts != 0))
    {
        sub_08040610();
        sub_08040634();
        sub_08040870(proc);
        proc->unk_30 = 0;
        PutSioText(0x3C6, 1); // "Setting up. Please wait..."
        StartLinkArenaButtonSpriteDraw(192, 16, proc);
        return;
    }

    if ((gSioSt->selfId == 0) && (sub_0803CDE8() == 1))
    {
        if (proc->unk_30 != 2)
        {
            proc->unk_30 = 2;
            PutSioText(0x3C8, 1); // "Press START to begin."
        }

        if ((gpKeySt->pressed & START_BUTTON) != 0)
        {
            gSioSt->unk_004 = 6;
            gSioSt->unk_01E = 0;

            for (i = 0; i < 4; i++)
            {
                gSioSt->timeoutClock[i] = 0;
            }

            SioPlaySoundEffect(2);

            gSioSt->unk_007 = sub_0803CCC4();
            gLinkArenaSt.unk_A0 = gSioSt->unk_007;
            sub_0803D674();

            buf[0] = 0x18;
            proc->unk_34 = SioEmitData(buf, 4);

            Proc_Break(proc);
            return;
        }
    }
    else if (proc->unk_30 != 1)
    {
        proc->unk_30 = 1;
        PutSioText(0x3C7, 1); // "Please wait..."
    }

    if (((gSioSt->selfId != 0) && (sub_0803CD1C(gSioSt->selfId) != 0)))
    {
        got = SioReceiveData(buf, recvBuf, 0);
        if (got != 0)
        {
            gSioSt->unk_004 = 6;
            gSioSt->unk_01E = 0;

            for (i = 0; i < 4; i++)
            {
                gSioSt->timeoutClock[i] = 0;
            }

            gSioSt->unk_007 = sub_0803CCC4();
            gLinkArenaSt.unk_A0 = gSioSt->unk_007;

            sub_0803D674();
            Proc_Break(proc);
            return;
        }
    }

    if ((GetGameTime() % 38) != 0)
    {
        return;
    }

    gUnknown_03004E80.kind = SIO_MSG_8C;
    gUnknown_03004E80.sender = gSioSt->selfId;
    gUnknown_03004E80.param = gSioSt->unk_000;

    SioSend(&gUnknown_03004E80, 0x16);

    return;
}

//! FE8U = 0x0804619C
void sub_08040AE0(struct SioBatProc * proc)
{
    sub_08040640();

    gUnk_Sio_0203DD28++;

    if ((gLinkArenaSt.unk_A0 != gSioSt->unk_007) || (gUnk_Sio_0203DD28 > 600))
    {
        sub_08040610();
        sub_08040634();
        sub_08040870(proc);

        proc->unk_30 = 0;

        PutSioText(0x3C6, 1); // "Setting up. Please wait..."
        StartLinkArenaButtonSpriteDraw(192, 16, proc);

        Proc_Goto(proc, 3);

        goto _08046220;
    }
    else if (gSioSt->selfId == 0)
    {
        if ((gSioSt->pendingSend[proc->unk_34].unk_00 & gSioSt->unk_009) == gSioSt->unk_009)
        {
        _08046220:
            Proc_Break(proc);
        }

        return;
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08046234
void sub_08040B80(struct SioBatProc * proc)
{
    u8 buf[0x10];

    PutSioText(0x3C7, 1); // "Please wait..."

    if (gSioSt->selfId == 0)
    {
        proc->unk_3b = GetGameTime() % gLinkArenaSt.unk_A0;
        proc->unk_39 = gLinkArenaSt.unk_A0 * ((RandNextB() & 3) + 4) + proc->unk_3b;

        buf[0] = gLinkArenaSt.unk_ec.unk_0_0;
        buf[1] = gLinkArenaSt.unk_ec.unk_0_2;
        buf[2] = gLinkArenaSt.unk_ec.unk_0_1;
        buf[3] = proc->unk_3b;
        buf[4] = proc->unk_39;

        RandGetSt((void *)buf + 6);

        proc->unk_34 = SioEmitData(buf, sizeof(buf));
    }

    proc->unk_3a = 0;
    proc->unk_38 = 0;

    return;
}

void sub_08040C24(struct SioBatProc * proc)
{
    u16 got;
    struct SioBatProc_Unk2C * unk_2c;
    u8 buf[16];
    u8 outSenderId[4];

    unk_2c = proc->unk_2c;

    if (gSioSt->selfId == 0)
    {
        if (gSioSt->pendingSend[proc->unk_34].unk_00 == gSioSt->unk_009)
        {
            PutSioText(0x3CC, 1); // "Select player to move first."
            unk_2c->unk_38 = 0;
            Proc_Break(proc);
        }
    }
    else
    {
        if ((GetGameTime() % 38) == 0)
        {
            got = SioReceiveData(buf, outSenderId, NULL);

            if (got != 0)
            {
                struct LinkArenaStMaybe * las = &gLinkArenaSt;
                u8 * buf2 = buf;
                struct { u32 unk_0_0 : 1; u32 unk_0_1 : 1; u32 unk_0_2 : 1; } * unk_ec = (void *)&las->unk_ec;

                unk_ec->unk_0_0 = buf2[0];
                unk_ec->unk_0_2 = buf[1];
                unk_ec->unk_0_1 = buf[2];

                proc->unk_3b = buf[3];
                proc->unk_39 = buf[4];
                RandSetSt((void *)(buf + 6));
                PutSioText(0x3CC, 1); // "Select player to move first."
                unk_2c->unk_38 = 0;
                Proc_Break(proc);
            }
        }
    }

    return;
}

//! FE8U = 0x080463A8
void sub_08040CFC(struct SioBatProc * proc)
{
    struct SioBatProc_Unk2C * unk_2c = proc->unk_2c;

    proc->unk_38++;

    if (proc->unk_38 > 16)
    {
        proc->unk_38 = 0;
        proc->unk_3a++;
        proc->unk_3a = proc->unk_3a % gLinkArenaSt.unk_A0;
        proc->unk_39--;
        unk_2c->unk_38 = proc->unk_3a;

        PlaySoundEffect(0x7D);

        if (proc->unk_39 == 0)
        {
            if (proc->unk_3b != gSioSt->selfId)
            {
                PutSioText(0x3CE + proc->unk_3b, 1); // "P# moves first."
            }
            else
            {
                PutSioText(0x3CD, 1); // "You move first."
            }

            unk_2c->unk_38 = proc->unk_3b;

            gUnk_Sio_0203DD90.unk_00 = proc->unk_3b;
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x0804645C
void sub_08040DB0(void)
{
    PlaySoundEffect(0x7E);
    return;
}

//! FE8U = 0x08046478
void sub_08040DCC(struct Unit * unit)
{
    unit->exp = 0;
    SetUnitStatus(unit, 0);
    unit->rescue = 0;

    if (gLinkArenaSt.unk_ec.unk_0_2 == 0)
    {
        sub_0803DD40(unit);
    }
    else
    {
        sub_08048E0C(unit);
    }

    return;
}

//! FE8U = 0x080464B0
void sub_08040E08(struct SioBatProc * proc)
{
    int i;

    int base = gSioSt->selfId * 0x40 + 1;
    gUnk_Sio_0203DD28 = 0;

    InitUnits();
    ReadMultiArenaSaveTeamRaw(gLinkArenaSt.unk_03, gUnknown_085A9884);

    for (i = 0; i < 5; i++)
    {
        struct Unit * unit = GetUnit(base + i);

        ClearUnit(unit);
        LoadSavedUnit(&gUnknown_085A9884->units[i], unit);

        sub_08040DCC(unit);

        unit->index = base + i;

        if (i == 0)
        {
            gUnk_Sio_0203DD90.unk_24[gSioSt->selfId] = GetUnitMiniPortraitId(unit);
        }
    }

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.linking_status[i] = 0;
    }

    gSioSt->unk_00A = 1 << gSioSt->selfId;

    proc->unk_64 = 0;
    proc->unk_4c = 0;

    return;
}

//! FE8U = 0x08046580
void sub_08040ED8(struct SioBatProc * proc)
{
    int i;
    u8 buf[0x24];
    u8 outSenderId[4];

    u8 unk = 0;

    if (proc->unk_4c == 0)
    {
        PlaySoundEffect(0x7C);
    }

    proc->unk_4c++;

    if (proc->unk_4c > 23)
    {
        proc->unk_4c = 0;
    }

    if (proc->unk_64 < 5)
    {
        proc->unk_58 = (u8)SioEmitData((u8 *)&gUnknown_085A9884->units[proc->unk_64], 0x28);
        proc->unk_64++;
        gLinkArenaSt.linking_status[gSioSt->selfId] = proc->unk_64;
    }

    if ((GetGameTime() % 38) == 0)
    {
        u16 got = SioReceiveData(buf, outSenderId, 0);

        if (got != 0)
        {
            int base = outSenderId[0] * 0x40 + 1;
            struct Unit * unit = GetUnit(base + gLinkArenaSt.linking_status[outSenderId[0]]);

            ClearUnit(unit);
            LoadSavedUnit(buf, unit);
            sub_08040DCC(unit);

            unit->index = gLinkArenaSt.linking_status[outSenderId[0]] + base;

            if (gLinkArenaSt.linking_status[outSenderId[0]] == 0)
            {
                gUnk_Sio_0203DD90.unk_24[outSenderId[0]] = GetUnitMiniPortraitId(unit);
            }

            if (gLinkArenaSt.unk_ec.unk_0_0 == 0)
            {
                unit->state = US_CONCEALED;
            }

            gLinkArenaSt.linking_status[outSenderId[0]]++;
        }

        for (i = 0; i < 4; i++)
        {
            u8 * ptr = gUnk_Sio_0203DAC0;

            if ((sub_0803CD1C(i) != 0) && (ptr[i] < 5))
            {
                unk++;
            }
        }

        if (unk == 0)
        {
            gSioSt->unk_00A = 1 << gSioSt->selfId;
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08046704
void sub_0804105C(struct SioBatProc * proc)
{
    if (proc->unk_4c == 0)
    {
        PlaySoundEffect(0x7C);
    }

    proc->unk_4c++;

    if (proc->unk_4c > 23)
    {
        proc->unk_4c = 0;
    }

    gUnk_Sio_0203DD28++;

    if (gUnk_Sio_0203DD28 > 600)
    {
        StartSioErrorScreen();
    }

    gSioMsgBuf.kind = SIO_MSG_89;
    gSioMsgBuf.sender = gSioSt->selfId;
    gSioMsgBuf.param = 0;

    SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

    if ((gSioSt->pendingSend[proc->unk_58].unk_00 == gSioSt->unk_009) &&
        ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->pendingSend[proc->unk_58].unk_00))
    {
        Proc_EndEach(gUnknown_085A93A0);
        Proc_Break(proc);
    }

    return;
}

void sub_08041104(struct SioBatProc * proc)
{
    ClearSioBG();
    sub_08047B34();

    EndLinkArenaVersusSpriteDraw();
    EndFaceById(3);

    ClearText(&gUnk_Sio_0203DA78);
    Text_SetColor(&gUnk_Sio_0203DA78, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&gUnk_Sio_0203DA78, DecodeMsg(0x785)); // "Now Loading"
    PutText(&gUnk_Sio_0203DA78, gBg2Tm + TM_OFFSET(9, 12));

    Proc_Start(gUnknown_085A93A0, proc);

    sub_08047BD4(0, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

void sub_0804116C(ProcPtr proc)
{
    int i;
    u8 buf[4];

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
    LoadLinkArenaRuleSettings(buf);

    SetBgOffset(BG_1, 0xfe, 0);

    for (i = 0; i < 3; i++)
    {
        int y = 6 + i * 3;

        ClearText(&gLinkArenaSt.texts[i]);
        Text_SetColor(&gLinkArenaSt.texts[i], TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(&gLinkArenaSt.texts[i], DecodeMsg(gLinkArenaRuleData[i].labelTextId));
        PutText(&gLinkArenaSt.texts[i], gBg0Tm + TM_OFFSET(6, y));

        sub_0804203C(i, buf[i]);
    }

    DrawLinkArenaModeIcon(gBg1Tm + TM_OFFSET(30 + gLinkArenaRuleData[1].xPos[0], 8), 0);
    DrawLinkArenaModeIcon(gBg1Tm + TM_OFFSET(30 + gLinkArenaRuleData[1].xPos[1], 8), 1);

    StartLinkArenaTitleBanner(proc, gUnknown_080D9D5E[gLinkArenaSt.unk_00]);
    sub_08047E84(gUnknown_08B98CA8[gLinkArenaSt.unk_00], gUnknown_081D5254[gLinkArenaSt.unk_00], 0, 8, gLinkArenaSt.unk_00, proc);

    PutSioText(0x3C9, 1); // "The rules for this battle."

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080469AC
void sub_080412C8(void)
{
    sub_0803D500(3);
    return;
}

//! FE8U = 0x080469B8
void sub_080412D4(void)
{
    sub_0803D500(0);
    return;
}

extern struct ProcCmd CONST_DATA gUnknown_085AA75C[];
