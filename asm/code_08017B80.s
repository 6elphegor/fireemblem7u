	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitAutolevel
UnitAutolevel: @ 0x08017B80
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r2, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017BA8
	ldrb r4, [r2, #5]
	bl GetCurrentPromotedLevelBonus
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl UnitAutolevelCore
_08017BA8:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	movs r2, #8
	ldrsb r2, [r5, r2]
	subs r2, #1
	adds r0, r5, #0
	bl UnitAutolevelCore
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
