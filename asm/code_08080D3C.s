	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreenSprites_Init
StatScreenSprites_Init: @ 0x08080D3C
	movs r2, #0
	movs r1, #0x69
	strh r1, [r0, #0x2a]
	movs r1, #0xca
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0
