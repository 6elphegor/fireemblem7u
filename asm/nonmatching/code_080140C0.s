	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080140C0
sub_080140C0: @ 0x080140C0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080140D4 @ =sub_080143E0
	movs r0, #1
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080140D4: .4byte sub_080143E0
