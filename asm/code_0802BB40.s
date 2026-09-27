	.include "macro.inc"

	.syntax unified

	thumb_func_start AddGasTrap
AddGasTrap: @ 0x0802BB40
	push {r4, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r2, [sp, #0x14]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	movs r2, #5
	adds r3, r4, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
