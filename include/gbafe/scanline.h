#pragma once

#include "global.h"

extern u16 EWRAM_DATA gManimScanlineBufA[DISPLAY_HEIGHT * 2];
extern u16 EWRAM_DATA gManimScanlineBufB[DISPLAY_HEIGHT * 2];
extern u16 * EWRAM_DATA gManimScanlineBufs[2];
extern u16 * EWRAM_DATA gManimActiveScanlineBuf;

void InitScanlineEffect(void);
// sub_0807689C
// sub_080769CC
void ResetScanLineHBlank(void);
// sub_08076A10
// sub_08076A78
// sub_08076AFC
// sub_8077350
// StartManimFrameGradientScanlineEffect1
// StartManimFrameGradientScanlineEffect2
// sub_08076D8C
// PrepareSineWaveScanlineBuf
// sub_08076EC4
void sub_08076F44(u16 *, s16, s16, int);
void sub_08076FC4(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int arg5);
void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int yStart, int yEnd);
void SwapScanlineBufs(void);
void InitScanlineBuf(u16 * buf);
// SetScanlineBufWinL
// SetScanlineBufWinR
// MapAnimScanlineCore
// PrepareGradientScanlineBuf
// sub_8077BC0
// sub_08077410
// sub_0807744C
u16 * GetScanlineBuf(int buf_id, int scanline);
// sub_0807754C
// sub_0807764C
// sub_08077680
// sub_080777E4
// sub_08077860
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
// sub_08077EB8
// sub_080780C4
