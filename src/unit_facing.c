#include "gbafe.h"

int GetFacingFromTo(int x1, int y1, int x2, int y2);
void SetAutoMuMoveScript(u8 const * script);

void ChangeActiveUnitFacing(int xLook, int yLook)
{
    int direction = GetFacingFromTo(gActiveUnit->xPos, gActiveUnit->yPos, xLook, yLook)
        + MOVE_CMD_FACE_BASE;
    gWorkingMoveScr[0] = direction;
    gWorkingMoveScr[1] = MOVE_CMD_HALT;
    SetAutoMuMoveScript(gWorkingMoveScr);
}
