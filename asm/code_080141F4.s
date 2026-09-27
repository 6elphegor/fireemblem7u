	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeInBlackSpeed20
FadeInBlackSpeed20: @ 0x080141F4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x20
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
