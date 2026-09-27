	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLastStatScreenUnitId
GetLastStatScreenUnitId: @ 0x0807FA14
	ldr r0, _0807FA1C @ =0x0203E670
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_0807FA1C: .4byte 0x0203E670
