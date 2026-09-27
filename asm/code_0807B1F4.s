	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B1F4
sub_0807B1F4: @ 0x0807B1F4
	push {lr}
	ldr r0, _0807B208 @ =0x08CA75D4
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807B208: .4byte 0x08CA75D4
