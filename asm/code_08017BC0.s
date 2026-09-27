	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitAutolevelPlayer
UnitAutolevelPlayer: @ 0x08017BC0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #8
	ldrsb r3, [r4, r3]
	ldr r0, [r4]
	movs r2, #0xb
	ldrsb r2, [r0, r2]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017BE8
	adds r0, r2, #0
	subs r0, #0xe
	subs r0, r3, r0
	b _08017BEA
_08017BE8:
	subs r0, r3, r2
_08017BEA:
	cmp r0, #0
	ble _08017C5E
	adds r5, r0, #0
_08017BF0:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	ldrb r1, [r4, #0x12]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	ldrb r1, [r4, #0x14]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	ldrb r1, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	ldrb r1, [r4, #0x16]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	ldrb r1, [r4, #0x17]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	ldrb r1, [r4, #0x18]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	ldrb r1, [r4, #0x19]
	adds r0, r1, r0
	strb r0, [r4, #0x19]
	subs r5, #1
	cmp r5, #0
	bne _08017BF0
_08017C5E:
	pop {r4, r5}
	pop {r0}
	bx r0
