#pragma once

#include "global.h"
#include "proc.h"

// FE8U: bmpatharrowdisp.c

struct PathArrowProc
{
    PROC_HEADER;
    /* 29 */ s8 lastX;
    /* 2A */ s8 lastY;
    /* 2B */ s8 maxMov;
    /* 2C */ s8 pathLen;
    /* 2D */ s8 pathX[20];
    /* 41 */ s8 pathY[20];
    /* 55 */ s8 pathCosts[20];
};
PROC_SIZE_CHECK(struct PathArrowProc);

extern struct PathArrowProc * CONST_DATA gpPathArrowProc;
extern u16 CONST_DATA gPathArrowOAMTable[5][5];
extern u8 CONST_DATA Img_PathArrow[];
extern u16 CONST_DATA Pal_PathArrow[];

void SetLastCoords(u16 x, u16 y);
void CutOffPathLength(s8 newIndex);
void AddPointToPathArrowProc(s8 x, s8 y);
s32 GetPointAlongPath(s8 x, s8 y);
void GetPathFromMovementScript(void);
void GetMovementScriptFromPath(void);
void GenerateMovementMapForActiveUnit(void);
void ResetPathArrow(void);
bool8 PathContainsNoCycle(void);
void PathArrowDisp_Init(u8 a);
void UpdatePathArrowWithCursor(void);
u8 GetDirectionOfPathBeforeIndex(u8 i);
u8 GetDirectionOfPathAfterIndex(u8 i);
u8 PointInCameraBounds(s16 x, s16 y, u8 xBound, u8 yBound);
void DrawPathArrow(void);
void DrawUpdatedPathArrow(void);
