	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginVOpenText
ChapterIntro_BeginVOpenText: @ 0x0801F9CC
	adds r0, #0x4c
	movs r1, #1
	strh r1, [r0]
	bx lr
