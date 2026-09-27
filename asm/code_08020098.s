	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_SetTimer
ChapterIntro_SetTimer: @ 0x08020098
	adds r1, #0x4c
	strh r0, [r1]
	bx lr
	.align 2, 0
