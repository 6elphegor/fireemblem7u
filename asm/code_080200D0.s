	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_SetFasten
ChapterIntro_SetFasten: @ 0x080200D0
	adds r0, #0x52
	movs r1, #2
	strh r1, [r0]
	bx lr
