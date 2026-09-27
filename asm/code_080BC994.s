	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC994
sub_080BC994: @ 0x080BC994
	push {lr}
	ldr r0, _080BC9A4 @ =0x08CEF284
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BC9A4: .4byte 0x08CEF284
