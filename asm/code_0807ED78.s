	.include "macro.inc"

	.syntax unified

	thumb_func_start IsStartButtonHeld
IsStartButtonHeld: @ 0x0807ED78
	ldr r0, _0807ED88 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807ED88: .4byte 0x08B857F8
