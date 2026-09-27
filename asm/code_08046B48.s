	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046B48
sub_08046B48: @ 0x08046B48
	push {lr}
	ldr r0, _08046B58 @ =0x08B99CB8
	movs r1, #4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08046B58: .4byte 0x08B99CB8
