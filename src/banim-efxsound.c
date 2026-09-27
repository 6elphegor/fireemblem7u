#include "gbafe.h"

/**
 * Battle animation sound effects (fireemblem8u: banim-efxsound.c)
 */

extern int gEkrMainBgmPlaying;
extern int gEfxSoundSeExist;
extern s16 gEfxHpLutOff[];
extern s16 gEkrInitialHitSide;
extern s16 gBanimTerrain[2];
extern s16 gBanimCon[2];

void Sound_SetBGMVolume(int volume);
void SetBgmVolume(int volume);
void m4aMPlayImmInit(struct MusicPlayerInfo * mplayInfo);
void MPlayPanpotControl(struct MusicPlayerInfo * mplayInfo, u16 trackBits, s8 pan);
void MPlayStop_rev01(struct MusicPlayerInfo * mplayInfo);
void MakeBgmOverridePersist(void);
void sub_08003AF8(void);
void Sound_SetDefaultMaxNumChannels(void);
s8 sub_08079A9C(void);
void sub_08079A90(void);
int GetBattleAnimArenaFlag(void);
int CheckBanimHensei(void);
int GetProperAnimSoundLocation(struct Anim * anim);
int IsAnimSoundInPositionMaybe(struct Anim * anim);
void RegisterEfxSoundSeExist(void);
int CheckEfxSoundSeExist(void);
void M4aPlayWithPostionCtrl(int songid, int x, int flag);
void EfxPlayCriticalHittedSFX(struct Anim * anim);
int GetBanimBossBGM(struct Unit * unit);
u16 GetEfxSoundType1FromTerrain(u16 terrain);
u16 GetEfxSoundType2FromBaseCon(u16 basecon);

CONST_DATA struct ProcCmd ProcScr_efxSoundSE[] = {
    PROC_19,
    PROC_REPEAT(Loop6C_efxSoundSE),
    PROC_END,
};

CONST_DATA int gBanimBossBGMs[] = {
    135, 20,
    137, 20,
    141, 20,
    142, 20,
    148, 20,
    153, 20,
    159, 20,
    166, 20,
    173, 20,
    182, 20,
    190, 20,
    197, 21,
    60, 20,
    61, 20,
    63, 20,
    64, 20,
    65, 20,
    69, 20,
    70, 20,
    71, 20,
    72, 20,
    73, 21,
    12, 21,
    74, 21,
    75, 21,
    76, 21,
    92, 21,
    77, 21,
    78, 20,
    79, 21,
    80, 21,
    83, 21,
    84, 21,
    59, 21,
    99, 22,
    100, 22,
    87, 21,
    33, 21,
    43, 21,
    88, 21,
    89, 21,
    81, 22,
    90, 20,
    91, 22,
    101, 22,
    102, 22,
    93, 21,
    94, 21,
    96, 21,
    133, 22,
    68, 23,
    247, 21,
    250, 21,
    249, 21,
    244, 22,
    245, 22,
    248, 22,
    246, 22,
    86, 21,
    134, 24,
    -1, -1,
};

CONST_DATA u16 gBanimSongLists[4][7][8] = {
    {
        { 0x14A, 0x14B, 0x14C, 0x14D, 0x14E, 0x14F, 0x150, 0x151 },
        { 0x154, 0x155, 0x156, 0x157, 0x158, 0x159, 0x15A, 0x15B },
        { 0x15E, 0x15F, 0x160, 0x161, 0x162, 0x163, 0x164, 0x165 },
        { 0x168, 0x169, 0x16A, 0x16B, 0x16C, 0x16D, 0x16E, 0x16F },
        { 0x172, 0x173, 0x174, 0x175, 0x176, 0x177, 0x178, 0x179 },
        { 0x17C, 0x17D, 0x17E, 0x17F, 0x180, 0x181, 0x182, 0x183 },
        { 0x186, 0x187, 0x188, 0x189, 0x18A, 0x18B, 0x18C, 0x18D },
    },
    {
        { 0x190, 0x191, 0x19A, 0x19B, 0x1A4, 0x1A5, 0x1A4, 0x1A5 },
        { 0x1AE, 0x1AF, 0x1B8, 0x1B9, 0x1C2, 0x1C3, 0x1C2, 0x1C3 },
        { 0x1CC, 0x1CD, 0x1D6, 0x1D7, 0x1E0, 0x1E1, 0x1E0, 0x1E1 },
        { 0x1EA, 0x1EB, 0x1F4, 0x1F5, 0x1FE, 0x1FF, 0x1FE, 0x1FF },
        { 0x208, 0x209, 0x212, 0x213, 0x21C, 0x21D, 0x21C, 0x21D },
        { 0x226, 0x227, 0x230, 0x231, 0x23A, 0x23B, 0x23A, 0x23B },
        { 0x244, 0x245, 0x24E, 0x24F, 0x258, 0x259, 0x258, 0x259 },
    },
    {
        { 0x192, 0x193, 0x19C, 0x19D, 0x1A6, 0x1A7, 0x1A6, 0x1A7 },
        { 0x1B1, 0x1B0, 0x1BA, 0x1BB, 0x1C4, 0x1C5, 0x1C4, 0x1C5 },
        { 0x1CE, 0x1CF, 0x1D8, 0x1D9, 0x1E2, 0x1E3, 0x1E2, 0x1E3 },
        { 0x1EC, 0x1ED, 0x1F6, 0x1F7, 0x200, 0x201, 0x200, 0x201 },
        { 0x20A, 0x20B, 0x214, 0x215, 0x21E, 0x21F, 0x21E, 0x21F },
        { 0x228, 0x229, 0x232, 0x233, 0x23C, 0x23D, 0x23C, 0x23D },
        { 0x246, 0x247, 0x250, 0x251, 0x25A, 0x25B, 0x25A, 0x25B },
    },
    {
        { 0x194, 0x195, 0x19E, 0x19F, 0x1A8, 0x1A9, 0x1A8, 0x1A9 },
        { 0x1B2, 0x1B3, 0x1BC, 0x1BD, 0x1C6, 0x1C7, 0x1C6, 0x1C7 },
        { 0x1D0, 0x1D1, 0x1DA, 0x1DB, 0x1E4, 0x1E5, 0x1E4, 0x1E5 },
        { 0x1EE, 0x1EF, 0x1F8, 0x1F9, 0x202, 0x203, 0x202, 0x203 },
        { 0x20C, 0x20D, 0x216, 0x217, 0x220, 0x221, 0x220, 0x221 },
        { 0x22A, 0x22B, 0x234, 0x235, 0x23E, 0x23F, 0x23E, 0x23F },
        { 0x248, 0x249, 0x252, 0x253, 0x25C, 0x25D, 0x25C, 0x25D },
    },
};

CONST_DATA u16 * gBanimSongTable1[] = {
    gBanimSongLists[0][0],
    gBanimSongLists[0][1],
    gBanimSongLists[0][2],
    gBanimSongLists[0][3],
    gBanimSongLists[0][4],
    gBanimSongLists[0][5],
    gBanimSongLists[0][6],
};

CONST_DATA u16 * gBanimSongTable2[] = {
    gBanimSongLists[1][0],
    gBanimSongLists[1][1],
    gBanimSongLists[1][2],
    gBanimSongLists[1][3],
    gBanimSongLists[1][4],
    gBanimSongLists[1][5],
    gBanimSongLists[1][6],
};

CONST_DATA u16 * gBanimSongTable3[] = {
    gBanimSongLists[2][0],
    gBanimSongLists[2][1],
    gBanimSongLists[2][2],
    gBanimSongLists[2][3],
    gBanimSongLists[2][4],
    gBanimSongLists[2][5],
    gBanimSongLists[2][6],
};

CONST_DATA u16 * gBanimSongTable4[] = {
    gBanimSongLists[3][0],
    gBanimSongLists[3][1],
    gBanimSongLists[3][2],
    gBanimSongLists[3][3],
    gBanimSongLists[3][4],
    gBanimSongLists[3][5],
    gBanimSongLists[3][6],
};

void EfxPlaySE(int songid, int volume)
{
    struct ProcEfxSoundSE * proc;

    if (gBmSt.flags & BM_FLAG_5)
        return;

    if (CheckEfxSoundSeExist() == 0)
    {
        RegisterEfxSoundSeExist();
        Sound_SetBGMVolume(volume);
        PlaySoundEffect(songid);
        return;
    }

    proc = Proc_Start(ProcScr_efxSoundSE, PROC_TREE_3);
    proc->volume = volume;
    proc->index = songid;
    proc->timer = 0;
}

void Loop6C_efxSoundSE(struct ProcEfxSoundSE * proc)
{
    if (++proc->timer == 5)
    {
        Proc_Break(proc);
        return;
    }

    if (CheckEfxSoundSeExist() == 0)
    {
        RegisterEfxSoundSeExist();
        Sound_SetBGMVolume(proc->volume);
        PlaySoundEffect(proc->index);
        Proc_Break(proc);
    }
}

void DoM4aSongNumStop(int songid)
{
    m4aSongNumStop(songid);
}

void EfxOverrideBgm(int songid, int volume)
{
    if (gBmSt.flags & BM_FLAG_5)
        return;

    SetBgmVolume(volume);
    OverrideBgm(songid);
}

void StopBGM1(void)
{
    MPlayStop_rev01(&gUnk_03005B10);
}

void UnregisterEfxSoundSeExist(void)
{
    gEfxSoundSeExist = false;
}

void RegisterEfxSoundSeExist(void)
{
    gEfxSoundSeExist = true;
}

int CheckEfxSoundSeExist(void)
{
    return gEfxSoundSeExist;
}

void M4aPlayWithPostionCtrl(int songid, int x, int flag)
{
    int pan;

    if (gBmSt.flags & BM_FLAG_5)
        return;

    if (flag != 0)
    {
        struct MusicPlayerInfo * info;
        if (x <= 0x77)
            pan = Div(x * x, 0x78) - 0x78;
        else
            pan = 0x78 - Div((0xF0 - x) * (0xF0 - x), 0x78);

        info = gMPlayTable[gSongTable[songid].ms].info;
        m4aMPlayImmInit(info);
        MPlayPanpotControl(info, 0xFFFF, pan);
    }
    else
    {
        struct MusicPlayerInfo * info;
        info = gMPlayTable[gSongTable[songid].ms].info;
        m4aMPlayImmInit(info);
        MPlayPanpotControl(info, 0xFFFF, Screen2Pan(x));
    }
}

void EfxPlaySEwithCmdCtrl(struct Anim * anim, int cmd)
{
    u16 sound_type, sound_pos, val2;
    int pos, terrain, volume, basecon;
    int songid;
    s16 _songid;
    u16 * song_table;

    struct Anim * anim2 = GetAnimAnotherSide(anim);

    if (GetAISLayerId(anim) == 1)
        return;

    pos = GetAnimPosition(anim);
    if (pos == POS_L)
        terrain = gBanimTerrain[POS_L];
    else
        terrain = gBanimTerrain[POS_R];

    sound_type = GetEfxSoundType1FromTerrain(terrain);
    if (terrain == 0x14)
    {
        if (IsAnimSoundInPositionMaybe(anim) == 0)
            sound_type = 2;
    }

    if (pos == POS_L)
        basecon = gBanimCon[POS_L];
    else
        basecon = gBanimCon[POS_R];

    val2 = GetEfxSoundType2FromBaseCon(basecon);

    songid = (u16)-1;
    sound_pos = GetProperAnimSoundLocation(anim) + anim->xPosition;
    volume = 0x100;

    switch (cmd) {
    case 25:
        songid = 0xD1;
        break;

    case 27:
        song_table = gBanimSongTable1[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 28:
        song_table = gBanimSongTable2[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 29:
        song_table = gBanimSongTable3[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 30:
        song_table = gBanimSongTable4[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 31:
        EfxPlayCriticalHittedSFX(anim2);

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = 0xD2;
            break;

        case EFX_HPT_DEFEATED:
            songid = 0xD5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = 0x2CE;
            break;
        }
        sound_pos = anim2->xPosition + GetProperAnimSoundLocation(anim2);
        break;

    case 32:
        EfxPlayCriticalHittedSFX(anim2);

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = 0xD3;
            break;

        case EFX_HPT_DEFEATED:
            songid = 0xD5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = 0x2CE;
            break;
        }
        sound_pos = anim2->xPosition + GetProperAnimSoundLocation(anim2);
        break;

    case 33:
        EfxPlayCriticalHittedSFX(anim2);

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = 0xD4;
            break;

        case EFX_HPT_DEFEATED:
            songid = 0xD5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = 0x2CE;
            break;
        }
        sound_pos = anim2->xPosition + GetProperAnimSoundLocation(anim2);
        break;

    case 34: songid = 0xC9; break;
    case 35: songid = 0xC8; break;
    case 36: songid = 0xCA; break;

    case 37:
        songid = 0x263;
        if (pos == POS_L)
            songid = songid - 1;
        break;

    case 40: songid = 0xF6; break;
    case 41: songid = 0x141; break;
    case 42: songid = 0x142; break;

    case 43:
        songid = 0x267;
        if (pos == POS_L)
            songid = songid - 1;
        break;

    case 47: songid = 0x2F8; break;
    case 51: songid = 0xE7; break;

    case 52:
        song_table = gBanimSongTable1[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 53:
        songid = 0x265;
        if (pos == POS_L)
            songid = songid - 1;
        break;

    case 54: songid = 0xCE; break;
    case 55: songid = 0xCF; break;
    case 56: songid = 0xCB; break;
    case 58: songid = 0x2D3; break;
    case 59: songid = 0x2D4; break;

    case 60:
        songid = 0x263;
        if (pos == POS_L)
            songid = songid - 1;

        volume = 0x80;
        break;

    case 62: songid = 0xF1; break;
    case 63: songid = 0x136; break;
    case 64: songid = 0x117; break;
    case 65: songid = 0xEB; break;
    case 66: songid = 0xEA; break;
    case 67: songid = 0x2CF; break;
    case 68: songid = 0x2D0; break;
    case 69: songid = 0x2D1; break;
    case 70: songid = 0x2D2; break;
    case 72: songid = 0xED; break;
    case 73: songid = 0x135; break;
    case 74: songid = 0x134; break;
    case 75: songid = 0x2DD; break;
    case 76: songid = 0x2DE; break;
    case 77: songid = 0x2DF; break;
    case 79: songid = 0x2F7; break;
    case 80: songid = 0x2E8; break;

    default:
        songid = 0;
        break;
    }

    _songid = songid;
    if (_songid != -1)
    {
        register int r1 asm("r1");
        register int r2 asm("r2");

        r1 = volume;
        EfxPlaySE(_songid, r1);
        r1 = (s16)sound_pos;
        r2 = 1;
        M4aPlayWithPostionCtrl(_songid, r1, r2);
    }
}

u16 GetEfxSoundType1FromTerrain(u16 terrain)
{
    int ret;

    if (GetBattleAnimArenaFlag() == true)
        return 0;

    switch (terrain) {
    case 1: case 2: case 3: case 4: case 5: case 10: case 17: case 25:
    case 26: case 27: case 28: case 34: case 35: case 37: case 39: case 40:
    case 41: case 43: case 47: case 51: case 56: case 57: case 63: case 64:
        ret = 0;
        break;

    case 12: case 13:
        ret = 1;
        break;

    case 16: case 21: case 22: case 54: case 60:
        ret = 2;
        break;

    case 18: case 38: case 42: case 58: case 59: case 61:
        ret = 3;
        break;

    case 14: case 15:
        ret = 4;
        break;

    case 19: case 20:
        ret = 5;
        break;

    case 6: case 7: case 8: case 9: case 11: case 23: case 24: case 29:
    case 30: case 31: case 32: case 33: case 36: case 45: case 48: case 49:
    case 50: case 55: case 62:
        ret = 6;
        break;

    case 0:
    default:
        ret = 0;
        break;
    }
    return ret;
}

int IsAnimSoundInPositionMaybe(struct Anim * anim)
{
    int sound_pos = GetProperAnimSoundLocation(anim) + anim->xPosition;
    if (GetAnimPosition(anim) == POS_L)
    {
        if (sound_pos > 0x58)
            return false;
        else
            return true;
    }
    else
    {
        if (sound_pos <= 0x97)
            return false;
        else
            return true;
    }
}

u16 GetEfxSoundType2FromBaseCon(u16 basecon)
{
    int ret = 0;
    if (basecon >= 5)
    {
        if (basecon <= 8)
            ret = 1;
        else if (basecon <= 0xB)
            ret = 2;
        else if (basecon <= 0xF)
            ret = 3;
    }
    return ret;
}

s16 GetEfxHpChangeType(struct Anim * anim)
{
    int offset, hp1, hp2;
    offset = gEfxHpLutOff[GetAnimPosition(anim)];
    offset = offset * 2 + GetAnimPosition(anim);

    hp1 = GetEfxHp(offset);
    hp2 = GetEfxHp(offset + 2);

    if (hp1 != hp2)
    {
        if (hp2 != 0)
            return EFX_HPT_CHANGED;

        return EFX_HPT_DEFEATED;
    }
    return EFX_HPT_NOT_CHANGE;
}

void EfxPlayHittedSFX(struct Anim * anim)
{
    int songid = (u16)-1;
    s16 _songid;

    EfxPlayCriticalHittedSFX(anim);

    switch (GetEfxHpChangeType(anim)) {
    case EFX_HPT_CHANGED:
        songid = 0xD4;
        break;

    case EFX_HPT_DEFEATED:
        songid = 0xD5;
        break;

    case EFX_HPT_NOT_CHANGE:
        songid = 0x2CE;
        break;

    default:
        break;
    }

    _songid = songid;
    if (_songid != -1)
    {
        EfxPlaySE(_songid, 0x100);
        M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
    }
}

void EfxPlayCriticalHittedSFX(struct Anim * anim)
{
    struct Anim * animr = GetAnimAnotherSide(anim);

    switch (GetEfxHpChangeType(anim)) {
    case EFX_HPT_CHANGED:
    case EFX_HPT_DEFEATED:
        if (CheckRoundCrit(animr) == true)
        {
            EfxPlaySE(0xD8, 0x100);
            M4aPlayWithPostionCtrl(0xD8, anim->xPosition, 1);
        }
        break;
    }
}

int EfxCheckRetaliation(int is_retaliation)
{
    int ret;
    struct BattleHit * hit = gBattleHitArray;

    if (hit->info & BATTLE_HIT_INFO_RETALIATION)
        ret = true;
    else
        ret = false;

    if (is_retaliation == ret)
        return true;

    return false;
}

int EfxCheckStaffType(int weapon)
{
    if (!weapon)
        return 0;

    switch (GetItemIndex(weapon)) {
    case 0x4A: case 0x4B: case 0x4C: case 0x4D: case 0x4E: case 0x4F:
    case 0x56: case 0x58:
        return 2;

    case 0x50: case 0x51: case 0x52:
        return 1;

    default:
        return 0;
    }
}

void EkrPlayMainBGM(void)
{
    int ret, songid, songid2, pid, staff_type;
    struct BattleUnit * bul, * bur, ** pbul, ** pbur;

    pbul = &gpEkrBattleUnitLeft;
    pbur = &gpEkrBattleUnitRight;

    bul = *pbul;
    bur = *pbur;

    if (gBmSt.flags & BM_FLAG_5)
    {
        gEkrMainBgmPlaying = 0;
        return;
    }

    gEkrMainBgmPlaying = 1;

    songid = gBanimFactionPal[gEkrInitialHitSide] != 1 ? 0x1F : 0x20;

    if (GetBattleAnimArenaFlag() == 1)
    {
        Sound_SetDefaultMaxNumChannels();
        EfxOverrideBgm(0x48, 0x100);
        return;
    }

    if (GetBanimLinkArenaFlag() == 1)
    {
        EfxOverrideBgm(0x48, 0x100);
        return;
    }

    if (gEkrDistanceType == 4)
    {
        EfxOverrideBgm(0x1B, 0x100);
        return;
    }

    ret = gBanimValid[POS_L] != 0;
    if (gPlaySt.chapterIndex != 0x3E)
        ret = false;
    if (UNIT_CHAR_ID(&bul->unit) != 0x44)
        ret = false;
    if (UNIT_CHAR_ID(&bur->unit) != 0x27)
        ret = false;

    if (ret != true)
    {
        ret = false;
        if ((s16)IsWeaponLegency(bur->weaponBefore) == true)
            ret = true;

        if (!EkrCheckAttackRound(1))
            ret = false;

        if (gBanimValid[POS_L] == false)
            ret = false;

        pid = UNIT_CHAR_ID(&bul->unit);
        if (pid == 0x44)
            ret = false;

        if (pid == 0x86)
            ret = false;

        if (ret != true)
            goto next;
    }

    EfxOverrideBgm(0x1C, 0x100);
    return;

next:
    if (pid == 0x86)
    {
        if (sub_08079A9C() == true)
        {
            EfxOverrideBgm(0x6F, 0x100);
            return;
        }
        sub_08079A90();
    }

    songid2 = GetBanimBossBGM(&bul->unit);

    if (UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bul->unit))) == FACTION_BLUE)
        songid2 = -1;

    if (gBanimValid[POS_L] == false)
        songid2 = -1;

    if (songid2 != -1)
    {
        EfxOverrideBgm(songid2, 0x100);
        return;
    }

    ret = false;
    if ((bul->unit.pCharacterData->attributes | bul->unit.pClassData->attributes) & 0x80000)
    {
        s8 chapter = gPlaySt.chapterIndex;
        if (chapter == 0x2E)
            ret = true;
        if (chapter == 0x2F)
            ret = true;
    }

    if (ret == true)
    {
        EfxOverrideBgm(0x14, 0x100);
        return;
    }

    ret = false;
    if (UNIT_CLASS_ID(&bur->unit) == 0x40)
    {
        if (gBattleStats.config & 0x40)
            ret = true;

        if (gBattleStats.config & 0x200)
            ret = true;
    }

    if (ret == true)
    {
        EfxOverrideBgm(0x1D, 0x100);
        return;
    }

    ret = false;
    if (UNIT_CLASS_ID(&bur->unit) == 0x41)
    {
        if (gBattleStats.config & 0x40)
            ret = true;

        if (gBattleStats.config & 0x200)
            ret = true;
    }

    if (ret == true)
    {
        EfxOverrideBgm(0x1E, 0x100);
        return;
    }

    if (EfxCheckRetaliation(POS_L) == true)
        staff_type = EfxCheckStaffType(gBattleActor.weaponBefore);
    else if (EfxCheckRetaliation(POS_R) == true)
        staff_type = EfxCheckStaffType(gBattleTarget.weaponBefore);
    else
        staff_type = 0;

    switch (staff_type) {
    case 2:
        songid = 0x1A;
        break;

    case 1:
        songid = 0x19;
        break;

    default:
        break;
    }

    if (songid != -1)
    {
        EfxOverrideBgm(songid, 0x100);
        return;
    }
    gEkrMainBgmPlaying = false;
}

void EkrRestoreBGM(void)
{
    if (CheckBanimHensei() == true || gBmSt.flags & BM_FLAG_5 || gEkrMainBgmPlaying == false)
    {
        MakeBgmOverridePersist();
        return;
    }

    sub_08003AF8();
}

int GetBanimBossBGM(struct Unit * unit)
{
    int i, pid = UNIT_CHAR_ID(unit);
    for (i = 0; gBanimBossBGMs[i] != -1; i = i + 2)
    {
        if (pid == gBanimBossBGMs[i])
            break;
    }
    return gBanimBossBGMs[i + 1];
}

int GetProperAnimSoundLocation(struct Anim * anim)
{
    int header, val2, val1;
    u32 ret;
    const struct AnimSpriteData * anim_sprite, * it;

    anim_sprite = anim->pSpriteData;
    header = anim_sprite->header;

    if ((header & 0xFFFF0000) == 0xFFFF0000)
        for (val2 = (header & 0x0000FFFF); val2 != 0; val2--, anim_sprite++);

    it = anim_sprite;
    val2 = 0;
    val1 = 0;

    for (; it->header != 1; it++)
    {
        int a, b, c;

        a = it->as.object.x;
        a += (GetAnimSpriteRotScaleX(it->header) << 0x10) >> 0x11;
        b = GetAnimSpriteRotScaleX(it->header);
        c = GetAnimSpriteRotScaleY(it->header);

        val1 += ((s16)b) * ((s16)c) * a;
        val2 += ((s16)b) * ((s16)c);
    }

    if (val2 == 0)
        ret = 0x7FFFFFFF;
    else
        ret = Div(val1, val2);

    val1 = ret;

    asm("":::"memory");
    ret = val1;
    return val1;
}

void PlaySFX(int songid, int volume, int locate, int type)
{
    EfxPlaySE(songid, volume);
    M4aPlayWithPostionCtrl(songid, locate, type);
}

void PlaySfxAutomatically(int songid, int volume, struct Anim * anim)
{
    EfxPlaySE(songid, volume);
    M4aPlayWithPostionCtrl(songid, GetProperAnimSoundLocation(anim), 1);
}
