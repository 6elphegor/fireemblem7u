	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLynModeDeathFlag
GetLynModeDeathFlag: @ 0x0807EE3C
	push {lr}
	movs r0, #0x9d
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
