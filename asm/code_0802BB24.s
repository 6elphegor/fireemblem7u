	.include "macro.inc"

	.syntax unified

	thumb_func_start AddFireTile
AddFireTile: @ 0x0802BB24
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0xa
	str r2, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
