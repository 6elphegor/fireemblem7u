	.include "macro.inc"

	.syntax unified

	thumb_func_start TryLockParentProc
TryLockParentProc: @ 0x0807A9BC
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryLockProc
	pop {r0}
	bx r0
