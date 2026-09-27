	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014158
sub_08014158: @ 0x08014158
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801416C @ =sub_080143E0
	movs r0, #3
	movs r1, #0x10
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801416C: .4byte sub_080143E0
