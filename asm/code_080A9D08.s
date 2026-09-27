	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A9D08
sub_080A9D08: @ 0x080A9D08
	push {lr}
	ldr r0, _080A9D18 @ =0x08CE4C38
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9D18: .4byte 0x08CE4C38
