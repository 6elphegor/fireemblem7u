#include "gbafe.h"

extern const char gUnk_084218D8[];
extern const char gUnk_084218E0[];
extern const char gUnk_084218EC[];
extern const char gUnk_084218FC[];
extern const char gUnk_08421904[];
extern const char gUnk_0842190C[];
extern const char gUnk_08421914[];
extern const char gUnk_0842191C[];
extern const char gUnk_08421924[];
extern const char gUnk_0842192C[];
extern const char gUnk_08421934[];
extern const char gUnk_0842193C[];
extern const char gUnk_08421944[];
extern const char gUnk_0842194C[];
extern const char gUnk_08421958[];
extern const char gUnk_08421960[];
extern const char gUnk_08421968[];
extern const char gUnk_08421970[];
extern const char gUnk_08421978[];
extern const char gUnk_08421984[];
extern const char gUnk_08421990[];
extern const char gUnk_08421998[];
extern const char gUnk_084219A0[];
extern const char gUnk_084219B0[];
extern const char gUnk_084219BC[];
extern const char gUnk_084219C4[];
extern const char gUnk_084219CC[];
extern const char gUnk_084219D4[];
extern const char gUnk_084219E0[];
extern const char gUnk_084219EC[];
extern const char gUnk_084219F4[];
extern const char gUnk_084219FC[];
extern const char gUnk_08421A08[];
extern const char gUnk_08421A14[];
extern const char gUnk_08421A20[];
extern const char gUnk_08421A28[];
extern const char gUnk_08421A30[];
extern const char gUnk_08421A3C[];
extern const char gUnk_08421A4C[];
extern const char gUnk_08421A58[];
extern const char gUnk_08421A64[];
extern const char gUnk_08421A70[];
extern const char gUnk_08421A7C[];
extern const char gUnk_08421A88[];
extern const u8 gUnk_08CE6114[], gUnk_08CE6128[], gUnk_08CE6140[], gUnk_08CE614C[], gUnk_08CE6158[],
    gUnk_08CE6164[], gUnk_08CE6178[], gUnk_08CE6184[], gUnk_08CE6190[], gUnk_08CE619C[],
    gUnk_08CE61A8[];

// FE8U: opinfo.c (class reel; ClassReel_* is in lord-select.c)

struct ClassReelEnt {
    /* 00 */ char const * name;
    /* 04 */ int descMsg;
    /* 08 */ u8 _pad_08[0x0A - 0x08];
    /* 0A */ s8 charPalId;
    /* 0B */ u8 jid;
    /* 0C */ u8 genericPalId;
    /* 0D */ u8 animId;
    /* 0E */ u8 magicFx;
    /* 0F */ u8 xOffsetBg;
    /* 10 */ u8 yOffsetBg;
    /* 11 */ u8 xOffsetObj;
    /* 12 */ u8 yOffsetObj;
    /* 13 */ u8 terrainL;
    /* 14 */ u8 terrainR;
    /* 15 */ u8 _pad_15[0x18 - 0x15];
    /* 18 */ u8 const * script;
};

struct OpInfoEnterProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 timer;
    /* 2C */ s16 x;
    /* 2E */ STRUCT_PAD(0x2E, 0x30);
    /* 30 */ u8 const * str;
    /* 34 */ u8 count;
    /* 35 */ STRUCT_PAD(0x35, 0x3C);
    /* 3C */ ProcPtr iconProc;
    /* 40 */ ProcPtr parentProc;
    /* 44 */ struct ClassReelEnt * ent;
};

struct OpInfoViewProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 timer;
    /* 2C */ u16 tile;
    /* 2E */ u8 index;
    /* 30 */ s16 x;
};

struct OpInfoIconProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 timer;
    /* 2C */ u8 jid;
    /* 2D */ u8 numIcons;
    /* 2E */ u8 bits;
};

void SetLordSelectState(int stat);
bool sub_080AEE74(void);

struct OpInfoClassDisplayProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 timer;
    /* 2C */ u16 timer2;
    /* 2E */ STRUCT_PAD(0x2E, 0x30);
    /* 30 */ ProcPtr parent;
    /* 34 */ struct ClassReelEnt * ent;
    /* 38 */ u8 const * script;
    /* 3C */ ProcPtr statsProc;
    /* 40 */ u8 stats[6];
    /* 46 */ u8 x;
};

struct OpInfoGaugeDrawProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 timer;
    /* 2C */ STRUCT_PAD(0x2C, 0x30);
    /* 30 */ struct OpInfoClassDisplayProc * display;
    /* 34 */ u8 width;
    /* 35 */ u8 x;
};

struct ClassDisplayFont {
    u16 const * sprite;
    u8 xBase;
    u8 width;
    u8 yBase;
};

struct ClassDisplayFont const * GetClassDisplayFontInfo(u8 chr);

extern struct AnimBuffer gOpInfoData;
extern struct BanimUnkStructComm gOpInfoTerrainConf;
extern struct ClassReelEnt const * const * const * const gClassReelSetLut[];
extern const struct ProcCmd ProcScr_ClassInfoDisplay[];
extern const struct ProcCmd ProcScr_ClassStatsDisplay[];
extern u8 Img_ClassDisplayFont[];
extern u16 Pal_ClassDisplayFont[];
extern int const gClassReelStatLabels[2][6];
extern u16 const Pal_ClassReel_InfoBg[];
extern u8 const Tsa_ClassReel_InfoBg[];
extern u8 const Img_ClassReel_UiBox[];
extern u16 const Pal_ClassReel_UiBox[];
extern u8 const Tsa_ClassReel_UiBox[];
extern u8 gOpInfoImgSheetBuf[];
extern u8 gOpInfoRtlOamBuf[];
extern u8 gOpInfoPalBuf[];
extern u8 gOpInfoFrameBuf[];
extern struct AnimMagicFxBuffer gClassReelMagicAnim;
extern u8 gOpInfoMagicBgImgBuf[];
extern u8 gOpInfoMagicBgTsaBuf[];
extern u8 gOpInfoMagicObjImgBuf[];
extern u8 gOpInfoTerrainBuf[];
extern struct Text gClassReelTexts[6];

ProcPtr StartTalkMsg(int x, int y, int id);
void SetTalkPrintDelay(int delay);

ProcPtr StartClassStatsDisplay(ProcPtr parent);
void SetClassStatsDisplayX(struct OpInfoGaugeDrawProc * proc, int x);

static inline int DarknessCoeff(int darkness, u8 lsr)
{
    return 0x10 - (darkness >> (lsr));
}

extern ProcPtr gClassIntroLetterProcs[];

extern const struct ProcCmd ProcScr_ClassIntro[];
extern const struct ProcCmd ProcScr_ClassIntroLetter[];
extern const struct ProcCmd ProcScr_ClassIntroIcon[];
extern u8 CONST_DATA gClassIntroGlyphWidths[];
extern u16 CONST_DATA Sprite_ClassIntroLetter[];

extern u8 Img_ClassIntroFont[];
extern u16 Pal_ClassIntroFont[];
extern u16 Pal_ClassIntroIcons[];
extern u8 Img_ClassIntroIcons[];
extern u16 CONST_DATA Sprite_ClassIntroLine[];
extern u16 CONST_DATA Sprite_ClassIntroLineEndL[];
extern u16 CONST_DATA Sprite_ClassIntroLineEndR[];
extern u16 CONST_DATA Sprite_ClassIntroIconFrame[];
extern u16 const * CONST_DATA SpriteLut_ClassIntroIcons[];
extern u16 const * CONST_DATA SpriteLut_GaugePips[];

int GetClassIntroGlyphTile(u8 chr);
void PutClassIntroLetter(u16 tile, u8 index, int x, int y, u16 xScale, u16 yScale, u8 offset);
void PutClassIntroIconLine(u8 len, u8 flag);
void PutClassIntroIcons(u8 a, u8 b, u8 c);
int GetClassIntroGlyphWidth(u8 chr);
ProcPtr StartClassNameIntroLetter(ProcPtr parent, int index, int x, int tile);
ProcPtr StartClassNameIntroIcon(ProcPtr parent, u8 jid);


int GetClassIntroGlyphTile(u8 chr)
{
    int idx = 0;

    if (chr == ' ')
        return 0xFFFF;

    if ((u8) (chr - 'a') < 26)
        idx = chr - 'a' + 26;

    if ((u8) (chr - 'A') < 26)
        idx = chr - 'A';

    return (idx / 16) * 0x80 + (idx % 16) * 2;
}

int GetClassIntroGlyphWidth(u8 chr)
{
    if (chr == ' ')
        return 8;

    if ((u8) (chr - 'a') < 26)
        return gClassIntroGlyphWidths[chr - 'a'];

    if ((u8) (chr - 'A') < 26)
        return gClassIntroGlyphWidths[chr - 'A'];

    return 0;
}

int GetClassIntroStringWidth(u8 const * str)
{
    int width = 0;

    while (*str != 0)
    {
        width += GetClassIntroGlyphWidth(*str);
        str++;
    }

    return width;
}

void PutClassIntroLetter(u16 tile, u8 index, int x, int y, u16 xScale, u16 yScale, u8 offset)
{
    int i;
    int pal = (u8) (index % 13) + 1;

    if (tile == 0xFFFF)
        return;

    if (offset != 0)
    {
        for (i = 1; i < 0x10; i++)
        {
            if (i + offset > 0xF)
                gPal[0x100 + pal * 0x10 + i] = gPal[0x10F];
            else
                gPal[0x100 + pal * 0x10 + i] = gPal[0x100 + i + offset];
        }

        EnablePalSync();
    }
    else
    {
        pal = 14;
    }

    if (xScale < 8)
        xScale = 8;

    if (yScale < 8)
        yScale = 8;

    SetObjAffineAuto(index, 0, xScale, yScale);

    PutSpriteExt(4, (x & 0x1FF) + (index << 9), y & 0x1FF, Sprite_ClassIntroLetter, tile + OAM2_PAL(pal));
}

void ClassIntro_PutNextLetter(struct OpInfoEnterProc * proc)
{
    if (*proc->str != 0)
    {
        gClassIntroLetterProcs[proc->count] =
            StartClassNameIntroLetter(proc, proc->count, proc->x, GetClassIntroGlyphTile(*proc->str));

        proc->x += GetClassIntroGlyphWidth(*proc->str);
        proc->str++;
        proc->count++;
    }
}

void ClassIntro_Init(struct OpInfoEnterProc * proc)
{
    int i;

    SetWinEnable(0, 0, 0);
    SetBlendNone();

    proc->timer = 0;

    for (i = 0; i < 0x10; i++)
        gClassIntroLetterProcs[i] = NULL;

    proc->iconProc = NULL;

    Decompress(Img_ClassIntroFont, (void *) 0x06010000);
    ApplyPalette(Pal_ClassIntroFont, 0x10);
    ApplyPalette(Pal_ClassIntroIcons, 0x1E);
    ApplyPalette(Pal_ClassIntroIcons, 0x1F);
    Decompress(Img_ClassIntroIcons, (void *) 0x06016000);

    proc->str = proc->ent->name;
    proc->count = 0;
    proc->x = (240 - GetClassIntroStringWidth(proc->str)) / 2 - 8;

    ClassIntro_PutNextLetter(proc);

    proc->iconProc = StartClassNameIntroIcon(proc, proc->ent->jid);
}

void ClassIntro_LoopFadeIn(struct OpInfoEnterProc * proc)
{
    SetBlendBrighten(DarknessCoeff(proc->timer, 1));
    gDispIo.blend_ct.target1_enable_bd = 1;

    proc->timer++;

    if (proc->timer == 0x20)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ClassIntro_LoopIn(struct OpInfoEnterProc * proc)
{
    if (proc->timer >= 0x60)
    {
        Proc_Break(proc);
        proc->timer = 0;
        proc->str = proc->ent->name;
        return;
    }

    if (proc->timer >= 0x10 && ((proc->timer - 0x10) & 1) == 0)
        ClassIntro_PutNextLetter(proc);

    proc->timer++;
}

void ClassIntro_LoopOut(struct OpInfoEnterProc * proc)
{
    if (proc->timer == 20)
        Proc_Goto(proc->iconProc, 4);

    if (proc->timer >= 80)
    {
        Proc_Break(proc);
        proc->timer = 0;
        return;
    }

    if ((u16) (proc->timer % 3) == 0 && *proc->str != 0)
    {
        Proc_Break(gClassIntroLetterProcs[(u16) (proc->timer / 3)]);
        proc->str++;
    }

    proc->timer++;
}

void ClassIntro_OnEnd(ProcPtr proc)
{
    EndAllProcChildren(proc);
    SetLordSelectState(3);
}

ProcPtr StartClassNameIntro(ProcPtr parent, intptr_t ent)
{
    struct OpInfoEnterProc * proc = Proc_Start(ProcScr_ClassIntro, parent);

    proc->parentProc = parent;
    proc->ent = (struct ClassReelEnt *) ent;

    return proc;
}

void ClassIntroLetter_Init(struct OpInfoViewProc * proc)
{
    proc->timer = 0;
}

// The if-branch is plain C: (sin * radius) >> 12 gives the original ldrsh
// loads, and x/y at function scope, reused by the else branch, give its
// register choices and 24-byte frame.
// FAKEMATCH (else branch, found by an Opus 5.5 agent): timer and its copies
// are pinned to r1/r0/r2 (c is a dead copy the original has); the empty
// ++/-- ifs split basic blocks so the index and 0x100 land in r6/r8; the r0
// statement expressions build 0x100 as 0x18 + 0xe8; the function-pointer cast
// (int 5th parameter) avoids truncating timer to u16.
void ClassIntroLetter_LoopFadeIn(struct OpInfoViewProc * proc)
{
    int x, y;

    if (proc->index == 0)
    {
        int x0;
        int y0;
        int angle;
        u16 scale;

        x0 = (gSinLut[0x40 + 0x60] * 0x40) >> 12;
        y0 = (gSinLut[0x60] * 0x18) >> 12;

        angle = 0xC0 - proc->timer;
        x = (gSinLut[0x40 + (angle & 0xFF)] * 0x40) >> 12;
        y = (gSinLut[angle & 0xFF] * 0x18) >> 12;

        scale = 0x200 - ((proc->timer << 8) / 0x60);

        PutClassIntroLetter(proc->tile, proc->index, ((proc->x + x) - x0) & 0x1FF, ((0x18 + y) - y0) & 0x1FF,
            scale, scale, 8 - ({ proc->timer + 0; }) / 12);

        proc->timer += 4;

        if (proc->timer == 0x60)
        {
            proc->timer = 0;
            Proc_Break(proc);
        }
    }
    else
    {
#if NONMATCHING
        int t4 = proc->timer >> 4;

        y = 0x10 - t4;
        PutClassIntroLetter(proc->tile, proc->index, proc->x - y, 0x18 - y, proc->timer, 0x100, 0x10 - t4);
#else
        {
            register int timer asm("r1") = proc->timer;
            register int b asm("r0") = timer;
            register int c asm("r2") = timer;
            int t4;

            asm("" : : "r"(c));
            t4 = b >> 4;
            x = 0x10 - t4;
            asm("" : : "r"(x));
            y = x;

            ((void (*)(u16, u8, int, int, int, u16, u8)) PutClassIntroLetter)(proc->tile, proc->index,
                ({ register int px asm("r0"); if (t4) { ++t4; --t4; } px = proc->x; px; }) - y,
                ({ register int k asm("r0") = 0x18; k; }) - y,
                timer, 0x100, 0x10 - t4);

            if (c) { ++c; --c; }
        }
#endif

        proc->timer += 0x10;

        if (proc->timer == 0x100)
        {
            proc->timer = 0;
            Proc_Break(proc);
        }
    }
}
void ClassIntroLetter_LoopDisplay(struct OpInfoViewProc * proc)
{
    PutClassIntroLetter(proc->tile, proc->index, proc->x, 0x18, 0x100, 0x100, 0);
    proc->timer = 0;
}

void ClassIntroLetter_LoopFadeOut(struct OpInfoViewProc * proc)
{
    int timer = proc->timer;
    int a4 = 0x100 + timer;
    int a5 = 0x100 - timer;
    int x = proc->x;
    int d = ((x - 0x58) * timer * timer) >> 15;

    PutClassIntroLetter(proc->tile, proc->index, x + d, 0x18, a4, a5, ({ proc->timer + 0; }) / 16);

    if (proc->timer == 0x100)
    {
        gClassIntroLetterProcs[proc->index] = NULL;
        Proc_Break(proc);
    }

    proc->timer += 8;
}
ProcPtr StartClassNameIntroLetter(ProcPtr parent, int index, int x, int tile)
{
    struct OpInfoViewProc * proc = Proc_Start(ProcScr_ClassIntroLetter, parent);

    proc->index = index;
    proc->x = x;
    proc->tile = tile;

    return proc;
}

void sub_080AF584(void)
{
    EnablePalSync();
}

void ClassIntroIcon_Init(struct OpInfoIconProc * proc)
{
    int i;

    proc->timer = 0;

    for (i = 0; i < 0x10; i++)
        gPal[0x10 * 0x1F + i] = 0;

    proc->bits = 0;
    proc->numIcons = 0;

    for (i = 0; i < 8; i++)
    {
        if (GetClassData(proc->jid)->baseRanks[i] == 0)
            continue;

        proc->bits |= 1 << i;
        proc->numIcons++;
    }

    EnablePalSync();
}

void PutClassIntroIconLine(u8 len, u8 flag)
{
    int i;
    u16 oam2 = OAM2_PAL(14);

    if (flag)
        oam2 = OAM2_PAL(15);

    PutSpriteExt(4, 0x74, 0x48, Sprite_ClassIntroLine, oam2);

    for (i = 0; i < len; i++)
    {
        if (i < len - 1)
        {
            PutSpriteExt(4, 0x74 - i * 8, 0x48, Sprite_ClassIntroLine, oam2);
            PutSpriteExt(4, 0x74 + i * 8, 0x48, Sprite_ClassIntroLine, oam2);
        }
        else
        {
            PutSpriteExt(4, 0x74 - i * 8, 0x48, Sprite_ClassIntroLineEndL, oam2);
            PutSpriteExt(4, 0x74 + i * 8, 0x48, Sprite_ClassIntroLineEndR, oam2);
        }
    }
}

// FAKEMATCH (found by an Opus 5.5 agent): b pinned to r1 inside the loop
// init stops gcse hoisting b << 5 above the palette loop.
void PutClassIntroIcons(u8 a, u8 b, u8 c)
{
    int i;
    int tmp;
    int tmp2;
    u16 const * const * object;
    u16 oam2 = OAM2_PAL(14);

    if (a != 0)
        oam2 = OAM2_PAL(15);

    for (i = 0; i < 0x10; i++)
    {
        u16 color;

        if ((a + i) < 0x10)
            color = a + i;
        else
            color = 0xF;

        gPal[0x1F0 + i] = gPal[0x1E0 + color];
    }

    EnablePalSync();

#if NONMATCHING
    for (i = 0, object = SpriteLut_ClassIntroIcons, tmp2 = 0x88 - (b << 5); i < 8; object++, i++)
#else
    for (i = 0, tmp = ({ register int bb asm("r1") = b; (bb << 5) - 0x88; }), object = SpriteLut_ClassIntroIcons, tmp2 = -tmp; i < 8; object++, i++)
#endif
    {
        if (((c >> i) & 1) != 0)
        {
            PutSpriteExt(4, tmp2 & 0x1FF, 0x50, *object, OAM2_PAL(15));
            tmp2 += 0x20;
        }
    }

    PutSpriteExt(4, 0x90, 0x50, Sprite_ClassIntroIconFrame, oam2);
}

void ClassIntroIcon_LoopLine(struct OpInfoIconProc * proc)
{
    if (++proc->timer < 0xE)
    {
        PutClassIntroIconLine(proc->timer, 0);
    }
    else
    {
        PutClassIntroIconLine(0xE, 0);
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ClassIntroIcon_LoopFadeIn(struct OpInfoIconProc * proc)
{
    u8 unk;

    proc->timer++;

    if (proc->timer > 0x10)
    {
        unk = 0;
        Proc_Break(proc);
    }
    else
    {
        unk = 0x10 - proc->timer;
    }

    PutClassIntroIconLine(0xE, 0);
    PutClassIntroIcons(unk, proc->numIcons, proc->bits);
}

void ClassIntroIcon_LoopDisplay(struct OpInfoIconProc * proc)
{
    PutClassIntroIconLine(0xE, 0);
    PutClassIntroIcons(0, proc->numIcons, proc->bits);
    proc->timer = 0;
}

void ClassIntroIcon_LoopFadeOut(struct OpInfoIconProc * proc)
{
    proc->timer++;

    if ((proc->timer >> 1) > 0x10)
    {
        Proc_Break(proc);
    }
    else
    {
        PutClassIntroIcons(proc->timer >> 1, proc->numIcons, proc->bits);
        PutClassIntroIconLine(0xE, 1);
    }
}

ProcPtr StartClassNameIntroIcon(ProcPtr parent, u8 jid)
{
    struct OpInfoIconProc * proc = Proc_Start(ProcScr_ClassIntroIcon, parent);
    proc->jid = jid;

    return proc;
}

void ClassReel_VCountHandler(void)
{
    u16 vcount = (REG_VCOUNT + 1);

    if (vcount < 110)
    {
        REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 2;
        REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 2;
    }
    else
    {
        REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 1;
        REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 1;
    }
}

void ClassReel_SetupMagicBlend(void)
{
    SetBlendAlpha(0x10, 0x10);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 240, 160);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    gDispIo.blend_ct.target2_enable_bd = 1;
}

void ClassInfoDisplay_Init(struct OpInfoClassDisplayProc * proc)
{
    union
    {
        int hack_4d[2][6][1][1];
        int hack_2d[2][6];
    } hack;
    int i;
    int hasMagicRank;
    u16 * buffer;

    hasMagicRank = FALSE;

    memcpy(hack.hack_2d, gClassReelStatLabels, sizeof(hack.hack_2d));

    proc->script = proc->ent->script;

    for (i = 4; i <= 7; i++)
    {
        if ((GetClassData(proc->ent->jid)->baseRanks[i]) != 0)
        {
            hasMagicRank = TRUE;
            break;
        }
    }

    proc->timer = 0;
    proc->timer2 = 0;

    proc->x = 0xFA;

    TmFill(buffer = gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    SetDispEnable(0, 0, 0, 0, 0);

    SetBlendNone();

    ResetTextFont();
    ResetText();

    gDispIo.bg0_ct.priority = 2;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    Decompress(Img_PrepMuralBackground, (void *) (GetBgChrOffset(3) + VRAM));
    ApplyPaletteExt(Pal_ClassReel_InfoBg, 0x140, 0x20);
    TmApplyTsa_thm(gBg3Tm, Tsa_ClassReel_InfoBg, TILEREF(0, 10));

    Decompress(Img_ClassReel_UiBox, (void *) (GetBgChrOffset(2) + VRAM));
    ApplyPaletteExt(Pal_ClassReel_UiBox, 0x120, 0x20);
    TmApplyTsa_thm(gBg2Tm, Tsa_ClassReel_UiBox, TILEREF(0, 9));

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    TmFill(buffer, 0);

    proc->stats[0] = GetClassData(proc->ent->jid)->baseHP;
    proc->stats[1] = GetClassData(proc->ent->jid)->basePow;
    proc->stats[2] = GetClassData(proc->ent->jid)->baseSkl;
    proc->stats[3] = GetClassData(proc->ent->jid)->baseSpd;
    proc->stats[4] = GetClassData(proc->ent->jid)->baseDef;
    proc->stats[5] = GetClassData(proc->ent->jid)->baseRes;

    for (i = 0; i <= 5; i++)
    {
        InitText(&gClassReelTexts[i], 3);

        ClearText(&gClassReelTexts[i]);

        Text_SetColor(&gClassReelTexts[i], TEXT_COLOR_SYSTEM_GOLD);
        Text_SetCursor(&gClassReelTexts[i], 0);

        if (hasMagicRank != 0)
            Text_DrawString(&gClassReelTexts[i], DecodeMsg(hack.hack_2d[1][i]));
        else
#if NONMATCHING
            Text_DrawString(&gClassReelTexts[i], DecodeMsg(hack.hack_2d[0][i]));
#else
            // FAKEMATCH: hack_2d[0][i], through out-of-range indexes
            Text_DrawString(&gClassReelTexts[i], DecodeMsg(hack.hack_4d[0][i][1][-1]));
#endif

        PutText(&gClassReelTexts[i], TM_OFFSET(1, i * 2 + 1) + buffer);
        PutNumber(TM_OFFSET(5, i * 2 + 1) + buffer, TEXT_COLOR_SYSTEM_WHITE, proc->stats[i]);
    }

    proc->statsProc = StartClassStatsDisplay(proc);

    InitTalk(0x100, 2, 0);

    SetInitTalkTextFont();
    ClearTalkText();
    EndTalk();

    StartTalkMsg(2, 15, proc->ent->descMsg);

    SetTalkPrintColor(0);

    SetTalkFlag(1);
    SetTalkFlag(2);
    SetTalkFlag(4);
    SetTalkFlag(8);
    SetTalkFlag(0x40);

    SetTalkPrintDelay(4);

    gOpInfoData.charPalId = proc->ent->charPalId;
    gOpInfoData.xPos = 260;
    gOpInfoData.yPos = 88;
    gOpInfoData.animId = proc->ent->animId;
    gOpInfoData.roundType = 6;
    gOpInfoData.genericPalId = proc->ent->genericPalId;
    gOpInfoData.state2 = 1;
    gOpInfoData.oam2Tile = 0x180;
    gOpInfoData.oam2Pal = 2;
    gOpInfoData.pImgSheetBuf = gOpInfoImgSheetBuf;
    gOpInfoData.unk_24 = gOpInfoRtlOamBuf;
    gOpInfoData.unk_20 = gOpInfoPalBuf;
    gOpInfoData.unk_28 = gOpInfoFrameBuf;

    gOpInfoData.unk_30 = &gClassReelMagicAnim;

    gClassReelMagicAnim.magic_func_idx = proc->ent->magicFx;
    gClassReelMagicAnim.x_offset_bg = proc->ent->xOffsetBg;
    gClassReelMagicAnim.y_offset_bg = proc->ent->yOffsetBg;
    gClassReelMagicAnim.x_offset_obj = proc->ent->xOffsetObj;
    gClassReelMagicAnim.y_offset_obj = proc->ent->yOffsetObj;
    gClassReelMagicAnim.obj_chr = 0x280;
    gClassReelMagicAnim.obj_pal_id = 0xF;
    gClassReelMagicAnim.bg_chr = 0x200;
    gClassReelMagicAnim.bg_pal_id = 0xF;
    gClassReelMagicAnim.bg = 1;
    gClassReelMagicAnim.bg_tm_buf = gBg1Tm;
    gClassReelMagicAnim.bg_img_buf = gOpInfoMagicBgImgBuf;
    gClassReelMagicAnim.bg_tsa_buf = gOpInfoMagicBgTsaBuf;
    gClassReelMagicAnim.obj_img_buf = gOpInfoMagicObjImgBuf;
    gClassReelMagicAnim.reset_callback = ClassReel_SetupMagicBlend;

    NewEkrUnitMainMini(&gOpInfoData);

    gOpInfoTerrainConf.unk00 = proc->ent->terrainL;
    gOpInfoTerrainConf.unk02 = 10;
    gOpInfoTerrainConf.unk04 = 0x380;
    gOpInfoTerrainConf.unk06 = proc->ent->terrainR;
    gOpInfoTerrainConf.unk08 = 11;
    gOpInfoTerrainConf.unk0A = 0x3C0;
    gOpInfoTerrainConf.unk0C = 0;
    gOpInfoTerrainConf.unk0E = -1;

    gOpInfoTerrainConf.unk1C = (void *) OBJ_VRAM0;
    gOpInfoTerrainConf.unk20 = gOpInfoTerrainBuf;

    sub_08054F30(&gOpInfoTerrainConf);
    sub_08055308(&gOpInfoTerrainConf, 0xD0, 0x68, 0x130, 0x68);

    SetOnHBlankA(ClassReel_VCountHandler);
}
void ClassInfoDisplay_Worker(struct OpInfoClassDisplayProc * proc)
{
    if (proc->timer2 == 400)
    {
        if (sub_080AEE74())
        {
            FadeBgmOut(60);
            Proc_Goto(proc, 7);
        }
        else
        {
            Proc_Goto(proc, 4);
        }
    }

    proc->timer2++;
}

void ClassInfoDisplay_LoopWindowIn(struct OpInfoClassDisplayProc * proc)
{
    proc->x -= (80 - proc->timer) / 14 + 1;

    if (proc->x < 180)
        proc->x = 180;

    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 80 - proc->timer, 240, proc->timer + 80);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    if (proc->timer == 80)
    {
        proc->x = 180;
        proc->timer = 0;

        Proc_Break(proc);

        StartParallelWorker(ClassInfoDisplay_Worker, proc);
    }
    else
    {
        proc->timer += 4;
    }

    sub_08054E10(&gOpInfoData, proc->x, 88);
    sub_08055308(&gOpInfoTerrainConf, proc->x - 48, 104, proc->x + 48, 104);

    SetClassStatsDisplayX(proc->statsProc, 120);
}

void ClassInfoDisplay_ExecScript(struct OpInfoClassDisplayProc * proc)
{
    switch (proc->script[0])
    {
        case 0:
            Proc_Goto(proc, 10);
            break;

        case 1:
            gOpInfoData.roundType = 0;
            sub_08054C8C(&gOpInfoData);
            break;

        case 2:
            gOpInfoData.roundType = 1;
            sub_08054C8C(&gOpInfoData);
            break;

        case 3:
        case 7:
            sub_08054E5C(&gOpInfoData);
            break;

        case 4:
            gOpInfoData.roundType = 2;
            sub_08054C8C(&gOpInfoData);
            break;

        case 6:
            gOpInfoData.roundType = 4;
            sub_08054C8C(&gOpInfoData);
            break;

        case 5:
        case 8:
            break;
    }

    proc->timer = 0;
}

void ClassInfoDisplay_LoopScript(struct OpInfoClassDisplayProc * proc)
{
    switch (proc->script[0])
    {
        case 1:
        case 2:
        case 3:
        case 4:
        case 6:
        case 7:
            proc->script += 2;
            Proc_Break(proc);
            break;

        case 5:
            proc->timer++;

            if (proc->timer < proc->script[1])
                return;

            proc->script += 2;
            Proc_Break(proc);
            break;

        case 8:
            if (sub_08054E3C(&gOpInfoData) != 0)
            {
                proc->script += 2;
                Proc_Break(proc);
            }
    }
}

void ClassInfoDisplay_OnEnd(struct OpInfoClassDisplayProc * proc)
{
    SetOnHBlankA(NULL);

    EndTalk();
    EndActiveClassReelBgColorProc();
    sub_080552DC(&gOpInfoTerrainConf);
    EndActiveClassReelSpell();
    sub_08054EF0(&gOpInfoData);

    if (proc->statsProc != NULL)
        Proc_End(proc->statsProc);

    SetLordSelectState(2);
}

ProcPtr StartClassAnimDisplay(ProcPtr parent, intptr_t ent)
{
    struct OpInfoClassDisplayProc * proc = Proc_Start(ProcScr_ClassInfoDisplay, parent);

    proc->parent = parent;
    proc->ent = (struct ClassReelEnt *) ent;
    proc->statsProc = NULL;

    return proc;
}

void ClassStatsDisplay_Init(struct OpInfoGaugeDrawProc * proc)
{
    struct ClassDisplayFont const * font;
    int i;

    proc->display = (struct OpInfoClassDisplayProc *) proc->proc_parent;
    proc->timer = 0;
    proc->width = 0;
    proc->x = 0xFA;

    for (i = 0; i < 15 && ({ proc->display->ent->name[i]; }) != 0; i++)
    {
        font = GetClassDisplayFontInfo(proc->display->ent->name[i]);

        if (font != NULL)
            proc->width += font->width - font->xBase;
        else
            proc->width += 4;
    }

    Decompress(Img_ClassDisplayFont, (void *) 0x06010000);
    ApplyPalettes(Pal_ClassDisplayFont, 0x14, 2);
}

void ClassStatsDisplay_Loop(struct OpInfoGaugeDrawProc * proc)
{
    u8 value;
    int i;
    int x;

    for (i = 0; i < 6; i++)
    {
        value = proc->display->stats[i];

        if (value >= 30)
            value = 30;

        for (x = 0; x < (value >> 2); x++)
            PutSpriteExt(13, x * 8 + 0x31, i * 16 + 15, SpriteLut_GaugePips[3], 0x5000);

        if ((value & 3) != 0)
            PutSpriteExt(13, x * 8 + 0x31, i * 16 + 15, SpriteLut_GaugePips[(value & 3) - 1], 0x5000);
    }

    x = ((0x78 - proc->width) / 2) + proc->x;

    if (x + proc->width > 0xE8)
        x = 0xE8 - proc->width;

    for (i = 0; proc->display->ent->name[i] != 0;)
    {
        struct ClassDisplayFont const * font = GetClassDisplayFontInfo(proc->display->ent->name[i]);

        if (font != NULL)
        {
            if (font->sprite != NULL)
            {
                PutSpriteExt(4, x - (s8) font->xBase, 8 - (s8) font->yBase, font->sprite, 0x5000);
                PutSpriteExt(4, x - (s8) font->xBase - 2, 6 - (s8) font->yBase, font->sprite, 0x4000);

                x += (s8) font->width - (s8) font->xBase;
            }
        }
        else
        {
            x += 4;
        }

        i++;

        if (i > 14)
            break;
    }

    if (proc->timer < 0xFF)
        proc->timer++;
}
ProcPtr StartClassStatsDisplay(ProcPtr parent)
{
    return Proc_Start(ProcScr_ClassStatsDisplay, parent);
}

void SetClassStatsDisplayX(struct OpInfoGaugeDrawProc * proc, int x)
{
    proc->x = x;
}

intptr_t GetClassReelEntry(int set, int index)
{
    struct ClassReelEnt const * const * const * list = gClassReelSetLut[set];
    struct ClassReelEnt const * const * it;

    for (it = *list; *list != NULL;)
    {
        if (index == 0)
            return (intptr_t) *it;

        index--;
        it++;

        if (*it == NULL)
        {
            list++;
            it = *list;
        }
    }

    return 0;
}


SECTION(".rodata.08CE5EC0")
const struct ProcCmd ProcScr_ClassIntro[] = {
    PROC_19,
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_SLEEP(1),
    PROC_CALL(ClassIntro_Init),
    PROC_REPEAT(ClassIntro_LoopIn),
    PROC_REPEAT(ClassIntro_LoopOut),
    PROC_LABEL(4),
    PROC_CALL(ClassIntro_OnEnd),
    PROC_END,
};

SECTION(".rodata.08CE5F10")
const struct ProcCmd ProcScr_ClassIntroLetter[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(ClassIntroLetter_Init),
    PROC_REPEAT(ClassIntroLetter_LoopFadeIn),
    PROC_REPEAT(ClassIntroLetter_LoopDisplay),
    PROC_REPEAT(ClassIntroLetter_LoopFadeOut),
    PROC_END,
};

SECTION(".rodata.08CE5F48")
const struct ProcCmd ProcScr_ClassIntroIcon[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(ClassIntroIcon_Init),
    PROC_REPEAT(ClassIntroIcon_LoopLine),
    PROC_REPEAT(ClassIntroIcon_LoopFadeIn),
    PROC_REPEAT(ClassIntroIcon_LoopDisplay),
    PROC_LABEL(4),
    PROC_REPEAT(ClassIntroIcon_LoopFadeOut),
    PROC_END,
};

SECTION(".rodata.08CE5F90")
const struct ProcCmd ProcScr_ClassInfoDisplay[] = {
    PROC_SLEEP(0),
    PROC_CALL(ClassInfoDisplay_Init),
    PROC_SET_END_CB(ClassInfoDisplay_OnEnd),
    PROC_SLEEP(2),
    PROC_REPEAT(ClassInfoDisplay_LoopWindowIn),
    PROC_LABEL(9),
    PROC_CALL(ClassInfoDisplay_ExecScript),
    PROC_REPEAT(ClassInfoDisplay_LoopScript),
    PROC_GOTO(9),
    PROC_LABEL(10),
    PROC_BLOCK,
    PROC_LABEL(4),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(8),
    PROC_LABEL(7),
    PROC_CALL_ARG(NewFadeOut, 2),
    PROC_WHILE(FadeOutExists),
    PROC_LABEL(8),
    PROC_END,
};

SECTION(".rodata.08CE6030")
const struct ProcCmd ProcScr_ClassStatsDisplay[] = {
    PROC_19,
    PROC_SLEEP(3),
    PROC_CALL(ClassStatsDisplay_Init),
    PROC_REPEAT(ClassStatsDisplay_Loop),
    PROC_END,
};

extern const struct ClassReelEnt ClassReelEnt_08CE61AC;
extern const struct ClassReelEnt ClassReelEnt_08CE61C8;
extern const struct ClassReelEnt ClassReelEnt_08CE61E4;
extern const struct ClassReelEnt ClassReelEnt_08CE6200;
extern const struct ClassReelEnt ClassReelEnt_08CE621C;
extern const struct ClassReelEnt ClassReelEnt_08CE6238;
extern const struct ClassReelEnt ClassReelEnt_08CE6254;
extern const struct ClassReelEnt ClassReelEnt_08CE6270;
extern const struct ClassReelEnt ClassReelEnt_08CE628C;
extern const struct ClassReelEnt ClassReelEnt_08CE62A8;
extern const struct ClassReelEnt ClassReelEnt_08CE62C4;
extern const struct ClassReelEnt ClassReelEnt_08CE62E0;
extern const struct ClassReelEnt ClassReelEnt_08CE62FC;
extern const struct ClassReelEnt ClassReelEnt_08CE6318;
extern const struct ClassReelEnt ClassReelEnt_08CE6334;
extern const struct ClassReelEnt ClassReelEnt_08CE6350;
extern const struct ClassReelEnt ClassReelEnt_08CE636C;
extern const struct ClassReelEnt ClassReelEnt_08CE6388;
extern const struct ClassReelEnt ClassReelEnt_08CE63A4;
extern const struct ClassReelEnt ClassReelEnt_08CE63C0;
extern const struct ClassReelEnt ClassReelEnt_08CE63DC;
extern const struct ClassReelEnt ClassReelEnt_08CE63F8;
extern const struct ClassReelEnt ClassReelEnt_08CE6414;
extern const struct ClassReelEnt ClassReelEnt_08CE6430;
extern const struct ClassReelEnt ClassReelEnt_08CE644C;
extern const struct ClassReelEnt ClassReelEnt_08CE6468;
extern const struct ClassReelEnt ClassReelEnt_08CE6484;
extern const struct ClassReelEnt ClassReelEnt_08CE64A0;
extern const struct ClassReelEnt ClassReelEnt_08CE64BC;
extern const struct ClassReelEnt ClassReelEnt_08CE64D8;
extern const struct ClassReelEnt ClassReelEnt_08CE64F4;
extern const struct ClassReelEnt ClassReelEnt_08CE6510;
extern const struct ClassReelEnt ClassReelEnt_08CE652C;
extern const struct ClassReelEnt ClassReelEnt_08CE6548;
extern const struct ClassReelEnt ClassReelEnt_08CE6564;
extern const struct ClassReelEnt ClassReelEnt_08CE6580;
extern const struct ClassReelEnt ClassReelEnt_08CE659C;
extern const struct ClassReelEnt ClassReelEnt_08CE65B8;
extern const struct ClassReelEnt ClassReelEnt_08CE65D4;
extern const struct ClassReelEnt ClassReelEnt_08CE65F0;
extern const struct ClassReelEnt ClassReelEnt_08CE660C;
extern const struct ClassReelEnt ClassReelEnt_08CE6628;
extern const struct ClassReelEnt ClassReelEnt_08CE6644;
extern const struct ClassReelEnt ClassReelEnt_08CE6660;
extern const struct ClassReelEnt ClassReelEnt_08CE667C;
extern const struct ClassReelEnt ClassReelEnt_08CE6698;
extern const struct ClassReelEnt ClassReelEnt_08CE66B4;
extern const struct ClassReelEnt ClassReelEnt_08CE66D0;
extern const struct ClassReelEnt ClassReelEnt_08CE66EC;
extern const struct ClassReelEnt ClassReelEnt_08CE6708;
extern const struct ClassReelEnt ClassReelEnt_08CE6724;
extern const struct ClassReelEnt ClassReelEnt_08CE6740;
extern const struct ClassReelEnt ClassReelEnt_08CE675C;
extern const struct ClassReelEnt ClassReelEnt_08CE6778;
extern const struct ClassReelEnt ClassReelEnt_08CE6794;
extern const struct ClassReelEnt ClassReelEnt_08CE67B0;
extern const struct ClassReelEnt ClassReelEnt_08CE67CC;
extern const struct ClassReelEnt ClassReelEnt_08CE67E8;
extern const struct ClassReelEnt ClassReelEnt_08CE6804;
extern const struct ClassReelEnt ClassReelEnt_08CE6820;
extern const struct ClassReelEnt ClassReelEnt_08CE683C;
extern const struct ClassReelEnt ClassReelEnt_08CE6858;
extern const struct ClassReelEnt ClassReelEnt_08CE6874;
extern const struct ClassReelEnt ClassReelEnt_08CE6890;
extern const struct ClassReelEnt ClassReelEnt_08CE68AC;
extern const struct ClassReelEnt ClassReelEnt_08CE68C8;

SECTION(".rodata.08CE61AC")
const struct ClassReelEnt ClassReelEnt_08CE61AC = {
    .name = gUnk_084218D8,
    .descMsg = 0xFEF,
    ._pad_08 = { 0, 3 },
    .charPalId = -1,
    .jid = 2,
    .animId = 0xE,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE61C8")
const struct ClassReelEnt ClassReelEnt_08CE61C8 = {
    .name = gUnk_084218E0,
    .descMsg = 0xFF1,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x61,
    .jid = 0x28,
    .animId = 0x3A,
    .terrainL = 0x11,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE61E4")
const struct ClassReelEnt ClassReelEnt_08CE61E4 = {
    .name = gUnk_084218EC,
    .descMsg = 0x1003,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x2D,
    .jid = 0x32,
    .animId = 0x80,
    .terrainL = 0x19,
    .terrainR = 0x19,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6200")
const struct ClassReelEnt ClassReelEnt_08CE6200 = {
    .name = gUnk_084218FC,
    .descMsg = 0xFF3,
    ._pad_08 = { 0, 5 },
    .charPalId = 2,
    .jid = 0x18,
    .animId = 0x24,
    .terrainL = 0x13,
    .terrainR = 0x13,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE621C")
const struct ClassReelEnt ClassReelEnt_08CE621C = {
    .name = gUnk_08421904,
    .descMsg = 0xFF9,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x2F,
    .jid = 0x12,
    .animId = 0x1D,
    .terrainL = 1,
    .terrainR = 1,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6238")
const struct ClassReelEnt ClassReelEnt_08CE6238 = {
    .name = gUnk_0842190C,
    .descMsg = 0xFF6,
    ._pad_08 = { 0, 4 },
    .charPalId = 0x52,
    .jid = 0x1D,
    .animId = 0x61,
    .magicFx = 3,
    .terrainL = 0xE,
    .terrainR = 0xF,
    .script = &gUnk_08CE6184[2],
};

SECTION(".rodata.08CE6254")
const struct ClassReelEnt ClassReelEnt_08CE6254 = {
    .name = gUnk_08421914,
    .descMsg = 0xFFC,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x39,
    .jid = 0x20,
    .animId = 0x57,
    .magicFx = 1,
    .terrainL = 9,
    .terrainR = 9,
    .script = gUnk_08CE6164,
};

SECTION(".rodata.08CE6270")
const struct ClassReelEnt ClassReelEnt_08CE6270 = {
    .name = gUnk_0842191C,
    .descMsg = 0xFF7,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x6B,
    .jid = 0x3C,
    .animId = 0x78,
    .terrainL = 6,
    .terrainR = 6,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE628C")
const struct ClassReelEnt ClassReelEnt_08CE628C = {
    .name = gUnk_08421924,
    .descMsg = 0xFFD,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x40,
    .jid = 0x2E,
    .animId = 0x73,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE62A8")
const struct ClassReelEnt ClassReelEnt_08CE62A8 = {
    .name = gUnk_0842192C,
    .descMsg = 0x1001,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x1F,
    .jid = 0x41,
    .animId = 0x8D,
    .terrainL = 0x13,
    .terrainR = 0x13,
    .script = &gUnk_08CE6190[2],
};

SECTION(".rodata.08CE62C4")
const struct ClassReelEnt ClassReelEnt_08CE62C4 = {
    .name = gUnk_08421934,
    .descMsg = 0xFF5,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x3E,
    .jid = 0x1C,
    .animId = 0x8E,
    .magicFx = 4,
    .terrainL = 0xE,
    .terrainR = 0xF,
    .script = &gUnk_08CE6178[2],
};

SECTION(".rodata.08CE62E0")
const struct ClassReelEnt ClassReelEnt_08CE62E0 = {
    .name = gUnk_0842193C,
    .descMsg = 0xFF4,
    ._pad_08 = { 0, 7 },
    .charPalId = 8,
    .jid = 0x14,
    .animId = 0x51,
    .terrainL = 0x1B,
    .terrainR = 0x21,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE62FC")
const struct ClassReelEnt ClassReelEnt_08CE62FC = {
    .name = gUnk_08421944,
    .descMsg = 0xFFE,
    ._pad_08 = { 0, 2 },
    .charPalId = -1,
    .jid = 0x39,
    .genericPalId = 1,
    .animId = 0x14,
    .terrainL = 0x16,
    .terrainR = 0x16,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6318")
const struct ClassReelEnt ClassReelEnt_08CE6318 = {
    .name = gUnk_0842194C,
    .descMsg = 0xFF8,
    ._pad_08 = { 6, 2 },
    .charPalId = -1,
    .jid = 0xA,
    .genericPalId = 1,
    .animId = 0x2C,
    .terrainL = 0xB,
    .terrainR = 0x18,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6334")
const struct ClassReelEnt ClassReelEnt_08CE6334 = {
    .name = gUnk_08421958,
    .descMsg = 0x1016,
    ._pad_08 = { 0, 5 },
    .charPalId = -1,
    .jid = 0x38,
    .genericPalId = 1,
    .animId = 0x4F,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = &gUnk_08CE6128[2],
};

SECTION(".rodata.08CE6350")
const struct ClassReelEnt ClassReelEnt_08CE6350 = {
    .name = gUnk_08421960,
    .descMsg = 0x1000,
    ._pad_08 = { 0, 5 },
    .charPalId = -1,
    .jid = 0x24,
    .genericPalId = 1,
    .animId = 0x68,
    .terrainL = 9,
    .terrainR = 9,
    .script = &gUnk_08CE619C[2],
};

SECTION(".rodata.08CE636C")
const struct ClassReelEnt ClassReelEnt_08CE636C = {
    .name = gUnk_08421968,
    .descMsg = 0xFF2,
    ._pad_08 = { 0, 5 },
    .charPalId = -1,
    .jid = 0x2A,
    .genericPalId = 1,
    .animId = 0x40,
    .terrainL = 0xB,
    .terrainR = 0x12,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6388")
const struct ClassReelEnt ClassReelEnt_08CE6388 = {
    .name = gUnk_08421970,
    .descMsg = 0x1010,
    ._pad_08 = { 0, 5 },
    .charPalId = -1,
    .jid = 0x16,
    .genericPalId = 1,
    .animId = 0x53,
    .terrainL = 2,
    .terrainR = 2,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE63A4")
const struct ClassReelEnt ClassReelEnt_08CE63A4 = {
    .name = gUnk_084218D8,
    .descMsg = 0xFEE,
    ._pad_08 = { 0, 3 },
    .charPalId = -1,
    .jid = 1,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE63C0")
const struct ClassReelEnt ClassReelEnt_08CE63C0 = {
    .name = gUnk_08421978,
    .descMsg = 0xFFB,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x3F,
    .jid = 0xE,
    .animId = 0x98,
    .terrainL = 0x11,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE63DC")
const struct ClassReelEnt ClassReelEnt_08CE63DC = {
    .name = gUnk_08421984,
    .descMsg = 0xFFA,
    ._pad_08 = { 0, 6 },
    .charPalId = 0x6C,
    .jid = 0x2C,
    .animId = 0x6D,
    .magicFx = 3,
    .terrainR = 0x11,
    .script = &gUnk_08CE6184[2],
};

SECTION(".rodata.08CE63F8")
const struct ClassReelEnt ClassReelEnt_08CE63F8 = {
    .name = gUnk_08421990,
    .descMsg = 0xFFF,
    ._pad_08 = { 2, 2 },
    .charPalId = -1,
    .jid = 0x3A,
    .animId = 0x17,
    .terrainL = 0xC,
    .terrainR = 0xC,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6414")
const struct ClassReelEnt ClassReelEnt_08CE6414 = {
    .name = gUnk_08421998,
    .descMsg = 0x1002,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x23,
    .jid = 0x40,
    .animId = 0x8C,
    .terrainL = 0xE,
    .terrainR = 0xE,
    .script = &gUnk_08CE6190[2],
};

SECTION(".rodata.08CE6430")
const struct ClassReelEnt ClassReelEnt_08CE6430 = {
    .name = gUnk_084219A0,
    .descMsg = 0x1004,
    ._pad_08 = { 0, 7 },
    .charPalId = -1,
    .jid = 0x34,
    .animId = 0x85,
    .terrainL = 4,
    .terrainR = 4,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE644C")
const struct ClassReelEnt ClassReelEnt_08CE644C = {
    .name = gUnk_084219B0,
    .descMsg = 0x100B,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x15,
    .jid = 0x3B,
    .animId = 0x1A,
    .terrainL = 0x10,
    .terrainR = 0x10,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6468")
const struct ClassReelEnt ClassReelEnt_08CE6468 = {
    .name = gUnk_084219BC,
    .descMsg = 0x100C,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x58,
    .jid = 0x22,
    .animId = 0x59,
    .magicFx = 1,
    .terrainL = 9,
    .terrainR = 9,
    .script = gUnk_08CE6164,
};

SECTION(".rodata.08CE6484")
const struct ClassReelEnt ClassReelEnt_08CE6484 = {
    .name = gUnk_084219C4,
    .descMsg = 0x100F,
    ._pad_08 = { 0, 5 },
    .charPalId = 0x5C,
    .jid = 0x1B,
    .animId = 0x2A,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = &gUnk_08CE6128[2],
};

SECTION(".rodata.08CE64A0")
const struct ClassReelEnt ClassReelEnt_08CE64A0 = {
    .name = gUnk_084219CC,
    .descMsg = 0x1005,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x1B,
    .jid = 0xC,
    .animId = 0x2E,
    .terrainL = 0x17,
    .terrainR = 0x17,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE64BC")
const struct ClassReelEnt ClassReelEnt_08CE64BC = {
    .name = gUnk_084219D4,
    .descMsg = 0x100A,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x67,
    .jid = 0x10,
    .animId = 0x34,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE64D8")
const struct ClassReelEnt ClassReelEnt_08CE64D8 = {
    .name = gUnk_084219E0,
    .descMsg = 0x1013,
    ._pad_08 = { 4, 4 },
    .charPalId = 0xB,
    .jid = 0x3E,
    .animId = 0x7E,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = gUnk_08CE6158,
};

SECTION(".rodata.08CE64F4")
const struct ClassReelEnt ClassReelEnt_08CE64F4 = {
    .name = gUnk_084218D8,
    .descMsg = 0xFF0,
    ._pad_08 = { 0, 3 },
    .charPalId = -1,
    .jid = 3,
    .animId = 6,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6510")
const struct ClassReelEnt ClassReelEnt_08CE6510 = {
    .name = gUnk_084219EC,
    .descMsg = 0x1006,
    ._pad_08 = { 0, 5 },
    .charPalId = 0x72,
    .jid = 0x13,
    .animId = 0x20,
    .terrainL = 0x13,
    .terrainR = 0x13,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE652C")
const struct ClassReelEnt ClassReelEnt_08CE652C = {
    .name = gUnk_084219F4,
    .descMsg = 0x100D,
    ._pad_08 = { 5, 2 },
    .charPalId = 0x18,
    .jid = 0x1E,
    .animId = 0x65,
    .magicFx = 3,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = &gUnk_08CE6184[2],
};

SECTION(".rodata.08CE6548")
const struct ClassReelEnt ClassReelEnt_08CE6548 = {
    .name = gUnk_084219FC,
    .descMsg = 0x1011,
    ._pad_08 = { 0, 8 },
    .charPalId = 0x26,
    .jid = 0x37,
    .animId = 0x87,
    .terrainL = 0x16,
    .terrainR = 0x16,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6564")
const struct ClassReelEnt ClassReelEnt_08CE6564 = {
    .name = gUnk_08421A08,
    .descMsg = 0x1017,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x64,
    .jid = 0x42,
    .animId = 0x71,
    .magicFx = 2,
    .terrainL = 9,
    .terrainR = 9,
    .script = &gUnk_08CE6178[2],
};

SECTION(".rodata.08CE6580")
const struct ClassReelEnt ClassReelEnt_08CE6580 = {
    .name = gUnk_08421A14,
    .descMsg = 0x1009,
    ._pad_08 = { 0, 8 },
    .charPalId = -1,
    .jid = 0x33,
    .genericPalId = 1,
    .animId = 0x82,
    .terrainL = 0xD,
    .terrainR = 0xD,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE659C")
const struct ClassReelEnt ClassReelEnt_08CE659C = {
    .name = gUnk_08421A20,
    .descMsg = 0x1015,
    ._pad_08 = { 4, 2 },
    .charPalId = -1,
    .jid = 0x50,
    .genericPalId = 1,
    .animId = 0x17,
    .terrainL = 0xD,
    .terrainR = 0xD,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE65B8")
const struct ClassReelEnt ClassReelEnt_08CE65B8 = {
    .name = gUnk_08421A28,
    .descMsg = 0x1007,
    ._pad_08 = { 4, 4 },
    .charPalId = -1,
    .jid = 0x26,
    .genericPalId = 1,
    .animId = 0x6A,
    .magicFx = 3,
    .terrainL = 9,
    .terrainR = 9,
    .script = &gUnk_08CE6184[2],
};

SECTION(".rodata.08CE65D4")
const struct ClassReelEnt ClassReelEnt_08CE65D4 = {
    .name = gUnk_08421A30,
    .descMsg = 0x1008,
    ._pad_08 = { 0, 7 },
    .charPalId = -1,
    .jid = 0x2D,
    .genericPalId = 1,
    .animId = 0x6F,
    .magicFx = 2,
    .terrainL = 0x11,
    .script = &gUnk_08CE6178[2],
};

SECTION(".rodata.08CE65F0")
const struct ClassReelEnt ClassReelEnt_08CE65F0 = {
    .name = gUnk_08421A3C,
    .descMsg = 0x100E,
    ._pad_08 = { 0, 4 },
    .charPalId = -1,
    .jid = 0x30,
    .genericPalId = 1,
    .animId = 0x76,
    .script = gUnk_08CE614C,
};

SECTION(".rodata.08CE660C")
const struct ClassReelEnt ClassReelEnt_08CE660C = {
    .name = gUnk_08421A4C,
    .descMsg = 0x1014,
    ._pad_08 = { 0, 5 },
    .charPalId = 0x76,
    .jid = 0x43,
    .genericPalId = 1,
    .animId = 0x9F,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = &gUnk_08CE61A8[2],
};

SECTION(".rodata.08CE6628")
const struct ClassReelEnt ClassReelEnt_08CE6628 = {
    .name = gUnk_08421A58,
    .descMsg = 0x1012,
    ._pad_08 = { 0, 6 },
    .charPalId = 0x27,
    .jid = 0x45,
    .genericPalId = 1,
    .animId = 0x6B,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = &gUnk_08CE6178[2],
};

SECTION(".rodata.08CE6644")
const struct ClassReelEnt ClassReelEnt_08CE6644 = {
    .name = gUnk_08421A64,
    .descMsg = 0xFEF,
    ._pad_08 = { 0, 7 },
    .charPalId = -1,
    .jid = 8,
    .animId = 0x10,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6660")
const struct ClassReelEnt ClassReelEnt_08CE6660 = {
    .name = gUnk_084218E0,
    .descMsg = 0xFF1,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x4D,
    .jid = 0x28,
    .animId = 0x3B,
    .terrainL = 0x11,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE667C")
const struct ClassReelEnt ClassReelEnt_08CE667C = {
    .name = gUnk_084218EC,
    .descMsg = 0x1003,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x2C,
    .jid = 0x32,
    .animId = 0x80,
    .terrainL = 0x19,
    .terrainR = 0x19,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6698")
const struct ClassReelEnt ClassReelEnt_08CE6698 = {
    .name = gUnk_084218FC,
    .descMsg = 0xFF3,
    ._pad_08 = { 0, 5 },
    .charPalId = -1,
    .jid = 0x19,
    .animId = 0x26,
    .terrainL = 0x13,
    .terrainR = 0x13,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE66B4")
const struct ClassReelEnt ClassReelEnt_08CE66B4 = {
    .name = gUnk_08421904,
    .descMsg = 0xFF9,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x2E,
    .jid = 0x12,
    .animId = 0x1E,
    .terrainL = 1,
    .terrainR = 1,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE66D0")
const struct ClassReelEnt ClassReelEnt_08CE66D0 = {
    .name = gUnk_08421914,
    .descMsg = 0xFFC,
    ._pad_08 = { 5, 3 },
    .charPalId = 0x38,
    .jid = 0x21,
    .animId = 0x58,
    .magicFx = 1,
    .terrainL = 9,
    .terrainR = 9,
    .script = gUnk_08CE6164,
};

SECTION(".rodata.08CE66EC")
const struct ClassReelEnt ClassReelEnt_08CE66EC = {
    .name = gUnk_08421A70,
    .descMsg = 0xFEE,
    ._pad_08 = { 0, 6 },
    .charPalId = -1,
    .jid = 7,
    .animId = 2,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6708")
const struct ClassReelEnt ClassReelEnt_08CE6708 = {
    .name = gUnk_0842191C,
    .descMsg = 0xFF7,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x6A,
    .jid = 0x3C,
    .animId = 0x7A,
    .terrainL = 6,
    .terrainR = 6,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6724")
const struct ClassReelEnt ClassReelEnt_08CE6724 = {
    .name = gUnk_0842193C,
    .descMsg = 0xFF4,
    ._pad_08 = { 0, 7 },
    .charPalId = 7,
    .jid = 0x14,
    .animId = 0x51,
    .terrainL = 0x1B,
    .terrainR = 0x21,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6740")
const struct ClassReelEnt ClassReelEnt_08CE6740 = {
    .name = gUnk_0842194C,
    .descMsg = 0xFF8,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x3C,
    .jid = 0xA,
    .animId = 0x2C,
    .terrainL = 0xB,
    .terrainR = 0x18,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE675C")
const struct ClassReelEnt ClassReelEnt_08CE675C = {
    .name = gUnk_08421960,
    .descMsg = 0x1000,
    ._pad_08 = { 0, 5 },
    .charPalId = 0x59,
    .jid = 0x24,
    .animId = 0x68,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = &gUnk_08CE619C[2],
};

SECTION(".rodata.08CE6778")
const struct ClassReelEnt ClassReelEnt_08CE6778 = {
    .name = gUnk_08421968,
    .descMsg = 0xFF2,
    ._pad_08 = { 0, 5 },
    .charPalId = 0x44,
    .jid = 0x2B,
    .animId = 0x4C,
    .terrainL = 0xB,
    .terrainR = 0x12,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6794")
const struct ClassReelEnt ClassReelEnt_08CE6794 = {
    .name = gUnk_08421A7C,
    .descMsg = 0xFF0,
    ._pad_08 = { 0, 7 },
    .charPalId = -1,
    .jid = 9,
    .animId = 9,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE67B0")
const struct ClassReelEnt ClassReelEnt_08CE67B0 = {
    .name = gUnk_08421970,
    .descMsg = 0x1010,
    ._pad_08 = { 0, 5 },
    .charPalId = 0x33,
    .jid = 0x16,
    .animId = 0x54,
    .terrainL = 2,
    .terrainR = 2,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE67CC")
const struct ClassReelEnt ClassReelEnt_08CE67CC = {
    .name = gUnk_084219D4,
    .descMsg = 0x100A,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x65,
    .jid = 0x11,
    .animId = 0x38,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE67E8")
const struct ClassReelEnt ClassReelEnt_08CE67E8 = {
    .name = gUnk_084218E0,
    .descMsg = 0xFF1,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x62,
    .jid = 0x28,
    .animId = 0x3A,
    .terrainL = 0x11,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6804")
const struct ClassReelEnt ClassReelEnt_08CE6804 = {
    .name = gUnk_084218EC,
    .descMsg = 0x1003,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x2B,
    .jid = 0x32,
    .animId = 0x80,
    .terrainL = 0x19,
    .terrainR = 0x19,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6820")
const struct ClassReelEnt ClassReelEnt_08CE6820 = {
    .name = gUnk_08421A3C,
    .descMsg = 0x100E,
    ._pad_08 = { 0, 4 },
    .charPalId = 0x43,
    .jid = 0x30,
    .animId = 0x75,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE683C")
const struct ClassReelEnt ClassReelEnt_08CE683C = {
    .name = gUnk_084219D4,
    .descMsg = 0x100A,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x68,
    .jid = 0x10,
    .animId = 0x36,
    .script = gUnk_08CE6140,
};

SECTION(".rodata.08CE6858")
const struct ClassReelEnt ClassReelEnt_08CE6858 = {
    .name = gUnk_084219CC,
    .descMsg = 0x1005,
    ._pad_08 = { 6, 2 },
    .charPalId = 0x1E,
    .jid = 0xC,
    .animId = 0x8F,
    .terrainL = 0x17,
    .terrainR = 0x17,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE6874")
const struct ClassReelEnt ClassReelEnt_08CE6874 = {
    .name = gUnk_08421A30,
    .descMsg = 0x1008,
    ._pad_08 = { 0, 7 },
    .charPalId = 0x6E,
    .jid = 0x2D,
    .genericPalId = 1,
    .animId = 0x70,
    .magicFx = 3,
    .terrainL = 0x11,
    .script = &gUnk_08CE6184[2],
};

SECTION(".rodata.08CE6890")
const struct ClassReelEnt ClassReelEnt_08CE6890 = {
    .name = gUnk_084219F4,
    .descMsg = 0x100D,
    ._pad_08 = { 5, 2 },
    .charPalId = 0x17,
    .jid = 0x1E,
    .animId = 0x64,
    .magicFx = 4,
    .terrainL = 0x14,
    .terrainR = 0x14,
    .script = &gUnk_08CE6178[2],
};

SECTION(".rodata.08CE68AC")
const struct ClassReelEnt ClassReelEnt_08CE68AC = {
    .name = gUnk_084219EC,
    .descMsg = 0x1006,
    ._pad_08 = { 0, 5 },
    .charPalId = 0x70,
    .jid = 0x13,
    .animId = 0x22,
    .terrainL = 0x13,
    .terrainR = 0x13,
    .script = gUnk_08CE6114,
};

SECTION(".rodata.08CE68C8")
const struct ClassReelEnt ClassReelEnt_08CE68C8 = {
    .name = gUnk_08421A88,
    .descMsg = 0x1018,
    ._pad_08 = { 0, 3 },
    .charPalId = -1,
    .jid = 0x59,
    .animId = 0xA1,
    .terrainL = 0x11,
    .script = gUnk_08CE6114,
};

extern struct ClassReelEnt const * const ClassReelEntList_08CE68E4[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE6900[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE691C[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE6938[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE6954[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE6970[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE698C[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE69A8[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE69C4[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE69E0[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE69FC[];
extern struct ClassReelEnt const * const ClassReelEntList_08CE6A18[];

SECTION(".rodata.08CE68E4")
struct ClassReelEnt const * const ClassReelEntList_08CE68E4[] = {
    &ClassReelEnt_08CE61AC,
    &ClassReelEnt_08CE61C8,
    &ClassReelEnt_08CE61E4,
    &ClassReelEnt_08CE6200,
    &ClassReelEnt_08CE621C,
    &ClassReelEnt_08CE6238,
    NULL,
};

SECTION(".rodata.08CE6900")
struct ClassReelEnt const * const ClassReelEntList_08CE6900[] = {
    &ClassReelEnt_08CE6254,
    &ClassReelEnt_08CE6270,
    &ClassReelEnt_08CE628C,
    &ClassReelEnt_08CE62A8,
    &ClassReelEnt_08CE62C4,
    &ClassReelEnt_08CE62E0,
    NULL,
};

SECTION(".rodata.08CE691C")
struct ClassReelEnt const * const ClassReelEntList_08CE691C[] = {
    &ClassReelEnt_08CE62FC,
    &ClassReelEnt_08CE6318,
    &ClassReelEnt_08CE6334,
    &ClassReelEnt_08CE6350,
    &ClassReelEnt_08CE636C,
    &ClassReelEnt_08CE6388,
    NULL,
};

SECTION(".rodata.08CE6938")
struct ClassReelEnt const * const ClassReelEntList_08CE6938[] = {
    &ClassReelEnt_08CE63A4,
    &ClassReelEnt_08CE63C0,
    &ClassReelEnt_08CE63DC,
    &ClassReelEnt_08CE63F8,
    &ClassReelEnt_08CE6414,
    &ClassReelEnt_08CE6430,
    NULL,
};

SECTION(".rodata.08CE6954")
struct ClassReelEnt const * const ClassReelEntList_08CE6954[] = {
    &ClassReelEnt_08CE644C,
    &ClassReelEnt_08CE6468,
    &ClassReelEnt_08CE6484,
    &ClassReelEnt_08CE64A0,
    &ClassReelEnt_08CE64BC,
    &ClassReelEnt_08CE64D8,
    NULL,
};

SECTION(".rodata.08CE6970")
struct ClassReelEnt const * const ClassReelEntList_08CE6970[] = {
    &ClassReelEnt_08CE64F4,
    &ClassReelEnt_08CE6510,
    &ClassReelEnt_08CE652C,
    &ClassReelEnt_08CE6548,
    &ClassReelEnt_08CE6564,
    &ClassReelEnt_08CE6580,
    NULL,
};

SECTION(".rodata.08CE698C")
struct ClassReelEnt const * const ClassReelEntList_08CE698C[] = {
    &ClassReelEnt_08CE659C,
    &ClassReelEnt_08CE65B8,
    &ClassReelEnt_08CE65D4,
    &ClassReelEnt_08CE65F0,
    &ClassReelEnt_08CE660C,
    &ClassReelEnt_08CE6628,
    NULL,
};

SECTION(".rodata.08CE69A8")
struct ClassReelEnt const * const ClassReelEntList_08CE69A8[] = {
    &ClassReelEnt_08CE6644,
    &ClassReelEnt_08CE6660,
    &ClassReelEnt_08CE667C,
    &ClassReelEnt_08CE6698,
    &ClassReelEnt_08CE66B4,
    &ClassReelEnt_08CE66D0,
    NULL,
};

SECTION(".rodata.08CE69C4")
struct ClassReelEnt const * const ClassReelEntList_08CE69C4[] = {
    &ClassReelEnt_08CE66EC,
    &ClassReelEnt_08CE6708,
    &ClassReelEnt_08CE6740,
    &ClassReelEnt_08CE675C,
    &ClassReelEnt_08CE6804,
    &ClassReelEnt_08CE68C8,
    NULL,
};

SECTION(".rodata.08CE69E0")
struct ClassReelEnt const * const ClassReelEntList_08CE69E0[] = {
    &ClassReelEnt_08CE6794,
    &ClassReelEnt_08CE6724,
    &ClassReelEnt_08CE67B0,
    &ClassReelEnt_08CE67CC,
    &ClassReelEnt_08CE6778,
    &ClassReelEnt_08CE67E8,
    NULL,
};

SECTION(".rodata.08CE69FC")
struct ClassReelEnt const * const ClassReelEntList_08CE69FC[] = {
    &ClassReelEnt_08CE6820,
    &ClassReelEnt_08CE683C,
    &ClassReelEnt_08CE6858,
    &ClassReelEnt_08CE6874,
    &ClassReelEnt_08CE6890,
    &ClassReelEnt_08CE68AC,
    NULL,
};

SECTION(".rodata.08CE6A18")
struct ClassReelEnt const * const ClassReelEntList_08CE6A18[] = {
    &ClassReelEnt_08CE61AC,
    &ClassReelEnt_08CE61C8,
    &ClassReelEnt_08CE6200,
    &ClassReelEnt_08CE62E0,
    &ClassReelEnt_08CE62C4,
    &ClassReelEnt_08CE6238,
    &ClassReelEnt_08CE6270,
    &ClassReelEnt_08CE6318,
    &ClassReelEnt_08CE621C,
    &ClassReelEnt_08CE63DC,
    &ClassReelEnt_08CE63C0,
    &ClassReelEnt_08CE6254,
    &ClassReelEnt_08CE628C,
    &ClassReelEnt_08CE62FC,
    &ClassReelEnt_08CE63F8,
    &ClassReelEnt_08CE6350,
    &ClassReelEnt_08CE62A8,
    &ClassReelEnt_08CE6414,
    &ClassReelEnt_08CE61E4,
    &ClassReelEnt_08CE6430,
    &ClassReelEnt_08CE64A0,
    NULL,
};

extern struct ClassReelEnt const * const * const ClassReelSet_08CE6A70[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6A78[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6A84[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6A94[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6AA8[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6AC0[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6ADC[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6AFC[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6B20[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6B48[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6B74[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6BA4[];
extern struct ClassReelEnt const * const * const ClassReelSet_08CE6BD4[];

SECTION(".rodata.08CE6A70")
struct ClassReelEnt const * const * const ClassReelSet_08CE6A70[] = {
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6A78")
struct ClassReelEnt const * const * const ClassReelSet_08CE6A78[] = {
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6A84")
struct ClassReelEnt const * const * const ClassReelSet_08CE6A84[] = {
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6A94")
struct ClassReelEnt const * const * const ClassReelSet_08CE6A94[] = {
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6AA8")
struct ClassReelEnt const * const * const ClassReelSet_08CE6AA8[] = {
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6AC0")
struct ClassReelEnt const * const * const ClassReelSet_08CE6AC0[] = {
    ClassReelEntList_08CE6970,
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6ADC")
struct ClassReelEnt const * const * const ClassReelSet_08CE6ADC[] = {
    ClassReelEntList_08CE698C,
    ClassReelEntList_08CE6970,
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6AFC")
struct ClassReelEnt const * const * const ClassReelSet_08CE6AFC[] = {
    ClassReelEntList_08CE69A8,
    ClassReelEntList_08CE698C,
    ClassReelEntList_08CE6970,
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6B20")
struct ClassReelEnt const * const * const ClassReelSet_08CE6B20[] = {
    ClassReelEntList_08CE69C4,
    ClassReelEntList_08CE69A8,
    ClassReelEntList_08CE698C,
    ClassReelEntList_08CE6970,
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6B48")
struct ClassReelEnt const * const * const ClassReelSet_08CE6B48[] = {
    ClassReelEntList_08CE69E0,
    ClassReelEntList_08CE69C4,
    ClassReelEntList_08CE69A8,
    ClassReelEntList_08CE698C,
    ClassReelEntList_08CE6970,
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6B74")
struct ClassReelEnt const * const * const ClassReelSet_08CE6B74[] = {
    ClassReelEntList_08CE69FC,
    ClassReelEntList_08CE69E0,
    ClassReelEntList_08CE69C4,
    ClassReelEntList_08CE69A8,
    ClassReelEntList_08CE698C,
    ClassReelEntList_08CE6970,
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE68E4,
    NULL,
};

SECTION(".rodata.08CE6BA4")
struct ClassReelEnt const * const * const ClassReelSet_08CE6BA4[] = {
    ClassReelEntList_08CE68E4,
    ClassReelEntList_08CE6900,
    ClassReelEntList_08CE691C,
    ClassReelEntList_08CE6938,
    ClassReelEntList_08CE6954,
    ClassReelEntList_08CE6970,
    ClassReelEntList_08CE698C,
    ClassReelEntList_08CE69A8,
    ClassReelEntList_08CE69C4,
    ClassReelEntList_08CE69E0,
    ClassReelEntList_08CE69FC,
    NULL,
};

SECTION(".rodata.08CE6BD4")
struct ClassReelEnt const * const * const ClassReelSet_08CE6BD4[] = {
    ClassReelEntList_08CE6A18,
    NULL,
};

SECTION(".rodata.08CE6BDC")
struct ClassReelEnt const * const * const * const gClassReelSetLut[] = {
    ClassReelSet_08CE6A70,
    ClassReelSet_08CE6A78,
    ClassReelSet_08CE6A84,
    ClassReelSet_08CE6A94,
    ClassReelSet_08CE6AA8,
    ClassReelSet_08CE6AC0,
    ClassReelSet_08CE6ADC,
    ClassReelSet_08CE6AFC,
    ClassReelSet_08CE6B20,
    ClassReelSet_08CE6B48,
    ClassReelSet_08CE6B74,
    ClassReelSet_08CE6BA4,
    ClassReelSet_08CE6BD4,
};
