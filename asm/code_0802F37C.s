	.include "macro.inc"

	.syntax unified

	thumb_func_start AfterDrop_CheckTrapAfterDropMaybe
AfterDrop_CheckTrapAfterDropMaybe: @ 0x0802F37C
	push {lr}
	ldr r1, [r0, #0x54]
	bl ExecTrapAfterDropAction
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
