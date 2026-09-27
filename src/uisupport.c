#include "gbafe.h"
#include "gbafe/cgtext.h"

struct SupportScreenUnit {
    /* 00 */ u8 charId;
    /* 01 */ u8 classId;
    /* 02 */ u8 supportLevel[7];
    /* 09 */ u8 partnerClassId[7];
    /* 10 */ s8 partnerIsAlive[7];
    /* 17 */ u8 pad_17;
};


struct SupportScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int curIndex;
    /* 3C */ int unk_3c;
    /* 40 */ s8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ s8 fromPrepScreen;
    /* 43 */ s8 helpTextActive;
};

struct SupportTactProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int count;
};

struct SubScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unitIdx;
    /* 30 */ int x;
    /* 34 */ int y;
    /* 38 */ s8 fromPrepScreen;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 partnerCount;
    /* 3D */ u8 remainingSupports;
    /* 3E */ u8 songId;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 partnerState[7];
    /* 47 */ u8 supportLevel[7];
    /* 4E */ u8 partnerClassId[7];
};

extern struct SupportScreenUnit * CONST_DATA sSupportScreenUnits;
extern int sSupportScreenUnitCount;


int GetSupportScreenCharIdAt(int idx);
int GetSupportScreenPartnerCount(int charId);
int GetClassSMSId(int classId);
void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int classId);
void SyncUnitSpriteSheet(void);
void ResetUnitSprites(void);
ProcPtr StartMenuScrollBar(ProcPtr parent);
void InitMenuScrollBarImg(int chr, int pal);
void PutMenuScrollBarAt(int x, int y);
void UpdateMenuScrollBarConfig(u8 a, u16 b, u16 c, u8 d);
void TryHideMenuScrollBar(void);
void EndMenuScrollBar(void);
void StartCgText(int x, int y, int width, int height, int msg, void * vram, int pal, ProcPtr parent);
void SetCgTextFlags(int flags);
void EndCgText(void);

void sub_0809B440(struct SupportScreenProc * proc);
void sub_0809BE80(struct SupportScreenProc * proc, int line);

extern u8 Tsa_0840EBE8[];
extern u8 Img_SysBlackBox[];
extern struct ProcCmd CONST_DATA gProcScr_SupportScreen[];
extern u16 CONST_DATA Sprite_08CC58D4[];
extern int TacticianBirthAffins[];
extern u16 Pal_08194714[];

void StartSupportUnitSubScreen(s8 fromPrepScreen, int idx, ProcPtr parent);
int GetSupportTalkSong(struct SupportTalkEnt const * ent, u8 charA, u8 charB, int rank);
char * GetTacticianName(void);
struct FaceProc * StartTalkFace(int fid, int x, int y, int disp, int talk_face);

extern struct Font gPrepItemTextFont;
extern u8 Tsa_0840ECC4[];
extern u8 Img_0840EDB8[];
extern u8 Img_0840E40C[];
extern u16 Pal_0840E4EC[];

void DrawSupportSubScreenSprites(struct SubScreenProc * proc);
void StartSupportViewerTalk(u8 charA, u8 charB, int rank);
void sub_0809BF78(int idx);
int UiSupport_GetSupportTalkSong(int idx, int partner, int rank);

extern struct ProcCmd CONST_DATA gProcScr_SupportUnitSubScreen[];
void DrawSupportSubScreenUnitPartnerText(struct SubScreenProc * proc, int idx);
extern u16 gUnk_02012BFC[];
extern u16 Pal_TactInfoBg[];
extern u8 Img_TactInfoBg[];
extern u8 Tsa_TactInfoBg[];
extern u8 Img_0840E830[];
extern u16 Pal_0840E978[];
extern u8 Img_08418C54[];
extern u16 Pal_08418D40[];
extern u16 SpriteAnim_08418D60[];
extern u16 CONST_DATA Sprite_08CC593C[];
extern u16 CONST_DATA Sprite_08CC5944[];
extern u16 CONST_DATA Sprite_08CC5952[];
extern u16 CONST_DATA Sprite_08CC5960[];
extern u16 CONST_DATA Sprite_08CC596E[];
extern u16 CONST_DATA Sprite_08CC4FC4[];


int GetSupportScreenUnitCount(void)
{
    return sSupportScreenUnitCount;
}
int GetNextSupportScreenUnit(int num)
{
    if (num >= (sSupportScreenUnitCount - 1))
        return 0;

    return num + 1;
}
int GetPreviousSupportScreenUnit(int num)
{
    if (num == 0)
        num = sSupportScreenUnitCount;

    return num - 1;
}
int GetSupportScreenPartnerSupportLevel(int idx, int partner)
{
    return sSupportScreenUnits[idx].supportLevel[partner];
}
int GetSupportScreenPartnerClassId(int idx, int partner)
{
    return sSupportScreenUnits[idx].partnerClassId[partner];
}
s8 GetSupportScreenPartnerIsAlive(int idx, int partner)
{
    return sSupportScreenUnits[idx].partnerIsAlive[partner];
}
int GetSupportScreenPartnerCharId(int idx, int partner)
{
    return gCharacterData[GetSupportScreenCharIdAt(idx) - 1].pSupportData->pids[partner];
}
int GetSupportScreenCharIdAt(int idx)
{
    return sSupportScreenUnits[idx].charId;
}
int GetSupportScreenClassIdAt(int idx)
{
    return sSupportScreenUnits[idx].classId;
}
int GetSupportClassForCharId(int charId)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if (unit->pCharacterData->number != charId)
            continue;

        return unit->pClassData->number;
    }

    return gCharacterData[charId - 1].defaultClass;
}
s8 sub_0809B15C(int charId)
{
    struct SupportTalkEnt const * iter;

    for (iter = gSupportTalkList; iter->pidA != 0; iter++)
    {
        if (iter->pidA == charId || iter->pidB == charId)
            return 1;
    }

    return 0;
}
void sub_0809B184(void)
{
    struct SupportTalkEnt const * iter;

    for (iter = gSupportTalkList; iter->pidA != 0; iter++)
    {
        MetaSave_SetMetCharacter(iter->pidA, NULL);
        MetaSave_SetMetCharacter(iter->pidB, NULL);
        UpdateBestGlobalSupportValue(iter->pidA, iter->pidB, GetUnitsAverageSupportValue(iter->pidA, iter->pidB));
    }
}
void SupportScreen_SetupUnits(struct SupportScreenProc * proc)
{
    int k;
    int j;

    CpuFill16(0, sSupportScreenUnits, 0xC00);

    sSupportScreenUnitCount = 0;

    if (proc->fromPrepScreen)
    {
        int i;

        u32 unitFlags[8];
        CpuFill16(0, unitFlags, 0x20);

        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & (US_DEAD | US_BIT16))
                continue;

            *(unitFlags + (unit->pCharacterData->number >> 5)) |= (1 << (unit->pCharacterData->number & 0x1f));
        }

        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & (US_DEAD | US_BIT16))
                continue;

            if (!GetSupportScreenPartnerCount(unit->pCharacterData->number))
                continue;

            sSupportScreenUnits[sSupportScreenUnitCount].charId = unit->pCharacterData->number;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = unit->pClassData->number;

            for (j = 0; j < gCharacterData[unit->pCharacterData->number - 1].pSupportData->count; j++)
            {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, j);

                sSupportScreenUnits[sSupportScreenUnitCount].supportLevel[j] = GetUnitSupportLevel(unit, j);
                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[j] = GetSupportClassForCharId(charId);
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[j] =
                    (*(unitFlags + (charId >> 5)) >> (charId & 0x1f)) & 1;
            }

            sSupportScreenUnitCount++;
        }
    }
    else
    {
        struct GlobalSaveInfo info;
        ReadGlobalSaveInfo(&info);

        SetTacticianName(DecodeMsg(0x55B));

        for (j = 0; j < 0x100; j++)
        {
            if (!GGM_IsCharacterKnown(j, &info))
                continue;

            if (!GetSupportScreenPartnerCount(j))
                continue;

            sSupportScreenUnits[sSupportScreenUnitCount].charId = j;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = gCharacterData[j - 1].defaultClass;

            GetGlobalSupportListFromSave(j, sSupportScreenUnits[sSupportScreenUnitCount].supportLevel, &info);

            for (k = 0; k < GetSupportScreenPartnerCount(j); k++)
            {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, k);

                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[k] = gCharacterData[charId - 1].defaultClass;
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[k] = GGM_IsCharacterKnown(charId, &info);
            }

            sSupportScreenUnitCount++;
        }
    }
}
void sub_0809B440(struct SupportScreenProc * proc)
{
    int i;

    if (proc->fromPrepScreen)
    {
        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            UseUnitSprite(GetUnitSMSId(unit));
        }
    }
    else
    {
        for (i = 0; i < sSupportScreenUnitCount; i++)
            UseUnitSprite(GetClassSMSId(sSupportScreenUnits[i].classId));
    }

    ForceSyncUnitSpriteSheet();
}
int GetTotalSupportLevel(int idx)
{
    int i;

    int total = 0;

    for (i = 0; i < gCharacterData[GetSupportScreenCharIdAt(idx) - 1].pSupportData->count; i++)
        total += GetSupportScreenPartnerSupportLevel(idx, i);

    return total;
}
int Support_GetSupportLevelTextColor(s8 flag, int idx)
{
    int i;
    int a;
    int b;
    int c;

    if (flag != 0)
    {
        int var = GetTotalSupportLevel(idx);

        if (var == 5)
            return 2;

        if (var == 0)
            return 0;

        return 1;
    }

    a = 0;
    b = GetTotalSupportLevel(idx);

    c = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(idx));

    for (i = 0; i < c; i++)
        a += GetUnitsAverageSupportValue(GetSupportScreenCharIdAt(idx), GetSupportScreenPartnerCharId(idx, i));

    if (a == b)
        return 2;

    if (b == 0)
        return 0;

    return 1;
}
void DrawSupportScreenText(void)
{
    struct Text * th;
    int perc;

    th = &gPrepItemTexts[29];

    perc = GetTotalSupportCollection();

    th++;
    ClearText(th);

    Text_InsertDrawString(th, 0, perc == 100 ? 4 : 0, DecodeMsg(0x12C9));

    Text_SetCursor(th, 48);
    Text_SetColor(th, perc == 100 ? 4 : 2);
    Text_DrawNumberOrBlank(th, perc);
    Text_Skip(th, 1);

    Text_InsertDrawString(th, 56, perc == 100 ? 4 : 0, "%");

    PutText(th, gBg0Tm + TM_OFFSET(20, 18));

    EnableBgSync(BG0_SYNC_BIT);
}
void SupportScreen_OnInit(struct SupportScreenProc * proc)
{
    proc->unk_2c = 0;
    proc->unk_40 = 0;
    proc->unk_34 = 0;
    proc->curIndex = 0;
    proc->unk_3c = -1;
}
void DrawSupportScreenUnitSprites(struct SupportScreenProc * proc)
{
    int i;

    int unitCount = GetSupportScreenUnitCount();

    for (i = 0; i < unitCount; i++)
    {
        u32 y = (i / 3) * 16 + 76 - proc->unk_34;
        int x = i % 3 * 64 + 24;

        if (y - 76 < 49)
            PutUnitSpriteForClassId(0, x, y, 0xc800, GetSupportScreenClassIdAt(i));
    }

    SyncUnitSpriteSheet();
}
void sub_0809B670(struct SupportScreenProc * proc)
{
    int a;
    int b;

    if (proc->unk_3c != -1)
    {
        proc->curIndex = proc->unk_3c;
        proc->unk_3c = -1;

        if ((((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 76) < 77)
        {
            if ((proc->curIndex / 3) == 0)
                proc->unk_34 = 0;
            else
                proc->unk_34 = ((proc->curIndex / 3) - 1) * 16;
        }

        a = proc->curIndex / 3;
        if ((((a) - (proc->unk_34 / 16)) * 16 + 76) > 123)
        {
            b = (GetSupportScreenUnitCount() - 1);
            if (a == b / 3)
                proc->unk_34 = (((GetSupportScreenUnitCount() - 1) / 3) - 3) * 16;
            else
                proc->unk_34 = ((proc->curIndex / 3) - 2) * 16;
        }
    }
}
void SupportScreen_SetupGraphics(struct SupportScreenProc * proc)
{
    int i;

    gDispIo.disp_ct.mode = 0;

    InitBgs(NULL);

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    InitFaces();

    ResetText();
    InitIcons();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();
    ApplyIconPalettes(0xe);

    sub_0809B670(proc);

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0xFFD8, proc->unk_34 - 76);

    PrepRestartMuralBackground();

    ApplyUnitSpritePalettes();
    ResetUnitSprites();

    sub_0809B440(proc);
    sub_08091944(0x5000, 5);

    PutCompressedTsa(gBg1Tm, Tsa_0840EBE8, 0x5280);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    if (GetSupportScreenUnitCount() != 0)
    {
        ResetSysHandCursor(proc);
        DisplaySysHandCursorTextShadow(0x600, 1);
        ShowSysHandCursor(
            (proc->curIndex % 3) * 64 + 20, ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 76, 7, 0x800);
    }

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 76, 240, 140);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);

    for (i = 0; i < 15; i++)
        InitText(gPrepItemTexts + i, 5);

    InitText(&gPrepItemTexts[29], 5);
    InitText(&gPrepItemTexts[30], 9);

    DrawSupportScreenText();

    StartBmFace(0, 0x41, 56, -10, 0x901);
    InitTalk(0x28, 0, 1);

    Decompress(Img_SysBlackBox, (void *) 0x06017800);

    if (proc->fromPrepScreen)
        proc->unk_30 = 0xF6F;
    else
        proc->unk_30 = 0xFC4;

    StartParallelWorker(DrawSupportScreenUnitSprites, proc);

    StartMenuScrollBar(proc);
    InitMenuScrollBarImg(0x200, 4);
    PutMenuScrollBarAt(0xd8, 0x54);
    UpdateMenuScrollBarConfig(6, proc->unk_34, ((GetSupportScreenUnitCount() - 1) / 3) + 1, 4);
    TryHideMenuScrollBar();

    for (i = proc->unk_34 / 16; i < (proc->unk_34 / 16) + 4; i++)
        sub_0809BE80(proc, i);

    StartGreenText(proc);

    proc->helpTextActive = 0;

    LoadHelpBoxGfx((void *) 0x06014800, 10);

    SetDispEnable(1, 1, 1, 1, 1);

    StartHelpPromptSprite(0x10, 0x8c, proc);
}
void SupportScreen_OnEnd(ProcPtr proc)
{
    EndCgText();
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndFaceById(0);
    SetOnHBlankA(NULL);
}
void sub_0809BA48(struct SupportScreenProc * proc)
{
    StartCgText(10, 7, 17, 4, proc->unk_30, (void *) 0x06013000, -1, 0);
    SetCgTextFlags(0x8FC);
}
void SupportScreen_Loop_KeyHandler(struct SupportScreenProc * proc)
{
    u16 keys;
    int previous;
    int var;

    if (GetSupportScreenUnitCount())
    {
        if (!proc->unk_40)
        {
            previous = proc->curIndex;

            keys = gpKeySt->repeated;
            proc->unk_41 = 4;

            if (gpKeySt->held & L_BUTTON)
            {
                keys = gpKeySt->held;
                proc->unk_41 = 8;
            }

            if (proc->helpTextActive)
            {
                if (gpKeySt->pressed & B_BUTTON)
                {
                    CloseHelpBox();
                    proc->helpTextActive = 0;
                    return;
                }
            }
            else
            {
                if (gpKeySt->pressed & R_BUTTON)
                {
                    StartHelpBox(
                        (proc->curIndex % 3) * 64 + 20, ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 76,
                        gCharacterData[GetSupportScreenCharIdAt(proc->curIndex) - 1].descTextId);

                    proc->helpTextActive = 1;

                    return;
                }

                if (gpKeySt->pressed & A_BUTTON)
                {
                    Proc_Goto(proc, 2);
                    PlaySoundEffect(0x38A);
                    return;
                }

                if (gpKeySt->pressed & B_BUTTON)
                {
                    Proc_Goto(proc, 3);
                    PlaySoundEffect(0x38B);
                    return;
                }
            }

            if (keys & DPAD_LEFT)
            {
                if ((proc->curIndex % 3) != 0)
                    proc->curIndex--;
            }

            if (keys & DPAD_RIGHT)
            {
                if ((proc->curIndex % 3) != 2)
                {
                    proc->curIndex++;

                    if (proc->curIndex >= GetSupportScreenUnitCount())
                        proc->curIndex = GetSupportScreenUnitCount() - 1;
                }
            }

            if ((keys & DPAD_UP) && (proc->curIndex > 2))
                proc->curIndex -= 3;

            if ((keys & DPAD_DOWN) && (proc->curIndex + 3 < GetSupportScreenUnitCount()))
                proc->curIndex += 3;

            if (previous != proc->curIndex)
            {
                var = ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16;

                proc->unk_40 = 0;
                PlaySoundEffect(0x385);

                if ((var < 0x10) && (proc->unk_34 != 0))
                {
                    sub_0809BE80(proc, (proc->unk_34 / 16) - 1);
                    proc->unk_40 = -1;
                    SetSysHandCursorXPos((proc->curIndex % 3) * 64 + 20);
                }
                else if ((var >= 0x30) && (proc->unk_34 != ((((GetSupportScreenUnitCount() - 1) / 3) - 3) * 16)))
                {
                    sub_0809BE80(proc, (proc->unk_34 / 16) + 4);
                    proc->unk_40 = 1;
                    SetSysHandCursorXPos((proc->curIndex % 3) * 64 + 20);
                }
                else
                {
                    ShowSysHandCursor((proc->curIndex % 3) * 64 + 20, var + 76, 7, 0x800);
                }

                if (proc->helpTextActive != 0)
                {
                    StartHelpBox(
                        (proc->curIndex % 3) * 64 + 0x14,
                        ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 76 - (proc->unk_40 * 16),
                        gCharacterData[GetSupportScreenCharIdAt(proc->curIndex) - 1].descTextId);
                }
            }

            if (proc->unk_40 == 0)
                return;
        }

        if (proc->unk_40 < 0)
            proc->unk_34 -= proc->unk_41;

        if (proc->unk_40 > 0)
            proc->unk_34 += proc->unk_41;

        if ((proc->unk_34 & 0xf) == 0)
            proc->unk_40 = 0;

        UpdateMenuScrollBarConfig(6, proc->unk_34, ((GetSupportScreenUnitCount() - 1) / 3) + 1, 4);

        SetBgOffset(2, 0xFFD8, (proc->unk_34 - 76) & 0xff);
        return;
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        Proc_Goto(proc, 3);
        PlaySoundEffect(0x38B);
    }
}
void SupportScreen_StartUnitSubMenu(struct SupportScreenProc * proc)
{
    StartSupportUnitSubScreen(proc->fromPrepScreen, proc->curIndex, proc);
}
void SupportScreen_RestartSourceScreenMusic(struct SupportScreenProc * proc)
{
    if (!proc->fromPrepScreen)
        CallSomeSoundMaybe(0x5A, 0x100, 0xC0, 0x18, NULL);
    else
        CallSomeSoundMaybe(0x49, 0x100, 0x100, 0x18, NULL);
}
void StartSupportScreenFromPrepScreen(ProcPtr parent)
{
    struct SupportScreenProc * proc = Proc_StartBlocking(gProcScr_SupportScreen, parent);
    proc->fromPrepScreen = 1;
}
void StartSupportScreen(ProcPtr parent)
{
    struct SupportScreenProc * proc = Proc_StartBlocking(gProcScr_SupportScreen, parent);
    proc->fromPrepScreen = 0;
}
void sub_0809BE80(struct SupportScreenProc * proc, int line)
{
    int i;
    int j;
    int x;
    int y;
    int color = 1;
    struct Text * textPtr;

    SetTextFontGlyphs(0);
    SetTextFont(NULL);

    textPtr = gPrepItemTexts + ((line * 3) % 15);
    for (i = 0, j = (line * 3); i < 3; textPtr++, j++, i++)
    {
        ClearText(textPtr);

        if ((j) < GetSupportScreenUnitCount())
        {
            x = ((i) % 3) * 8;
            y = ((line * 2)) & 0x1f;

            switch (Support_GetSupportLevelTextColor(proc->fromPrepScreen, (j)))
            {
            case 0:
                color = 1;
                break;

            case 1:
                color = 0;
                break;

            case 2:
                color = 4;
                break;
            }

            Text_SetCursor(textPtr, 0);
            Text_SetColor(textPtr, color);

            Text_DrawString(textPtr, DecodeMsg(gCharacterData[GetSupportScreenCharIdAt((j)) - 1].nameTextId));

            PutText(textPtr, gBg2Tm + TM_OFFSET(x, y));
        }
    }

    EnableBgSync(BG2_SYNC_BIT);
}
void sub_0809BF78(int idx)
{
    struct SupportScreenProc * proc = Proc_Find(gProcScr_SupportScreen);

    if (proc != 0)
        proc->unk_3c = idx;
}
int UiSupport_GetSupportTalkSong(int idx, int partner, int rank)
{
    return GetSupportTalkSong(NULL, GetSupportScreenCharIdAt(idx), GetSupportScreenPartnerCharId(idx, partner), rank);
}
void sub_0809BFCC(struct SupportTactProc * proc)
{
    int i;
    int x = 0x7E - ((proc->count - 1) * 15) / 2;
    int y = 0x54;

    for (i = 0; i < proc->count; i++)
    {
        PutSpriteExt(4, i * 15 + x + 2, y, Sprite_08CC58D4, 0xEF80);
        PutSpriteExt(4, x + i * 15, y, Sprite_08CC58D4, 0xFF80);
    }
}
void sub_0809C044(void)
{
    struct Text * text = gPrepItemTexts;
    char const * str;

    ApplyPalette(Pal_08194714, 0);

    SetTextFont((struct Font *) ((u8 *) text - 0x18));
    SetTextFontGlyphs(1);

    PutDrawText(text++, gBg2Tm + TM_OFFSET(16, 4), 4, 0, 0, GetTacticianName());

    PutIcon(gBg2Tm + TM_OFFSET(14, 4), TacticianBirthAffins[gPlaySt.tact_birth] + 0x79, 0x5000);

    str = DecodeMsg(TactGetMsg_Birth(gPlaySt.tact_birth));
    PutDrawText(text++, gBg2Tm + TM_OFFSET(16, 4) + 0x77, 4, GetStringTextCenteredPos(0x40, str), 0, str);

    str = DecodeMsg(TactGetMsg_Gender(gPlaySt.tact_gender));
    PutDrawText(text, gBg2Tm + TM_OFFSET(16, 4) + 0x82, 4, GetStringTextCenteredPos(0x40, str), 0, str);

    SetTextFont(NULL);
    EnableBgSync(BG2_SYNC_BIT);
}
void sub_0809C12C(struct SupportTactProc * proc)
{
    int n = gPlaySt.unk2C_04 / 12;

    if (n > 10)
        n = 10;

    proc->count = n;
    proc->unk_2c = 0;
}
void sub_0809C154(struct SupportTactProc * proc)
{
    int i;
    struct Font * font;

    gDispIo.disp_ct.mode = 0;

    InitBgs(NULL);

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    InitFaces();
    ResetText();
    InitIcons();
    ApplySystemObjectsGraphics();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    ApplyIconPalettes(4);
    PrepRestartMuralBackground();

    Decompress(Img_TactInfoBg, (void *) 0x06000400);
    ApplyPalette(Pal_TactInfoBg, 0xF);

    CpuFastFill(0, gBuf, 0x440);
    TmApplyTsa((u16 *) gBuf, Tsa_TactInfoBg, 0xF020);
    CpuFastCopy(gBuf + 0x40, gBg1Tm, 0x440);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    SetWinEnable(0, 0, 0);
    SetWin0Box(128, 40, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(0, 8, 8, 8);

    font = &gPrepItemTextFont;
    InitTextFont(font, (void *) 0x06004000, 0x200, 0);
    SetTextFont(font);

    for (i = 0; i < 12; i++)
        InitText((struct Text *) (font + 1) + i, 8);

    InitText(&gPrepItemTexts[29], 8);
    SetTextFont(NULL);

    sub_0809C044();

    if (gPlaySt.chapterModeIndex == 3)
        StartTalkFace(0x29, 0xD8, 0x58, 0x102, 0);
    else
        StartTalkFace(0x32, 0xD8, 0x58, 0x102, 0);

    InitTalk(0, 0, 1);

    Decompress(Img_0840E830, (void *) 0x06017000);
    CpuFastFill(0, PAL_OBJ(0xE), 0x20);
    ApplyPalette(Pal_0840E978, 0x1F);

    StartParallelWorker(sub_0809BFCC, proc);

    Decompress(Img_08418C54, (void *) 0x06017800);
    ApplyPalette(Pal_08418D40, 0x1D);
    StartSpriteAnimProc(SpriteAnim_08418D60, 0x86, 0x6C, 0xDBC0, 0, 0xD);

    proc->unk_30 = 0xFC3;
}
void sub_0809C3F4(ProcPtr proc)
{
    EndEachSpriteAnimProc();
    EndCgText();
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndFaceById(0);
    SetOnHBlankA(NULL);
}
void sub_0809C41C(struct SupportTactProc * proc)
{
    StartCgText(0x16, 0x13, 0x12, 4, proc->unk_30, (void *) 0x06011000, 10, 0);
    SetCgTextFlags(0x4E);
}
void sub_0809C44C(ProcPtr proc)
{
    if (!sub_808FFFC())
    {
        Proc_Break(proc);
        return;
    }

    if (gpKeySt->pressed & START_BUTTON)
    {
        Proc_Break(proc);
        PlaySoundEffect(0x38B);
    }
}
void sub_0809C49C(void)
{
    int ix;
    int iy;

    for (ix = 0; ix < 30; ix++)
    {
        for (iy = 0; iy < 20; iy++)
        {
            *(gUnk_02012BFC + TM_OFFSET(ix, iy + 0x00)) = gBg0Tm[TM_OFFSET(ix, iy)];
            *(gUnk_02012BFC + TM_OFFSET(ix, iy + 0x20)) = gBg1Tm[TM_OFFSET(ix, iy)];
            *(gUnk_02012BFC + TM_OFFSET(ix, iy + 0x40)) = gBg2Tm[TM_OFFSET(ix, iy)];
        }
    }
}
int GetSupportScreenPartnerCount(int charId)
{
    if (gCharacterData[charId - 1].pSupportData == NULL)
        return 0;

    return gCharacterData[charId - 1].pSupportData->count;
}
void DrawSupportSubScreenSprites(struct SubScreenProc * proc)
{
    u16 oam2;
    int i;
    int x;
    int y;

    PutSpriteExt(4, (proc->x + 128) & 0x1FF, 10, Sprite_08CC593C, 0x380);
    PutSpriteExt(4, (proc->x + 168) & 0x1FF, 10, Sprite_08CC5944, 0x380);
    PutSpriteExt(4, (proc->x + 200) & 0x1FF, 10, Sprite_08CC5952, 0x380);
    PutSpriteExt(4, (proc->x + 32) & 0x1FF, 80, Sprite_08CC5960, 0xE280);
    PutSpriteExt(4, (proc->x + 160) & 0x1FF, 144, Sprite_08CC596E, 0xE280);

    x = (proc->x + 112) & 0x1FF;
    y = proc->y + 22;

    for (i = 0; i < proc->partnerCount; i++)
    {
        oam2 = 0xc000;

        if (proc->partnerState[i] == 0)
            oam2 = 0xd000;

        if (proc->partnerState[i] == 2)
            oam2 = 0xf000;

        oam2 |= 0xc00;
        PutUnitSpriteForClassId(0, x, y + i * 16, oam2, proc->partnerClassId[i]);
    }

    PutSpriteExt(4, (proc->x + 8) & 0x1FF, 144, Sprite_08CC4FC4, 0x2bc0);

    SyncUnitSpriteSheet();
}
void DrawSupportSubScreenUnitPartnerText(struct SubScreenProc * proc, int idx)
{
    int _y;
    int i;
    int unitCharId;
    int partnerCharId;

    int supportLvCharLut[3] =
    {
        0x1B,
        0x1A,
        0x19,
    };

    if (proc->partnerState[idx] == 0)
    {
        for (i = 0; i < 5; i++)
            PutSpecialChar(gBg2Tm + TM_OFFSET(0x10 + i, _y = idx * 2 + 3), TEXT_COLOR_SYSTEM_GRAY, 0x14);

        for (i = 0; i < 2; i++)
            PutSpecialChar(gBg2Tm + TM_OFFSET(0x16 + i, _y = idx * 2 + 3), TEXT_COLOR_SYSTEM_GRAY, 0x14);

        for (i = 0; i < 3; i++)
            PutSpecialChar(gBg2Tm + TM_OFFSET(0x19 + i, _y = idx * 2 + 3), TEXT_COLOR_SYSTEM_GRAY, 0x14);
    }
    else
    {
        int color = 0;

        unitCharId = GetSupportScreenCharIdAt(proc->unitIdx);
        partnerCharId = GetSupportScreenPartnerCharId(proc->unitIdx, idx);

        if (proc->partnerState[idx] == 2)
            color = 1;

        PutDrawText(
            0, gBg2Tm + TM_OFFSET(16, 0) + (_y = ((idx * 2) + 3) * 0x20), color, 0, 5,
            DecodeMsg(gCharacterData[GetSupportScreenPartnerCharId(proc->unitIdx, idx) - 1].nameTextId));

        PutIcon(
            gBg2Tm + TM_OFFSET(16, 0) + TM_OFFSET(6, (idx * 2) + 3),
            gCharacterData[GetSupportScreenPartnerCharId(proc->unitIdx, idx) - 1].affinity + 0x79, 0xe000);

        if (GetUnitsAverageSupportValue(unitCharId, partnerCharId) == 2)
        {
            for (i = 0; i < 2; i++)
            {
                color = 1;
                if (proc->supportLevel[idx] == 2)
                    color = 4;
                else if (proc->supportLevel[idx] > i)
                    color = 0;

                PutSpecialChar(gBg2Tm + TM_OFFSET(0x19 + i, (idx * 2) + 3), color, supportLvCharLut[i]);
            }

            PutSpecialChar(gBg2Tm + 0x1B + (((idx * 2) + 3) * 0x20), TEXT_COLOR_SYSTEM_GRAY, 0x14);
        }
        else
        {
            for (i = 0; i < 3; i++)
            {
                color = 1;
                if (proc->supportLevel[idx] == 3)
                    color = 4;
                else if (proc->supportLevel[idx] > i)
                    color = 0;

                PutSpecialChar(gBg2Tm + TM_OFFSET(0x19 + i, (idx * 2) + 3), color, supportLvCharLut[i]);
            }
        }
    }
}
void DrawSupportSubScreenRemainingText(struct SubScreenProc * proc)
{
    char const * str;
    struct Font font;
    struct Text th;

    InitSpriteTextFont(&font, (void *) 0x06015000, 0xe);
    ApplyPalette(Pal_Text, 0x1E);

    InitSpriteText(&th);

    SetTextFont(&font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&th, 0);

    str = DecodeMsg(gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].nameTextId);

    Text_InsertDrawString(&th, GetStringTextCenteredPos(48, str), TEXT_COLOR_SYSTEM_WHITE, str);

    Text_InsertDrawString(
        &th, 48, proc->remainingSupports == 0 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x1280));

    Text_InsertDrawString(
        &th, 96, proc->remainingSupports == 0 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x1281));

    Text_SetCursor(&th, 112);

    Text_SetColor(&th, (proc->remainingSupports == 0) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumberOrBlank(&th, proc->remainingSupports);

    SetTextFont(NULL);
}
void InitSupportSubScreenPartners(struct SubScreenProc * proc)
{
    int i;
    int j;

    if (proc->fromPrepScreen)
    {
        for (i = 0; i < proc->partnerCount; i++)
        {
            int partnerCharId = GetSupportScreenPartnerCharId(proc->unitIdx, i);

            proc->partnerState[i] = 0;

            for (j = 1; j < 0x40; j++)
            {
                struct Unit * unit = GetUnit(j);

                if (!UNIT_IS_VALID(unit))
                    continue;

                if (unit->pCharacterData->number != partnerCharId)
                    continue;

                if (unit->state & US_BIT16)
                    continue;

                if (unit->state & US_DEAD)
                    proc->partnerState[i] = 2;
                else
                    proc->partnerState[i] = 1;
            }
        }
    }
    else
    {
        proc->unk_3b = 0;

        for (i = 0; i < proc->partnerCount; i++)
        {
            proc->partnerState[i] = 0;

            if (GetSupportScreenPartnerIsAlive(proc->unitIdx, i))
            {
                proc->partnerState[i] = 1;
                proc->unk_3b += GetSupportScreenPartnerSupportLevel(proc->unitIdx, i);
            }
        }
    }
}
void InitSupportSubScreenPartnerLevels(struct SubScreenProc * proc)
{
    int i;

    for (i = 0; i < proc->partnerCount; i++)
        proc->supportLevel[i] = GetSupportScreenPartnerSupportLevel(proc->unitIdx, i);
}
void InitSupportSubScreenRemainingSupports(struct SubScreenProc * proc)
{
    int i;

    if (proc->fromPrepScreen)
    {
        proc->remainingSupports = 5 - GetTotalSupportLevel(proc->unitIdx);
    }
    else
    {
        int charId = GetSupportScreenCharIdAt(proc->unitIdx);

        proc->remainingSupports = 0;

        for (i = 0; i < proc->partnerCount; i++)
            proc->remainingSupports += GetUnitsAverageSupportValue(charId, GetSupportScreenPartnerCharId(proc->unitIdx, i));

        proc->remainingSupports -= GetTotalSupportLevel(proc->unitIdx);
    }
}
void DrawSupportSubScreenUnitPartnerDetails(struct SubScreenProc * proc)
{
    int i;

    ResetUnitSprites();

    for (i = 0; i < proc->partnerCount; i++)
    {
        proc->partnerClassId[i] = GetSupportScreenPartnerClassId(proc->unitIdx, i);
        UseUnitSprite(GetClassSMSId(proc->partnerClassId[i]));
    }

    ForceSyncUnitSpriteSheet();

    for (i = 0; i < proc->partnerCount; i++)
        DrawSupportSubScreenUnitPartnerText(proc, i);
}
void SupportSubScreen_MoveCursorToNextValidUnit(struct SubScreenProc * proc, int partnerIdx, int step)
{
    while (1)
    {
        if (partnerIdx < 0)
            return;

        if (partnerIdx > (proc->partnerCount - 1))
            return;

        if (proc->partnerState[partnerIdx] & 1)
        {
            if (GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx) > 0)
            {
                proc->unk_39 = (proc->unk_39 & 0xe3) + ((partnerIdx & 7) << 2);

                if ((proc->unk_39 & 3) >= GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx))
                {
                    proc->unk_39 = (proc->unk_39 & 0xfc) +
                        (GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx) - 1);
                }

                return;
            }
        }

        partnerIdx += step;
    }
}
void SupportSubScreen_Init(struct SubScreenProc * proc)
{
    proc->x = 0;
    proc->y = 0;
    proc->unk_39 &= 0xfc;
    proc->unk_39 &= 0xe3;
    proc->partnerCount = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(proc->unitIdx));

    InitSupportSubScreenPartners(proc);
    InitSupportSubScreenPartnerLevels(proc);
    InitSupportSubScreenRemainingSupports(proc);
    SupportSubScreen_MoveCursorToNextValidUnit(proc, 0, +1);
}
void sub_0809CBD8(void)
{
    int i;
    u16 * src = PAL_OBJ(0xC);
    u16 * dst = PAL_OBJ(0xD);

    for (i = 0; i < 0x10; dst++, src++, i++)
        *dst = (((*src & 0x1f) >> 1) & 0x1f) + (((*src & 0x3e0) >> 1) & 0x3e0) + (((*src & 0x7c00) >> 1) & 0x7c00);
}
void SupportSubScreen_SetupGraphics(struct SubScreenProc * proc)
{
    int fid;

    gDispIo.disp_ct.mode = 0;

    InitBgs(NULL);

    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    ResetText();
    InitIcons();

    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    ApplyUnitSpritePalettes();
    sub_0809CBD8();
    ApplyIconPalettes(0xd);

    StartGreenText(proc);

    if (!proc->fromPrepScreen)
    {
        gPlaySt.cfgTextSpeed = 1;

        ResetSysHandCursor(proc);
        DisplaySysHandCursorTextShadow(0x600, 1);
        ConfigSysHandCursorShadowEnabled(1);

        proc->unk_3a = -1;

        if (proc->unk_3b != 0)
        {
            ShowSysHandCursor((proc->unk_39 & 3) * 8 + 0xc4, ((proc->unk_39 >> 2) & 7) * 16 + 0x18, 1, 0x800);
        }
    }

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    SetBlendConfig(0, 0, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    PrepRestartMuralBackground();

    sub_08091944(0x4000, 5);

    PutCompressedTsa(gBg1Tm, Tsa_0840ECC4, 0x5200);

    fid = gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].portraitId;

    if (ShouldFaceBeRaised(fid))
    {
        proc->unk_3f = 0;
        StartBmFace(0, fid, 0x38, 0, 0x100);
    }
    else
    {
        proc->unk_3f = 8;
        StartBmFace(0, fid, 0x38, 8, 0x104);
    }

    Decompress(Img_0840EDB8, (void *) 0x06017000);
    Decompress(Img_0840E40C, (void *) 0x06017800);
    ApplyPalette(Pal_0840E4EC, 0x12);

    DrawSupportSubScreenUnitPartnerDetails(proc);
    DrawSupportSubScreenRemainingText(proc);

    StartParallelWorker(DrawSupportSubScreenSprites, proc);
}
void SupportSubScreen_Loop_KeyHandler(struct SubScreenProc * proc)
{
    if (gpKeySt->pressed & B_BUTTON)
    {
        PlaySoundEffect(0x38B);
        Proc_Goto(proc, 3);
        return;
    }

    if (gpKeySt->repeated & R_BUTTON)
    {
        Proc_Goto(proc, 4);
        return;
    }

    if (gpKeySt->repeated & L_BUTTON)
    {
        Proc_Goto(proc, 5);
        return;
    }

    if (proc->fromPrepScreen)
        return;

    if (proc->unk_3b != 0)
    {
        u32 previous = proc->unk_39;

        if (gpKeySt->pressed & A_BUTTON)
        {
            PlaySoundEffect(0x38A);
            Proc_Goto(proc, 2);
            return;
        }

        if (gpKeySt->repeated & DPAD_LEFT)
        {
            if ((proc->unk_39 & 3) != 0)
            {
                int unk = (proc->unk_39 & 0xfc) + 0xFF;
                proc->unk_39 = unk + (proc->unk_39 & 3);
            }
        }

        if (gpKeySt->repeated & DPAD_RIGHT)
        {
            if ((proc->unk_39 & 3) < GetSupportScreenPartnerSupportLevel(proc->unitIdx, (proc->unk_39 >> 2) & 7) - 1)
            {
                int unk = (proc->unk_39 & 0xfc) + 1;
                proc->unk_39 = unk + (proc->unk_39 & 3);
            }
        }

        if (gpKeySt->repeated & DPAD_UP)
            SupportSubScreen_MoveCursorToNextValidUnit(proc, ((proc->unk_39 >> 2) & 7) - 1, -1);

        if (gpKeySt->repeated & DPAD_DOWN)
            SupportSubScreen_MoveCursorToNextValidUnit(proc, ((proc->unk_39 >> 2) & 7) + 1, +1);

        if (previous != proc->unk_39)
        {
            ShowSysHandCursor((proc->unk_39 & 3) * 8 + 0xc4, ((proc->unk_39 >> 2) & 7) * 16 + 0x18, 1, 0x800);
            PlaySoundEffect(0x385);
        }
    }
    else
    {
        if (gpKeySt->pressed & A_BUTTON)
            PlaySoundEffect(0x38C);

        return;
    }
}
void sub_0809CFF8(struct SubScreenProc * proc)
{
    InitBgs(NULL);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 1, 0, 0, 0);

    InitFaces();

    ResetText();
    InitIcons();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    StartSupportViewerTalk(
        GetSupportScreenCharIdAt(proc->unitIdx),
        GetSupportScreenPartnerCharId(proc->unitIdx, proc->unk_39 >> 2 & 7),
        (proc->unk_39 & 3) + 1);
}
void SupportSubScreen_StartSwapPage(struct SubScreenProc * proc)
{
    proc->unk_3a = 0;

    HideSysHandCursor();

    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 0;

    SetBlendConfig(1, 0, 0x10, 0);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 0, 1);

    sub_0809C49C();

    PlaySoundEffect(0xC8);
}
void sub_0809D15C(u32 xBase)
{
    int ix;
    int iy;

    for (ix = 0; ix < 30; ix++)
    {
        u32 x = ix + xBase;
        if (x < 30)
        {
            for (iy = 0; iy < 20; iy++)
            {
                *(gBg0Tm + TM_OFFSET(ix, iy)) = *(gUnk_02012BFC + TM_OFFSET(x, iy + 0x00));
                *(gBg1Tm + TM_OFFSET(ix, iy)) = *(gUnk_02012BFC + TM_OFFSET(x, iy + 0x20));
                *(gBg2Tm + TM_OFFSET(ix, iy)) = *(gUnk_02012BFC + TM_OFFSET(x, iy + 0x40));
            }
        }
        else
        {
            for (iy = 0; iy < 20; iy++)
            {
                *(gBg0Tm + TM_OFFSET(ix, iy)) = 0;
                *(gBg1Tm + TM_OFFSET(ix, iy)) = 0;
                *(gBg2Tm + TM_OFFSET(ix, iy)) = 0;
            }
        }
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}
void SupportSubScreen_SwapPageOut_ToLeft(struct SubScreenProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = -b * 8;
    sub_0809D15C(b);

    SetFacePosition(0, (proc->x + 0x38) & 0x1FF, proc->unk_3f);

    SetBlendConfig(1, c, 0x10 - c, 0);

    if (proc->unk_3a == 10)
    {
        Proc_Break(proc);
        proc->unitIdx = GetNextSupportScreenUnit(proc->unitIdx);
    }
}
void SupportSubScreen_SwapPageIn_FromRight(struct SubScreenProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = (8 - b) * 8;

    sub_0809D15C(b - 8);

    SetFacePosition(0, (proc->x + 0x38) & 0x1FF, proc->unk_3f);

    SetBlendConfig(1, 0x10 - c, c, 0);

    if (proc->unk_3a == 10)
        Proc_Break(proc);
}
void SupportSubScreen_SwapPageOut_ToRight(struct SubScreenProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = b * 8;

    sub_0809D15C(-b);

    SetFacePosition(0, (proc->x + 0x38) & 0x1FF, proc->unk_3f);

    SetBlendConfig(1, c, 0x10 - c, 0);

    if (proc->unk_3a == 10)
    {
        Proc_Break(proc);
        proc->unitIdx = GetPreviousSupportScreenUnit(proc->unitIdx);
    }
}
void SupportSubScreen_SwapPageIn_FromLeft(struct SubScreenProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = (b - 8) * 8;

    sub_0809D15C(8 - b);

    SetFacePosition(0, (proc->x + 0x38) & 0x1FF, proc->unk_3f);

    SetBlendConfig(1, 0x10 - c, c, 0);

    if (proc->unk_3a == 10)
        Proc_Break(proc);
}
void SupportSubScreen_ReinitAfterSwapPage(struct SubScreenProc * proc)
{
    int fid;

    InitFaces();
    ResetText();
    InitIcons();

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    proc->unk_39 = proc->unk_39 & 0xfc;
    proc->unk_39 = proc->unk_39 & 0xe3;

    proc->partnerCount = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(proc->unitIdx));

    InitSupportSubScreenPartners(proc);
    InitSupportSubScreenPartnerLevels(proc);
    InitSupportSubScreenRemainingSupports(proc);
    SupportSubScreen_MoveCursorToNextValidUnit(proc, 0, +1);

    PutCompressedTsa(gBg1Tm, Tsa_0840ECC4, 0x5200);

    fid = gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].portraitId;

    if (ShouldFaceBeRaised(fid))
    {
        proc->unk_3f = 0;
        StartBmFace(0, fid, 0x38, 0, 0x100);
    }
    else
    {
        proc->unk_3f = 8;
        StartBmFace(0, fid, 0x38, 8, 0x104);
    }

    DrawSupportSubScreenUnitPartnerDetails(proc);
    DrawSupportSubScreenRemainingText(proc);
    sub_0809C49C();

    proc->unk_3a = 0;
}
void SupportSubScreen_EndSwapPage(struct SubScreenProc * proc)
{
    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    SetBlendConfig(1, 0, 0xc, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    if (proc->fromPrepScreen == 0)
    {
        if (proc->unk_3b != 0)
        {
            ShowSysHandCursor((proc->unk_39 & 3) * 8 + 0xc4, (proc->unk_39 >> 2 & 7) * 16 + 0x18, 1, 0x800);

            proc->unk_3a = -1;
        }
    }
}
void SupportSubScreen_OnEnd(struct SubScreenProc * proc)
{
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndFaceById(0);
    sub_0809BF78(proc->unitIdx);
}
void SupportSubScreen_PrepareSupportConvo(struct SubScreenProc * proc)
{
    proc->songId = UiSupport_GetSupportTalkSong(proc->unitIdx, proc->unk_39 >> 2 & 7, (proc->unk_39 & 3) + 1);

    if (proc->songId == 0)
        CallSomeSoundMaybe(0x30, 0x100, 0x80, 0x10, NULL);
    else
        CallSomeSoundMaybe(proc->songId, 0x100, 0x100, 0x10, NULL);
}
void sub_0809D71C(struct SubScreenProc * proc)
{
    if (proc->songId == 0)
        CallSomeSoundMaybe(0x30, 0x80, 0x100, 0x10, NULL);
    else
        CallSomeSoundMaybe(0x30, 0x100, 0x100, 0x10, NULL);
}
void StartSupportUnitSubScreen(s8 fromPrepScreen, int unitIndex, ProcPtr parent)
{
    struct SubScreenProc * proc = Proc_StartBlocking(gProcScr_SupportUnitSubScreen, parent);

    proc->fromPrepScreen = fromPrepScreen;
    proc->unitIdx = unitIndex;
}
