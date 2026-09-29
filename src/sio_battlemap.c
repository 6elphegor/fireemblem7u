#include "gbafe.h"

// Link arena battle map (FE8U: sio_battlemap.c)

struct SioSt {
    /* 00 */ u8 unk_000;
    /* 01 */ u8 unk_001;
    /* 02 */ u16 lastSioCnt;
    /* 04 */ u16 unk_004;
    /* 06 */ s8 selfId;
};

struct SioMessage {
    /* 00 */ u8 kind;
    /* 01 */ u8 sender;
    /* 02 */ u16 param;
};

struct LinkArenaStMaybe_ec {
    u8 unk_0_0 : 1;
    u8 unk_0_1 : 1;
    u8 unk_0_2 : 1;
};

struct LinkArenaStMaybe {
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 pad_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ u8 unk_06[4];
    /* 0A */ u8 unk_0A;
    /* 0B */ u8 unk_0B;
    /* 0C */ struct Text texts[11];
    /* 64 */ struct Text unk_64[7];
    /* 9C */ u8 linking_status[4];
    /* A0 */ u8 unk_A0;
    /* A1 */ u8 unk_A1[4][19];
    /* ED */ u8 pad_ED[0x100 - 0xED];
    /* 100 */ struct LinkArenaStMaybe_ec unk_ec;
};

struct SioUnknown_0203DD90_Unk2C {
    /* 00 */ u8 unitId;
    /* 04 */ int newScore;
};

struct SioUnknown_0203DD90 {
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01; // current phase
    /* 02 */ u8 unk_02; // current cursor unit idx
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04; // attacker idx
    /* 05 */ u8 unk_05; // target idx
    /* 06 */ u8 unk_06;
    /* 07 */ u8 unk_07;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0A */ u8 unk_0A[4]; // num units alive per team
    /* 0E */ u8 unk_0E;
    /* 0F */ u8 unk_0F[4];
    /* 14 */ int currentScore[4];
    /* 24 */ u16 unk_24[4];
    /* 2C */ struct SioUnknown_0203DD90_Unk2C unk_2c[4];
};

struct SioBattleMapProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u8 pad_3C[0x54 - 0x3C];
    /* 54 */ struct MuProc * unk_54;
    /* 58 */ int unk_58;
    /* 5C */ int unk_5c;
};

struct SioProc85AA1AC {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 pad_29[0x64 - 0x29];
    /* 64 */ s16 unk_64;
};

struct SioProc85AA4CC {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
};

struct AiCombatSimulationSt {
    /* 00 */ u8 xMove;
    /* 01 */ u8 yMove;
    /* 02 */ u8 targetId;
    /* 04 */ u16 itemSlot;
    /* 08 */ u32 score;
};

struct AiState {
    /* 00 */ u8 pad_00[0x7D];
    /* 7D */ u8 combatWeightTableId;
};

extern struct SioSt * CONST_DATA gSioSt;
extern struct SioMessage gSioMsgBuf;
extern struct LinkArenaStMaybe gLinkArenaSt;
extern struct SioUnknown_0203DD90 gUnk_Sio_0203DD90;
extern char gUnk_Sio_0203DAC5[][19];
extern struct AiState gAiState;

extern const u8 gUnknown_080D9F28[][4];
extern const struct Vec2 gUnknown_080D9F48[];

extern u8 gUnknown_03001818[];
extern struct Vec2 gUnknown_0300182C;
extern int gUnknown_03001830;
extern u8 gUnknown_03001834[];
extern struct MuProc * gUnknown_03001838[];
extern u8 gUnknown_03001850[];

extern const u8 Img_LinkArena_FogUnitPlaceholder[];

extern u8 CONST_DATA gUnknown_085AA158[];
extern u8 CONST_DATA gUnknown_085AA15C[];
extern struct ProcCmd CONST_DATA gUnknown_085AA1AC[];
extern struct PopupInstruction CONST_DATA gUnknown_085AA1FC[];
extern struct PopupInstruction CONST_DATA gUnknown_085AA21C[];
extern struct ProcCmd CONST_DATA gUnknown_085AA2FC[];
extern struct ProcCmd CONST_DATA gUnknown_085AA4CC[];
extern struct ProcCmd CONST_DATA gUnknown_085AA5BC[];
extern u8 CONST_DATA gLut_LinkArenaFogPlaceholder_YOffset[];
extern struct ProcCmd CONST_DATA ProcScr_DrawLinkArenaFogPlaceholders[];
extern struct ProcCmd CONST_DATA gUnknown_085AA75C[];
extern const struct MenuDef gUnknown_085AADA0;
extern struct ProcCmd CONST_DATA ProcScr_Mu[];
extern u16 CONST_DATA EventScr_LinkArenaSurrenderPrompt[];
extern u16 CONST_DATA EventScr_LinkArenaNoDamagePrompt[];

void sub_08044AC0(ProcPtr proc);
void sub_08044AEC(struct Unit * unit);
void sub_08044B08(struct Unit * unit);
void sub_08044B24(void);
void sub_08044B34(int faction);
void sub_08044B84(void);
u16 sub_08044B98(u8 a, u8 b, u8 c, u8 d);
int sub_08044BF0(u8 target);
void sub_08044C10(u8 a, int b, u8 * c, int * xOut, int * yOut);
void sub_08044D14(void);
void sub_08044D2C(void);
void sub_08044DCC(void);
void sub_08044E2C(void);
void sub_08044ED8(void);
void sub_08044F3C(void);
void sub_08044F74(void);
void LoadLinkArenaFogPlaceholder(void);
void sub_08044FD0(void);
void sub_08044FFC(void);
void sub_08045354(u16 keys, s8 flag);
void sub_08045448(void);
bool sub_080454C0(struct Unit * unit);
void sub_08045784(ProcPtr unused);
void sub_080462A4(void);
void sub_08046464(struct Unit * unit, int idx, int * xOut, int * yOut);
int sub_08046598(struct Unit * unit);
int sub_08046600(int playerId);
bool sub_08046674(struct SioBattleMapProc * proc, int b);
int ITEMRANGEDONE_sub_804AF2C(int unused, struct Unit * unit);
void StartLinkArenaFogPlaceholders(void);
void EndLinkArenaFogPlaceholders(void);

bool sub_0803CD1C(u8 playerId);
int sub_0803CDB8(void);
s16 SioSend(const void * src, u16 len);
int SioEmitData(const u8 * src, u16 len);
int SioReceiveData(void * dst, u8 * outSenderId, bool (* verify)(void *));
void ClearSioBG(void);
void EndLinkArenaPointsBox(void);
void StartLinkArenaPointsBox(void);
void StartLinkArenaMUDeathFade(struct MuProc * muProc);
ProcPtr StartSioWarpFx(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent);
void sub_08048E0C(struct Unit * unit);

void InitTraps(void);
void InitChapterMap(int chapterId);
void RenderMap(void);
void DisableMuCamera(struct MuProc * proc);
void SetMuMoveScript(struct MuProc * proc, u8 const * script);
void SetMuScreenPosition(struct MuProc * proc, int x, int y);
void SetMuFacing(struct MuProc * proc, int facing);
void EndMu(struct MuProc * proc);
bool MuExistsActive(void);
void SetupDebugFontForOBJ(int a, int b);
bool CanUnitUseWeapon(struct Unit * unit, int item);
int GetItemAttributes(int item);
void NewBattleForecast(ProcPtr proc);
void BattleGenerateReal(struct Unit * actor, struct Unit * target);
s8 AiSimulateBattleAgainstTargetAtPosition(struct AiCombatSimulationSt * sim);
void StartAiTargetCursor(int x, int y, int kind, ProcPtr parent);
int GetUnitDisplayedSpritePalette(struct Unit * unit);
int GetFacingFromTo(int x1, int y1, int x2, int y2);

extern u16 gUnknown_03001840[];

//! FE8U = 0x08049298
void sub_08044AEC(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        gUnknown_03001840[i] = unit->items[i];
    }

    return;
}

//! FE8U = 0x080492B8
void sub_08044B08(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        unit->items[i] = gUnknown_03001840[i];
    }

    return;
}

void sub_08044B24(void)
{
    sub_08044DCC();
    RefreshUnitSprites();
    return;
}

void sub_08044B34(int faction)
{
    int current = faction;
    int next = FACTION_ID_BLUE;

    while (1)
    {
        switch (current)
        {
            case FACTION_ID_BLUE:
                next = FACTION_ID_RED;
                break;

            case FACTION_ID_GREEN:
                next = FACTION_ID_PURPLE;
                break;

            case FACTION_ID_RED:
                next = FACTION_ID_GREEN;
                break;

            case FACTION_ID_PURPLE:
                next = FACTION_ID_BLUE;
                break;

            case 0xFF:
                next = 0xFF;
                break;
        }

        if (gUnk_Sio_0203DD90.unk_0A[next] != 0 || next == 0xFF)
        {
            break;
        }

        current = next;
    }

    gUnk_Sio_0203DD90.unk_01 = next;

    return;
}

void sub_08044B84(void)
{
    gUnknown_03001834[0] = 0;
    gUnknown_03001834[1] = 0;
    gUnknown_03001834[3] = 0;
    gUnknown_03001834[2] = 0;

    return;
}

u16 sub_08044B98(u8 a, u8 b, u8 c, u8 d)
{
    sub_08044B84();

    gUnknown_03001834[0] = a;
    gUnknown_03001834[1] = b;
    gUnknown_03001834[2] = c;
    gUnknown_03001834[3] = d;

    if (gLinkArenaSt.unk_00 == 2)
    {
        return SioEmitData(gUnknown_03001834, 4);
    }

    return 0;
}

int sub_08044BF0(u8 target)
{
    int i = 0;

    for (i = 0; i < 20; i++)
    {
        if (gUnknown_03001818[i] == target)
        {
            return i;
        }
    }

#if NONMATCHING
    // Original bug: no return statement; r0 holds the last byte compared.
    return gUnknown_03001818[19];
#endif

    // BUG -- no return if > 20
}

void sub_08044C10(u8 a, int b, u8 * c, int * xOut, int * yOut)
{
    struct Unit * unit;

    u8 gUnknown_080D9FA0[8] =
    {
        MOVE_CMD_MOVE_UP,
        MOVE_CMD_HALT,

        MOVE_CMD_MOVE_LEFT,
        MOVE_CMD_HALT,

        MOVE_CMD_MOVE_DOWN,
        MOVE_CMD_HALT,

        MOVE_CMD_MOVE_RIGHT,
        MOVE_CMD_HALT,
    };

    s8 gUnknown_080D9FA8[8] =
    {
        +0, -1,
        -1, +0,
        +0, +1,
        +1, +0,
    };

    int var = sub_08044BF0(a);
    int index = Div(var, 5) << 1;

    *c = var;

    unit = GetUnit(gUnknown_03001818[var]);

    if ((unit->state & US_CONCEALED) == 0)
    {
        gUnknown_03001838[b] = StartMu(unit);
        DisableMuCamera(gUnknown_03001838[b]);
        SetMuMoveScript(gUnknown_03001838[b], gUnknown_080D9FA0 + index);
    }

    unit->state |= US_HIDDEN;

    RefreshUnitSprites();

    *xOut = unit->xPos + gUnknown_080D9FA8[index + 0];
    *yOut = unit->yPos + gUnknown_080D9FA8[index + 1];

    if ((unit->state & US_CONCEALED) != 0)
    {
        unit->xPos = *xOut;
        unit->yPos = *yOut;

        *xOut = *xOut - gUnknown_080D9FA8[index + 0];
        *yOut = *yOut - gUnknown_080D9FA8[index + 1];

        gUnknown_03001838[b] = NULL;
    }

    return;
}

void sub_08044D14(void)
{
    int i = 0;

    for (i = 0; i < 20; i++)
    {
        gUnknown_03001818[i] = 0;
    }

    return;
}

const u8 gUnknown_080D9FB0[] =
{
    4, 2, 0, 1, 3,
};

void sub_08044D2C(void)
{
    int faction;
    int i;
    int j;

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F28[gSioSt->selfId][i];

        if (!sub_0803CD1C(playerId))
        {
            continue;
        }

        faction = playerId * 0x40 + 1;

        for (j = 0; j < 5; j++)
        {
            int idx = i * 5 + j;
            int unitId = faction + gUnknown_080D9FB0[j];

            struct Unit * unit = GetUnit(unitId);

            if (unit->pCharacterData != NULL)
            {
                gUnknown_03001818[idx] = unitId;

                unit->xPos = gUnknown_080D9F48[idx].x;
                unit->yPos = gUnknown_080D9F48[idx].y;
            }
        }
    }

    return;
}

void sub_08044DCC(void)
{
    int i;

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapFog, 1);

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE + 6; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if ((unit->state & US_HIDDEN) != 0)
        {
            continue;
        }

        gBmMapUnit[unit->yPos][unit->xPos] = i;
    }

    return;
}

void sub_08044E2C(void)
{
    int i;
    int j;

    for (i = 0; i < 4; i++)
    {
        int faction;

        int playerId = gUnknown_080D9F28[gSioSt->selfId][i];

        if (!sub_0803CD1C(playerId))
        {
            continue;
        }

        faction = playerId * 0x40 + 1;

        for (j = 0; j < 5; j++)
        {
            int idx = i * 5 + j;
            int unitId = faction + gUnknown_080D9FB0[j];

            struct Unit * unit = GetUnit(unitId);

            if ((unit->pCharacterData == NULL) || ((unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) != 0))
            {
                gUnknown_03001818[idx] = 0;
            }
            else
            {
                gUnknown_03001818[idx] = unitId;
            }
        }
    }

    return;
}

void sub_08044ED8(void)
{
    CpuFill16(0, &gBmSt, sizeof(struct BmSt));

    gBmSt.flags |= BM_FLAG_LINKARENA;

    InitTraps();

    gPlaySt.faction = FACTION_GREEN;
    gPlaySt.chapterIndex = 0x41;
    gPlaySt.chapterTurnNumber = 0;

    gPlaySt.chapterVisionRange = GetChapterInfo(gPlaySt.chapterIndex)->fog;
    gPlaySt.chapterWeatherId = GetChapterInfo(gPlaySt.chapterIndex)->weather;

    InitChapterMap(0x41);

    gPlaySt.time_chapter_started = GetGameTime();

    return;
}

void sub_08044F3C(void)
{
    sub_08044ED8();
    sub_08044D14();
    sub_08044D2C();

    BmMapFill(gBmMapFog, gPlaySt.chapterVisionRange == 0);

    sub_08044DCC();

    RenderMap();

    return;
}

void sub_08044F74(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_0203DD90.unk_0A[i] = 0;
    }

    for (i = 0; i < 20; i++)
    {
        u32 a = gUnknown_03001818[i];

        if (a != 0)
        {
            gUnk_Sio_0203DD90.unk_0A[a >> 6]++;
        }
    }

    return;
}

void LoadLinkArenaFogPlaceholder(void)
{
    Decompress(Img_LinkArena_FogUnitPlaceholder, OBJ_VRAM0 + 0x240 * 0x20);
    return;
}

void sub_08044FD0(void)
{
    InitBgs(NULL);

    ApplySystemGraphics();

    ApplyUnitSpritePalettes();
    ForceSyncUnitSpriteSheet();

    LoadLinkArenaFogPlaceholder();
    InitSystemTextFont();

    gUnk_Sio_0203DD90.unk_03 = 0xff;

    return;
}

void sub_08044FFC(void)
{
    gPlaySt.cfgAnimationType = 0;

    gPlaySt.cfgAutoCursor = 1;
    gPlaySt.cfgTextSpeed = 2;
    gPlaySt.cfgGameSpeed = 0;

    gPlaySt.cfgDisableBgm = 0;
    gPlaySt.cfgDisableSoundEffects = 0;
    gPlaySt.config_window_theme = 0;

    gPlaySt.cfgBattleForecastType = 0;

    gPlaySt.cfgUnitColor = 1;

    return;
}

void sub_08045058(void)
{
    int i;
    struct Unit * unit;

    InitBgs(NULL);
    ClearSioBG();

    sub_08044F3C();
    sub_08044F74();

    gUnk_Sio_0203DD90.unk_09 = 0;
    gLinkArenaSt.unk_0B = 0;

    sub_08044B34(gUnknown_085AA158[gUnk_Sio_0203DD90.unk_00]);

    gUnk_Sio_0203DD90.unk_0E = 1;
    gUnk_Sio_0203DD90.unk_02 = 0;
    gUnk_Sio_0203DD90.unk_03 = 1;

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_0203DD90.currentScore[i] = 0;
    }

    unit = GetUnit(gUnknown_03001818[3]);

    gUnknown_0300182C.x = unit->xPos * 16;
    gUnknown_0300182C.y = unit->yPos * 16;

    SetMapCursorPosition(unit->xPos, unit->yPos);

    gBmSt.camera.x = 0;
    gBmSt.camera.y = 0;

    ApplySystemGraphics();

    ApplyUnitSpritePalettes();
    ResetUnitSprites();
    RefreshUnitSprites();

    LoadLinkArenaFogPlaceholder();
    StartLinkArenaFogPlaceholders();

    Proc_Start(ProcScr_MapTask, PROC_TREE_4);
    StartBmVSync();
    sub_08044FFC();

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_HARD;

    return;
}

void sub_08045124(void)
{
    struct Unit * unit = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);

    gUnknown_03001838[0] = StartMu(unit);

    SetMuScreenPosition(gUnknown_03001838[0], unit->xPos * 16, (unit->yPos - 1) * 16);

    DisableMuCamera(gUnknown_03001838[0]);
    SetMuFacing(gUnknown_03001838[0], 3);

    return;
}

void sub_08045170(ProcPtr proc)
{
    if ((gpKeySt->pressed & L_BUTTON) != 0)
    {
        Proc_Break(proc);
    }

    return;
}

void sub_08045194(ProcPtr parent)
{
    switch (gLinkArenaSt.unk_00)
    {
        case 1:
            if (gPlaySt.faction == FACTION_BLUE)
            {
                Proc_StartBlocking(gUnknown_085AA2FC, parent);
            }
            else
            {
                Proc_StartBlocking(gUnknown_085AA5BC, parent);
            }

            break;

        case 2:
            if (gPlaySt.faction == gSioSt->selfId)
            {
                Proc_StartBlocking(gUnknown_085AA2FC, parent);
            }
            else
            {
                Proc_StartBlocking(gUnknown_085AA4CC, parent);
            }

            break;
    }

    Proc_Break(parent);

    return;
}

void sub_080451FC(ProcPtr proc)
{
    int i = 0;

    if (gLinkArenaSt.unk_00 == 1)
    {
        if (gLinkArenaSt.unk_0B == 1)
        {
            Proc_Goto(proc, 3);
            return;
        }
    }
    else if (gLinkArenaSt.unk_0B == 2)
    {
        Proc_Goto(proc, 3);
        return;
    }

    if (gUnk_Sio_0203DD90.unk_01 == 0xFF)
    {
        Proc_Goto(proc, 2);
        return;
    }

    gPlaySt.faction = gUnk_Sio_0203DD90.unk_01;

    for (; gUnknown_03001818[i] == 0; i++)
    {
    }

    gUnk_Sio_0203DD90.unk_02 = i;
    gUnk_Sio_0203DD90.unk_03 = i + 1;

    ApplySystemObjectsGraphics();

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_0203DD90.unk_2c[i].newScore = 0;
        gUnk_Sio_0203DD90.unk_2c[i].unitId = 0;
    }

    SetupDebugFontForOBJ(-1, 9);

    return;
}

int sub_0804528C(void)
{
    int i;

    u32 ret = 4;

    u32 score = gUnk_Sio_0203DD90.currentScore[gSioSt->selfId];

    if (gLinkArenaSt.unk_ec.unk_0_1)
    {
        for (i = 0; i < 4; i++)
        {
            if (sub_0803CD1C(i) && (gSioSt->selfId == gUnk_Sio_0203DD90.unk_0F[i]))
            {
                return i;
            }
        }

        ret = 3;
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (!sub_0803CD1C(i))
            {
                ret--;
                continue;
            }

            if (gSioSt->selfId == i)
            {
                ret--;
                continue;
            }

            if (score > gUnk_Sio_0203DD90.currentScore[i])
            {
                ret--;
                continue;
            }
        }
    }

    return ret;
}

void sub_08045334(void)
{
    Proc_EndEach(ProcScr_MapTask);

    EndLinkArenaFogPlaceholders();

    BMapVSync_End();
    FadeBgmOut(1);

    return;
}

void sub_08045354(u16 keys, s8 flag)
{
    u8 r2;
    int r4;
    int r5;

    r2 = gUnk_Sio_0203DD90.unk_02;
    r5 = r2;
    gUnk_Sio_0203DD90.unk_03 = gUnk_Sio_0203DD90.unk_02;

    if ((keys & DPAD_ANY) == 0)
    {
        return;
    }

    r4 = r2 << 2;

    if ((keys & DPAD_UP) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 0];
    }
    else if ((keys & DPAD_DOWN) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 1];
    }
    else if ((keys & DPAD_LEFT) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 2];
    }
    else if ((keys & DPAD_RIGHT) != 0)
    {
        r2 = gUnknown_085AA15C[r4 + 3];
    }

    r5 = r2 - r5;

    if ((gUnk_Sio_0203DD90.unk_03 == 0) && ((keys & DPAD_LEFT) != 0))
    {
        r5 = -1;
    }

    if ((gUnk_Sio_0203DD90.unk_03 == 19) && ((keys & DPAD_DOWN) != 0))
    {
        r5 = +1;
    }

    while (1)
    {
        if (gUnknown_03001818[r2] != 0)
        {
            if (flag == 0 || (gUnknown_03001818[r2] >> 6) != gSioSt->selfId)
            {
                goto _end;
            }
        }

        if (r5 < 0)
        {
            r2--;

            if (r2 == 0xFF)
            {
                r2 = 19;
            }
        }
        else
        {
            r2++;
            r2 = r2 % 20;
        }
    }

_end:
    gUnk_Sio_0203DD90.unk_02 = r2;

    return;
}

void sub_08045448(void)
{
    struct Unit * unitA;
    struct Unit * unitB;

    if (gUnk_Sio_0203DD90.unk_02 == gUnk_Sio_0203DD90.unk_03)
    {
        return;
    }

    unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_03]);
    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_02]);

    if (unitA != NULL)
    {
        EndAllMus();
        ShowUnitSprite(unitA);
    }

    if (unitB == NULL)
    {
        return;
    }

    if ((unitB->state & US_UNSELECTABLE) != 0)
    {
        return;
    }

    if ((gUnknown_03001818[gUnk_Sio_0203DD90.unk_02] >> 6) != gSioSt->selfId)
    {
        return;
    }

    DisableMuCamera(StartMu(unitB));
    HideUnitSprite(unitB);

    return;
}

bool sub_080454C0(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = unit->items[i];

        if ((GetItemAttributes(item) & IA_WEAPON) == 0)
        {
            continue;
        }

        if (CanUnitUseWeapon(unit, item) == 1)
        {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_08045500(ProcPtr proc)
{
    if (gUnk_Sio_0203DD90.unk_09 >= gLinkArenaSt.unk_A0 * 3)
    {
        EndLinkArenaPointsBox();
        StartEvent(EventScr_LinkArenaNoDamagePrompt);
        Proc_Goto(proc, 3);
    }

    Proc_Break(proc);

    return;
}

void sub_08045540(ProcPtr proc)
{
    if (sub_0803CDB8() < 8)
    {
        Proc_Break(proc);
    }

    return;
}

void sub_08045558(struct SioBattleMapProc * proc)
{
    int x;
    int y;

    u8 gUnknown_080D9FB5[2] =
    {
        MOVE_CMD_MOVE_UP,
        MOVE_CMD_HALT,
    };

    u8 previous = gUnk_Sio_0203DD90.unk_02;

    sub_08045448();
    sub_08045354(gpKeySt->repeated, 0);

    gActiveUnitId = gUnknown_03001818[gUnk_Sio_0203DD90.unk_02];
    gActiveUnit = GetUnit(gActiveUnitId);

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        if (((gActiveUnitId >> 6) == gSioSt->selfId) && (sub_080454C0(gActiveUnit) == 1))
        {
            PlaySoundEffect(0x389);
            EndAllMus();

            gUnknown_03001838[0] = StartMu(gActiveUnit);
            DisableMuCamera(gUnknown_03001838[0]);
            SetMuMoveScript(gUnknown_03001838[0], gUnknown_080D9FB5);

            proc->unk_2c = gActiveUnit->xPos;
            proc->unk_30 = gActiveUnit->yPos - 1;
            gActiveUnit->state |= US_HIDDEN;

            sub_08044B24();

            gUnk_Sio_0203DD90.unk_04 = gUnk_Sio_0203DD90.unk_02;

            sub_08045354(0x40, 1);
            sub_08044B98(1, gActiveUnitId, 0, 0);

            Proc_Goto(proc, 5);
            return;
        }

        PlaySoundEffect(0x38C);
    }

    if ((gpKeySt->pressed & R_BUTTON) != 0)
    {
        if ((gActiveUnit->state & US_CONCEALED) == 0)
        {
            EndAllMus();
            Proc_Goto(proc, 4);
            return;
        }
    }

    if ((gpKeySt->pressed & START_BUTTON) != 0)
    {
        EndLinkArenaPointsBox();

        if (!gPlaySt.cfgDisableSoundEffects)
        {
            m4aSongNumStart(0x388);
            StartEvent(EventScr_LinkArenaSurrenderPrompt);
        }

        Proc_Goto(proc, 2);

        return;
    }

    x = gActiveUnit->xPos * 16;
    y = gActiveUnit->yPos * 16;

    SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    if (GetGameTime() - 1 == gUnknown_03001830)
    {
        x = (x + gUnknown_0300182C.x) >> 1;
        y = (y + gUnknown_0300182C.y) >> 1;
    }

    gUnknown_0300182C.x = x;
    gUnknown_0300182C.y = y;

    gUnknown_03001830 = GetGameTime();

    PutMapCursor(x, y, 0);

    if (previous != gUnk_Sio_0203DD90.unk_02)
    {
        PlaySoundEffect(0x385);
    }

    return;
}

void sub_08045784(ProcPtr unused)
{
    StartLinkArenaPointsBox();
    return;
}

void sub_08045790(struct SioBattleMapProc * proc)
{
    int x;
    int y;

    u8 previous = gUnk_Sio_0203DD90.unk_02;

    sub_08045354(gpKeySt->repeated, 1);

    gActiveUnitId = gUnknown_03001818[gUnk_Sio_0203DD90.unk_02];

    gActiveUnit = GetUnit(gActiveUnitId);
    x = gActiveUnit->xPos * 16;
    y = gActiveUnit->yPos * 16;

    SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    if (GetGameTime() - 1 == gUnknown_03001830)
    {
        x = (x + gUnknown_0300182C.x) >> 1;
        y = (y + gUnknown_0300182C.y) >> 1;
    }

    gUnknown_0300182C.x = x;
    gUnknown_0300182C.y = y;

    gUnknown_03001830 = GetGameTime();

    PutMapCursor(x, y, 0);

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        PlaySoundEffect(0x389);

        sub_08044C10(
            gUnknown_03001818[gUnk_Sio_0203DD90.unk_02], 1, &gUnk_Sio_0203DD90.unk_05, &proc->unk_34, &proc->unk_38);
        sub_08044B98(3, gUnknown_03001818[gUnk_Sio_0203DD90.unk_05], gActiveUnitId, 0);
        EndLinkArenaPointsBox();

        Proc_Goto(proc, 7);

        return;
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        PlaySoundEffect(0x38B);

        EndMu(gUnknown_03001838[0]);
        GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04])->state &= ~US_HIDDEN;

        sub_08044B24();

        gUnk_Sio_0203DD90.unk_02 = gUnk_Sio_0203DD90.unk_04;
        gUnk_Sio_0203DD90.unk_03 = gUnk_Sio_0203DD90.unk_04 + 1;

        sub_08044B98(2, gActiveUnitId, gUnknown_03001818[gUnk_Sio_0203DD90.unk_04], 0);

        Proc_Goto(proc, 1);

        return;
    }

    if ((gpKeySt->pressed & R_BUTTON) != 0)
    {
        if ((gActiveUnit->state & US_CONCEALED) == 0)
        {
            EndAllMus();
            Proc_Goto(proc, 6);
            return;
        }
    }

    if (previous != gUnk_Sio_0203DD90.unk_02)
    {
        PlaySoundEffect(0x385);
    }

    return;
}

void sub_08045960(struct SioProc85AA1AC * proc)
{
    ResetTextFont();

    gUnk_Sio_0203DD90.unk_06 = 0xff;

    gActiveUnit = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    sub_08044AEC(gActiveUnit);

    proc->unk_64 = GetGameLock();
    ApplyIconPalettes(4);

    StartMenu(&gUnknown_085AADA0);

    return;
}

void sub_080459B0(struct SioProc85AA1AC * proc)
{
    if (proc->unk_64 != GetGameLock())
    {
        return;
    }

    if (gUnk_Sio_0203DD90.unk_06 == 0)
    {
        sub_08044B08(gActiveUnit);
        Proc_End(proc);
    }

    Proc_Break(proc);

    return;
}

void sub_080459F0(struct SioProc85AA1AC * proc)
{
    u16 item = gActiveUnit->items[gUnk_Sio_0203DD90.unk_07];

    proc->unk_64 = GetGameLock();

    if ((GetItemMinRange(item) == 1) && (GetItemMaxRange(item) == 1))
    {
        gUnk_Sio_0203DD90.unk_06 = 1;
        return;
    }

    if ((GetItemMinRange(item) == 2) && (GetItemMaxRange(item) == 2))
    {
        gUnk_Sio_0203DD90.unk_06 = 2;
        return;
    }

    if ((GetItemMinRange(item) == 2) && (GetItemMaxRange(item) == 3))
    {
        gUnk_Sio_0203DD90.unk_06 = 2;
        return;
    }

    item = GetUnitEquippedWeapon(GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]));

    if (item == 0)
    {
        gUnk_Sio_0203DD90.unk_06 = 1;
        return;
    }

    if (GetItemMinRange(item) >= 2)
    {
        gUnk_Sio_0203DD90.unk_06 = 2;
        return;
    }

    gUnk_Sio_0203DD90.unk_06 = 1;
    ApplyIconPalettes(4);

    return;
}

void sub_08045AB8(struct SioProc85AA1AC * proc)
{
    int tmp = 0;
    int local_24 = +1;

    struct Unit * unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    struct Unit * unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    if (proc->unk_64 == GetGameLock())
    {
        int y = unitB->yPos + 1;

        if (gBmMapTerrain[y][unitB->xPos] != 0x17)
        {
            local_24 = -1;
        }

        if (gUnk_Sio_0203DD90.unk_06 == 0)
        {
            sub_08044B08(gActiveUnit);
            Proc_Goto(proc, 0);
        }
        else
        {
            EquipUnitItemSlot(gActiveUnit, gUnk_Sio_0203DD90.unk_07);

            if ((unitB->state & US_CONCEALED) == 0)
            {
                NewBattleForecast(proc);
                tmp = (gUnk_Sio_0203DD90.unk_06 == 2) ? 1 : 0;
                BattleGenerateSimulation(unitA, unitB, unitB->xPos + tmp, unitB->yPos + local_24, 0);
                UpdateBattleForecastContents();
                sub_08044B08(gActiveUnit);
                Proc_Break(proc);
            }
            else
            {
                sub_08044B08(gActiveUnit);
                Proc_Goto(proc, 1);
            }
        }
    }
    return;
}

void sub_08045BC8(ProcPtr proc)
{
    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        PlaySoundEffect(0x38A);
        CloseBattleForecast();

        Proc_Break(proc);

        return;
    }

    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        PlaySoundEffect(0x38B);
        CloseBattleForecast();

        Proc_Goto(proc, 0);
    }

    return;
}

void sub_08045C38(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_085AA1AC, parent);
    Proc_Break(parent);
    return;
}

void sub_08045C54(struct SioBattleMapProc * proc)
{
    struct Unit * unit = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    ClearUi();

    if (gUnk_Sio_0203DD90.unk_06 == 0)
    {
        if ((unit->state & US_CONCEALED) == 0)
        {
            EndMu(gUnknown_03001838[1]);
        }
        else
        {
            unit->xPos = proc->unk_34;
            unit->yPos = proc->unk_38;
        }

        unit->state &= ~US_HIDDEN;

        RefreshUnitSprites();

        gUnk_Sio_0203DD90.unk_02 = gUnk_Sio_0203DD90.unk_05;
        gUnk_Sio_0203DD90.unk_03 = gUnk_Sio_0203DD90.unk_05 + 1;
        sub_08044B98(4, 0, gUnknown_03001818[gUnk_Sio_0203DD90.unk_05], 0);
        sub_08045784(proc);
        Proc_Goto(proc, 5);
    }
    else
    {
        if ((unit->state & US_CONCEALED) != 0)
        {
            gUnknown_03001838[1] = (void *)StartMu(unit);
            proc->unk_34 = unit->xPos;
            proc->unk_38 = unit->yPos;
            unit->state &= ~US_CONCEALED;
        }

        sub_08044B98(5, 0, gUnk_Sio_0203DD90.unk_06, gUnk_Sio_0203DD90.unk_07);
    }

    return;
}

void sub_08045D24(struct SioBattleMapProc * proc)
{
    struct Unit * unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    struct Unit * unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    unitA->xPos = proc->unk_2c;
    unitA->yPos = proc->unk_30;

    unitB->xPos = proc->unk_34;
    unitB->yPos = proc->unk_38;

    StartSioWarpFx(unitA, gUnknown_03001838[0], 6, 5, 1, 1, proc);
    StartSioWarpFx(unitB, gUnknown_03001838[1], 8, 5, 0, 0, proc);

    return;
}

void sub_08045DA8(void)
{
    struct Unit * unitB;
    struct Unit * unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);

    u8 gUnknown_080D9FB7[2] =
    {
        MOVE_CMD_MOVE_RIGHT,
        MOVE_CMD_HALT,
    };

    EndMu(gUnknown_03001838[1]);

    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);
    unitB->state &= ~US_HIDDEN;

    if (gUnknown_03001834[2] == 1)
    {
        SetMuMoveScript(gUnknown_03001838[0], gUnknown_080D9FB7);
        unitA->xPos = 7;
    }

    sub_08044B24();

    return;
}

void sub_08045E18(ProcPtr proc)
{
    struct Unit * unitA;
    struct Unit * unitB;

    if (MuExistsActive() == 1)
    {
        return;
    }

    unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    HideUnitSprite(unitA);

    gActionSt.id = 2;
    gActionSt.target = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    EquipUnitItemSlot(unitA, gUnknown_03001834[3]);
    BattleGenerateReal(unitA, unitB);

    gBmSt.flags |= BM_FLAG_LINKARENA;

    Proc_StartBlocking(gUnknown_085AA75C, proc);
    Proc_Break(proc);

    return;
}

void sub_08045EA8(ProcPtr proc)
{
    u8 unitIdA = gUnknown_03001818[gUnk_Sio_0203DD90.unk_04];
    u8 unitIdB = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    struct Unit * unitA = GetUnit(unitIdA);
    struct Unit * unitB = GetUnit(unitIdB);

    LoadLinkArenaFogPlaceholder();

    gUnk_Sio_0203DD90.unk_2c[unitIdA >> 6].newScore = gBattleActor.expGain;
    gUnk_Sio_0203DD90.unk_2c[unitIdA >> 6].unitId = unitIdA;
    unitA->exp = 0;

    gUnk_Sio_0203DD90.unk_2c[unitIdB >> 6].newScore = gBattleTarget.expGain;
    gUnk_Sio_0203DD90.unk_2c[unitIdB >> 6].unitId = unitIdB;
    unitB->exp = 0;

    sub_08048E0C(unitA);
    sub_08048E0C(unitB);

    SetUnitStatus(unitA, 0);
    SetUnitStatus(unitB, 0);

    EndAllMus();

    if (GetUnitCurrentHp(unitA) != 0)
    {
        ShowUnitSprite(unitA);
        unitA->state &= ~US_HIDDEN;
    }

    sub_08044B24();
    SetBgOffset(2, 0, 0);

    if ((GetUnitCurrentHp(unitA) == gBattleActor.hpInitial) && (GetUnitCurrentHp(unitB) == gBattleTarget.hpInitial))
    {
        gUnk_Sio_0203DD90.unk_09++;
    }
    else
    {
        gUnk_Sio_0203DD90.unk_09 = 0;
    }

    Proc_Break(proc);

    return;
}

void sub_08045FC4(ProcPtr proc)
{
    u8 unitIdA = gUnknown_03001818[gUnk_Sio_0203DD90.unk_04];
    u8 unitIdB = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    struct Unit * unitA = GetUnit(unitIdA);
    struct Unit * unitB = GetUnit(unitIdB);

    s8 flag = 0;

    int indexA = sub_08044BF0(unitIdA);
    int indexB = sub_08044BF0(unitIdB);

    gUnknown_03001838[1] = NULL;
    gUnknown_03001838[0] = NULL;

    if (((unitA->state & (US_DEAD | US_BIT16)) != 0) || (unitA->pCharacterData == NULL))
    {
        gUnk_Sio_0203DD90.unk_0A[unitIdA >> 6]--;
    }
    else
    {
        gUnknown_03001838[0] = (void *)StartMu(unitA);
        DisableMuCamera(gUnknown_03001838[0]);

        unitA->state |= US_HIDDEN;

        flag = 1;

        StartSioWarpFx(
            unitA, gUnknown_03001838[0], gUnknown_080D9F48[indexA].x, gUnknown_080D9F48[indexA].y, 2, flag, proc);
    }

    if (((unitB->state & (US_DEAD | US_BIT16)) != 0) || (unitB->pCharacterData == NULL))
    {
        gUnk_Sio_0203DD90.unk_0A[unitIdB >> 6]--;
    }
    else
    {
        gUnknown_03001838[1] = (void *)StartMu(unitB);
        DisableMuCamera(gUnknown_03001838[1]);

        unitB->state |= US_HIDDEN;

        if (!flag)
        {
            flag = 1;
        }
        else
        {
            flag = 0;
        }

        StartSioWarpFx(
            unitB, gUnknown_03001838[1], gUnknown_080D9F48[indexB].x, gUnknown_080D9F48[indexB].y, 2, flag, proc);
    }

    sub_08044B24();

    Proc_Break(proc);

    return;
}

void sub_08046114(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        int j;
        int countA;
        int countB;

        if (sub_0803CD1C(i) == 0)
        {
            continue;
        }

        countA = 0;
        countB = 0;

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit;

            if (gUnknown_03001818[i + j * 5] == 0)
            {
                continue;
            }

            countB++;

            unit = GetUnit(gUnknown_03001818[i + j * 5]);

            if ((unit->state & (US_DEAD | US_BIT16)) != 0)
            {
                continue;
            }

            if (sub_080454C0(unit) == 1)
            {
                countA++;
            }
        }

        if ((countA == 0) && (countB != 0))
        {
            gUnk_Sio_0203DD90.unk_0A[i] = 0;
        }
    }

    return;
}

void sub_080461A4(ProcPtr proc)
{
    u8 r4_;

    u8 r6 = gUnknown_03001818[gUnk_Sio_0203DD90.unk_04];
    u8 r7 = gUnknown_03001818[gUnk_Sio_0203DD90.unk_05];

    struct Unit * r4 = GetUnit(r6);
    struct Unit * r2 = GetUnit(r7);

    if ((r4->state & (US_DEAD | US_BIT16)) == 0)
    {
        r4->state &= ~US_HIDDEN;
    }

    if ((r2->state & (US_DEAD | US_BIT16)) == 0)
    {
        r2->state &= ~US_HIDDEN;
    }

    if (gUnk_Sio_0203DD90.unk_0A[r6 >> 6] == 0)
    {
        r4_ = r6 >> 6;
    }
    else if (gUnk_Sio_0203DD90.unk_0A[r7 >> 6] == 0)
    {
        r4_ = r7 >> 6;
    }
    else
    {
        goto _end;
    }

    gUnk_Sio_0203DD90.unk_0F[gLinkArenaSt.unk_A0 - gUnk_Sio_0203DD90.unk_0E] = r4_;
    gUnk_Sio_0203DD90.unk_0E++;

    if (gUnk_Sio_0203DD90.unk_0E == gLinkArenaSt.unk_A0)
    {

        if (gUnk_Sio_0203DD90.unk_0A[r6 >> 6] != 0)
        {
            r4_ = r6 >> 6;
        }
        else
        {
            r4_ = r7 >> 6;
        }

        gUnk_Sio_0203DD90.unk_0F[0] = r4_;

        sub_08044B34(0xff);

        Proc_Break(proc);

        return;
    }

_end:
    sub_08044B34(gPlaySt.faction);
    Proc_Break(proc);

    return;
}

void sub_08046288(void)
{
    EndAllMus();
    EndAllMus();

    sub_08044DCC();
    sub_08044E2C();

    RefreshUnitSprites();

    return;
}

void sub_080462A4(void)
{
    if ((gpKeySt->pressed & B_BUTTON) != 0)
    {
        gSioMsgBuf.kind = 0xD4;
        gSioMsgBuf.sender = gSioSt->selfId;
        gSioMsgBuf.param = 0;
        SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
    }

    return;
}

bool sub_080462DC(void * data)
{
    u8 * cast = data;

    switch (cast[0])
    {
        case 1:
        case 6:
        case 7:
            return TRUE;
    }

    return FALSE;
}

void sub_080462F8(struct SioProc85AA4CC * proc)
{
    u8 buf[4];

    u16 got = SioReceiveData(gUnknown_03001834, buf, sub_080462DC);

    if (got != 0)
    {
        switch (gUnknown_03001834[0])
        {
            case 1:
                sub_08044C10(gUnknown_03001834[1], 0, &gUnk_Sio_0203DD90.unk_04, &proc->unk_2c, &proc->unk_30);
                Proc_Goto(proc, 1);

                break;

            case 6:
                EndLinkArenaPointsBox();
                SioStrCpy(gUnk_Sio_0203DAC5[buf[0]], gUnknown_03001850);
                NewPopup_Simple(gUnknown_085AA1FC, 0x60, 0, 0);

                Proc_Goto(proc, 3);

                break;

            case 7:
                EndLinkArenaPointsBox();
                NewPopup_Simple(gUnknown_085AA21C, 0x60, 0, 0);

                Proc_Goto(proc, 4);

                break;
        }
    }

    sub_080462A4();

    return;
}

bool sub_080463B4(void * data)
{
    u8 * cast = data;

    switch (cast[0])
    {
        case 2:
        case 3:
            return TRUE;
    }

    return FALSE;
}

void sub_080463C8(struct SioProc85AA4CC * proc)
{
    struct Unit * unit;
    u8 buf[4];

    u16 got = SioReceiveData(gUnknown_03001834, buf, sub_080463B4);

    if (got != 0)
    {
        switch (gUnknown_03001834[0])
        {
            case 2:
                unit = GetUnit(gUnknown_03001834[2]);

                if ((unit->state & US_CONCEALED) == 0)
                {
                    EndMu(gUnknown_03001838[0]);
                }
                else
                {
                    unit->xPos = proc->unk_2c;
                    unit->yPos = proc->unk_30;
                }

                unit->state &= 0xfffffffe;

                RefreshUnitSprites();

                Proc_Goto(proc, 0);

                break;

            case 3:
                sub_08044C10(gUnknown_03001834[1], 1, &gUnk_Sio_0203DD90.unk_05, &proc->unk_34, &proc->unk_38);
                Proc_Goto(proc, 2);
                break;
        }
    }

    sub_080462A4();

    return;
}

void sub_08046464(struct Unit * unit, int idx, int * xOut, int * yOut)
{
    gUnknown_03001838[idx] = StartMu(unit);

    *xOut = unit->xPos;
    *yOut = unit->yPos;

    unit->state &= ~US_CONCEALED;

    return;
}

bool sub_080464A8(void * data)
{
    u8 * cast = data;

    switch (cast[0])
    {
        case 4:
        case 5:
            return TRUE;
    }

    return FALSE;
}

void sub_080464BC(struct SioProc85AA4CC * proc)
{
    struct Unit * unitA;
    struct Unit * unitB;
    u8 buf[4];

    u16 got = SioReceiveData(gUnknown_03001834, buf, sub_080464A8);

    if (got != 0)
    {
        switch (gUnknown_03001834[0])
        {
            case 4:
                unitA = GetUnit(gUnknown_03001834[2]);

                if ((unitA->state & US_CONCEALED) == 0)
                {
                    EndMu(gUnknown_03001838[1]);
                }
                else
                {
                    unitA->xPos = proc->unk_34;
                    unitA->yPos = proc->unk_38;
                }

                unitA->state &= ~US_HIDDEN;

                RefreshUnitSprites();
                Proc_Goto(proc, 1);

                break;

            case 5:
                unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
                unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

                if ((unitA->state & US_CONCEALED) != 0)
                {
                    sub_08046464(unitA, 0, &proc->unk_2c, &proc->unk_30);
                }

                if ((unitB->state & US_CONCEALED) != 0)
                {
                    sub_08046464(unitB, 1, &proc->unk_34, &proc->unk_38);
                }

                Proc_Break(proc);

                break;
        }
    }

    sub_080462A4();

    return;
}

int sub_08046598(struct Unit * unit)
{
    int i;

    u16 bestItem = 0;
    u32 bestMight = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = unit->items[i];

        if (item == 0)
        {
            break;
        }

        if (!CanUnitUseWeapon(unit, item))
        {
            continue;
        }

        if (GetItemMight(item) <= bestMight)
        {
            continue;
        }

        bestItem = item;
        bestMight = GetItemMight(item);
    }

    if (bestItem == 0)
    {
        return 0;
    }

    return bestMight + GetUnitPower(unit);
}

int sub_08046600(int playerId)
{
    int i;

    int count = 0;
    int score = 0;

    for (i = playerId; i < playerId + 5; i++)
    {
        struct Unit * unit = GetUnit(i);

        if ((unit->state & (US_DEAD | US_BIT16)) != 0)
        {
            continue;
        }

        if (unit->pCharacterData == NULL)
        {
            continue;
        }

        count++;

        score += sub_08046598(unit);
        score += GetUnitCurrentHp(unit);
    }

    score += gUnk_Sio_0203DD90.currentScore[playerId >> 6];

    score = Div(score, count);

    return score;
}

bool sub_08046674(struct SioBattleMapProc * proc, int b)
{
    if ((gpKeySt->held & START_BUTTON) != 0)
    {
        EndLinkArenaPointsBox();
        proc->unk_58 = b;

        if (!gPlaySt.cfgDisableSoundEffects)
        {
            m4aSongNumStart(0x388);
            StartEvent(EventScr_LinkArenaSurrenderPrompt);
        }

        Proc_Goto(proc, 3);

        return TRUE;
    }

    return FALSE;
}

void sub_080466C8(ProcPtr proc)
{
    int i;

    int bestScore = -1;

    if (sub_08046674(proc, 0) == TRUE)
    {
        return;
    }

    for (i = 0; i < 4; i++)
    {
        u32 score;

        if (!sub_0803CD1C(i))
        {
            continue;
        }

        if (gUnk_Sio_0203DD90.unk_0A[i] == 0)
        {
            continue;
        }

        if (gPlaySt.faction == i)
        {
            continue;
        }

        score = sub_08046600(i * 0x40 + 1);

        if (bestScore <= score)
        {
            continue;
        }

        bestScore = score;
        gUnk_Sio_0203DD90.unk_02 = i;
    }

    Proc_Break(proc);

    return;
}

int ITEMRANGEDONE_sub_804AF2C(int unused, struct Unit * unit)
{
    u16 weapon = GetUnitEquippedWeapon(unit);

    if (weapon == 0)
    {
        return 1;
    }

    if (GetItemMaxRange(weapon) == 1)
    {
        return 1;
    }

    if (GetItemMinRange(weapon) > 1)
    {
        return 2;
    }

    return 1;
}

void sub_08046760(struct SioBattleMapProc * proc)
{
    struct AiCombatSimulationSt sim;
    int i;
    int bestSlot;
    int slot;
    int allegiance;

    int bestScore = 0;
    u8 selectedUnitId = 0;
    u8 targetUnitId = 0;

    if (sub_08046674(proc, 1) == TRUE)
    {
        return;
    }

    gAiState.combatWeightTableId = 0xe;
    allegiance = gPlaySt.faction * 0x40;

    for (i = allegiance + 1; i < allegiance + 6; i++)
    {
        gActiveUnitId = i;
        gActiveUnit = GetUnit(gActiveUnitId);

        if ((gActiveUnit->state & (US_DEAD | US_BIT16)) != 0)
        {
            continue;
        }

        if (gActiveUnit->pCharacterData == NULL)
        {
            continue;
        }

        for (slot = 0; slot < UNIT_ITEM_COUNT; slot++)
        {
            int targetFaction;
            int j;
            int flags;

            u16 item = gActiveUnit->items[slot];

            if (item == 0)
            {
                continue;
            }

            if (!CanUnitUseWeapon(gActiveUnit, item))
            {
                continue;
            }

            bestSlot = slot;
            flags = 0;

            if (GetItemMinRange(item) > 2)
            {
                continue;
            }

            if ((GetItemAttributes(item) & IA_UNCOUNTERABLE) != 0)
            {
                continue;
            }

            if (GetItemMinRange(item) == 1)
            {
                flags |= 2;
            }

            if (GetItemMaxRange(item) > 1)
            {
                flags |= 1;
            }

            sim.itemSlot = bestSlot;

            targetFaction = gUnk_Sio_0203DD90.unk_02 * 0x40;

            for (j = targetFaction + 1; j < targetFaction + 6; j++)
            {
                struct AiCombatSimulationSt * simp = &sim;
                int flags2;
                u8 * r7 = gUnknown_03001834;
                struct Unit * unit = GetUnit(j);

                if ((unit->state & (US_DEAD | US_BIT16)) != 0)
                {
                    continue;
                }

                if (unit->pCharacterData == NULL)
                {
                    continue;
                }

                flags2 = flags & 2; // permuter
                simp->targetId = j;

                if (((u8)flags2) != 0)
                {
                    simp->xMove = unit->xPos + 1;
                    simp->yMove = unit->yPos;

                    AiSimulateBattleAgainstTargetAtPosition(&sim);

                    if (bestScore <= sim.score)
                    {
                        bestScore = sim.score;
                        selectedUnitId = gActiveUnitId;
                        targetUnitId = j;

                        if (flags == 3)
                        {
                            r7[2] = ITEMRANGEDONE_sub_804AF2C(3, unit);
                        }
                        else
                        {
                            r7[2] = 1;
                        }
                        r7[3] = bestSlot;
                    }
                }

                if ((flags & 1) != 0)
                {
                    simp->xMove = unit->xPos + 1;
                    simp->yMove = unit->yPos - 1;

                    AiSimulateBattleAgainstTargetAtPosition(&sim);

                    if (bestScore <= sim.score)
                    {
                        bestScore = sim.score;
                        selectedUnitId = gActiveUnitId;
                        targetUnitId = j;

                        if (flags == 3)
                        {
                            r7[2] = ITEMRANGEDONE_sub_804AF2C(3, unit);
                        }
                        else
                        {
                            r7[2] = 2;
                        }
                        r7[3] = bestSlot;
                    }
                }
            }
        }
    }

    sub_08044C10(selectedUnitId, 0, &gUnk_Sio_0203DD90.unk_04, &proc->unk_2c, &proc->unk_30);
    gUnknown_03001834[1] = targetUnitId;

    Proc_Break(proc);

    return;
}

void sub_08046994(ProcPtr proc)
{
    struct Unit * unit = GetUnit(gUnknown_03001834[1]);

    StartAiTargetCursor(unit->xPos * 16, unit->yPos * 16, 2, proc);

    return;
}

void sub_080469C4(struct SioProc85AA4CC * proc)
{
    struct Unit * unitA;
    struct Unit * unitB;

    sub_08044C10(gUnknown_03001834[1], 1, &gUnk_Sio_0203DD90.unk_05, &proc->unk_34, &proc->unk_38);

    unitA = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_04]);
    unitB = GetUnit(gUnknown_03001818[gUnk_Sio_0203DD90.unk_05]);

    if ((unitA->state & US_CONCEALED) != 0)
    {
        sub_08046464(unitA, 0, &proc->unk_2c, &proc->unk_30);
    }

    if ((unitB->state & US_CONCEALED) != 0)
    {
        sub_08046464(unitB, 1, &proc->unk_34, &proc->unk_38);
    }

    return;
}

void sub_08046A54(ProcPtr proc)
{
    if (sub_08046674(proc, 2) == 1)
    {
        return;
    }

    if (MuExistsActive() != 0)
    {
        return;
    }

    Proc_Break(proc);

    return;
}

void LinkArenaFogSprite_Loop(void)
{
    int i;
    int j;

    int yOffset = (gLut_LinkArenaFogPlaceholder_YOffset[GetGameTime() & 0x1f] + 4) >> 1;

    for (i = 0; i < 4; i++)
    {
        if (!sub_0803CD1C(gUnknown_080D9F28[gSioSt->selfId][i]))
        {
            continue;
        }

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit = GetUnit(gUnknown_03001818[i * 5 + j]);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if (!(unit->state & US_CONCEALED))
            {
                continue;
            }

            PutOamHiRam(
                unit->xPos * 16, unit->yPos * 16 - yOffset, Sprite_16x16,
                OAM2_PAL(GetUnitDisplayedSpritePalette(unit)) + OAM2_CHR(0x240) + OAM2_LAYER(2));
        }
    }

    return;
}

void StartLinkArenaFogPlaceholders(void)
{
    Proc_Start(ProcScr_DrawLinkArenaFogPlaceholders, PROC_TREE_4);
    return;
}

void EndLinkArenaFogPlaceholders(void)
{
    Proc_EndEach(ProcScr_DrawLinkArenaFogPlaceholders);
    return;
}

void sub_08046B6C(ProcPtr proc)
{
    SetStatScreenExcludedUnitFlags(0x1F);
    StartStatScreen(gActiveUnit, proc);
    return;
}

void sub_08046B8C(ProcPtr proc)
{
    if (gUnk_Sio_0203DD90.unk_08 == 0)
    {
        Proc_Goto(proc, 0);
        return;
    }

    EndAllMus();
    sub_08044B98(6, gPlaySt.faction, 0, 0);

    return;
}

void sub_08046BC4(ProcPtr proc)
{
    if (gUnk_Sio_0203DD90.unk_08 == 0)
    {
        gUnk_Sio_0203DD90.unk_09 = 0;
        Proc_Goto(proc, 0);
        return;
    }

    EndAllMus();
    sub_08044B98(7, gPlaySt.faction, 0, 0);

    return;
}

void sub_08046BF8(struct SioBattleMapProc * proc)
{
    if (gUnk_Sio_0203DD90.unk_08 == 0)
    {
        Proc_Goto(proc, proc->unk_58);
        return;
    }

    EndAllMus();
    EndAllMus();

    gLinkArenaSt.unk_0B = 1;

    sub_08044B34(0xff);

    Proc_Goto(proc, 5);

    return;
}

void sub_08046C3C(struct SioBattleMapProc * proc)
{
    int i;
    int r6 = 0;

    if (gLinkArenaSt.unk_00 == 1)
    {
        gLinkArenaSt.unk_0B = 1;
        sub_08044B34(0xff);
        Proc_Goto(proc, 8);
        return;
    }

    gUnk_Sio_0203DD90.unk_0F[gLinkArenaSt.unk_A0 - gUnk_Sio_0203DD90.unk_0E] = gPlaySt.faction;
    gUnk_Sio_0203DD90.unk_0E++;

    gUnk_Sio_0203DD90.currentScore[gPlaySt.faction] = 0;

    if (gUnk_Sio_0203DD90.unk_0E == gLinkArenaSt.unk_A0)
    {
        for (i = 0; i < gLinkArenaSt.unk_A0; i++)
        {
            if (gUnk_Sio_0203DD90.unk_0A[i] != 0)
            {
                r6 = i;
            }
        }

        gUnk_Sio_0203DD90.unk_0F[0] = r6;

        sub_08044B34(0xff);
        Proc_Goto(proc, 8);

        return;
    }

    sub_08044B34(gPlaySt.faction);
    Proc_Goto(proc, 8);

    return;
}

void sub_08046CD4(ProcPtr proc)
{
    if (gLinkArenaSt.unk_00 == 1)
    {
        gLinkArenaSt.unk_0B = 1;
        sub_08044B34(0xff);

        Proc_Goto(proc, 8);

        return;
    }

    gLinkArenaSt.unk_0B = 2;
    sub_08044B34(0xff);

    Proc_Goto(proc, 8);

    return;
}

void sub_08046D10(struct SioBattleMapProc * proc)
{
    int i;
    int r6 = 0;

    gUnk_Sio_0203DD90.unk_0F[gLinkArenaSt.unk_A0 - gUnk_Sio_0203DD90.unk_0E] = gPlaySt.faction;
    gUnk_Sio_0203DD90.unk_0E++;

    gUnk_Sio_0203DD90.currentScore[gPlaySt.faction] = 0;

    if (gUnk_Sio_0203DD90.unk_0E == gLinkArenaSt.unk_A0)
    {
        for (i = 0; i < gLinkArenaSt.unk_A0; i++)
        {
            if (gUnk_Sio_0203DD90.unk_0A[i] != 0)
            {
                r6 = i;
            }
        }

        gUnk_Sio_0203DD90.unk_0F[0] = r6;

        sub_08044B34(0xff);
        Proc_Goto(proc, 5);

        return;
    }

    sub_08044B34(gPlaySt.faction);
    Proc_Goto(proc, 5);

    return;
}

void sub_08046D9C(ProcPtr proc)
{
    gLinkArenaSt.unk_0B = 2;
    sub_08044B34(0xff);

    Proc_Goto(proc, 5);

    return;
}

void LAUnitDeaths_Init(struct SioBattleMapProc * proc)
{
    proc->unk_58 = 0;

    proc->unk_5c = gPlaySt.faction * 0x40;
    gUnk_Sio_0203DD90.unk_0A[gPlaySt.faction] = 0;

    return;
}

void LAUnitDeaths_FindNextAndStart(struct SioBattleMapProc * proc)
{
    struct Unit * unit;
    struct MuProc * mu;

    while (1)
    {
        if (proc->unk_58 == 5)
        {
            Proc_Goto(proc, 1);
            return;
        }

        unit = GetUnit(proc->unk_5c + proc->unk_58 + 1);

        if ((unit->state & (US_DEAD | US_BIT16)) != 0)
        {
            proc->unk_58++;
            continue;
        }

        if (unit->pCharacterData == NULL)
        {
            proc->unk_58++;
            continue;
        }

        break;
    }

    RefreshUnitSprites();
    HideUnitSprite(unit);

    mu = StartMu(unit);

    gWorkingMoveScr[0] = MOVE_CMD_MOVE_DOWN;
    gWorkingMoveScr[1] = MOVE_CMD_HALT;

    SetMuMoveScript(mu, gWorkingMoveScr);

    StartLinkArenaMUDeathFade(mu);

    proc->unk_54 = mu;
    proc->unk_58++;

    unit->state &= ~US_CONCEALED;
    unit->state |= (US_HIDDEN | US_DEAD);

    return;
}

void LAUnitDeaths_EndMu(struct SioBattleMapProc * proc)
{
    EndMu(proc->unk_54);
    return;
}

void LAUnitDeaths_OnEnd(void)
{
    sub_08044DCC();
    sub_08044E2C();

    RefreshUnitSprites();

    return;
}

void LinkArena_StoreTalkChoice(void)
{
    if (GetTalkChoiceResult() == 1)
    {
        gUnk_Sio_0203DD90.unk_08 = 1;
        return;
    }

    gUnk_Sio_0203DD90.unk_08 = 0;

    return;
}

void sub_08046EB8(struct SioBattleMapProc * proc)
{
    int i;

    LoadHelpBoxGfx(OBJ_VRAM0 + 0x280 * 0x20, 6);
    StartHelpBoxExt_Unk(64, 56, 0x3D4);

    for (i = 0; i < 4; i++)
    {
        if (!sub_0803CD1C(i))
        {
            continue;
        }

        if (gUnk_Sio_0203DD90.unk_0A[i] == 0)
        {
            continue;
        }

        proc->unk_58 = i;
    }

    proc->unk_5c = 0;

    return;
}

void sub_08046F04(struct SioBattleMapProc * proc)
{
    struct Unit * unit;

    while (1)
    {
        if (proc->unk_5c > 4)
        {
            CloseHelpBox();
            Proc_Break(proc);
            return;
        }

        unit = GetUnit(proc->unk_58 * 0x40 + proc->unk_5c + 1);

        if ((unit->state & (US_DEAD | US_BIT16)) != 0)
        {
            proc->unk_5c++;
            continue;
        }

        if (unit->pCharacterData == NULL)
        {
            proc->unk_5c++;
            continue;
        }

        break;
    }

    gUnk_Sio_0203DD90.unk_2c[proc->unk_58].newScore = 30;
    gUnk_Sio_0203DD90.unk_2c[proc->unk_58].unitId = proc->unk_58 * 0x40 + proc->unk_5c + 1;

    sub_08044AC0(proc);

    proc->unk_5c++;

    return;
}

void sub_08046F7C(ProcPtr proc)
{
    if (gLinkArenaSt.unk_00 == 1)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

void sub_08046F98(void)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    RenderMap();

    if (SetupBanim())
    {
        SetBanimLinkArenaFlag(1);
        BeginAnimsOnBattleAnimations();

        return;
    }

    EndAllMus();
    RenderMap();

    StartBattleManim();
    gBattleStats.config |= BATTLE_CONFIG_MAPANIMS;

    return;
}

void sub_08046FE8(struct SioBattleMapProc * proc)
{
    struct MuProc * mu;

    if (gBattleActor.unit.curHP == 0)
    {
        mu = Proc_Find(ProcScr_Mu);
        StartLinkArenaMUDeathFade(mu);
        proc->unk_54 = mu;
    }

    if (gBattleTarget.unit.curHP == 0)
    {
        RefreshUnitSprites();

        HideUnitSprite(GetUnit(gBattleTarget.unit.index));

        mu = StartMu(&gBattleTarget.unit);

        gWorkingMoveScr[0] = GetFacingFromTo(
            gBattleActor.unit.xPos, gBattleActor.unit.yPos, gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);
        gWorkingMoveScr[1] = MOVE_CMD_HALT;

        SetMuMoveScript(mu, gWorkingMoveScr);
        StartLinkArenaMUDeathFade(mu);

        proc->unk_54 = mu;
    }

    return;
}

void sub_08047068(void)
{
    struct Unit * unitA = GetUnit(gBattleActor.unit.index);
    struct Unit * unitB = GetUnit(gBattleTarget.unit.index);

    if (GetUnitCurrentHp(unitA) == 0)
    {
        unitA->state |= (US_HIDDEN | US_DEAD);
    }

    if (GetUnitCurrentHp(unitB) == 0)
    {
        unitB->state |= (US_HIDDEN | US_DEAD);
    }

    return;
}
