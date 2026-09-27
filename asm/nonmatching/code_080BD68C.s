	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD68C
sub_080BD68C: @ 0x080BD68C
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	bx lr
