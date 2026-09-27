	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitMapUiUpdate
UnitMapUiUpdate: @ 0x08084FB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08085058
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084FE2
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl PutUnitMapUiStatus
	movs r0, #1
	bl EnableBgSync
	b _08085058
_08084FE2:
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl ClearUnitMapUiStatus
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _08085002
	movs r0, #0xff
	bl sub_08005080
	b _0808500C
_08085002:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	bl sub_08005080
_0808500C:
	ldr r1, _08085034 @ =0x02028D44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _08085038
	movs r0, #0xff
	bl sub_08005080
	b _08085042
	.align 2, 0
_08085034: .4byte 0x02028D44
_08085038:
	adds r0, r4, #0
	bl GetUnitMaxHp
	bl sub_08005080
_08085042:
	ldr r1, _08085104 @ =0x02028D44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r1, [r1, #7]
	subs r1, #0x30
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
_08085058:
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080850F8
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08085082
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080850F8
_08085082:
	adds r0, r6, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #3
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #3
	adds r0, r6, #0
	adds r0, #0x51
	ldrb r4, [r0]
	cmp r4, #0xf0
	beq _080850B4
	ldr r2, _08085108 @ =0x08B905B0
	adds r0, r4, #0
	ldr r4, _0808510C @ =0x000082E0
	adds r3, r0, r4
	adds r0, r1, #0
	adds r1, r5, #0
	bl PutOamHiRam
_080850B4:
	adds r0, r7, #0
	adds r0, #0x17
	ldr r1, _08085108 @ =0x08B905B0
	mov r8, r1
	adds r1, r6, #0
	adds r1, #0x52
	ldr r4, _0808510C @ =0x000082E0
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x22
	adds r1, r6, #0
	adds r1, #0x53
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x29
	adds r1, r6, #0
	adds r1, #0x54
	ldrb r1, [r1]
	adds r4, r1, r4
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl PutOamHiRam
_080850F8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085104: .4byte 0x02028D44
_08085108: .4byte 0x08B905B0
_0808510C: .4byte 0x000082E0
