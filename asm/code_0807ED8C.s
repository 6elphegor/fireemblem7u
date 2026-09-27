	.include "macro.inc"

	.syntax unified

	thumb_func_start IsSelectButtonHeld
IsSelectButtonHeld: @ 0x0807ED8C
	ldr r0, _0807ED9C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #4
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807ED9C: .4byte 0x08B857F8
