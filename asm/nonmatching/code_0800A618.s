	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadUnitCore
LoadUnitCore: @ 0x0800A618
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	bl UnitInfoRequiresNoMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6F8
	movs r0, #6
	ldrb r1, [r5, #3]
	ands r0, r1
	cmp r0, #0
	beq _0800A662
	movs r6, #0
	ldrb r0, [r5]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	adds r4, r0, #0
	cmp r4, #0
	beq _0800A66E
	ldrb r2, [r5, #3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0800A658
	cmp r0, #1
	ble _0800A65A
	cmp r0, #2
	bne _0800A65A
	movs r6, #0x80
	b _0800A65A
_0800A658:
	movs r6, #0x40
_0800A65A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl UnitChangeFaction
_0800A662:
	ldrb r0, [r5]
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	bne _0800A682
_0800A66E:
	adds r0, r5, #0
	bl LoadUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800A6B4
_0800A682:
	adds r0, r4, #0
	bl sub_08079954
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A69E
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitLoadItemsFromDefinition
	ldr r0, [r4, #0xc]
	ldr r1, _0800A700 @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r4, #0xc]
_0800A69E:
	adds r0, r4, #0
	bl sub_08079A14
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6B4
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800A6F8
_0800A6B4:
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x11]
	ldr r1, _0800A704 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800A6E8
	ldrb r0, [r1, #0x1b]
	cmp r0, #3
	bne _0800A6E8
	movs r0, #6
	ldrb r2, [r5, #3]
	ands r0, r2
	cmp r0, #4
	bne _0800A6E8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterInfo
	ldrb r1, [r0, #0x14]
	adds r0, r4, #0
	bl UnitApplyBonusLevels
_0800A6E8:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_0800A71C
	bl RefreshEntityMaps
_0800A6F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A700: .4byte 0xFFFEFFFF
_0800A704: .4byte 0x0202BBF8
