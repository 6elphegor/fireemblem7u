	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeInBlackSpeed08Unk
FadeInBlackSpeed08Unk: @ 0x080141C8
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	bl sub_080143A0
	pop {r0}
	bx r0
	.align 2, 0
