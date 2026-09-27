	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoom_DrawSprites_Init
SoundRoom_DrawSprites_Init: @ 0x080AC664
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
