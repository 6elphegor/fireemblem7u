	.include "macro.inc"

	.syntax unified

	thumb_func_start AddTrap9
AddTrap9: @ 0x0802BBA8
	push {lr}
	adds r3, r2, #0
	movs r2, #9
	bl AddTrap
	pop {r0}
	bx r0
	.align 2, 0
