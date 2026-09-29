#pragma once

// Link arena (sio) internals shared by src/sio_*.c (FE8U: sio_core.h, sio.h).
// Not included from gbafe.h: sio_battlemap.c/sio_uiutils.c still define some
// of these structs locally.

#include "gbafe.h"

#define SIO_MAX_PACKET 0x80

#define SIO_MAX_PENDING_SEND 0x20
#define SIO_MAX_PENDING_RECV 0x10

enum
{
    SIO_MSG_84 = 0xD4, // sound ?
    SIO_MSG_85,
    SIO_MSG_86,
    SIO_MSG_87,
    SIO_MSG_88,
    SIO_MSG_89,
    SIO_MSG_8A,
    SIO_MSG_8B,
    SIO_MSG_8C,
    SIO_MSG_8D,
    SIO_MSG_DATA_ACK,
    SIO_MSG_DATA,
};

struct SioBigSendProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ void (*func)(struct SioBigSendProc *);
    /* 30 */ void const * data;
    /* 34 */ u8 unk_34;
    /* 36 */ u16 blockCount;
    /* 38 */ u16 currentBlock;
    /* 3A */ u8 lastBlockLen;
    /* 3B */ u8 completionPercent;
    /* 3C */ u8 unk_3C;
};

struct SioBigReceiveProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ void (*func)(struct SioBigReceiveProc *);
    /* 30 */ void * data;
    /* 34 */ u8 unk_34;
    /* 36 */ u16 blockCount;
    /* 38 */ u16 currentBlock;
    /* 3A */ u8 lastBlockLen;
    /* 3B */ u8 completionPercent;
    /* 3C */ u8 unk_3C;
};

enum
{
    PLAYER_STATUS_0 = 0,
    PLAYER_STATUS_1 = 1,
    PLAYER_STATUS_2 = 2,
    PLAYER_STATUS_5 = 5,
};

struct SioMessage
{
    /* 00 */ u8 kind;
    /* 01 */ u8 sender;
    /* 02 */ u16 param;
};

struct SioData
{
    /* 00 */ struct SioMessage head;
    /* 04 */ u16 len;
    /* 06 */ u8 bytes[SIO_MAX_PACKET];
};

struct SioPending
{
    /* 00 */ u8 unk_00;
    /* 04 */ struct SioData packet;
};

struct SioSt
{
    /* 0000 */ u8 unk_000;
    /* 0001 */ u8 unk_001;
    /* 0002 */ u16 lastSioCnt;
    /* 0004 */ u16 unk_004;
    /* 0006 */ s8 selfId;
    /* 0007 */ u8 unk_007;
    /* 0008 */ u8 recvFlags;
    /* 0009 */ u8 unk_009;
    /* 000A */ u8 unk_00A;
    /* 000B */ u8 playerStatus[4];
    /* 000F */ u8 unk_00F;
    /* 0010 */ u8 unk_010;
    /* 0011 */ u8 unk_011;
    /* 0012 */ u16 lastRecv[4];
    /* 001A */ u8 timeoutClock[4];
    /* 001E */ u8 unk_01E;
    /* 001F */ u8 unk_01F;
    /* 0020 */ u8 unk_020;
    /* 0021 */ u8 unk_021;
    /* 0022 */ u16 unk_022;
    /* 0024 */ u16 selfSeq;
    /* 0026 */ u16 seq[4];
    /* 002E */ u8 unk_02E;
    /* 0030 */ u16 unk_030;
    /* 0032 */ u16 buf[SIO_MAX_PACKET];
    /* 0134 */ struct SioPending pendingSend[SIO_MAX_PENDING_SEND];
    /* 0594 */ struct SioPending pendingRecv[SIO_MAX_PENDING_RECV];
    /* 1B74 */ u8 nextPendingSend;
    /* 1B75 */ u8 nextPendingWrite;
    /* 1B76 */ u8 nextPendingRead;
    /* 1B77 */ u8 nextPendingRecv;
    /* 1B78 */ u16 unk_1B78;
    /* 1B7A */ u16 unk_1B7A;
    /* 1B7C */ u16 unk_1B7C;
    /* 1B7E */ u16 unk_1B7E;
};

#define SIO_MAX_DATA (SIO_MAX_PACKET - 6)

struct LinkArenaStMaybe_ec
{
    u8 unk_0_0 : 1;
    u8 unk_0_1 : 1;
    u8 unk_0_2 : 1;
};

struct LinkArenaStMaybe
{
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

extern struct SioSt * CONST_DATA gSioSt;
extern u16 gSioOutgoing[0x200];
extern u16 gSioIncoming[0x200][4];
extern u32 gUnknown_03004E70;
extern u32 gUnknown_03004E74;
extern u32 gSioStateId;
extern struct SioMessage gSioMsgBuf;
extern u8 gUnknown_03004F20[SIO_MAX_PACKET];
extern struct ProcCmd CONST_DATA gProcScr_SioBigSend[];
extern struct ProcCmd CONST_DATA gProcScr_SioBigReceive[];
extern struct LinkArenaStMaybe gLinkArenaSt;

// sio_core
int SioPollingMsg(void);
int GetSioIndex(void);
void sub_0803C25C(u16 arg_0, u16 sioCnt, u16 arg_2);
void sub_0803C294(void);
void sub_0803C414(void);
void SioRegisterIrq(void);
void SioReleaseIrq(void);
void SioHandleIrq_Serial(void);
void SioVsync_Loop(void);
void SioHandleIrq_Timer3(void);
void sub_0803C90C(int num);
void SioMain_Loop(void);
void sub_0803CCC0(void);
int sub_0803CCC4(void);
int sub_0803CCF0(void);
bool sub_0803CD1C(u8 playerId);
bool sub_0803CD40(u8 playerId);
bool sub_0803CD64(void);
int sub_0803CDB8(void);
bool sub_0803CDE8(void);
s16 SioSend(const void * src, u16 len);
s16 sub_0803CF2C(s8 playerId, void * dst);
int SioSend16(u16 * word, int arg_1);
int sub_0803D130(int unused_0, u16 * arg_1);
void SioQueuePendingRecvData(struct SioData * data);
struct SioData * sub_0803D210(u32 * out);
int SioEmitData(const u8 * src, u16 len);
int SioReceiveData(void * dst, u8 * outSenderId, bool (*verify)(void *));
void sub_0803D4AC(void);
void sub_0803D500(int arg_0);
void sub_0803D510(void);
void sub_0803D584(void);
void sub_0803D5FC(void);
void sub_0803D674(void);
void sub_0803D688(struct SioBigSendProc * proc);
void SioBigSend_Loop(struct SioBigSendProc * proc);
void sub_0803D758(struct SioBigReceiveProc * proc);
void SioBigReceive_Loop_A(struct SioBigReceiveProc * proc);
void SioBigReceive_Loop_B(struct SioBigReceiveProc * proc);
int StartSioBigSend(void * data, u32 len, void (*func)(struct SioBigSendProc *), u8 arg_3, ProcPtr parent);
void StartSioBigReceive(void * data, void (*func)(struct SioBigReceiveProc *), ProcPtr parent);
bool IsSioBigTransferActive(void);

// FE8U sio.h

struct Proc085AAAC4 {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x40);
    /* 40 */ int unk40;
};

struct ProcTactician {
    PROC_HEADER;

    /* 2C */ struct Proc085AAAC4 * child1;
    /* 30 */ u8 line_idx;
    /* 31 */ u8 text_idx;
    /* 32 */ u8 unk32;
    /* 33 */ u8 unk33;
    /* 34 */ s16 conf_idx;
    /* 36 */ s16 conf_idx_bak;
    /* 38 */ u8 cur_len;                /* used tactician name string length */
    /* 39 */ u8 unk39;
    /* 3A */ u8 unk3A;
    /* 3A */ u8 unk3B;
    /* 3C */ u8 max_len;                /* pre-configured max string length */
    /* 3D */ char str[0x48 - 0x3D];
    /* 48 */ u16 unk4C[0x10];
};

struct TacticianTextConf {
    /* 00 */ u8 * str[0xC];
    /* 30 */ u16 x, y;
    /* 34 */ u8 kind;
    /* 35 */ u8 _pad_;
    /* 36 */ s16 adj_idx[4];
    /* 3E */ u8 action;
};

extern const struct TacticianTextConf gTacticianTextConf[];
const struct TacticianTextConf * GetTacticianTextConf(s16);

enum sio_save_config_bitfile {
    SIO_SAVE_CONF_B3 = 1 << 3,
};

struct SioSaveConf {
    u8 _unk0_ : 1;
    u8 _unk1_ : 1;
    u8 _unk2_ : 1;
    u8 _unk3_ : 1;
    u8 _unk4_ : 4;
    u8 _unk8_;
} __attribute__((packed));
extern struct SioSaveConf gSioSaveConfig;

struct SioUnknown_0203DD90_Unk2C
{
    /* 00 */ u8 unitId;
    /* 04 */ int newScore;
};

struct SioUnknown_0203DD90
{
    u8 unk_00; // ?
    u8 unk_01; // current phase
    u8 unk_02; // current cursor unit idx
    u8 unk_03; // current cursor unit idx (again?)
    u8 unk_04; // current selected unit idx (attacker)
    u8 unk_05; // current selected combat target unit id
    u8 unk_06; // weapon index maybe?
    u8 unk_07; // ?
    u8 unk_08; // ?
    u8 unk_09; // ?
    /* 0A */ u8 unk_0A[4]; // num units alive per team?
    /* 0E */ u8 unk_0E; // ?
    /* 0F */ u8 unk_0F[4]; // player ids?
    /* 14 */ int currentScore[4]; // scores
    /* 24 */ u16 unk_24[4]; // leader face IDs
    /* 2C */ struct SioUnknown_0203DD90_Unk2C unk_2c[4];
};


struct SioProc85A971C_Unk44
{
    /* 00 */ u8 playerId;
    /* 01 */ STRUCT_PAD(0x01, 0x04);
    /* 04 */ u32 points;
};

void sub_0803DA24(void);


struct Proc_Sio_085A93A0
{
    /* 00 */ PROC_HEADER;
    /* 2C */ u8 pad_2C[0x58 - 0x2C];
    /* 58 */ int timer;
};

void sub_0803DA30(struct Proc_Sio_085A93A0 * proc);
void sub_0803DA70(struct Proc_Sio_085A93A0 * proc);
void sub_0803DAD0(void);
void sub_0803DAE4(ProcPtr proc);
void sub_0803DB10(void);
void sub_0803DB24(ProcPtr proc);

struct ProcSioHold {
    PROC_HEADER;

    int x;
    int y, y_min, y_max;
};

void SioHold_Loop(struct ProcSioHold * proc);
ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min);
void EndSioHold(void);
void sub_0803DBC8(ProcPtr proc, int num);
void ClearSioBG(void);
void sub_0803DC28(void);
void PutSioText(int, int);
void sub_0803DCF0(void);
void sub_0803DD40(struct Unit * unit);
void SioPlaySoundEffect(int);
void sub_0803DDD0(void);
bool IsKeyInputSequenceComplete(const u16 * list);
bool sub_0803DE80(void);

/* sio_teamlist.c */

struct SioProc85AAA78
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ s16 unk_30[5];
    /* 3A */ u8 unk_3a[5];
    /* 40 */ int unk_40;
    /* 44 */ s8 unk_44;
    /* 45 */ STRUCT_PAD(0x45, 0x48);
    /* 48 */ int unk_48;
};

struct SioTeamListProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioProc85AAA78 * unk_2c;
    /* 30 */ ProcPtr pSioHoldProc;
    /* 34 */ int numActiveOptions;
    /* 38 */ int unk_38;
    /* 3C */ int optionIdx;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u8 unk_48;
    /* 49 */ STRUCT_PAD(0x49, 0x4A);
    /* 4A */ u16 yBg1;
    /* 4C */ s8 unk_4c;
    /* 4D */ u8 validOptions[5];
    /* 52 */ u8 selectedOption;
    /* 53 */ u8 selectedTeam;
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ STRUCT_PAD(0x56, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ s8 unk_5c;
};

int sub_0803E358(u8, struct SioTeamListProc *);;
bool CanBuildNewLinkArenaTeam(void);;
bool sub_0803DF1C(void);;
void StartLinkArenaTeamList(ProcPtr parent);
void SioTeamList_Init(struct SioTeamListProc * proc);
bool CanBuildNewLinkArenaTeam(void);
bool sub_0803DF1C(void);
int sub_0803DF48(int activeOption, u8 mode);
void DrawLinkArenaTeamName(int idx);
void sub_0803E0B8(struct SioTeamListProc * proc);
void sub_0803E0D4(struct SioTeamListProc * proc, u8 mode);
void SioTeamList_EraseTeam(struct SioTeamListProc * proc);
void SioTeamList_SwapTeams(struct SioTeamListProc * proc);
int sub_0803E358(u8 mode, struct SioTeamListProc * proc);
u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc);
void SioTeamList_SetupGfx(struct SioTeamListProc * proc);
void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total);
void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc);
void SioTeamList_StartUnitList(struct SioTeamListProc * proc);
void SioTeamList_WaitForUnitListScreen(ProcPtr proc);
int sub_0803E904(void);
void SioTeamList_8043D8C(struct SioTeamListProc * proc);
void sub_0803EE34(struct SioProc85AAA78 * proc, s8 b);
void SioTeamList_804429C(struct SioTeamListProc * proc);
void SioTeamList_8044324(struct SioTeamListProc * proc);
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc);
void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc);
void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc);

void sub_0803F0F4(struct ProcTactician * proc, u8 * str_buf);
void sub_0803F1A8(struct ProcTactician * proc);
void TacticianDrawCharacters(struct ProcTactician * proc);
int SioStrLen(u8 * buf);
void Tactician_InitScreen(struct ProcTactician * proc);
void SioUpdateTeam(char * str, int team);
void Tactician_MoveHand(struct ProcTactician * proc, int idx, const struct TacticianTextConf * conf);
void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void TacticianTryDeleteChar(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void SaveTactician(struct ProcTactician * proc, const struct TacticianTextConf * conf);
bool sub_8044B78(struct ProcTactician * proc, const struct TacticianTextConf * conf, u32 c, int d);
void Tactician_LoopCore(struct ProcTactician * proc, const struct TacticianTextConf * conf);
void Tactician_Loop(struct ProcTactician * proc);
void sub_0803F8D8(void);
void sub_0803F938(struct ProcTactician * proc);
void TacticianNameSelection_Loop_B(struct ProcTactician * proc);
void sub_0803F990(struct ProcTactician * proc);
void TacticianNameSelection_Loop_C(struct ProcTactician * proc);
void NameSelect_DrawName(struct ProcTactician * proc);
void TacticianNameSelection_Loop_D(struct ProcTactician * proc);
void sub_0803FB24(void);

struct SioPostBattleProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr unk_2c[4];
    /* 3C */ STRUCT_PAD(0x3c, 0x40);
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u8 playerId;
    /* 43 */ u8 unk_43;
    /* 44 */ struct SioProc85A971C_Unk44 unk_44[4];
    /* 64 */ int unk_64;
};

struct SioPostBattleSpritesProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioPostBattleProc * unk_2c;
    /* 30 */ int x;
    /* 34 */ int y;
    /* 38 */ int delayMaybe;
    /* 3C */ int timer;
    /* 40 */ u16 fid;
    /* 42 */ u8 oam2;
    /* 43 */ u8 ranking;
};

struct SioPostBattleMusicProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int isPlayerWinner;
};

void SioPostBattleSprites_Init(struct SioPostBattleSpritesProc * proc);
void SioPostBattleSprites_Loop_DrawSlideIn(struct SioPostBattleSpritesProc * proc);
void SioPostBattleSprites_Loop_DrawStatic(struct SioPostBattleSpritesProc * proc);
ProcPtr StartDrawLinkArenaRankSprites(struct SioPostBattleProc * parent, int delayMaybe, u16 fid, u8 oam2, u8 ranking);
void sub_0803FE24(struct SioPostBattleProc * proc);
void sub_0803FEAC(struct SioPostBattleProc * proc);
ProcPtr SioPostBattle_StartMusicProc(struct SioPostBattleProc * parent);
void SioPostBattle_Init(struct SioPostBattleProc * proc);
void SioPostBattle_Loop_Main(struct SioPostBattleProc * proc);
void SioPostBattle_AwaitAPress(ProcPtr proc);
void SioPostBattleMusic_PlayFanfare(struct SioPostBattleMusicProc * proc);
void SioPostBattleMusic_PlayStandardBgm(void);

struct SioBatProc_Unk2C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
};

struct SioBatProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioBatProc_Unk2C * unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ STRUCT_PAD(0x3C, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ s16 unk_64;
};

int sub_08040280(u8 ranking, u32 playerCount, u32 mode, u32 points);
void sub_080403B0(struct SioBatProc * proc);
void sub_08040444(void);
void New6C_SIOMAIN2(void);
void SIOPRA_Loop(ProcPtr proc);
void sub_080405BC(const char * str, int x, int y, ProcPtr parent);
void sub_08040610(void);
void sub_08040634(void);
void sub_08040640(void);
void sub_08040714(struct SioBatProc * proc);
void sub_08040870(ProcPtr proc);
void sub_080408B8(struct SioBatProc * proc);
void sub_08040AE0(struct SioBatProc * proc);
void sub_08040B80(struct SioBatProc * proc);
void sub_08040C24(struct SioBatProc * proc);
void sub_08040CFC(struct SioBatProc * proc);
void sub_08040DB0(void);
void sub_08040DCC(struct Unit * unit);
void sub_08040E08(struct SioBatProc * proc);
void sub_08040ED8(struct SioBatProc * proc);
void sub_0804105C(struct SioBatProc * proc);
void sub_08041104(struct SioBatProc * proc);
void sub_0804116C(ProcPtr proc);
void sub_080412C8(void);
void sub_080412D4(void);

struct SioTermProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c[3];
    /* 38 */ int unk_38[3];
    /* 44 */ STRUCT_PAD(0x44, 0x48);
    /* 48 */ int unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
};

void sub_080412E0(struct SioTermProc * proc);
void sub_08041584(int * cur, u8 bottom, u8 top, int * buf, u8 total);
void SIOTERM_Loop_A(struct SioTermProc * proc);
void sub_0804168C(struct SioTermProc * proc);
void sub_080416D4(ProcPtr proc);
void sub_080416F0(ProcPtr proc);
void SIOTERM_Loop_B(ProcPtr proc);
void sub_0804172C(ProcPtr proc);
void sub_0804176C(void);

struct SioResultProcUnk2C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ int unk_30;
};

struct SioResultProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioResultProcUnk2C * unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u16 unk_36;
    /* 38 */ s8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
};

void DrawLinkArenaRankIcon(u16 * tm, int base);
void DrawLinkArenaModeIcon(u16 * tm, u32 base);
void DrawLinkArenaRankingRow(struct Text * th, char * nameStr, u8 rank, u16 points, u8 playerCount);
void DrawLinkArenaRankings(void);
void SioResult_Init(struct SioResultProc * proc);
void SioResult_Loop_Main(struct SioResultProc * proc);
u8 sub_08041C44(int var);
void SioResult_NewHS_Init(struct SioResultProc * proc);
void SioResult_NewHS_LoopScroll(struct SioResultProc * proc);
void SioResult_NewHS_AwaitAPress(ProcPtr proc);
void StartSioResultNewHighScore(int value, ProcPtr parent);

/* sio_rulesettings.c */

struct ProcSioRuleSettings
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr unk_2c;
    /* 30 */ int unk_30;
};

struct LinkArenaRuleInfo
{
    /* 00 */ int labelTextId;
    /* 04 */ int xPos[2];
    /* 0C */ int optionTextId[2];
};

extern const struct LinkArenaRuleInfo gLinkArenaRuleData[];

void StartSioResultNewHighScore(int value, ProcPtr parent);
void LoadLinkArenaRuleSettings(u8 * buf);
void SaveLinkArenaRuleSettings(u8 * buf);
void sub_0804203C(int idx, int state);
void SioRuleSettings_Init(struct ProcSioRuleSettings * proc);
void SioRuleSettings_Loop_Main(struct ProcSioRuleSettings * proc);

struct SioMenuItemProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 xBase;
    /* 2C */ s16 yBase;
    /* 2E */ u8 state; // 0 = disabled, 1 = enabled, 2 = selected
    /* 2F */ u8 index;
    /* 30 */ u8 glowFrame;
    /* 32 */ s16 xLeftArrow;
    /* 34 */ s16 xRightArrow;
    /* 36 */ u16 leftArrowAnmCnt;
    /* 38 */ u16 rightArrowAnmCnt;
    /* 3A */ s16 leftArrowSpeed;
    /* 3C */ s16 rightArrowSpeed;
    /* 3E */ u8 unk_3e;
};

struct SioMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioMenuItemProc * menuItems[5];
    /* 40 */ u8 menuItemState[5];
    STRUCT_PAD(0x45, 0x48);
    /* 48 */ int unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
    /* 54 */ int unk_54;
    /* 58 */ s8 unk_58;
    /* 59 */ s8 unk_59;
};

int SioMenu_GetItemHelpText(struct SioMenuProc * proc, int lineNum);
bool CheckSomethingSaveRelated(void);
void SioMenu_Init(void);
void SioMenu_LoadGraphics(struct SioMenuProc * proc);
void SioMenu_8047C60(struct SioMenuProc * proc);
void sub_08042690(struct SioMenuProc * proc);
void SioMenu_RestartGraphicsMaybe(struct SioMenuProc * proc);
void SioMenu_HandleDPadInput(struct SioMenuProc * proc, u8 b);
void SioMenu_Loop_HandleKeyInput(struct SioMenuProc * proc);
void SioMenu_80480B4(struct SioMenuProc * proc);
void SioMenu_End(struct SioMenuProc * proc);
void StartLinkArenaMainMenu(ProcPtr parent);

bool XMapTransfer_80482E0(ProcPtr proc);
void XMapTransfer_80483F8(ProcPtr proc);
void XMapTransfer_8048418(ProcPtr proc);
bool XMapTransfer_8048460(ProcPtr proc);
void PutXMapProgressPercent(struct Text * th, const char * str, int number);
void DrawXMapSendProgress(struct SioBigSendProc * proc);
void DrawXMapReceiveProgress(struct SioBigReceiveProc * proc);
void StartXMapTransfer(struct SioBigSendProc * proc);
bool XMapTransfer_AwaitCompletion(void);
void sub_08043068(void);
bool sub_0804307C(void);
void XMapTransfer_8048730(void);
void sub_08043130(void);
void SioEvent_GotoLabel1UnlessYes(ProcPtr proc);
void sub_08043170(ProcPtr proc);
void EraseSaveData(void);

struct LAPointsBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text text[4];
};

struct PointsNumberMoverProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 x;
    /* 2C */ s16 y;
    /* 2E */ s16 xTarget;
    /* 30 */ s16 yTarget;
    /* 32 */ u8 playerId;
    /* 33 */ u8 unitId;
    /* 34 */ int difference;
    /* 38 */ u32 newScore;
    /* 3C */ u32 timer;
    /* 40 */ s8 unk_40;
    /* 41 */ STRUCT_PAD(0x41, 0x44);
    /* 44 */ int unk_44; // used for showing the "rolling" number while accumulating points
    /* 48 */ struct Text text;
};

struct PointsSpriteTextProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ STRUCT_PAD(0x4E, 0x54);
    /* 54 */ const char * str;
};

void sub_080431C0(void);
void sub_080440E8(struct SioProc85A971C_Unk44 * buf);
void DrawLinkArenaPointsBox(struct Text * th, int x, int y, int var, int number);
void LAPointsBox_LoadBoxes(struct LAPointsBoxProc * proc);
void LAPointsBox_Dummy(void);
void StartLinkArenaPointsBox(void);
void EndLinkArenaPointsBox(void);
void PointsNumberMover_Init(struct PointsNumberMoverProc * proc);
void PointsNumberMover_LoopNumberEmerge(struct PointsNumberMoverProc * proc);
void PointsNumberMover_LoopMoveToPointsBox(struct PointsNumberMoverProc * proc);
void DrawLinkArenaScoreNumber(struct Text * th, int x, int y, int number);
void PointsNumberMover_InitScoreChange(struct PointsNumberMoverProc * proc);
void PointsNumberMover_TickScore(struct PointsNumberMoverProc * proc);
void PointsNumberMover_AwaitEnd(struct PointsNumberMoverProc * proc);
void PointsSpriteText_Init(struct PointsSpriteTextProc * proc);
void PointsSpriteText_LoopIn(struct PointsSpriteTextProc * proc);
void PointsSpriteText_LoopOut(struct PointsSpriteTextProc * proc);
s8 sub_08044940(int x, int y, const char * str, u8 flag, ProcPtr parent);
void sub_08044A8C(ProcPtr proc);
void sub_08044AC0(ProcPtr proc);


extern struct SioUnknown_0203DD90 gUnk_Sio_0203DD90;
void CallEraseSaveEvent(ProcPtr proc);

// Shared link arena data (FE8U names at FE7U addresses, see symbols.ld)

extern struct Text Texts_0203DB14[];
extern struct Text Text_0203DB14;
extern struct Font Font_0203DB64;
extern struct Font Font_Sio_02000C60;
extern struct Text gUnk_Sio_0203DA88[];
extern char gUnk_Sio_0203DAC5[][19];
extern struct Text gSioTexts[];
extern const u8 Img_TacticianSelObj[];
extern const u16 Pal_TacticianSelObj[];

// sio_uiutils / sio_mu and other helpers (FE7U names)

void InitSioBG(void);
void sub_08047BD4(ProcPtr parent, int n);
void sub_08047CA8(void);
void sub_08049220(void);
void StartLinkArenaTitleBanner(ProcPtr parent, int size);
void sub_08047E84(u8 * str, int len, int x, int y, int palId, ProcPtr parent);
ProcPtr StartNameEntrySpriteDraw(ProcPtr parent, int x, int y);
void UpdateNameEntrySpriteDraw(void * proc, int xNew, int yNew, int xPointer, int cursorKind, int f);
void PutLinkArenaChoiceBannerSprite(int x, int y);
void UpdateLinkArenaMenuScrollBar(u8 a, s16 b);
void ScrollMultiArenaTeamSprites(int amount);
void * memcpy(void * dst, const void * src, unsigned long n);
void m4aMPlayFadeOut(struct MusicPlayerInfo * mplayInfo, u16 speed);



extern struct MultiArenaRankingEnt gSioResultRankings[];
extern const int gLinkArenaStatusMsg[];
extern char gUnknown_03004E86[];
extern u8 const gUnknown_080D9E44[];
extern const u8 gUnknown_085AC604[];
extern const u8 Img_LinkArenaPlayerBanners[];
extern const struct ProcCmd ProcScr_SIOCON[];
extern const struct ProcCmd ProcScr_SIOVSYNC[];
extern const struct ProcCmd ProcScr_SIOMAIN[];
extern const struct ProcCmd ProcScr_SIOMAIN2[];

int sub_0804528C(void); // FE8U sub_8049A60
void sub_08048E0C(struct Unit * unit); // FE8U sub_804D40C
ProcPtr StartTalkExt(int, int, const char *, ProcPtr);
void SetTalkFlag(int);
void SetTalkPrintDelay(s8 delay);
void StartLinkArenaButtonSpriteDraw(int x, int y, ProcPtr parent);
ProcPtr StartLinkArenaVersusSpriteDraw(int x, int y, ProcPtr parent);
void StartSioErrorScreen(void);

extern const u8 gUnknown_080D9D5E[];
extern const int gUnknown_081D5254[];
extern u8 * CONST_DATA gUnknown_08B98CA8[];
void StartPrepAtMenu(void);
void StartLinkArenaMenuScrollBar(int xBase, int yBase, u8 c, u8 d, u8 e, ProcPtr parent);
void sub_08047C38(ProcPtr parent);
extern const u8 Img_LinkArenaRankIcons[];
extern const u16 Pal_LinkArenaRankIcons[];
ProcPtr StartRuleSettingSpriteDrawInteractive(ProcPtr parent);
void UpdateRuleSettingSprites(ProcPtr proc, s16 b, s16 xOption, s16 yOption);
extern int gKeyInputSequenceTimer;
extern int gTargetKeyInSeqIndex;
extern int gCurrentKeyInSeqIndex;
extern u16 gKeyInputSequenceBuffer[];
ProcPtr StartSioMenuItem(ProcPtr parent, u8 xBase, u8 yBase, u8 index, u8 state);
void SioMenuItem_SetArrowConfig(struct SioMenuItemProc * proc, int xLeft, int xRight, int leftSpeed, int rightSpeed);
void SioMenuItem_SetPosition(struct SioMenuItemProc * proc, s16 x, s16 y);
extern struct SioMessage gUnknown_03004E80;
