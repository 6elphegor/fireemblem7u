	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_FadeOutOfBackgroundTalk
Event_FadeOutOfBackgroundTalk: @ 0x0800ADDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800ADEC @ =0x08B90D08
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0800ADEC: .4byte 0x08B90D08
