	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyItemStatBoost
ApplyItemStatBoost: @ 0x0802CD28
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	lsls r0, r7, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl GetItemIndex
	cmp r0, #0x88
	bne _0802CD60
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	ldr r0, _0802CD5C @ =0x00000719
	b _0802CE56
	.align 2, 0
_0802CD5C: .4byte 0x00000719
_0802CD60:
	adds r0, r6, #0
	bl GetItemBonuses
	ldrb r2, [r4, #0x12]
	ldrb r3, [r0]
	adds r1, r2, r3
	strb r1, [r4, #0x12]
	ldrb r2, [r4, #0x13]
	ldrb r3, [r0]
	adds r1, r2, r3
	strb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	ldrb r3, [r0, #1]
	adds r1, r2, r3
	strb r1, [r4, #0x14]
	ldrb r2, [r4, #0x15]
	ldrb r3, [r0, #2]
	adds r1, r2, r3
	strb r1, [r4, #0x15]
	ldrb r2, [r4, #0x16]
	ldrb r3, [r0, #3]
	adds r1, r2, r3
	strb r1, [r4, #0x16]
	ldrb r2, [r4, #0x17]
	ldrb r3, [r0, #4]
	adds r1, r2, r3
	strb r1, [r4, #0x17]
	ldrb r2, [r4, #0x18]
	ldrb r3, [r0, #5]
	adds r1, r2, r3
	strb r1, [r4, #0x18]
	ldrb r2, [r4, #0x19]
	ldrb r3, [r0, #6]
	adds r1, r2, r3
	strb r1, [r4, #0x19]
	ldrb r2, [r4, #0x1d]
	ldrb r3, [r0, #7]
	adds r1, r2, r3
	strb r1, [r4, #0x1d]
	ldrb r1, [r4, #0x1a]
	ldrb r0, [r0, #8]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x5a
	cmp r0, #8
	bhi _0802CE54
	lsls r0, r0, #2
	ldr r1, _0802CDDC @ =_0802CDE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CDDC: .4byte _0802CDE0
_0802CDE0: @ jump table
	.4byte _0802CE14 @ case 0
	.4byte _0802CE44 @ case 1
	.4byte _0802CE04 @ case 2
	.4byte _0802CE24 @ case 3
	.4byte _0802CE0C @ case 4
	.4byte _0802CE1A @ case 5
	.4byte _0802CE2C @ case 6
	.4byte _0802CE34 @ case 7
	.4byte _0802CE3C @ case 8
_0802CE04:
	ldr r5, _0802CE08 @ =0x00000711
	b _0802CE54
	.align 2, 0
_0802CE08: .4byte 0x00000711
_0802CE0C:
	ldr r5, _0802CE10 @ =0x00000713
	b _0802CE54
	.align 2, 0
_0802CE10: .4byte 0x00000713
_0802CE14:
	movs r5, #0xe3
	lsls r5, r5, #3
	b _0802CE54
_0802CE1A:
	ldr r5, _0802CE20 @ =0x00000714
	b _0802CE54
	.align 2, 0
_0802CE20: .4byte 0x00000714
_0802CE24:
	ldr r5, _0802CE28 @ =0x00000712
	b _0802CE54
	.align 2, 0
_0802CE28: .4byte 0x00000712
_0802CE2C:
	ldr r5, _0802CE30 @ =0x00000715
	b _0802CE54
	.align 2, 0
_0802CE30: .4byte 0x00000715
_0802CE34:
	ldr r5, _0802CE38 @ =0x00000716
	b _0802CE54
	.align 2, 0
_0802CE38: .4byte 0x00000716
_0802CE3C:
	ldr r5, _0802CE40 @ =0x00000717
	b _0802CE54
	.align 2, 0
_0802CE40: .4byte 0x00000717
_0802CE44:
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	ldr r5, _0802CE5C @ =0x0000070F
	cmp r0, #0
	beq _0802CE54
	adds r5, #1
_0802CE54:
	adds r0, r5, #0
_0802CE56:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802CE5C: .4byte 0x0000070F
