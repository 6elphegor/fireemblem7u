	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023F98
sub_08023F98: @ 0x08023F98
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08024014 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802400C
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802400C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0802400C
	cmp r1, #2
	beq _0802400C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802400C
	ldr r0, [r5]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802400C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802400C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024014: .4byte 0x02033E40
