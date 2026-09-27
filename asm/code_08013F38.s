	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingFadeToBlack
StartLockingFadeToBlack: @ 0x08013F38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F4C @ =0x08B9292C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F4C: .4byte 0x08B9292C
