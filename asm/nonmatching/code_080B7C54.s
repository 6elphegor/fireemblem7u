	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7C54
sub_080B7C54: @ 0x080B7C54
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	bx lr
