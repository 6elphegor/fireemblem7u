	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014188
sub_08014188: @ 0x08014188
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801419C @ =sub_080143E0
	movs r0, #3
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801419C: .4byte sub_080143E0
