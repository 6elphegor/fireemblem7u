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

ASM_FUNC("asm/nonmatching/code_080831B4.s");

ASM_FUNC("asm/nonmatching/code_08083254.s");

ASM_FUNC("asm/nonmatching/code_080833AC.s");

ASM_FUNC("asm/nonmatching/code_08083434.s");

ASM_FUNC("asm/nonmatching/code_08083444.s");

ASM_FUNC("asm/nonmatching/code_08083478.s");

ASM_FUNC("asm/nonmatching/code_080834A8.s");

ASM_FUNC("asm/nonmatching/code_080834E0.s");

ASM_FUNC("asm/nonmatching/code_08083570.s");

ASM_FUNC("asm/nonmatching/code_08083598.s");

ASM_FUNC("asm/nonmatching/code_080835BC.s");

ASM_FUNC("asm/nonmatching/code_080835EC.s");

ASM_FUNC("asm/nonmatching/code_08083600.s");

ASM_FUNC("asm/nonmatching/code_08083668.s");

ASM_FUNC("asm/nonmatching/code_080836D8.s");

ASM_FUNC("asm/nonmatching/code_08083798.s");

ASM_FUNC("asm/nonmatching/code_0808380C.s");

ASM_FUNC("asm/nonmatching/code_080838FC.s");

ASM_FUNC("asm/nonmatching/code_08083C0C.s");

ASM_FUNC("asm/nonmatching/code_08083C44.s");

ASM_FUNC("asm/nonmatching/code_08083C68.s");

ASM_FUNC("asm/nonmatching/code_08083C8C.s");

ASM_FUNC("asm/nonmatching/code_08083CE8.s");

ASM_FUNC("asm/nonmatching/code_080842F0.s");

ASM_FUNC("asm/nonmatching/code_08084320.s");

ASM_FUNC("asm/nonmatching/code_0808436C.s");

ASM_FUNC("asm/nonmatching/code_080843AC.s");

ASM_FUNC("asm/nonmatching/code_080843D8.s");

ASM_FUNC("asm/nonmatching/code_0808446C.s");

ASM_FUNC("asm/nonmatching/code_08084490.s");

ASM_FUNC("asm/nonmatching/code_080845C8.s");

ASM_FUNC("asm/nonmatching/code_0808460C.s");

ASM_FUNC("asm/nonmatching/code_080846AC.s");

ASM_FUNC("asm/nonmatching/code_080846C0.s");

ASM_FUNC("asm/nonmatching/code_080846DC.s");
