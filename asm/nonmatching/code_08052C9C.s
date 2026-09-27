	.include "macro.inc"

	.syntax unified

	thumb_func_start ParseBattleHitToBanimCmd
ParseBattleHitToBanimCmd: @ 0x08052C9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _08052CF4 @ =0x0203A4F0
	mov sb, r0
	movs r2, #0
	ldr r4, _08052CF8 @ =0x0203E036
	ldr r5, _08052CFC @ =0x0203E0A0
	ldr r6, _08052D00 @ =0x0203E02C
	ldr r1, _08052D04 @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r4, #0
_08052CBA:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08052CBA
	movs r2, #0
	ldr r0, _08052D08 @ =0x0203E062
	ldr r1, _08052D04 @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r0, #4
_08052CD2:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08052CD2
	movs r2, #0
	str r2, [r5, #4]
	str r2, [r5]
	movs r5, #0
	ldrsh r0, [r6, r5]
	cmp r0, #4
	bne _08052D0C
	strh r0, [r4]
	strh r0, [r4, #2]
	b _080531FE
	.align 2, 0
_08052CF4: .4byte 0x0203A4F0
_08052CF8: .4byte 0x0203E036
_08052CFC: .4byte 0x0203E0A0
_08052D00: .4byte 0x0203E02C
_08052D04: .4byte 0x0000FFFF
_08052D08: .4byte 0x0203E062
_08052D0C:
	ldr r1, _08052D20 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052D24
	movs r0, #6
	strh r0, [r4]
	strh r2, [r4, #2]
	b _080531FE
	.align 2, 0
_08052D20: .4byte 0x0203A3D8
_08052D24:
	ldrh r6, [r6]
	str r6, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, _08052DD4 @ =0x0203E094
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _08052DD8 @ =0x0203E098
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x11
	bne _08052D4C
	cmp r6, #0
	bne _08052D4C
	movs r0, #1
	str r0, [sp, #0x14]
_08052D4C:
	ldr r4, [sp, #8]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	adds r5, r4, #0
	cmp r0, #0x11
	bne _08052D66
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _08052D66
	movs r2, #1
	str r2, [sp, #0x18]
_08052D66:
	ldr r4, [sp, #4]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x28
	bne _08052D7E
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _08052D7E
	movs r1, #1
	str r1, [sp, #0x14]
_08052D7E:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x28
	bne _08052D92
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne _08052D92
	movs r0, #1
	str r0, [sp, #0x18]
_08052D92:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x29
	bne _08052DA6
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _08052DA6
	movs r2, #1
	str r2, [sp, #0x14]
_08052DA6:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x29
	bne _08052DBA
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bne _08052DBA
	movs r0, #1
	str r0, [sp, #0x18]
_08052DBA:
	ldr r2, _08052DDC @ =0x0203E062
	ldr r1, _08052DE0 @ =0x0203E0B8
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	movs r1, #0
	str r1, [sp, #0xc]
	mov r8, r1
	movs r7, #0
	mov r5, sb
	ldrb r1, [r5, #2]
	b _080531F4
	.align 2, 0
_08052DD4: .4byte 0x0203E094
_08052DD8: .4byte 0x0203E098
_08052DDC: .4byte 0x0203E062
_08052DE0: .4byte 0x0203E0B8
_08052DE4:
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, _08052E1C @ =0x0203E014
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _08052E24
	mov r5, sp
	movs r0, #2
	add r0, sp
	mov sl, r0
	ldr r4, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r6, [sp, #4]
	movs r3, #0
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _08052E40
	ldr r0, _08052E20 @ =0x0203E00C
	strh r2, [r0]
	b _08052E40
	.align 2, 0
_08052E1C: .4byte 0x0203E014
_08052E20: .4byte 0x0203E00C
_08052E24:
	mov r5, sp
	adds r5, #2
	mov sl, sp
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	ldr r6, [sp, #8]
	movs r3, #0
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne _08052E40
	ldr r1, _08052E78 @ =0x0203E00C
	movs r0, #1
	strh r0, [r1]
_08052E40:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052E5C
	ldr r2, _08052E7C @ =0x0203E0A0
	ldr r1, _08052E80 @ =0x0203A3D8
	ldr r0, [r1, #0x10]
	str r0, [r2]
	ldr r0, [r1, #0x14]
	str r0, [r2, #4]
_08052E5C:
	mov r2, sb
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08052E90
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052E88
	ldr r0, _08052E84 @ =0x081D851C
	b _08052F0A
	.align 2, 0
_08052E78: .4byte 0x0203E00C
_08052E7C: .4byte 0x0203E0A0
_08052E80: .4byte 0x0203A3D8
_08052E84: .4byte 0x081D851C
_08052E88:
	ldr r0, _08052E8C @ =0x081D8544
	b _08052F0A
	.align 2, 0
_08052E8C: .4byte 0x081D8544
_08052E90:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08052EB8
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052EB0
	ldr r0, _08052EAC @ =0x081D851C
	b _08052F0A
	.align 2, 0
_08052EAC: .4byte 0x081D851C
_08052EB0:
	ldr r0, _08052EB4 @ =0x081D8544
	b _08052F0A
	.align 2, 0
_08052EB4: .4byte 0x081D8544
_08052EB8:
	lsls r0, r3, #0x10
	cmp r0, #0
	blt _08052EDC
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052ED4
	ldr r0, _08052ED0 @ =0x081D8508
	b _08052F0A
	.align 2, 0
_08052ED0: .4byte 0x081D8508
_08052ED4:
	ldr r0, _08052ED8 @ =0x081D853A
	b _08052F0A
	.align 2, 0
_08052ED8: .4byte 0x081D853A
_08052EDC:
	movs r0, #2
	bl sub_080672E8
	cmp r0, #1
	beq _08052F00
	cmp r0, #1
	bgt _08052EF0
	cmp r0, #0
	beq _08052EF6
	b _08052F14
_08052EF0:
	cmp r0, #2
	beq _08052F08
	b _08052F14
_08052EF6:
	ldr r0, _08052EFC @ =0x081D854E
	b _08052F0A
	.align 2, 0
_08052EFC: .4byte 0x081D854E
_08052F00:
	ldr r0, _08052F04 @ =0x081D8558
	b _08052F0A
	.align 2, 0
_08052F04: .4byte 0x081D8558
_08052F08:
	ldr r0, _08052F30 @ =0x081D8562
_08052F0A:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
_08052F14:
	movs r0, #2
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052F50
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052F38
	ldr r0, _08052F34 @ =0x081D8512
	b _08052F3A
	.align 2, 0
_08052F30: .4byte 0x081D8562
_08052F34: .4byte 0x081D8512
_08052F38:
	ldr r0, _08052F48 @ =0x081D853A
_08052F3A:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	ldr r0, _08052F4C @ =0x081D8526
	b _08052F52
	.align 2, 0
_08052F48: .4byte 0x081D853A
_08052F4C: .4byte 0x081D8526
_08052F50:
	ldr r0, _08052FD4 @ =0x081D8530
_08052F52:
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r5, sl
	strh r0, [r5]
	ldr r1, _08052FD8 @ =0x0203E036
	ldr r2, [sp, #0xc]
	lsls r0, r2, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r5]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r4, r0, r1
	mov r1, sp
	ldrh r0, [r1, #2]
	strh r0, [r4]
	mov r2, sb
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08052F8C
	b _080531E6
_08052F8C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08053028
	ldr r0, _08052FDC @ =0x0203E014
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _08052FE8
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08052FB8
	movs r2, #0
_08052FB8:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, _08052FE0 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _08052FE4 @ =0xFFFF8000
	adds r0, r2, #0
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	b _080531E6
	.align 2, 0
_08052FD4: .4byte 0x081D8530
_08052FD8: .4byte 0x0203E036
_08052FDC: .4byte 0x0203E014
_08052FE0: .4byte 0x0203E062
_08052FE4: .4byte 0xFFFF8000
_08052FE8:
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	mov r5, sb
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08053004
	movs r2, #0
_08053004:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, _08053020 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _08053024 @ =0xFFFF8000
	b _080531DE
	.align 2, 0
_08053020: .4byte 0x0203E062
_08053024: .4byte 0xFFFF8000
_08053028:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08053110
	ldr r0, _0805309C @ =0x0203E014
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _080530A8
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	mov r5, sb
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0805305C
	movs r2, #0
_0805305C:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _080530A0 @ =0x0203E062
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r2, [r0]
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _080530A4 @ =0x0203E0BC
	lsrs r2, r0, #0x10
	ldrh r5, [r3]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble _08053090
	ldrh r2, [r3]
_08053090:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	b _08053100
	.align 2, 0
_0805309C: .4byte 0x0203E014
_080530A0: .4byte 0x0203E062
_080530A4: .4byte 0x0203E0BC
_080530A8:
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080530C0
	movs r2, #0
_080530C0:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r4, _08053108 @ =0x0203E062
	lsls r0, r7, #2
	adds r0, r0, r4
	strh r2, [r0]
	mov r5, r8
	lsls r0, r5, #1
	adds r0, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _0805310C @ =0x0203E0BC
	lsrs r2, r0, #0x10
	ldrh r5, [r3, #2]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble _080530F0
	ldrh r2, [r3, #2]
_080530F0:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
_08053100:
	adds r0, r0, r4
	strh r2, [r0]
	b _080531E6
	.align 2, 0
_08053108: .4byte 0x0203E062
_0805310C: .4byte 0x0203E0BC
_08053110:
	ldr r0, _08053184 @ =0x0203E014
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _0805318C
	mov r1, r8
	lsls r0, r1, #1
	adds r0, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08053138
	movs r2, #0
_08053138:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, _08053188 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x40
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08053166
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
_08053166:
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080531E6
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r1, #0
	ldrh r2, [r5]
	orrs r0, r2
	strh r0, [r5]
	b _080531E6
	.align 2, 0
_08053184: .4byte 0x0203E014
_08053188: .4byte 0x0203E062
_0805318C:
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080531A4
	movs r2, #0
_080531A4:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, _08053210 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x40
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080531CA
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ldrh r2, [r5]
	orrs r0, r2
	strh r0, [r5]
_080531CA:
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r5, #0
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080531E6
	movs r2, #0x80
	lsls r2, r2, #5
_080531DE:
	adds r0, r2, #0
	ldrh r5, [r4]
	orrs r0, r5
	strh r0, [r4]
_080531E6:
	movs r0, #4
	add sb, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	mov r2, sb
	ldrb r1, [r2, #2]
_080531F4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080531FE
	b _08052DE4
_080531FE:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053210: .4byte 0x0203E062
