	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B278
sub_0807B278: @ 0x0807B278
	push {lr}
	ldr r0, _0807B288 @ =0x08CA762C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807B288: .4byte 0x08CA762C
