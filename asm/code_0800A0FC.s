	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800A0FC
sub_0800A0FC: @ 0x0800A0FC
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
