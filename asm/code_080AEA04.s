	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AEA04
sub_080AEA04: @ 0x080AEA04
	adds r0, #0x37
	movs r1, #1
	strb r1, [r0]
	bx lr
