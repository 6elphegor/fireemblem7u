	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B774
sub_0807B774: @ 0x0807B774
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807B784 @ =0x08CA763C
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807B784: .4byte 0x08CA763C
