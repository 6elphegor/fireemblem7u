	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801426C
sub_0801426C: @ 0x0801426C
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
