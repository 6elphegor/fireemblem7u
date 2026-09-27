	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014090
sub_08014090: @ 0x08014090
	push {lr}
	adds r2, r0, #0
	ldr r3, _080140A4 @ =sub_080143E0
	movs r0, #1
	movs r1, #0x10
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080140A4: .4byte sub_080143E0
