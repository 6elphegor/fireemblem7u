	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTradeMenuTutStatus7
SetTradeMenuTutStatus7: @ 0x0802B718
	ldr r0, _0802B724 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #7
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B724: .4byte 0x0203A514
