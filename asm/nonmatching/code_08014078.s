	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014078
sub_08014078: @ 0x08014078
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801408C @ =sub_080143E0
	movs r0, #1
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801408C: .4byte sub_080143E0
