	.include "macro.inc"

	.syntax unified

	thumb_func_start CallMapSupportEvent
CallMapSupportEvent: @ 0x0800ED90
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0800EDA8 @ =0x08B91AE8
	bl StartEvent
	str r4, [r0, #0x48]
	str r5, [r0, #0x58]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800EDA8: .4byte 0x08B91AE8
