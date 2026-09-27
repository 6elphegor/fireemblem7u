	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAC04
sub_080AAC04: @ 0x080AAC04
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
