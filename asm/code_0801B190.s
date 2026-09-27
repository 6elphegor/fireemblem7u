	.include "macro.inc"

	.syntax unified

	thumb_func_start SetWorkingBmMap
SetWorkingBmMap: @ 0x0801B190
	ldr r1, _0801B198 @ =0x030041E0
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B198: .4byte 0x030041E0
