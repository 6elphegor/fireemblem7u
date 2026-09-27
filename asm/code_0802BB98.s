	.include "macro.inc"

	.syntax unified

	thumb_func_start AddTrap8
AddTrap8: @ 0x0802BB98
	push {lr}
	movs r2, #8
	movs r3, #0
	bl AddTrap
	pop {r0}
	bx r0
	.align 2, 0
