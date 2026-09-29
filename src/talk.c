#include "gbafe.h"
#include "constants/msg.h"
#include "gbafe/bmshop.h"

extern const u16 gUnk_08B90A74[], gUnk_08B90A7C[], gUnk_08B90A84[];

void SetupDebugFontForOBJ(int vramOffset, int palId);
void sub_8005234(int, int, int, int);

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkSt->top_text_num) % sTalkSt->lines)

extern int sTalkChoiceResult;
extern struct Text sTalkText[];
extern struct Font sTalkFont;

void ClearTalkFaceRefs()
{
    int i;

    for (i = 0; i < TALK_FACE_COUNT; i++)
    {
        sTalkSt->faces[i] = 0;
    }
}

void InitTalk(int chr, int lines, bool unpack_bubble)
{
    int i;

    InitTextFont(&sTalkFont, (u8 *) VRAM + GetBgChrOffset(0) + ((chr & 0x3FF) << 5), chr, BGPAL_TALK);
    SetInitTalkTextFont();

    sTalkSt->lines = lines;

    for (i = 0; i < lines; ++i)
    {
        InitText(sTalkText + i, 30);
        Text_SetColor(sTalkText + i, TEXT_COLOR_0456);
    }

    if (unpack_bubble)
    {
        Decompress(Img_TalkBubble, (u8 *) VRAM + GetBgChrOffset(1) + 0x200);
        ApplyPalette(Pal_TalkBubble, BGPAL_TALK_BUBBLE);
    }

    ClearTalkFaceRefs();
}

void InitSpriteTalk(int chr, int lines, int palid)
{
    int i;

    InitSpriteTextFont(&sTalkFont, (u8 *) VRAM + 0x10000 + ((chr & 0x3FF) << 5), palid);

    SetTextFont(&sTalkFont);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    ApplyPalette(Pal_Text+0x10, 0x10 + palid);

    PAL_OBJ_COLOR(palid, 4)  = RGB(7,  18, 28);
    PAL_OBJ_COLOR(palid, 14) = RGB(14, 13, 12);
    PAL_OBJ_COLOR(palid, 15) = RGB(31, 31, 31);

    sTalkSt->lines = lines;

    for (i = 0; i < lines; ++i)
    {
        InitSpriteText(sTalkText + i);

        SpriteText_DrawBackground(sTalkText + i);
        Text_SetColor(sTalkText + i, TEXT_COLOR_4DEF);
        Text_SetCursor(sTalkText + i, 4);
    }
}

void sub_08007F50()
{
    ApplyPaletteExt(Pal_Text, 0x40, 0x20);
}

void SetInitTalkTextFont()
{
    SetTextFont(&sTalkFont);
    InitTalkTextFont();
}

ProcPtr StartTalkExt(int x, int y, const char* msg, ProcPtr proc)
{
    sTalkSt->x_text = x;
    sTalkSt->y_text = y;
    sTalkSt->str = msg;
    sTalkSt->str_back = 0;
    sTalkSt->print_color = 1;
    sTalkSt->line_active = 0;
    sTalkSt->unk_82 = 0;
    sTalkSt->top_text_num = 0;
    sTalkSt->print_delay = GetTextPrintDelay();
    sTalkSt->print_clock = 0;
    SetActiveTalkFace(0xFF);
    sTalkSt->speak_talk_face = 0xff;
    sTalkSt->put_lines = 0;
    sTalkSt->instant_print = 0;
    sTalkSt->unk_16 = 1;
    sTalkSt->unk_17 = 0;
    sTalkSt->unk_80 = 0;
    sTalkSt->unk_38 = 0;
    sTalkSt->unk_83 = 0;
    sTalkSt->active_width = Div(GetStrTalkLen(sTalkSt->str, 0) + 7, 8) + 2;

    if (proc)
    {
        return Proc_StartBlocking(ProcScr_Talk, proc);
    }
    else
    {
        return Proc_Start(ProcScr_Talk, (ProcPtr)3);
    }
}

ProcPtr StartTalkMsg(int x, int y, int id)
{
    return StartTalkExt(x, y, DecodeMsg(id), 0);
}

ProcPtr StartTalkMsgExt(int x, int y, int id, ProcPtr proc)
{
    return StartTalkExt(x, y, DecodeMsg(id), proc);
}

ProcPtr StartTalk(int x, int y, const char* msg)
{
    return StartTalkExt(x, y, msg, 0);
}

void EndTalk()
{
    Proc_EndEach(ProcScr_Talk);
}

void SetTalkLines(u8 lines)
{
    sTalkSt->lines = lines;
}

void ClearAllTalkFlags()
{
    sTalkSt->unk_80 = 0;
}

void SetTalkFlag(int talk_flags)
{
    sTalkSt->unk_80 |= talk_flags;
}

void SetTalkFunc(ProcFunc func)
{
    sTalkSt->unk_38 = func;
}

void ClearTalkFlag(int unk)
{
    sTalkSt->unk_80 &= (~unk);
}

int CheckTalkFlag(int flag)
{
    return sTalkSt->unk_80 & flag;
}

void SetTalkPrintDelay(s8 delay)
{
    sTalkSt->print_delay = delay;
    if (sTalkSt->print_delay < 0)
    {
        sTalkSt->print_delay = 0;
    }
}

void SetTalkPrintColor(u8 color)
{
    int i;

    sTalkSt->print_color = color;

    for (i = 0; i < sTalkSt->lines; i++)
    {
        Text_SetColor(&sTalkText[i], sTalkSt->print_color);
    }
}

void TalkSkipListener_OnIdle(ProcPtr proc)
{
    if (!Proc_Find(gProcScr_TalkShiftClearAll) && !Proc_Find(gUnk_08B90B24))
    {
        if (!CheckTalkFlag(4) && (gpKeySt->pressed & 0xA))
        {
            sub_0800F08C();
            SetTalkFaceNoMouthMove(sTalkSt->active_talk_face);
            Proc_End(proc);
            EndTalk();
            TmFill(gBg0Tm, 0);
            TmFill(gBg1Tm, 0);
            EnableBgSync(3);
        }
        else if (!Proc_Find(gProcScr_TalkWaitForInput) && !CheckTalkFlag(8))
        {
            if (gpKeySt->pressed & 0xf3)
            {
                sTalkSt->instant_print = 1;
            }
        }
    }
}

void Talk_OnInit()
{
    if (!CheckTalkFlag(0x20))
    {
        ApplySystemObjectsGraphics();
        SetBgOffset(0, 0, 0);
        SetBgOffset(1, 0, 0);
    }

    Proc_Start(gProcScr_TalkSkipListener, (ProcPtr)3);
}

#if NONMATCHING

// The C for the asm below.  It compiles with "lsrs r0, r0, #0x18; adds r3,
// r0, #0" instead of "asrs r3, r0, #0x18" and "ldrb r0, [r1, #0x12]" instead
// of "ldrsb", so the matching build keeps the asm.  (FE7J's version returned
// when print_clock reached print_delay, the opposite of the asm: fixed.)

void Talk_Loop(ProcPtr proc)
{
    int ti;
    bool b = IsTalkFaceMoving();

    if (b)
        return;

    if (!sTalkSt->instant_print)
    {
        sTalkSt->print_clock++;

        if (sTalkSt->print_clock < sTalkSt->print_delay)
        {
            return;
        }
    }

    sTalkSt->print_clock = b;

Loutside:
    for (;;)
    {
        SetTalkFaceNoMouthMove(sTalkSt->active_talk_face);

        switch (TalkInterpret(proc))
        {
        case 0:
            Proc_Break(proc);
            return;

        case 2:
            if (sTalkSt->instant_print)
            {
                goto Loutside;
            }

            if (sTalkSt->print_delay <= 0)
            {
                break;
            }

            return;

        case 3:
            sTalkSt->print_clock = sTalkSt->print_delay;
            sTalkSt->instant_print = FALSE;
            return;

        case 1:
        default:
            if (!CheckTalkFlag(TALK_FLAG_SPRITE))
            {
                if (sub_0800838C(proc) == TRUE)
                    return;
            }
            else
            {
                if (TalkSpritePrepNextChar(proc) == TRUE)
                    return;
            }

            sTalkSt->str = Text_DrawCharacter(TALK_TEXT_BY_LINE(sTalkSt->line_active), sTalkSt->str);

            if (!CheckTalkFlag(TALK_FLAG_SILENT))
            {
                if (CheckTalkFlag(TALK_FLAG_7) != 0)
                {
                    PlaySoundEffect(0x39A);
                }
                else
                {
                    if ((GetTextPrintDelay() == 1) && !(GetGameTime() & 1))
                        break;

                    if (sTalkSt->instant_print != 0 && sTalkSt->unk_82 != 0)
                        break;

                    sTalkSt->unk_82 = 1;

                    PlaySoundEffect(0x38E);
                }
            }
        }

        if (!sTalkSt->instant_print && sTalkSt->print_delay > 0)
            return;
    }
}

#else

NAKEDFUNC
void Talk_Loop(ProcPtr proc)
{
    asm("   .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    adds r6, r0, #0\n\
    bl IsTalkFaceMoving\n\
    lsls r0, r0, #0x18\n\
    asrs r3, r0, #0x18\n\
    cmp r3, #0\n\
    beq _080080BE\n\
    b _0800820E_THE_END\n\
_080080BE:\n\
    ldr r2, _08008108 @ =sTalkSt\n\
    ldr r1, [r2]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    bne _080080E2\n\
    ldrb r0, [r1, #0x14]\n\
    adds r0, #1\n\
    strb r0, [r1, #0x14]\n\
    ldr r0, [r2]\n\
    movs r1, #0x14\n\
    ldrsb r1, [r0, r1]\n\
    ldrb r0, [r0, #0x13]\n\
    lsls r0, r0, #0x18\n\
    asrs r0, r0, #0x18\n\
    cmp r1, r0\n\
    bge _080080E2\n\
    b _0800820E_THE_END\n\
_080080E2:\n\
    ldr r0, [r2]\n\
    strb r3, [r0, #0x14]\n\
_080080E6:\n\
    ldr r7, _08008108 @ =sTalkSt\n\
    ldr r0, _0800810C @ =gPlaySt + 0x41\n\
    mov r8, r0\n\
_080080EC:\n\
    ldr r0, [r7]\n\
    ldrb r0, [r0, #0x11]\n\
    bl SetTalkFaceNoMouthMove\n\
    adds r0, r6, #0\n\
    bl TalkInterpret\n\
    cmp r0, #1\n\
    beq _08008144\n\
    cmp r0, #1\n\
    bgt _08008110\n\
    cmp r0, #0\n\
    beq _0800811A\n\
    b _08008144\n\
    .align 2, 0\n\
_08008108: .4byte sTalkSt\n\
_0800810C: .4byte gPlaySt + 0x41\n\
_08008110:\n\
    cmp r0, #2\n\
    beq _08008122\n\
    cmp r0, #3\n\
    beq _08008136\n\
    b _08008144\n\
_0800811A:\n\
    adds r0, r6, #0\n\
    bl Proc_Break\n\
    b _0800820E_THE_END\n\
_08008122:\n\
    ldr r1, [r7]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    bne _080080E6\n\
    movs r0, #0x13\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    ble _080081F8\n\
    b _0800820E_THE_END\n\
_08008136:\n\
    ldr r0, [r7]\n\
    ldrb r1, [r0, #0x13]\n\
    movs r2, #0\n\
    strb r1, [r0, #0x14]\n\
    ldr r0, [r7]\n\
    strb r2, [r0, #0x12]\n\
    b _0800820E_THE_END\n\
_08008144:\n\
    movs r0, #0x20\n\
    bl CheckTalkFlag\n\
    cmp r0, #0\n\
    bne _08008156\n\
    adds r0, r6, #0\n\
    bl sub_0800838C\n\
    b _0800815C\n\
_08008156:\n\
    adds r0, r6, #0\n\
    bl TalkSpritePrepNextChar\n\
_0800815C:\n\
    lsls r0, r0, #0x18\n\
    asrs r0, r0, #0x18\n\
    cmp r0, #1\n\
    beq _0800820E_THE_END\n\
    ldr r5, _080081AC @ =sTalkSt\n\
    ldr r4, [r5]\n\
    ldrb r1, [r4, #0xb]\n\
    ldrb r2, [r4, #9]\n\
    adds r0, r1, r2\n\
    ldrb r1, [r4, #0xa]\n\
    bl __modsi3\n\
    lsls r0, r0, #3\n\
    ldr r1, _080081B0 @ =0x030000C8\n\
    adds r0, r0, r1\n\
    ldr r1, [r4]\n\
    bl Text_DrawCharacter\n\
    ldr r1, [r5]\n\
    str r0, [r1]\n\
    movs r0, #0x40\n\
    bl CheckTalkFlag\n\
    cmp r0, #0\n\
    bne _080081F8\n\
    movs r0, #0x80\n\
    bl CheckTalkFlag\n\
    cmp r0, #0\n\
    beq _080081B8\n\
    mov r1, r8\n\
    ldrb r1, [r1]\n\
    lsls r0, r1, #0x1e\n\
    cmp r0, #0\n\
    blt _080081F8\n\
    ldr r0, _080081B4 @ =0x0000039A\n\
    bl m4aSongNumStart\n\
    b _080081F8\n\
    .align 2, 0\n\
_080081AC: .4byte sTalkSt\n\
_080081B0: .4byte 0x030000C8\n\
_080081B4: .4byte 0x0000039A\n\
_080081B8:\n\
    bl GetTextPrintDelay\n\
    adds r4, r0, #0\n\
    cmp r4, #1\n\
    bne _080081CC\n\
    bl GetGameTime\n\
    ands r0, r4\n\
    cmp r0, #0\n\
    beq _080081F8\n\
_080081CC:\n\
    ldr r1, [r5]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    beq _080081E0\n\
    adds r0, r1, #0\n\
    adds r0, #0x82\n\
    ldrb r0, [r0]\n\
    cmp r0, #0\n\
    bne _080081F8\n\
_080081E0:\n\
    adds r0, r1, #0\n\
    adds r0, #0x82\n\
    movs r1, #1\n\
    strb r1, [r0]\n\
    mov r2, r8\n\
    ldrb r2, [r2]\n\
    lsls r0, r2, #0x1e\n\
    cmp r0, #0\n\
    blt _080081F8\n\
    ldr r0, _08008218 @ =0x0000038E\n\
    bl m4aSongNumStart\n\
_080081F8:\n\
    ldr r1, [r7]\n\
    movs r0, #0x12\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    beq _08008204\n\
    b _080080EC\n\
_08008204:\n\
    movs r0, #0x13\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, #0\n\
    bgt _0800820E_THE_END\n\
    b _080080EC\n\
_0800820E_THE_END:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08008218: .4byte 0x0000038E\n\
    .syntax divided\n\
");
}

#endif

bool sub_0800838C(ProcPtr proc)
{
    if (!sub_08009EE0() && sTalkSt->active_talk_face != 0xFF && !CheckTalkFlag(2))
    {
        if (sTalkSt->str_back == NULL)
        {
            sTalkSt->active_width = Div(GetStrTalkLen(sTalkSt->str, 0) + 7, 8) + 2;
        }
        else
        {
            sTalkSt->active_width = Div(GetStrTalkLen(sTalkSt->str_back, 0) + 7, 8) + 2;
        }

        ClearTalkBubble();
        StartTalkOpen(sTalkSt->active_talk_face, proc);
        sub_08008F6C(sTalkSt->active_talk_face, CheckTalkFlag(16));
        return TRUE;
    }
    
    if (sTalkSt->line_active >= sTalkSt->lines)
    {
        sTalkSt->instant_print = 0;
        Proc_StartBlocking(gUnk_08B90B24, proc);
        return TRUE;
    }

    if (sTalkSt->put_lines == 0)
    {
        u32 r0 = (sTalkSt->line_active + sTalkSt->top_text_num) % sTalkSt->lines;
        PutText(&sTalkText[r0], &gBg0Tm[((sTalkSt->y_text + (sTalkSt->line_active << 1)) << 5) + sTalkSt->x_text]);
        TalkBgSync(1);
        sTalkSt->put_lines = 1;
    }

    if (sTalkSt->unk_16)
    {
        SetTalkFaceMouthMove(sTalkSt->active_talk_face);
    }

    return FALSE;
}

bool TalkSpritePrepNextChar(ProcPtr proc)
{
    u8 line_active = sTalkSt->line_active;
    u8 lines = sTalkSt->lines;

    if (line_active >= lines)
    {
        sTalkSt->instant_print = 0;
        Proc_StartBlocking(ProcScr_TalkSpriteShiftClear, proc);
        return TRUE;
    }
    else
    {
        if (sTalkSt->put_lines == 0)
        {
            sTalkSt->put_lines = 1;
        }
        return FALSE;
    }
}

void LockTalk(ProcPtr proc)
{
    Proc_StartBlocking(gProcScr_TalkLock, proc);
}

bool IsTalkLocked()
{
    return Proc_Exists(gProcScr_TalkLock);
}

void ResumeTalk()
{
    Proc_EndEach(gProcScr_TalkLock);
}

void sub_080084EC()
{
    if (sTalkSt->print_color == 1)
    {
        int i;
        for (i = 0; i < sTalkSt->lines; i++)
        {
            u32 r0 = (sTalkSt->top_text_num + i) % sTalkSt->lines;
            Text_SetColor(&sTalkText[r0], 4);
        }

        sTalkSt->print_color = 4;
    }
    else
    {
        int i;
        for (i = 0; i < sTalkSt->lines; i++)
        {
            u32 r0 = (sTalkSt->top_text_num + i) % sTalkSt->lines;
            Text_SetColor(&sTalkText[r0], 1);
        }

        sTalkSt->print_color = 1;
    }
}

void TalkToggleInvertedPalette(int id)
{
    if (id != 0)
    {
        ApplyPaletteExt(Pal_TalkBubble_Inverted, 0x60, 0x20);
        ApplyPaletteExt(Pal_Text_Inverted, 0x40, 0x20);
    }
    else
    {
        ApplyPaletteExt(Pal_TalkBubble, 0x60, 0x20);
        ApplyPaletteExt(Pal_Text, 0x40, 0x20);
    }
}

int TalkInterpret(ProcPtr proc)
{
    struct Proc* unkProc;
    int i;

    while (1) {
        switch (*sTalkSt->str) {
            case 0x12:
            case 0x13:
            case 0x14:
                sTalkSt->str++;
                sTalkSt->active_width = 2 + Div(GetStrTalkLen(sTalkSt->str, sub_08009EE0()) + 7, 8);
                continue;
        }
        break;
    }

    switch (*sTalkSt->str) {
        case 0x81:
            if (sTalkSt->str[1] == 0x40) {
                sTalkSt->str += 2;

                Text_Skip(TALK_TEXT_BY_LINE(sTalkSt->line_active), 6);

                if (*(s8 *)&sTalkSt->instant_print || sTalkSt->print_delay <= 0) {
                    return 2;
                }

                unkProc = Proc_StartBlocking(gUnk_08BFFBDC, proc);
                unkProc->unk64 = GetTalkPauseCmdDuration(4);
                return 3;
            }

            return 1;

        case 0x00:
            if (sTalkSt->str_back == 0) {
                return 0;
            }

            sTalkSt->str = sTalkSt->str_back;
            sTalkSt->str += 2;
            sTalkSt->str_back = NULL;

            return TalkInterpret(proc);

        case 0x01:
            if (sTalkSt->put_lines == 1 || sTalkSt->line_active == 1) {
                sTalkSt->line_active++;
            }

            sTalkSt->put_lines = 0;
            sTalkSt->str++;
            return 2;

        case 0x02:
            if (CheckTalkFlag(TALK_FLAG_7)) {
                sub_08009708();
                sTalkSt->str++;
            } else if (!CheckTalkFlag(TALK_FLAG_INSTANTSHIFT)) {
                Proc_StartBlocking(gProcScr_TalkShiftClearAll, proc);
            } else {
                ClearTalkText();
            }

            sTalkSt->str++;
            return 3;

        case 0x03:
            StartTalkWaitForInput(
                proc,
                sTalkSt->x_text * 8 + Text_GetCursor(TALK_TEXT_BY_LINE(sTalkSt->line_active)) + 4,
                sTalkSt->y_text * 8 + sTalkSt->line_active * 16 + 8
            );

            sTalkSt->str++;

            return 3;

        case 0x04:
        case 0x05:
        case 0x06:
        case 0x07:
            if (*(s8 *)&sTalkSt->instant_print) {
                sTalkSt->str++;
                return 2;
            }

            unkProc = Proc_StartBlocking(gUnk_08BFFBDC, proc);
            unkProc->unk64 = GetTalkPauseCmdDuration(*sTalkSt->str);

            sTalkSt->str++;
            return 3;

        case 0x15:
            ClearTalkBubble();
            sTalkSt->str++;
            return 3;

        case 0x16:
            sTalkSt->unk_16 = 1 - sTalkSt->unk_16;
            sTalkSt->str++;
            return 3;

        case 0x17:
            sTalkSt->unk_17 = 1 - sTalkSt->unk_17;
            sTalkSt->str++;
            return 3;

        case 0x10:
            while (1) {
                switch (*sTalkSt->str) {
                    case 0x08:
                    case 0x09:
                    case 0x0A:
                    case 0x0B:
                    case 0x0C:
                    case 0x0D:
                    case 0x0E:
                    case 0x0F:
                        SetActiveTalkFace(*sTalkSt->str - 8);
                        sTalkSt->str++;
                        continue;

                    case 0x10:
                        sTalkSt->str++;
                        sub_08008E34(proc);
                        sTalkSt->str += 2;
                        continue;
                }
                break;
            }

            return 3;

        case 0x11:
            if (sub_08009EE0()) {
                ClearTalkBubble();
            }

            StartFaceFadeOut(sTalkSt->faces[sTalkSt->active_talk_face]);
            sTalkSt->faces[sTalkSt->active_talk_face] = 0;
            sTalkSt->str++;
            StartTemporaryLock(proc, 16);
            return 3;

        case 0x1C:
            if (CheckTalkFlag(0x10))
            {
                ClearTalkFlag(TALK_FLAG_OPAQUE);
            }
            else
            {
                SetTalkFlag(TALK_FLAG_OPAQUE);
            }
            sTalkSt->str++;
            return 3;

        case 0x08:
        case 0x09:
        case 0x0A:
        case 0x0B:
        case 0x0C:
        case 0x0D:
        case 0x0E:
        case 0x0F:
            SetTalkFaceNoMouthMove(sTalkSt->active_talk_face);

            SetActiveTalkFace(*sTalkSt->str - 8);

            while (sTalkSt->str++) {
                if (sTalkSt->str == sTalkSt->str)
                    break;
            }

            return 3;

        case 0x18:
            sub_080093CC(
                gUnk_08BFFC9C,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                1,
                sTalkSt->print_color,
                proc
            );

            sTalkSt->str++;
            return 3;

        case 0x19:
            sub_080093CC(
                gUnk_08BFFC9C,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                2,
                sTalkSt->print_color,
                proc
            );

            sTalkSt->str++;
            return 3;

        case 0x1A:
            sub_080093CC(
                gUnk_08BFFCAC,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                1,
                sTalkSt->print_color,
                proc
            );

            while (sTalkSt->str++) {
                if (sTalkSt->str == sTalkSt->str)
                    break;
            }

            return 3;

        case 0x1B:
            sub_080093CC(
                gUnk_08BFFCAC,
                TALK_TEXT_BY_LINE(sTalkSt->line_active),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + sTalkSt->line_active * 2),
                2,
                sTalkSt->print_color,
                proc
            );

            while (sTalkSt->str++) {
                if (sTalkSt->str == sTalkSt->str)
                    break;
            }

            return 3;

        case 0x80:
            switch (*++sTalkSt->str) {
                case 0x24:
                    if (sTalkSt->unk_38) {
                        sTalkSt->unk_38(proc);
                    }

                    sTalkSt->str++;
                    return 3;

                case 0x21:
                    sub_080084EC();
                    sTalkSt->str++;
                    return TalkInterpret(proc);

                case 0x00:
                case 0x01:
                case 0x02:
                case 0x03:
                    sTalkSt->print_color = *++sTalkSt->str;

                    for (i = 0; i < sTalkSt->lines; i++) {
                        Text_SetColor(sTalkText + i, sTalkSt->print_color);
                    }

                    sTalkSt->str++;
                    return 3;
                case 0x25:
                    sTalkSt->unk_83 = 3 - (sTalkSt->unk_83 & 1);
                    sTalkSt->str++;
                    return 3;

                case 0x04:
                    LockTalk(proc);
                    sTalkSt->str++;
                    return 3;

                case 0x05:
                    NumberToStringAscii(sTalkSt->number, sTalkSt->buf_number_str);

                    sTalkSt->str--;
                    sTalkSt->str_back = sTalkSt->str;
                    sTalkSt->str = sTalkSt->buf_number_str;

                    return TalkInterpret(proc);

                case 0x20:
                    sTalkSt->str_back = sTalkSt->str;
                    sTalkSt->str_back--;
                    sTalkSt->str = GetTacticianName();

                    return TalkInterpret(proc);

                case 0x06:
                    sTalkSt->str--;

                    sTalkSt->str_back = sTalkSt->str;
                    sTalkSt->str = sTalkSt->buf_unk_str;

                    return TalkInterpret(proc);
                case 0x0A:
                case 0x0B:
                case 0x0C:
                case 0x0D:
                case 0x0E:
                case 0x0F:
                case 0x10:
                case 0x11:
                    MoveTalkFace(sTalkSt->active_talk_face, *sTalkSt->str - 10);
                    SetActiveTalkFace(*sTalkSt->str - 10);

                    sTalkSt->str++;
                    return 3;

                case 0x07:
                case 0x08:
                    sTalkSt->str++;
                    return 3;

                case 0x16:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 0);
                    return 3;

                case 0x17:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 1);
                    return 3;

                case 0x18:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 3);
                    return 3;

                case 0x19:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 2);
                    return 3;

                case 0x1A:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 4);
                    return 3;

                case 0x1B:
                    sTalkSt->str++;
                    SetFaceBlinkControl(sTalkSt->faces[sTalkSt->active_talk_face], 5);
                    return 3;

                case 0x1C:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 0);
                    return 3;

                case 0x1D:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 2);
                    return 3;

                case 0x1E:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 3);
                    return 3;

                case 0x1F:
                    sTalkSt->str++;
                    SetFaceEyeState(sTalkSt->faces[sTalkSt->active_talk_face], 4);
                    return 3;

                default:
                    return 0;
            }
    }

    return 1;
}


void SetActiveTalkFace(int face)
{
    sTalkSt->active_talk_face = face;
}

void sub_08008E34(ProcPtr proc)
{
    int faceDisp = 0;
    int fid;

    if (sTalkSt->active_talk_face == TALK_FACE_NONE)
        SetActiveTalkFace(TALK_FACE_1);

    if (IsBattleDeamonActive())
        sub_0800ED68();
    else
        faceDisp |= FACE_DISP_KIND(FACE_96x80);

    if (GetTalkFaceHPos(sTalkSt->active_talk_face) <= 14)
        faceDisp |= FACE_DISP_FLIPPED;

    fid = (sTalkSt->str[0]);
    fid = (sTalkSt->str[1] * 0x100) + fid;

    if (fid == UINT16_MAX)
        fid = GetUnitPortraitId(gActiveUnit);
    else
        fid = fid - 0x100;

    if (sTalkSt->faces[sTalkSt->active_talk_face] != NULL)
    {
        sub_08007DB8(sTalkSt->faces[sTalkSt->active_talk_face], fid);
    }
    else
    {
        sTalkSt->faces[sTalkSt->active_talk_face] = StartFaceAuto(fid,
            GetTalkFaceHPos(sTalkSt->active_talk_face)*8, 80, faceDisp);

        StartFaceFadeIn(sTalkSt->faces[sTalkSt->active_talk_face]);

        sub_08008F6C(sTalkSt->active_talk_face, CheckTalkFlag(0x10));
        StartTemporaryLock(proc, 8);
    }
}

struct FaceProc * StartTalkFace(int fid, int x, int y, int disp, int talk_face)
{
    return sTalkSt->faces[talk_face] = StartFaceAuto(fid, x, y, disp);
}

int GetFaceIdByXPos(int x)
{
    int i;

    for (i = 0; i < 4; ++i)
    {
        if (gFaces[i] == NULL)
            continue;

        if (gFaces[i]->x_disp == x)
            return i;
    }

    return -1;
}

void sub_08008F6C(int talk_face, int toBack)
{
    int i;

    int argLayer, otherLayer;
    int iStart, iEnd;

    if (toBack)
    {
        argLayer = 6;
        otherLayer = 5;
    }
    else
    {
        argLayer = 5;
        otherLayer = 6;
    }

    switch (talk_face)
    {

    case TALK_FACE_0 ... TALK_FACE_2:
    default:
        iStart = TALK_FACE_0;
        iEnd = TALK_FACE_2;

        break;

    case TALK_FACE_3 ... TALK_FACE_5:
        iStart = TALK_FACE_3;
        iEnd = TALK_FACE_5;

        break;

    }

    for (i = iStart; i <= iEnd; ++i)
    {
        if (!sTalkSt->faces[i])
            continue;

        if (i == talk_face)
            sTalkSt->faces[i]->sprite_layer = argLayer;
        else
            sTalkSt->faces[i]->sprite_layer = otherLayer;
    }
}

void MoveTalkFace(int talkFaceFrom, int talkFaceTo)
{
    struct FaceProc * face;
    bool isSwap = FALSE;

    if (sTalkSt->faces[talkFaceTo] != NULL)
    {
        isSwap = TRUE;
        StartTalkFaceMove(talkFaceTo, talkFaceFrom, isSwap);
    }

    StartTalkFaceMove(talkFaceFrom, talkFaceTo, isSwap);

    face = sTalkSt->faces[talkFaceFrom];
    sTalkSt->faces[talkFaceFrom] = sTalkSt->faces[talkFaceTo];
    sTalkSt->faces[talkFaceTo] = face;
}

bool IsTalkFaceMoving()
{
    if (Proc_Find(gProcScr_TalkFaceMove) != NULL)
        return TRUE;

    return FALSE;
}

void StartTalkFaceMove(int talkFaceFrom, int talkFaceTo, bool isSwap)
{
    struct Proc * proc;

    int slot = GetFaceIdByXPos(GetTalkFaceHPos(talkFaceFrom) * 8);

    if (slot == -1)
        return;

    proc = Proc_Start(gProcScr_TalkFaceMove, gFaces[slot]);

    proc->unk64 = slot;
    proc->unk66 = talkFaceTo;
    proc->unk68 = gFaces[slot]->x_disp;
    proc->unk6A = isSwap;
}

void TalkFaceMove_OnInit(struct Proc * proc)
{
    proc->unk58 = 0;

    if (((proc->unk68 - GetTalkFaceHPos(proc->unk66)*8) < 0)
        ? (GetTalkFaceHPos(proc->unk66)*8 - proc->unk68) > 24
        : (proc->unk68 - GetTalkFaceHPos(proc->unk66)*8) > 24)
    {
        proc->unk5C = 32;
    }
    else
    {
        proc->unk5C = 16;
    }
}

void TalkFaceMove_OnIdle(struct Proc * proc)
{
    if (proc->unk5C > 16)
    {
        if (proc->unk58 == proc->unk5C / 8)
            gFaces[proc->unk64]->y_disp++;

        if (proc->unk58 == proc->unk5C / 2)
            gFaces[proc->unk64]->y_disp--;

        if (proc->unk58 == proc->unk5C * 5 / 8)
            gFaces[proc->unk64]->y_disp++;
    }
    else
    {
        if (proc->unk58 == proc->unk5C / 2)
            gFaces[proc->unk64]->y_disp++;
    }

    if (proc->unk58 >= proc->unk5C)
    {
        gFaces[proc->unk64]->y_disp--;
        Proc_Break(proc);
    }
    else
    {
        gFaces[proc->unk64]->x_disp = Interpolate(INTERPOLATE_RSQUARE,
            proc->unk68, GetTalkFaceHPos(proc->unk66)*8,
            proc->unk58++, proc->unk5C);
    }
}

void Talk_OnEnd(struct Proc * proc)
{
    Proc_EndEach(gProcScr_TalkSkipListener);
    Proc_EndEach(gProcScr_TalkShiftClearAll);
}

void TalkPause_OnIdle(struct Proc * proc)
{
    if (proc->unk64 == 0)
    {
        Proc_Break(proc);
        return;
    }

    proc->unk64--;
}

void TalkWaitForInput_OnIdle(struct Proc * proc)
{
    int frame = (GetGameTime() / 2) % 0x10;

    if (!CheckTalkFlag(0x80))
    {
        PutSprite(2,
            proc->unk64, proc->unk66,
            gUnk_08B90A8C[frame], OAM2_CHR(4));
    }
    else
    {
        PutSprite(0,
            proc->unk64, proc->unk66,
            gUnk_08B90A8C[frame], OAM2_CHR(0x2BF) + OAM2_PAL(11));
    }

    if (gpKeySt->pressed & 0xf3)
        Proc_Break(proc);
}

void nullsub_24()
{
}

void StartTalkWaitForInput(struct Proc * parent, int x, int y)
{
    struct Proc * proc = Proc_StartBlocking(gProcScr_TalkWaitForInput, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = 0;
}

void StartTalkWaitForInputUnk(ProcPtr parent, int x, int y, int z)
{
    struct Proc * proc = Proc_StartBlocking(gProcScr_TalkWaitForInput, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = z;
}

void sub_0800931C(struct Proc * proc)
{
    TmFillRect(&gBg0Tm[((sTalkSt->y_text + 4) << 5) + sTalkSt->x_text],
        sTalkSt->active_width-2, sTalkSt->lines*2, 0);

    TalkBgSync(BG0_SYNC_BIT);

    proc->unk64 = 0;

    if (sTalkSt->line_active == 0)
    {
        proc->unk66 = 16;
    }
    else if (sTalkSt->line_active + 1 >= sTalkSt->lines)
    {
        proc->unk66 = sTalkSt->lines * 16;
    }
    else
    {
        proc->unk66 = (sTalkSt->line_active + 1) * 16;
    }
}

void TalkShiftClearAll_OnIdle(struct Proc * proc)
{
    proc->unk64++;

    SetBgOffset(0, 0, proc->unk64);

    if (proc->unk64 >= proc->unk66)
    {
        SetBgOffset(0, 0, 0);
        ClearPutTalkText();

        Proc_Break(proc);
    }
}

void sub_080093CC(struct TalkChoiceEnt const * choices, struct Text * text, u16 * tm, int defaultChoice, int color, struct Proc * parent)
{
    struct TalkChoiceProc * proc;

    int x = Text_GetCursor(text) + 16;

    Text_InsertDrawString(text, x,      color, DecodeMsg(choices[0].msg));
    Text_InsertDrawString(text, x + 40, color, DecodeMsg(choices[1].msg));

    PutText(text, tm);

    TalkBgSync(BG0_SYNC_BIT);

    proc = Proc_StartBlocking(gUnk_08B90B0C, parent);

    proc->selectedChoice = defaultChoice;

    proc->x_disp = (((tm - gBg0Tm) & 0x1F) * 8) - gDispIo.bg_off[0].x + x;
    proc->y_disp = (((tm - gBg0Tm) / 0x20) * 8) - gDispIo.bg_off[0].y;

    proc->choices = choices;

    if (proc->choices[defaultChoice - 1].onSwitch)
        proc->choices[defaultChoice - 1].onSwitch();
}

void sub_08009480(struct TalkChoiceProc * proc)
{
    if (gpKeySt->pressed & 2)
    {
        PlaySoundEffect(0x38B);

        sTalkChoiceResult = 0;

        Proc_Break(proc);
        return;
    }
    else if (gpKeySt->pressed & 1)
    {
        PlaySoundEffect(0x38A);

        sTalkChoiceResult = proc->selectedChoice;

        Proc_Break(proc);
        return;
    }

    if ((gpKeySt->pressed & 32) && (proc->selectedChoice == 2))
    {
        PlaySoundEffect(0x387);

        proc->selectedChoice = 1;

        if (proc->choices[0].onSwitch)
            proc->choices[0].onSwitch();
    }

    if ((gpKeySt->pressed & 16) && (proc->selectedChoice == 1))
    {
        PlaySoundEffect(0x387);

        proc->selectedChoice = 2;

        if (proc->choices[1].onSwitch)
            proc->choices[1].onSwitch();
    }

    PutUiHand(proc->x_disp + (proc->selectedChoice - 1) * 40 - 4, proc->y_disp);
}

void sub_08009588(struct Proc * proc)
{
    TmFillRect_thm(&gBg0Tm[((sTalkSt->y_text + 4) << 5) + sTalkSt->x_text],
        sTalkSt->active_width - 2, sTalkSt->lines * 2, 0);
    TalkBgSync(1);
    proc->unk64 = 0;
}

void sub_080095C8(struct Proc * proc)
{
    proc->unk64++;

    SetBgOffset(0, 0, proc->unk64);

    if (proc->unk64 >= 16)
    {
        int i;

        sTalkSt->line_active--;
        sTalkSt->top_text_num++;

        SetBgOffset(0, 0, 0);

        for (i = 0; i < sTalkSt->lines - 1; ++i)
        {
            PutText(TALK_TEXT_BY_LINE(i),
                gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + 2*i));
        }

        TmFillRect(gBg0Tm + TM_OFFSET(sTalkSt->x_text, sTalkSt->y_text + (sTalkSt->lines - 1)*2),
            sTalkSt->active_width - 2, 2, 0);

        ClearText(TALK_TEXT_BY_LINE(sTalkSt->lines - 1));
        Text_SetColor(TALK_TEXT_BY_LINE(sTalkSt->lines - 1), sTalkSt->print_color);

        TalkBgSync(BG0_SYNC_BIT);

        Proc_Break(proc);
    }
}

void TalkSpriteShiftClear_Init(struct Proc * proc)
{
    CleanTalkObjects(0x200, 0x1A, 0x44444444, proc);
}


void sub_080096D4(ProcPtr proc)
{
    sTalkSt->line_active--;

    SpriteText_DrawBackground(sTalkText + 1);

    Text_SetColor(sTalkText + 1, TEXT_COLOR_4DEF);
    Text_SetCursor(sTalkText + 1, 4);
}

void sub_08009708()
{
    int i;

    sTalkSt->line_active = 0;

    for (i = 0; i < 2; i++)
    {
        SpriteText_DrawBackground(&sTalkText[i]);

        Text_SetColor(&sTalkText[i], TEXT_COLOR_4DEF);
        Text_SetCursor(&sTalkText[i], 4);
    }
}

int GetTalkPauseCmdDuration(int cmd)
{
    return gTalkPauseDurations[cmd - 4];
}

void ClearTalkBubble()
{
    sTalkSt->speak_talk_face = -1;
    TmFill(gBg1Tm, 0);
    TalkBgSync(2);
    ClearPutTalkText();
    SetWinEnable(0, 0, 0);
}

void ClearPutTalkText()
{
    int i;

    TmFill(gBg0Tm, 0);
    TalkBgSync(BG0_SYNC_BIT);

    sTalkSt->line_active = 0;
    sTalkSt->unk_82 = 0;
    sTalkSt->put_lines = 0;
    sTalkSt->top_text_num = 0;

    for (i = 0; i < sTalkSt->lines; ++i)
    {
        ClearText(sTalkText + i);
        Text_SetColor(sTalkText + i, sTalkSt->print_color);
    }
}

void ClearTalkText()
{
    int i;

    sTalkSt->line_active = FALSE;
    sTalkSt->unk_82 = 0;
    sTalkSt->put_lines = 0;
    sTalkSt->top_text_num = 0;

    for (i = 0; i < sTalkSt->lines; i++)
    {
        ClearText(sTalkText + i);
        Text_SetColor(sTalkText + i, sTalkSt->print_color);
    }
}

void PutTalkBubble(int xAnchor, int yAnchor, int width, int height)
{
    int xTail;
    int kind;
    int tmp;
    int x, y;

    xTail = 0;

    x = 0;
    y = 0;

    TmFill(gBg1Tm, 0);

    if (xAnchor < 16)
        kind = 0;
    else
        kind = 1;

    if (IsBattleDeamonActive())
        kind += 2;

    y = yAnchor - height + 1;

    switch (kind)
    {

    case 0:
        xTail = xAnchor + 3;

        tmp = xTail - width / 2;

        if (tmp <= 0)
            x = 1;
        else
            x = tmp;

        break;

    case 1:
        xTail = xAnchor - 5;

        tmp = xTail + (width + 1) / 2;

        if (tmp > 29)
            x = 29 - width;
        else
            x = xTail - width / 2;

        break;

    case 2:
        x = 9;
        y = 14;

        width = 20;
        xTail = x - 1;
        yAnchor = y + 2;

        break;

    case 3:
        x = 1;
        y = 14;

        width = 20;
        xTail = x + width - 1;
        yAnchor = y + 2;

        break;
    }

    sTalkSt->x_text = x + 1;
    sTalkSt->y_text = y + 1;

    PutTalkBubbleTm(1, x, y, width, height);
    
    if (sTalkSt->unk_83 & 2)
    {
        TalkToggleInvertedPalette(sTalkSt->unk_83 & 1);

        sTalkSt->unk_83 ^= 2;
    }
    
    if (!(sTalkSt->unk_83 & 1))
    {
        PutTalkBubbleTail(1, xTail, yAnchor, kind);
    }

    sub_08009A10(x, y, width, height);

    StartOpenTalkBubble();

    TalkBgSync(BG1_SYNC_BIT);
}

void StartOpenTalkBubble()
{
    struct Proc * proc = Proc_Start(gProcScr_TalkBubbleOpen, (ProcPtr)3);
    proc->unk64 = 0;
}

void TalkBubbleOpen_OnIdle(struct Proc * proc)
{
    u8 const * gUnk_0818F93C[] =
    {
        gUnk_083FBF80,
        gUnk_083FBF30,
        gUnk_083FBEDC,
        gUnk_083FBE80,
        gUnk_083FBDDC,
        Img_TalkBubble ,
        NULL,
    };

    if ((proc->unk64++) & 1)
        return;

    Decompress(gUnk_0818F93C[proc->unk64 >> 1],
        (u8 *) VRAM + GetBgChrOffset(1) + 0x10 * CHR_SIZE);

    if (gUnk_0818F93C[(proc->unk64 >> 1) + 1] == NULL)
        Proc_Break(proc);
}

void sub_08009A10(int x, int y, int width, int height)
{
    SetWinEnable(1, 0, 0);

    SetWin0Box((x + 1) * 8, (y + 1) * 8, (x + width - 1) * 8, (y + height - 1) * 8);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);
}

#define TALK_TM_INDEX(x, y) ((x) + ((y) << 5))

void PutTalkBubbleTail(int bg, int x, int y, int kind)
{

    u16* buf = GetBgTilemap(bg);

    switch (kind) {
        case 0:
            // _0800851C
            buf[TALK_TM_INDEX(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TALK_TM_INDEX(x + 1, y    )] = TILEREF(0x10 + 4, 3) + 0x400;
            buf[TALK_TM_INDEX(x    , y + 1)] = TILEREF(0x10 + 6, 3) + 0x400;
            buf[TALK_TM_INDEX(x + 1, y + 1)] = TILEREF(0x10 + 5, 3) + 0x400;

            break;

        case 1:
            // _08008550
            buf[TALK_TM_INDEX(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TALK_TM_INDEX(x + 1, y    )] = TILEREF(0x10 + 4, 3) + 0x400;
            buf[TALK_TM_INDEX(x    , y + 1)] = TILEREF(0x10 + 5, 3);
            buf[TALK_TM_INDEX(x + 1, y + 1)] = TILEREF(0x10 + 6, 3);

            break;

        case 2:
            // _08008588
            buf[TALK_TM_INDEX(x    , y    )] = TILEREF(0x10 + 8, 3) + 0x400;
            buf[TALK_TM_INDEX(x    , y + 1)] = TILEREF(0x10 + 9, 3) + 0x400;
            buf[TALK_TM_INDEX(x + 1, y    )] = TILEREF(0x10 + 7, 3) + 0x400;
            buf[TALK_TM_INDEX(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + 0x400 + 0x800;

            break;

        case 3:
            // _080085BC
            buf[TALK_TM_INDEX(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TALK_TM_INDEX(x    , y + 1)] = TILEREF(0x10 + 7, 3) + 0x800;
            buf[TALK_TM_INDEX(x + 1, y    )] = TILEREF(0x10 + 8, 3);
            buf[TALK_TM_INDEX(x + 1, y + 1)] = TILEREF(0x10 + 9, 3);

            break;

        case 4:
            // _080085F4
            buf[TALK_TM_INDEX(x    , y    )] = TILEREF(0x10 + 9, 3) + 0x400 + 0x800;
            buf[TALK_TM_INDEX(x    , y + 1)] = TILEREF(0x10 + 8, 3) + 0x400 + 0x800;
            buf[TALK_TM_INDEX(x + 1, y    )] = TILEREF(0x10 + 7, 3) + 0x400;
            buf[TALK_TM_INDEX(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + 0x400 + 0x800;

            break;

        case 5:
            // _0800862C
            buf[TALK_TM_INDEX(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TALK_TM_INDEX(x    , y + 1)] = TILEREF(0x10 + 7, 3) + 0x800;
            buf[TALK_TM_INDEX(x + 1, y    )] = TILEREF(0x10 + 9, 3) + 0x800;
            buf[TALK_TM_INDEX(x + 1, y + 1)] = TILEREF(0x10 + 8, 3) + 0x800;

            break;
    }

    return;
}

#undef TALK_TM_INDEX


void PutTalkBubbleTm(int id, int x, int y, int width, int height)
{
    int i, j;

    u16 * tilemap = GetBgTilemap(id);
    width--;
    height--;

    for (i = x; i < x + width; ++i)
    {
        tilemap[TM_OFFSET_(i, y)]          = TILEREF(0x10 + 1, BGPAL_TALK_BUBBLE);
        tilemap[TM_OFFSET_(i, y + height)] = TILEREF(0x10 + 1, BGPAL_TALK_BUBBLE) + TILE_VFLIP;
    }

    for (i = y; i < y + height; ++i)
    {
        tilemap[TM_OFFSET_(x, i)]         = TILEREF(0x10 + 2, BGPAL_TALK_BUBBLE);
        tilemap[TM_OFFSET_(x + width, i)] = TILEREF(0x10 + 2, BGPAL_TALK_BUBBLE) + TILE_HFLIP;
    }

    for (i = x + 1; i < x + width; ++i)
        for (j = y + 1; j < y + height; ++j)
            tilemap[TM_OFFSET(i, j)] = TILEREF(0x10 + 3, BGPAL_TALK_BUBBLE);

    tilemap[TM_OFFSET_(x,         y)]          = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE);
    tilemap[TM_OFFSET_(x + width, y)]          = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_HFLIP;
    tilemap[TM_OFFSET_(x,         y + height)] = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_VFLIP;
    tilemap[TM_OFFSET_(x + width, y + height)] = TILEREF(0x10 + 0, BGPAL_TALK_BUBBLE) + TILE_HFLIP + TILE_VFLIP;
}

void TalkOpen_OnEnd()
{
}

void TalkOpen_InitBlend(struct Proc* proc)
{
    proc->unk58 = 0;

    if (!CheckTalkFlag(0x100))
    {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);

        SetBlendBackdropB(1);

        gDispIo.win_ct.win0_enable_blend = 1;
        gDispIo.win_ct.wout_enable_blend = 1;

        SetBlendAlpha(0, 0x10);
    }
}

void TalkOpen_PutTalkBubble(struct Proc* proc)
{
    PutTalkBubble(proc->unk64, proc->unk66, proc->unk68, proc->unk6A);
    Proc_Break(proc);
}

void TalkOpen_OnIdle(struct Proc* proc)
{
    int var;

    proc->unk58++;

    var = Interpolate(4, -30, 0, proc->unk58, 12);
    SetBgOffset(1, 0, var / 2);

    if (!CheckTalkFlag(0x100))
    {
        SetBlendAlpha(var/2 + 0x10, 1 - var/2);
    }

    if (proc->unk58 == 12)
    {
        Proc_Break(proc);
    }
}

int GetTalkFaceHPos(int talk_face);
void StartTalkOpen(int talk_face, struct Proc* parent)
{
    struct Proc* proc = Proc_StartBlocking(gProcScr_TalkOpen, parent);

    proc->unk64 = GetTalkFaceHPos(talk_face);
    proc->unk66 = 8;
    proc->unk68 = sTalkSt->active_width;
    proc->unk6A = 6;

    if (proc->unk64 < 0)
        proc->unk64 = 0;

    if (proc->unk64 > 29)
        proc->unk64 = 30;

    sTalkSt->speak_talk_face = talk_face;
    sTalkSt->speak_width = sTalkSt->active_width;
}

bool sub_08009EE0()
{
    if (sTalkSt->speak_talk_face == sTalkSt->active_talk_face && sTalkSt->speak_width == sTalkSt->active_width)
    {
        return TRUE;
    }

    return FALSE;
}

int GetTalkFaceHPos(int talk_face)
{
    if (IsBattleDeamonActive())
    {
        if (talk_face < 3)
        {
            return 4;
        }
        else
        {
            return 0x1a;
        }
    }
    else
    {
        return gTalkFaceHPosLut[talk_face];
    }
}

void SetTalkFaceDisp(int talk_face, int faceDisp)
{
    int gUnk_0818F958[] = { 0, FACE_DISP_SMILE };
    int disp;

    if (talk_face == TALK_FACE_NONE)
        return;

    disp = GetFaceDisp(sTalkSt->faces[talk_face]);
    disp &= ~(FACE_DISP_SMILE | FACE_DISP_TALK_1 | FACE_DISP_TALK_2);

    SetFaceDisp(sTalkSt->faces[talk_face], disp | faceDisp | gUnk_0818F958[sTalkSt->unk_17]);
}

void SetTalkFaceMouthMove(int face)
{
    SetTalkFaceDisp(face, 0x10);
}

void SetTalkFaceNoMouthMove(int face)
{
    SetTalkFaceDisp(face, 0);
}

bool IsTalkActive(void)
{
    return Proc_Exists(ProcScr_Talk);
}

bool FaceExists(void)
{
    return Proc_Exists(ProcScr_Face);
}

int GetTalkChoiceResult(void)
{
    return sTalkChoiceResult;
}

void SetTalkChoiceResult(int res)
{
    sTalkChoiceResult = res;
}

void SetTalkNumber(int number)
{
    sTalkSt->number = number;
}

void SetTalkUnkStr(char* buffer)
{
    strcpy(sTalkSt->buf_unk_str, buffer);
}

void PrintStringToTexts(struct Text ** texts, char const * str, u16 * tm, int unk)
{
    int uh;

    int line = 0;

    while (1) {
        uh = 0;

        switch (*str) {
            case 0:
                uh += 1;
                break;

            case 1:
                PutText(texts[line], tm + line * 0x40);

                line++;
                str++;

                if (line >= unk) {
                    return;
                }

                break;
        }

        if (uh != 0) {
            break;
        }

        str = Text_DrawCharacter(texts[line], str);
        continue;
    }

    PutText(texts[line], tm + line * 0x40);
}

void TalkPutSpriteText_OnIdle(struct Proc * proc)
{
    PutSprite(3,
        proc->x, proc->y, gSprite_TalkTextBack,
        OAM2_CHR(proc->unk52) | OAM2_PAL(proc->unk64));

    PutSprite(3,
        proc->x, proc->y, gSprite_TalkTextFront,
        OAM2_CHR(proc->unk52) | OAM2_PAL(sTalkFont.palid));
}

void ClearPrimaryHBlank()
{
    SetOnHBlankA(0);
}

void TalkPutSpriteText_OnEnd()
{
    CallDelayed(&ClearPrimaryHBlank, 1);
}

int GetStrTalkLen(char const * str, bool isBubbleOpen)
{
    char buf[0x20];
    int chrLen;

    int speakFace = sTalkSt->speak_talk_face;
    int activeFace = sTalkSt->active_talk_face;

    int currentLineLen = 0;
    int maxLineLen = 24;

    while (1) {
        switch (*str) {
            case 0x00:
                if (currentLineLen > maxLineLen) {
                    maxLineLen = currentLineLen;
                }

                currentLineLen = 0;

                goto end;

            case 0x01:
            case 0x02:
                if (currentLineLen > maxLineLen) {
                    maxLineLen = currentLineLen;
                }

                currentLineLen = 0;

                str++;

                break;

            case 0x04:
            case 0x05:
            case 0x06:
            case 0x07:
            case 0x16:
            case 0x17:
            case 0x1C:
                str++;
                break;

            case 0x03:
                currentLineLen += 12;
                str++;
                break;

            case 0x08:
            case 0x09:
            case 0x0A:
            case 0x0B:
            case 0x0C:
            case 0x0D:
            case 0x0E:
            case 0x0F:
                activeFace = *str - 0x08;
                str++;
                break;

            case 0x10:
                while (1) {
                    switch (*str) {
                        case 0x08:
                        case 0x09:
                        case 0x0A:
                        case 0x0B:
                        case 0x0C:
                        case 0x0D:
                        case 0x0E:
                        case 0x0F:
                            activeFace = *str - 0x08;
                            str++;

                            continue;

                        case 0x10:
                            str += 3;

                            continue;
                    }

                    break;
                }

                break;

            case 0x11:
                if (activeFace == speakFace) {
                    if (currentLineLen > maxLineLen) {
                        maxLineLen = currentLineLen;
                    }

                    currentLineLen = 0;

                    goto end;
                }

                str++;

                break;

            case 0x12:
            case 0x13:
            case 0x14:
            case 0x15:
                if (!isBubbleOpen) {
                    if (currentLineLen > maxLineLen) {
                        maxLineLen = currentLineLen;
                    }

                    currentLineLen = 0;

                    goto end;
                }

                str++;

                break;

            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
                currentLineLen += 0x50;
                str++;
                break;

            case 0x80:
                str++;

                switch (*str) {
                    case 0x00:
                    case 0x01:
                    case 0x02:
                    case 0x03:
                    case 0x04:
                    case 0x07:
                    case 0x08:
                    case 0x09:
                    case 0x16:
                    case 0x17:
                    case 0x18:
                    case 0x19:
                    case 0x1A:
                    case 0x1B:
                    case 0x1C:
                    case 0x1D:
                    case 0x1E:
                    case 0x1F:
                    case 0x21:
                    case 0x24:
                    case 0x25:
                        str++;
                        break;

                    case 0x05:
                        NumberToStringAscii(sTalkSt->number, buf);
                        currentLineLen += GetStrTalkLen(buf, isBubbleOpen);

                        str++;
                        break;

                    case 0x20:
                        currentLineLen += GetStringTextLen(GetTacticianName());

                        str++;
                        break;

                    case 0x06:
                        currentLineLen += GetStrTalkLen(sTalkSt->buf_unk_str, isBubbleOpen);

                        str++;
                        break;

                    case 0x0A:
                    case 0x0B:
                    case 0x0C:
                    case 0x0D:
                    case 0x0E:
                    case 0x0F:
                    case 0x10:
                    case 0x11:
                        activeFace = *str - 0x0A;
                        str++;

                        break;

                    default:
                        break;

                }

                break;

            case 0x81:
                if (str[1] == 0x40) {
                    str += 2;
                    currentLineLen += 6;
                    break;
                }

                // fallthrough

            default:
                if ((activeFace != speakFace) && (activeFace != 0xFF)) {
                    if (!isBubbleOpen) {
                        isBubbleOpen = 1;
                        speakFace = activeFace;
                    } else {
                        if (currentLineLen > maxLineLen) {
                            maxLineLen = currentLineLen;
                        }

                        currentLineLen = 0;

                        goto end;
                    }
                }

                str = GetCharTextLen(str, &chrLen);

                currentLineLen += chrLen;
        }
    }

end:
    return maxLineLen;
}


bool GetZero()
{
    return false;
}

void sub_0800A4EC()
{
}


void sub_800A390();

void sub_800A3A4(struct Proc* proc);

void StartTalkDebug();

void sub_800A3B8(struct Proc* proc);

void sub_800A3C8(struct Proc* proc);

void TalkBgSync(int bits)
{
	if (!CheckTalkFlag(0x20))
	{
		EnableBgSync(bits);
	}
}

SECTION(".rodata.08B909BC")
const struct ProcCmd gProcScr_TalkSkipListener[] = {
    PROC_MARK(5),
    PROC_REPEAT(TalkSkipListener_OnIdle),
    PROC_END,
};

SECTION(".rodata.08B909D4")
const struct ProcCmd ProcScr_Talk[] = {
    PROC_MARK(5),
    PROC_SET_END_CB(Talk_OnEnd),
    PROC_SLEEP(1),
    PROC_CALL(Talk_OnInit),
    PROC_REPEAT(Talk_Loop),
    PROC_END,
};

SECTION(".rodata.08B90A2C")
const struct ProcCmd gUnk_08BFFBDC[] = {
    PROC_MARK(5),
    PROC_SLEEP(1),
    PROC_REPEAT(TalkPause_OnIdle),
    PROC_END,
};

SECTION(".rodata.08B90A4C")
const struct ProcCmd gProcScr_TalkWaitForInput[] = {
    PROC_MARK(5),
    PROC_SLEEP(8),
    PROC_REPEAT(TalkWaitForInput_OnIdle),
    PROC_SLEEP(1),
    PROC_END,
};

SECTION(".rodata.08B90ACC")
const struct ProcCmd gProcScr_TalkShiftClearAll[] = {
    PROC_MARK(5),
    PROC_CALL(sub_0800931C),
    PROC_REPEAT(TalkShiftClearAll_OnIdle),
    PROC_END,
};

SECTION(".rodata.08B90B0C")
const struct ProcCmd gUnk_08B90B0C[] = {
    PROC_SLEEP(8),
    PROC_REPEAT(sub_08009480),
    PROC_END,
};

SECTION(".rodata.08B90B24")
const struct ProcCmd gUnk_08B90B24[] = {
    PROC_MARK(5),
    PROC_CALL(sub_08009588),
    PROC_REPEAT(sub_080095C8),
    PROC_SLEEP(1),
    PROC_END,
};

SECTION(".rodata.08B90B4C")
const struct ProcCmd ProcScr_TalkSpriteShiftClear[] = {
    PROC_MARK(5),
    PROC_CALL(TalkSpriteShiftClear_Init),
    PROC_SLEEP(0),
    PROC_CALL(sub_080096D4),
    PROC_SLEEP(1),
    PROC_END,
};

SECTION(".rodata.08B90B8C")
const struct ProcCmd gProcScr_TalkBubbleOpen[] = {
    PROC_REPEAT(TalkBubbleOpen_OnIdle),
    PROC_END,
};

// gProcScr_TalkFaceMove (talk.h) is this script without its first command.
SECTION(".rodata.08B90A04")
const struct ProcCmd gProcScr_TalkLock[] = {
    PROC_BLOCK,
    PROC_SLEEP(1),
    PROC_CALL(TalkFaceMove_OnInit),
    PROC_REPEAT(TalkFaceMove_OnIdle),
    PROC_END,
};

SECTION(".rodata.08B90AFC")
const struct TalkChoiceEnt gUnk_08BFFCAC[] = {
    { .msg = 3, .onSwitch = TalkChoice_OnBuy },
    { .msg = 4, .onSwitch = TalkChoice_OnSell },
};

SECTION(".rodata.08B90A8C")
const u16 * const gUnk_08B90A8C[] = {
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A74,
    gUnk_08B90A7C,
    gUnk_08B90A84,
    gUnk_08B90A84,
    gUnk_08B90A84,
    gUnk_08B90A84,
    gUnk_08B90A7C,
};

SECTION(".rodata.08B90C50")
const struct ProcCmd ProcScr_TalkPutSpriteText[] = {
    PROC_SET_END_CB(TalkPutSpriteText_OnEnd),
    PROC_REPEAT(TalkPutSpriteText_OnIdle),
    PROC_END,
};


