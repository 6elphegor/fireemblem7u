	.include "macro.inc"

	.syntax unified

	thumb_func_start CallSupportViewerEvent
CallSupportViewerEvent: @ 0x0800EDC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EDDC @ =0x08B91B10
	bl sub_0800AF5C
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EDDC: .4byte 0x08B91B10
