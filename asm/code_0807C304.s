	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C304
sub_0807C304: @ 0x0807C304
	push {lr}
	ldr r0, _0807C314 @ =0x08CA77AC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807C314: .4byte 0x08CA77AC
