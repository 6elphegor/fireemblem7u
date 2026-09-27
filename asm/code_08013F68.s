	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingFadeToWhite
StartLockingFadeToWhite: @ 0x08013F68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F7C @ =0x08B9296C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F7C: .4byte 0x08B9296C
