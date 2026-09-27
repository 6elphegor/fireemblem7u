#include "gbafe.h"

bool8 sub_08002CCC(void);
void sub_08002C8C(void);
void sub_080BAA68(struct ProcTitle * proc);
void sub_080BAA90(struct ProcTitle * proc);

EWRAM_OVERLAY(gamestart) struct TitleSt gTitleSt = {0};

struct ProcCmd CONST_DATA ProcScr_TitleScreen[] = {
    PROC_YIELD,
    PROC_CALL(Title_Init),
    PROC_CALL(Title_InitDisp),
    PROC_CALL(FadeInBlackSpeed10),
    PROC_YIELD,
    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_YIELD,
    PROC_CALL(Title_StartBmBgfxAnim),
    PROC_REPEAT(Title_BmBgfxAnimIN),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_CALL(Title_ResetBmBgfxConf),
    PROC_REPEAT(Title_BmBgfxAnimOUT),
    PROC_CALL(Title_RefrainSprites),
PROC_LABEL(1),
    PROC_CALL(sub_080BAA68),
    PROC_YIELD,
    PROC_CALL(sub_080BAA90),
PROC_LABEL(2),
    PROC_REPEAT(Title_IDLE),
PROC_LABEL(3),
    PROC_CALL(sub_08014170),
    PROC_YIELD,
    PROC_CALL(Title_End),
    PROC_END,
};

void HBlank_TitleScreen(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount >= DISPLAY_HEIGHT)
        vcount = 0;

    REG_BG0VOFS = -((1 & vcount) + vcount / 2);
}

void ResetTitleBgAffin(u8 bg)
{
    struct BgAffineSrcData data;
    struct BgAffineDstData * dst;

    data.texX = 0;
    data.texY = 0;
    data.scrX = 0;
    data.scrY = 0;
    data.sx = 0x100;
    data.sy = 0x100;
    data.alpha = 0;

    dst = &gDispIo.bg3affin;
    if (bg == BG_2)
        dst = &gDispIo.bg2affin;

    BgAffineSet(&data, dst, 1);
}

void Title_InitSpriteAnim(struct ProcTitle * proc, bool anim_en);
ASM_FUNC("asm/nonmatching/code_080BA42C.s");



void Title_InitBg(struct ProcTitle * proc);
ASM_FUNC("asm/nonmatching/code_080BA4BC.s");


void Title_Init(struct ProcTitle * proc);
ASM_FUNC("asm/nonmatching/code_080BA564.s");


void Title_InitDisp(struct ProcTitle * proc)
{
    Title_InitSpriteAnim(proc, true);
    Title_InitBg(proc);

    EnableBgSync(BG3_SYNC_BIT | BG2_SYNC_BIT | BG1_SYNC_BIT);

    Title_StartTextFlame(proc);
}

void Title_StartBmBgfxAnim(struct ProcTitle * proc)
{
    SetOnHBlankA(HBlank_TitleScreen);
    Title_InitSpriteAnim(proc, false);
    Title_InitBg(proc);

    StartBmBgfx(
        BmBgfxConf_GameTitle,
        BG_0,
        0, 0,
        0, 0x2800, 0xA,
        NULL, proc
    );

    SetDispEnable(1, 0, 0, 0, 1);
    EnableBgSync(BG3_SYNC_BIT | BG2_SYNC_BIT | BG1_SYNC_BIT);
    PlaySoundEffect(0x63);
    proc->timer = 0;
}

void Title_BmBgfxAnimIN(struct ProcTitle * proc);
ASM_FUNC("asm/nonmatching/code_080BA764.s");


void Title_ResetBmBgfxConf(struct ProcTitle * proc)
{
    proc->timer = 0;
    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetDispEnable(1, 0, 1, 1, 1);
    SetBlendBackdropB(1);
}

void Title_BmBgfxAnimOUT(struct ProcTitle * proc);
ASM_FUNC("asm/nonmatching/code_080BA918.s");


void Title_RefrainSprites(struct ProcTitle * proc)
{
    SetOnHBlankA(NULL);
    Title_StartTextFlame(proc);
}

void Title_IDLE(struct ProcTitle * proc)
{
    u8 time;

    proc->timer_idle++;
    proc->timer = (++proc->timer & 0x3f);

    ApplyPaletteExt(Pal_TitleFlameIdle + proc->timer / 4, 0x230, 2);

    if (gpKeySt->pressed & (A_BUTTON | START_BUTTON))
    {
        PlaySoundEffect(0x38D);
        SetNextGameAction(GAME_ACTION_EVENT_RETURN);
        Proc_Break(proc);
    }
    else if (proc->timer_idle == 0x1E0)
    {
        SetNextGameAction(GAME_ACTION_CLASS_REEL);
        Proc_Break(proc);
    }
}

void Title_End(struct ProcTitle * proc)
{
    int i;

    EndAllProcChildren(proc);

    for (i = 0; i < 6; i++)
        if (proc->approcs[i])
            EndSpriteAnimProc(proc->approcs[i]);

    EndEachSpriteAnimProc();
    SetOnHBlankA(NULL);
}

void sub_080BAA68(struct ProcTitle * proc)
{
    if (sub_08002CCC())
        StartTemporaryLock(proc, 20);
    else
        StartTemporaryLock(proc, 60);
}

void sub_080BAA90(struct ProcTitle * proc)
{
    sub_08002C8C();

    proc->approcs[3] = StartSpriteAnimProc(SpirteAnim_TitleText, 0x178, 0x80, 0x400, 4, 0xA);
    TitleSpriteBlendIN(proc->approcs[3], 0x78, 0x80, 0x78, 0x80, 0x10, proc);
}

void StartTitleScreen_WithMusic(ProcPtr parent)
{
    struct ProcTitle * proc;

    proc = Proc_StartBlocking(ProcScr_TitleScreen, parent);
    proc->mode = 0;

    StartBgmExt(0x5A, 0, 0);
}

void StartTitleScreen_FlagFalse(ProcPtr parent)
{
    struct ProcTitle * proc;

    proc = Proc_StartBlocking(ProcScr_TitleScreen, parent);
    proc->mode = 0;
}

void StartTitleScreen_FlagTrue(ProcPtr parent)
{
    struct ProcTitle * proc;

    proc = Proc_StartBlocking(ProcScr_TitleScreen, parent);
    proc->mode = 1;
}
ASM_FUNC("asm/nonmatching/code_080BAB24.s");


struct ProcCmd CONST_DATA ProcScr_TitleFlame[] = {
    PROC_SET_END_CB(ResetScanLineHBlank),
    PROC_CALL(TitleFlame_Init),
    PROC_REPEAT(TitleFlame_Loop),
    PROC_END,
};

void Title_StartTextFlame(struct ProcTitle * proc);
ASM_FUNC("asm/nonmatching/code_080BABB8.s");


void TitleFlame_Init(struct Proc * proc)
{
    proc->unk64 = 0;
    proc->unk66 = 0;

    gTitleSt.unk_00 = 3;
    gTitleSt.unk_04 = 3;
    gTitleSt.unk_08 = 3;
    gTitleSt.unk_0C = 4;
    gTitleSt.unk_10 = 0;
}

void TitleFlame_Loop(struct Proc * proc);
ASM_FUNC("asm/nonmatching/code_080BADA0.s");


struct ProcCmd CONST_DATA ProcScr_TitleAnimSpriteCtrl[] = {
    PROC_YIELD,
    PROC_CALL(TitleSprite_Init),
    PROC_REPEAT(TitleSprite_Loop),
    PROC_END,
};

void TitleSprite_Init(struct ProcTitleSpriteCtrl * proc)
{
    if (proc->mode != 0)
    {
        SetBlendAlpha(0, 0x10);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendTargetB(1, 1, 1, 1, 1);
        SetBlendBackdropA(0);
        SetBlendBackdropB(1);
    }

    proc->timer = 0;
}

void TitleSprite_Loop(struct ProcTitleSpriteCtrl * proc)
{
    int diff, x, y, pa;

    proc->timer++;

    if (proc->callback)
        proc->callback(proc);

    if (proc->timer >= proc->duration)
    {
        Proc_Break(proc);
        SetSpriteAnimProcParameters(proc->approc, proc->x, proc->y, -1);
        return;
    }

    diff = proc->duration - proc->timer;

    x = OAM1_X((diff * proc->x_step + proc->x * proc->timer) / proc->duration);
    y = OAM0_Y((diff * proc->y_step + proc->y * proc->timer) / proc->duration);
    pa = (proc->timer * 0x10) / proc->duration;

    switch (proc->mode) {
    case 1:
        SetBlendAlpha(pa, 0x10 - pa);
        SetSpriteAnimProcParameters(proc->approc, x, y + 0x400, -1);
        break;

    case 2:
        SetBlendAlpha(0x10 - pa, pa);
        SetSpriteAnimProcParameters(proc->approc, x, y + 0x400, -1);
        break;

    case 0:
        SetSpriteAnimProcParameters(proc->approc, x, y, -1);
        break;

    default:
        break;
    }
}

void TitleSpriteBlendIN(ProcPtr approc, int x_step, int y_step, int x, int y, int duration, ProcPtr parent);
ASM_FUNC("asm/nonmatching/code_080BAFE8.s");


void TitleSpriteBlendOUT(ProcPtr approc, int x_step, int y_step, int x, int y, int duration, void (* callback)(ProcPtr proc), ProcPtr parent);
ASM_FUNC("asm/nonmatching/code_080BB028.s");

