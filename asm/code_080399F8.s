	.include "macro.inc"

	.syntax unified

	thumb_func_start AiEquipGetFlags
AiEquipGetFlags: @ 0x080399F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _08039A10 @ =0x03004690
	ldr r0, [r5]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08039A14
	movs r0, #0
	b _08039AF6
	.align 2, 0
_08039A10: .4byte 0x03004690
_08039A14:
	movs r7, #0
	strh r7, [r4]
	ldr r0, [r5]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08039AF6
	adds r6, r4, #0
	movs r0, #0
	mov r8, r0
_08039A26:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08039AD8
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08039AD8
	ldr r4, _08039AB8 @ =0x03004690
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039A62
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039AD8
_08039A62:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08039ABC
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _08039A82
	movs r0, #2
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039A82:
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _08039A94
	movs r0, #1
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039A94:
	adds r0, r5, #0
	bl GetItemUses
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetItemMaxUses
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	cmp r4, #0xa
	bhi _08039ACA
	movs r0, #4
	b _08039AC4
	.align 2, 0
_08039AB8: .4byte 0x03004690
_08039ABC:
	adds r0, r5, #0
	bl sub_08039CCC
	movs r0, #8
_08039AC4:
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039ACA:
	adds r0, r5, #0
	bl GetItemMight
	lsls r0, r0, #8
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039AD8:
	adds r6, #2
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #4
	bgt _08039AF6
	movs r0, #0
	strh r0, [r6]
	ldr r0, _08039B00 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x1e
	add r0, r8
	ldrh r5, [r0]
	cmp r5, #0
	bne _08039A26
_08039AF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039B00: .4byte 0x03004690
