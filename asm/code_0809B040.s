	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportScreenUnitCount
GetSupportScreenUnitCount: @ 0x0809B040
	ldr r0, _0809B048 @ =0x02012BF8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0809B048: .4byte 0x02012BF8
