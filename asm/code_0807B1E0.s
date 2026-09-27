	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B1E0
sub_0807B1E0: @ 0x0807B1E0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807B1F0 @ =0x08CA75D4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807B1F0: .4byte 0x08CA75D4
