#include "gbafe.h"
#include "gbafe/cgtext.h"

extern u16 CONST_DATA gPal_HelpTextBox[];
extern u16 CONST_DATA gUnknown_0819D20C[];
extern u8 CONST_DATA gUnknown_0819D174[];

void SetCgTextFlags(int flags)
{
    gCgTextSt.flags = flags;
}

void SetCgTextFlag(int flag)
{
    gCgTextSt.flags |= flag & 0x3FFFFF;
}

void ClearCgTextFlag(int flag)
{
    SetCgTextFlags(GetCgTextFlags() & (flag ^ 0x3FFFFF));
}

u32 GetCgTextFlags(void)
{
    return gCgTextSt.flags;
}

void SetCgTextBlendControl(u16 target1, u16 target2)
{
    target2 |= 0x20;
    gCgTextSt.bldCnt = target1 + BLDCNT_EFFECT_BLEND + (target2 << 8);
}

u16 GetCgTextBlendControl(void)
{
    return gCgTextSt.bldCnt;
}

void SetCgTextBlendAlpha(u16 target1, u16 target2)
{
    gCgTextSt.bldAlpha = target1 + (target2 << 8);
}

u16 GetCgTextBlendAlpha(void)
{
    return gCgTextSt.bldAlpha;
}

void CgText_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == gCgTextSt.unk_48_00 * 8 - 32)
    {
        REG_BLDCNT = GetCgTextBlendControl();
        REG_BLDALPHA = GetCgTextBlendAlpha();
    }

    if ((vcount == 0) || (vcount == (gCgTextSt.unk_48_05 * 8 + 4)))
    {
        REG_BLDCNT = *((u16 *)&gDispIo.blend_ct);
        REG_BLDALPHA = gDispIo.blend_coef_a + gDispIo.blend_coef_b * 0x100;
    }
}
void sub_808EB0C(struct CgTextMainProc * proc)
{
    struct Font font;
    char buf[32];
    struct Text th;
    int len;

    char * iter = buf;

    if ((proc->str[0] == 0x80) && (proc->str[1] == 0x23)) // [SetName]
    {
        proc->str += 2;

        while (*proc->str != 0x01) // [NL]
        {
            *iter = *proc->str;
            proc->str++;
            iter++;
        }

        proc->str++;
        *iter = 0;

        SetCgTextFlag(CG_TEXT_FLAG_16);

        InitSpriteTextFont(&font, (void *)0x06017800, 0x12);
        SetTextFont(&font);
        InitSpriteText(&th);

        SpriteText_DrawBackgroundExt(&th, 0);

        SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

        len = GetStringTextLen(buf);
        if (len > 48)
            proc->unk_61 = (len - 41) / 8;
        else
            proc->unk_61 = 0;

        Text_InsertDrawString(&th, GetStringTextCenteredPos((proc->unk_61 + 6) * 8, buf), 0, buf);

        SetTextFont(NULL);

        ApplyPalette(Pal_Text, 0x12);
        ApplyPalette(gUnknown_0819D20C, 0x11);
        Decompress(gUnknown_0819D174, (void *)0x06017A00);
    }
}
void CgText_Init(struct CgTextMainProc * proc)
{
    int i;
    int x;
    int y;

    int width = 0;
    int height = 0;

    proc->pauseTimer = 0;
    proc->blendAmt = 0;

    if (GetCgTextFlags() >> 0xb & 7)
        proc->displaySpeed = ((GetCgTextFlags() >> 0xb) & 7) - 1;
    else
        proc->displaySpeed = GetTextPrintDelay();

    proc->unk_60 = 0;

    proc->numCharsVisible = (proc->displaySpeed != 0) ? 1 : INT8_MAX;

    proc->thIndex = 0;
    proc->unk_5e = 0;

    sub_808EB0C(proc);

    if ((proc->boxWidth < 0) || (proc->boxHeight < 0))
    {
        SetTextFontGlyphs(TEXT_GLYPHS_TALK);
        GetCgTextBoxDimensions(proc->str, &width, &height);
        SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

        proc->boxWidth = (width + 7) / 8;
        proc->boxHeight = height / 8;
    }

    if (!(GetCgTextFlags() & CG_TEXT_FLAG_0))
    {
        y = proc->y - proc->boxHeight - 1;

        if (GetCgTextFlags() & CG_TEXT_FLAG_1)
        {
            x = proc->x - proc->boxWidth - 2;
            PutTalkBubbleTm(
                GetCgTextBg(GetCgTextFlags()), proc->x - proc->boxWidth - 2, proc->y - proc->boxHeight - 1,
                proc->boxWidth + 2, proc->boxHeight + 2);

            if (!(GetCgTextFlags() & CG_TEXT_FLAG_10))
            {
                int kind = (GetCgTextFlags() & CG_TEXT_FLAG_18) ? 5 : 3;
                PutTalkBubbleTail(GetCgTextBg(GetCgTextFlags()), proc->x - 1, proc->y - 2, kind);
            }
        }
        else
        {
            x = proc->x + 1;
            PutTalkBubbleTm(
                GetCgTextBg(GetCgTextFlags()), proc->x + 1, proc->y - proc->boxHeight - 1,
                proc->boxWidth + 2, proc->boxHeight + 2);

            if (!(GetCgTextFlags() & CG_TEXT_FLAG_10))
            {
                int kind = (GetCgTextFlags() & CG_TEXT_FLAG_18) ? 5 : 2;
                PutTalkBubbleTail(GetCgTextBg(GetCgTextFlags()), proc->x, proc->y - 2, kind);
            }
        }

        if (GetCgTextFlags() & CG_TEXT_FLAG_16)
        {
            u16 * bg = GetBgTilemap(GetCgTextBg(GetCgTextFlags()));
            TmFillRect_thm(bg + y * 0x20 + x, proc->unk_61 + 6, 0, 0);
        }

        EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
    }

    sub_808F3D8(proc);
    StartParallelWorker(sub_808F5C8, proc);

    SetTextFont(proc->pFont);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    for (i = 0; i <= proc->boxHeight / 2; i++)
    {
        InitSpriteText(proc->pTexts[i]);
        Text_SetColor(proc->pTexts[i], 0xb);
    }

    CgText_ClearSpriteText(proc);
    SetTextFont(NULL);

    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        if (GetCgTextFlags() & CG_TEXT_FLAG_7)
        {
            SetCgTextBlendAlpha(0x10, 1);
            Proc_Goto(proc, 3);
        }
        else
        {
            SetCgTextBlendAlpha(0, 0x10);
        }

        if (GetCgTextFlags() & CG_TEXT_FLAG_16)
            gCgTextSt.unk_48_00 = proc->y - 5;
        else
            gCgTextSt.unk_48_00 = proc->y - 1;

        gCgTextSt.unk_48_05 = proc->boxHeight + proc->y + 1;

        SetCgTextBlendControl(1 << GetCgTextBg(GetCgTextFlags()), 1 << GetCgTextBg(GetCgTextFlags()) ^ 0x1f);

        if (!(GetCgTextFlags() & CG_TEXT_FLAG_19))
        {
            SetOnHBlankB(NULL);
            SetOnHBlankB(CgText_OnHBlank);
        }
    }

    SetBgOffset(GetCgTextBg(GetCgTextFlags()), 0, 0);
}
void CgText_InitBlendAmt(struct CgTextMainProc * proc)
{
    proc->blendAmt = 0;
}

void CgText_LoopFadeIn(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt++;

    target1 = proc->blendAmt;

    if (proc->blendAmt != 0x10)
        target2 = 0x10 - proc->blendAmt;
    else
        target2 = 1;

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0x10)
        Proc_Break(proc);
}

void CgText_InitFadeOut(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);
    SetFaceDispById(0, GetFaceDispById(0) & ~FACE_DISP_TALK_1);

    EndCgTextInterpreter();

    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
        Proc_Goto(proc, 5);
    else
        proc->blendAmt = 0x10;

    if (GetCgTextFlags() & CG_TEXT_FLAG_17)
        StartFaceFadeOut(Proc_Find(ProcScr_Face));
}

void CgText_LoopFadeOut(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt--;

    target1 = proc->blendAmt;

    if (target1 != 0x10)
        target2 = 0x10 - target1;
    else
        target2 = 1;

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0)
    {
        ClearCgTextFlag(CG_TEXT_FLAG_16);
        Proc_Break(proc);
    }
}

void CgText_808F04C(struct CgTextMainProc * proc)
{
    if (!(gpKeySt->pressed & (B_BUTTON | START_BUTTON)))
        return;

    if (GetCgTextFlags() & CG_TEXT_FLAG_6)
        return;

    sub_0800F08C();
    EndCgTextInterpreter();

    Proc_Goto(proc, 0);
}

void CgText_808F084(struct CgTextMainProc * proc)
{
    u16 * bg = GetBgTilemap(GetCgTextBg(GetCgTextFlags()));
    TmFillRect_thm(bg + (proc->y - 1) * 32, 31, proc->boxHeight + 1, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void CgText_OnEnd(struct CgTextMainProc * proc)
{
    SetFaceDispById(0, GetFaceDispById(0) & ~FACE_DISP_TALK_1);
    CgText_808F084(proc);
    SetOnHBlankB(NULL);
}

void CgText_808F0EC(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);

    proc->thIndex = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    proc->textWidth = 0;
    proc->textHeight = 0;
    GetCgTextDimensions(proc->str, &proc->textWidth, &proc->textHeight);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    RestartCgTextInterpreter(proc);
}

void StartCgText(int x, int y, int width, int height, int stringId, void * vram, int pal, ProcPtr parent)
{
    int palTmp;
    int i;
    int mask;

    struct CgTextMainProc * proc = Proc_Find(gProcScr_CgTextMain);

    if (proc)
    {
        proc->str = DecodeMsg(stringId);
        if (DoesStringContainTact(proc->str))
            proc->str = MsgExpand();

        if (proc->blendAmt == 0x10)
            Proc_Goto(proc, 3);
        else
            Proc_Goto(proc, 2);

        return;
    }

    if (parent)
        proc = Proc_StartBlocking(gProcScr_CgTextMain, parent);
    else
        proc = Proc_Start(gProcScr_CgTextMain, PROC_TREE_3);

    SetCgTextFlags(CG_TEXT_BG(1));
    ClearAllTalkFlags();

    proc->pFont = &gCgTextSt.font;

    for (i = 0; i < 6; i++)
        proc->pTexts[i] = &gCgTextSt.texts[i];

    proc->x = x;
    proc->y = y;
    proc->boxWidth = width;
    proc->boxHeight = height;
    proc->vram = vram;

    if (pal < 0)
        pal = 5;

    mask = 0xf;
    palTmp = (pal & mask);
    pal = palTmp + 0x10;

    if (vram == 0)
        vram = (void *)0x06013000;

    InitSpriteTextFont(proc->pFont, vram, pal);
    SetTextFont(NULL);

    ApplyPalette(gPal_HelpTextBox, pal);
    proc->palId = ((((uintptr_t)vram) << 0x11) >> 0x16) + ((pal & mask) << 0xc);

    proc->str = DecodeMsg(stringId);
    if (DoesStringContainTact(proc->str) != 0)
        proc->str = MsgExpand();
}

void EndCgText(void)
{
    Proc_End(Proc_Find(gProcScr_CgTextMain));
}

bool CgTextExists(void)
{
    if (Proc_Find(gProcScr_CgTextMain))
        return TRUE;

    return FALSE;
}

void sub_808F2A0(void)
{
    struct CgTextMainProc * proc = Proc_Find(gProcScr_CgTextMain);

    if (proc != NULL)
        Proc_Goto(proc, 0);
}
void CgText_ClearSpriteText(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
        SpriteText_DrawBackgroundExt(proc->pTexts[i], 0);

    SetTextFont(NULL);
}

void sub_808F30C(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
        Text_SetCursor(proc->pTexts[i], 0);
}

void GetCgTextDimensions(const char * str, u8 * wOut, u8 * hOut)
{
    int charWidth;

    int w = 0;
    int h = *hOut;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
        case 0x00: // [X]
        case 0x03: // [A]
        case 0x18: // [Yes]
        case 0x19: // [No]
            *wOut = w;
            *hOut = h;
            return;

        case 0x02: // [NL2]
        case 0x04: // [....]
        case 0x05: // [.....]
        case 0x06: // [......]
        case 0x07: // [.......]
        case 0x16: // [ToggleMouthMove]
        case 0x17: // [ToggleSmile]
            str++;
            continue;

        case 0x01: // [NL]
            str++;
            h += 16;
            w = 0;
            continue;

        case 0x80:
            str += 2;
            continue;

        default:
            str = GetCharTextLen(str, &charWidth);
            w += charWidth;
            continue;
        }
    }
}

void sub_808F3D8(struct CgTextMainProc * proc)
{
    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
        return;

    if (GetCgTextFlags() & CG_TEXT_FLAG_1)
        proc->x = proc->x - proc->boxWidth - 1;
    else
        proc->x += 2;

    proc->y -= proc->boxHeight;
}

void GetCgTextBoxDimensions(const char * str, int * wOut, int * hOut)
{
    int charWidth;

    int w = 0;
    int h = 16;

    *wOut = 0;
    *hOut = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
        case 0x03: // [A]
            w += 8;

        case 0x00: // [X]
        case 0x01: // [NL]
        case 0x02: // [2NL]
        case 0x18: // [Yes]
        case 0x19: // [No]
            if (*wOut < w)
                *wOut = w;

            w = 0;
            break;
        }

        switch (*str)
        {
        case 0x01: // [NL]
        case 0x18: // [Yes]
        case 0x19: // [No]
            h += 16;
            break;

        case 0x00: // [X]
        case 0x02: // [2NL]
            if (*hOut < h)
                *hOut = h;

            h = 0;
            break;
        }

        switch (*str)
        {
        case 0x00: // [X]
            return;

        case 0x01: // [NL]
        case 0x02: // [NL2]
        case 0x03: // [A]
        case 0x04: // [....]
        case 0x05: // [.....]
        case 0x06: // [......]
        case 0x07: // [.......]
        case 0x16: // [ToggleMouthMove]
        case 0x17: // [ToggleSmile]
        case 0x18: // [Yes]
        case 0x19: // [No]
            str++;
            continue;

        case 0x80:
            str += 2;
            continue;

        default:
            str = GetCharTextLen(str, &charWidth);
            w += charWidth;
            continue;
        }
    }
}

s8 DoesStringContainTact(const char * str)
{
    while (1)
    {
        switch (*str)
        {
        case 0x00: // [X]
            return 0;

        case 0x80:
            str++;

            if (*str == 0x20) // [Tact]
                return 1;
        }

        str++;
    }
}
ASM_FUNC("asm/nonmatching/code_08088098.s");
ASM_FUNC("asm/nonmatching/code_08088380.s");
void sub_808FEA4(int * src, int x, int y)
{
    int i;
    int ix;
    int iy;

    int * srcPtr = src;

    for (iy = 0; iy < y; iy++)
    {
        int * srcPtr_ = srcPtr;

        for (ix = 0; ix < x; ix++)
        {
            for (i = 0; i < 7; i++)
            {
                srcPtr_[0] = srcPtr_[1];
                srcPtr_++;
            }

            if (iy == y - 1)
            {
                srcPtr_[0] = 0;
                srcPtr_++;
            }
            else
            {
                int tmp = ix + 0x20;
                srcPtr_[0] = srcPtr[tmp * 8];
                srcPtr_++;
            }
        }

        srcPtr += 0x100;
    }
}

void CgTextInterpreter_808FF10(struct CgTextInterpreterProc * proc)
{
    proc->unk_4c = 0;
}

void CgTextInterpreter_808FF18(struct CgTextInterpreterProc * proc)
{
    struct CgTextMainProc * parent = proc->proc_parent;

    int a = (parent->thIndex + 1) * 2;

    sub_808FEA4(parent->vram, parent->boxWidth, a);

    proc->unk_4c++;

    if (proc->unk_4c == parent->unk_5f * 16)
    {
        sub_808F30C(parent);

        parent->thIndex -= parent->unk_5f - 1;

        parent->textWidth = 0;
        parent->textHeight = 0;
        GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);

        parent->textHeight = parent->thIndex * 16 + parent->textHeight;

        Proc_Break(proc);
    }
}

void CgTextInterpreter_808FF9C(struct CgTextInterpreterProc * proc)
{
    struct CgTextMainProc * parent = proc->proc_parent;

    CgText_ClearSpriteText(parent);

    parent->thIndex = 0;

    parent->textWidth = 0;
    parent->textHeight = 0;
    GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);
}

void RestartCgTextInterpreter(struct CgTextMainProc * parent)
{
    Proc_End(Proc_Find(gProcScr_CgTextInterpreter));
    Proc_Start(gProcScr_CgTextInterpreter, parent);
}

void EndCgTextInterpreter(void)
{
    Proc_End(Proc_Find(gProcScr_CgTextInterpreter));
}

s8 sub_808FFFC(void)
{
    if (GetCgTextFlags() & CG_TEXT_FLAG_2)
        return 1;

    return 0;
}
void YesNoChoice_Loop_KeyHandler(struct YesNoChoiceProc * proc)
{
    if (gpKeySt->pressed & B_BUTTON)
    {
        PlaySoundEffect(0x38B);
        SetTalkChoiceResult(0);
        Proc_Break(proc);
        return;
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        PlaySoundEffect(0x38A);
        SetTalkChoiceResult(proc->currentChoice);
        Proc_Break(proc);
        return;
    }

    if ((gpKeySt->pressed & DPAD_LEFT) && (proc->currentChoice == 2))
    {
        PlaySoundEffect(0x387);
        proc->currentChoice = 1;
    }

    if ((gpKeySt->pressed & DPAD_RIGHT) && (proc->currentChoice == 1))
    {
        PlaySoundEffect(0x387);
        proc->currentChoice = 2;
    }

    PutUiHand(proc->x + (proc->currentChoice - 1) * 40 - 4, proc->y);
}

void StartYesNoChoice(int * choiceTextIds, struct Text * th, int x, int y, int color, int defaultChoice, ProcPtr parent)
{
    struct YesNoChoiceProc * proc;

    Text_InsertDrawString(th, 16, color, DecodeMsg(choiceTextIds[0]));
    Text_InsertDrawString(th, 56, color, DecodeMsg(choiceTextIds[1]));

    proc = Proc_StartBlocking(gProcScr_YesNoChoice, parent);
    proc->currentChoice = defaultChoice;
    proc->x = x + 16;
    proc->y = y;
}
