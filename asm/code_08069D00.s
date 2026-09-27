	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069D00
sub_08069D00: @ 0x08069D00
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
