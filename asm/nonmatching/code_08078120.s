	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078120
sub_08078120: @ 0x08078120
	push {lr}
	ldr r0, [r0, #8]
	bl SetFlag
	pop {r0}
	bx r0
