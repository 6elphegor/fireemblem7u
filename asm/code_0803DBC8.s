	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DBC8
sub_0803DBC8: @ 0x0803DBC8
	ldr r2, [r0, #0x30]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	bx lr
