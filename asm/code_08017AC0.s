	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitAutolevelCore
UnitAutolevelCore: @ 0x08017AC0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r5, #0
	beq _08017B44
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStatIncrease
	ldrb r1, [r4, #0x12]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStatIncrease
	ldrb r1, [r4, #0x14]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStatIncrease
	ldrb r1, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStatIncrease
	ldrb r1, [r4, #0x16]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStatIncrease
	ldrb r1, [r4, #0x17]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	ldr r0, [r4, #4]
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStatIncrease
	ldrb r1, [r4, #0x18]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
_08017B44:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
