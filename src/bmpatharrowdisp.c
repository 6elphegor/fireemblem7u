#include "gbafe.h"
#include "gbafe/mapwork.h"
#include "gbafe/cp_common.h"
#include "gbafe/bmpatharrowdisp.h"

// Movement path arrow (FE8U: bmpatharrowdisp.c)

void SetLastCoords(u16 x, u16 y) {
    gpPathArrowProc->lastX = x;
    gpPathArrowProc->lastY = y;
}

#define TERRAIN_AT(x, y) gBmMapTerrain[y][x]

// I could only get a match by inlining the whole loop body into one gross line.
void CutOffPathLength(s8 newIndex) {
    if (gpPathArrowProc->pathLen >= newIndex) {
        s8 i;
        gpPathArrowProc->pathLen = newIndex - 1;
        gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] =
            gpPathArrowProc->maxMov;
        for (i = 1; i <= gpPathArrowProc->pathLen; i++) {
            u8 *costs = GetWorkingMoveCosts();
            gpPathArrowProc->pathCosts[i] =
                gpPathArrowProc->pathCosts[i - 1] -
                costs[TERRAIN_AT(
                    gpPathArrowProc->pathX[i],
                    gpPathArrowProc->pathY[i])];
        }
    }
}

void AddPointToPathArrowProc(s8 x, s8 y) {
    u8 * costs;
    gpPathArrowProc->pathLen++;
    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] = x;
    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] = y;
    costs = GetWorkingMoveCosts();
    gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] =
        gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen - 1] -
        costs[gBmMapTerrain[y][x]];
}

s32 GetPointAlongPath(s8 x, s8 y) {
    s8 i;
    for (i = 0; i <= gpPathArrowProc->pathLen; i++) {
        if (gpPathArrowProc->pathX[i] == x && gpPathArrowProc->pathY[i] == y)
            return i;
    }
    return -1;
}

void GetPathFromMovementScript(void) {
    s8 i = 0;
    while (TRUE) {
        // I do not know what these +1s are about. but they are necessary to
        // the match as far as I can tell.  maybe I'm supposed to use another
        // enum or something.
        u32 cmd = gWorkingMoveScr[i++] + 1;

        if (cmd <= 0xa) {
            switch (cmd) {

            case MOVE_CMD_END + 1:
            case MOVE_CMD_HALT + 1:
                return;
            case MOVE_CMD_FACE_LEFT + 1:
            case MOVE_CMD_FACE_RIGHT + 1:
            case MOVE_CMD_FACE_DOWN + 1:
            case MOVE_CMD_FACE_UP + 1:
            case MOVE_CMD_SLEEP + 1:
                continue;
            case MOVE_CMD_MOVE_LEFT + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] - 1,
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen]);
                break;
            case MOVE_CMD_MOVE_RIGHT + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] + 1,
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen]);
                break;
            case MOVE_CMD_MOVE_UP + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] - 1);
                break;
            case MOVE_CMD_MOVE_DOWN + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] + 1);
                break;
            }
        }
    }
}

void GetMovementScriptFromPath(void) {
    s8 i;
    for (i = 1; i <= gpPathArrowProc->pathLen; i++)
    {
        s8 x, y;
        s8 newX, newY;
        u8 result;


        newX = gpPathArrowProc->pathX[i];
        x = gpPathArrowProc->pathX[i - 1];
        if (newX < x) {
            gWorkingMoveScr[i - 1] = MOVE_CMD_MOVE_LEFT;
        }
        else if (newX > x) {
            gWorkingMoveScr[i - 1] = MOVE_CMD_MOVE_RIGHT;
        }

        else if (gpPathArrowProc->pathY[i] < gpPathArrowProc->pathY[i - 1]) {
            gWorkingMoveScr[i - 1] = MOVE_CMD_MOVE_UP;
        }
        else {
            gWorkingMoveScr[i - 1] = MOVE_CMD_MOVE_DOWN;
        }
    }
    gWorkingMoveScr[i - 1] = MOVE_CMD_HALT;
}

void GenerateMovementMapForActiveUnit(void) {
    MapFloodOnWorkingMap(
		gActiveUnit,
		gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
		gpPathArrowProc->pathY[gpPathArrowProc->pathLen],
		gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen]);
}

void ResetPathArrow(void) {
    CutOffPathLength(1);
    GenerateMovementMapForActiveUnit();
    BuildBestMoveScript(
        gBmSt.cursor.x,
        gBmSt.cursor.y,
        gWorkingMoveScr);
    GetPathFromMovementScript();
}

bool8 PathContainsNoCycle(void) {
    s8 i, j;
    for (i = gpPathArrowProc->pathLen; i > 0; --i) {
        for (j = i - 1; j >= 0; --j) {
            if (gpPathArrowProc->pathX[i] == gpPathArrowProc->pathX[j] &&
                gpPathArrowProc->pathY[i] == gpPathArrowProc->pathY[j])
            {
                return 0;
            }
        }
    }

    return 1;
}

void PathArrowDisp_Init(u8 a) {
    Decompress(Img_PathArrow, (void *) OBJ_VRAM0 + 0x5E00);
    ApplyPalette(Pal_PathArrow, 0x13);
    if (a == 0) {
        gpPathArrowProc->maxMov =
            gActiveUnit->movBonus + gActiveUnit->pClassData->baseMov - gActionSt.move_count;
        CutOffPathLength(0);
        AddPointToPathArrowProc(gActiveUnit->xPos, gActiveUnit->yPos);
        gpPathArrowProc->pathCosts[0] = gpPathArrowProc->maxMov;
        // This seems strange. But passing -1 to a signed argument doesn't seem to match
        SetLastCoords(0xFFFF, 0xFFFF);
        UpdatePathArrowWithCursor();
    }
}

static inline s8 GetBmMapPointAtCursor() {
    return gWorkingBmMap[gBmSt.cursor.y][gBmSt.cursor.x];
}

static inline u8 GetTerrainAtCursor() {
    return TERRAIN_AT(gBmSt.cursor.x, gBmSt.cursor.y);
}

#define LAST_X_POINT gpPathArrowProc->pathX[gpPathArrowProc->pathLen]
#define LAST_Y_POINT gpPathArrowProc->pathY[gpPathArrowProc->pathLen]

#define abs(n) (((n) >= 0) ? (n) : -(n))

void UpdatePathArrowWithCursor(void) {
    s8 point;
    s32 pointAlias;

    if (gpPathArrowProc->lastX == gBmSt.cursor.x &&
        gpPathArrowProc->lastY == gBmSt.cursor.y)
    {
        return;
    }
    SetLastCoords(gBmSt.cursor.x, gBmSt.cursor.y);
    SetWorkingBmMap(gBmMapMovement);
    if (GetBmMapPointAtCursor() == -1)
        return;
    pointAlias = point = GetPointAlongPath(
        gBmSt.cursor.x, gBmSt.cursor.y);
    if (pointAlias != -1) {
        ++point;
        CutOffPathLength(point);
        return;
    }
    if (gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] >=
        GetWorkingMoveCosts()[GetTerrainAtCursor()])
    {
        if (abs(LAST_X_POINT - gBmSt.cursor.x) +
            abs(LAST_Y_POINT - gBmSt.cursor.y) == 1)
        {
            AddPointToPathArrowProc(
                gBmSt.cursor.x, gBmSt.cursor.y);
            return;
        }
    }
    if (gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] == 0)
        CutOffPathLength(1);
    SetWorkingBmMap(gBmMapOther);
    GenerateMovementMapForActiveUnit();
    if (GetBmMapPointAtCursor() == -1) {
        ResetPathArrow();
        return;
    }
    BuildBestMoveScript(
        gBmSt.cursor.x,
        gBmSt.cursor.y,
        gWorkingMoveScr);
    GetPathFromMovementScript();
    if (!PathContainsNoCycle())
        ResetPathArrow();
}

u8 GetDirectionOfPathBeforeIndex(u8 i) {
    if (i == 0)
        return 0;
    if (gpPathArrowProc->pathX[i - 1] < gpPathArrowProc->pathX[i])
        return 3;
    if (gpPathArrowProc->pathX[i - 1] > gpPathArrowProc->pathX[i])
        return 1;
    if (gpPathArrowProc->pathY[i - 1] < gpPathArrowProc->pathY[i])
        return 4;
    if (gpPathArrowProc->pathY[i - 1] > gpPathArrowProc->pathY[i])
        return 2;
}

u8 GetDirectionOfPathAfterIndex(u8 i) {
    if (i == gpPathArrowProc->pathLen)
        return 0;
    if (gpPathArrowProc->pathX[i] < gpPathArrowProc->pathX[i + 1])
        return 1;
    if (gpPathArrowProc->pathX[i] > gpPathArrowProc->pathX[i + 1])
        return 3;
    if (gpPathArrowProc->pathY[i] < gpPathArrowProc->pathY[i + 1])
        return 2;
    if (gpPathArrowProc->pathY[i] > gpPathArrowProc->pathY[i + 1])
        return 4;
}

u8 PointInCameraBounds(s16 x, s16 y, u8 xBound, u8 yBound) {
    if (y - gBmSt.camera.y > -yBound &&
		y - gBmSt.camera.y <= 0x9f &&
		x - gBmSt.camera.x > -xBound &&
		x - gBmSt.camera.x <= 0xef)
	{
		return 1;
	}
    return 0;
}

#define PATH_ARROW_OAM_AT(a, b) gPathArrowOAMTable[a][b];

void DrawPathArrow(void) {
    s8 i;
    if (gpPathArrowProc->pathLen == 0)
        return;
    for (i = gpPathArrowProc->pathLen; i >= 0; i--) {
        s16 xp = 16 * gpPathArrowProc->pathX[i];
        s16 yp = 16 * gpPathArrowProc->pathY[i];
        if (PointInCameraBounds(xp, yp, 16, 16)) {
            u16 oam2 = PATH_ARROW_OAM_AT(
                GetDirectionOfPathAfterIndex(i),
                GetDirectionOfPathBeforeIndex(i));
            PutSprite(
                11,
                xp - gBmSt.camera.x,
                yp - gBmSt.camera.y,
                Sprite_16x16,
                oam2);
        }
    }
}

void DrawUpdatedPathArrow(void) {
    UpdatePathArrowWithCursor();
    DrawPathArrow();
}
