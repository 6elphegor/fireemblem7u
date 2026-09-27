	.include "macro.inc"

	.syntax unified

	thumb_func_start SysBrownBox_Init
SysBrownBox_Init: @ 0x080A9A20
	movs r2, #0
	adds r0, #0x2c
	movs r1, #3
_080A9A26:
	strb r2, [r0]
	strb r2, [r0, #6]
	adds r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080A9A26
	bx lr
