	.include "macro.inc"

	.syntax unified

	thumb_func_start BackgroundSlide_Init
BackgroundSlide_Init: @ 0x0807F890
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr
