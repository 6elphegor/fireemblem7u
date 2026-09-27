	.include "macro.inc"

	.syntax unified

	thumb_func_start TryUnlockParentProc
TryUnlockParentProc: @ 0x0807A9C8
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryUnlockProc
	pop {r0}
	bx r0
