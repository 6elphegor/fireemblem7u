	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B02A8
sub_080B02A8: @ 0x080B02A8
	adds r0, #0x35
	strb r1, [r0]
	bx lr
	.align 2, 0
