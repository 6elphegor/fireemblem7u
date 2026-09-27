	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTarget
GetTarget: @ 0x0804B180
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0804B190 @ =0x0203DCF8
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0804B190: .4byte 0x0203DCF8
