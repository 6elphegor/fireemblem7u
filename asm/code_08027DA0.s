	.include "macro.inc"

	.syntax unified

	thumb_func_start BarrierMapSelect_Init
BarrierMapSelect_Init: @ 0x08027DA0
	push {lr}
	bl sub_08031EF0
	pop {r1}
	bx r1
	.align 2, 0
