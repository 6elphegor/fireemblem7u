	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B788
sub_0807B788: @ 0x0807B788
	push {lr}
	ldr r0, _0807B798 @ =0x08CA763C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807B798: .4byte 0x08CA763C
