	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_SetSkipTarget
ChapterIntro_SetSkipTarget: @ 0x08020090
	adds r1, #0x50
	strh r0, [r1]
	bx lr
	.align 2, 0
