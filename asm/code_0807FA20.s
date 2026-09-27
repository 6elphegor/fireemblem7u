	.include "macro.inc"

	.syntax unified

	thumb_func_start SetStatScreenLastUnitId
SetStatScreenLastUnitId: @ 0x0807FA20
	ldr r1, _0807FA28 @ =0x0203E670
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0807FA28: .4byte 0x0203E670
