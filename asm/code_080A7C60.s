	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7C60
sub_080A7C60: @ 0x080A7C60
	cmp r0, #0
	beq _080A7C68
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
_080A7C68:
	bx lr
	.align 2, 0
