	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_Bg3Scroll_Loop
ChapterIntro_Bg3Scroll_Loop: @ 0x0801F2C4
	push {lr}
	bl GetGameTime
	adds r2, r0, #0
	lsrs r2, r2, #1
	movs r0, #0xff
	ands r2, r0
	movs r0, #3
	adds r1, r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0
