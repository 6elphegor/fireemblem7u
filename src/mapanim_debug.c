#include "gbafe.h"

extern struct KeySt * CONST_DATA gpKeySt;
extern struct ProcCmd CONST_DATA ProcScr_DebugMonitor[];

extern char const * CONST_DATA gManimDebugHitStrings[];
extern struct ManimDebugFieldInfo CONST_DATA gManimDebugFieldInfo[];
extern char const * CONST_DATA gManimDebugLabelStrings[];
extern struct ManimDebugInfo * CONST_DATA gpManimDebugInfo;
extern struct ProcCmd CONST_DATA ProcScr_ManimDebug[];

void StartManimDebug(void)
{
    Proc_Start(ProcScr_ManimDebug, PROC_TREE_3);
}

void ManimDebug_PutField(int num, int index, int color)
{
    struct CharacterData const * pinfo = GetCharacterData(gpManimDebugInfo->infos[num].data[0]);
    struct ClassData const * jinfo = GetClassData(gpManimDebugInfo->infos[num].data[3]);

    int pid = gpManimDebugInfo->infos[num].data[0];
    int jid = gpManimDebugInfo->infos[num].data[3];
    int item = gpManimDebugInfo->infos[num].data[4];

    switch (index)
    {
    case 0:
        ClearText(&gpManimDebugInfo->infos[num].text[0]);

        Text_InsertDrawNumberOrBlank(&gpManimDebugInfo->infos[num].text[0], 16, color, pid);

        PutDrawText(
            &gpManimDebugInfo->infos[num].text[0],
            gBg0Tm + TM_OFFSET(num * 12 + 6, 0),
            color, 24, 0, DecodeMsg(pinfo->nameTextId));

        EnableBgSync(BG0_SYNC_BIT);

        break;

    case 1:
        ClearText(&gpManimDebugInfo->infos[num].text[1]);

        Text_InsertDrawNumberOrBlank(&gpManimDebugInfo->infos[num].text[1], 8, color, gpManimDebugInfo->infos[num].data[1]);

        PutText(&gpManimDebugInfo->infos[num].text[1], gBg0Tm + TM_OFFSET(num * 12 + 7, 2));

        EnableBgSync(BG0_SYNC_BIT);

        break;

    case 2:
        ClearText(&gpManimDebugInfo->infos[num].text[2]);

        Text_InsertDrawNumberOrBlank(&gpManimDebugInfo->infos[num].text[2], 8, color, gpManimDebugInfo->infos[num].data[2]);

        PutText(&gpManimDebugInfo->infos[num].text[2], gBg0Tm + TM_OFFSET(num * 12 + 10, 2));

        EnableBgSync(BG0_SYNC_BIT);

        break;

    case 3:
        ClearText(&gpManimDebugInfo->infos[num].text[3]);

        Text_InsertDrawNumberOrBlank(&gpManimDebugInfo->infos[num].text[3], 16, color, jid);

        PutDrawText(
            &gpManimDebugInfo->infos[num].text[3],
            gBg0Tm + TM_OFFSET(num * 12 + 6, 4),
            color, 24, 0, DecodeMsg(jinfo->nameTextId));

        EnableBgSync(BG0_SYNC_BIT);

        break;

    case 4:
        ClearText(&gpManimDebugInfo->infos[num].text[4]);

        Text_InsertDrawNumberOrBlank(&gpManimDebugInfo->infos[num].text[4], 16, color, item);

        PutDrawText(
            &gpManimDebugInfo->infos[num].text[4],
            gBg0Tm + TM_OFFSET(num * 12 + 6, 6),
            color, 24, 0, GetItemName(gpManimDebugInfo->infos[num].data[4]));

        EnableBgSync(BG0_SYNC_BIT);

        break;

    case 5 ... 9:
        ClearText(&gpManimDebugInfo->infos[num].text[index]);

        Text_InsertDrawNumberOrBlank(
            &gpManimDebugInfo->infos[num].text[index], 8, color, gpManimDebugInfo->infos[num].data[index]);

        PutDrawText(
            &gpManimDebugInfo->infos[num].text[index],
            gBg0Tm + ((((index - 5) * 2 + 8) << 5) + (num * 12 + 7)),
            color, 16, 0,
            gManimDebugHitStrings[gpManimDebugInfo->infos[num].data[index]]);

        EnableBgSync(BG0_SYNC_BIT);

        break;
    }
}

void ManimDebug_Init(struct ManimDebugProc * proc)
{
    Proc_EndEach(ProcScr_DebugMonitor);

    proc->actor = 0;
    proc->field = 0;

    gpManimDebugInfo->infos[0].data[3] = 1;
    gpManimDebugInfo->infos[0].data[0] = 1;
    gpManimDebugInfo->infos[0].data[4] = 1;
    gpManimDebugInfo->infos[0].data[1] = 4;
    gpManimDebugInfo->infos[0].data[2] = 8;

    gpManimDebugInfo->infos[1].data[3] = 1;
    gpManimDebugInfo->infos[1].data[0] = 2;
    gpManimDebugInfo->infos[1].data[4] = 2;
    gpManimDebugInfo->infos[1].data[1] = 5;
    gpManimDebugInfo->infos[1].data[2] = 8;

    gpManimDebugInfo->infos[0].data[5] = 1;
    gpManimDebugInfo->infos[0].data[6] = 5;
    gpManimDebugInfo->infos[0].data[7] = 0;
    gpManimDebugInfo->infos[0].data[8] = 0;
    gpManimDebugInfo->infos[0].data[9] = 0;

    gpManimDebugInfo->infos[1].data[5] = 1;
    gpManimDebugInfo->infos[1].data[6] = 0;
    gpManimDebugInfo->infos[1].data[7] = 0;
    gpManimDebugInfo->infos[1].data[8] = 0;
    gpManimDebugInfo->infos[1].data[9] = 0;
}

void ManimDebug_InitScreen(struct ManimDebugProc * proc)
{
    int i, j;

    EndAllMus();
    ResetText();

    SetBlendConfig(2, 8, 8, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetWinEnable(0, 0, 0);

    DrawUiFrame2(0, 0, 29, 19, 1);

    for (i = 0; gManimDebugLabelStrings[i]; ++i)
        PutString(gBg0Tm + (((i * 2) << 5) + 1), 0, gManimDebugLabelStrings[i]);

    for (i = 0; i < 10; ++i)
    {
        for (j = 0; j < 2; ++j)
        {
            InitTextDb(&gpManimDebugInfo->infos[j].text[i], gManimDebugFieldInfo[i].width);

            if (j == proc->actor && i == proc->field)
                ManimDebug_PutField(j, i, TEXT_COLOR_SYSTEM_WHITE);
            else
                ManimDebug_PutField(j, i, TEXT_COLOR_SYSTEM_GRAY);
        }
    }

    EnableBgSync(BG0_SYNC_BIT);
}

void ManimDebug_Loop(struct ManimDebugProc * proc)
{
    int old_actor = proc->actor;
    int old_field = proc->field;
    int inc;

    if (gpKeySt->pressed & START_BUTTON)
    {
        if (!ManimDebug_SetupBattle())
            return;

        Proc_Break(proc);
    }

    if (gpKeySt->held & R_BUTTON)
        inc = 10;
    else
        inc = 1;

    if (gpKeySt->repeated & A_BUTTON)
    {
        gpManimDebugInfo->infos[proc->actor].data[proc->field] += inc;

        if (gpManimDebugInfo->infos[proc->actor].data[proc->field] >= gManimDebugFieldInfo[proc->field].max)
        {
            if (inc == 1)
                gpManimDebugInfo->infos[proc->actor].data[proc->field] = gManimDebugFieldInfo[proc->field].min;
            else
                gpManimDebugInfo->infos[proc->actor].data[proc->field] = gManimDebugFieldInfo[proc->field].max - 1;
        }
    }

    if (gpKeySt->repeated & B_BUTTON)
    {
        gpManimDebugInfo->infos[proc->actor].data[proc->field] -= inc;

        if (gpManimDebugInfo->infos[proc->actor].data[proc->field] < gManimDebugFieldInfo[proc->field].min)
        {
            if (inc == 1)
                gpManimDebugInfo->infos[proc->actor].data[proc->field] = gManimDebugFieldInfo[proc->field].max - 1;
            else
                gpManimDebugInfo->infos[proc->actor].data[proc->field] = gManimDebugFieldInfo[proc->field].min;
        }
    }

    if (gpKeySt->repeated & DPAD_LEFT)
    {
        if (proc->field != 2)
            proc->actor = 1 - proc->actor;

        proc->field = gManimDebugFieldInfo[proc->field].left;
    }

    if (gpKeySt->repeated & DPAD_RIGHT)
    {
        if (proc->field != 1)
            proc->actor = 1 - proc->actor;

        proc->field = gManimDebugFieldInfo[proc->field].right;
    }

    if (gpKeySt->repeated & DPAD_UP)
        proc->field = gManimDebugFieldInfo[proc->field].up;

    if (gpKeySt->repeated & DPAD_DOWN)
        proc->field = gManimDebugFieldInfo[proc->field].down;

    if (gpKeySt->repeated & DPAD_ANY)
        ManimDebug_PutField(old_actor, old_field, TEXT_COLOR_SYSTEM_GRAY);

    if (gpKeySt->repeated & (DPAD_ANY | A_BUTTON | B_BUTTON))
        ManimDebug_PutField(proc->actor, proc->field, TEXT_COLOR_SYSTEM_WHITE);
}

void ManimDebug_SetupBattleUnit(struct BattleUnit * bu, int actor)
{
    bu->hpInitial = 30;
    bu->unit.maxHP = 60;

    bu->unit.pCharacterData = GetCharacterData(gpManimDebugInfo->infos[actor].data[0]);
    bu->unit.pClassData = GetClassData(gpManimDebugInfo->infos[actor].data[3]);

    bu->unit.xPos = gpManimDebugInfo->infos[actor].data[1];
    bu->unit.yPos = gpManimDebugInfo->infos[actor].data[2];

    bu->weaponBefore = gpManimDebugInfo->infos[actor].data[4];
    bu->expGain = 0;
}

bool ManimDebug_SetupBattle(void)
{
    int hitnum, actnum, i;
    struct BattleHit * hit = gBattleHitArray;
    int value;

    ManimDebug_SetupBattleUnit(&gBattleActor, 0);
    ManimDebug_SetupBattleUnit(&gBattleTarget, 1);
    ClearBattleHits();

    value = 0;

    for (hitnum = 0; hitnum < 5; ++hitnum)
    {
        for (actnum = 0; actnum < 2; ++actnum)
        {
            if (gpManimDebugInfo->infos[actnum].data[5 + hitnum] != 0)
            {
                value = 1;
                break;
            }
        }

        if (value)
            break;
    }

    if (hitnum == 5 && actnum == 2)
        return FALSE;

    for (i = hitnum * 2 + actnum; i < 10; ++i)
    {
        hitnum = i / 2;
        actnum = i & 1;

        hit->info = actnum << 3;
        value = gpManimDebugInfo->infos[actnum].data[5 + hitnum];

        switch (value)
        {
        case 5 ... 8:
            hit->attributes |= BATTLE_HIT_ATTR_CRIT;
            hit->hpChange = 20;
            break;

        case 1 ... 4:
            hit->hpChange = 10;
            break;

        case 9:
            hit->attributes |= BATTLE_HIT_ATTR_MISS;
            break;
        }

        switch (value)
        {
        case 2:
        case 6:
            hit->attributes |= BATTLE_HIT_ATTR_DEVIL;
            break;
            break;

        case 3:
        case 7:
            hit->attributes |= BATTLE_HIT_ATTR_HPSTEAL;
            break;
            break;

        case 4:
        case 8:
            hit->attributes |= BATTLE_HIT_ATTR_POISON;
            break;
            break;
        }

        switch (value)
        {
        case 0:
            break;

        default:
            hit++;
        }
    }

    hit->info |= BATTLE_HIT_INFO_END;
    return TRUE;
}

void ManimDebug_StartBattleAnim(ProcPtr proc)
{
    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    StartBattleManim();
}
