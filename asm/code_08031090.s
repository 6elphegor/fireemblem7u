	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031090
sub_08031090: @ 0x08031090
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	adds r0, r4, #0
	bl EndAllProcChildren
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
