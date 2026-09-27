#ifndef GUARD_PROC_H
#define GUARD_PROC_H

#include "global.h"

struct ProcCmd;

struct Proc
{
    /* 00 */ const struct ProcCmd *proc_script;
    /* 04 */ const struct ProcCmd *proc_scrCur;
    /* 08 */ void (*proc_endCb)(struct Proc *);
    /* 0C */ void (*proc_idleCb)(struct Proc *);
};

void Proc_Break(struct Proc *proc);

#endif // GUARD_PROC_H
