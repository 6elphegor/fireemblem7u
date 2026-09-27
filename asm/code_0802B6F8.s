	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTradeMenuTutStatus4
SetTradeMenuTutStatus4: @ 0x0802B6F8
	ldr r0, _0802B704 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B704: .4byte 0x0203A514
