	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014128
sub_08014128: @ 0x08014128
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801413C @ =sub_080143E0
	movs r0, #3
	movs r1, #4
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801413C: .4byte sub_080143E0
