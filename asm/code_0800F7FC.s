	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F7FC
sub_0800F7FC: @ 0x0800F7FC
	movs r1, #0
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0
