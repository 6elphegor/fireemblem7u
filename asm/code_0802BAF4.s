	.include "macro.inc"

	.syntax unified

	thumb_func_start AddDamagingTrap
AddDamagingTrap: @ 0x0802BAF4
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	ldr r5, [sp, #0x14]
	ldr r6, [sp, #0x18]
	bl AddTrap
	strb r4, [r0, #4]
	strb r5, [r0, #5]
	strb r4, [r0, #6]
	strb r6, [r0, #7]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
