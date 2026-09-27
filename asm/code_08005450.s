	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTextFont
SetTextFont: @ 0x08005450
	adds r1, r0, #0
	cmp r1, #0
	bne _08005468
	ldr r1, _08005460 @ =0x02028D70
	ldr r0, _08005464 @ =0x02028D58
	str r0, [r1]
	b _0800546C
	.align 2, 0
_08005460: .4byte 0x02028D70
_08005464: .4byte 0x02028D58
_08005468:
	ldr r0, _08005470 @ =0x02028D70
	str r1, [r0]
_0800546C:
	bx lr
	.align 2, 0
_08005470: .4byte 0x02028D70
