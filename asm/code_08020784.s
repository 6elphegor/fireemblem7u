	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020784
sub_08020784: @ 0x08020784
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr
