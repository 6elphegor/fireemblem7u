#include "gbafe.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 Img_Mu_LordEliwood[];
extern const u8 gUnk_083B9670[];
extern const u8 Img_Mu_LordLyn[];
extern const u8 gUnk_083B9F88[];
extern const u8 Img_Mu_LordHector[];
extern const u8 gUnk_083BA990[];
extern const u8 Img_Mu_KnightLord[];
extern const u8 gUnk_083BB458[];
extern const u8 Img_Mu_BladeLord[];
extern const u8 gUnk_083BBE44[];
extern const u8 Img_Mu_GreatLord[];
extern const u8 gUnk_083BCA90[];
extern const u8 Img_Mu_Mercenary[];
extern const u8 gUnk_083BD38C[];
extern const u8 Img_Mu_MercenaryF[];
extern const u8 gUnk_083BDC4C[];
extern const u8 Img_Mu_Hero[];
extern const u8 gUnk_083BE700[];
extern const u8 Img_Mu_HeroF[];
extern const u8 gUnk_083BF1E0[];
extern const u8 Img_Mu_Myrmidon[];
extern const u8 gUnk_083BFB28[];
extern const u8 Img_Mu_MyrmidonF[];
extern const u8 gUnk_083C04C4[];
extern const u8 Img_Mu_Swordmaster[];
extern const u8 gUnk_083C0E68[];
extern const u8 Img_Mu_SwordmasterF[];
extern const u8 gUnk_083C184C[];
extern const u8 Img_Mu_Fighter[];
extern const u8 gUnk_083C21A8[];
extern const u8 Img_Mu_Warrior[];
extern const u8 gUnk_083C2D0C[];
extern const u8 Img_Mu_Knight[];
extern const u8 gUnk_083C3758[];
extern const u8 Img_Mu_General[];
extern const u8 gUnk_083C4364[];
extern const u8 Img_Mu_Archer[];
extern const u8 gUnk_083C4C88[];
extern const u8 Img_Mu_ArcherF[];
extern const u8 gUnk_083C55D4[];
extern const u8 Img_Mu_Sniper[];
extern const u8 gUnk_083C5F54[];
extern const u8 Img_Mu_SniperF[];
extern const u8 gUnk_083C6920[];
extern const u8 Img_Mu_Monk[];
extern const u8 gUnk_083C7164[];
extern const u8 Img_Mu_Cleric[];
extern const u8 gUnk_083C79D4[];
extern const u8 Img_Mu_Bishop[];
extern const u8 gUnk_083C8398[];
extern const u8 Img_Mu_BishopF[];
extern const u8 gUnk_083C8D4C[];
extern const u8 Img_Mu_Mage[];
extern const u8 gUnk_083C96EC[];
extern const u8 Img_Mu_MageF[];
extern const u8 gUnk_083CA110[];
extern const u8 Img_Mu_Sage[];
extern const u8 gUnk_083CABDC[];
extern const u8 Img_Mu_SageF[];
extern const u8 gUnk_083CB718[];
extern const u8 Img_Mu_Shaman[];
extern const u8 gUnk_083CC054[];
extern const u8 Img_Mu_ShamanF[];
extern const u8 gUnk_083CC9E0[];
extern const u8 Img_Mu_Druid[];
extern const u8 gUnk_083CD41C[];
extern const u8 Img_Mu_DruidF[];
extern const u8 gUnk_083CDE30[];
extern const u8 Img_Mu_Cavalier[];
extern const u8 gUnk_083CE8D0[];
extern const u8 Img_Mu_Paladin[];
extern const u8 gUnk_083CF3CC[];
extern const u8 Img_Mu_Troubadour[];
extern const u8 gUnk_083CFEC8[];
extern const u8 Img_Mu_Valkyrie[];
extern const u8 gUnk_083D0A28[];
extern const u8 Img_Mu_Nomad[];
extern const u8 gUnk_083D1494[];
extern const u8 Img_Mu_NomadF[];
extern const u8 gUnk_083D1F88[];
extern const u8 Img_Mu_NomadTrooper[];
extern const u8 gUnk_083D2A68[];
extern const u8 Img_Mu_NomadTrooperF[];
extern const u8 gUnk_083D35DC[];
extern const u8 Img_Mu_PegasusKnight[];
extern const u8 gUnk_083D4454[];
extern const u8 Img_Mu_Falcoknight[];
extern const u8 gUnk_083D5340[];
extern const u8 Img_Mu_WyvernRider[];
extern const u8 gUnk_083D61E8[];
extern const u8 Img_Mu_WyvernLord[];
extern const u8 gUnk_083D7154[];
extern const u8 Img_Mu_Soldier[];
extern const u8 gUnk_083D7A68[];
extern const u8 Img_Mu_Brigand[];
extern const u8 gUnk_083D83F0[];
extern const u8 Img_Mu_Pirate[];
extern const u8 gUnk_083D8E78[];
extern const u8 Img_Mu_Berserker[];
extern const u8 gUnk_083D98D0[];
extern const u8 Img_Mu_Thief[];
extern const u8 gUnk_083DA2A4[];
extern const u8 Img_Mu_ThiefF[];
extern const u8 gUnk_083DABFC[];
extern const u8 Img_Mu_Assassin[];
extern const u8 gUnk_083DB4FC[];
extern const u8 Img_Mu_Civilian[];
extern const u8 gUnk_083DBA34[];
extern const u8 Img_Mu_Dancer[];
extern const u8 gUnk_083DC578[];
extern const u8 Img_Mu_Bard[];
extern const u8 gUnk_083DCF00[];
extern const u8 Img_Mu_Archsage[];
extern const u8 gUnk_083DD7F8[];
extern const u8 Img_Mu_MagicSeal[];
extern const u8 gUnk_083DDFA0[];
extern const u8 Img_Mu_TransporterTent[];
extern const u8 gUnk_083DE518[];
extern const u8 Img_Mu_DarkDruid[];
extern const u8 gUnk_083DEF18[];
extern const u8 Img_Mu_FireDragon[];
extern const u8 gUnk_083DFC14[];
extern const u8 Img_Mu_Civilian47[];
extern const u8 gUnk_083E0450[];
extern const u8 Img_Mu_Civilian48[];
extern const u8 gUnk_083E0C9C[];
extern const u8 Img_Mu_Child49[];
extern const u8 gUnk_083E11D8[];
extern const u8 Img_Mu_Bramimond[];
extern const u8 gUnk_083E1A64[];
extern const u8 Img_Mu_Peer4b[];
extern const u8 gUnk_083E2438[];
extern const u8 Img_Mu_Peer4c[];
extern const u8 gUnk_083E2AE4[];
extern const u8 Img_Mu_Prince4d[];
extern const u8 gUnk_083E3248[];
extern const u8 Img_Mu_Queen[];
extern const u8 gUnk_083E3880[];
extern const u8 Img_Mu_Civilian4f[];
extern const u8 gUnk_083E3DC8[];
extern const u8 Img_Mu_Prince51[];
extern const u8 gUnk_083E4410[];
extern const u8 Img_Mu_Prince52[];
extern const u8 gUnk_083E4954[];
extern const u8 Img_Mu_Prince53[];
extern const u8 gUnk_083E4EBC[];
extern const u8 Img_Mu_Child54[];
extern const u8 gUnk_083E54BC[];
extern const u8 Img_Mu_FireDragon55[];
extern const u8 gUnk_083E5CD4[];
extern const u8 Img_Mu_Warrior56[];
extern const u8 gUnk_083E623C[];
extern const u8 Img_Mu_Child57[];
extern const u8 gUnk_083E69B8[];
extern const u8 Img_Mu_Child58[];
extern const u8 gUnk_083E716C[];
extern const u8 Img_Mu_TransporterWagon[];
extern const u8 gUnk_083E7CEC[];
extern const u8 Img_Mu_5B[];
extern const u8 gUnk_083E84CC[];
extern const u8 Img_Mu_5C[];
extern const u8 gUnk_083E8CAC[];
extern const u8 Img_Mu_5D[];
extern const u8 gUnk_083E948C[];
extern const u8 Img_Mu_5E[];
extern const u8 gUnk_083E9B38[];
extern const u8 Img_Mu_5F[];
extern const u8 gUnk_083EA18C[];
extern const u8 Img_Mu_60[];
extern const u8 gUnk_083EA880[];
extern const u8 Img_Mu_61[];
extern const u8 gUnk_083EB02C[];
extern const u8 Img_Mu_62[];
extern const u8 gUnk_083EB800[];
extern const u8 Img_Mu_63[];
extern const u8 gUnk_083EBCFC[];

// not yet declared in headers
int GetUnitSpritePalette(struct Unit * unit);
void SetStandingMuFacing(int slot, u8 * vram);
int GetClassSMSId(int jid);
void PlaySeSpacial(int song, int x);
void SyncUiSMS(int slot, u8 * vram);
void sub_08026308(int layer, int x, int y, u16 oam2, int jid, int slot);
void TryRemoveUnitFromBallista(struct Unit * unit);
void CallDelayedArg(void (* func)(int arg), int arg, int delay);
void SetManimActorFacing(int actor, int target, int facing);
u8 GetSpellAssocFacing(u16 item);

extern struct MuConfig sMuConfig[MU_MAX_COUNT];
extern u8 const Img_MuFogBump[];
extern u16 const SpriteAnim_MuFogBump[];
extern u8 gMUGfxBuffer[];
extern u32 sKeptPixelsWordMask;
extern u32 sClearedPixelWordMask;
extern u16 const Pal_AllBlack[];
extern u16 const Pal_AllWhite[];
extern u16 const Pal_AllRed[];
extern u16 const Pal_AllGreen[];
extern u16 const Pal_AllBlue[];
extern u16 const Pal_AllYellow[];

CONST_DATA u16 const * gMuFlashPalLut[] = {
    [MU_FLASH_WHITE] = Pal_AllWhite,
    [MU_FLASH_BLACK] = Pal_AllBlack,
    [MU_FLASH_RED] = Pal_AllRed,
    [MU_FLASH_GREEN] = Pal_AllGreen,
    [MU_FLASH_BLUE] = Pal_AllBlue,
    [MU_FLASH_5] = Pal_AllYellow,
};

struct ProcCmd CONST_DATA ProcScr_MuStepSe[] = {
    PROC_CALL(MuStepSe_Init),
    PROC_YIELD,
    PROC_CALL(MuStepSe_PlaySeA),
    PROC_YIELD,
    PROC_CALL(MuStepSe_PlaySeB),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_MuFogBump[] = {
    PROC_CALL(MuFogBump_Init),
    PROC_REPEAT(MuFogBump_ScaleLoop),
    PROC_REPEAT(MuFogBump_EndLoop),
    PROC_END,
};

CONST_DATA s16 sMoveOffsetLut[] = {
    -1, 0, // left
    +1, 0, // right
    0, +1, // down
    0, -1, // up
};

CONST_DATA u16 MuSoundScr_Foot[] = {
    0x10, 2,
    SONG_96, 0, 0, 0, 0, 0, 0, 0,
    SONG_97, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA u16 MuSoundScr_FootHeavy[] = {
    0x20, 2,
    SONG_A4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    SONG_A5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA u16 MuSoundScr_Mounted[] = {
    0x15, 3,
    SONG_9A, 0, 0,
    SONG_9B, 0, 0, 0, 0, 0, 0,
    SONG_9C, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA u16 MuSoundScr_Wyvern[] = {
    0x14, 1,
    SONG_A0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA u16 MuSoundScr_Pegasus[] = {
    0x14, 1,
    SONG_A6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA u16 MuSoundScr_46[] = {
    0x14, 1,
    0x2E0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

void (* CONST_DATA sMuStateFuncs[])(struct MuProc * proc) = {
    [MU_STATE_NONE] = Mu_OnStateNone,
    [MU_STATE_INACTIVE] = Mu_OnStateDoNothing,
    [MU_STATE_MOVEMENT] = Mu_OnStateMovement,
    [MU_STATE_SLEEPING] = Mu_OnStateSleeping,
    [MU_STATE_UNK4] = Mu_OnStateUnk4,
    [MU_STATE_BUMPING] = Mu_OnStateBump,
    [MU_STATE_DISPLAY_UI] = Mu_OnStateDoNothing,
    [MU_STATE_DEATHFADE] = Mu_OnStateDoNothing,
};

struct ProcCmd CONST_DATA ProcScr_Mu[] = {
    PROC_NAME_DEBUG("MOVEUNIT"),
    PROC_MARK(4),
    PROC_SET_END_CB(MU_OnEnd),
    PROC_REPEAT(Mu_OnLoop),
};

CONST_DATA u16 sMuChrOffLut_Default[MU_MAX_COUNT] = {
    0x00, 0x10, 0x08, 0x18,
};

CONST_DATA u16 sMuChrOffLut[MU_MAX_COUNT] = {
    0x00, 0x08, 0x04, 0x10,
};

CONST_DATA u8 sMuWalkSpeedLut[2] = {
    2, 1,
};

CONST_DATA u8 sMuImgBufOffLut[MU_MAX_COUNT + 1] = {
    0, // dummy because active ids start at 1
    0, 2, 1, 3,
};

struct ProcCmd CONST_DATA ProcScr_MuDeathFade[] = {
    PROC_REPEAT(MuDeathFade_OnLoop),
    PROC_SLEEP(15),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_MuBlink[] = {
    PROC_REPEAT(MuBlink_OnLoop),
    PROC_END,
};

CONST_DATA u8 sPixelEffectOrderLut[0x40] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
    0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
    0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F,
};

struct ProcCmd CONST_DATA ProcScr_MuPixelEffect[] = {
    PROC_REPEAT(MuPixelEffect_OnLoop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_MuRestorePalInfo[] = {
    PROC_SLEEP(8),
    PROC_CALL(MuRestorePalInfo_Apply),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_MuCritFlash[] = {
    PROC_CALL(MuCritFlash_Init),
    PROC_SLEEP(1),
    PROC_CALL(MuCritFlash_SetFadedPalette),
    PROC_SLEEP(2),
    PROC_CALL(MuCritFlash_SetRegularPalette),
    PROC_SLEEP(3),
    PROC_CALL(MuCritFlash_SetFadedPalette),
    PROC_SLEEP(2),
    PROC_CALL(MuCritFlash_SetRegularPalette),
    PROC_SLEEP(3),
    PROC_CALL(MuCritFlash_SetFadedPalette),
    PROC_SLEEP(1),
    PROC_CALL(MuCritFlash_StartFadeBack_maybe),
    PROC_REPEAT(MuCritFlash_SpriteShakeLoop),
    PROC_SLEEP(17),
    PROC_CALL(MuCritFlash_RestorePalette),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_MuHitFlash[] = {
    PROC_SLEEP(17),
    PROC_CALL(MuFlashFadeFrom_RestorePal),
    PROC_END,
};

// Map sprite graphics and animation of each class
CONST_DATA struct MuInfo gMuInfoTable[] = {
    [CLASS_LORD_ELIWOOD - 1] = { (u8 const *) Img_Mu_LordEliwood, (u16 const *) gUnk_083B9670 },
    [CLASS_LORD_LYN - 1] = { (u8 const *) Img_Mu_LordLyn, (u16 const *) gUnk_083B9F88 },
    [CLASS_LORD_HECTOR - 1] = { (u8 const *) Img_Mu_LordHector, (u16 const *) gUnk_083BA990 },
    [CLASS_KNIGHT_LORD_04 - 1] = { (u8 const *) Img_Mu_LordEliwood, (u16 const *) gUnk_083B9670 },
    [CLASS_BLADE_LORD_05 - 1] = { (u8 const *) Img_Mu_LordLyn, (u16 const *) gUnk_083B9F88 },
    [CLASS_GREAT_LORD_06 - 1] = { (u8 const *) Img_Mu_LordHector, (u16 const *) gUnk_083BA990 },
    [CLASS_KNIGHT_LORD - 1] = { (u8 const *) Img_Mu_KnightLord, (u16 const *) gUnk_083BB458 },
    [CLASS_BLADE_LORD - 1] = { (u8 const *) Img_Mu_BladeLord, (u16 const *) gUnk_083BBE44 },
    [CLASS_GREAT_LORD - 1] = { (u8 const *) Img_Mu_GreatLord, (u16 const *) gUnk_083BCA90 },
    [CLASS_MERCENARY - 1] = { (u8 const *) Img_Mu_Mercenary, (u16 const *) gUnk_083BD38C },
    [CLASS_MERCENARY_F - 1] = { (u8 const *) Img_Mu_MercenaryF, (u16 const *) gUnk_083BDC4C },
    [CLASS_HERO - 1] = { (u8 const *) Img_Mu_Hero, (u16 const *) gUnk_083BE700 },
    [CLASS_HERO_F - 1] = { (u8 const *) Img_Mu_HeroF, (u16 const *) gUnk_083BF1E0 },
    [CLASS_MYRMIDON - 1] = { (u8 const *) Img_Mu_Myrmidon, (u16 const *) gUnk_083BFB28 },
    [CLASS_MYRMIDON_F - 1] = { (u8 const *) Img_Mu_MyrmidonF, (u16 const *) gUnk_083C04C4 },
    [CLASS_SWORDMASTER - 1] = { (u8 const *) Img_Mu_Swordmaster, (u16 const *) gUnk_083C0E68 },
    [CLASS_SWORDMASTER_F - 1] = { (u8 const *) Img_Mu_SwordmasterF, (u16 const *) gUnk_083C184C },
    [CLASS_FIGHTER - 1] = { (u8 const *) Img_Mu_Fighter, (u16 const *) gUnk_083C21A8 },
    [CLASS_WARRIOR - 1] = { (u8 const *) Img_Mu_Warrior, (u16 const *) gUnk_083C2D0C },
    [CLASS_KNIGHT - 1] = { (u8 const *) Img_Mu_Knight, (u16 const *) gUnk_083C3758 },
    [CLASS_KNIGHT_F - 1] = { (u8 const *) Img_Mu_Knight, (u16 const *) gUnk_083C3758 },
    [CLASS_GENERAL - 1] = { (u8 const *) Img_Mu_General, (u16 const *) gUnk_083C4364 },
    [CLASS_GENERAL_F - 1] = { (u8 const *) Img_Mu_General, (u16 const *) gUnk_083C4364 },
    [CLASS_ARCHER - 1] = { (u8 const *) Img_Mu_Archer, (u16 const *) gUnk_083C4C88 },
    [CLASS_ARCHER_F - 1] = { (u8 const *) Img_Mu_ArcherF, (u16 const *) gUnk_083C55D4 },
    [CLASS_SNIPER - 1] = { (u8 const *) Img_Mu_Sniper, (u16 const *) gUnk_083C5F54 },
    [CLASS_SNIPER_F - 1] = { (u8 const *) Img_Mu_SniperF, (u16 const *) gUnk_083C6920 },
    [CLASS_MONK - 1] = { (u8 const *) Img_Mu_Monk, (u16 const *) gUnk_083C7164 },
    [CLASS_CLERIC - 1] = { (u8 const *) Img_Mu_Cleric, (u16 const *) gUnk_083C79D4 },
    [CLASS_BISHOP - 1] = { (u8 const *) Img_Mu_Bishop, (u16 const *) gUnk_083C8398 },
    [CLASS_BISHOP_F - 1] = { (u8 const *) Img_Mu_BishopF, (u16 const *) gUnk_083C8D4C },
    [CLASS_MAGE - 1] = { (u8 const *) Img_Mu_Mage, (u16 const *) gUnk_083C96EC },
    [CLASS_MAGE_F - 1] = { (u8 const *) Img_Mu_MageF, (u16 const *) gUnk_083CA110 },
    [CLASS_SAGE - 1] = { (u8 const *) Img_Mu_Sage, (u16 const *) gUnk_083CABDC },
    [CLASS_SAGE_F - 1] = { (u8 const *) Img_Mu_SageF, (u16 const *) gUnk_083CB718 },
    [CLASS_SHAMAN - 1] = { (u8 const *) Img_Mu_Shaman, (u16 const *) gUnk_083CC054 },
    [CLASS_SHAMAN_F - 1] = { (u8 const *) Img_Mu_ShamanF, (u16 const *) gUnk_083CC9E0 },
    [CLASS_DRUID - 1] = { (u8 const *) Img_Mu_Druid, (u16 const *) gUnk_083CD41C },
    [CLASS_DRUID_F - 1] = { (u8 const *) Img_Mu_DruidF, (u16 const *) gUnk_083CDE30 },
    [CLASS_CAVALIER - 1] = { (u8 const *) Img_Mu_Cavalier, (u16 const *) gUnk_083CE8D0 },
    [CLASS_CAVALIER_F - 1] = { (u8 const *) Img_Mu_Cavalier, (u16 const *) gUnk_083CE8D0 },
    [CLASS_PALADIN - 1] = { (u8 const *) Img_Mu_Paladin, (u16 const *) gUnk_083CF3CC },
    [CLASS_PALADIN_F - 1] = { (u8 const *) Img_Mu_Paladin, (u16 const *) gUnk_083CF3CC },
    [CLASS_TROUBADOUR - 1] = { (u8 const *) Img_Mu_Troubadour, (u16 const *) gUnk_083CFEC8 },
    [CLASS_VALKYRIE - 1] = { (u8 const *) Img_Mu_Valkyrie, (u16 const *) gUnk_083D0A28 },
    [CLASS_NOMAD - 1] = { (u8 const *) Img_Mu_Nomad, (u16 const *) gUnk_083D1494 },
    [CLASS_NOMAD_F - 1] = { (u8 const *) Img_Mu_NomadF, (u16 const *) gUnk_083D1F88 },
    [CLASS_NOMAD_TROOPER - 1] = { (u8 const *) Img_Mu_NomadTrooper, (u16 const *) gUnk_083D2A68 },
    [CLASS_NOMAD_TROOPER_F - 1] = { (u8 const *) Img_Mu_NomadTrooperF, (u16 const *) gUnk_083D35DC },
    [CLASS_PEGASUS_KNIGHT - 1] = { (u8 const *) Img_Mu_PegasusKnight, (u16 const *) gUnk_083D4454 },
    [CLASS_FALCOKNIGHT - 1] = { (u8 const *) Img_Mu_Falcoknight, (u16 const *) gUnk_083D5340 },
    [CLASS_WYVERN_RIDER - 1] = { (u8 const *) Img_Mu_WyvernRider, (u16 const *) gUnk_083D61E8 },
    [CLASS_WYVERN_RIDER_F - 1] = { (u8 const *) Img_Mu_WyvernRider, (u16 const *) gUnk_083D61E8 },
    [CLASS_WYVERN_LORD - 1] = { (u8 const *) Img_Mu_WyvernLord, (u16 const *) gUnk_083D7154 },
    [CLASS_WYVERN_LORD_F - 1] = { (u8 const *) Img_Mu_WyvernLord, (u16 const *) gUnk_083D7154 },
    [CLASS_SOLDIER - 1] = { (u8 const *) Img_Mu_Soldier, (u16 const *) gUnk_083D7A68 },
    [CLASS_BRIGAND - 1] = { (u8 const *) Img_Mu_Brigand, (u16 const *) gUnk_083D83F0 },
    [CLASS_PIRATE - 1] = { (u8 const *) Img_Mu_Pirate, (u16 const *) gUnk_083D8E78 },
    [CLASS_BERSERKER - 1] = { (u8 const *) Img_Mu_Berserker, (u16 const *) gUnk_083D98D0 },
    [CLASS_THIEF - 1] = { (u8 const *) Img_Mu_Thief, (u16 const *) gUnk_083DA2A4 },
    [CLASS_THIEF_F - 1] = { (u8 const *) Img_Mu_ThiefF, (u16 const *) gUnk_083DABFC },
    [CLASS_ASSASSIN - 1] = { (u8 const *) Img_Mu_Assassin, (u16 const *) gUnk_083DB4FC },
    [CLASS_CIVILIAN - 1] = { (u8 const *) Img_Mu_Civilian, (u16 const *) gUnk_083DBA34 },
    [CLASS_DANCER - 1] = { (u8 const *) Img_Mu_Dancer, (u16 const *) gUnk_083DC578 },
    [CLASS_BARD - 1] = { (u8 const *) Img_Mu_Bard, (u16 const *) gUnk_083DCF00 },
    [CLASS_ARCHSAGE - 1] = { (u8 const *) Img_Mu_Archsage, (u16 const *) gUnk_083DD7F8 },
    [CLASS_MAGIC_SEAL - 1] = { (u8 const *) Img_Mu_MagicSeal, (u16 const *) gUnk_083DDFA0 },
    [CLASS_TRANSPORTER_TENT - 1] = { (u8 const *) Img_Mu_TransporterTent, (u16 const *) gUnk_083DE518 },
    [CLASS_DARK_DRUID - 1] = { (u8 const *) Img_Mu_DarkDruid, (u16 const *) gUnk_083DEF18 },
    [CLASS_FIRE_DRAGON - 1] = { (u8 const *) Img_Mu_FireDragon, (u16 const *) gUnk_083DFC14 },
    [CLASS_CIVILIAN_47 - 1] = { (u8 const *) Img_Mu_Civilian47, (u16 const *) gUnk_083E0450 },
    [CLASS_CIVILIAN_48 - 1] = { (u8 const *) Img_Mu_Civilian48, (u16 const *) gUnk_083E0C9C },
    [CLASS_CHILD_49 - 1] = { (u8 const *) Img_Mu_Child49, (u16 const *) gUnk_083E11D8 },
    [CLASS_BRAMIMOND - 1] = { (u8 const *) Img_Mu_Bramimond, (u16 const *) gUnk_083E1A64 },
    [CLASS_PEER_4B - 1] = { (u8 const *) Img_Mu_Peer4b, (u16 const *) gUnk_083E2438 },
    [CLASS_PEER_4C - 1] = { (u8 const *) Img_Mu_Peer4c, (u16 const *) gUnk_083E2AE4 },
    [CLASS_PRINCE_4D - 1] = { (u8 const *) Img_Mu_Prince4d, (u16 const *) gUnk_083E3248 },
    [CLASS_QUEEN - 1] = { (u8 const *) Img_Mu_Queen, (u16 const *) gUnk_083E3880 },
    [CLASS_CIVILIAN_4F - 1] = { (u8 const *) Img_Mu_Civilian4f, (u16 const *) gUnk_083E3DC8 },
    [CLASS_CORSAIR - 1] = { (u8 const *) Img_Mu_Pirate, (u16 const *) gUnk_083D8E78 },
    [CLASS_PRINCE_51 - 1] = { (u8 const *) Img_Mu_Prince51, (u16 const *) gUnk_083E4410 },
    [CLASS_PRINCE_52 - 1] = { (u8 const *) Img_Mu_Prince52, (u16 const *) gUnk_083E4954 },
    [CLASS_PRINCE_53 - 1] = { (u8 const *) Img_Mu_Prince53, (u16 const *) gUnk_083E4EBC },
    [CLASS_CHILD_54 - 1] = { (u8 const *) Img_Mu_Child54, (u16 const *) gUnk_083E54BC },
    [CLASS_FIRE_DRAGON_55 - 1] = { (u8 const *) Img_Mu_FireDragon55, (u16 const *) gUnk_083E5CD4 },
    [CLASS_WARRIOR_56 - 1] = { (u8 const *) Img_Mu_Warrior56, (u16 const *) gUnk_083E623C },
    [CLASS_CHILD_57 - 1] = { (u8 const *) Img_Mu_Child57, (u16 const *) gUnk_083E69B8 },
    [CLASS_CHILD_58 - 1] = { (u8 const *) Img_Mu_Child58, (u16 const *) gUnk_083E716C },
    [CLASS_TRANSPORTER_WAGON - 1] = { (u8 const *) Img_Mu_TransporterWagon, (u16 const *) gUnk_083E7CEC },
    [CLASS_SAGE_5A - 1] = { (u8 const *) Img_Mu_SageF, (u16 const *) gUnk_083CB718 },
    [CLASS_5B - 1] = { (u8 const *) Img_Mu_5B, (u16 const *) gUnk_083E84CC },
    [CLASS_5C - 1] = { (u8 const *) Img_Mu_5C, (u16 const *) gUnk_083E8CAC },
    [CLASS_5D - 1] = { (u8 const *) Img_Mu_5D, (u16 const *) gUnk_083E948C },
    [CLASS_5E - 1] = { (u8 const *) Img_Mu_5E, (u16 const *) gUnk_083E9B38 },
    [CLASS_5F - 1] = { (u8 const *) Img_Mu_5F, (u16 const *) gUnk_083EA18C },
    [CLASS_60 - 1] = { (u8 const *) Img_Mu_60, (u16 const *) gUnk_083EA880 },
    [CLASS_61 - 1] = { (u8 const *) Img_Mu_61, (u16 const *) gUnk_083EB02C },
    [CLASS_62 - 1] = { (u8 const *) Img_Mu_62, (u16 const *) gUnk_083EB800 },
    [CLASS_63 - 1] = { (u8 const *) Img_Mu_63, (u16 const *) gUnk_083EBCFC },
};

#define MU_PAL_OBJ(pal) (gPal + ((((pal) + 0x10) * 0x20) >> 1))
void MU_Init(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
        sMuConfig[i].slot = 0;
}
struct MuProc * StartMuExt(struct Unit * unit, unsigned jid, unsigned pal)
{
    struct MuProc * proc;
    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, pal);
    proc->unit = unit;
    proc->cam_b = TRUE;
    return proc;
}
struct MuProc * StartMu(struct Unit * unit)
{
    struct MuProc * proc;
    unsigned jid = UNIT_CLASS_ID(unit);
    if (unit->state & US_IN_BALLISTA)
    {
        switch (GetTrap(unit->ballistaIndex)->extra)
        {
        case 0x34:
            jid = 0x5B;
            break;
        case 0x35:
            jid = 0x5C;
            break;
        case 0x36:
            jid = 0x5D;
            break;
        }
    }
    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, GetUnitSpritePalette(unit));
    proc->unit = unit;
    proc->cam_b = TRUE;
    return proc;
}
void UpdateMu(struct MuProc * proc)
{
    Mu_OnLoop(proc);
}
void EnableMuCamera(struct MuProc * proc)
{
    proc->cam_b = TRUE;
}
void DisableMuCamera(struct MuProc * proc)
{
    proc->cam_b = FALSE;
}
struct MuProc * StartUiMu(struct Unit * unit, int x, int y)
{
    struct MuProc * proc = StartMu(unit);
    if (!proc)
        return NULL;
    proc->x_q4 = x << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = y << MU_SUBPIXEL_PRECISION;
    proc->state = MU_STATE_DISPLAY_UI;
    return proc;
}
void StartUiStandingMu(struct MuProc * proc)
{
    StartUiSMS(GetClassSMSId(proc->jid), proc->slot);
}
struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId)
{
    struct MuProc * proc;
    struct SpriteAnim * anim;
    struct MuConfig * config;
    u16 delay = 0;
    u8 slot = 0;
    if (objTileId == -1)
    {
        objTileId = 0x380;
        config = GetDefaultMuConfig(objTileId, &slot);
    }
    else
        config = GetNewMuConfig(objTileId, &slot);
    if (!config)
        return NULL;
    if (Proc_Find(ProcScr_Mu))
        delay = 0xFE;
    proc = Proc_Start(ProcScr_Mu, PROC_TREE_5);
    if (!proc)
        return NULL;
    proc->unit = NULL;
    proc->state = MU_STATE_INACTIVE;
    proc->x_q4 = (x * 16) << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = (y * 16) << MU_SUBPIXEL_PRECISION;
    proc->x_offset_q4 = 0;
    proc->y_offset_q4 = 0;
    proc->facing = MU_FACING_UNK11;
    proc->move_clock_q4 = 0;
    proc->step_sound_clock = delay;
    proc->jid = jid;
    proc->hidden_b = FALSE;
    proc->vram = OBJ_VRAM0 + (objTileId << 5);
    proc->slot = slot;
    proc->layer = OAM2_LAYER(2);
    proc->move_config = 0;
    proc->fast_walk_b = FALSE;
    config->pal = palId;
    anim = StartSpriteAnim(GetMuAnimForJid(jid), 10);
    SetSpriteAnimId(anim, MU_FACING_SELECTED);
    Decompress(GetMuImg(proc), GetMuImgBufById(config->slot));
    anim->img = GetMuImgBufById(config->slot);
    anim->oam2 = config->chr + OAM2_PAL(config->pal) + proc->layer;
    proc->sprite_anim = anim;
    proc->config = config;
    proc->config->mu = proc;
    return proc;
}
void SetMuFacing(struct MuProc * proc, int facing)
{
    proc->facing = facing;
    if (facing == MU_FACING_STANDING)
        SetStandingMuFacing(proc->slot, proc->vram);
    else
        SetSpriteAnimId(proc->sprite_anim, proc->facing);
}
void SetMuDefaultFacing(struct MuProc * proc)
{
    if (GetClassData(proc->jid)->attributes & CA_MOUNTEDAID)
        SetMuFacing(proc, 1);
    else
        SetMuFacing(proc, 2);
}
void MU_SetDefaultFacing_Auto(void)
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (!proc)
        return;
    SetMuDefaultFacing(proc);
}
void SetAutoMuMoveScript(u8 const * commands)
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (!proc)
        return;
    SetMuMoveScript(proc, commands);
}
bool MuExists(void)
{
    return Proc_Find(ProcScr_Mu) ? TRUE : FALSE;
}
bool MuExistsActive(void)
{
    struct MuProc * mu;
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot != 0)
        {
            mu = sMuConfig[i].mu;
            switch (mu->state)
            {
            case MU_STATE_INACTIVE:
                break;
            default:
                return TRUE;
            }
        }
    }
    if (i >= MU_MAX_COUNT)
        return FALSE;
    return TRUE;
}
bool IsMuActive(struct MuProc * mu)
{
    if (!mu->config->slot)
        return FALSE;
    switch (mu->state)
    {
    case MU_STATE_INACTIVE:
        return FALSE;
    default:
        return TRUE;
    }
    return FALSE;
}
void SetMuMoveScript(struct MuProc * mu, u8 const * commands)
{
    int i;
    for (i = 0; i < 0x40; ++i)
        mu->config->movescr[i] = commands[i];
    mu->config->pc = 0;
    mu->state = MU_STATE_MOVEMENT;
    PlayMuStepSe(mu);
}
struct MuProc * StartMuScripted(u16 x, u16 y, u16 jid, int pal, u8 const * commands)
{
    struct MuProc * proc = StartMuInternal(x, y, jid, -1, pal);
    if (!proc)
        return NULL;
    SetMuMoveScript(proc, commands);
    return proc;
}
void MuStepSe_Init(struct MuStepSoundProc * proc)
{
    proc->song1 = 0;
    proc->x1 = 0;
    proc->song2 = 0;
    proc->x2 = 0;
}
void MuStepSe_PlaySeA(struct MuStepSoundProc * proc)
{
    PlaySeSpacial(proc->song1, proc->x1);
}
void MuStepSe_PlaySeB(struct MuStepSoundProc * proc)
{
    if (proc->song2)
        PlaySeSpacial(proc->song2, proc->x2);
}
void StartPlayMuStepSe(int song, int alt_offset, int x)
{
    struct MuStepSoundProc * proc;
    proc = Proc_Find(ProcScr_MuStepSe);
    if (!proc)
        proc = Proc_Start(ProcScr_MuStepSe, PROC_TREE_3);
    if (!proc->song1)
    {
        proc->song1 = song;
        proc->x1 = x;
    }
    else if (!proc->unk60)
    {
        proc->song2 = song + alt_offset;
        proc->x2 = x;
    }
}
void PlayMuStepSe(struct MuProc * proc)
{
    UpdateMuStepSounds(proc);
}
void EndMuMovement(struct MuProc * proc)
{
}
void RunMuMoveScript(struct MuProc * proc)
{
    while (TRUE)
    {
        short command;
        void const * anim;
        command = proc->config->movescr[proc->config->pc++];
        switch (command)
        {
        case MOVE_CMD_SLEEP:
            proc->move_clock_q4 = proc->config->movescr[proc->config->pc++];
            proc->state = MU_STATE_SLEEPING;
            return;
        case MOVE_CMD_BUMP:
            EndMuMovement(proc);
            proc->state = MU_STATE_BUMPING;
            StartMuFogBump(
                (proc->x_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x,
                (proc->y_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y);
            return;
        case MOVE_CMD_HALT:
            HaltMu(proc);
            return;
        case MOVE_CMD_END:
            EndMuMovement(proc);
            EndMu(proc);
            return;
        case MOVE_CMD_MOVE_LEFT:
        case MOVE_CMD_MOVE_RIGHT:
        case MOVE_CMD_MOVE_DOWN:
        case MOVE_CMD_MOVE_UP:
            if (command != proc->facing)
            {
                anim = GetMuAnimForJid(proc->jid);
                SetMuFacing(proc, command);
                proc->state = MU_STATE_MOVEMENT;
            }
            return;
        case MOVE_CMD_FACE_LEFT:
        case MOVE_CMD_FACE_RIGHT:
        case MOVE_CMD_FACE_DOWN:
        case MOVE_CMD_FACE_UP:
            command = command - MOVE_CMD_FACE_BASE;
            if (command != proc->facing)
            {
                anim = GetMuAnimForJid(proc->jid);
                SetMuFacing(proc, command);
            }
            continue;
        case MOVE_CMD_SET_SPEED:
            proc->move_config = proc->config->movescr[proc->config->pc++];
            continue;
        case MOVE_CMD_CAMERA_ON:
            EnableMuCamera(proc);
            continue;
        case MOVE_CMD_CAMERA_OFF:
            DisableMuCamera(proc);
            continue;
        default:
            break;
        }
    }
}
void StartMuFogBump(int x, int y)
{
    struct MuFogBumpProc * proc;
    struct SpriteAnim * anim;
    Decompress(Img_MuFogBump, OBJ_VRAM0 + 0x180 * 0x20);
    anim = StartSpriteAnim(SpriteAnim_MuFogBump, 2);
    anim->oam2 = OAM2_CHR(0x180) + OAM2_PAL(1);
    SetSpriteAnimId(anim, 0);
    proc = Proc_Start(ProcScr_MuFogBump, PROC_TREE_3);
    proc->sprite_anim = anim;
    proc->x = x + 8;
    proc->y = y - 4;
}
void MuFogBump_Init(struct MuFogBumpProc * proc)
{
    PlaySoundEffect(0x397);
    proc->timer = 0;
    SetObjAffineAuto(0, 0, 0x200, 0x200);
}
void MuFogBump_ScaleLoop(struct MuFogBumpProc * proc)
{
    int scale;
    if (proc->timer++ >= 8)
        Proc_Break(proc);
    scale = Interpolate(5, 0x200, 0x100, proc->timer, 8);
    SetObjAffineAuto(0, 0, scale, scale);
    DisplaySpriteAnim(proc->sprite_anim, proc->x - 8, (proc->y - 8) | OAM0_AFFINE_ENABLE | OAM0_DOUBLESIZE);
}
void MuFogBump_EndLoop(struct MuFogBumpProc * proc)
{
    if (proc->timer++ >= 40)
        Proc_Break(proc);
    DisplaySpriteAnim(proc->sprite_anim, proc->x, proc->y | OAM0_AFFINE_ENABLE);
}
bool MU_IsFogBumpFxActive(void)
{
    return Proc_Find(ProcScr_MuFogBump) ? TRUE : FALSE;
}
void Mu_OnStateBump(struct MuProc * proc)
{
    if (!MU_IsFogBumpFxActive())
        proc->state = MU_STATE_SLEEPING;
}
void Mu_OnStateUnk4(struct MuProc * proc)
{
    proc->state = MU_STATE_MOVEMENT;
}
void Mu_OnStateSleeping(struct MuProc * proc)
{
    if (proc->move_clock_q4 == 0)
        proc->state = MU_STATE_MOVEMENT;
    else
        proc->move_clock_q4--;
}
void Mu_OnStateNone(struct MuProc * proc)
{
}
void Mu_OnStateDoNothing(struct MuProc * proc)
{
}
void Mu_OnStateMovement(struct MuProc * proc)
{
    unsigned speed = GetMuQ4MovementSpeed(proc);
    proc->move_clock_q4 += speed;
    proc->x_q4 += speed * sMoveOffsetLut[proc->facing * 2 + 0];
    proc->y_q4 += speed * sMoveOffsetLut[proc->facing * 2 + 1];
    if ((proc->move_clock_q4 >> 4) >= 16)
    {
        proc->move_clock_q4 -= 0x100;
        proc->x_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 0];
        proc->y_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 1];
        proc->move_clock_q4 = 0;
        proc->x_q4 &= ~0xF;
        proc->y_q4 &= ~0xF;
    }
    if (proc->cam_b)
    {
        gBmSt.camera.x = GetCameraAdjustedX(proc->x_q4 >> MU_SUBPIXEL_PRECISION);
        gBmSt.camera.y = GetCameraAdjustedY(proc->y_q4 >> MU_SUBPIXEL_PRECISION);
    }
    if (!(proc->move_config & 0x80))
        UpdateMuStepSounds(proc);
}
void UpdateMuStepSounds(struct MuProc * proc)
{
    struct ClassData const * jinfo;
    u16 const * scr;
    int pc;
    struct Vec2 position;
    jinfo = GetClassData(proc->jid);
    if (jinfo->attributes & CA_MOUNTEDAID)
    {
        switch (proc->jid)
        {
        case 0x32:
        case 0x33:
            scr = MuSoundScr_Pegasus;
            break;
        case 0x34:
        case 0x35:
        case 0x36:
        case 0x37:
            scr = MuSoundScr_Wyvern;
            break;
        default:
            scr = MuSoundScr_Mounted;
            break;
        }
    }
    else
    {
        switch (proc->jid)
        {
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x17:
        case 0x55:
        case 0x5B:
        case 0x5C:
        case 0x5D:
            scr = MuSoundScr_FootHeavy;
            break;
        case 0x46:
            scr = MuSoundScr_46;
            break;
        default:
            scr = MuSoundScr_Foot;
            break;
        }
    }
    pc = DivRem(proc->step_sound_clock++, scr[0]);
    GetMuDisplayPosition(proc, &position);
    if (scr[2 + pc])
        StartPlayMuStepSe(scr[2 + pc], scr[1], position.x);
}
void Mu_OnLoop(struct MuProc * proc)
{
    if (proc->state)
    {
        if (proc->move_clock_q4 == 0)
            if (proc->state == MU_STATE_SLEEPING || proc->state == MU_STATE_MOVEMENT)
                RunMuMoveScript(proc);
        sMuStateFuncs[proc->state](proc);
    }
    if (proc->facing == MU_FACING_STANDING)
        PutMuSMS(proc);
    else
        PutMu(proc);
}
void MU_OnEnd(struct MuProc * proc)
{
    proc->config->slot = 0;
    EndSpriteAnim(proc->sprite_anim);
}
void EndAllMus(void)
{
    Proc_EndEach(ProcScr_Mu);
}
void EndMu(struct MuProc * proc)
{
    EndMuExt(proc);
}
void EndMuExt(struct MuProc * proc)
{
    Proc_End(proc);
}
void HaltMu(struct MuProc * proc)
{
    EndMuMovement(proc);
    proc->state = MU_STATE_INACTIVE;
}
void LockMus(void)
{
    Proc_BlockEachMarked(4);
}
void ReleaseMus(void)
{
    Proc_UnblockEachMarked(4);
}
void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * movescr)
{
    while (TRUE)
    {
        switch (*movescr++)
        {
        case MOVE_CMD_END:
        case MOVE_CMD_HALT:
            return;
        case MOVE_CMD_MOVE_LEFT:
            (*x)--;
            break;
        case MOVE_CMD_MOVE_RIGHT:
            (*x)++;
            break;
        case MOVE_CMD_MOVE_UP:
            (*y)--;
            break;
        case MOVE_CMD_MOVE_DOWN:
            (*y)++;
            break;
        case MOVE_CMD_SLEEP:
            movescr++;
            break;
        default:
            break;
        }
    }
}
bool CanStartMu(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
        if (sMuConfig[i].slot == 0)
            return TRUE;
    return FALSE;
}
void ResetMuAnims(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot != 0)
        {
            ResetSpriteAnimClock(sMuConfig[i].mu->sprite_anim);
        }
    }
}
struct MuConfig * GetDefaultMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot == 0)
        {
            sMuConfig[i].slot = i + 1;
            sMuConfig[i].chr = objTileId + sMuChrOffLut_Default[i];
            *outIndex = i;
            return sMuConfig + i;
        }
    }
    return NULL;
}
struct MuConfig * GetNewMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot == 0)
        {
            sMuConfig[i].slot = i + 1;
            sMuConfig[i].chr = objTileId + sMuChrOffLut[i];
            *outIndex = i;
            return sMuConfig + i;
        }
    }
    return NULL;
}
s8 GetMuDisplayPosition(struct MuProc * proc, struct Vec2 * out)
{
    switch (proc->state)
    {
    case MU_STATE_DISPLAY_UI:
        out->x = (proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION;
        out->y = (proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION;
        return TRUE;
    default:
    {
        short x = ((proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x + 8;
        short y = ((proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y + 8;
        out->x = x;
        out->y = y + 8;
        if (x < -0x10 || x > 0x100 || y < -0x10 || y > 0xB0)
            return FALSE;
        return TRUE;
    }
    }
}
void PutMuSMS(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;
        if (!GetMuDisplayPosition(proc, &pos))
            return;
        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);
        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;
        SyncUiSMS(proc->slot, proc->vram);
        sub_08026308(
            proc->sprite_anim->layer,
            pos.x - 8,
            pos.y - 16,
            (((u32) (proc->vram - OBJ_VRAM0) & 0x1FFFF) >> 5) + OAM2_PAL(proc->config->pal) + proc->layer,
            proc->jid,
            proc->slot);
    }
}
void PutMu(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;
        if (!GetMuDisplayPosition(proc, &pos))
            return;
        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);
        switch (proc->state)
        {
        case MU_STATE_DISPLAY_UI:
            break;
        default:
            if (!proc->unit)
                break;
            if (UNIT_FACTION(proc->unit) != FACTION_RED)
                break;
            if (gPlaySt.chapterVisionRange != 0)
                if (gBmMapFog[(((proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION) + 8) >> 4][(((proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION) + 8) >> 4] == 0)
                        return;
        }
        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;
        DisplaySpriteAnim(proc->sprite_anim, pos.x, pos.y);
    }
}
u16 GetMuQ4MovementSpeed(struct MuProc * proc)
{
    int config = proc->move_config;
    if (config & 0x80)
        config += 0x80;
    if (proc->fast_walk_b)
        return 0x100;
    if (config == 0x40)
        return sMuWalkSpeedLut[GetClassData(proc->jid)->slowWalking] << 4;
    if (config != 0)
    {
        int speed = config;
        if (speed & 0x40)
            speed ^= 0x40;
        else if (!gPlaySt.cfgGameSpeed)
        {
            if (gpKeySt->held & A_BUTTON)
                speed = config << 2;
        }
        else
            speed = config << 2;
        if (speed > 0x80)
            speed = 0x80;
        return speed;
    }
    if (!IsFirstPlaythrough() && (gpKeySt->held & A_BUTTON))
        return 0x80;
    if (!gPlaySt.cfgGameSpeed)
        return sMuWalkSpeedLut[GetClassData(proc->jid)->slowWalking] << 4;
    else
        return 0x40;
}
void SetMuConfig(struct MuProc * proc, u16 config)
{
    if (config > 0x100)
        proc->move_config = 0x100;
    else
        proc->move_config = config;
}
void * GetMuImgBufById(int slot)
{
    return gMUGfxBuffer + (sMuImgBufOffLut[slot] * MU_GFX_MAX_SIZE);
}
void const * GetMuImg(struct MuProc * proc)
{
    return gMuInfoTable[proc->jid - 1].img;
}
u16 const * GetMuAnimForJid(u16 jid)
{
    return gMuInfoTable[jid - 1].anim;
}
void StartMuDeathFade(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuDeathFade, mu);
    proc->mu = mu;
    proc->time_left = 0x20;
    SetBlendConfig(0, proc->time_left >> 1, 0x10, 0);
    FreezeSpriteAnim(mu->sprite_anim);
    StartMuHitFlash(mu, MU_FLASH_WHITE);
    mu->sprite_anim->layer = 13;
    PlaySoundEffect(0xD6);
    if (mu->unit->state & US_IN_BALLISTA)
    {
        TryRemoveUnitFromBallista(mu->unit);
        HideUnitSprite(mu->unit);
    }
}
void MuDeathFade_OnLoop(struct MuEffectProc * proc)
{
    SetBlendConfig(0, (proc->time_left--) >> 1, 0x10, 0);
    if (proc->time_left == 0)
    {
        EndMu(proc->mu);
        Proc_Break(proc);
    }
}
void MuBlink_OnLoop(struct MuEffectProc * proc)
{
    struct MuProc * mu = proc->proc_parent;
    mu->hidden_b = (proc->time_left & 7) < 4;
    proc->time_left--;
    if (proc->time_left < 0)
    {
        Proc_Break(proc);
        mu->hidden_b = TRUE;
    }
}
void StartBlinkMu(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuBlink, mu);
    proc->mu = mu;
    proc->time_left = 0x40;
    FreezeSpriteAnim(mu->sprite_anim);
    PlaySoundEffect(0xD6);
}
void MU_SetupPixelEffect(u32 * data, int frame)
{
    int i, j;
    int pixel = sPixelEffectOrderLut[frame] % 8;
    int wordId = sPixelEffectOrderLut[frame] / 8;
    sKeptPixelsWordMask = 0xFFFFFFFF;
    sClearedPixelWordMask = 0xF << (pixel * 4);
    sKeptPixelsWordMask &= ~sClearedPixelWordMask;
    for (i = 0; i < 4; ++i)
    {
        for (j = 0; j < 4; ++j)
        {
            u32 word = data[wordId];
            word &= sKeptPixelsWordMask;
            data[wordId] = word;
            data += 8;
        }
        data += 0xE0;
    }
}
void MuPixelEffect_OnLoop(struct MuEffectProc * proc)
{
    void * buf = GetMuImgBufById(((struct MuProc *) proc->proc_parent)->slot);
    MU_SetupPixelEffect(buf, proc->frame);
    proc->frame++;
    RegisterDataMove(gMUGfxBuffer, OBJ_VRAM0 + 0x380 * 0x20, 0x80 * 0x20);
    proc->time_left--;
    if (proc->time_left == 0)
    {
        EndMu(proc->mu);
        Proc_Break(proc);
    }
}
void MU_StartPixelEffect(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuPixelEffect, mu);
    proc->mu = mu;
    proc->time_left = 0x40;
    proc->frame = 0;
    FreezeSpriteAnim(mu->sprite_anim);
    PlaySoundEffect(0xD6);
}
void HideMu(struct MuProc * proc)
{
    proc->hidden_b = TRUE;
}
void ShowMu(struct MuProc * proc)
{
    proc->hidden_b = FALSE;
}
void SetMuScreenPosition(struct MuProc * proc, int x, int y)
{
    proc->x_q4 = x << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = y << MU_SUBPIXEL_PRECISION;
}
void SetMuScreenOffset(struct MuProc * proc, int x_off, int y_off)
{
    proc->x_offset_q4 = x_off << MU_SUBPIXEL_PRECISION;
    proc->y_offset_q4 = y_off << MU_SUBPIXEL_PRECISION;
}
void StartMuFadeIntoFlash(struct MuProc * proc, int flash)
{
    proc->sprite_anim->oam2 = proc->config->chr + OAM2_PAL(5) + proc->layer;
    ApplyPalette(MU_PAL_OBJ(proc->config->pal), 0x10 + 5);
    StartPalFade(gMuFlashPalLut[flash], 0x15, 8, proc);
}
void StartMuFadeFromFlash(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    StartPalFade(MU_PAL_OBJ(mu->config->pal), 0x15, 8, mu);
    proc = Proc_Start(ProcScr_MuRestorePalInfo, PROC_TREE_3);
    proc->mu = mu;
}
void MuRestorePalInfo_Apply(struct MuEffectProc * proc)
{
    struct MuProc * mu = proc->mu;
    mu->sprite_anim->oam2 = mu->config->chr + OAM2_PAL(mu->config->pal) + mu->layer;
}
void StartMuActionAnim(struct MuProc * proc)
{
    SetSpriteAnimId(proc->sprite_anim, MU_FACING_SELECTED);
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuActionAnimFinishFunc, (int) proc->sprite_anim, 30);
}
void MuActionAnimFinishFunc(int arg)
{
    FreezeSpriteAnim((struct SpriteAnim *) arg);
}
void StartMuDelayedFaceDefender(struct MuProc * proc)
{
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuDelayedFaceDefenderFunc, (int) proc->sprite_anim, 30);
}
void MuDelayedFaceDefenderFunc(int arg)
{
    SetManimActorFacing(
        gManimSt.attacker_actor,
        1 - gManimSt.attacker_actor,
        GetSpellAssocFacing(gManimSt.actor[0].bu->weaponBefore));
    FreezeSpriteAnim((struct SpriteAnim *) arg);
}
void StartMuSpeedUpAnim(struct MuProc * proc)
{
    proc->sprite_anim->clock = 0;
    proc->sprite_anim->clock_interval_q8 = 0x40;
    CallDelayedArg(MuSlowDownAnimFreezeFunc, (int) proc->sprite_anim, 20);
}
void MuSlowDownAnimFreezeFunc(int arg)
{
    FreezeSpriteAnim((struct SpriteAnim *) arg);
}
void StartMuCritFlash(struct MuProc * mu, int flash)
{
    struct MuFlashEffectProc * proc;
    ApplyPalette(gMuFlashPalLut[flash], 0x10 + 5);
    proc = Proc_Start(ProcScr_MuCritFlash, mu);
    proc->mu = mu;
}
void MuCritFlash_Init(struct MuFlashEffectProc * proc)
{
    proc->timer = 0;
}
void MuCritFlash_SetFadedPalette(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(5) + proc->mu->layer;
}
void MuCritFlash_SetRegularPalette(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(proc->mu->config->pal) + proc->mu->layer;
}
void MuCritFlash_StartFadeBack_maybe(struct MuFlashEffectProc * proc)
{
    StartPalFade(MU_PAL_OBJ(proc->mu->config->pal), 0x10 + 5, 20, proc);
}
void MuCritFlash_SpriteShakeLoop(struct MuFlashEffectProc * proc)
{
    proc->timer++;
    SetMuScreenOffset(proc->mu, (proc->timer & 1) ? 2 : -2, 0);
    if (proc->timer >= 12)
    {
        SetMuScreenOffset(proc->mu, 0, 0);
        Proc_Break(proc);
    }
}
void MuCritFlash_RestorePalette(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(proc->mu->config->pal) + proc->mu->layer;
}
void StartMuHitFlash(struct MuProc * mu, int flash)
{
    struct MuFlashEffectProc * proc;
    ApplyPalette(gMuFlashPalLut[flash], 0x10 + 5);
    mu->sprite_anim->oam2 = mu->config->chr + OAM2_PAL(5) + mu->layer;
    StartPalFade(MU_PAL_OBJ(mu->config->pal), 0x15, 20, mu);
    proc = Proc_Start(ProcScr_MuHitFlash, mu);
    proc->mu = mu;
}
void MuFlashFadeFrom_RestorePal(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(proc->mu->config->pal) + proc->mu->layer;
}
void SetMuMaxWalkSpeed(void)
{
    Proc_ForEach(ProcScr_Mu, MuMaxWalkSpeedFunc);
}
void MuMaxWalkSpeedFunc(ProcPtr proc)
{
    ((struct MuProc *) proc)->fast_walk_b = TRUE;
}
void SetMuSpecialSprite(struct MuProc * proc, int jid, u16 const * pal)
{
    FreezeSpriteAnim(proc->sprite_anim);
    proc->jid = jid;
    SetSpriteAnimInfo(proc->sprite_anim, GetMuAnimForJid(proc->jid));
    Decompress(GetMuImg(proc), GetMuImgBufById(proc->config->slot));
    ApplyPalette(pal, 0x10 + proc->config->pal);
}
void SetMuPal(struct MuProc * proc, unsigned pal)
{
    proc->config->pal = pal;
    proc->sprite_anim->oam2 = proc->config->chr + OAM2_PAL(pal) + proc->layer;
}
struct MuProc * GetMu(int slot)
{
    if (!sMuConfig[slot].slot)
        return NULL;
    return sMuConfig[slot].mu;
}
struct MuProc * GetUnitMu(struct Unit * unit)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        struct MuProc * proc = GetMu(i);
        if (proc->unit == unit)
            return proc;
    }
    return NULL;
}