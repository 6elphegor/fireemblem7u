	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeInBlackSpeed08
FadeInBlackSpeed08: @ 0x080141B4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
