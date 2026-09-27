	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTacticianName
GetTacticianName: @ 0x0802E6E4
	ldr r0, _0802E6E8 @ =0x0202BC18
	bx lr
	.align 2, 0
_0802E6E8: .4byte 0x0202BC18
