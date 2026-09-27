#include "gbafe.h"

struct HelpBoxScrollProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char * string;
    /* 30 */ struct Font * font;
    /* 34 */ struct Text * texts[9];

    /* 58 */ int unk_58;
    /* 5C */ s16 pretext_lines;
    /* 5E */ s16 step;
    /* 60 */ u16 speed;
    /* 62 */ s16 chars_per_step;
    /* 64 */ s16 unk_64;
};

struct ProcHelpBoxIntro {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ int item;
    /* 5C */ int msg;
    /* 60 */ int unk_60;
    /* 64 */ s16 pretext_lines;
};

struct ProcBoxDialogue {
    /* 00 */ PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ int msg;

    /* 38 */ u8 unk_38;

    /* 3C */ u16 * unk_3c;
    /* 40 */ u8 pad_idx;
};

struct ProcBoxDialogueDrawTextExt {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char * str;
    /* 30 */ struct Font * unk_30;
    /* 34 */ struct Text * texts[5];

    /* 48 */ s16 current_line;
    /* 4A */ s16 unk_4a;
    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
    /* 50 */ u8 unk_50;
    /* 51 */ u8 unk_51;
    /* 52 */ u8 x_offset;
    /* 53 */ u8 unk_53;
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ u8 unk_56;
    /* 57 */ u8 unk_57;
    /* 58 */ u8 timer;
    /* 59 */ u8 unk_59;
};

struct HelpBox8A01800Proc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;

    /* 34 */ STRUCT_PAD(0x34, 0x5C);

    /* 5C */ int unk_5c;
};

struct HelpBoxSt {
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[3];
    /* 30 */ u16 oam2_base;
};

struct BoxDialogueConf {
    /* 00 */ struct Font font;
    /* 18 */ struct Text texts[5];
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
};

extern struct HelpBoxSt gHelpBoxSt;
extern struct HelpBoxInfo gTmpHelpBoxInfo;
extern struct HelpBoxInfo const * gpHelpBoxCurrentInfo;
extern struct BoxDialogueConf gBoxDialogueConf;

extern u8 CONST_DATA gGfx_HelpTextBox[];
extern u8 CONST_DATA gGfx_HelpTextBox2[];
extern u16 CONST_DATA Pal_HelpBox[];
extern u8 CONST_DATA gGfx_YellowTextBox[];
extern u16 CONST_DATA gPal_HelpTextBox[];
extern u16 CONST_DATA gPal_YellowTextBox[];
extern int CONST_DATA gUnknown_08A016D8[];

extern struct ProcCmd CONST_DATA gProcScr_HelpBoxTextScroll[];
extern struct ProcCmd CONST_DATA ProcScr_HelpBoxIntro[];
extern struct ProcCmd CONST_DATA ProcScr_Helpbox_bug_08A01678[];
extern struct ProcCmd CONST_DATA gUnknown_08A01698[];
extern struct ProcCmd CONST_DATA gUnknown_08A016C8[];
extern struct ProcCmd CONST_DATA gProcScr_BoxDialogue[];
extern struct ProcCmd CONST_DATA ProcScr_MergeBoxDialogue[];
extern struct ProcCmd CONST_DATA ProcScr_BoxDialogueDrawTextExt[];
extern struct ProcCmd CONST_DATA gUnknown_08A01800[];
extern struct ProcCmd CONST_DATA ProcScr_TalkBoxIdle[];

void sub_08082E80(struct HelpBoxInfo const * info);
void sub_08082F50(void);
void sub_08082FD8(struct HelpBoxInfo const * info);
void sub_08083008(struct HelpBoxProc * proc, int w, int h);
void sub_08083048(struct HelpBoxProc * proc, int x, int y);
void sub_080830C0(struct HelpBoxProc * proc, int x, int y);
void SetHelpBoxDefaultRect(struct HelpBoxProc * proc);
int sub_080830D8(int item);
u16 GetDialogueBoxConfig(void);
void InitBoxDialogue(void * vram_dst, int pal);
void DrawBoxDialogueText(int x, int y, int msg);
void EndMergeBoxDialogue(void);
void sub_080838FC(int x, int y, int width, int height);
void sub_080845C8(int msg, int x, int y);
void sub_0808460C(void);
void GetBoxDialogueSize(const char * str, int * wOut, int * hOut);

void LoadHelpBoxGfx(void * vram, int palId)
{
    if (vram == NULL)
        vram = (void *)0x06013000;

    if (palId < 0)
        palId = 5;

    palId = (palId & 0xF) + 0x10;

    Decompress(gGfx_HelpTextBox, vram);
    Decompress(gGfx_HelpTextBox2, vram + 0x800);

    InitSpriteTextFont(&gHelpBoxSt.font, vram, palId);

    InitSpriteText(&gHelpBoxSt.text[0]);
    InitSpriteText(&gHelpBoxSt.text[1]);
    InitSpriteText(&gHelpBoxSt.text[2]);

    SetTextFont(NULL);

    ApplyPalette(Pal_HelpBox, palId);

    gHelpBoxSt.oam2_base = (((u32)vram << 0x11) >> 0x16) + (palId & 0xF) * 0x1000;
}

void sub_080825B4(void * vram, int palId)
{
    if (vram == NULL)
        vram = (void *)0x06013000;

    if (palId < 0)
        palId = 5;

    palId = (palId & 0xF) + 0x10;

    Decompress(gGfx_HelpTextBox, vram);
    Decompress(gGfx_HelpTextBox2, vram + 0x800);

    InitSpriteTextFont(&gHelpBoxSt.font, vram, palId);

    InitSpriteText(&gHelpBoxSt.text[0]);
    InitSpriteText(&gHelpBoxSt.text[1]);

    gHelpBoxSt.text[2].tile_width = 0;

    SetTextFont(NULL);

    ApplyPalette(Pal_HelpBox, palId);

    gHelpBoxSt.oam2_base = (((u32)vram << 0x11) >> 0x16) + (palId & 0xF) * 0x1000;
}

ASM_FUNC("asm/nonmatching/code_0808263C.s");

int DrawHelpBoxWeaponLabels(int item)
{
    Text_InsertDrawString(&gHelpBoxSt.text[0], 0, 8, GetItemKindString(GetItemType(item)));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 48, 8, DecodeMsg(0x110C));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 108, 8, DecodeMsg(0x110E));

    Text_InsertDrawString(&gHelpBoxSt.text[1], 0, 8, DecodeMsg(0x110F));
    Text_InsertDrawString(&gHelpBoxSt.text[1], 48, 8, DecodeMsg(0x1104));
    Text_InsertDrawString(&gHelpBoxSt.text[1], 108, 8, DecodeMsg(0x110D));

    return 2;
}

void DrawHelpBoxWeaponStats(int item)
{
    Text_InsertDrawString(&gHelpBoxSt.text[0], 32, 7, GetWeaponLevelStringFromExp(item));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 68, 7, GetItemRangeString(item));
    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[0], 140, 7, GetItemWeight(item));

    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[1], 32, 7, GetItemMight(item));
    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[1], 80, 7, GetItemHit(item));
    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[1], 140, 7, GetItemCrit(item));
}

int DrawHelpBoxStaffLabels(int item)
{
    Text_InsertDrawString(&gHelpBoxSt.text[0], 0, 8, DecodeMsg(0x1115));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 32, 7, GetWeaponLevelStringFromExp(item));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 48, 8, DecodeMsg(0x110C));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 68, 7, GetItemRangeString(item));
    return 1;
}

void DrawHelpBoxSaveMenuLabels(void)
{
    if (gPlaySt.tact_enabled)
    {
        Text_InsertDrawString(&gHelpBoxSt.text[0], 0, 8, DecodeMsg(0x1100));
        Text_InsertDrawString(&gHelpBoxSt.text[0], 56, 8, DecodeMsg(0x12AF));
        Text_InsertDrawString(&gHelpBoxSt.text[0], 112, 8, DecodeMsg(0x10F2));
    }
    else
    {
        Text_InsertDrawString(&gHelpBoxSt.text[0], 16, 7, DecodeMsg(0x1290));
    }
}

void DrawHelpBoxSaveMenuStats(void)
{
    if (gPlaySt.tact_enabled)
    {
        char * name = GetTacticianName();

        if (*name == 0)
        {
            Text_InsertDrawString(&gHelpBoxSt.text[0], 20, 7, DecodeMsg(0x127C));
            Text_InsertDrawString(&gHelpBoxSt.text[0], 80, 7, DecodeMsg(0x127C));
            Text_InsertDrawString(&gHelpBoxSt.text[0], 140, 7, DecodeMsg(0x127E));
        }
        else
        {
            Text_InsertDrawString(&gHelpBoxSt.text[0], 16, 7, DecodeMsg(sub_080A6DD0(TacticianBirthAffins[gPlaySt.tact_birth])));
            Text_InsertDrawString(&gHelpBoxSt.text[0], 76, 7, DecodeMsg(sub_080A6DC0(gPlaySt.tact_gender)));
            Text_InsertDrawString(&gHelpBoxSt.text[0], 138, 7, name);
        }
    }
}

void HelpBoxTextScroll_OnLoop(struct HelpBoxScrollProc * proc)
{
    int i;

    proc->step--;

    if (proc->step > 0)
        return;

    proc->step = proc->speed;

    SetTextFont(proc->font);

    for (i = 0; i < proc->chars_per_step; i++)
    {
        switch (*proc->string)
        {
        case 0:
            Proc_Break(proc);
            goto end;

        case 1:
            proc->string++;
            proc->pretext_lines++;
            continue;

        case 4:
            proc->string++;
            continue;

        default:
            proc->string = Text_DrawCharacter(proc->texts[proc->pretext_lines], proc->string);
            continue;
        }
    }

end:
    SetTextFont(NULL);
}

void HelpBoxDrawOneLineExt(struct HelpBoxScrollProc * proc)
{
    int i;

    SetTextFont(proc->font);

    for (i = 0; i < 6; i++)
    {
        struct Text * th;
    next_line:
        th = proc->texts[i];

        Text_SetCursor(th, GetStringTextCenteredPos(th->tile_width * 8, proc->string));

        while (1)
        {
            switch (*proc->string)
            {
            case 0:
                goto end;

            case 1:
                proc->string++;

                i++;
                if (i < 6)
                    goto next_line;
                else
                    goto end;

            case 5:
            case 4:
                proc->string++;
                continue;

            default:
                proc->string = Text_DrawCharacter(th, proc->string);
                continue;
            }
        }
    }

end:
    SetTextFont(proc->font);
}

void HelpBoxSetupstringLines(struct ProcHelpBoxIntro * proc)
{
    int item = proc->item;

    SetTextFont(&gHelpBoxSt.font);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    switch (GetHelpBoxItemInfoKind(item))
    {
    case HELPBOX_INFO_NONE:
        proc->pretext_lines = 0;
        break;

    case HELPBOX_INFO_WEAPON:
        DrawHelpBoxWeaponLabels(item);
        proc->pretext_lines = 2;
        break;

    case HELPBOX_INFO_STAFF:
        DrawHelpBoxStaffLabels(item);
        proc->pretext_lines = 1;
        break;

    case HELPBOX_INFO_SAVE_MENU:
        DrawHelpBoxSaveMenuLabels();
        proc->pretext_lines = 1;
        break;
    }

    SetTextFont(NULL);

    Proc_Break(proc);
}

void HelpBoxDrawstring(struct ProcHelpBoxIntro * proc)
{
    int item = proc->item;

    SetTextFont(&gHelpBoxSt.font);

    switch (GetHelpBoxItemInfoKind(item))
    {
    case HELPBOX_INFO_WEAPON:
        DrawHelpBoxWeaponStats(item);
        break;

    case HELPBOX_INFO_SAVE_MENU:
        DrawHelpBoxSaveMenuStats();
        break;
    }

    SetTextFont(NULL);

    Proc_Break(proc);
}

void HelpBoxIntroDrawTexts(struct ProcHelpBoxIntro * proc)
{
    struct HelpBoxScrollProc * otherProc;
    int textSpeed;

    SetTextFont(&gHelpBoxSt.font);

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    Text_SetColor(&gHelpBoxSt.text[0], 6);
    Text_SetColor(&gHelpBoxSt.text[1], 6);
    Text_SetColor(&gHelpBoxSt.text[2], 6);

    SetTextFont(NULL);

    Proc_EndEach(gProcScr_HelpBoxTextScroll);

    otherProc = Proc_Start(gProcScr_HelpBoxTextScroll, PROC_TREE_3);
    otherProc->font = &gHelpBoxSt.font;

    otherProc->texts[0] = &gHelpBoxSt.text[0];
    otherProc->texts[1] = &gHelpBoxSt.text[1];
    otherProc->texts[2] = &gHelpBoxSt.text[2];

    otherProc->pretext_lines = proc->pretext_lines;

    DecodeMsg(proc->msg);

    otherProc->string = MsgExpand();
    otherProc->chars_per_step = 1;
    otherProc->step = 0;

    textSpeed = gPlaySt.cfgTextSpeed;
    switch (textSpeed)
    {
    case 0:
        otherProc->speed = 2;
        break;

    case 1:
        otherProc->speed = textSpeed;
        break;

    case 2:
        otherProc->speed = 1;
        otherProc->chars_per_step = textSpeed;
        break;

    case 3:
        otherProc->speed = 0;
        otherProc->chars_per_step = 0x7F;
        break;
    }
}

void StartHelpBoxTextInit(int item, int msg)
{
    struct ProcHelpBoxIntro * proc = Proc_Start(ProcScr_HelpBoxIntro, PROC_TREE_3);

    proc->item = item;
    proc->msg = msg;
}

void ClearHelpBoxText(void)
{
    SetTextFont(&gHelpBoxSt.font);

    SpriteText_DrawBackground(&gHelpBoxSt.text[0]);
    SpriteText_DrawBackground(&gHelpBoxSt.text[1]);
    SpriteText_DrawBackground(&gHelpBoxSt.text[2]);

    Proc_EndEach(gProcScr_HelpBoxTextScroll);
    Proc_EndEach(ProcScr_HelpBoxIntro);

    SetTextFont(NULL);
}

void sub_08082DE0(struct HelpBoxProc * proc)
{
    UpdateHelpBoxDisplay(proc, 5);

    if (proc->timer < proc->timer_end)
        proc->timer++;
}

void sub_08082E08(struct HelpBoxProc * proc)
{
    int time;

    SetHelpBoxDefaultRect(proc);

    sub_080830C0(proc, proc->info->x, proc->info->y);

    time = proc->timer_end;
    time = time / 3;

    proc->timer_end = time;
    proc->timer = time;
}

void sub_08082E38(struct HelpBoxProc * proc)
{
    UpdateHelpBoxDisplay(proc, 0);

    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void sub_08082E60(int x, int y, int msg)
{
    gTmpHelpBoxInfo.x = x;
    gTmpHelpBoxInfo.y = y;
    gTmpHelpBoxInfo.msg = msg;
    gTmpHelpBoxInfo.redirect = NULL;
    gTmpHelpBoxInfo.populate = NULL;

    sub_08082FD8(&gTmpHelpBoxInfo);
}

void sub_08082E80(struct HelpBoxInfo const * info)
{
    int wTextBox;
    int hTextBox;

    struct HelpBoxProc * proc = Proc_Find(ProcScr_Helpbox_bug_08A01678);

    if (!proc)
    {
        proc = Proc_Start(ProcScr_Helpbox_bug_08A01678, PROC_TREE_3);

        PlaySoundEffect(0x390);

        sub_080830C0(proc, info->x, info->y);

        SetHelpBoxDefaultRect(proc);
    }
    else
    {
        proc->x_box_init = proc->x_box;
        proc->y_box_init = proc->y_box;
        proc->w_box_init = proc->w_box_fini;
        proc->h_box_init = proc->h_box_fini;
    }

    proc->info = info;
    proc->timer = 0;
    proc->timer_end = 12;

    proc->msg = info->msg;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);
    GetStringTextBox(DecodeMsg(proc->msg), &wTextBox, &hTextBox);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    sub_08083008(proc, wTextBox, hTextBox);
    sub_08083048(proc, info->x, info->y);

    ClearHelpBoxText();
    StartHelpBoxTextInit(proc->item, proc->msg);

    gpHelpBoxCurrentInfo = info;
}

void sub_08082F50(void)
{
    PlaySoundEffect(0x391);

    ClearHelpBoxText();

    Proc_BreakEach(ProcScr_Helpbox_bug_08A01678);
}

void sub_08082F80(struct HelpBoxProc * proc)
{
    proc->move_key_bit = 0;

    if (proc->info->redirect)
        proc->info->redirect(proc);

    sub_08082E80(proc->info);
}

void sub_08082FA4(struct HelpBoxProc * proc)
{
    if (gpKeySt->pressed & A_BUTTON)
        Proc_Break(proc);
}

void sub_08082FC4(struct HelpBoxProc * proc)
{
    sub_08082F50();
    Proc_End(proc);
}

void sub_08082FD8(struct HelpBoxInfo const * info)
{
    struct HelpBoxProc * proc = Proc_Start(gUnknown_08A01698, PROC_TREE_3);

    proc->info = info;
}

s8 sub_08082FF0(void)
{
    return Proc_Find(gUnknown_08A01698) ? 1 : 0;
}

void sub_08083008(struct HelpBoxProc * proc, int w, int h)
{
    w = (w + 0x1F) & 0xE0;

    switch (sub_080830D8(proc->item))
    {
    case 1:
        w = 0xA0;
        h = h + 0x20;
        break;

    case 2:
        if (w < 0x60)
            w = 0x60;

        h = h + 0x10;
        break;
    }

    proc->w_box_fini = w;
    proc->h_box_fini = h;
}

void sub_08083048(struct HelpBoxProc * proc, int x, int y)
{
    int xSpan = proc->w_box_fini + 0x10;
    int ySpan = proc->h_box_fini + 0x10;

    proc->x_box_fini = x - 0x10 - xSpan / 6;

    if (proc->x_box_fini < 0)
        proc->x_box_fini = 0;

    if (proc->x_box_fini + xSpan > 0xF0)
        proc->x_box_fini = 0xF0 - xSpan;

    proc->y_box_fini = y + 0x10;

    if (proc->y_box_fini + ySpan > 0xA0)
        proc->y_box_fini = y - ySpan;

    proc->x_box_fini += 8;
    proc->y_box_fini += 8;
}

void sub_080830C0(struct HelpBoxProc * proc, int x, int y)
{
    proc->x_box_init = x;
    proc->y_box_init = y;
}

void SetHelpBoxDefaultRect(struct HelpBoxProc * proc)
{
    proc->w_box_init = 0x20;
    proc->h_box_init = 0x10;
}

int sub_080830D8(int item)
{
    if (item == (u16)-1)
        return 3;

    if (GetItemAttributes(item) & IA_LOCK_3)
        return 0;

    if (GetItemAttributes(item) & IA_WEAPON)
        return 1;

    if (GetItemAttributes(item) & IA_STAFF)
        return 2;

    return 0;
}

void sub_08083128(ProcPtr proc)
{
    if (gpKeySt->pressed & A_BUTTON)
        Proc_Break(proc);
}

s8 sub_08083148(int msg, ProcPtr parent)
{
    LoadHelpBoxGfx(NULL, -1);

    sub_08082E60(GetUiHandPrevX(), GetUiHandPrevY(), msg);

    Proc_StartBlocking(gUnknown_08A016C8, parent);

    return 1;
}

s8 BoxTalkActive(void)
{
    if (Proc_Find(gProcScr_BoxDialogue))
        return 1;

    return 0;
}

void SetDialogueBoxConfig(int config)
{
    gBoxDialogueConf.unk_42 = config;
}

u16 GetDialogueBoxConfig(void)
{
    return gBoxDialogueConf.unk_42;
}

void sub_080831B4(int a, int b)
{
    int * ptr, * r4;
    int i, j, k;

    ptr = (int *)((((0x3FF & gBoxDialogueConf.unk_40) + gBoxDialogueConf.texts[0].chr_position) * 0x20) + 0x06010000);

    for (i = 0; i < b * 2; i++)
    {
        r4 = ptr;
        for (j = 0; j < a; j++)
        {
            for (k = 0; k <= 6; k++)
            {
                r4[0] = r4[1];
                ++r4;
            }

            if (i == (b * 2 - 1))
            {
                if ((GetDialogueBoxConfig() & 1) == 0)
                    *r4++ = 0x44444444;
                else
                    *r4++ = 0;
            }
            else
            {
                *r4++ = *(ptr + ((j + 0x20) << 3));
            }
        }

        ptr = ptr + 0x100;
    }
}

void InitBoxDialogue(void * vram_dst, int pal)
{
    int i;

    if (vram_dst == NULL)
        vram_dst = (void *)0x06013000;

    if (pal < 0)
        pal = 5;

    pal = (pal & 0xF) + 0x10;

    if (GetDialogueBoxConfig() & 0x10)
        Decompress(gGfx_YellowTextBox, vram_dst);
    else
        Decompress(gGfx_HelpTextBox, vram_dst);

    ClearAllTalkFlags();

    if (!(GetDialogueBoxConfig() & 1))
    {
        InitSpriteTextFont(&gBoxDialogueConf.font, vram_dst, pal);

        InitSpriteText(&gBoxDialogueConf.texts[0]);
        InitSpriteText(&gBoxDialogueConf.texts[1]);
        InitSpriteText(&gBoxDialogueConf.texts[2]);

        if ((GetDialogueBoxConfig() & 0x10) && !(GetDialogueBoxConfig() & 0x20))
        {
            InitSpriteText(&gBoxDialogueConf.texts[3]);
            InitSpriteText(&gBoxDialogueConf.texts[4]);
        }

        SetTextFont(NULL);

        if (GetDialogueBoxConfig() & 0x10)
            ApplyPalette(gPal_YellowTextBox, pal);
        else
            ApplyPalette(gPal_HelpTextBox, pal);
    }
    else
    {
        InitSpriteTextFont(&gBoxDialogueConf.font, vram_dst, pal);

        for (i = 0; i < ((u16)GetDialogueBoxConfig() >> 8); i++)
            InitSpriteText(&gBoxDialogueConf.texts[i]);

        SetTextFont(NULL);

        ApplyPalette(Pal_Text, pal);
    }

    if (&vram_dst)
        gBoxDialogueConf.unk_40 = (((u32)vram_dst << 0x11) >> 0x16) + (pal & 0xF) * 0x1000;

    if (GetDialogueBoxConfig() & 0x10)
        PlaySoundEffect(0x2E6);
}

void sub_080833AC(struct HelpBoxProc * proc, int x, int y)
{
    int xSpan;
    int ySpan;

    ySpan = proc->h_box_fini + 0x10;

    if (proc->w_box_fini >= 0xC0)
        proc->w_box_fini = 0xC0;

    xSpan = proc->w_box_fini + 0x10;

    if (!(GetDialogueBoxConfig() & 1))
    {
        proc->x_box_fini = x;
        proc->y_box_fini = y + 8;

        if (!(GetDialogueBoxConfig() & 0x40))
        {
            if (proc->x_box_fini + xSpan > 0xF0)
                proc->x_box_fini = 0xF0 - xSpan;

            if (proc->y_box_fini + ySpan > 0xA0)
                proc->y_box_fini = 0xA0 - 8 - ySpan;
        }

        proc->x_box_fini += 8;

        return;
    }

    proc->x_box_fini = x;
    proc->y_box_fini = y;
}

void SetBoxDialogueSize(struct HelpBoxProc * proc, int w, int h)
{
    w &= 0xF8;

    proc->w_box_fini = w;
    proc->h_box_fini = h;
}

void sub_08083444(struct ProcBoxDialogue * proc)
{
    if (proc->pad_idx == (u8)-1)
        InitBoxDialogue(NULL, -1);
    else
        InitBoxDialogue(proc->unk_3c, proc->pad_idx);

    DrawBoxDialogueText(proc->x, proc->y, proc->msg);
}

void sub_08083478(struct ProcBoxDialogue * proc)
{
    if (GetDialogueBoxConfig() & 0x82)
        return;

    if (gpKeySt->pressed & (B_BUTTON | START_BUTTON))
        Proc_Goto(proc, 2);
}

void sub_080834A8(void)
{
    if (GetDialogueBoxConfig() & 0x10)
        PlaySoundEffect(0x2E7);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    EndMergeBoxDialogue();
}

void sub_080834E0(struct HelpBoxProc * proc, int method)
{
    int x = proc->x_box_fini;
    int y = proc->y_box_fini;

    int w = Interpolate(method, proc->w_box_init, proc->w_box_fini, proc->timer, proc->timer_end);
    int h = Interpolate(method, proc->h_box_init, proc->h_box_fini, proc->timer, proc->timer_end);

    proc->x_box = x;
    proc->y_box = y;

    sub_080838FC(x, y, w, h);
}

void MergeBoxDialogue1(struct HelpBoxProc * proc)
{
    sub_080834E0(proc, 5);

    if (proc->timer < proc->timer_end)
        proc->timer++;
}

void MergeBoxDialogue2(struct HelpBoxProc * proc)
{
    ResetHelpBoxInitSize(proc);

    proc->timer_end = proc->timer_end / 3;
    proc->timer = proc->timer_end;
}

void MergeBoxDialogue3(struct HelpBoxProc * proc)
{
    sub_080834E0(proc, 0);

    proc->timer--;

    if (proc->timer < 0)
    {
        Proc_Break(proc);
        Proc_EndEach(ProcScr_TalkBoxIdle);
    }
}

void EndMergeBoxDialogue(void)
{
    sub_0808460C();

    Proc_BreakEach(ProcScr_MergeBoxDialogue);
}

void StartBoxDialogueSimple(int x, int y, int msg, ProcPtr parent)
{
    struct ProcBoxDialogue * proc;

    Proc_EndEach(gProcScr_BoxDialogue);

    SetDialogueBoxConfig(0);

    if (!parent)
        proc = Proc_Start(gProcScr_BoxDialogue, PROC_TREE_3);
    else
        proc = Proc_StartBlocking(gProcScr_BoxDialogue, parent);

    proc->x = x;
    proc->y = y;
    proc->msg = msg;
    proc->pad_idx = 0xFF;
    proc->unk_38 = 1;

    Proc_Start(ProcScr_TalkBoxIdle, PROC_TREE_VSYNC);
}

void StartBoxDialogueExt(int x, int y, int msg, u16 * unkA, int unkB, ProcPtr parent)
{
    struct ProcBoxDialogue * proc;

    Proc_EndEach(gProcScr_BoxDialogue);

    SetDialogueBoxConfig(0);

    if (!parent)
        proc = Proc_Start(gProcScr_BoxDialogue, PROC_TREE_3);
    else
        proc = Proc_StartBlocking(gProcScr_BoxDialogue, parent);

    proc->x = x;
    proc->y = y;
    proc->msg = msg;
    proc->pad_idx = unkB;
    proc->unk_3c = unkA;
    proc->unk_38 = 1;

    Proc_Start(ProcScr_TalkBoxIdle, PROC_TREE_VSYNC);
}

#if NONMATCHING

// registers for w/h/hOut are allocated differently

void GetBoxDialogueSize(const char * str, int * wOut, int * hOut)
{
    int charWidth;
    int h = 16;
    int w = 0;

    *wOut = 0;
    *hOut = 0;

    while (1)
    {
        switch (*str)
        {
        case 0x12:
        case 0x13:
        case 0x14:
            if (*wOut < w)
                *wOut = w;

            if (*hOut < h)
                *hOut = h;

            break;

        case 0x80:
            str += 2;
            continue;

        case 0x01:
            h += 16;

            if (*wOut < w)
                *wOut = w;

            w = 0;
            str++;
            continue;

        case 0x18:
        case 0x19:
            w = 0x40;
            str++;
            continue;

        case 0x04:
        case 0x05:
        case 0x06:
        case 0x07:
            str++;
            continue;

        case 0x02:
            str++;

            if (*hOut < h)
                *hOut = h;

            h = 0;

            if (*wOut < w)
                *wOut = w;

            w = 0;
            continue;

        case 0x03:
            str++;

            if (*hOut < h)
                *hOut = h;

            h = 0;

            if (*wOut < w + 8)
                *wOut = w + 8;

            w = 0;
            continue;

        case 0x00:
            if (*wOut < w)
                *wOut = w;

            if (*hOut < h)
                *hOut = h;

            break;

        default:
            str = GetCharTextLen(str, &charWidth);
            w += charWidth;
            continue;
        }

        break;
    }
}

#else

ASM_FUNC("asm/nonmatching/code_080836D8.s");

#endif

void DialogBoxGetGlyphLen(const char * str, u8 * xOut)
{
    int charWidth;
    u8 a;

    int x = 0;
    const char * it = str;

    *xOut = x;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (TRUE)
    {
        switch (*it)
        {
        case 0x02:
        case 0x04:
        case 0x05:
        case 0x06:
        case 0x07:
        case 0x12:
        case 0x13:
        case 0x14:
            it++;
            continue;

        case 0x01:
        case 0x18:
        case 0x19:
            it++;
            x = 0;
            continue;

        case 0x80:
            it += 2;
            continue;

        default:
            it = GetCharTextLen(it, &charWidth);
            x += charWidth;
            continue;

        case 0x00:
        case 0x03:
            a = x + 2;
            *xOut = a;
            return;
        }
    }
}

void DrawBoxDialogueText(int x, int y, int msg)
{
    struct HelpBoxProc * proc;

    int wInner = 0;
    int hInner = 0;

    Proc_EndEach(ProcScr_MergeBoxDialogue);

    proc = Proc_Start(ProcScr_MergeBoxDialogue, PROC_TREE_3);

    SetHelpBoxInitPosition(proc, x, y);
    ResetHelpBoxInitSize(proc);

    proc->info = NULL;
    proc->timer = 0;

    if (GetDialogueBoxConfig() & 1)
        proc->timer_end = 0;
    else
        proc->timer_end = 12;

    proc->item = 0;

    proc->msg = msg;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    DecodeMsg(proc->msg);

    GetBoxDialogueSize(MsgExpand(), &wInner, &hInner);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    SetBoxDialogueSize(proc, wInner, hInner);

    if ((GetDialogueBoxConfig() & 0x100) != 0)
    {
        x = x + (0xD8 - proc->w_box_fini) / 2;
        y = y + (0x90 - proc->h_box_fini) / 2;
    }

    sub_080833AC(proc, x, y);

    sub_0808460C();

    sub_080845C8(proc->msg, wInner, hInner);
}

ASM_FUNC("asm/nonmatching/code_080838FC.s");

void sub_08083C0C(struct ProcBoxDialogueDrawTextExt * proc)
{
    struct HelpBoxProc * helpBoxProc = Proc_Find(ProcScr_MergeBoxDialogue);

    proc->unk_59 = 0;
    proc->unk_50 = helpBoxProc->x_box - 8;
    proc->unk_51 = helpBoxProc->y_box - 8;

    DialogBoxGetGlyphLen(proc->str, &proc->x_offset);
}

void sub_08083C44(void)
{
    if (GetDialogueBoxConfig() & 4)
        SetFaceDispById(0, GetFaceDispById(0) & ~0x10);
}

void sub_08083C68(void)
{
    if (GetDialogueBoxConfig() & 4)
        SetFaceDispById(0, GetFaceDispById(0) | 0x10);
}

void sub_08083C8C(struct ProcBoxDialogueDrawTextExt * proc)
{
    SpriteText_DrawBackground(&gBoxDialogueConf.texts[0]);
    SpriteText_DrawBackground(&gBoxDialogueConf.texts[1]);
    SpriteText_DrawBackground(&gBoxDialogueConf.texts[2]);

    if (GetDialogueBoxConfig() & 0x10)
    {
        if (!(GetDialogueBoxConfig() & 0x20))
        {
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[3]);
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[4]);
        }
    }

    proc->timer = 0;
    proc->current_line = 0;
}

void BoxDialogueInterpreter_Main(struct ProcBoxDialogueDrawTextExt * proc)
{
    int iVar5;
    int i;

    iVar5 = proc->unk_4e;

    if ((gpKeySt->pressed & (DPAD_ANY | A_BUTTON | B_BUTTON)) && !(GetDialogueBoxConfig() & 8))
    {
        iVar5 = 0x80;
    }
    else
    {
        proc->unk_4a--;

        if (proc->unk_4a > 0)
            return;

        proc->unk_4a = proc->unk_4c;
    }

    sub_08083C68();

    SetTextFont(proc->unk_30);

    for (i = 0; i < iVar5; i++)
    {
        struct HelpBoxProc * r3;
        const char * r1;
        int r0;
        int a, b;

        switch (*proc->str)
        {
        case 0x18:
            sub_08083C44();

            r3 = Proc_Find(ProcScr_MergeBoxDialogue);

            StartYesNoChoice(gUnknown_08A016D8, proc->texts[proc->current_line], r3->x_box_fini, r3->y_box_fini + proc->current_line * 16, 6, 1, proc);

            proc->str++;
            goto end;

        case 0x19:
            sub_08083C44();

            r3 = Proc_Find(ProcScr_MergeBoxDialogue);

            StartYesNoChoice(gUnknown_08A016D8, proc->texts[proc->current_line], r3->x_box_fini, r3->y_box_fini + proc->current_line * 16, 6, 2, proc);

            proc->str++;
            goto end;

        case 0x80:
            r1 = proc->str + 1;
            proc->str = r1;

            if (*r1 == 0x21)
            {
                r0 = proc->unk_59;
                proc->unk_59 = (r0 + 1) & 1;
                proc->str++;
                i--;

                continue;
            }
            else if (*r1 == 0x04)
            {
                sub_08083C44();

                Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 1);
                Proc_Goto(proc, 1);

                Proc_EndEach(ProcScr_TalkBoxIdle);
                proc->str++;

                goto end;
            }

            // fallthrough

        case 0x12:
        case 0x13:
        case 0x14:
        {
            struct HelpBoxProc * r4 = Proc_Find(ProcScr_MergeBoxDialogue);

            sub_08083C44();

            proc->str++;
            if (*proc->str == 0x01)
                proc->str++;

            if (r4 != 0)
            {
                sub_08083C8C(proc);
                GetBoxDialogueSize(proc->str, &a, &b);

                proc->unk_56 = a;
                proc->unk_57 = b;

                proc->unk_54 = r4->w_box_fini;
                proc->unk_55 = r4->h_box_fini;
                proc->timer = 0;

                Proc_Goto(proc, 6);
            }

            goto end;
        }

        case 0x00:
            sub_08083C44();

            if ((GetDialogueBoxConfig() & 2) == 0)
            {
                Proc_Break(proc);
                goto end;
            }

            Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 1);
            Proc_Goto(proc, 1);

            Proc_EndEach(ProcScr_TalkBoxIdle);

            goto end;

        case 0x01:
            sub_08083C44();

            proc->str++;

            if (proc->unk_55 == (proc->current_line + 1))
            {
                proc->timer = 0;
                Proc_Goto(proc, 4);

                goto end;
            }

            proc->current_line++;

            continue;

        case 0x04:
            sub_08083C44();

            proc->str++;

            proc->unk_4a = 8;

            goto end;

        case 0x05:
            sub_08083C44();

            proc->str++;

            proc->unk_4a = 0x10;

            goto end;

        case 0x06:
            sub_08083C44();

            proc->str++;

            proc->unk_4a = 0x20;

            goto end;

        case 0x07:
            sub_08083C44();

            proc->str++;

            proc->unk_4a = 0x40;

            goto end;

        case 0x02:
            sub_08083C44();

            proc->str++;

            if (*proc->str == 0x01)
                proc->str++;

            if (*proc->str == 0x00)
            {
                if ((GetDialogueBoxConfig() & 2) == 0)
                {
                    Proc_Break(proc);
                }
                else
                {
                    Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 1);
                    Proc_Goto(proc, 1);
                    Proc_EndEach(ProcScr_TalkBoxIdle);
                }
            }
            else
            {
                if ((GetDialogueBoxConfig() & 0x10) != 0)
                {
                    sub_08083C8C(proc);
                }
                else
                {
                    if (*proc->str != 0)
                    {
                        proc->timer = 0;
                        Proc_Goto(proc, 5);
                    }
                }
            }

            goto end;

        case 0x03:
        {
            int x;
            int y;
            struct HelpBoxProc * r0;

            sub_08083C44();

            proc->str++;

            r0 = Proc_Find(ProcScr_MergeBoxDialogue);

            x = r0->x_box_fini + proc->x_offset;
            y = r0->y_box_fini + proc->current_line * 16;
            StartTalkWaitForInput((struct Proc *)proc, x, y + 8);

            DialogBoxGetGlyphLen(proc->str, &proc->x_offset);

            goto end;
        }
        }

        if (GetDialogueBoxConfig() & 1)
        {
            Text_SetColor(proc->texts[proc->current_line], 1);
        }
        else
        {
            if (proc->unk_59 != 0)
                Text_SetColor(proc->texts[proc->current_line], 10);
            else
                Text_SetColor(proc->texts[proc->current_line], 6);
        }

        proc->str = Text_DrawCharacter(proc->texts[proc->current_line], proc->str);

        if (GetTextPrintDelay() != 1 || (GetGameTime() & 1) != 0)
        {
            if (GetDialogueBoxConfig() & 0x10)
            {
                PlaySoundEffect(0x2E5);
            }
            else
            {
                PlaySoundEffect(0x38E);
            }
        }
    }

end:
    SetTextFont(NULL);
}

void sub_080842F0(ProcPtr proc)
{
    if (Proc_Find(ProcScr_TalkBoxIdle))
    {
        Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 0);
        Proc_Goto(proc, 0);
    }
}

void sub_08084320(struct ProcBoxDialogueDrawTextExt * proc)
{
    sub_080831B4(proc->unk_54 + 1, proc->unk_55);

    proc->timer++;

    if (proc->timer == 16)
    {
        Text_SetCursor(&gBoxDialogueConf.texts[proc->current_line], 0);
        Proc_Break(proc);
    }
}

void sub_0808436C(struct ProcBoxDialogueDrawTextExt * proc)
{
    if (proc->current_line == 0)
        Proc_Break(proc);
    else
        Proc_Goto(proc, 5);

    if (proc->current_line != 0)
        proc->current_line--;

    proc->timer = 0;
}

void sub_080843AC(ProcPtr proc)
{
    Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 3);
    Proc_Break(proc);

    SetTextFont(NULL);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
}

void sub_080843D8(struct ProcBoxDialogueDrawTextExt * proc)
{
    struct HelpBoxProc * helpBoxProc = Proc_Find(ProcScr_MergeBoxDialogue);

    proc->timer++;

    if (helpBoxProc)
    {
        int x = (proc->unk_54 * (2 - proc->timer) + proc->timer * proc->unk_56) / 2;
        int y = (proc->unk_55 * (2 - proc->timer) + proc->timer * proc->unk_57) / 2;

        SetBoxDialogueSize(helpBoxProc, x, y);
    }

    if (proc->timer == 2)
    {
        u8 tmp;

        proc->unk_54 = proc->unk_56 / 8;

        tmp = proc->unk_57 / 16;
        proc->unk_55 = tmp < 5 ? tmp : 5;

        Proc_Break(proc);
    }
}

s8 sub_0808446C(void)
{
    struct ProcBoxDialogue * proc = Proc_Find(gProcScr_BoxDialogue);

    if (!proc)
        return 1;

    if (proc->unk_38 != 0)
        return 1;

    return 0;
}

void sub_08084490(struct HelpBox8A01800Proc * proc)
{
    struct ProcBoxDialogueDrawTextExt * otherProc;

    SetTextFont(&gBoxDialogueConf.font);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    if ((GetDialogueBoxConfig() & 1) == 0)
    {
        Text_SetColor(&gBoxDialogueConf.texts[0], 6);
        Text_SetColor(&gBoxDialogueConf.texts[1], 6);
        Text_SetColor(&gBoxDialogueConf.texts[2], 6);

        if (((GetDialogueBoxConfig() & 0x10) != 0) && ((GetDialogueBoxConfig() & 0x20) == 0))
        {
            Text_SetColor(&gBoxDialogueConf.texts[3], 6);
            Text_SetColor(&gBoxDialogueConf.texts[4], 6);
        }
    }
    else
    {
        int i;

        for (i = 0; i < (int)((u32)(GetDialogueBoxConfig() << 0x10) >> 0x18); i++)
            Text_SetColor(&gBoxDialogueConf.texts[i], 0);
    }

    SetTextFont(NULL);

    Proc_EndEach(ProcScr_BoxDialogueDrawTextExt);
    otherProc = Proc_Start(ProcScr_BoxDialogueDrawTextExt, PROC_TREE_3);

    otherProc->unk_30 = &gBoxDialogueConf.font;
    otherProc->texts[0] = &gBoxDialogueConf.texts[0];
    otherProc->texts[1] = &gBoxDialogueConf.texts[1];
    otherProc->texts[2] = &gBoxDialogueConf.texts[2];
    otherProc->texts[3] = &gBoxDialogueConf.texts[3];
    otherProc->texts[4] = &gBoxDialogueConf.texts[4];
    otherProc->current_line = 0;

    DecodeMsg(proc->unk_5c);

    otherProc->str = MsgExpand();
    otherProc->unk_54 = proc->unk_2c;
    otherProc->unk_55 = proc->unk_30;

    if (sub_0808446C() != 0)
    {
        otherProc->unk_4c = GetTextPrintDelay();

        otherProc->unk_4e = otherProc->unk_4c != 0 ? 1 : 0x80;
    }
    else
    {
        otherProc->unk_4c = 0;
        otherProc->unk_4e = 0x80;
    }

    otherProc->unk_4a = 0;
}

void sub_080845C8(int msg, int x, int y)
{
    struct HelpBox8A01800Proc * proc = Proc_Start(gUnknown_08A01800, PROC_TREE_3);

    proc->unk_5c = msg;

    proc->unk_2c = x / 8;

    if (y / 16 < 6)
    {
        if (y / 16 < 0)
        {
            proc->unk_30 = 0;
            return;
        }
        else
        {
            proc->unk_30 = y / 16;
            return;
        }
    }

    proc->unk_30 = 5;
}

void sub_0808460C(void)
{
    SetTextFont(&gBoxDialogueConf.font);

    if (!(GetDialogueBoxConfig() & 1))
    {
        SpriteText_DrawBackground(&gBoxDialogueConf.texts[0]);
        SpriteText_DrawBackground(&gBoxDialogueConf.texts[1]);
        SpriteText_DrawBackground(&gBoxDialogueConf.texts[2]);

        if (((GetDialogueBoxConfig() & 0x10) != 0) && ((GetDialogueBoxConfig() & 0x20) == 0))
        {
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[3]);
            SpriteText_DrawBackground(&gBoxDialogueConf.texts[4]);
        }
    }
    else
    {
        int i;

        for (i = 0; i < (int)((u32)(GetDialogueBoxConfig() << 0x10) >> 0x18); i++)
            SpriteText_DrawBackgroundExt(&gBoxDialogueConf.texts[i], 0);
    }

    Proc_EndEach(ProcScr_BoxDialogueDrawTextExt);
    Proc_EndEach(gUnknown_08A01800);

    SetTextFont(NULL);
}

void StartNoBoxTalk(void)
{
    Proc_Start(ProcScr_TalkBoxIdle, PROC_TREE_VSYNC);
}

s8 sub_080846C0(void)
{
    if (Proc_Find(ProcScr_TalkBoxIdle))
        return 1;

    return 0;
}

void sub_080846DC(void)
{
    Proc_EndEach(gProcScr_BoxDialogue);
    Proc_EndEach(ProcScr_TalkBoxIdle);
    Proc_EndEach(ProcScr_MergeBoxDialogue);
    Proc_EndEach(ProcScr_BoxDialogueDrawTextExt);
    Proc_EndEach(gUnknown_08A01800);
}
