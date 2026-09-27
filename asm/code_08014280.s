	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014280
sub_08014280: @ 0x08014280
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014294 @ =sub_08014450
	movs r0, #7
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014294: .4byte sub_08014450
