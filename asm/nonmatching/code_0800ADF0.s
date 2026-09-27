	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_FadeOutOfSkip
Event_FadeOutOfSkip: @ 0x0800ADF0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800AE00 @ =0x08B90D68
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0800AE00: .4byte 0x08B90D68
