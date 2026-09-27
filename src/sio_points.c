#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE8U: sio_points.c

extern const u8 gUnknown_080D9F28[][4];

extern const u8 gUnknown_080D9F38[][4];

extern const struct Vec2 gUnknown_080D9F48[];

extern const u8 gUnknown_080D9F98[];
extern const u8 gUnknown_085AD80C[];
extern const u16 gUnknown_085ADDA8[];
extern struct Text gUnk_Sio_02000C78[];
extern u16 CONST_DATA gObject_16x16[];



extern struct ProcCmd CONST_DATA ProcScr_085A9FA0[];

extern u16 CONST_DATA gUnknown_085A9FB0[];

CONST_DATA struct ProcCmd ProcScr_LinkArenaPointsBox[] = {
    PROC_CALL(LAPointsBox_LoadBoxes),
    PROC_CALL(LAPointsBox_Dummy),
    PROC_END,
};

CONST_DATA int gUnknown_085AA084[] = {
    0, -20, -16, 0, 0, 12, 16, 0,
};

CONST_DATA s16 gUnknown_085AA0A4[] = {
    0, 0, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 1, 1, 1, 1, 1,
    1, 1, 0,
};

CONST_DATA s16 gUnknown_085AA0CA[] = {
    0, -1, 3, 3, 2, 2, 1, 0,
    0, 0, 0, 0, -1, -2, -2, -3,
    -3, 1, 0,
};

CONST_DATA struct ProcCmd ProcScr_LinkArena_PointsNumberMover[] = {
    PROC_YIELD,
    PROC_CALL(PointsNumberMover_Init),
    PROC_REPEAT(PointsNumberMover_LoopNumberEmerge),
    PROC_REPEAT(PointsNumberMover_LoopMoveToPointsBox),
    PROC_CALL(PointsNumberMover_InitScoreChange),
    PROC_REPEAT(PointsNumberMover_TickScore),
    PROC_REPEAT(PointsNumberMover_AwaitEnd),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_LinkArena_PointsSpriteText[] = {
    PROC_YIELD,
    PROC_CALL(PointsSpriteText_Init),
    PROC_REPEAT(PointsSpriteText_LoopIn),
    PROC_REPEAT(PointsSpriteText_LoopOut),
    PROC_END,
};

//! FE8U = 0x08048884
void sub_080440E8(struct SioProc85A971C_Unk44 * buf)
{
    int i;
    int j;

    int r3 = gLinkArenaSt.unk_A0;

    if (gLinkArenaSt.unk_ec.unk_0_1 != 0) // TODO: Survival mode?
    {
        for (i = 0; i < r3; i++)
        {
            buf[i].playerId = gUnk_Sio_0203DD90.unk_0F[i];
            buf[i].points = gUnk_Sio_0203DD90.currentScore[gUnk_Sio_0203DD90.unk_0F[i]];
        }
    }
    else
    {
        for (i = 0; i < r3; i++)
        {
            buf[i].playerId = i;
            buf[i].points = gUnk_Sio_0203DD90.currentScore[i];
        }

        for (i = 0; i <= r3 - 2; i++)
        {
            for (j = r3 - 2; j >= i; j--)
            {
                if (buf[j].points < buf[j + 1].points)
                {
                    int tmpPlayerId;
                    int tmpPoints;

                    tmpPlayerId = buf[j].playerId;
                    buf[j].playerId = buf[j + 1].playerId;
                    buf[j + 1].playerId = tmpPlayerId;

                    tmpPoints = buf[j].points;
                    buf[j].points = buf[j + 1].points;
                    buf[j + 1].points = tmpPoints;
                }
            }
        }
    }

    return;
}

//! FE8U = 0x08048934
void DrawLinkArenaPointsBox(struct Text * th, int x, int y, int var, int number)
{
    int ix;
    int iy;

    u16 * tm = gBg1Tm + TM_OFFSET(x, y);

    for (iy = 0; iy < 4; iy++)
    {
        for (ix = 0; ix < 6; ix++)
        {
            *tm = var;

            tm++;
            var++;
        }

        tm += 0x1A;
    }

    ClearText(th);
    PutNumber(gBg0Tm + TM_OFFSET(x + 4, y + 1), TEXT_COLOR_SYSTEM_BLUE, number);

    return;
}

//! FE8U = 0x08048988
void LAPointsBox_LoadBoxes(struct LAPointsBoxProc * proc)
{
    int i;
    int oam2;

    Decompress(gUnknown_085AD80C, (void *)(0x06002800));
    ApplyPalettes(Pal_TacticianSelObj, 2, 4);

    SetTextFont(NULL);
    ResetTextFont();

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F28[gSioSt->selfId][i];

        if (sub_0803CD1C(playerId) != 0)
        {
            if (gUnk_Sio_0203DD90.unk_0A[playerId] == 0)
            {
                ApplyPalette(gUnknown_085ADDA8, playerId + 2);
            }

            oam2 = 0x140 + OAM2_PAL(playerId + 2);

            InitTextDb(&proc->text[i], 4);
            DrawLinkArenaPointsBox(
                &proc->text[i], gUnknown_080D9F98[i * 2 + 0], gUnknown_080D9F98[i * 2 + 1], oam2,
                gUnk_Sio_0203DD90.currentScore[playerId]);
        }
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x08048A68
void LAPointsBox_Dummy(void)
{
    return;
}


//! FE8U = 0x08048A6C
void StartLinkArenaPointsBox(void)
{
    SetBgOffset(BG_0, 0, 0);
    SetBgOffset(BG_1, 0, 0);

    Proc_Start(ProcScr_LinkArenaPointsBox, PROC_TREE_3);

    return;
}

//! FE8U = 0x08048A94
void EndLinkArenaPointsBox(void)
{
    Proc_EndEach(ProcScr_LinkArenaPointsBox);
    ClearUi();

    return;
}


//! FE8U = 0x08048AA8
void PointsNumberMover_Init(struct PointsNumberMoverProc * proc)
{
    struct Unit * unit = GetUnit(proc->unitId);

    int idx = gUnknown_080D9F38[gSioSt->selfId][proc->playerId];

    if (proc->unk_40 != 0)
    {
        if (unit->xPos == 8) // redundant?
        {
            proc->x = unit->xPos * 16 - 16;
        }
        else
        {
            proc->x = unit->xPos * 16 - 16;
        }

        proc->y = unit->yPos * 16;
    }
    else
    {
        proc->x = unit->xPos * 16 + gUnknown_085AA084[idx * 2 + 0] - 12;
        proc->y = unit->yPos * 16 + gUnknown_085AA084[idx * 2 + 1];
    }

    proc->xTarget = gUnknown_080D9F98[idx * 2 + 0] * 8 + 8;
    proc->yTarget = gUnknown_080D9F98[idx * 2 + 1] * 8 + 8;

    SetTextFont(&Font_Sio_02000C60);
    SioDrawNumber(&gUnk_Sio_02000C78[0], proc->playerId * 32 + 24, TEXT_COLOR_SYSTEM_BLUE, proc->difference);

    proc->timer = 0;

    return;
}



/**
 * Effect where the score numbers "emerge" from the unit
 */

//! FE8U = 0x08048B78
void PointsNumberMover_LoopNumberEmerge(struct PointsNumberMoverProc * proc)
{
    struct Unit * unit = GetUnit(proc->unitId);

    if (proc->timer <= 0x10)
    {
        int scale = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x100, proc->timer, 0x10);

                SetObjAffine(
            0,
            Div(+COS_Q12(0) * 16, 0x100),
            Div(-SIN_Q12(0) * 16, scale),
            Div(+SIN_Q12(0) * 16, 0x100),
            Div(+COS_Q12(0) * 16, scale)
        );
            }

    if (proc->unk_40 != 0 && proc->timer > 3 && proc->timer < 23)
    {
        int idx = proc->timer - 4;

        if (unit->xPos == 8)
        {
            proc->x = proc->x + gUnknown_085AA0A4[idx];
        }
        else
        {
            proc->x = proc->x - gUnknown_085AA0A4[idx];
        }

        proc->y = proc->y - gUnknown_085AA0CA[idx];
    }

    PutOamHi(proc->x, proc->y + 0x100, Sprite_32x16, 0x9340 + proc->playerId * 4);

    proc->timer++;

    if (proc->timer > 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048CB8
void PointsNumberMover_LoopMoveToPointsBox(struct PointsNumberMoverProc * proc)
{
    int x = Interpolate(INTERPOLATE_RCUBIC, proc->x, proc->xTarget, proc->timer, 0x30);
    int y = Interpolate(INTERPOLATE_RCUBIC, proc->y, proc->yTarget, proc->timer, 0x30);

    PutOamHi(x, y, Sprite_32x16, 0x9340 + proc->playerId * 4);

    proc->timer++;

    if (proc->timer > 0x20)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048D1C
void DrawLinkArenaScoreNumber(struct Text * th, int x, int y, int number)
{
    ClearText(th);
    SioDrawNumber(th, 24, TEXT_COLOR_SYSTEM_BLUE, number);
    PutText(th, gBg0Tm + TM_OFFSET(x + 1, y + 1));
    EnableBgSync(BG0_SYNC_BIT);
    return;
}

//! FE8U = 0x08048D64
void PointsNumberMover_InitScoreChange(struct PointsNumberMoverProc * proc)
{
    int idx = gUnknown_080D9F38[gSioSt->selfId][proc->playerId];

    proc->x = gUnknown_080D9F98[idx * 2 + 0];
    proc->y = gUnknown_080D9F98[idx * 2 + 1];

    SetTextFont(NULL);

    DrawLinkArenaScoreNumber(&proc->text, proc->x, proc->y, proc->newScore - proc->difference);

    proc->timer = 0;
    proc->unk_44 = proc->newScore - proc->difference;

    return;
}

//! FE8U = 0x08048DD0
void PointsNumberMover_TickScore(struct PointsNumberMoverProc * proc)
{
    int number = Interpolate(INTERPOLATE_LINEAR, proc->newScore - proc->difference, proc->newScore, proc->timer, 10);

    SetTextFont(NULL);

    DrawLinkArenaScoreNumber(&proc->text, proc->x, proc->y, number);

    if ((proc->unk_44 != number) && (proc->playerId == gSioSt->selfId))
    {
        PlaySoundEffect(0x80);
    }

    proc->unk_44 = number;

    proc->timer++;

    if (proc->timer > 10)
    {
        proc->timer = 0;
        gUnk_Sio_0203DD90.currentScore[proc->playerId] = proc->newScore;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048E6C
void PointsNumberMover_AwaitEnd(struct PointsNumberMoverProc * proc)
{
    proc->timer++;

    if (proc->timer > 20)
    {
        Proc_Break(proc);
    }

    return;
}


//! FE8U = 0x08048E84
void PointsSpriteText_Init(struct PointsSpriteTextProc * proc)
{
    SetTextFont(&Font_Sio_02000C60);

    Text_InsertDrawString(gUnk_Sio_02000C78, 128, 0, proc->str);
    proc->timer = 0;

    return;
}

//! FE8U = 0x08048EB8
void PointsSpriteText_LoopIn(struct PointsSpriteTextProc * proc)
{
    if (proc->timer <= 0x10)
    {
        int scale = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x100, proc->timer, 0x10);

                SetObjAffine(
            1,
            Div(+COS_Q12(0) * 16, 0x100), 
            Div(-SIN_Q12(0) * 16, scale),
            Div(+SIN_Q12(0) * 16, 0x100),
            Div(+COS_Q12(0) * 16, scale)
        );
            }

    PutOamHi(proc->x + 0x200, proc->y + 0x100, Sprite_32x16, 0x00009350);
    PutOamHi(proc->x + 0x220, proc->y + 0x100, Sprite_32x16, 0x00009354);
    PutOamHi(proc->x + 0x240, proc->y + 0x100, gObject_16x16, 0x00009358);

    proc->timer++;

    if (proc->timer > 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048FD4
void PointsSpriteText_LoopOut(struct PointsSpriteTextProc * proc)
{
    int scale;

    if (proc->timer <= 0x10)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 0x100, 0x10, proc->timer, 0x10);

                SetObjAffine(
            1,
            Div(+COS_Q12(0) * 16, 0x100), 
            Div(-SIN_Q12(0) * 16, scale),
            Div(+SIN_Q12(0) * 16, 0x100),
            Div(+COS_Q12(0) * 16, scale)
        );
            }

    PutOamHi(proc->x + 0x200, proc->y + 0x100, Sprite_32x16, 0x00009350);
    PutOamHi(proc->x + 0x220, proc->y + 0x100, Sprite_32x16, 0x00009354);
    PutOamHi(proc->x + 0x240, proc->y + 0x100, gObject_16x16, 0x00009358);

    proc->timer++;

    if (proc->timer > 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

/**
 * Draws the sprite text for "Points" in the centre of the screen
 * after combat in the Link Arena.
*/


//! FE8U = 0x080490EC
s8 sub_08044940(int x, int y, const char * str, u8 flag, ProcPtr parent)
{
    int i;
    struct Text text;

    int count = 0;

    ApplyPalette(Pal_Text, 0x19);

    InitSpriteTextFont(&Font_Sio_02000C60, (void *)(0x06016800), 3);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    ResetTextFont();

    InitSpriteText(gUnk_Sio_02000C78);
    SpriteText_DrawBackgroundExt(gUnk_Sio_02000C78, 0);

    SetTextFont(NULL);

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F38[gSioSt->selfId][i];

        if (sub_0803CD1C(playerId) != 0)
        {
            if (gUnk_Sio_0203DD90.unk_2c[playerId].newScore != 0)
            {
                struct PointsNumberMoverProc * proc = Proc_StartBlocking(ProcScr_LinkArena_PointsNumberMover, parent);
                proc->playerId = playerId;
                proc->unitId = gUnk_Sio_0203DD90.unk_2c[playerId].unitId;
                proc->newScore = gUnk_Sio_0203DD90.currentScore[playerId] + gUnk_Sio_0203DD90.unk_2c[playerId].newScore;

                if (proc->newScore > 9999)
                {
                    proc->newScore = 9999;
                }

                proc->difference = proc->newScore - gUnk_Sio_0203DD90.currentScore[playerId];
                proc->unk_40 = flag;

                InitTextDb(&proc->text, 4);

                count++;
            }
            else
            {
                InitTextDb(&text, 4);
            }
        }
    }

    if (count != 0)
    {
        if (flag != 0)
        {
            struct PointsSpriteTextProc * proc = Proc_StartBlocking(ProcScr_LinkArena_PointsSpriteText, parent);
            proc->x = x;
            proc->y = y;
            proc->str = str;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x08049238
void sub_08044A8C(ProcPtr proc)
{
    StartLinkArenaPointsBox();

    if (!sub_08044940(88, 60, DecodeMsg(0x12CB), 1, proc)) // TODO: msgid "Points"
    {
        EndLinkArenaPointsBox();
    }

    return;
}

//! FE8U = 0x0804926C
void sub_08044AC0(ProcPtr proc)
{
    StartLinkArenaPointsBox();
    sub_08044940(88, 60, DecodeMsg(0x12CB), 0, proc); // TODO: msgid "Points"
    return;
}
