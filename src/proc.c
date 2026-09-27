#include "global.h"
#include "proc.h"

void Proc_Break(struct Proc *proc)
{
    proc->proc_idleCb = NULL;
}
