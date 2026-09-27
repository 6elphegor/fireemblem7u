	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintFxBg2_Init
QuintFxBg2_Init: @ 0x0807C020
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0
