#include "global.h"

enum interpolate_method_idx {
    INTERPOLATE_LINEAR,
    INTERPOLATE_SQUARE,
    INTERPOLATE_CUBIC,
    INTERPOLATE_POW4,
    INTERPOLATE_RSQUARE,
    INTERPOLATE_RCUBIC,
};

struct TileMapArr {
    u32 type : 8;
    u32 size : 24;
};

struct Struct08013180 {
    u8 * dst;
    int unk_04;
};

int Interpolate(int method, int lo, int hi, int x, int end);
void sub_080130B0(void);
bool StringEquals(char const * strA, char const * strB);
void StringCopy(char * dst, char const * src);
void UnpackRaw(void const * src, void * dst);
void DecompressViaGenericBuf(void const * src, void * dst);
void Decompress(void const * src, void * dst);
int GetDataSize(void const * data);
void sub_080131B0(struct Struct08013180 * buf, int arg_1, int arg_2);
int sub_080131C8(struct Struct08013180 * buf, u8 * src);
int sub_080131F8(struct Struct08013180 * buf, int arg_1);
void Register2dChrMove(u8 const * img, u8 * vram, int width, int height);
void Copy2dChr(void const * src, u8 * dst, int width, int height);
void ApplyBitmap(u8 const * src, void * dst, int width, int height);
void ApplyBitmapLine(u8 const * src, void * dst, int width);
void ApplyBitmapTile(u8 const * src, u32 * dst, int width);
void PutAppliedBitmap(u16 * tm, int tileref, int width, int height);
void PutDigits(u16 * tm, u8 const * src, int tileref, int len);
struct Unk_08013380 {
    /* 00 */ STRUCT_PAD(0x00, 0x4C);
    /* 4C */ u16 unk_4C;
};

void sub_08013380(struct Unk_08013380 * unk, int value);
void sub_08013388(struct Unk_08013380 * unk);
void sub_0801339C(struct Unk_08013380 * unk);
void sub_080133A8(s16 * array);
void sub_080133C8(s16 * buf, int x1, int y1, int x2, int y2);
struct Vec2 * sub_08013450(int arg_0);
void DarkenPals(int reduction);
void sub_08013600(void);
void sub_08013604(char const * str);

struct PalFadeSt {
    /* 00 */ u16 from_colors[0x10];
    /* 20 */ u16 const * to_colors;
    /* 24 */ u16 * pal;
    /* 28 */ u16 clock;
    /* 2A */ u16 clock_end;
    /* 2C */ u16 clock_stop;
};

struct PalFadeSt * GetPalFadeSt(void);
void SetPalFadeStClkEnd1(int end);
void SetPalFadeStClkEnd2(int end);
void SetPalFadeStClkEnd3(int end);
int GetPalFadeStClkEnd1(void);
int GetPalFadeStClkEnd2(void);
int GetPalFadeStClkEnd3(void);
void SetPalFadeStClkEnd(int end1, int end2, int end3);
void ArchiveCurrentPalettes(void);
void ArchivePalette(int index);
void WriteFadedPaletteFromArchive(int red, int green, int blue, u32 mask);
// sub_08013964
// sub_0801396C
void sub_080139D8(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent); // fe8u: sub_8013800
bool sub_08013A1C(void); // fe8u: sub_8013844
// SpacialSeTest_OnInit
// SpacialSeTest_OnLoop
void StartSpacialSeTest(void);
void sub_08013AC4(void);
void StartPalFadeToBlack(int palid, int duration, ProcPtr parent);
void StartPalFadeToWhite(int palid, int duration, ProcPtr parent);
struct PalFadeSt * StartPalFade(u16 const * colors, int pal, int duration, ProcPtr parent);
void EndPalFade(void);
void SetPalFadeStop(struct PalFadeSt * st, int val);
// PalFade_OnLoop
void SetBlackPal(int palid);
void SetWhitePal(int palid);
void SetAllBlackPals(void);
void SetAllWhitePals(void);
void FadeToBlack_OnInit(struct Proc * proc);
void FadeToCommon_OnLoop(struct Proc * proc);
void FadeFromBlack_OnInit(struct Proc * proc);
void FadeFromCommon_OnLoop(struct Proc * proc);
void FadeToWhite_OnInit(struct Proc * proc);
void FadeFromWhite_OnInit(struct Proc * proc);
bool FadeExists(void);
void StartFadeToBlack(int q4_speed);
void StartFadeFromBlack(int q4_speed);
void StartLockingFadeToBlack(int q4_speed, ProcPtr parent);
void StartLockingFadeFromBlack(int q4_speed, ProcPtr parent);
void StartLockingFadeToWhite(int q4_speed, ProcPtr parent);
void StartLockingFadeFromWhite(int q4_speed, ProcPtr parent);
void StartMidFadeToBlack(void);
void StartSlowFadeToBlack(void);
void StartFastFadeToBlack(void);
void StartMidFadeFromBlack(void); // FE7J calls it StartMidLockingFadeToBlack
void StartSlowFadeFromBlack(void);
void StartFastFadeFromBlack(void);
void StartMidLockingFadeToBlack(ProcPtr parent);
void StartSlowLockingFadeToBlack(ProcPtr parent);
void StartFastLockingFadeToBlack(ProcPtr parent);
void StartMidLockingFadeFromBlack(ProcPtr parent);
void StartSlowLockingFadeFromBlack(ProcPtr parent);
void StartFastLockingFadeFromBlack(ProcPtr parent);
void StartSlowLockingFadeToWhite(ProcPtr parent);
void StartSlowLockingFadeFromWhite(ProcPtr parent);
void sub_08014060(ProcPtr parent);
void sub_08014078(ProcPtr parent);
void sub_08014090(ProcPtr parent);
void sub_080140A8(ProcPtr parent);
void sub_080140C0(ProcPtr parent);
void sub_080140D8(ProcPtr parent);
void sub_080140EC(ProcPtr parent);
void sub_08014100(ProcPtr parent);
void sub_08014114(ProcPtr parent);
void sub_08014128(ProcPtr parent);
void sub_08014140(ProcPtr parent);
void sub_08014158(ProcPtr parent);
void sub_08014170(ProcPtr proc);
void sub_08014188(ProcPtr parent);
void FadeInBlackSpeed04(ProcPtr parent);
void FadeInBlackSpeed08(ProcPtr parent);
void FadeInBlackSpeed08Unk(ProcPtr parent);
void FadeInBlackSpeed10(ProcPtr parent);
void FadeInBlackSpeed20(ProcPtr proc);
void FadeInBlackSpeed40(ProcPtr parent);
void sub_0801421C(ProcPtr parent);
void sub_08014230(ProcPtr parent);
void sub_08014244(ProcPtr parent);
void sub_08014258(ProcPtr parent);
void sub_0801426C(ProcPtr proc);
void sub_08014280(ProcPtr parent);
void WaitForFade(ProcPtr proc);
void sub_080142B4(ProcPtr parent, void * func);

struct FadeCoreProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ void (* on_end)(void);
    /* 50 */ STRUCT_PAD(0x50, 0x54);
    /* 54 */ int speed;
    /* 58 */ int looper;
    /* 5C */ int counter;
};

void StartFadeCore(int kind, int speed, ProcPtr parent, void * end_callback);
void FadeCoreEndEach(void);
void FadeCore_Init(struct FadeCoreProc * proc);
void FadeCore_Loop(struct FadeCoreProc * proc);
bool FadeCore_Tick(struct FadeCoreProc * proc);
void sub_080143A0(void);
void sub_080143B4(int a, int b);
void sub_080143C4(void);
void sub_080143E0(void);
void sub_08014450(void);
void StartTemporaryLock(ProcPtr proc, int arg_1);
void TemporaryLock_OnLoop(struct Proc * proc);
int NumberToStringSJis(int number, char * buf);
struct Text * PutStringCentered(u16 * tm, int color, int width, char const * str);
struct Text * PutString(u16 * tm, int color, char const * str);

struct ProcPaletteAnimator {
    /* 00 */ PROC_HEADER;
    /* 2C */ u16 const * colors;
    /* 30 */ u16 palOffset;
    /* 32 */ u16 colorCount;
    /* 34 */ u16 clock_end;
    /* 36 */ u16 clock;
    /* 38 */ u16 counter;
    /* 3A */ u16 reverseOrder;
};

void DeleteAllPaletteAnimator(void);
ProcPtr StartPaletteAnimatorExt(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent);
void StartPaletteAnimatorReverse(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent);
void StartPaletteAnimatorNormal(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent);
void PaletteAnimator_Loop(struct ProcPaletteAnimator * proc);
void sub_080147BC(u16 * tm, int x, int y, u16 tileref, int width, int height);
void sub_08014824(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, bool hflip);
void sub_080148FC(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7);
void sub_080149A8(u16 * tm, int x, int y, u16 tileref, int width, int height, u8 const * src, int arg_7);
void sub_08014A68(u16 * tm, int x, int y, u32 const * arg_3, u16 tileref);

struct CallDelayedProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ void (* func)();
    /* 30 */ int arg;
    /* 34 */ int clock;
};

void CallDelayed_OnLoop(struct CallDelayedProc * proc);
void CallDelayedArg_OnLoop(struct CallDelayedProc * proc);
void CallDelayed(void (*)(), int);
void CallDelayedArg(void (* func)(int), int arg, int delay);
void sub_08014B70(u8 * out, int size);
void sub_08014B84(u8 * out, int size, int value);
void sub_08014B94(u16 * out, int size, int value);
void StartPartialGameLock(ProcPtr proc);
void PartialGameLock_OnLoop(struct Proc * proc);
void VramCopy(u8 const * src, u8 * dst, int size);
void VramCopyInRaw(u8 const * src, u8 * dst, int width, int height);
void PutTmLinear(u16 const * src, u16 * dst, int size, u16 tileref);
u16 * GetTmOffsetById(int bgid, int x, int y);
void sub_08014CD0(void);
int Screen2Pan(int x);
void PlaySeSpacial(int song, int x);
void PlaySeDelayed(int song, int delay);
void PlaySeFunc(int song);
void _StartBgm(short song);
void _FadeBgmOut(short speed);
void sub_08014E38(int palid);
void MemCpy(void const * src, void * dst, int size);
void PutDrawTextCentered(struct Text * text, int x, int y, char const * str, int width);
void VecMulMat(int const * vec, int const * mat, int * ovec);
void MatMulMat(int const * lmat, int const * rmat, int * omat);
void MatIdent(int * mat);
void MatCopy(int const * src, int * dst);
void MatRotA(int * mat, short angle);
void MatRotB(int * mat, short angle);
void MatRotC(int * mat, short angle);
void sub_080151E4(void);
int VecDotVec(int const * lvec, int const * rvec);
void VecCrossVec(int const * lvec, int const * rvec, int * ovec);
int sub_08015244(int a, int b, int c, int d);
