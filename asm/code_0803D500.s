	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D500
sub_0803D500: @ 0x0803D500
	ldr r1, _0803D50C @ =0x08B98AEC
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803D50C: .4byte 0x08B98AEC
