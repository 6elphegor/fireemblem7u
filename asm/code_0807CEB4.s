	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CEB4
sub_0807CEB4: @ 0x0807CEB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807CEC4 @ =0x08CA79C4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807CEC4: .4byte 0x08CA79C4
