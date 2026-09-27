	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACAA4
sub_080ACAA4: @ 0x080ACAA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ACAB8 @ =0x08CE574C
	bl Proc_Find
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACAB8: .4byte 0x08CE574C
