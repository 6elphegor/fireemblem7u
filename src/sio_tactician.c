#include "gbafe.h"
#include "gbafe/sio_core.h"

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
    PROC_REPEAT(sub_0803F950),
    PROC_CALL(sub_0803F990),
    PROC_REPEAT(sub_0803F9BC),
    PROC_GOTO(0),
    PROC_LABEL(3),
    PROC_CALL(NameSelect_DrawName),
    PROC_REPEAT(sub_0803FA3C),
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
                    u8 * str = (conf->str + j * 3)[k];

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
            u8 * str = conf->str[proc->line_idx * 3];

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
    Decompress(Img_TacticianSelObj, (void *)0x06014800);
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
void sub_0803F950(struct ProcTactician * proc)
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
void sub_0803F9BC(struct ProcTactician * proc)
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
void sub_0803FA3C(struct ProcTactician * proc)
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
