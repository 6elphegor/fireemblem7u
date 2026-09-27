	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecTrapAfterDeathDrop
ExecTrapAfterDeathDrop: @ 0x080345DC
	push {lr}
	movs r2, #3
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
