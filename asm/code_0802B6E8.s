	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTradeMenuTutStatus3
SetTradeMenuTutStatus3: @ 0x0802B6E8
	ldr r0, _0802B6F4 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B6F4: .4byte 0x0203A514
