	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080830C0
sub_080830C0: @ 0x080830C0
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	bx lr
	.align 2, 0
