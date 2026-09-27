	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadUnit
LoadUnit: @ 0x08017788
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldrb r1, [r5, #3]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080177B4
	cmp r0, #1
	bgt _080177A2
	cmp r0, #0
	beq _080177A8
	b _080177BC
_080177A2:
	cmp r0, #2
	beq _080177B0
	b _080177BC
_080177A8:
	adds r0, r5, #0
	bl GetFreeBlueUnit
	b _080177BA
_080177B0:
	movs r0, #0x80
	b _080177B6
_080177B4:
	movs r0, #0x40
_080177B6:
	bl GetFreeUnit
_080177BA:
	adds r4, r0, #0
_080177BC:
	cmp r4, #0
	bne _080177C4
	movs r0, #0
	b _08017862
_080177C4:
	adds r0, r4, #0
	bl ClearUnit
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitInitFromDefinition
	ldr r1, [r4]
	adds r0, r4, #0
	bl UnitLoadStatsFromChracter
	adds r0, r4, #0
	bl UnitHideIfUnderRoof
	movs r0, #1
	ldrb r1, [r5, #3]
	ands r0, r1
	cmp r0, #0
	beq _0801781A
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08017804
	adds r0, r4, #0
	bl UnitAutolevelPlayer
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitAutolevelWExp
	b _0801781A
_08017804:
	adds r0, r4, #0
	bl UnitAutolevel
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitAutolevelWExp
	ldrb r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x38
	strb r1, [r0]
_0801781A:
	adds r0, r4, #0
	bl FixROMUnitStructPtr
	adds r0, r4, #0
	bl UnitLoadSupports
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08017844
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_08017844:
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
	adds r0, r4, #0
_08017862:
	pop {r4, r5}
	pop {r1}
	bx r1
