	.include "macro.inc"

	.syntax unified

	thumb_func_start SetStatScreenExcludedUnitFlags
SetStatScreenExcludedUnitFlags: @ 0x0807FA2C
	ldr r1, _0807FA34 @ =0x0203E670
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0807FA34: .4byte 0x0203E670
