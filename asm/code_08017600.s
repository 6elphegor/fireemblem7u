	.include "macro.inc"

	.syntax unified

	thumb_func_start SetUnitStatusExt
SetUnitStatusExt: @ 0x08017600
	adds r0, #0x30
	movs r3, #0xf
	lsls r2, r2, #4
	ands r1, r3
	orrs r2, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
