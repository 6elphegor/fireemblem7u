	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014060
sub_08014060: @ 0x08014060
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014074 @ =sub_080143E0
	movs r0, #1
	movs r1, #4
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014074: .4byte sub_080143E0
