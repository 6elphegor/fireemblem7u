	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809BF78
sub_0809BF78: @ 0x0809BF78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809BF90 @ =0x08CC57F4
	bl Proc_Find
	cmp r0, #0
	beq _0809BF88
	str r4, [r0, #0x3c]
_0809BF88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809BF90: .4byte 0x08CC57F4
