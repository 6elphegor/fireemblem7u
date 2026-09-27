	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB814
sub_080BB814: @ 0x080BB814
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	bx lr
