	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080140A8
sub_080140A8: @ 0x080140A8
	push {lr}
	adds r2, r0, #0
	ldr r3, _080140BC @ =sub_080143E0
	movs r0, #1
	movs r1, #0x20
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080140BC: .4byte sub_080143E0
