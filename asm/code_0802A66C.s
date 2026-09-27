	.include "macro.inc"

	.syntax unified

	thumb_func_start GetOffensiveStaffAccuracy
GetOffensiveStaffAccuracy: @ 0x0802A66C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitPower
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitResistance
	subs r4, r4, r0
	lsls r0, r4, #2
	adds r7, r0, r4
	adds r0, r5, #0
	bl GetUnitSkill
	adds r4, r0, #0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802A69C
	subs r1, r0, r2
_0802A69C:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _0802A6AE
	adds r1, r1, r2
	b _0802A6B2
_0802A6AE:
	subs r0, r0, r3
	adds r1, r1, r0
_0802A6B2:
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r7, r0
	lsls r1, r1, #1
	subs r1, r0, r1
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	beq _0802A6C8
	cmp r0, #0x45
	bne _0802A6CC
_0802A6C8:
	movs r0, #0
	b _0802A6DA
_0802A6CC:
	cmp r1, #0
	bge _0802A6D2
	movs r1, #0
_0802A6D2:
	cmp r1, #0x64
	ble _0802A6D8
	movs r1, #0x64
_0802A6D8:
	adds r0, r1, #0
_0802A6DA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
