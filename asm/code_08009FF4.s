	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkUnkStr
SetTalkUnkStr: @ 0x08009FF4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800A008 @ =0x08B909B8
	ldr r0, [r0]
	adds r0, #0x60
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_0800A008: .4byte 0x08B909B8
