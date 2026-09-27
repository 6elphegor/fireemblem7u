	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D790
sub_0809D790: @ 0x0809D790
	ldr r2, [r0, #8]
	strb r2, [r1]
	ldr r0, [r0, #4]
	strb r0, [r1, #1]
	asrs r0, r0, #0x10
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
