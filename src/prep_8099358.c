#include "gbafe.h"
#include "gbafe/cgtext.h"
#include "gbafe/unk-data.h"

struct PrepRankProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int timer;
    /* 30 */ int msg;
    /* 34 */ u8 ranks[6];
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u8 unk_42;
    /* 43 */ char unk_43[0x4E - 0x43];
    /* 4E */ u8 unk_4e;
    /* 4F */ s8 unk_4f;
    /* 50 */ s8 unk_50;
    /* 51 */ u8 unk_51;
    /* 52 */ s16 unk_52;
    /* 54 */ s16 unk_54;
    /* 56 */ s16 unk_56;
    /* 58 */ int unk_58;
    /* 5C */ s16 unk_5c;
    /* 5E */ s16 unk_5e;
};

struct PrepRankPalAnimProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 pad_29[0x4C - 0x29];
    /* 4C */ u16 counter;
    /* 4E */ u8 pad_4e[0x58 - 0x4E];
    /* 58 */ int pal;
};

int GetGameTacticsRank(void);
int GetGameSurvivalRank(void);
int GetGameExpRank(void);
int GetGameCombatRank(void);
int GetGameFundsRank(void);
int GetOverallRank(int a, int b, int c, int d, int e);
struct FaceProc * StartTalkFace(int fid, int x, int y, int disp, int talk_face);
void StartCgText(int x, int y, int width, int height, int msg, void * vram, int pal, ProcPtr parent);
void SetCgTextFlags(int flags);
void EndCgText(void);

void sub_08099358(ProcPtr proc);
void sub_0809945C(int pal, ProcPtr parent);
void sub_08099474(struct PrepRankProc * proc);
void sub_08099628(void);
void sub_08099968(struct PrepRankProc * proc);

extern u8 Img_0840E830[];
extern u16 Pal_0840E978[];
extern u16 Pal_081D69E4[];
extern u16 Pal_081D72A4[];
extern u16 Pal_081D7B20[];
extern u8 Tsa_0840EA38[];
extern u16 const * CONST_DATA gUnk_08CC5100[];
extern struct ProcCmd CONST_DATA ProcScr_08CC5114[];
extern int CONST_DATA gUnk_08CC50C0[];
extern int CONST_DATA gUnk_08CC51C4[];
extern int CONST_DATA gUnk_08CC51AC[];
extern u8 Tsa_0840EAF0[];

struct PrepRankTalkEnt {
    /* 00 */ int pid;
    /* 04 */ int msg_hi;
    /* 08 */ int msg_mid;
    /* 0C */ int msg_lo;
};

extern struct PrepRankTalkEnt CONST_DATA gUnk_08CC52D8[];

void sub_08099BA4(struct PrepRankProc * proc);
void sub_08099A48(struct PrepRankProc * proc);
int sub_0809A83C(int pid, int rank);




void sub_08099358(ProcPtr proc)
{
    gDispIo.disp_ct.mode = 0;

    InitBgs(NULL);

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    InitFaces();
    ResetText();
    InitIcons();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 4);

    ApplyIconPalettes(4);
    PrepRestartMuralBackground();
}
void sub_08099400(struct PrepRankPalAnimProc * proc)
{
    proc->counter = 0;
}
void sub_08099408(struct PrepRankPalAnimProc * proc)
{
    int idx;

    proc->counter++;

    if (proc->counter % 4 == 0)
    {
        idx = (s16) proc->counter / 4;

        CpuFastCopy(Pal_0840E978 + idx * 16, gPal + 0x100 + proc->pal * 16, 0x20);
        EnablePalSync();

        if (idx == 5)
            Proc_Break(proc);
    }
}
void sub_0809945C(int pal, ProcPtr parent)
{
    struct PrepRankPalAnimProc * proc = Proc_Start(ProcScr_08CC5114, parent);
    proc->pal = pal;
}
ASM_FUNC("asm/nonmatching/code_08099474.s");
void sub_08099628(void)
{
    int i;
    struct Text * text = gPrepItemTexts;

    SetTextFontGlyphs(0);
    SetTextFont(NULL);

    for (i = 0; i < 5; i++)
    {
        ClearText(text);
        PutDrawText(text++, gBg2Tm + TM_OFFSET(4, 2 + i * 2), 0, 0, 0, DecodeMsg(gUnk_08CC50C0[i]));
    }

    EnableBgSync(BG2_SYNC_BIT);
}
void sub_08099684(struct PrepRankProc * proc)
{
    proc->ranks[0] = GetGameTacticsRank();
    proc->ranks[1] = GetGameSurvivalRank();
    proc->ranks[2] = GetGameFundsRank();
    proc->ranks[3] = GetGameExpRank();
    proc->ranks[4] = GetGameCombatRank();
    proc->ranks[5] = GetOverallRank(proc->ranks[0], proc->ranks[1], proc->ranks[2], proc->ranks[3], proc->ranks[4]);

    proc->timer = 0;

    Decompress(Img_0840E830, (void *) 0x06017000);
    ApplyPalette(Pal_0840E978, 0x1F);

    StartParallelWorker(sub_08099474, proc);
}
void sub_08099728(struct PrepRankProc * proc)
{
    int i;

    sub_08099358(proc);

    sub_08091944(0x5000, 5);
    sub_080AACD8(gBg1Tm, Tsa_0840EA38, 0x5280);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    SetWinEnable(0, 0, 0);
    SetWin0Box(128, 40, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(0, 8, 8, 8);

    for (i = 0; i < 6; i++)
        InitText(&gPrepItemTexts[i], 8);

    InitText(&gPrepItemTexts[29], 8);

    sub_08099628();

    if (gPlaySt.chapterModeIndex == 3)
        StartTalkFace(0x29, 0xD8, 0x58, 0x102, 0);
    else
        StartTalkFace(0x32, 0xD8, 0x58, 0x102, 0);
}
void sub_08099858(struct PrepRankProc * proc)
{
    if (gPlaySt.tact_enabled)
    {
        if (gPlaySt.chapterModeIndex == 3)
            proc->msg = 0xF97 - proc->ranks[5];
        else
            proc->msg = 0xF8B - proc->ranks[5];
    }
    else
    {
        if (gPlaySt.chapterModeIndex == 3)
            proc->msg = 0xF9D - proc->ranks[5];
        else
            proc->msg = 0xF91 - proc->ranks[5];
    }
}
void sub_080998B4(ProcPtr proc)
{
    EndCgText();
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndFaceById(0);
    SetOnHBlankA(NULL);
}
void sub_080998D8(ProcPtr proc)
{
    if (!sub_808FFFC())
    {
        Proc_Break(proc);
        return;
    }

    if (gpKeySt->pressed & START_BUTTON)
    {
        Proc_Goto(proc, 0);
        PlaySoundEffect(0x38B);
    }
}
void sub_08099928(struct PrepRankProc * proc)
{
    InitTalk(0x28, 0, 1);
    StartCgText(0x16, 0x13, 0x12, 4, proc->msg, (void *) 0x06011000, 10, 0);
    SetCgTextFlags(0x4E);
}
void sub_08099968(struct PrepRankProc * proc)
{
    int i, j;

    if (proc->unk_3b == 0)
        return;

    for (i = 0; i < 5; i++)
    {
        int x, y;

        if (proc->ranks[i] == 0xFF)
            continue;

        x = (proc->unk_52 + 0x34) & 0x1FF;
        y = (0x19 + proc->unk_54 + i * 16) & 0xFF;

        for (j = 0; j <= proc->ranks[i]; j++)
            PutSpriteExt(13, x + j * 10, y, gUnk_08CC5100[j], 0xF380);
    }

    if (proc->unk_3e != 0)
        PutSpriteExt(13, (proc->unk_52 + 0xC0) & 0x1FF, (proc->unk_54 + 0x1C) & 0xFF, gUnk_08CC5100[0], 0xF380);
}
void sub_08099A48(struct PrepRankProc * proc)
{
    int idx = 0;
    u16 const * pals[] = { Pal_UiWindowFrame1, Pal_081D69E4, Pal_081D72A4, Pal_081D7B20 };

    if (proc->unk_3d != 0)
        idx = 1;
    else
    {
        switch (proc->unk_3c)
        {
        case 0:
            idx = 3;
            break;

        case 1:
            break;

        case 2:
            idx = 2;
            break;
        }
    }

    ApplyPaletteExt(pals[idx], 0xA0, 0x20);

    if (proc->unk_3b == 0)
    {
        ArchivePalette(0x20);
        SetPalFadeStClkEnd(0xC0, 0xC0, 0xC0);
    }
}
void sub_08099AC0(struct PrepRankProc * proc)
{
    int i;

    proc->unk_3c = 0;
    proc->unk_3d = 0;
    proc->unk_3e = 0;
    proc->unk_52 = 0;
    proc->unk_54 = 0;
    proc->unk_5c = 0;
    proc->unk_5e = 0;

    for (i = 0; i < 5; i++)
        proc->ranks[i] |= 0xFF;

    proc->timer = 0;

    Decompress(Img_0840E830, (void *) 0x06017000);
    ApplyPaletteExt(Pal_0840E978, 0x3E0, 0x20);

    gPlaySt.cfgTextSpeed = 1;

    StartParallelWorker(sub_08099968, proc);
    StartGreenText(proc);

    gDispIo.blend_ct.target1_enable_bd = 0;
    gDispIo.blend_ct.target2_enable_bd = 0;
}
void sub_08099B6C(int x, int y, int color, int id, int count)
{
    int i;

    for (i = 0; i < count; i++)
        PutSpecialChar(gBg2Tm + TM_OFFSET(x + i, y), color, id);
}
void sub_08099BA4(struct PrepRankProc * proc)
{
    int i;

    ResetText();
    TmFill(gBg2Tm, 0);
    SetTextFontGlyphs(0);
    SetTextFont(NULL);

    if (proc->unk_3b != 0)
    {
        PutDrawText(NULL, gBg2Tm + TM_OFFSET(1, 1), 0, 0, 12, DecodeMsg(gUnk_08CC51C4[proc->unk_3c]));

        for (i = 0; i < 5; i++)
            PutDrawText(NULL, gBg2Tm + TM_OFFSET(2, 4 + i * 2), 0, 0, 5, DecodeMsg(gUnk_08CC50C0[i]));

        PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 7), 0, 0, 4, DecodeMsg(0x12C4));
        PutNumber(gBg2Tm + TM_OFFSET(27, 7), 2, proc->unk_58);
        PutSpecialChar(gBg2Tm + TM_OFFSET(28, 7), 3, 0x1E);

        PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 9), 0, 0, 4, DecodeMsg(0x12C5));
        PutSpecialChar(gBg2Tm + TM_OFFSET(23, 9), 0, 0x20);
        PutSpecialChar(gBg2Tm + TM_OFFSET(26, 9), 0, 0x20);
        PutNumber(gBg2Tm + TM_OFFSET(22, 9), 2, proc->unk_40);
        sub_080063CC(gBg2Tm + TM_OFFSET(25, 9), 2, proc->unk_41);
        sub_080063CC(gBg2Tm + TM_OFFSET(28, 9), 2, proc->unk_42);

        PutDrawText(NULL, gBg2Tm + TM_OFFSET(10, 1), 3, 0, 5, DecodeMsg(0x12C6));
        PutSpecialChar(gBg2Tm + TM_OFFSET(14, 1), 4, gUnk_08CC51AC[proc->ranks[5]]);

        if (proc->unk_3d == 0)
            PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 1), 3, 0, 4, DecodeMsg(0x12BA));
        else
            PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 1), 3, 4, 4, DecodeMsg(0x12BB));

        PutNumber(gBg2Tm + TM_OFFSET(24, 1), 2, proc->unk_4e);
        PutDrawText(NULL, gBg2Tm + TM_OFFSET(25, 1), 3, 0, 5, DecodeMsg(0x12C8));

        if (proc->unk_3e != 0)
        {
            PutDrawText(NULL, gBg2Tm + TM_OFFSET(16, 4), 0, 0, 6, proc->unk_43);
            PutNumber(gBg2Tm + TM_OFFSET(28, 4), 2, proc->unk_3a);
        }
        else
        {
            sub_08099B6C(17, 4, 1, 0x14, 5);
            sub_08099B6C(26, 4, 1, 0x14, 3);
        }
    }
    else
    {
        PutDrawText(NULL, gBg2Tm + TM_OFFSET(1, 1), 0, 0, 12, DecodeMsg(gUnk_08CC51C4[proc->unk_3c]));

        for (i = 0; i < 5; i++)
        {
            PutDrawText(NULL, gBg2Tm + TM_OFFSET(2, 4 + i * 2), 1, 0, 5, DecodeMsg(gUnk_08CC50C0[i]));
            sub_08099B6C(8, 4 + i * 2, 1, 0x14, 3);
        }

        PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 7), 1, 0, 4, DecodeMsg(0x12C4));
        sub_08099B6C(22, 7, 1, 0x14, 3);

        PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 9), 1, 0, 4, DecodeMsg(0x12C5));
        sub_08099B6C(22, 9, 1, 0x14, 3);

        PutDrawText(NULL, gBg2Tm + TM_OFFSET(10, 1), 1, 0, 5, DecodeMsg(0x12C6));
        sub_08099B6C(14, 1, 1, 0x14, 1);

        if (proc->unk_3d == 0)
            PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 1), 1, 0, 4, DecodeMsg(0x12BA));
        else
            PutDrawText(NULL, gBg2Tm + TM_OFFSET(17, 1), 1, 4, 4, DecodeMsg(0x12BB));

        sub_08099B6C(23, 1, 1, 0x14, 5);
        sub_08099B6C(17, 4, 1, 0x14, 5);
        sub_08099B6C(26, 4, 1, 0x14, 3);
    }

    EnableBgSync(BG2_SYNC_BIT);
}
void sub_08099FA0(struct PrepRankProc * proc)
{
    sub_08099358(proc);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0x280, 2);
    SetUiSpinningArrowConfig(3);
    SetUiSpinningArrowPositions(0, 0x40, 0xE8, 0x40);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    gDispIo.blend_ct.effect = 0;

    gDispIo.blend_coef_a = 0;
    gDispIo.blend_coef_b = 0;
    gDispIo.blend_y = 0;

    sub_08091944(0x5000, 5);
}
void sub_0809A024(struct PrepRankProc * proc)
{
    int i;
    struct GameRankSaveData buf;

    CpuFill16(0, &buf, sizeof(buf));

    LoadRankData(&buf, proc->unk_3c, proc->unk_3d);

    proc->unk_3b = buf.valid;

    if (proc->unk_3b != 0)
    {
        proc->ranks[0] = buf.tactics_rank;
        proc->ranks[1] = buf.survival_rank;
        proc->ranks[2] = buf.funds_rank;
        proc->ranks[3] = buf.exp_rank;
        proc->ranks[4] = buf.combat_rank;
        proc->unk_3e = buf.unk00_16;
        proc->unk_40 = buf.hours;
        proc->unk_41 = buf.minutes;
        proc->unk_42 = buf.seconds;
        proc->unk_58 = buf.gold;
        proc->unk_3f = buf.luckydog;

        proc->ranks[5] = GetOverallRank(proc->ranks[0], proc->ranks[1], proc->ranks[2], proc->ranks[3], proc->ranks[4]);

        proc->unk_4e = buf.unk08_15;
        proc->unk_3a = buf.unk00_17;

        if (proc->unk_3e != 0)
        {
            strcpy(proc->unk_43, buf.tactician_name);
            SetTacticianName(proc->unk_43);
        }
        else
        {
            SetTacticianName(DecodeMsg(0x55B));
        }

        if (proc->unk_3f != 0)
        {
            if (sub_0809A83C(proc->unk_3f, proc->ranks[5]) == 0)
                proc->unk_3f = 0;
        }

        if (proc->unk_3f == 0)
        {
            if (proc->unk_3c == 0)
                proc->unk_3f = 0x2D;
            else
                proc->unk_3f = 0x28;
        }
    }
    else
    {
        for (i = 0; i < 5; i++)
            proc->ranks[i] |= 0xFF;
    }

    sub_080AACD8(gBg1Tm, Tsa_0840EAF0, 0x5280);

    sub_08099BA4(proc);
    sub_08099A48(proc);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    EndFaceById(0);
    EndCgText();

    if (proc->unk_3b != 0 && proc->unk_3f != 0)
    {
        int msg;

        StartTalkFace(gCharacterData[proc->unk_3f - 1].portraitId, 0xD8, 0x58, 0x102, 0);

        msg = sub_0809A83C(proc->unk_3f, proc->ranks[5]);

        InitTalk(0x28, 0, 1);
        StartCgText(0x16, 0x13, 0x12, 4, msg, (void *) 0x06011000, 10, 0);
        SetCgTextFlags(0x809FE);
    }
}
ASM_FUNC("asm/nonmatching/code_0809A280.s");
ASM_FUNC("asm/nonmatching/code_0809A378.s");
ASM_FUNC("asm/nonmatching/code_0809A404.s");
ASM_FUNC("asm/nonmatching/code_0809A504.s");
ASM_FUNC("asm/nonmatching/code_0809A560.s");
ASM_FUNC("asm/nonmatching/code_0809A650.s");
ASM_FUNC("asm/nonmatching/code_0809A6C0.s");
void sub_0809A824(struct PrepRankProc * proc)
{
    sub_0809E3D8(proc->unk_3c, proc->unk_3d, proc);
}
int sub_0809A83C(int pid, int rank)
{
    struct PrepRankTalkEnt const * it;

    for (it = gUnk_08CC52D8; it->pid != 0; it++)
    {
        if (pid == it->pid)
        {
            if (rank > 3)
                return it->msg_hi;

            if (rank > 1)
                return it->msg_mid;

            return it->msg_lo;
        }
    }

    return 0;
}
int sub_0809A870(int n)
{
    int r = n % 3;

    if (r == 0)
        return gUnk_08CC52D8[n / 3].msg_hi;

    if (r == 1)
        return gUnk_08CC52D8[n / 3].msg_mid;

    return gUnk_08CC52D8[n / 3].msg_lo;
}
int sub_0809A8C8(int n)
{
    return gUnk_08CC52D8[n / 3].pid;
}
ASM_FUNC("asm/nonmatching/code_0809A8E4.s");
ASM_FUNC("asm/nonmatching/code_0809A924.s");
ASM_FUNC("asm/nonmatching/code_0809A9A8.s");
ASM_FUNC("asm/nonmatching/code_0809AB38.s");
ASM_FUNC("asm/nonmatching/code_0809AB7C.s");
ASM_FUNC("asm/nonmatching/code_0809ABC0.s");
ASM_FUNC("asm/nonmatching/code_0809AC20.s");
ASM_FUNC("asm/nonmatching/code_0809AC7C.s");
ASM_FUNC("asm/nonmatching/code_0809AC9C.s");
ASM_FUNC("asm/nonmatching/code_0809ACFC.s");
ASM_FUNC("asm/nonmatching/code_0809AD20.s");
ASM_FUNC("asm/nonmatching/code_0809AD64.s");
ASM_FUNC("asm/nonmatching/code_0809ADC0.s");
ASM_FUNC("asm/nonmatching/code_0809ADE4.s");
ASM_FUNC("asm/nonmatching/code_0809AE40.s");
ASM_FUNC("asm/nonmatching/code_0809AE84.s");
ASM_FUNC("asm/nonmatching/code_0809AEA0.s");
ASM_FUNC("asm/nonmatching/code_0809AEBC.s");
ASM_FUNC("asm/nonmatching/code_0809AEFC.s");
ASM_FUNC("asm/nonmatching/code_0809AF94.s");
ASM_FUNC("asm/nonmatching/code_0809B02C.s");
