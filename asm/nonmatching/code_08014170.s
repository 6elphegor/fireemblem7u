	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014170
sub_08014170: @ 0x08014170
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014184 @ =sub_080143E0
	movs r0, #3
	movs r1, #0x20
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014184: .4byte sub_080143E0
