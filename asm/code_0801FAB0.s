	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_Begin_0801FF18
ChapterIntro_Begin_0801FF18: @ 0x0801FAB0
	push {lr}
	adds r0, #0x4c
	movs r1, #0xd
	strh r1, [r0]
	bl ColorFadeInit
	ldr r0, _0801FAD0 @ =0x020228E0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #4
	movs r2, #2
	bl MaybeSmoothChangeSomePal
	pop {r0}
	bx r0
	.align 2, 0
_0801FAD0: .4byte 0x020228E0
