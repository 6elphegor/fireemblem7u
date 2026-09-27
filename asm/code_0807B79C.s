	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B79C
sub_0807B79C: @ 0x0807B79C
	push {lr}
	ldr r0, _0807B7B0 @ =0x08CA763C
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807B7B0: .4byte 0x08CA763C
