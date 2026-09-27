	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPreviousSupportScreenUnit
GetPreviousSupportScreenUnit: @ 0x0809B064
	cmp r0, #0
	bne _0809B06C
	ldr r0, _0809B070 @ =0x02012BF8
	ldr r0, [r0]
_0809B06C:
	subs r0, #1
	bx lr
	.align 2, 0
_0809B070: .4byte 0x02012BF8
