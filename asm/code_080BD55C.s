	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD55C
sub_080BD55C: @ 0x080BD55C
	push {lr}
	ldr r0, _080BD56C @ =0x08CEF464
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BD56C: .4byte 0x08CEF464
