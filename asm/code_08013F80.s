	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingFadeFromWhite
StartLockingFadeFromWhite: @ 0x08013F80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F94 @ =0x08B9298C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F94: .4byte 0x08B9298C
