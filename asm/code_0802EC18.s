	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGetPowerRanking
ArenaGetPowerRanking: @ 0x0802EC18
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0x12
	ldrsb r5, [r4, r5]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r5
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	adds r2, r2, r0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	adds r0, r0, r2
	lsls r5, r0, #1
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [r4]
	ldrb r2, [r2, #0x13]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r0, r2
	adds r5, r5, r0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0802EC5C
	adds r0, r4, #0
	bl GetUnitResistance
	b _0802EC62
_0802EC5C:
	adds r0, r4, #0
	bl GetUnitDefense
_0802EC62:
	lsls r0, r0, #1
	adds r5, r5, r0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802EC80
	adds r0, r4, #0
	bl GetUnitPower
	adds r5, r5, r0
_0802EC80:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
