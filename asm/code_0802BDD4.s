	.include "macro.inc"

	.syntax unified

	thumb_func_start AddMapChangeTrap
AddMapChangeTrap: @ 0x0802BDD4
	push {lr}
	adds r3, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #3
	bl AddTrap
	pop {r0}
	bx r0
	.align 2, 0
