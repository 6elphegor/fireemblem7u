	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateHitEffects
BattleGenerateHitEffects: @ 0x0802939C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r1, r5, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r6, _080293D0 @ =0x0203A50C
	ldr r1, [r6]
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802948E
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _080293D4
	cmp r0, #3
	beq _080293E0
	b _080293EE
	.align 2, 0
_080293D0: .4byte 0x0203A50C
_080293D4:
	adds r1, r7, #0
	adds r1, #0x6f
	strb r0, [r1]
	ldr r0, [r6]
	movs r1, #0x40
	b _080293E8
_080293E0:
	ldr r0, [r6]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
_080293E8:
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_080293EE:
	ldrh r0, [r4]
	bl GetItemWeaponEffect
	cmp r0, #4
	bne _0802943C
	movs r1, #0x19
	ldrsb r1, [r5, r1]
	movs r0, #0x1f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl BattleRoll1RN
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802943C
	ldr r0, _08029434 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #0x80
	movs r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, _08029438 @ =0x0203A3D8
	ldrb r1, [r5, #0x13]
	ldrb r0, [r0, #4]
	subs r0, r1, r0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802945E
	strb r2, [r5, #0x13]
	b _0802945E
	.align 2, 0
_08029434: .4byte 0x0203A50C
_08029438: .4byte 0x0203A3D8
_0802943C:
	ldr r1, _080294D0 @ =0x0203A3D8
	movs r2, #0x13
	ldrsb r2, [r7, r2]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _0802944C
	strh r2, [r1, #4]
_0802944C:
	ldrb r2, [r7, #0x13]
	ldrb r1, [r1, #4]
	subs r0, r2, r1
	strb r0, [r7, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802945E
	movs r0, #0
	strb r0, [r7, #0x13]
_0802945E:
	ldrh r0, [r4]
	bl GetItemWeaponEffect
	cmp r0, #2
	bne _0802948E
	ldr r0, _080294D0 @ =0x0203A3D8
	ldrb r3, [r5, #0x13]
	ldrb r0, [r0, #4]
	adds r0, r3, r0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	ldrb r2, [r5, #0x12]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802947E
	strb r2, [r5, #0x13]
_0802947E:
	ldr r0, _080294D4 @ =0x0203A50C
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
_0802948E:
	ldr r2, _080294D4 @ =0x0203A50C
	ldr r1, [r2]
	ldr r0, _080294D0 @ =0x0203A3D8
	ldrh r0, [r0, #4]
	strb r0, [r1, #3]
	ldr r1, [r2]
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080294AE
	ldr r0, [r5, #0x4c]
	movs r1, #0x82
	ands r0, r1
	cmp r0, #0
	beq _080294C8
_080294AE:
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl GetItemAfterUse
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080294C8
	adds r1, r5, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_080294C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080294D0: .4byte 0x0203A3D8
_080294D4: .4byte 0x0203A50C
