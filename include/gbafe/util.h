#include "global.h"

enum interpolate_method_idx {
    INTERPOLATE_LINEAR,
    INTERPOLATE_SQUARE,
    INTERPOLATE_CUBIC,
    INTERPOLATE_POW4,
    INTERPOLATE_RSQUARE,
    INTERPOLATE_RCUBIC,
};

int Interpolate(int method, int lo, int hi, int x, int end);
// ??? nullsub_33
bool StringEquals(char const * strA, char const * strB);
void StringCopy(char * dst, char const * src);
// ??? UnpackRaw
// ??? DecompressViaGenericBuf
void Decompress(void const * src, void * dst);
int GetDataSize(void const * data);
// ??? sub_080131B0
// ??? sub_080131C8
// ??? sub_080131F8
void Register2dChrMove(u8 const * img, u8 * vram, int width, int height);
void Copy2dChr(void const * src, u8 * dst, int width, int height);
void ApplyBitmap(u8 const * src, void * dst, int width, int height);
void ApplyBitmapLine(u8 const * src, void * dst, int width);
// ??? ApplyBitmapTile
void PutAppliedBitmap(u16 * tm, int tileref, int width, int height);
// ??? PutDigits
// ??? sub_08013380
// ??? sub_08013388
// ??? sub_0801339C
// ??? sub_080133A8
// ??? sub_080133C8
// ??? sub_08013450
// ??? DarkenPals
// ??? nullsub_34
// ??? sub_08013604
// ??? GetPalFadeSt
// ??? SetPalFadeStClkEnd
// ??? SetPalFadeStClkEnd1
// ??? SetPalFadeStClkEnd2
// ??? SetPalFadeStClkEnd3
int GetPalFadeStClkEnd1(void);
int GetPalFadeStClkEnd2(void);
int GetPalFadeStClkEnd3(void);
void ArchiveCurrentPalettes(void);
void ArchivePalette(int index);
void WriteFadedPaletteFromArchive(int red, int green, int blue, u32 mask);
// ??? sub_08013964
// ??? sub_0801396C
void sub_080139D8(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent); // fe8u: sub_8013800
bool sub_08013A1C(void); // fe8u: sub_8013844
// ??? SpacialSeTest_OnInit
// ??? SpacialSeTest_OnLoop
// ??? StartSpacialSeTest
// ??? nullsub_35

struct PalFadeSt {
    /* 00 */ u16 from_colors[0x10];
    /* 20 */ u16 const * to_colors;
    /* 24 */ u16 * pal;
    /* 28 */ u16 clock;
    /* 2A */ u16 clock_end;
    /* 2C */ u16 clock_stop;
};

void StartPalFadeToBlack(int palid, int duration, ProcPtr parent);
void StartPalFadeToWhite(int palid, int duration, ProcPtr parent);
struct PalFadeSt * StartPalFade(u16 const * colors, int pal, int duration, ProcPtr parent);
// ??? sub_8014080
// ??? SetPalFadeStop
// ??? PalFade_OnLoop
void SetBlackPal(int palid);
// ??? sub_08013C7C
// ??? sub_80141BC
// ??? sub_80141D4
// ??? sub_08013CCC
// ??? sub_8014264
// ??? sub_08013D88
// ??? sub_08013E14
// ??? sub_08013E54
// ??? sub_08013E84
// ??? FadeExists
// ??? StartFadeFromBlack
// ??? StartLockingFadeToBlack
// ??? StartLockingFadeToBlack
// ??? StartLockingFadeFromBlack
// ??? sub_8014488
// ??? sub_80144A0
void StartMidFadeFromBlack(void);
// ??? StartSlowFadeFromBlack
// ??? StartFastFadeFromBlack
void StartMidLockingFadeToBlack(ProcPtr parent);
// ??? StartSlowLockingFadeToBlack
// ??? StartFastLockingFadeToBlack
void StartMidLockingFadeToBlack(ProcPtr parent);
// ??? StartSlowLockingFadeFromBlack
// ??? StartFastLockingFadeFromBlack
// ??? StartMidLockingFadeFromBlack
// ??? sub_8014540
// ??? sub_8014550
// ??? sub_8014560
// ??? sub_8014570
// ??? sub_08014060
// ??? sub_08014078
// ??? sub_08014090
// ??? sub_080140A8
// ??? sub_080140C0
// ??? sub_080140D8
// ??? sub_080140EC
// ??? sub_08014100
// ??? sub_08014114
// ??? sub_08014128
// ??? sub_08014140
// ??? sub_08014158
void sub_08014170(ProcPtr proc);
// ??? sub_08014188
// ??? FadeInBlackSpeed04
// ??? FadeInBlackSpeed08
// ??? FadeInBlackSpeed08Unk
// ??? FadeInBlackSpeed10
void FadeInBlackSpeed20(ProcPtr proc);
// ??? FadeInBlackSpeed40
// ??? sub_0801421C
// ??? sub_08014230
// ??? sub_08014244
// ??? sub_08014258
void sub_0801426C(ProcPtr proc);
// ??? sub_08014280
void WaitForFade(ProcPtr proc);
// ??? sub_080142B4
// ??? StartFadeCore
// ??? sub_8014834
// ??? FadeCore_Init
// ??? FadeCore_Loop
// ??? FadeCore_Tick
// ??? sub_080143A0
// ??? sub_080143B4
// ??? sub_080143C4
// ??? sub_080143E0
// ??? sub_08014450
void StartTemporaryLock(ProcPtr proc, int arg_1);
// ??? TemporaryLock_OnLoop
u8 sub_080144CC(int number, char * buf);
// ??? PutStringCentered
// ??? PutString
// ??? sub_080146DC
// ??? StartPaletteAnimatorExt
// ??? StartPaletteAnimatorReverse
// ??? StartPaletteAnimatorNormal
// ??? sub_08014758
// ??? sub_080147BC
// ??? sub_08014824
// ??? sub_080148FC
// ??? sub_080149A8
// ??? sub_08014A68
// ??? CallDelayed_OnLoop
// ??? CallDelayedArg_OnLoop
void CallDelayed(void (*)(), int);
// ??? CallDelayedArg
// ??? sub_08014B70
// ??? sub_08014B84
// ??? sub_08014B94
// ??? StartPartialGameLock
// ??? PartialGameLock_OnLoop
// ??? VramCopy
// ??? sub_80150A0
// ??? sub_08014C50
// ??? sub_08014C74
// ??? sub_08014CD0
// ??? Screen2Pan
// ??? PlaySeSpacial
// ??? PlaySeDelayed
// ??? PlaySeFunc
// ??? sub_08014E18
// ??? sub_08014E28
// ??? sub_08014E38
// ??? MemCpy
// ??? PutDrawTextCentered
// ??? VecMulMat
// ??? MatMulMat
// ??? MatIdent
// ??? MatCopy
// ??? MatRotA
// ??? MatRotB
// ??? MatRotC
// ??? nullsub_36
// ??? VecDotVec
// ??? VecCrossVec
// ??? sub_08015244
