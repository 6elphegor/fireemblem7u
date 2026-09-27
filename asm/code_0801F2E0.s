	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntroDeamon_Init
ChapterIntroDeamon_Init: @ 0x0801F2E0
	ldr r1, [r0, #0x14]
	adds r1, #0x50
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	bx lr
	.align 2, 0
