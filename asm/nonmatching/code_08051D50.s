	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepareBattleGraphicsMaybe
PrepareBattleGraphicsMaybe: @ 0x08051D50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	movs r0, #1
	str r0, [sp, #0x20]
	bl ResetEkrDragonStatus
	ldr r1, _08051D78 @ =0x0203A3D8
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08051D7C
	movs r0, #0
	bl SetBanimArenaFlag
	b _08051D82
	.align 2, 0
_08051D78: .4byte 0x0203A3D8
_08051D7C:
	movs r0, #1
	bl SetBanimArenaFlag
_08051D82:
	ldr r1, _08051D98 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08051D9C
	movs r0, #0
	bl SetBanimLinkArenaFlag
	b _08051DA2
	.align 2, 0
_08051D98: .4byte 0x0202BBB8
_08051D9C:
	movs r0, #1
	bl SetBanimLinkArenaFlag
_08051DA2:
	ldr r1, _08051DBC @ =0x0203A3D8
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08051DC4
	ldr r1, _08051DC0 @ =0x0203E02C
	movs r0, #4
	strh r0, [r1]
	adds r0, r1, #0
	b _08051DC8
	.align 2, 0
_08051DBC: .4byte 0x0203A3D8
_08051DC0: .4byte 0x0203E02C
_08051DC4:
	ldr r0, _08051DF4 @ =0x0203E02C
	strh r2, [r0]
_08051DC8:
	ldrh r0, [r0]
	cmp r0, #4
	bne _08051E10
	ldr r1, _08051DF8 @ =0x0203E094
	ldr r0, _08051DFC @ =0x0203A3F0
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08051E00 @ =0x0203E098
	ldr r0, _08051E04 @ =0x0203A470
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _08051E08 @ =0x0203E014
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r0, _08051E0C @ =0x0203E010
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp, #8]
	adds r3, r0, #0
	b _08051F0A
	.align 2, 0
_08051DF4: .4byte 0x0203E02C
_08051DF8: .4byte 0x0203E094
_08051DFC: .4byte 0x0203A3F0
_08051E00: .4byte 0x0203E098
_08051E04: .4byte 0x0203A470
_08051E08: .4byte 0x0203E014
_08051E0C: .4byte 0x0203E010
_08051E10:
	ldr r5, _08051E48 @ =0x0203A3F0
	movs r4, #0x40
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _08051E4C @ =0x0203A470
	ldrb r0, [r0, #0xb]
	ands r4, r0
	adds r0, r4, #0
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08051E50 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08051E54
	movs r2, #2
	str r2, [sp, #0x20]
	b _08051E78
	.align 2, 0
_08051E48: .4byte 0x0203A3F0
_08051E4C: .4byte 0x0203A470
_08051E50: .4byte 0x0203A3D8
_08051E54:
	adds r1, r5, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	cmp r0, #0
	bne _08051E64
	movs r3, #2
	str r3, [sp, #0x20]
	b _08051E78
_08051E64:
	ldrh r0, [r1]
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetWeaponAnimActorCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
_08051E78:
	ldr r1, _08051ECC @ =0x0203E010
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _08051EA0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _08051E9E
	cmp r0, #2
	beq _08051E9E
	cmp r0, #1
	bne _08051EA0
	cmp r6, #1
	bne _08051EA0
_08051E9E:
	movs r4, #1
_08051EA0:
	adds r2, r4, #0
	cmp r2, #1
	bne _08051EE4
	ldr r1, _08051ED0 @ =0x0203E094
	ldr r0, _08051ED4 @ =0x0203A470
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08051ED8 @ =0x0203E098
	ldr r0, _08051EDC @ =0x0203A3F0
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, _08051EE0 @ =0x0203E014
	movs r1, #0
	strh r2, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp, #0xc]
	ldr r3, _08051ECC @ =0x0203E010
	ldr r4, [sp, #0x20]
	cmp r4, #1
	bne _08051F0A
	strh r1, [r3]
	b _08051F0A
	.align 2, 0
_08051ECC: .4byte 0x0203E010
_08051ED0: .4byte 0x0203E094
_08051ED4: .4byte 0x0203A470
_08051ED8: .4byte 0x0203E098
_08051EDC: .4byte 0x0203A3F0
_08051EE0: .4byte 0x0203E014
_08051EE4:
	ldr r1, _08051FC0 @ =0x0203E094
	ldr r0, _08051FC4 @ =0x0203A3F0
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08051FC8 @ =0x0203E098
	ldr r0, _08051FCC @ =0x0203A470
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _08051FD0 @ =0x0203E014
	movs r2, #0
	strh r2, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r7, [sp, #8]
	ldr r3, _08051FD4 @ =0x0203E010
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _08051F0A
	strh r2, [r3, #2]
_08051F0A:
	ldr r1, [sp, #8]
	mov sl, r1
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x18]
	ldr r4, [r1]
	str r4, [sp, #0x10]
	ldr r0, [r2]
	str r0, [sp, #0x14]
	movs r1, #0
	mov sb, r1
	mov r8, r1
	ldrh r1, [r3, #2]
	ldrh r2, [r3]
	str r2, [sp, #0x1c]
	movs r4, #0
	ldrsh r6, [r3, r4]
	cmp r6, #0
	beq _08051F36
	mov r2, sl
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x34]
	mov r8, r0
_08051F36:
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	str r0, [sp, #0x28]
	cmp r5, #0
	beq _08051F48
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #4]
	ldr r0, [r0, #0x34]
	mov sb, r0
_08051F48:
	cmp r6, #0
	beq _08051F74
	ldr r3, _08051FD8 @ =0x0203E02E
	mov r4, sl
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	ldr r2, _08051FDC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3]
	mov r1, sl
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #2]
_08051F74:
	cmp r5, #0
	beq _08051FA0
	ldr r3, _08051FD8 @ =0x0203E02E
	ldr r1, [sp, #0x18]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _08051FDC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #4]
	ldr r1, [sp, #0x18]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #6]
_08051FA0:
	ldr r4, _08051FE0 @ =0x0203E02C
	ldrh r0, [r4]
	cmp r0, #4
	beq _0805206E
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08051FE4
	movs r0, #2
	strh r0, [r4]
	b _08052066
	.align 2, 0
_08051FC0: .4byte 0x0203E094
_08051FC4: .4byte 0x0203A3F0
_08051FC8: .4byte 0x0203E098
_08051FCC: .4byte 0x0203A470
_08051FD0: .4byte 0x0203E014
_08051FD4: .4byte 0x0203E010
_08051FD8: .4byte 0x0203E02E
_08051FDC: .4byte 0x0202BBB8
_08051FE0: .4byte 0x0203E02C
_08051FE4:
	movs r0, #3
	strh r0, [r4]
	adds r0, r6, r5
	cmp r0, #2
	bne _08052066
	ldr r0, _08052008 @ =0x0203E02E
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #4
	ldrsh r2, [r0, r3]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0
	blt _0805200C
	ldrh r4, [r2]
	ldrh r1, [r2, #4]
	subs r0, r4, r1
	b _08052012
	.align 2, 0
_08052008: .4byte 0x0203E02E
_0805200C:
	ldrh r3, [r2, #4]
	ldrh r4, [r2]
	subs r0, r3, r4
_08052012:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r4, #6
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	cmp r0, #0
	blt _0805202C
	ldrh r1, [r2, #2]
	ldrh r4, [r2, #6]
	b _08052030
_0805202C:
	ldrh r1, [r2, #6]
	ldrh r4, [r2, #2]
_08052030:
	subs r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r1, r0
	cmp r0, #1
	bgt _08052050
	ldr r1, _0805204C @ =0x0203E02C
	movs r0, #0
	b _08052064
	.align 2, 0
_0805204C: .4byte 0x0203E02C
_08052050:
	cmp r0, #3
	bgt _08052060
	ldr r1, _0805205C @ =0x0203E02C
	movs r0, #1
	b _08052064
	.align 2, 0
_0805205C: .4byte 0x0203E02C
_08052060:
	ldr r1, _080520A4 @ =0x0203E02C
	movs r0, #2
_08052064:
	strh r0, [r1]
_08052066:
	ldr r0, _080520A4 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _080520B0
_0805206E:
	ldr r0, [sp, #8]
	adds r0, #0x48
	ldrh r2, [r0]
	mov r0, sl
	mov r1, r8
	mov r3, sp
	bl GetBattleAnimationId_WithUnique
	ldr r5, _080520A8 @ =0x0203E08E
	ldr r4, _080520AC @ =0x0203E018
	strh r0, [r4]
	strh r0, [r5]
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	ldrh r2, [r0]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	mov r1, sb
	bl GetBattleAnimationId_WithUnique
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	str r0, [sp, #0x24]
	b _080520F0
	.align 2, 0
_080520A4: .4byte 0x0203E02C
_080520A8: .4byte 0x0203E08E
_080520AC: .4byte 0x0203E018
_080520B0:
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #0x10
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _080520D2
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r2, [r0]
	mov r0, sl
	mov r1, r8
	mov r3, sp
	bl GetBattleAnimationId_WithUnique
	ldr r2, _0805223C @ =0x0203E08E
	ldr r1, _08052240 @ =0x0203E018
	strh r0, [r1]
	strh r0, [r2]
_080520D2:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq _080520F0
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r2, [r0]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	mov r1, sb
	bl GetBattleAnimationId_WithUnique
	ldr r2, _0805223C @ =0x0203E08E
	ldr r1, _08052240 @ =0x0203E018
	strh r0, [r1, #2]
	strh r0, [r2, #2]
_080520F0:
	ldr r3, [sp, #0x24]
	asrs r7, r3, #0x10
	cmp r7, #0
	beq _08052104
	ldr r1, [sp]
	mov r0, sl
	bl GetBattleAnimCharacterUniquePalIndex
	ldr r1, _08052244 @ =0x0203E01C
	strh r0, [r1]
_08052104:
	ldr r4, [sp, #0x28]
	asrs r4, r4, #0x10
	mov r8, r4
	cmp r4, #0
	beq _0805211A
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x18]
	bl GetBattleAnimCharacterUniquePalIndex
	ldr r1, _08052244 @ =0x0203E01C
	strh r0, [r1, #2]
_0805211A:
	cmp r7, #0
	beq _08052132
	ldr r0, _0805223C @ =0x0203E08E
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl FilterBattleAnimCharacterPalette
	ldr r1, _08052248 @ =0x0203E0A8
	str r0, [r1]
_08052132:
	mov r2, r8
	cmp r2, #0
	beq _0805214C
	ldr r0, _0805223C @ =0x0203E08E
	movs r3, #2
	ldrsh r0, [r0, r3]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl FilterBattleAnimCharacterPalette
	ldr r1, _08052248 @ =0x0203E0A8
	str r0, [r1, #4]
_0805214C:
	ldr r4, _0805224C @ =0x0203E0D8
	mov sb, r4
	ldr r2, [sp, #8]
	adds r2, #0x55
	ldrb r0, [r2]
	strh r0, [r4]
	ldr r6, [sp, #0xc]
	adds r6, #0x55
	ldrb r0, [r6]
	strh r0, [r4, #2]
	ldr r5, _08052250 @ =0x0203E028
	ldr r1, _08052254 @ =0x0000FFFF
	adds r0, r1, #0
	ldrh r1, [r5, #2]
	orrs r1, r0
	strh r1, [r5, #2]
	ldrh r3, [r5]
	orrs r0, r3
	strh r0, [r5]
	cmp r7, #0
	beq _0805218E
	ldrb r4, [r2]
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r5]
_0805218E:
	mov r4, r8
	cmp r4, #0
	beq _080521AC
	ldrb r4, [r6]
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r5, #2]
_080521AC:
	ldr r1, _0805225C @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080521FA
	movs r0, #0x30
	mov r1, sb
	strh r0, [r1]
	strh r0, [r1, #2]
	cmp r7, #0
	beq _080521DA
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	movs r0, #0x30
	bl GetBanimTerrainGround
	strh r0, [r5]
_080521DA:
	mov r2, r8
	cmp r2, #0
	beq _080521FA
	mov r3, sb
	ldrh r4, [r3, #2]
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r5, #2]
_080521FA:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08052212
	ldr r1, _08052250 @ =0x0203E028
	movs r0, #0x14
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r1, _0805224C @ =0x0203E0D8
	movs r0, #0x30
	strh r0, [r1, #2]
	strh r0, [r1]
_08052212:
	ldr r0, _08052260 @ =0x0203E02C
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	blt _0805222A
	cmp r0, #3
	ble _0805222A
	cmp r0, #4
	bne _0805222A
	ldr r1, _08052250 @ =0x0203E028
	ldrh r0, [r1, #2]
	strh r0, [r1]
_0805222A:
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #2
	bgt _08052268
	cmp r0, #1
	blt _08052268
	ldr r1, _08052264 @ =0x0203E00E
	movs r0, #1
	b _0805226C
	.align 2, 0
_0805223C: .4byte 0x0203E08E
_08052240: .4byte 0x0203E018
_08052244: .4byte 0x0203E01C
_08052248: .4byte 0x0203E0A8
_0805224C: .4byte 0x0203E0D8
_08052250: .4byte 0x0203E028
_08052254: .4byte 0x0000FFFF
_08052258: .4byte 0x0202BBF8
_0805225C: .4byte 0x0202BBB8
_08052260: .4byte 0x0203E02C
_08052264: .4byte 0x0203E00E
_08052268:
	ldr r1, _080522E8 @ =0x0203E00E
	movs r0, #0
_0805226C:
	strh r0, [r1]
	ldr r0, [sp, #0x24]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _08052284
	ldr r0, _080522EC @ =0x0203E0DC
	mov r2, sl
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
_08052284:
	ldr r3, [sp, #0x28]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq _0805229A
	ldr r0, _080522EC @ =0x0203E0DC
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #2]
_0805229A:
	cmp r4, #0
	beq _080522B6
	ldr r1, _080522F0 @ =0x0203E0B8
	ldr r0, [sp, #8]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r1, _080522F4 @ =0x0203E0BC
	mov r3, sl
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r1]
_080522B6:
	cmp r5, #0
	beq _080522D2
	ldr r1, _080522F0 @ =0x0203E0B8
	ldr r0, [sp, #0xc]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
	ldr r1, _080522F4 @ =0x0203E0BC
	ldr r2, [sp, #0x18]
	movs r0, #0x12
	ldrsb r0, [r2, r0]
	strh r0, [r1, #2]
_080522D2:
	bl ParseBattleHitToBanimCmd
	ldr r0, _080522F8 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _08052300
	ldr r1, _080522FC @ =0x0203E024
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _0805236C
	.align 2, 0
_080522E8: .4byte 0x0203E00E
_080522EC: .4byte 0x0203E0DC
_080522F0: .4byte 0x0203E0B8
_080522F4: .4byte 0x0203E0BC
_080522F8: .4byte 0x0203E02C
_080522FC: .4byte 0x0203E024
_08052300:
	cmp r4, #0
	beq _08052318
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl GetSpellAnimId
	ldr r1, _080525C0 @ =0x0203E024
	strh r0, [r1]
_08052318:
	cmp r5, #0
	beq _08052330
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl GetSpellAnimId
	ldr r1, _080525C0 @ =0x0203E024
	strh r0, [r1, #2]
_08052330:
	ldr r1, _080525C4 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0805236C
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805236C
	ldr r1, [sp, #0x18]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x41
	bne _0805235C
	ldr r1, _080525C0 @ =0x0203E024
	movs r0, #0xe
	strh r0, [r1, #2]
_0805235C:
	ldr r2, [sp, #0x18]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	bne _0805236C
	ldr r1, _080525C0 @ =0x0203E024
	movs r0, #0xf
	strh r0, [r1, #2]
_0805236C:
	ldr r3, [sp, #0x24]
	cmp r3, #0
	beq _08052380
	ldr r0, _080525C0 @ =0x0203E024
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl UnsetMapStaffAnim
_08052380:
	ldr r4, [sp, #0x28]
	cmp r4, #0
	beq _08052394
	ldr r0, _080525C8 @ =0x0203E026
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl UnsetMapStaffAnim
_08052394:
	ldr r0, _080525CC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _080523B0
	cmp r0, #2
	bgt _080523B0
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	bne _080523B0
	bl sub_08064A2C
_080523B0:
	ldr r3, [sp, #0x24]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq _080523CA
	movs r0, #0x40
	rsbs r0, r0, #0
	mov r4, sl
	ldrb r4, [r4, #0xb]
	ands r0, r4
	bl GetAllegienceId
	ldr r1, _080525D0 @ =0x0203E020
	strh r0, [r1]
_080523CA:
	ldr r0, [sp, #0x28]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _080523E4
	movs r0, #0x40
	rsbs r0, r0, #0
	ldr r1, [sp, #0x18]
	ldrb r1, [r1, #0xb]
	ands r0, r1
	bl GetAllegienceId
	ldr r1, _080525D0 @ =0x0203E020
	strh r0, [r1, #2]
_080523E4:
	ldr r1, _080525D4 @ =0x0203E09C
	movs r3, #0
	strb r3, [r1, #1]
	strb r3, [r1]
	cmp r5, #0
	beq _080523F6
	ldr r2, [sp, #0x10]
	ldrb r0, [r2, #4]
	strb r0, [r1]
_080523F6:
	cmp r4, #0
	beq _08052400
	ldr r2, [sp, #0x14]
	ldrb r0, [r2, #4]
	strb r0, [r1, #1]
_08052400:
	ldr r0, _080525D8 @ =0x0203E0C4
	mov r8, r0
	cmp r5, #0
	beq _08052412
	ldr r0, [sp, #8]
	adds r0, #0x64
	ldrh r0, [r0]
	mov r1, r8
	strh r0, [r1]
_08052412:
	cmp r4, #0
	beq _08052420
	ldr r0, [sp, #0xc]
	adds r0, #0x64
	ldrh r0, [r0]
	mov r2, r8
	strh r0, [r2, #2]
_08052420:
	mov r4, r8
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0xff
	bne _0805242E
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r4]
_0805242E:
	mov r2, r8
	ldrh r0, [r2, #2]
	adds r4, r0, #0
	cmp r4, #0xff
	bne _0805243C
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r2, #2]
_0805243C:
	cmp r5, #0
	beq _08052464
	ldr r2, _080525E0 @ =0x0203E0C8
	ldr r1, [sp, #8]
	adds r1, #0x5a
	ldr r0, [sp, #0xc]
	adds r0, #0x5c
	ldrh r4, [r1]
	ldrh r0, [r0]
	subs r0, r4, r0
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0805245A
	strh r3, [r2]
_0805245A:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne _08052464
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r2]
_08052464:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _08052490
	ldr r2, _080525E0 @ =0x0203E0C8
	ldr r1, [sp, #0xc]
	adds r1, #0x5a
	ldr r0, [sp, #8]
	adds r0, #0x5c
	ldrh r3, [r1]
	ldrh r0, [r0]
	subs r0, r3, r0
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08052486
	movs r0, #0
	strh r0, [r2, #2]
_08052486:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne _08052490
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r2, #2]
_08052490:
	ldr r4, [sp, #0x24]
	asrs r7, r4, #0x10
	ldr r3, _080525E4 @ =0x0203E0CC
	cmp r7, #0
	beq _080524A2
	ldr r0, [sp, #8]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r3]
_080524A2:
	ldr r0, [sp, #0x28]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq _080524B2
	ldr r0, [sp, #0xc]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r3, #2]
_080524B2:
	adds r1, r3, #0
	ldrh r0, [r1]
	cmp r0, #0xff
	bne _080524BE
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r1]
_080524BE:
	ldrh r0, [r1, #2]
	cmp r0, #0xff
	bne _080524C8
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r1, #2]
_080524C8:
	ldr r0, _080525CC @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _080524EA
	ldr r2, _080525DC @ =0x0000FFFF
	adds r1, r2, #0
	mov r4, r8
	ldrh r0, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	ldr r2, _080525E0 @ =0x0203E0C8
	ldrh r0, [r2, #2]
	orrs r0, r1
	strh r0, [r2, #2]
	ldrh r0, [r3, #2]
	orrs r1, r0
	strh r1, [r3, #2]
_080524EA:
	cmp r7, #0
	beq _080524FC
	ldr r1, _080525E8 @ =0x0203E0D0
	ldr r0, [sp, #8]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_080524FC:
	cmp r6, #0
	beq _0805250E
	ldr r1, _080525E8 @ =0x0203E0D0
	ldr r0, [sp, #0xc]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_0805250E:
	cmp r7, #0
	beq _08052520
	ldr r1, _080525EC @ =0x0203E0D4
	ldr r0, [sp, #8]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08052520:
	cmp r6, #0
	beq _08052532
	ldr r1, _080525EC @ =0x0203E0D4
	ldr r0, [sp, #0xc]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08052532:
	ldr r1, _080525F0 @ =0x0203E0E0
	movs r5, #0
	strh r5, [r1, #2]
	strh r5, [r1]
	cmp r7, #0
	beq _0805254A
	ldr r0, [sp, #8]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_0805254A:
	cmp r6, #0
	beq _0805255A
	ldr r0, [sp, #0xc]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_0805255A:
	ldr r4, _080525F4 @ =0x0203E0E4
	strh r5, [r4, #2]
	strh r5, [r4]
	cmp r7, #0
	beq _08052576
	ldr r0, [sp, #8]
	adds r0, #0x48
	ldrh r0, [r0]
	ldr r1, [sp, #0x18]
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
_08052576:
	cmp r6, #0
	beq _0805258C
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	ldrh r0, [r0]
	mov r1, sl
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
_0805258C:
	ldr r4, _080525F8 @ =0x0203E0B0
	str r5, [r4, #4]
	str r5, [r4]
	cmp r7, #0
	beq _08052610
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x36
	bgt _08052610
	cmp r0, #0x34
	blt _08052610
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _080525FC
	cmp r0, #0x19
	ble _08052610
	cmp r0, #0x1a
	beq _08052604
	cmp r0, #0x1b
	beq _0805260C
	b _08052610
	.align 2, 0
_080525C0: .4byte 0x0203E024
_080525C4: .4byte 0x0203A3D8
_080525C8: .4byte 0x0203E026
_080525CC: .4byte 0x0203E02C
_080525D0: .4byte 0x0203E020
_080525D4: .4byte 0x0203E09C
_080525D8: .4byte 0x0203E0C4
_080525DC: .4byte 0x0000FFFF
_080525E0: .4byte 0x0203E0C8
_080525E4: .4byte 0x0203E0CC
_080525E8: .4byte 0x0203E0D0
_080525EC: .4byte 0x0203E0D4
_080525F0: .4byte 0x0203E0E0
_080525F4: .4byte 0x0203E0E4
_080525F8: .4byte 0x0203E0B0
_080525FC:
	ldr r0, _08052600 @ =0x081DA264
	b _0805260E
	.align 2, 0
_08052600: .4byte 0x081DA264
_08052604:
	ldr r0, _08052608 @ =0x081DA6D8
	b _0805260E
	.align 2, 0
_08052608: .4byte 0x081DA6D8
_0805260C:
	ldr r0, _08052640 @ =0x081DAB78
_0805260E:
	str r0, [r4]
_08052610:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq _0805266A
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x36
	bgt _0805266A
	cmp r0, #0x34
	blt _0805266A
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _08052644
	cmp r0, #0x19
	ble _0805266A
	cmp r0, #0x1a
	beq _08052654
	cmp r0, #0x1b
	beq _08052664
	b _0805266A
	.align 2, 0
_08052640: .4byte 0x081DAB78
_08052644:
	ldr r1, _0805264C @ =0x0203E0B0
	ldr r0, _08052650 @ =0x081DA264
	b _08052668
	.align 2, 0
_0805264C: .4byte 0x0203E0B0
_08052650: .4byte 0x081DA264
_08052654:
	ldr r1, _0805265C @ =0x0203E0B0
	ldr r0, _08052660 @ =0x081DA6D8
	b _08052668
	.align 2, 0
_0805265C: .4byte 0x0203E0B0
_08052660: .4byte 0x081DA6D8
_08052664:
	ldr r1, _08052684 @ =0x0203E0B0
	ldr r0, _08052688 @ =0x081DAB78
_08052668:
	str r0, [r1, #4]
_0805266A:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0805267E
	ldr r0, _0805268C @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08052694
_0805267E:
	ldr r1, _08052690 @ =0x0203E0E8
	movs r0, #1
	b _08052698
	.align 2, 0
_08052684: .4byte 0x0203E0B0
_08052688: .4byte 0x081DAB78
_0805268C: .4byte 0x0202BBF8
_08052690: .4byte 0x0203E0E8
_08052694:
	ldr r1, _080526BC @ =0x0203E0E8
	movs r0, #0
_08052698:
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r5, _080526C0 @ =0x0203E00A
	movs r0, #0
	strh r0, [r5]
	bl GetBattleAnimType
	cmp r0, #3
	bne _080526E6
	ldr r0, _080526C4 @ =0x0203E010
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	beq _080526CC
	ldr r0, _080526C8 @ =0x0203E0D8
	ldrh r4, [r0]
	b _080526D0
	.align 2, 0
_080526BC: .4byte 0x0203E0E8
_080526C0: .4byte 0x0203E00A
_080526C4: .4byte 0x0203E010
_080526C8: .4byte 0x0203E0D8
_080526CC:
	ldr r0, _08052824 @ =0x0203E0D8
	ldrh r4, [r0, #2]
_080526D0:
	ldr r0, _08052828 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimBackgroundIndex
	strh r0, [r5]
_080526E6:
	bl CheckBanimHensei
	cmp r0, #1
	bne _080526F4
	ldr r1, _0805282C @ =0x0203E00A
	movs r0, #0x3c
	strh r0, [r1]
_080526F4:
	movs r4, #0
	bl GetBattleAnimType
	cmp r0, #0
	bne _08052700
	movs r4, #1
_08052700:
	bl GetBattleAnimType
	cmp r0, #3
	bne _0805270A
	movs r4, #1
_0805270A:
	bl GetBattleAnimType
	cmp r0, #1
	bne _08052740
	ldr r0, _08052830 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0805271C
	movs r4, #1
_0805271C:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08052726
	movs r4, #1
_08052726:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	bne _08052732
	movs r4, #1
_08052732:
	bl CheckBattleScriptted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08052740
	movs r4, #1
_08052740:
	bl SetBattleUnscriptted
	ldr r0, _08052830 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	beq _08052778
	mov r2, sl
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08052820
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08052820
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _08052820
	ldr r2, [sp, #0x18]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _08052820
_08052778:
	ldr r3, [sp, #0x20]
	cmp r3, #1
	beq _08052788
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	beq _08052844
_08052788:
	cmp r4, #0
	beq _08052820
	ldr r0, _08052834 @ =0x0203E010
	adds r3, r0, #0
	ldrh r2, [r3]
	cmp r2, #1
	bne _080527D8
	mov r1, sl
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08052820
	ldr r0, _08052838 @ =0x0203E08E
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08052820
	ldr r0, _0805283C @ =0x0203E024
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08052820
	ldr r0, _08052840 @ =0x0203E028
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r2
	beq _08052820
	ldr r0, _08052824 @ =0x0203E0D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x1b
	beq _08052820
	cmp r0, #0x33
	beq _08052820
_080527D8:
	ldrh r3, [r3, #2]
	cmp r3, #1
	bne _08052844
	ldr r1, [sp, #0x18]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08052820
	ldr r0, _08052838 @ =0x0203E08E
	movs r3, #2
	ldrsh r0, [r0, r3]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08052820
	ldr r0, _0805283C @ =0x0203E024
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08052820
	ldr r0, _08052840 @ =0x0203E028
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, r2
	beq _08052820
	ldr r0, _08052824 @ =0x0203E0D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x1b
	beq _08052820
	cmp r0, #0x33
	bne _08052844
_08052820:
	movs r0, #0
	b _08052846
	.align 2, 0
_08052824: .4byte 0x0203E0D8
_08052828: .4byte 0x0202BBF8
_0805282C: .4byte 0x0203E00A
_08052830: .4byte 0x0203E02C
_08052834: .4byte 0x0203E010
_08052838: .4byte 0x0203E08E
_0805283C: .4byte 0x0203E024
_08052840: .4byte 0x0203E028
_08052844:
	movs r0, #1
_08052846:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
