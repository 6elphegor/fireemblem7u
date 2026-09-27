	.include "macro.inc"

	.syntax unified

	thumb_func_start AddArrowTrap
AddArrowTrap: @ 0x0802BB60
	push {lr}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r0}
	bx r0
