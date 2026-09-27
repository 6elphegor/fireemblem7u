	.include "macro.inc"

	.syntax unified

	thumb_func_start PartialGameLock_OnLoop
PartialGameLock_OnLoop: @ 0x08014BC8
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _08014BE6
	adds r0, r4, #0
	bl Proc_Break
_08014BE6:
	pop {r4}
	pop {r0}
	bx r0
