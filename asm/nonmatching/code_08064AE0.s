	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckInEkrDragon
CheckInEkrDragon: @ 0x08064AE0
	push {lr}
	bl GetKeyStatus_IgnoreMask
	pop {r1}
	bx r1
	.align 2, 0
