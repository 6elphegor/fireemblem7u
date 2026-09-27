	.include "macro.inc"

	.syntax unified

	thumb_func_start MoveActiveUnit
MoveActiveUnit: @ 0x080181D0
	push {r4, r5, r6, r7, lr}
	ldr r3, _080181F0 @ =0x03004690
	ldr r2, [r3]
	strb r0, [r2, #0x10]
	ldr r0, [r3]
	strb r1, [r0, #0x11]
	ldr r2, [r3]
	ldr r0, [r2]
	adds r7, r3, #0
	ldrb r0, [r0, #4]
	cmp r0, #0xcd
	beq _080181F4
	ldr r0, [r2, #0xc]
	movs r1, #2
	orrs r0, r1
	b _080181FA
	.align 2, 0
_080181F0: .4byte 0x03004690
_080181F4:
	ldr r0, [r2, #0xc]
	ldr r1, _08018260 @ =0xFFFFFBBD
	ands r0, r1
_080181FA:
	str r0, [r2, #0xc]
	adds r6, r7, #0
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, _08018264 @ =0x0203A85C
	ldrb r1, [r1, #0x10]
	bl PidStatsAddMove
	ldr r5, [r6]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018240
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08018240:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08018254
	ldr r0, [r6]
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
_08018254:
	ldr r0, [r7]
	bl UnitSyncMovement
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018260: .4byte 0xFFFFFBBD
_08018264: .4byte 0x0203A85C
