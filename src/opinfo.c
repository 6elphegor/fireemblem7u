#include "gbafe.h"

// FE8U: opinfo.c (class reel; ClassReel_* is in lord-select.c)

struct ClassReelEnt {
    /* 00 */ char const * name;
    /* 04 */ u8 _pad_04[0x0B - 0x04];
    /* 0B */ u8 jid;
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
extern struct ClassReelEnt * const * const * CONST_DATA gClassReelSetLut[];
extern struct ProcCmd CONST_DATA ProcScr_ClassInfoDisplay[];
extern struct ProcCmd CONST_DATA ProcScr_ClassStatsDisplay[];
extern u8 Img_ClassDisplayFont[];
extern u16 Pal_ClassDisplayFont[];

ProcPtr StartClassStatsDisplay(ProcPtr parent);
void SetClassStatsDisplayX(struct OpInfoGaugeDrawProc * proc, int x);

static inline int DarknessCoeff(int darkness, u8 lsr)
{
    return 0x10 - (darkness >> (lsr));
}

extern ProcPtr gClassIntroLetterProcs[];

extern struct ProcCmd CONST_DATA ProcScr_ClassIntro[];
extern struct ProcCmd CONST_DATA ProcScr_ClassIntroLetter[];
extern struct ProcCmd CONST_DATA ProcScr_ClassIntroIcon[];
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

ASM_FUNC("asm/nonmatching/code_080AEFA8.s");

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

ProcPtr StartClassNameIntro(ProcPtr parent, int ent)
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

ASM_FUNC("asm/nonmatching/code_080AF368.s");
void ClassIntroLetter_LoopDisplay(struct OpInfoViewProc * proc)
{
    PutClassIntroLetter(proc->tile, proc->index, proc->x, 0x18, 0x100, 0x100, 0);
    proc->timer = 0;
}

ASM_FUNC("asm/nonmatching/code_080AF4D4.s");
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

ASM_FUNC("asm/nonmatching/code_080AF69C.s");

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

ASM_FUNC("asm/nonmatching/code_080AF99C.s");
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

ProcPtr StartClassAnimDisplay(ProcPtr parent, int ent)
{
    struct OpInfoClassDisplayProc * proc = Proc_Start(ProcScr_ClassInfoDisplay, parent);

    proc->parent = parent;
    proc->ent = (struct ClassReelEnt *) ent;
    proc->statsProc = NULL;

    return proc;
}

ASM_FUNC("asm/nonmatching/code_080B00A8.s");

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

int GetClassReelEntry(int set, int index)
{
    struct ClassReelEnt * const * const * list = gClassReelSetLut[set];
    struct ClassReelEnt * const * it;

    for (it = *list; *list != NULL;)
    {
        if (index == 0)
            return (int) *it;

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

