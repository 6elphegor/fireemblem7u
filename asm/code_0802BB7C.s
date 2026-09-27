	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802BB7C
sub_0802BB7C: @ 0x0802BB7C
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
