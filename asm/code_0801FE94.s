	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginFastCloseText
ChapterIntro_BeginFastCloseText: @ 0x0801FE94
	adds r0, #0x4c
	movs r1, #8
	strh r1, [r0]
	bx lr
