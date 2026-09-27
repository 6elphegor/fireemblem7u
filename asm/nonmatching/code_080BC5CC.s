	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC5CC
sub_080BC5CC: @ 0x080BC5CC
	push {lr}
	ldr r0, _080BC5DC @ =0x08CEF264
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BC5DC: .4byte 0x08CEF264
