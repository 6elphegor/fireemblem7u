	.include "macro.inc"

	.syntax unified

	thumb_func_start SetLynModeDeathFlag
SetLynModeDeathFlag: @ 0x0807EE4C
	push {lr}
	movs r0, #0x9d
	bl SetFlag
	pop {r0}
	bx r0
