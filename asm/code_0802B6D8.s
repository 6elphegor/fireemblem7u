	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTradeMenuTutStatus2
SetTradeMenuTutStatus2: @ 0x0802B6D8
	ldr r0, _0802B6E4 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B6E4: .4byte 0x0203A514
