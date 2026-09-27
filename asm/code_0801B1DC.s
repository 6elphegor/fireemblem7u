	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWorkingMoveCosts
GetWorkingMoveCosts: @ 0x0801B1DC
	ldr r0, _0801B1E0 @ =0x030043F0
	bx lr
	.align 2, 0
_0801B1E0: .4byte 0x030043F0
