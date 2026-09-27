	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AA8F8
sub_080AA8F8: @ 0x080AA8F8
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
