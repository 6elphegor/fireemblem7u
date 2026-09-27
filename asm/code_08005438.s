	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetTextFont
ResetTextFont: @ 0x08005438
	ldr r0, _08005448 @ =0x02028D70
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, _0800544C @ =0x02028D78
	movs r0, #0xff
	strb r0, [r1]
	bx lr
	.align 2, 0
_08005448: .4byte 0x02028D70
_0800544C: .4byte 0x02028D78
