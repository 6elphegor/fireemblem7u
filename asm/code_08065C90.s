	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08065C90
sub_08065C90: @ 0x08065C90
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
