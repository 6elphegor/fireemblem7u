	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTrap
GetTrap: @ 0x0802C318
	lsls r0, r0, #3
	ldr r1, _0802C320 @ =0x0203A518
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802C320: .4byte 0x0203A518
