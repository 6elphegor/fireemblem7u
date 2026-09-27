	.include "macro.inc"

	.syntax unified

	thumb_func_start GetConvoyItemArray
GetConvoyItemArray: @ 0x0802E700
	ldr r0, _0802E704 @ =0x0203A720
	bx lr
	.align 2, 0
_0802E704: .4byte 0x0203A720
