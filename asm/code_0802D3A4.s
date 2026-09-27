	.include "macro.inc"

	.syntax unified

	thumb_func_start BMapVSync_End
BMapVSync_End: @ 0x0802D3A4
	push {lr}
	ldr r0, _0802D3B0 @ =0x08B96158
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0802D3B0: .4byte 0x08B96158
