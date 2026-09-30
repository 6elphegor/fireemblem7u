#pragma once

#include "global.h"

extern u16 EWRAM_DATA gManimScanlineBufA[DISPLAY_HEIGHT * 2];
extern u16 EWRAM_DATA gManimScanlineBufB[DISPLAY_HEIGHT * 2];
extern u16 * EWRAM_DATA gManimScanlineBufs[2];
extern u16 * EWRAM_DATA gManimActiveScanlineBuf;

struct ManimSineWaveProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 phase;
};
PROC_SIZE_CHECK(struct ManimSineWaveProc);

void InitScanlineEffect(void);
void sub_0807689C(void);
void sub_080769CC(int x, int y, int radius);
void ResetScanLineHBlank(void);
void sub_08076A10(void);
void sub_08076A78(void);
void sub_08076AFC(void);
// sub_8077350
// StartManimFrameGradientScanlineEffect1
void StartManimFrameGradientScanlineEffect2(u16 y_top, u16 y_bottom, u16 color_a, u16 color_b);
void sub_08076D8C(int x, int y, int a, int b, u8 const * lut);
void PrepareSineWaveScanlineBuf(u16 * buf, s16 phase, s16 amplitude, s16 frequency);
void sub_08076EC4(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int offset);
void sub_08076F44(u16 * buf, s16 phase, s16 amplitude, s16 frequency);
void sub_08076FC4(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int arg5);
void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd);
void SwapScanlineBufs(void);
void InitScanlineBuf(u16 * buf);
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);
void MapAnimScanlineCore(u16 * buf, int x, int y, int radius);
void PrepareGradientScanlineBuf(u16 * buf, u16 y_top, u16 y_bottom, u16 color_a, u16 color_b);
// sub_8077BC0
void ManimShiftingSineWave_Main(struct ManimSineWaveProc * proc);
void sub_0807744C(void);
u16 * GetScanlineBuf(int buf_id, int scanline);
void sub_0807754C(u16 * buf, int x, int y, int radius);
void sub_0807764C(int x, int y, int radius);
void sub_08077680(int arg);
void sub_080777E4(void);
void sub_08077860(void);
void HBlank_Scanline_8078098(void);
void sub_08077910(int a, int b);
void CandleFlameFx_OnHBlank(void);
void ScanlineRotation(u16 *, s16, s16, s16, s16, s16, s16);
void sub_08077ADC(void);
// sub_8078344
void DragonGatefx_LightHBlank(void);
// sub_8078474
void QuintessenceFx_OnHBlank(void);
void DragonGatefx_DragonHBlank(void);
void sub_08077EB8(u16 * buf, int x, int y, int rx, int ry);
void sub_080780C4(int x, int y, int rx, int ry);
void sub_08076B80(void);
void StartManimFrameGradientScanlineEffect1(void);
void ManimShiftingSineWave_Init(struct ManimSineWaveProc * proc);
void sub_08077B74(void);
void sub_08077CA4(void);
