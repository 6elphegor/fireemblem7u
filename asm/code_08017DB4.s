	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitRescue
CanUnitRescue: @ 0x08017DB4
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitAid
	ldr r1, [r4, #4]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	ldr r1, [r4]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r2, r2, r1
	movs r1, #0
	cmp r0, r2
	blt _08017DDA
	movs r1, #1
_08017DDA:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
