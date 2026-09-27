	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A4C8
sub_0807A4C8: @ 0x0807A4C8
	push {lr}
	ldr r0, _0807A4D8 @ =0x08CA74F0
	movs r1, #4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807A4D8: .4byte 0x08CA74F0
