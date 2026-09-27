	.include "macro.inc"

	.syntax unified

	thumb_func_start GetNextSupportScreenUnit
GetNextSupportScreenUnit: @ 0x0809B04C
	adds r1, r0, #0
	ldr r0, _0809B05C @ =0x02012BF8
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809B060
	adds r0, r1, #1
	b _0809B062
	.align 2, 0
_0809B05C: .4byte 0x02012BF8
_0809B060:
	movs r0, #0
_0809B062:
	bx lr
