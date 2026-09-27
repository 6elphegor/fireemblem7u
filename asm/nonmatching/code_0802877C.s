	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBattleUnitWeapon
SetBattleUnitWeapon: @ 0x0802877C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08028798
	adds r0, r5, #0
	bl GetUnitEquippedWeaponSlot
	adds r4, r0, #0
_08028798:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080287B6
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetBallistaItemAt
	cmp r0, #0
	beq _080287B6
	movs r4, #8
_080287B6:
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	mov sb, r1
	cmp r4, #8
	bhi _08028894
	lsls r0, r4, #2
	ldr r1, _080287D0 @ =_080287D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080287D0: .4byte _080287D4
_080287D4: @ jump table
	.4byte _080287F8 @ case 0
	.4byte _080287F8 @ case 1
	.4byte _080287F8 @ case 2
	.4byte _080287F8 @ case 3
	.4byte _080287F8 @ case 4
	.4byte _08028812 @ case 5
	.4byte _08028830 @ case 6
	.4byte _08028850 @ case 7
	.4byte _08028870 @ case 8
_080287F8:
	adds r1, r5, #0
	adds r1, #0x51
	strb r4, [r1]
	lsls r2, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r2, r5, #0
	adds r2, #0x48
	strh r0, [r2]
	mov r8, r1
	b _080288AC
_08028812:
	adds r2, r5, #0
	adds r2, #0x51
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0802882C @ =0x0202BBB8
	ldrh r0, [r0, #0x2c]
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	mov r8, r2
	adds r4, r1, #0
	b _080288AE
	.align 2, 0
_0802882C: .4byte 0x0202BBB8
_08028830:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802884C @ =0x0203A7F4
	ldrh r1, [r0, #0x1a]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _080288AA
	.align 2, 0
_0802884C: .4byte 0x0203A7F4
_08028850:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802886C @ =0x0203A7F4
	ldrh r1, [r0, #0x1c]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _080288AA
	.align 2, 0
_0802886C: .4byte 0x0203A7F4
_08028870:
	adds r4, r5, #0
	adds r4, #0x51
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetBallistaItemAt
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
	mov r8, r4
	b _080288AC
_08028894:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0xff
	strb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	movs r0, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
_080288AA:
	mov r8, r3
_080288AC:
	adds r4, r2, #0
_080288AE:
	ldrh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r6, r5, #0
	adds r6, #0x50
	strb r0, [r6]
	ldr r7, _080288F4 @ =0x0203A3D8
	movs r0, #4
	ldrh r1, [r7]
	ands r0, r1
	cmp r0, #0
	bne _0802895A
	ldr r0, [r5, #0x4c]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08028920
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x11
	beq _0802891C
	cmp r0, #0x11
	bgt _080288F8
	cmp r0, #0x10
	beq _08028906
	b _08028920
	.align 2, 0
_080288F4: .4byte 0x0203A3D8
_080288F8:
	cmp r0, #0x99
	bne _08028920
	ldrb r7, [r7, #2]
	cmp r7, #2
	bne _08028910
	movs r0, #5
	b _0802891E
_08028906:
	ldrb r7, [r7, #2]
	cmp r7, #2
	bne _08028910
	movs r0, #6
	b _0802891E
_08028910:
	ldr r0, [r5, #0x4c]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x4c]
	b _08028920
_0802891C:
	movs r0, #7
_0802891E:
	strb r0, [r6]
_08028920:
	ldrh r0, [r4]
	ldr r1, _08028968 @ =0x0203A3D8
	ldrb r1, [r1, #2]
	bl IsItemCoveringRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028938
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08028942
_08028938:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_08028942:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	bne _0802895A
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_0802895A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028968: .4byte 0x0203A3D8
