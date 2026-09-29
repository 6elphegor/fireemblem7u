#include "gbafe.h"
#include "gbafe/sio_core.h"

extern const u8 gUnk_081D504C[];
extern const u8 gUnk_081D5050[];
extern const u8 gUnk_081D5054[];
extern const u8 gUnk_081D5058[];
extern const u8 gUnk_081D505C[];
extern const u8 gUnk_081D5060[];
extern const u8 gUnk_081D5064[];
extern const u8 gUnk_081D5068[];
extern const u8 gUnk_081D506C[];
extern const u8 gUnk_081D5070[];
extern const u8 gUnk_081D5074[];
extern const u8 gUnk_081D5078[];
extern const u8 gUnk_081D507C[];
extern const u8 gUnk_081D5080[];
extern const u8 gUnk_081D5084[];
extern const u8 gUnk_081D5088[];
extern const u8 gUnk_081D508C[];
extern const u8 gUnk_081D5090[];
extern const u8 gUnk_081D5094[];
extern const u8 gUnk_081D5098[];
extern const u8 gUnk_081D509C[];
extern const u8 gUnk_081D50A0[];
extern const u8 gUnk_081D50A4[];
extern const u8 gUnk_081D50A8[];
extern const u8 gUnk_081D50AC[];
extern const u8 gUnk_081D50B0[];
extern const u8 gUnk_081D50B4[];
extern const u8 gUnk_081D50B8[];
extern const u8 gUnk_081D50BC[];
extern const u8 gUnk_081D50C0[];
extern const u8 gUnk_081D50C4[];
extern const u8 gUnk_081D50C8[];
extern const u8 gUnk_081D50CC[];
extern const u8 gUnk_081D50D0[];
extern const u8 gUnk_081D50D4[];
extern const u8 gUnk_081D50D8[];
extern const u8 gUnk_081D50DC[];
extern const u8 gUnk_081D50E0[];
extern const u8 gUnk_081D50E4[];
extern const u8 gUnk_081D50E8[];
extern const u8 gUnk_081D50EC[];
extern const u8 gUnk_081D50F0[];
extern const u8 gUnk_081D50F4[];
extern const u8 gUnk_081D50F8[];
extern const u8 gUnk_081D50FC[];
extern const u8 gUnk_081D5100[];
extern const u8 gUnk_081D5104[];
extern const u8 gUnk_081D5108[];
extern const u8 gUnk_081D510C[];
extern const u8 gUnk_081D5110[];
extern const u8 gUnk_081D5114[];
extern const u8 gUnk_081D5118[];
extern const u8 gUnk_081D511C[];
extern const u8 gUnk_081D5120[];
extern const u8 gUnk_081D5124[];
extern const u8 gUnk_081D5128[];
extern const u8 gUnk_081D512C[];
extern const u8 gUnk_081D5130[];
extern const u8 gUnk_081D5134[];
extern const u8 gUnk_081D5138[];
extern const u8 gUnk_081D513C[];
extern const u8 gUnk_081D5140[];
extern const u8 gUnk_081D5144[];
extern const u8 gUnk_081D5148[];
extern const u8 gUnk_081D514C[];
extern const u8 gUnk_081D5150[];
extern const u8 gUnk_081D5154[];
extern const u8 gUnk_081D5158[];
extern const u8 gUnk_081D515C[];
extern const u8 gUnk_081D5160[];
extern const u8 gUnk_081D5164[];
extern const u8 gUnk_081D5168[];

// FE8U: sio_tactician.c

extern const struct TacticianTextConf gTacticianTextConf[];

extern const s16 SioTacticianIndexMap[];

extern const int gLinkArenaStatusMsg[];

extern struct Text Texts_0203DB14[];
extern struct Text Text_0203DB14;
extern struct Font Font_0203DB64;
extern u8 gUnk_Sio_0203DD24;
extern u8 gUnknown_03001810;
extern const u8 Img_TacticianSelObj[];
extern const u16 Pal_TacticianSelObj[];
extern const u16 Pal_085ADE68[];
extern const u8 Tsa_085AE190[];
extern const char gSioStr_BackEntry[];
extern const u8 gUnknown_081D527E[];
void * memcpy(void * dst, const void * src, unsigned long n);

void InitSioBG(void);
void sub_08047CA8(void);
void sub_08049220(void);
void StartLinkArenaTitleBanner(ProcPtr parent, int size);
void sub_08047E84(u8 * str, int len, int x, int y, int palId, ProcPtr parent);
ProcPtr StartNameEntrySpriteDraw(ProcPtr parent, int x, int y);
void UpdateNameEntrySpriteDraw(void * proc, int xNew, int yNew, int xPointer, int cursorKind, int f);
void PutLinkArenaChoiceBannerSprite(int x, int y);

void FE6Link_Init(ProcPtr proc);
void Set_0203DDDC(ProcPtr proc);

CONST_DATA struct ProcCmd ProcScr_TacticianNameSelection[] = {
    PROC_YIELD,
    PROC_CALL(Tactician_InitScreen),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,
    PROC_CALL(FE6Link_Init),
    PROC_LABEL(0),
    PROC_REPEAT(Tactician_Loop),
    PROC_GOTO(2),
    PROC_LABEL(1),
    PROC_CALL(sub_0803F938),
    PROC_REPEAT(TacticianNameSelection_Loop_B),
    PROC_CALL(sub_0803F990),
    PROC_REPEAT(TacticianNameSelection_Loop_C),
    PROC_GOTO(0),
    PROC_LABEL(3),
    PROC_CALL(NameSelect_DrawName),
    PROC_REPEAT(TacticianNameSelection_Loop_D),
    PROC_GOTO(0),
    PROC_LABEL(2),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_YIELD,
    PROC_CALL(sub_0803FB24),
    PROC_END,
};

//! FE8U = 0x08044550
const struct TacticianTextConf * GetTacticianTextConf(s16 idx)
{
    return gTacticianTextConf + idx;
}

void sub_0803F0F4(struct ProcTactician * proc, u8 * str_buf)
{
    int i;
    int j;
    int k;

    int idx = 0;

    for (; *str_buf != 0 ; str_buf++)
    {
        for (i = 0; i <= 0x50; i++)
        {
            const struct TacticianTextConf * conf = GetTacticianTextConf(i);

            for (j = 0; j < 3; j++)
            {
                for (k = 0; k < 3; k++)
                {
                    const u8 * str = (conf->str + j * 3)[k];

                    if (*str == *str_buf)
                    {
                        proc->unk4C[idx] = ((j & 3) << 0xe) | (i & 0x3FFF);
                        proc->unk39 = k;

                        idx++;

                        goto _080445F8;
                    }
                }
            }
        }

    _080445F8:
        // need a semi-colon for modern compilers
        ; // exit loop
    }

    return;
}

void sub_0803F1A8(struct ProcTactician * proc)
{
    int i, j;

    for (i = 0; i < 5; i++)
    {
        ClearText(Texts_0203DB14 + (i + proc->text_idx * 5));
        Text_SetColor(Texts_0203DB14 + (i + proc->text_idx * 5), TEXT_COLOR_SYSTEM_WHITE);

        for (j = 0; j < 0xF; j++)
        {
            int idx = SioTacticianIndexMap[i * 15 + j];
            const struct TacticianTextConf * conf = gTacticianTextConf + idx;
            const u8 * str = conf->str[proc->line_idx * 3];

            if (*str != '\0')
            {
                Text_SetCursor(Texts_0203DB14 + (i + proc->text_idx * 5), conf->x);
                Text_DrawString(
                    Texts_0203DB14 + (i + proc->text_idx * 5),
                    conf->str[proc->line_idx * 3]
                );
            }
        }

        PutText(
            Texts_0203DB14 + (i + proc->text_idx * 5),
            gBg1Tm + TM_OFFSET(0, i * 2 + 9)
        );
    }
}

void TacticianDrawCharacters(struct ProcTactician * proc)
{
    int x;
    struct Text * text;
    const char * str = proc->str;

    ClearText(&Text_0203DB14);

    if (*str != '\0')
    {
        text = &Text_0203DB14;
        x = 0;
    
        while (*str != '\0')
        {
            Text_SetCursor(text, x);
            str = Text_DrawCharacter(text, str);
            x = x + 7;
        }
    }
    PutText(&Text_0203DB14, gBg0Tm + TM_OFFSET(12, 5));
    EnableBgSync(BG0_SYNC_BIT);
}

int SioStrLen(u8 * buf)
{
    int i = 0;
    while (*buf != '\0')
    {
        i++;
        buf++;
    }
    return i;
}

void Tactician_InitScreen(struct ProcTactician * proc)
{
    int i, char_cnt;
    char * str;
    u8 title[12];
    u8 str_buf[0xC];
    const struct TacticianTextConf * conf;

    memcpy(title, gUnknown_081D527E, 10);

    ClearSioBG();
    InitSioBG();
    Decompress(Img_TacticianSelObj, (void *)(VRAM + 0x14800));
    ApplyPalette(Pal_TacticianSelObj, 0x13);
    ApplyPalette(Pal_085ADE68, 0x14);
    sub_08047BD4(0, 0);
    TmApplyTsa_thm(gBg2Tm + TM_OFFSET(0, 8), Tsa_085AE190, 0x1000);
    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    if (CheckInLinkArena())
    {
        proc->max_len = 9;
    }
    else
    {
        gLinkArenaSt.unk_00 = 0;
        proc->max_len = 7;
    }

    for (i = 0; i < proc->max_len + 1; i++)
        proc->str[i] = '\0';

    for (i = 0; i < proc->max_len; i++)
        proc->unk4C[i] = 0;

    proc->cur_len = 0;
    InitText(&Text_0203DB14, 8);
    proc->line_idx = 2;
    proc->conf_idx = 6;

    conf = GetTacticianTextConf(6);
    proc->child1 = StartNameEntrySpriteDraw(proc, conf->x - 4, conf->y + 1);
    proc->unk39 = 0;

    for (i = 0; i < 10; i++)
        InitText(Texts_0203DB14 + i, 0x1A);

    InitText(&gLinkArenaSt.unk_64[5], 0xC);
    StartLinkArenaTitleBanner(proc->child1, 3);
    sub_08047E84(title, 10, 0, 8, gLinkArenaSt.unk_00, proc->child1);
    gUnk_Sio_0203DD24 = 0;
    proc->text_idx = 0;
    sub_0803F1A8(proc);

    if (proc->unk32 != 0)
    {
        i = 0;
        str = GetTacticianName();
        while (*str != '\0')
        {
            proc->str[i] = *str;
            str_buf[i] = *str;

            str++;
            i++;

            char_cnt = proc->cur_len + 1;
            if (char_cnt < proc->unk33)
                proc->cur_len = char_cnt;
        }
        sub_0803F0F4(proc, str_buf);
        TacticianDrawCharacters(proc);
        proc->child1->unk40 = proc->cur_len * 7;
    }
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void SioUpdateTeam(char * str, int team)
{
    int i;
    struct Unit * buffer = GetUnit(FACTION_RED + 1);
    for (i = 0; i < 5; i++)
        ClearUnit(buffer + i);

    for (i = 0; i < 5; i++)
    {
        u8 pid = gSioPidPool.pids[i];
        if (pid != 0)
        {
            struct Unit * unit = GetUnitFromCharId(pid);
            if (!(unit->state & US_NOT_DEPLOYED))
            {
                SetUnitStatus(unit, UNIT_STATUS_NONE);
                unit->state = 0;
                MemCpy(unit, buffer + i, sizeof(struct Unit));
            }
        }
    }
    WriteMultiArenaSaveTeam(team, buffer, str);
}

void Tactician_MoveHand(struct ProcTactician * proc, int pos, const struct TacticianTextConf * conf)
{
    int str_idx;
    u16 adj_idx;
    const struct TacticianTextConf * adj_conf;

    adj_idx  = conf->adj_idx[pos];
    adj_conf = gTacticianTextConf + conf->adj_idx[pos];

    str_idx = proc->line_idx * 3;

    while (*adj_conf->str[str_idx] == '\0')
    {
        adj_idx  = adj_conf->adj_idx[pos];
        adj_conf = gTacticianTextConf + adj_conf->adj_idx[pos];
    }
    proc->conf_idx = adj_idx;
}

void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    int cur_len;

    if (proc->cur_len < proc->max_len)
    {
        SioPlaySoundEffect(2);
        SioStrCpy(conf->str[proc->line_idx * 3], &proc->str[proc->cur_len]);

        proc->unk4C[proc->cur_len] = (0x3FFF & proc->conf_idx) | ((3 & proc->line_idx) << 14);
        cur_len = proc->cur_len + 1;

        if (cur_len < proc->max_len)
            proc->cur_len = cur_len;
        else
            proc->conf_idx = 5;

        TacticianDrawCharacters(proc);
        proc->unk39 = 0;
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

void TacticianTryDeleteChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    int cur_len;

    if (proc->cur_len != 0)
    {
        SioPlaySoundEffect(2);

        if (proc->unk4C[proc->cur_len] == 0)
            proc->cur_len--;

        *(proc->str + proc->cur_len) = 0;
        proc->unk4C[proc->cur_len] = 0;
        proc->unk39 = 0;

        TacticianDrawCharacters(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

void SaveTactician(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    if (proc->str[0] != '\0')
    {
        SioPlaySoundEffect(2);

        if (CheckInLinkArena())
            SioUpdateTeam(proc->str, gLinkArenaSt.unk_03);
        else
            SetTacticianName(proc->str);

        Proc_Break(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}

//! FE8U = 0x08044C54
void Tactician_LoopCore(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    if ((gpKeySt->repeated & DPAD_UP) != 0)
    {
        Tactician_MoveHand(proc, 0, conf);
    }

    if ((gpKeySt->repeated & DPAD_DOWN) != 0)
    {
        Tactician_MoveHand(proc, 1, conf);
    }

    if ((gpKeySt->repeated & DPAD_LEFT) != 0)
    {
        Tactician_MoveHand(proc, 2, conf);
    }

    if ((gpKeySt->repeated & DPAD_RIGHT) != 0)
    {
        Tactician_MoveHand(proc, 3, conf);
    }

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        switch (conf->action) {
        case 0:
            TacticianTryAppendChar(proc, conf);
            break;

        case 4:
            TacticianTryDeleteChar(proc, conf);
            break;

        case 5:
            SaveTactician(proc, conf);
            break;
        }
    }

    if ((gpKeySt->pressed & L_BUTTON) != 0)
    {
        TacticianTryDeleteChar(proc, conf);
    }

    if ((gpKeySt->pressed & START_BUTTON) != 0)
    {
        SioPlaySoundEffect(3);
        proc->conf_idx = 5;
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        if (proc->cur_len != 0)
        {
            TacticianTryDeleteChar(proc, conf);
            return;
        }

        if (CheckInLinkArena() != 0)
        {
            SioPlaySoundEffect(1);
            Proc_Goto(proc, 3);
        }
    }

    return;
}

//! FE8U = 0x08044ED8
void Tactician_Loop(struct ProcTactician * proc)
{
    char _cbuf[proc->max_len + 1];
    const struct TacticianTextConf * conf = GetTacticianTextConf(proc->conf_idx);
    proc->conf_idx_bak = proc->conf_idx;

    Tactician_LoopCore(proc, conf);
    if (proc->conf_idx_bak != proc->conf_idx)
    {
        SioPlaySoundEffect(3);
    }

    conf = GetTacticianTextConf(proc->conf_idx);
    SioStrCpy(proc->str, _cbuf);

    _cbuf[proc->max_len - 1] = 0;

    UpdateNameEntrySpriteDraw(proc->child1, conf->x - 4, conf->y + 1, SioStrLen(_cbuf) * 7, conf->kind, (proc->line_idx <= 1) ? proc->line_idx : 2);
}

//! FE8U = 0x08044F84
void sub_0803F8D8(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        return;
    }

    if (vcount < 40)
    {
        REG_BLDCNT = 0x840;
        REG_BLDALPHA = 0xF08;
    }
    else
    {
        REG_BLDCNT = 0x442;
        REG_BLDALPHA = ((15 - gUnknown_03001810) << 8) + gUnknown_03001810;
    }

    return;
}

void sub_0803F938(struct ProcTactician * proc)
{
    proc->unk3A = 0;
    SetOnHBlankA(sub_0803F8D8);
    return;
}

//! FE8U = 0x08044FFC
void TacticianNameSelection_Loop_B(struct ProcTactician * proc)
{
    gUnknown_03001810 = Interpolate(INTERPOLATE_LINEAR, 15, 0, proc->unk3A, 8);
    proc->unk3A++;

    if (proc->unk3A > 8)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0804503C
void sub_0803F990(struct ProcTactician * proc)
{
    proc->text_idx++;
    proc->text_idx &= 1;

    sub_0803F1A8(proc);
    EnableBgSync(BG1_SYNC_BIT);

    proc->unk3A = 0;

    return;
}

//! FE8U = 0x08045068
void TacticianNameSelection_Loop_C(struct ProcTactician * proc)
{
    gUnknown_03001810 = Interpolate(INTERPOLATE_LINEAR, 0, 15, proc->unk3A, 8);
    proc->unk3A++;

    if (proc->unk3A > 8)
    {
        SetOnHBlankA(NULL);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080450AC
void NameSelect_DrawName(struct ProcTactician * proc)
{
    proc->unk3B = 1;

    sub_08049220();

    ClearText(&gLinkArenaSt.unk_64[5]);

    Text_DrawString(&gLinkArenaSt.unk_64[5], gSioStr_BackEntry);
    PutText(&gLinkArenaSt.unk_64[5], gBg0Tm + TM_OFFSET(11, 12));

    EnableBgSync(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08045108
void TacticianNameSelection_Loop_D(struct ProcTactician * proc)
{
    PutLinkArenaChoiceBannerSprite(0x40, 0x58);

    if (((gpKeySt->pressed & DPAD_LEFT) != 0) && (proc->unk3B == 1))
    {
        proc->unk3B = 0;
        SioPlaySoundEffect(3);
    }

    if (((gpKeySt->pressed & DPAD_RIGHT) != 0) && (proc->unk3B == 0))
    {
        proc->unk3B = 1;
        SioPlaySoundEffect(3);
    }

    PutUiHand(proc->unk3B * 40 + 80, 96);

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        TmFillRect_thm(gBg0Tm + TM_OFFSET(11, 12), 12, 2, 0);
        EnableBgSync(BG0_SYNC_BIT);

        Proc_Break(proc);

        return;
    }

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        if (proc->unk3B == 0)
        {
            SioPlaySoundEffect(2);
            gUnk_Sio_0203DD24 = 1;
            Proc_Goto(proc, 2);
        }
        else
        {
            SioPlaySoundEffect(1);
        }

        TmFillRect_thm(gBg0Tm + TM_OFFSET(11, 12), 12, 2, 0);
        EnableBgSync(BG0_SYNC_BIT);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080451F0
void sub_0803FB24(void)
{
    if (!CheckInLinkArena())
    {
        sub_08047CA8();
    }

    return;
}

SECTION(".rodata.081D3C0C")
const struct TacticianTextConf gTacticianTextConf[] = {
    {
        .str = {
            gUnk_081D5168, gUnk_081D5168, gUnk_081D5168, gUnk_081D5168, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5168, gUnk_081D5168, gUnk_081D5168, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5168,
        },
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xCA,
        .y = 0x48,
        .kind = 1,
        .adj_idx = { 5, 2, 0x3C, 6 },
        .action = 1,
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xCA,
        .y = 0x58,
        .kind = 1,
        .adj_idx = { 1, 3, 0x41, 0xB },
        .action = 2,
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xCA,
        .y = 0x68,
        .kind = 1,
        .adj_idx = { 2, 4, 0x46, 0x10 },
        .action = 3,
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xCA,
        .y = 0x78,
        .kind = 1,
        .adj_idx = { 5, 5, 0x4B, 0x15 },
        .action = 4,
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xCA,
        .y = 0x88,
        .kind = 1,
        .adj_idx = { 4, 4, 0x50, 0x1A },
        .action = 5,
    },
    {
        .str = {
            gUnk_081D5160, gUnk_081D5168, gUnk_081D5168, gUnk_081D5160, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5160, gUnk_081D5168, gUnk_081D5168, gUnk_081D5160,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x10,
        .y = 0x48,
        .adj_idx = { 0x1A, 0xB, 4, 7 },
    },
    {
        .str = {
            gUnk_081D515C, gUnk_081D5168, gUnk_081D5168, gUnk_081D515C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D515C, gUnk_081D5168, gUnk_081D5168, gUnk_081D515C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x1A,
        .y = 0x48,
        .adj_idx = { 0x1B, 0xC, 6, 8 },
    },
    {
        .str = {
            gUnk_081D5158, gUnk_081D5168, gUnk_081D5168, gUnk_081D5158, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5158, gUnk_081D5168, gUnk_081D5168, gUnk_081D5158,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x24,
        .y = 0x48,
        .adj_idx = { 0x1C, 0xD, 7, 9 },
    },
    {
        .str = {
            gUnk_081D5154, gUnk_081D5168, gUnk_081D5168, gUnk_081D5154, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5154, gUnk_081D5168, gUnk_081D5168, gUnk_081D5154,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x2E,
        .y = 0x48,
        .adj_idx = { 0x1D, 0xE, 8, 0xA },
    },
    {
        .str = {
            gUnk_081D5150, gUnk_081D5168, gUnk_081D5168, gUnk_081D5150, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5150, gUnk_081D5168, gUnk_081D5168, gUnk_081D5150,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x38,
        .y = 0x48,
        .adj_idx = { 0x1E, 0xF, 9, 0x1F },
    },
    {
        .str = {
            gUnk_081D514C, gUnk_081D5168, gUnk_081D5168, gUnk_081D514C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D514C, gUnk_081D5168, gUnk_081D5168, gUnk_081D514C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x10,
        .y = 0x58,
        .adj_idx = { 6, 0x10, 4, 0xC },
    },
    {
        .str = {
            gUnk_081D5148, gUnk_081D5168, gUnk_081D5168, gUnk_081D5148, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5148, gUnk_081D5168, gUnk_081D5168, gUnk_081D5148,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x1A,
        .y = 0x58,
        .adj_idx = { 7, 0x11, 0xB, 0xD },
    },
    {
        .str = {
            gUnk_081D5144, gUnk_081D5168, gUnk_081D5168, gUnk_081D5144, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5144, gUnk_081D5168, gUnk_081D5168, gUnk_081D5144,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x24,
        .y = 0x58,
        .adj_idx = { 8, 0x12, 0xC, 0xE },
    },
    {
        .str = {
            gUnk_081D5140, gUnk_081D5168, gUnk_081D5168, gUnk_081D5140, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5140, gUnk_081D5168, gUnk_081D5168, gUnk_081D5140,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x2E,
        .y = 0x58,
        .adj_idx = { 9, 0x13, 0xD, 0xF },
    },
    {
        .str = {
            gUnk_081D513C, gUnk_081D5168, gUnk_081D5168, gUnk_081D513C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D513C, gUnk_081D5168, gUnk_081D5168, gUnk_081D513C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x38,
        .y = 0x58,
        .adj_idx = { 0xA, 0x14, 0xE, 0x24 },
    },
    {
        .str = {
            gUnk_081D5138, gUnk_081D5168, gUnk_081D5168, gUnk_081D5138, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5138, gUnk_081D5168, gUnk_081D5168, gUnk_081D5138,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x10,
        .y = 0x68,
        .adj_idx = { 0xB, 0x15, 4, 0x11 },
    },
    {
        .str = {
            gUnk_081D5134, gUnk_081D5168, gUnk_081D5168, gUnk_081D5134, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5134, gUnk_081D5168, gUnk_081D5168, gUnk_081D5134,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x1A,
        .y = 0x68,
        .adj_idx = { 0xC, 0x16, 0x10, 0x12 },
    },
    {
        .str = {
            gUnk_081D5130, gUnk_081D5168, gUnk_081D5168, gUnk_081D5130, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5130, gUnk_081D5168, gUnk_081D5168, gUnk_081D5130,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x24,
        .y = 0x68,
        .adj_idx = { 0xD, 0x17, 0x11, 0x13 },
    },
    {
        .str = {
            gUnk_081D512C, gUnk_081D5168, gUnk_081D5168, gUnk_081D512C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D512C, gUnk_081D5168, gUnk_081D5168, gUnk_081D512C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x2E,
        .y = 0x68,
        .adj_idx = { 0xE, 0x18, 0x12, 0x14 },
    },
    {
        .str = {
            gUnk_081D5128, gUnk_081D5168, gUnk_081D5168, gUnk_081D5128, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5128, gUnk_081D5168, gUnk_081D5168, gUnk_081D5128,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x38,
        .y = 0x68,
        .adj_idx = { 0xF, 0x19, 0x13, 0x29 },
    },
    {
        .str = {
            gUnk_081D5124, gUnk_081D5168, gUnk_081D5168, gUnk_081D5124, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5124, gUnk_081D5168, gUnk_081D5168, gUnk_081D5124,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x10,
        .y = 0x78,
        .adj_idx = { 0x10, 0x1A, 4, 0x16 },
    },
    {
        .str = {
            gUnk_081D5120, gUnk_081D5168, gUnk_081D5168, gUnk_081D5120, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5120, gUnk_081D5168, gUnk_081D5168, gUnk_081D5120,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x1A,
        .y = 0x78,
        .adj_idx = { 0x11, 0x1B, 0x15, 0x17 },
    },
    {
        .str = {
            gUnk_081D511C, gUnk_081D5168, gUnk_081D5168, gUnk_081D511C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D511C, gUnk_081D5168, gUnk_081D5168, gUnk_081D511C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x24,
        .y = 0x78,
        .adj_idx = { 0x12, 0x1C, 0x16, 0x18 },
    },
    {
        .str = {
            gUnk_081D5118, gUnk_081D5168, gUnk_081D5168, gUnk_081D5118, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5118, gUnk_081D5168, gUnk_081D5168, gUnk_081D5118,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x2E,
        .y = 0x78,
        .adj_idx = { 0x13, 0x1D, 0x17, 0x19 },
    },
    {
        .str = {
            gUnk_081D5114, gUnk_081D5168, gUnk_081D5168, gUnk_081D5114, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5114, gUnk_081D5168, gUnk_081D5168, gUnk_081D5114,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x38,
        .y = 0x78,
        .adj_idx = { 0x14, 0x1E, 0x18, 0x2E },
    },
    {
        .str = {
            gUnk_081D5110, gUnk_081D5168, gUnk_081D5168, gUnk_081D5110, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5110, gUnk_081D5168, gUnk_081D5168, gUnk_081D5110,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x10,
        .y = 0x88,
        .adj_idx = { 0x15, 6, 5, 0x1B },
    },
    {
        .str = {
            gUnk_081D510C, gUnk_081D5168, gUnk_081D5168, gUnk_081D510C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D510C, gUnk_081D5168, gUnk_081D5168, gUnk_081D510C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x1A,
        .y = 0x88,
        .adj_idx = { 0x16, 7, 0x1A, 0x1C },
    },
    {
        .str = {
            gUnk_081D5108, gUnk_081D5168, gUnk_081D5168, gUnk_081D5108, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5108, gUnk_081D5168, gUnk_081D5168, gUnk_081D5108,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x24,
        .y = 0x88,
        .adj_idx = { 0x17, 8, 0x1B, 0x1D },
    },
    {
        .str = {
            gUnk_081D5104, gUnk_081D5168, gUnk_081D5168, gUnk_081D5104, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5104, gUnk_081D5168, gUnk_081D5168, gUnk_081D5104,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x2E,
        .y = 0x88,
        .adj_idx = { 0x18, 9, 0x1C, 0x1E },
    },
    {
        .str = {
            gUnk_081D5100, gUnk_081D5168, gUnk_081D5168, gUnk_081D5100, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5100, gUnk_081D5168, gUnk_081D5168, gUnk_081D5100,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x38,
        .y = 0x88,
        .adj_idx = { 0x19, 0xA, 0x1D, 0x33 },
    },
    {
        .str = {
            gUnk_081D50FC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50FC, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50FC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50FC,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x50,
        .y = 0x48,
        .adj_idx = { 0x33, 0x24, 0xA, 0x20 },
    },
    {
        .str = {
            gUnk_081D50F8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50F8, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50F8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50F8,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x5A,
        .y = 0x48,
        .adj_idx = { 0x34, 0x25, 0x1F, 0x21 },
    },
    {
        .str = {
            gUnk_081D50F4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50F4, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50F4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50F4,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x64,
        .y = 0x48,
        .adj_idx = { 0x35, 0x26, 0x20, 0x22 },
    },
    {
        .str = {
            gUnk_081D50F0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50F0, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50F0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50F0,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x6E,
        .y = 0x48,
        .adj_idx = { 0x36, 0x27, 0x21, 0x23 },
    },
    {
        .str = {
            gUnk_081D50EC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50EC, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50EC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50EC,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x78,
        .y = 0x48,
        .adj_idx = { 0x37, 0x28, 0x22, 0x38 },
    },
    {
        .str = {
            gUnk_081D50E8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50E8, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50E8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50E8,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x50,
        .y = 0x58,
        .adj_idx = { 0x1F, 0x29, 0xF, 0x25 },
    },
    {
        .str = {
            gUnk_081D50E4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50E4, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50E4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50E4,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x5A,
        .y = 0x58,
        .adj_idx = { 0x20, 0x2A, 0x24, 0x26 },
    },
    {
        .str = {
            gUnk_081D50E0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50E0, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50E0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50E0,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x64,
        .y = 0x58,
        .adj_idx = { 0x21, 0x2B, 0x25, 0x27 },
    },
    {
        .str = {
            gUnk_081D50DC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50DC, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50DC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50DC,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x6E,
        .y = 0x58,
        .adj_idx = { 0x22, 0x2C, 0x26, 0x28 },
    },
    {
        .str = {
            gUnk_081D50D8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50D8, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50D8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50D8,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x78,
        .y = 0x58,
        .adj_idx = { 0x23, 0x2D, 0x27, 0x3D },
    },
    {
        .str = {
            gUnk_081D50D4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50D4, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50D4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50D4,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x50,
        .y = 0x68,
        .adj_idx = { 0x24, 0x2E, 0x14, 0x2A },
    },
    {
        .str = {
            gUnk_081D50D0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50D0, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50D0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50D0,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x5A,
        .y = 0x68,
        .adj_idx = { 0x25, 0x2F, 0x29, 0x2B },
    },
    {
        .str = {
            gUnk_081D50CC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50CC, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50CC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50CC,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x64,
        .y = 0x68,
        .adj_idx = { 0x26, 0x30, 0x2A, 0x2C },
    },
    {
        .str = {
            gUnk_081D50C8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50C8, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50C8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50C8,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x6E,
        .y = 0x68,
        .adj_idx = { 0x27, 0x31, 0x2B, 0x2D },
    },
    {
        .str = {
            gUnk_081D50C4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50C4, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50C4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50C4,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x78,
        .y = 0x68,
        .adj_idx = { 0x28, 0x32, 0x2C, 0x42 },
    },
    {
        .str = {
            gUnk_081D50C0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50C0, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50C0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50C0,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x50,
        .y = 0x78,
        .adj_idx = { 0x29, 0x33, 0x19, 0x2F },
    },
    {
        .str = {
            gUnk_081D50BC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50BC, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50BC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50BC,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x5A,
        .y = 0x78,
        .adj_idx = { 0x2A, 0x34, 0x2E, 0x30 },
    },
    {
        .str = {
            gUnk_081D50B8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50B8, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50B8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50B8,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x64,
        .y = 0x78,
        .adj_idx = { 0x2B, 0x35, 0x2F, 0x31 },
    },
    {
        .str = {
            gUnk_081D50B4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50B4, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50B4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50B4,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x6E,
        .y = 0x78,
        .adj_idx = { 0x2C, 0x36, 0x30, 0x32 },
    },
    {
        .str = {
            gUnk_081D50B0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50B0, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50B0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50B0,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x78,
        .y = 0x78,
        .adj_idx = { 0x2D, 0x37, 0x31, 0x47 },
    },
    {
        .str = {
            gUnk_081D50AC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50AC, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50AC, gUnk_081D5168, gUnk_081D5168, gUnk_081D50AC,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x50,
        .y = 0x88,
        .adj_idx = { 0x2E, 0x1F, 0x1E, 0x34 },
    },
    {
        .str = {
            gUnk_081D50A8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50A8, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50A8, gUnk_081D5168, gUnk_081D5168, gUnk_081D50A8,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x5A,
        .y = 0x88,
        .adj_idx = { 0x2F, 0x20, 0x33, 0x35 },
    },
    {
        .str = {
            gUnk_081D50A4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50A4, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50A4, gUnk_081D5168, gUnk_081D5168, gUnk_081D50A4,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x64,
        .y = 0x88,
        .adj_idx = { 0x30, 0x21, 0x34, 0x36 },
    },
    {
        .str = {
            gUnk_081D50A0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50A0, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D50A0, gUnk_081D5168, gUnk_081D5168, gUnk_081D50A0,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x6E,
        .y = 0x88,
        .adj_idx = { 0x31, 0x22, 0x35, 0x37 },
    },
    {
        .str = {
            gUnk_081D509C, gUnk_081D5168, gUnk_081D5168, gUnk_081D509C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D509C, gUnk_081D5168, gUnk_081D5168, gUnk_081D509C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x78,
        .y = 0x88,
        .adj_idx = { 0x32, 0x23, 0x36, 0x4C },
    },
    {
        .str = {
            gUnk_081D5098, gUnk_081D5168, gUnk_081D5168, gUnk_081D5098, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5098, gUnk_081D5168, gUnk_081D5168, gUnk_081D5098,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x90,
        .y = 0x48,
        .adj_idx = { 0x4C, 0x3D, 0x23, 0x39 },
    },
    {
        .str = {
            gUnk_081D5094, gUnk_081D5168, gUnk_081D5168, gUnk_081D5094, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5094, gUnk_081D5168, gUnk_081D5168, gUnk_081D5094,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x9A,
        .y = 0x48,
        .adj_idx = { 0x4D, 0x3E, 0x38, 0x3A },
    },
    {
        .str = {
            gUnk_081D5090, gUnk_081D5168, gUnk_081D5168, gUnk_081D5090, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5090, gUnk_081D5168, gUnk_081D5168, gUnk_081D5090,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xA4,
        .y = 0x48,
        .adj_idx = { 0x4E, 0x3F, 0x39, 0x3B },
    },
    {
        .str = {
            gUnk_081D508C, gUnk_081D5168, gUnk_081D5168, gUnk_081D508C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D508C, gUnk_081D5168, gUnk_081D5168, gUnk_081D508C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xAE,
        .y = 0x48,
        .adj_idx = { 0x4F, 0x40, 0x3A, 0x3C },
    },
    {
        .str = {
            gUnk_081D5088, gUnk_081D5168, gUnk_081D5168, gUnk_081D5088, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5088, gUnk_081D5168, gUnk_081D5168, gUnk_081D5088,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xB8,
        .y = 0x48,
        .adj_idx = { 0x50, 0x41, 0x3B, 4 },
    },
    {
        .str = {
            gUnk_081D5084, gUnk_081D5168, gUnk_081D5168, gUnk_081D5084, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5084, gUnk_081D5168, gUnk_081D5168, gUnk_081D5084,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x90,
        .y = 0x58,
        .adj_idx = { 0x38, 0x42, 0x28, 0x3E },
    },
    {
        .str = {
            gUnk_081D5080, gUnk_081D5168, gUnk_081D5168, gUnk_081D5080, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5080, gUnk_081D5168, gUnk_081D5168, gUnk_081D5080,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x9A,
        .y = 0x58,
        .adj_idx = { 0x39, 0x43, 0x3D, 0x3F },
    },
    {
        .str = {
            gUnk_081D507C, gUnk_081D5168, gUnk_081D5168, gUnk_081D507C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D507C, gUnk_081D5168, gUnk_081D5168, gUnk_081D507C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xA4,
        .y = 0x58,
        .adj_idx = { 0x3A, 0x44, 0x3E, 0x40 },
    },
    {
        .str = {
            gUnk_081D5078, gUnk_081D5168, gUnk_081D5168, gUnk_081D5078, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5078, gUnk_081D5168, gUnk_081D5168, gUnk_081D5078,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xAE,
        .y = 0x58,
        .adj_idx = { 0x3B, 0x45, 0x3F, 0x41 },
    },
    {
        .str = {
            gUnk_081D5074, gUnk_081D5168, gUnk_081D5168, gUnk_081D5074, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5074, gUnk_081D5168, gUnk_081D5168, gUnk_081D5074,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xB8,
        .y = 0x58,
        .adj_idx = { 0x3C, 0x46, 0x40, 4 },
    },
    {
        .str = {
            gUnk_081D5070, gUnk_081D5168, gUnk_081D5168, gUnk_081D5070, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5070, gUnk_081D5168, gUnk_081D5168, gUnk_081D5070,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x90,
        .y = 0x68,
        .adj_idx = { 0x3D, 0x47, 0x2D, 0x43 },
    },
    {
        .str = {
            gUnk_081D506C, gUnk_081D5168, gUnk_081D5168, gUnk_081D506C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D506C, gUnk_081D5168, gUnk_081D5168, gUnk_081D506C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x9A,
        .y = 0x68,
        .adj_idx = { 0x3E, 0x48, 0x42, 0x44 },
    },
    {
        .str = {
            gUnk_081D5068, gUnk_081D5168, gUnk_081D5168, gUnk_081D5068, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5068, gUnk_081D5168, gUnk_081D5168, gUnk_081D5068,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xA4,
        .y = 0x68,
        .adj_idx = { 0x3F, 0x49, 0x43, 0x45 },
    },
    {
        .str = {
            gUnk_081D5064, gUnk_081D5168, gUnk_081D5168, gUnk_081D5064, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5064, gUnk_081D5168, gUnk_081D5168, gUnk_081D5064,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xAE,
        .y = 0x68,
        .adj_idx = { 0x40, 0x4A, 0x44, 0x46 },
    },
    {
        .str = {
            gUnk_081D5060, gUnk_081D5168, gUnk_081D5168, gUnk_081D5060, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5060, gUnk_081D5168, gUnk_081D5168, gUnk_081D5060,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xB8,
        .y = 0x68,
        .adj_idx = { 0x41, 0x4B, 0x45, 4 },
    },
    {
        .str = {
            gUnk_081D505C, gUnk_081D5168, gUnk_081D5168, gUnk_081D505C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D505C, gUnk_081D5168, gUnk_081D5168, gUnk_081D505C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x90,
        .y = 0x78,
        .adj_idx = { 0x42, 0x4C, 0x32, 0x48 },
    },
    {
        .str = {
            gUnk_081D5058, gUnk_081D5168, gUnk_081D5168, gUnk_081D5058, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5058, gUnk_081D5168, gUnk_081D5168, gUnk_081D5058,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x9A,
        .y = 0x78,
        .adj_idx = { 0x43, 0x4D, 0x47, 0x49 },
    },
    {
        .str = {
            gUnk_081D5054, gUnk_081D5168, gUnk_081D5168, gUnk_081D5054, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5054, gUnk_081D5168, gUnk_081D5168, gUnk_081D5054,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xA4,
        .y = 0x78,
        .adj_idx = { 0x44, 0x4E, 0x48, 0x4A },
    },
    {
        .str = {
            gUnk_081D5050, gUnk_081D5168, gUnk_081D5168, gUnk_081D5050, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5050, gUnk_081D5168, gUnk_081D5168, gUnk_081D5050,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xAE,
        .y = 0x78,
        .adj_idx = { 0x45, 0x4F, 0x49, 0x4B },
    },
    {
        .str = {
            gUnk_081D504C, gUnk_081D5168, gUnk_081D5168, gUnk_081D504C, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D504C, gUnk_081D5168, gUnk_081D5168, gUnk_081D504C,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xB8,
        .y = 0x78,
        .adj_idx = { 0x46, 0x50, 0x4A, 4 },
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x90,
        .y = 0x88,
        .adj_idx = { 0x47, 0x38, 0x37, 0x4D },
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0x9A,
        .y = 0x88,
        .adj_idx = { 0x48, 0x39, 0x4C, 0x4E },
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xA4,
        .y = 0x88,
        .adj_idx = { 0x49, 0x3A, 0x4D, 0x4F },
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xAE,
        .y = 0x88,
        .adj_idx = { 0x4A, 0x3B, 0x4E, 0x50 },
    },
    {
        .str = {
            gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164, gUnk_081D5168,
            gUnk_081D5168, gUnk_081D5164, gUnk_081D5168, gUnk_081D5168, gUnk_081D5164,
            gUnk_081D5168, gUnk_081D5168,
        },
        .x = 0xB8,
        .y = 0x88,
        .adj_idx = { 0x4B, 0x3C, 0x4F, 5 },
    },
};
