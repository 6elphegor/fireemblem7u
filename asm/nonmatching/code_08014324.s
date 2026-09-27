	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeCore_Init
FadeCore_Init: @ 0x08014324
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	str r1, [r0, #0x4c]
	bx lr
	.align 2, 0
