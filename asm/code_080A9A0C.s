	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A9A0C
sub_080A9A0C: @ 0x080A9A0C
	push {lr}
	ldr r0, _080A9A1C @ =0x08CE4AF8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9A1C: .4byte 0x08CE4AF8
