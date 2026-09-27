	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_DarkenThenFunc
Event_DarkenThenFunc: @ 0x0800B1F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0800B208 @ =0x08B90E28
	bl Proc_StartBlocking
	str r5, [r0, #0x50]
	str r4, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B208: .4byte 0x08B90E28
