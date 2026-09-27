	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014140
sub_08014140: @ 0x08014140
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014154 @ =sub_080143E0
	movs r0, #3
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014154: .4byte sub_080143E0
