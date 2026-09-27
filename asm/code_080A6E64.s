	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6E64
sub_080A6E64: @ 0x080A6E64
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6E74 @ =0x08CE477C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A6E74: .4byte 0x08CE477C
