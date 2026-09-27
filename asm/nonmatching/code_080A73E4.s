	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A73E4
sub_080A73E4: @ 0x080A73E4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A73F4 @ =0x08CE47DC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A73F4: .4byte 0x08CE47DC
