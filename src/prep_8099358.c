#include "gbafe.h"
#include "gbafe/cgtext.h"

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
    /* 43 */ u8 unk_43[0x4E - 0x43];
    /* 4E */ s16 unk_4e;
    /* 50 */ s16 unk_50;
    /* 52 */ s16 unk_52;
    /* 54 */ s16 unk_54;
    /* 56 */ s16 unk_56;
    /* 58 */ s16 unk_58;
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
extern u8 Tsa_0840EA38[];
extern u16 const * CONST_DATA gUnk_08CC5100[];
extern struct ProcCmd CONST_DATA ProcScr_08CC5114[];
extern int CONST_DATA gUnk_08CC50C0[];




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
ASM_FUNC("asm/nonmatching/code_08099968.s");
ASM_FUNC("asm/nonmatching/code_08099A48.s");
ASM_FUNC("asm/nonmatching/code_08099AC0.s");
ASM_FUNC("asm/nonmatching/code_08099B6C.s");
ASM_FUNC("asm/nonmatching/code_08099BA4.s");
ASM_FUNC("asm/nonmatching/code_08099FA0.s");
ASM_FUNC("asm/nonmatching/code_0809A024.s");
ASM_FUNC("asm/nonmatching/code_0809A280.s");
ASM_FUNC("asm/nonmatching/code_0809A378.s");
ASM_FUNC("asm/nonmatching/code_0809A404.s");
ASM_FUNC("asm/nonmatching/code_0809A504.s");
ASM_FUNC("asm/nonmatching/code_0809A560.s");
ASM_FUNC("asm/nonmatching/code_0809A650.s");
ASM_FUNC("asm/nonmatching/code_0809A6C0.s");
ASM_FUNC("asm/nonmatching/code_0809A824.s");
ASM_FUNC("asm/nonmatching/code_0809A83C.s");
ASM_FUNC("asm/nonmatching/code_0809A870.s");
ASM_FUNC("asm/nonmatching/code_0809A8C8.s");
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
