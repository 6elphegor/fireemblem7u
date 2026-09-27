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
void sub_0803D6E8(struct SioBigSendProc * proc);
void sub_0803D758(struct SioBigReceiveProc * proc);
void sub_0803D780(struct SioBigReceiveProc * proc);
void sub_0803D7C4(struct SioBigReceiveProc * proc);
int StartSioBigSend(void * data, u32 len, void (*func)(struct SioBigSendProc *), u8 arg_3, ProcPtr parent);
void StartSioBigReceive(void * data, void (*func)(struct SioBigReceiveProc *), ProcPtr parent);
bool IsSioBigTransferActive(void);
