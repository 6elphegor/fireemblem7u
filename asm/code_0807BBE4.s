	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807BBE4
sub_0807BBE4: @ 0x0807BBE4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807BBF4 @ =0x08CA76DC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF4: .4byte 0x08CA76DC
