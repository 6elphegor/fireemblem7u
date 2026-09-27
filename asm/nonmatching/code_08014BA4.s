	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPartialGameLock
StartPartialGameLock: @ 0x08014BA4
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08014BC4 @ =0x08B92AE8
	bl Proc_StartBlocking
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014BC4: .4byte 0x08B92AE8
