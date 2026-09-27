	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08016428
sub_08016428: @ 0x08016428
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _08016468
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016464 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016468
	adds r0, r5, #0
	bl sub_0801878C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016468
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0801646A
	.align 2, 0
_08016464: .4byte 0x08BE222C
_08016468:
	movs r0, #0
_0801646A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08016470
sub_08016470: @ 0x08016470
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r3, #0
	movs r3, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	cmp r2, #0
	bne _0801648A
	movs r3, #1
_0801648A:
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl sub_08005588
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080164F0 @ =0x08BE222C
	adds r4, r1, r0
	ldrh r0, [r4]
	bl GetMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r1, r7, #4
	adds r0, r5, #0
	bl sub_08005590
	adds r3, r7, #0
	adds r3, #0x16
	movs r5, #1
	mov r0, r8
	cmp r0, #0
	beq _080164D0
	movs r5, #2
_080164D0:
	ldr r0, [r4, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _080164DE
	movs r2, #0xff
_080164DE:
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_080061E4
	cmp r6, #0
	bne _080164F4
	movs r1, #1
	rsbs r1, r1, #0
	b _080164F6
	.align 2, 0
_080164F0: .4byte 0x08BE222C
_080164F4:
	ldrb r1, [r4, #0x1d]
_080164F6:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004E28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801650C
sub_0801650C: @ 0x0801650C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r3, #0
	movs r3, #0
	lsls r2, r2, #0x18
	asrs r6, r2, #0x18
	cmp r6, #0
	bne _08016524
	movs r3, #1
_08016524:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r3, #0
	bl sub_08005588
	movs r0, #0xff
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080165C0 @ =0x08BE222C
	adds r5, r1, r0
	ldrh r0, [r5]
	bl GetMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r1, r7, #4
	adds r0, r4, #0
	bl sub_08005590
	movs r3, #0x14
	adds r3, r3, r7
	mov ip, r3
	movs r1, #1
	cmp r6, #0
	beq _0801656C
	movs r1, #2
_0801656C:
	ldr r0, [r5, #8]
	movs r4, #8
	ands r0, r4
	mov r3, r8
	asrs r2, r3, #8
	cmp r0, #0
	beq _0801657C
	movs r2, #0xff
_0801657C:
	mov r0, ip
	bl sub_080061E4
	adds r3, r7, #0
	adds r3, #0x1a
	movs r1, #1
	cmp r6, #0
	beq _0801658E
	movs r1, #2
_0801658E:
	ldr r0, [r5, #8]
	ands r0, r4
	movs r2, #0xff
	cmp r0, #0
	bne _0801659A
	ldrb r2, [r5, #0x14]
_0801659A:
	adds r0, r3, #0
	bl sub_080061E4
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	cmp r6, #0
	bne _080165AC
	movs r1, #1
_080165AC:
	movs r2, #0x16
	bl sub_0800615C
	mov r0, r8
	cmp r0, #0
	bne _080165C4
	movs r1, #1
	rsbs r1, r1, #0
	b _080165C6
	.align 2, 0
_080165C0: .4byte 0x08BE222C
_080165C4:
	ldrb r1, [r5, #0x1d]
_080165C6:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004E28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080165DC
sub_080165DC: @ 0x080165DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r1, #0
	bl Text_SetCursor
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801664C @ =0x08BE222C
	adds r5, r1, r0
	ldrh r0, [r5]
	bl GetMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r1, r7, #4
	adds r0, r4, #0
	bl sub_08005590
	movs r0, #0x16
	adds r0, r0, r7
	mov r8, r0
	adds r0, r4, #0
	bl sub_08005584
	adds r3, r0, #0
	ldr r0, [r5, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _08016638
	movs r2, #0xff
_08016638:
	mov r0, r8
	adds r1, r3, #0
	bl sub_080061E4
	cmp r6, #0
	bne _08016650
	movs r1, #1
	rsbs r1, r1, #0
	b _08016652
	.align 2, 0
_0801664C: .4byte 0x08BE222C
_08016650:
	ldrb r1, [r5, #0x1d]
_08016652:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004E28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08016668
sub_08016668: @ 0x08016668
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r6, r2, #0
	adds r7, r3, #0
	bl ClearText
	adds r4, r6, #0
	mov r0, r8
	adds r1, r4, #0
	bl Text_SetColor
	movs r0, #0xff
	mov r1, sb
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016714 @ =0x08BE222C
	adds r5, r1, r0
	ldrh r0, [r5]
	bl GetMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	mov r0, r8
	bl Text_DrawString
	movs r4, #0
	cmp r6, #1
	bne _080166B6
	movs r4, #1
_080166B6:
	adds r0, r7, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x16
	bl sub_0800615C
	movs r4, #1
	cmp r6, #1
	beq _080166CA
	movs r4, #2
_080166CA:
	adds r1, r7, #0
	adds r1, #0x16
	ldr r0, [r5, #8]
	movs r6, #8
	ands r0, r6
	mov r3, sb
	asrs r2, r3, #8
	cmp r0, #0
	beq _080166DE
	movs r2, #0xff
_080166DE:
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_080061E4
	adds r1, r7, #0
	adds r1, #0x1c
	ldr r0, [r5, #8]
	ands r0, r6
	movs r2, #0xff
	cmp r0, #0
	bne _080166F6
	ldrb r2, [r5, #0x14]
_080166F6:
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_080061E4
	adds r1, r7, #4
	mov r0, r8
	bl sub_08005590
	mov r0, sb
	cmp r0, #0
	bne _08016718
	movs r1, #1
	rsbs r1, r1, #0
	b _0801671A
	.align 2, 0
_08016714: .4byte 0x08BE222C
_08016718:
	ldrb r1, [r5, #0x1d]
_0801671A:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004E28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GetItemAfterUse
GetItemAfterUse: @ 0x08016730
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016758 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08016752
	ldr r0, _0801675C @ =0xFFFFFF00
	adds r2, r2, r0
	cmp r2, #0xff
	ble _08016760
_08016752:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _08016762
	.align 2, 0
_08016758: .4byte 0x08BE222C
_0801675C: .4byte 0xFFFFFF00
_08016760:
	movs r0, #0
_08016762:
	bx lr

	thumb_func_start GetUnitEquippedWeapon
GetUnitEquippedWeapon: @ 0x08016764
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_0801676A:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r1, [r4]
	adds r0, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08016786
	ldrh r0, [r4]
	b _0801678E
_08016786:
	adds r5, #1
	cmp r5, #4
	ble _0801676A
	movs r0, #0
_0801678E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetUnitEquippedWeaponSlot
GetUnitEquippedWeaponSlot: @ 0x08016794
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0801679A:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080167B6
	adds r0, r4, #0
	b _080167C0
_080167B6:
	adds r4, #1
	cmp r4, #4
	ble _0801679A
	movs r0, #1
	rsbs r0, r0, #0
_080167C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CanItemReachDistance
CanItemReachDistance: @ 0x080167C8
	adds r3, r1, #0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080167EC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	lsrs r1, r0, #4
	movs r2, #0xf
	ands r2, r0
	cmp r1, r3
	bgt _080167F0
	cmp r3, r2
	bgt _080167F0
	movs r0, #1
	b _080167F2
	.align 2, 0
_080167EC: .4byte 0x08BE222C
_080167F0:
	movs r0, #0
_080167F2:
	bx lr

	thumb_func_start UnitEquipItemSlot
UnitEquipItemSlot: @ 0x080167F4
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r4, r1, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	adds r2, r1, #0
	cmp r2, #0
	beq _08016818
	adds r0, r4, #0
	adds r0, #0x1c
	adds r1, r0, r3
_0801680C:
	ldrh r0, [r1]
	strh r0, [r1, #2]
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bne _0801680C
_08016818:
	strh r5, [r3, #0x1e]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start IsItemEffectiveAgainst
IsItemEffectiveAgainst: @ 0x08016820
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r7, #4]
	ldrb r3, [r0, #4]
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016844 @ =0x08BE222C
	adds r0, r0, r1
	ldr r2, [r0, #0x10]
	adds r5, r1, #0
	cmp r2, #0
	beq _080168A4
	b _08016850
	.align 2, 0
_08016844: .4byte 0x08BE222C
_08016848:
	ldrb r0, [r2]
	cmp r0, r3
	beq _08016858
	adds r2, #1
_08016850:
	ldrb r0, [r2]
	cmp r0, #0
	bne _08016848
	b _080168A4
_08016858:
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0, #0x10]
	ldr r0, _080168A0 @ =0x08C97ED2
	cmp r1, r0
	bne _0801689A
	movs r3, #0
	movs r6, #0xff
	adds r2, r7, #0
	adds r2, #0x1e
	movs r4, #4
_08016876:
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r0, [r1, #8]
	orrs r3, r0
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bge _08016876
	movs r0, #0x80
	lsls r0, r0, #7
	ands r3, r0
	cmp r3, #0
	bne _080168A4
_0801689A:
	movs r0, #1
	b _080168A6
	.align 2, 0
_080168A0: .4byte 0x08C97ED2
_080168A4:
	movs r0, #0
_080168A6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetItemRangeString
GetItemRangeString: @ 0x080168AC
	push {r4, r5, lr}
	sub sp, #0x28
	mov r2, sp
	ldr r1, _080168EC @ =0x081C3AF0
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080168F0 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	adds r1, r0, #0
	cmp r0, #0x22
	beq _08016926
	cmp r0, #0x22
	bgt _080168FE
	cmp r0, #0x11
	beq _0801691A
	cmp r0, #0x11
	bgt _080168F4
	cmp r0, #0x10
	beq _08016916
	b _0801693A
	.align 2, 0
_080168EC: .4byte 0x081C3AF0
_080168F0: .4byte 0x08BE222C
_080168F4:
	cmp r0, #0x12
	beq _0801691E
	cmp r0, #0x13
	beq _08016922
	b _0801693A
_080168FE:
	cmp r0, #0x3a
	beq _0801692E
	cmp r0, #0x3a
	bgt _0801690C
	cmp r0, #0x23
	beq _0801692A
	b _0801693A
_0801690C:
	cmp r1, #0x3f
	beq _08016932
	cmp r1, #0xff
	beq _08016936
	b _0801693A
_08016916:
	ldr r0, [sp]
	b _0801693C
_0801691A:
	ldr r0, [sp, #4]
	b _0801693C
_0801691E:
	ldr r0, [sp, #8]
	b _0801693C
_08016922:
	ldr r0, [sp, #0xc]
	b _0801693C
_08016926:
	ldr r0, [sp, #0x10]
	b _0801693C
_0801692A:
	ldr r0, [sp, #0x14]
	b _0801693C
_0801692E:
	ldr r0, [sp, #0x18]
	b _0801693C
_08016932:
	ldr r0, [sp, #0x1c]
	b _0801693C
_08016936:
	ldr r0, [sp, #0x20]
	b _0801693C
_0801693A:
	ldr r0, [sp, #0x24]
_0801693C:
	bl GetMsg
	add sp, #0x28
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start GetWeaponLevelFromExp
GetWeaponLevelFromExp: @ 0x08016948
	cmp r0, #0
	bgt _08016950
	movs r0, #0
	b _0801697A
_08016950:
	cmp r0, #0x1e
	bgt _08016958
	movs r0, #1
	b _0801697A
_08016958:
	cmp r0, #0x46
	bgt _08016960
	movs r0, #2
	b _0801697A
_08016960:
	cmp r0, #0x78
	bgt _08016968
	movs r0, #3
	b _0801697A
_08016968:
	cmp r0, #0xb4
	bgt _08016970
	movs r0, #4
	b _0801697A
_08016970:
	cmp r0, #0xfa
	ble _08016978
	movs r0, #6
	b _0801697A
_08016978:
	movs r0, #5
_0801697A:
	bx lr

	thumb_func_start GetWeaponLevelStringFromExp
GetWeaponLevelStringFromExp: @ 0x0801697C
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _080169B8 @ =0x081C3B18
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080169BC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r4, [r1, #0x1c]
	ldr r0, [r1, #8]
	ldr r1, _080169C0 @ =0x003D3C00
	ands r0, r1
	cmp r0, #0
	beq _080169C4
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	cmp r0, #0
	bne _080169C4
	movs r4, #7
	b _080169CC
	.align 2, 0
_080169B8: .4byte 0x081C3B18
_080169BC: .4byte 0x08BE222C
_080169C0: .4byte 0x003D3C00
_080169C4:
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	adds r4, r0, #0
_080169CC:
	lsls r0, r4, #2
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetWeaponLevelSpecialCharFromExp
GetWeaponLevelSpecialCharFromExp: @ 0x080169E0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08016A04 @ =0x081C3B38
	mov r0, sp
	movs r2, #7
	bl memcpy
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	add r0, sp
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016A04: .4byte 0x081C3B38

	thumb_func_start GetItemKindString
GetItemKindString: @ 0x08016A08
	push {r4, r5, lr}
	sub sp, #0x2c
	mov r2, sp
	ldr r1, _08016A34 @ =0x081C3B40
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	add sp, #0x2c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08016A34: .4byte 0x081C3B40

	thumb_func_start sub_08016A38
sub_08016A38: @ 0x08016A38
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl GetWeaponLevelFromExp
	cmp r0, #6
	bhi _08016AAA
	lsls r0, r0, #2
	ldr r1, _08016A54 @ =_08016A58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016A54: .4byte _08016A58
_08016A58: @ jump table
	.4byte _08016AA4 @ case 0
	.4byte _08016A74 @ case 1
	.4byte _08016A7C @ case 2
	.4byte _08016A86 @ case 3
	.4byte _08016A90 @ case 4
	.4byte _08016A9A @ case 5
	.4byte _08016AA4 @ case 6
_08016A74:
	subs r0, r5, #1
	str r0, [r4]
	movs r0, #0x1e
	b _08016AA8
_08016A7C:
	adds r0, r5, #0
	subs r0, #0x1f
	str r0, [r4]
	movs r0, #0x28
	b _08016AA8
_08016A86:
	adds r0, r5, #0
	subs r0, #0x47
	str r0, [r4]
	movs r0, #0x32
	b _08016AA8
_08016A90:
	adds r0, r5, #0
	subs r0, #0x79
	str r0, [r4]
	movs r0, #0x3c
	b _08016AA8
_08016A9A:
	adds r0, r5, #0
	subs r0, #0xb5
	str r0, [r4]
	movs r0, #0x46
	b _08016AA8
_08016AA4:
	movs r0, #0
	str r0, [r4]
_08016AA8:
	str r0, [r6]
_08016AAA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start IsItemDisplayUseable
IsItemDisplayUseable: @ 0x08016AB0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r5, #0xff
	ands r5, r2
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08016AD8 @ =0x08BE222C
	adds r4, r0, r1
	ldr r1, [r4, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016ADC
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseWeapon
	b _08016AEC
	.align 2, 0
_08016AD8: .4byte 0x08BE222C
_08016ADC:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08016AF2
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseStaff
_08016AEC:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08016B26
_08016AF2:
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08016B24
	adds r0, r3, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08016B20
	cmp r1, #4
	beq _08016B20
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08016B24
	cmp r5, #0x6a
	bne _08016B24
_08016B20:
	movs r0, #0
	b _08016B26
_08016B24:
	movs r0, #1
_08016B26:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08016B2C
sub_08016B2C: @ 0x08016B2C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016B54 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08016B58
	adds r0, r3, #0
	adds r1, r2, #0
	bl sub_08026CD0
	b _08016B60
	.align 2, 0
_08016B54: .4byte 0x08BE222C
_08016B58:
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseWeapon
_08016B60:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start GetUnitItemHealAmount
GetUnitItemHealAmount: @ 0x08016B68
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r4, #0
	movs r0, #0xff
	ands r0, r2
	subs r0, #0x4a
	cmp r0, #0x50
	bls _08016B7C
	b _08016CDA
_08016B7C:
	lsls r0, r0, #2
	ldr r1, _08016B88 @ =_08016B8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016B88: .4byte _08016B8C
_08016B8C: @ jump table
	.4byte _08016CD0 @ case 0
	.4byte _08016CD4 @ case 1
	.4byte _08016CD8 @ case 2
	.4byte _08016CD0 @ case 3
	.4byte _08016CD0 @ case 4
	.4byte _08016CDA @ case 5
	.4byte _08016CDA @ case 6
	.4byte _08016CDA @ case 7
	.4byte _08016CDA @ case 8
	.4byte _08016CDA @ case 9
	.4byte _08016CDA @ case 10
	.4byte _08016CDA @ case 11
	.4byte _08016CDA @ case 12
	.4byte _08016CDA @ case 13
	.4byte _08016CDA @ case 14
	.4byte _08016CDA @ case 15
	.4byte _08016CDA @ case 16
	.4byte _08016CDA @ case 17
	.4byte _08016CDA @ case 18
	.4byte _08016CDA @ case 19
	.4byte _08016CDA @ case 20
	.4byte _08016CDA @ case 21
	.4byte _08016CDA @ case 22
	.4byte _08016CDA @ case 23
	.4byte _08016CDA @ case 24
	.4byte _08016CDA @ case 25
	.4byte _08016CDA @ case 26
	.4byte _08016CDA @ case 27
	.4byte _08016CDA @ case 28
	.4byte _08016CDA @ case 29
	.4byte _08016CDA @ case 30
	.4byte _08016CDA @ case 31
	.4byte _08016CDA @ case 32
	.4byte _08016CD0 @ case 33
	.4byte _08016CD8 @ case 34
	.4byte _08016CDA @ case 35
	.4byte _08016CDA @ case 36
	.4byte _08016CDA @ case 37
	.4byte _08016CDA @ case 38
	.4byte _08016CDA @ case 39
	.4byte _08016CDA @ case 40
	.4byte _08016CDA @ case 41
	.4byte _08016CDA @ case 42
	.4byte _08016CDA @ case 43
	.4byte _08016CDA @ case 44
	.4byte _08016CDA @ case 45
	.4byte _08016CDA @ case 46
	.4byte _08016CDA @ case 47
	.4byte _08016CDA @ case 48
	.4byte _08016CDA @ case 49
	.4byte _08016CDA @ case 50
	.4byte _08016CDA @ case 51
	.4byte _08016CDA @ case 52
	.4byte _08016CDA @ case 53
	.4byte _08016CDA @ case 54
	.4byte _08016CDA @ case 55
	.4byte _08016CDA @ case 56
	.4byte _08016CDA @ case 57
	.4byte _08016CDA @ case 58
	.4byte _08016CDA @ case 59
	.4byte _08016CDA @ case 60
	.4byte _08016CDA @ case 61
	.4byte _08016CDA @ case 62
	.4byte _08016CDA @ case 63
	.4byte _08016CDA @ case 64
	.4byte _08016CDA @ case 65
	.4byte _08016CDA @ case 66
	.4byte _08016CDA @ case 67
	.4byte _08016CDA @ case 68
	.4byte _08016CDA @ case 69
	.4byte _08016CDA @ case 70
	.4byte _08016CDA @ case 71
	.4byte _08016CDA @ case 72
	.4byte _08016CDA @ case 73
	.4byte _08016CDA @ case 74
	.4byte _08016CDA @ case 75
	.4byte _08016CDA @ case 76
	.4byte _08016CDA @ case 77
	.4byte _08016CDA @ case 78
	.4byte _08016CDA @ case 79
	.4byte _08016CD0 @ case 80
_08016CD0:
	movs r4, #0xa
	b _08016CDA
_08016CD4:
	movs r4, #0x14
	b _08016CDA
_08016CD8:
	movs r4, #0x50
_08016CDA:
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016D08 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016D00
	adds r0, r3, #0
	bl GetUnitPower
	adds r4, r4, r0
	cmp r4, #0x50
	ble _08016D00
	movs r4, #0x50
_08016D00:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016D08: .4byte 0x08BE222C

	thumb_func_start FindUnitItemSlot
FindUnitItemSlot: @ 0x08016D0C
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0xff
	adds r2, r0, #0
	adds r2, #0x1e
_08016D16:
	adds r0, r4, #0
	ldrh r5, [r2]
	ands r0, r5
	cmp r0, r1
	bne _08016D24
	adds r0, r3, #0
	b _08016D30
_08016D24:
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _08016D16
	movs r0, #1
	rsbs r0, r0, #0
_08016D30:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start IsItemStealable
IsItemStealable: @ 0x08016D38
	adds r1, r0, #0
	cmp r1, #0
	bne _08016D42
	movs r1, #0xff
	b _08016D52
_08016D42:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016D5C @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08016D52:
	movs r0, #0
	cmp r1, #9
	bne _08016D5A
	movs r0, #1
_08016D5A:
	bx lr
	.align 2, 0
_08016D5C: .4byte 0x08BE222C

	thumb_func_start IsItemRepairable
IsItemRepairable: @ 0x08016D60
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08016DAC
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016DA8 @ =0x08BE222C
	adds r1, r1, r0
	ldr r2, [r1, #8]
	movs r0, #5
	ands r0, r2
	cmp r0, #0
	beq _08016DAC
	movs r0, #0xc1
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08016DAC
	movs r3, #8
	ands r3, r2
	asrs r0, r4, #8
	cmp r3, #0
	beq _08016D96
	movs r0, #0xff
_08016D96:
	movs r2, #0xff
	cmp r3, #0
	bne _08016D9E
	ldrb r2, [r1, #0x14]
_08016D9E:
	cmp r0, r2
	beq _08016DAC
	movs r0, #1
	b _08016DAE
	.align 2, 0
_08016DA8: .4byte 0x08BE222C
_08016DAC:
	movs r0, #0
_08016DAE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetItemReach
GetItemReach: @ 0x08016DB4
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016DD4 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	subs r0, #0x11
	cmp r0, #0x2e
	bhi _08016EB8
	lsls r0, r0, #2
	ldr r1, _08016DD8 @ =_08016DDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016DD4: .4byte 0x08BE222C
_08016DD8: .4byte _08016DDC
_08016DDC: @ jump table
	.4byte _08016E98 @ case 0
	.4byte _08016E9C @ case 1
	.4byte _08016EA0 @ case 2
	.4byte _08016EB8 @ case 3
	.4byte _08016EB8 @ case 4
	.4byte _08016EB8 @ case 5
	.4byte _08016EB8 @ case 6
	.4byte _08016EB8 @ case 7
	.4byte _08016EB8 @ case 8
	.4byte _08016EB8 @ case 9
	.4byte _08016EB8 @ case 10
	.4byte _08016EB8 @ case 11
	.4byte _08016EB8 @ case 12
	.4byte _08016EB8 @ case 13
	.4byte _08016EB8 @ case 14
	.4byte _08016EB8 @ case 15
	.4byte _08016EB8 @ case 16
	.4byte _08016EA4 @ case 17
	.4byte _08016EA8 @ case 18
	.4byte _08016EB8 @ case 19
	.4byte _08016EB8 @ case 20
	.4byte _08016EB8 @ case 21
	.4byte _08016EB8 @ case 22
	.4byte _08016EB8 @ case 23
	.4byte _08016EB8 @ case 24
	.4byte _08016EB8 @ case 25
	.4byte _08016EB8 @ case 26
	.4byte _08016EB8 @ case 27
	.4byte _08016EB8 @ case 28
	.4byte _08016EB8 @ case 29
	.4byte _08016EB8 @ case 30
	.4byte _08016EB8 @ case 31
	.4byte _08016EB8 @ case 32
	.4byte _08016EB8 @ case 33
	.4byte _08016EAC @ case 34
	.4byte _08016EB8 @ case 35
	.4byte _08016EB8 @ case 36
	.4byte _08016EB8 @ case 37
	.4byte _08016EB8 @ case 38
	.4byte _08016EB8 @ case 39
	.4byte _08016EB8 @ case 40
	.4byte _08016EB0 @ case 41
	.4byte _08016EB8 @ case 42
	.4byte _08016EB8 @ case 43
	.4byte _08016EB8 @ case 44
	.4byte _08016EB8 @ case 45
	.4byte _08016EB4 @ case 46
_08016E98:
	movs r0, #1
	b _08016EBA
_08016E9C:
	movs r0, #3
	b _08016EBA
_08016EA0:
	movs r0, #7
	b _08016EBA
_08016EA4:
	movs r0, #2
	b _08016EBA
_08016EA8:
	movs r0, #6
	b _08016EBA
_08016EAC:
	movs r0, #4
	b _08016EBA
_08016EB0:
	movs r0, #0xc
	b _08016EBA
_08016EB4:
	movs r0, #0x14
	b _08016EBA
_08016EB8:
	movs r0, #0
_08016EBA:
	bx lr

	thumb_func_start GetUnitWeaponReach
GetUnitWeaponReach: @ 0x08016EBC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
	cmp r1, #0
	blt _08016ED4
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemReach
	b _08016F08
_08016ED4:
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _08016F06
_08016EDC:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016EF2
	adds r0, r4, #0
	bl GetItemReach
	orrs r7, r0
_08016EF2:
	adds r5, #1
	cmp r5, #4
	bgt _08016F06
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08016EDC
_08016F06:
	adds r0, r7, #0
_08016F08:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08016F10
sub_08016F10: @ 0x08016F10
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	cmp r1, #0
	blt _08016F54
	lsls r0, r1, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08026CD0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016FC2
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016F50 @ =0x08BE222C
	adds r1, r1, r0
	movs r6, #0xf
	ldrb r1, [r1, #0x19]
	ands r6, r1
	cmp r6, #0
	bne _08016F9E
	movs r6, #0x63
	b _08016F9E
	.align 2, 0
_08016F50: .4byte 0x08BE222C
_08016F54:
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08016F9E
_08016F5C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08026CD0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016F8A
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016FAC @ =0x08BE222C
	adds r1, r1, r0
	movs r4, #0xf
	ldrb r1, [r1, #0x19]
	ands r4, r1
	cmp r4, #0
	bne _08016F84
	movs r4, #0x63
_08016F84:
	cmp r6, r4
	bge _08016F8A
	adds r6, r4, #0
_08016F8A:
	adds r7, #1
	cmp r7, #4
	bgt _08016F9E
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08016F5C
_08016F9E:
	cmp r6, #2
	beq _08016FBA
	cmp r6, #2
	bgt _08016FB0
	cmp r6, #1
	beq _08016FB6
	b _08016FC2
	.align 2, 0
_08016FAC: .4byte 0x08BE222C
_08016FB0:
	cmp r6, #0x63
	beq _08016FBE
	b _08016FC2
_08016FB6:
	movs r0, #1
	b _08016FC4
_08016FBA:
	movs r0, #3
	b _08016FC4
_08016FBE:
	movs r0, #0x20
	b _08016FC4
_08016FC2:
	movs r0, #0
_08016FC4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08016FCC
sub_08016FCC: @ 0x08016FCC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	movs r5, #0
	ldrh r4, [r7, #0x1e]
	cmp r4, #0
	beq _0801701C
_08016FDA:
	adds r0, r7, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08017008
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801702C @ =0x08BE222C
	adds r1, r1, r0
	movs r4, #0xf
	ldrb r1, [r1, #0x19]
	ands r4, r1
	cmp r4, #0
	bne _08017002
	movs r4, #0x63
_08017002:
	cmp r6, r4
	bge _08017008
	adds r6, r4, #0
_08017008:
	adds r5, #1
	cmp r5, #4
	bgt _0801701C
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08016FDA
_0801701C:
	cmp r6, #2
	beq _0801703A
	cmp r6, #2
	bgt _08017030
	cmp r6, #1
	beq _08017036
	b _08017042
	.align 2, 0
_0801702C: .4byte 0x08BE222C
_08017030:
	cmp r6, #0x63
	beq _0801703E
	b _08017042
_08017036:
	movs r0, #1
	b _08017044
_0801703A:
	movs r0, #3
	b _08017044
_0801703E:
	movs r0, #0x20
	b _08017044
_08017042:
	movs r0, #0
_08017044:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801704C
sub_0801704C: @ 0x0801704C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl sub_0802E700
	adds r3, r0, #0
	movs r5, #0
	ldrh r0, [r3]
	cmp r0, #0
	beq _08017096
	ldr r7, _0801707C @ =0x08BE222C
_08017060:
	ldrh r4, [r3]
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017080
	ldrh r0, [r2, #0x1a]
	b _08017086
	.align 2, 0
_0801707C: .4byte 0x08BE222C
_08017080:
	asrs r0, r4, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_08017086:
	adds r6, r6, r0
	adds r3, #2
	adds r5, #1
	cmp r5, #0x63
	bgt _08017096
	ldrh r0, [r3]
	cmp r0, #0
	bne _08017060
_08017096:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080170A0
sub_080170A0: @ 0x080170A0
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	movs r4, #1
_080170A6:
	adds r0, r4, #0
	bl GetUnit
	mov ip, r0
	adds r6, r4, #1
	cmp r0, #0
	beq _08017110
	ldr r0, [r0]
	cmp r0, #0
	beq _08017110
	mov r1, ip
	ldr r0, [r1, #0xc]
	ldr r1, _080170EC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08017110
	movs r4, #0
	mov r0, ip
	ldrh r3, [r0, #0x1e]
	cmp r3, #0
	beq _08017110
	ldr r7, _080170F0 @ =0x08BE222C
_080170D2:
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080170F4
	ldrh r0, [r2, #0x1a]
	b _080170FA
	.align 2, 0
_080170EC: .4byte 0x00010004
_080170F0: .4byte 0x08BE222C
_080170F4:
	asrs r0, r3, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_080170FA:
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #4
	bgt _08017110
	lsls r1, r4, #1
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r3, [r0]
	cmp r3, #0
	bne _080170D2
_08017110:
	adds r4, r6, #0
	cmp r4, #0x3f
	ble _080170A6
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017120
sub_08017120: @ 0x08017120
	push {r4, lr}
	bl sub_0801704C
	adds r4, r0, #0
	bl sub_080170A0
	adds r4, r4, r0
	bl GetGold
	adds r4, r4, r0
	ldr r0, _08017144 @ =0x0098967F
	cmp r4, r0
	ble _0801713C
	adds r4, r0, #0
_0801713C:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08017144: .4byte 0x0098967F

	thumb_func_start BreakItemSealForPid
BreakItemSealForPid: @ 0x08017148
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r2, #0
	bne _08017156
	movs r1, #0xff
	b _08017166
_08017156:
	movs r0, #0xff
	ands r0, r2
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017170 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08017166:
	ldr r0, _08017174 @ =0x0202BBF8
	adds r0, #0x1c
	adds r0, r1, r0
	strb r3, [r0]
	bx lr
	.align 2, 0
_08017170: .4byte 0x08BE222C
_08017174: .4byte 0x0202BBF8

	thumb_func_start sub_08017178
sub_08017178: @ 0x08017178
	adds r3, r0, #0
	cmp r1, #0
	bne _08017182
	movs r1, #0xff
	b _08017192
_08017182:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080171AC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08017192:
	ldr r0, _080171B0 @ =0x0202BBF8
	adds r0, #0x1c
	adds r0, r1, r0
	movs r2, #0
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _080171A6
	movs r2, #1
_080171A6:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_080171AC: .4byte 0x08BE222C
_080171B0: .4byte 0x0202BBF8

	thumb_func_start GetItemIid
GetItemIid: @ 0x080171B4
	adds r1, r0, #0
	movs r0, #0xff
	ands r0, r1
	bx lr

	thumb_func_start GetItemName
GetItemName: @ 0x080171BC
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080171E0 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	pop {r1}
	bx r1
	.align 2, 0
_080171E0: .4byte 0x08BE222C

	thumb_func_start GetItemNameWithArticle
GetItemNameWithArticle: @ 0x080171E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0xff
	ands r5, r4
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08017228 @ =0x08BE222C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	rsbs r1, r1, #0
	lsrs r1, r1, #0x1f
	cmp r5, #0x36
	bgt _08017218
	cmp r5, #0x34
	blt _08017218
	movs r1, #1
_08017218:
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	movs r0, #1
	bl sub_08012F14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017228: .4byte 0x08BE222C

	thumb_func_start sub_0801722C
sub_0801722C: @ 0x0801722C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017240 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_08017240: .4byte 0x08BE222C

	thumb_func_start sub_08017244
sub_08017244: @ 0x08017244
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017258 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	bx lr
	.align 2, 0
_08017258: .4byte 0x08BE222C

	thumb_func_start GetItemKind
GetItemKind: @ 0x0801725C
	cmp r0, #0
	beq _08017278
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017274 @ =0x08BE222C
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	b _0801727A
	.align 2, 0
_08017274: .4byte 0x08BE222C
_08017278:
	movs r0, #0xff
_0801727A:
	bx lr

	thumb_func_start GetItemAttributes
GetItemAttributes: @ 0x0801727C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017290 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08017290: .4byte 0x08BE222C

	thumb_func_start GetItemUses
GetItemUses: @ 0x08017294
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080172B4 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080172B8
	asrs r0, r2, #8
	b _080172BA
	.align 2, 0
_080172B4: .4byte 0x08BE222C
_080172B8:
	movs r0, #0xff
_080172BA:
	bx lr

	thumb_func_start GetItemMaxUses
GetItemMaxUses: @ 0x080172BC
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080172D8 @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080172DC
	ldrb r0, [r2, #0x14]
	b _080172DE
	.align 2, 0
_080172D8: .4byte 0x08BE222C
_080172DC:
	movs r0, #0xff
_080172DE:
	bx lr

	thumb_func_start GetItemMight
GetItemMight: @ 0x080172E0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080172F4 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x15]
	bx lr
	.align 2, 0
_080172F4: .4byte 0x08BE222C

	thumb_func_start sub_080172F8
sub_080172F8: @ 0x080172F8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801730C @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x16]
	bx lr
	.align 2, 0
_0801730C: .4byte 0x08BE222C

	thumb_func_start sub_08017310
sub_08017310: @ 0x08017310
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017324 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x17]
	bx lr
	.align 2, 0
_08017324: .4byte 0x08BE222C

	thumb_func_start sub_08017328
sub_08017328: @ 0x08017328
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801733C @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0801733C: .4byte 0x08BE222C

	thumb_func_start sub_08017340
sub_08017340: @ 0x08017340
	adds r3, r0, #0
	movs r0, #0xff
	ands r0, r3
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017360 @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017364
	ldrh r0, [r2, #0x1a]
	b _0801736A
	.align 2, 0
_08017360: .4byte 0x08BE222C
_08017364:
	asrs r0, r3, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_0801736A:
	bx lr

	thumb_func_start sub_0801736C
sub_0801736C: @ 0x0801736C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017380 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #0x19]
	lsrs r0, r1, #4
	bx lr
	.align 2, 0
_08017380: .4byte 0x08BE222C

	thumb_func_start sub_08017384
sub_08017384: @ 0x08017384
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801739C @ =0x08BE222C
	adds r1, r1, r0
	movs r0, #0xf
	ldrb r1, [r1, #0x19]
	ands r0, r1
	bx lr
	.align 2, 0
_0801739C: .4byte 0x08BE222C

	thumb_func_start sub_080173A0
sub_080173A0: @ 0x080173A0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173B4 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	bx lr
	.align 2, 0
_080173B4: .4byte 0x08BE222C

	thumb_func_start sub_080173B8
sub_080173B8: @ 0x080173B8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173CC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_080173CC: .4byte 0x08BE222C

	thumb_func_start sub_080173D0
sub_080173D0: @ 0x080173D0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173E4 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0x10]
	bx lr
	.align 2, 0
_080173E4: .4byte 0x08BE222C

	thumb_func_start GetItemBonuses
GetItemBonuses: @ 0x080173E8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173FC @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	bx lr
	.align 2, 0
_080173FC: .4byte 0x08BE222C

	thumb_func_start GetItemIcon
GetItemIcon: @ 0x08017400
	cmp r0, #0
	beq _0801741C
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017418 @ =0x08BE222C
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	b _08017420
	.align 2, 0
_08017418: .4byte 0x08BE222C
_0801741C:
	movs r0, #1
	rsbs r0, r0, #0
_08017420:
	bx lr
	.align 2, 0

	thumb_func_start GetItemWeaponEffect
GetItemWeaponEffect: @ 0x08017424
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017438 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x1f]
	bx lr
	.align 2, 0
_08017438: .4byte 0x08BE222C

	thumb_func_start GetItemEffect
GetItemEffect: @ 0x0801743C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017450 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x1e]
	bx lr
	.align 2, 0
_08017450: .4byte 0x08BE222C

	thumb_func_start GetItemCostPerUse
GetItemCostPerUse: @ 0x08017454
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017468 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1, #0x1a]
	bx lr
	.align 2, 0
_08017468: .4byte 0x08BE222C

	thumb_func_start GetItemMaxValue
GetItemMaxValue: @ 0x0801746C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017490 @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	movs r1, #0xff
	cmp r0, #0
	bne _08017488
	ldrb r1, [r2, #0x14]
_08017488:
	ldrh r2, [r2, #0x1a]
	adds r0, r2, #0
	muls r0, r1, r0
	bx lr
	.align 2, 0
_08017490: .4byte 0x08BE222C

	thumb_func_start sub_08017494
sub_08017494: @ 0x08017494
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080174A8 @ =0x08BE222C
	adds r1, r1, r0
	adds r1, #0x20
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080174A8: .4byte 0x08BE222C

	thumb_func_start GetIInfo
GetIInfo: @ 0x080174AC
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080174BC @ =0x08BE222C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080174BC: .4byte 0x08BE222C

	thumb_func_start sub_080174C0
sub_080174C0: @ 0x080174C0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080174D4 @ =0x08BE222C
	adds r1, r1, r0
	adds r1, #0x21
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080174D4: .4byte 0x08BE222C

	thumb_func_start sub_080174D8
sub_080174D8: @ 0x080174D8
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _08017504 @ =0x08B92EB0
	movs r6, #0xff
_080174E0:
	adds r0, r5, #0
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r4, [r0]
	cmp r4, #0
	beq _080174F6
	adds r0, r4, #0
	bl ClearUnit
	strb r5, [r4, #0xb]
_080174F6:
	adds r5, #1
	cmp r5, #0xff
	ble _080174E0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017504: .4byte 0x08B92EB0

	thumb_func_start ClearUnit
ClearUnit: @ 0x08017508
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r5, [r4, #0xb]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0801752C @ =0x01000024
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #0xb]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801752C: .4byte 0x01000024

	thumb_func_start sub_08017530
sub_08017530: @ 0x08017530
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrb r5, [r4, #0xb]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x48
	bl memcpy
	strb r5, [r4, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801754C
sub_0801754C: @ 0x0801754C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r3, #0x40
	adds r2, r0, #1
	cmp r2, r3
	bge _0801757A
	ldr r5, _08017570 @ =0x08B92EB0
	movs r4, #0xff
_0801755C:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _08017574
	adds r0, r1, #0
	b _0801757C
	.align 2, 0
_08017570: .4byte 0x08B92EB0
_08017574:
	adds r2, #1
	cmp r2, r3
	blt _0801755C
_0801757A:
	movs r0, #0
_0801757C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017584
sub_08017584: @ 0x08017584
	push {r4, r5, lr}
	movs r5, #0x40
	ldrb r4, [r0]
	bl GetLeaderPid
	movs r2, #1
	ldr r4, _080175A8 @ =0x08B92EB0
	movs r3, #0xff
_08017594:
	adds r0, r2, #0
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _080175AC
	adds r0, r1, #0
	b _080175B4
	.align 2, 0
_080175A8: .4byte 0x08B92EB0
_080175AC:
	adds r2, #1
	cmp r2, r5
	blt _08017594
	movs r0, #0
_080175B4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080175BC
sub_080175BC: @ 0x080175BC
	adds r2, r0, #0
	ldr r0, _080175E4 @ =0x0202BBF8
	ldrb r3, [r0, #0xd]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080175D6
	adds r3, #5
_080175D6:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r3, r0
	bx lr
	.align 2, 0
_080175E4: .4byte 0x0202BBF8

	thumb_func_start SetUnitStatus
SetUnitStatus: @ 0x080175E8
	adds r2, r1, #0
	cmp r2, #0
	bne _080175F2
	adds r0, #0x30
	b _080175FC
_080175F2:
	adds r0, #0x30
	movs r1, #0xf
	ands r2, r1
	movs r1, #0x50
	orrs r2, r1
_080175FC:
	strb r2, [r0]
	bx lr

	thumb_func_start sub_08017600
sub_08017600: @ 0x08017600
	adds r0, #0x30
	movs r3, #0xf
	lsls r2, r2, #4
	ands r1, r3
	orrs r2, r1
	strb r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08017610
sub_08017610: @ 0x08017610
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017626
	ldr r0, [r2, #4]
	ldrb r0, [r0, #6]
	b _08017650
_08017626:
	ldrb r0, [r2, #0x1c]
	bl GetTrap
	ldrb r0, [r0, #3]
	cmp r0, #0x35
	beq _08017646
	cmp r0, #0x35
	bgt _0801763C
	cmp r0, #0x34
	beq _08017642
	b _0801764E
_0801763C:
	cmp r0, #0x36
	beq _0801764A
	b _0801764E
_08017642:
	movs r0, #0x4f
	b _08017650
_08017646:
	movs r0, #0x50
	b _08017650
_0801764A:
	movs r0, #0x51
	b _08017650
_0801764E:
	movs r0, #0
_08017650:
	pop {r1}
	bx r1

	thumb_func_start sub_08017654
sub_08017654: @ 0x08017654
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x1e
_0801765A:
	ldrh r0, [r2]
	cmp r0, #0
	bne _08017666
	strh r1, [r2]
	movs r0, #1
	b _08017670
_08017666:
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _0801765A
	movs r0, #0
_08017670:
	bx lr
	.align 2, 0

	thumb_func_start sub_08017674
sub_08017674: @ 0x08017674
	movs r2, #0
	movs r1, #4
	adds r0, #0x26
_0801767A:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _0801767A
	bx lr
	.align 2, 0

	thumb_func_start UnitRemoveInvalidItems
UnitRemoveInvalidItems: @ 0x08017688
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r2, sp
	movs r3, #0
	adds r5, r0, #0
	adds r5, #0x1e
	adds r4, r5, #0
	movs r6, #0
_08017698:
	lsls r0, r3, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080176A6
	strh r0, [r2]
	adds r2, #2
_080176A6:
	strh r6, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _08017698
	movs r0, #0
	strh r0, [r2]
	movs r3, #0
	adds r4, r5, #0
_080176BA:
	lsls r2, r3, #1
	mov r1, sp
	adds r0, r1, r2
	ldrh r1, [r0]
	cmp r1, #0
	beq _080176D4
	adds r0, r4, r2
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _080176BA
_080176D4:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080176DC
sub_080176DC: @ 0x080176DC
	movs r2, #4
	adds r1, r0, #0
	adds r1, #0x26
_080176E2:
	ldrh r0, [r1]
	cmp r0, #0
	beq _080176EC
	adds r0, r2, #1
	b _080176F6
_080176EC:
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080176E2
	movs r0, #0
_080176F6:
	bx lr

	thumb_func_start sub_080176F8
sub_080176F8: @ 0x080176F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemIid
	adds r5, r0, #0
	movs r6, #0
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _0801772C
	adds r4, #0x1e
_08017710:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, r5
	bne _0801771E
	movs r0, #1
	b _0801772E
_0801771E:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	bgt _0801772C
	ldrh r0, [r4]
	cmp r0, #0
	bne _08017710
_0801772C:
	movs r0, #0
_0801772E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08017734
sub_08017734: @ 0x08017734
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _08017746
_0801773C:
	adds r0, r4, #0
	bl CreateUnit
	adds r4, #0x10
	adds r5, #1
_08017746:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801773C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08017754
sub_08017754: @ 0x08017754
	adds r2, r0, #0
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017766
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x14]
_08017766:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017776
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x17]
_08017776:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017786
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x18]
_08017786:
	bx lr

	thumb_func_start CreateUnit
CreateUnit: @ 0x08017788
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldrb r1, [r5, #3]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080177B4
	cmp r0, #1
	bgt _080177A2
	cmp r0, #0
	beq _080177A8
	b _080177BC
_080177A2:
	cmp r0, #2
	beq _080177B0
	b _080177BC
_080177A8:
	adds r0, r5, #0
	bl sub_08017584
	b _080177BA
_080177B0:
	movs r0, #0x80
	b _080177B6
_080177B4:
	movs r0, #0x40
_080177B6:
	bl sub_0801754C
_080177BA:
	adds r4, r0, #0
_080177BC:
	cmp r4, #0
	bne _080177C4
	movs r0, #0
	b _08017862
_080177C4:
	adds r0, r4, #0
	bl ClearUnit
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08017868
	ldr r1, [r4]
	adds r0, r4, #0
	bl sub_08017930
	adds r0, r4, #0
	bl sub_0802BE14
	movs r0, #1
	ldrb r1, [r5, #3]
	ands r0, r1
	cmp r0, #0
	beq _0801781A
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08017804
	adds r0, r4, #0
	bl sub_08017BC0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08017A1C
	b _0801781A
_08017804:
	adds r0, r4, #0
	bl sub_08017B80
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08017A1C
	ldrb r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x38
	strb r1, [r0]
_0801781A:
	adds r0, r4, #0
	bl sub_080179BC
	adds r0, r4, #0
	bl sub_080179F0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08017844
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_08017844:
	adds r0, r4, #0
	bl UnitCheckStatOverflow
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
	adds r0, r4, #0
_08017862:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08017868
sub_08017868: @ 0x08017868
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r1, [r6]
	cmp r1, #0
	bgt _08017878
	movs r1, #0
	b _08017880
_08017878:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017890 @ =0x08BDCE18
	adds r1, r1, r0
_08017880:
	str r1, [r5]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08017894
	adds r1, r0, #0
	cmp r1, #0
	ble _0801789A
	b _0801789E
	.align 2, 0
_08017890: .4byte 0x08BDCE18
_08017894:
	ldrb r1, [r1, #5]
	cmp r1, #0
	bgt _0801789E
_0801789A:
	movs r1, #0
	b _080178A6
_0801789E:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _080178F0 @ =0x08BE015C
	adds r1, r1, r0
_080178A6:
	str r1, [r5, #4]
	ldrb r1, [r6, #3]
	lsrs r0, r1, #3
	strb r0, [r5, #8]
	ldrb r0, [r6, #6]
	strb r0, [r5, #0x10]
	ldrb r0, [r6, #7]
	strb r0, [r5, #0x11]
	adds r1, r6, #0
	adds r1, #8
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _080178E0
	adds r4, r1, #0
	adds r7, r4, #0
_080178C4:
	ldrb r0, [r4]
	bl CreateItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08017654
	adds r4, #1
	adds r0, r7, #3
	cmp r4, r0
	bgt _080178E0
	ldrb r0, [r4]
	cmp r0, #0
	bne _080178C4
_080178E0:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08037350
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080178F0: .4byte 0x08BE015C

	thumb_func_start sub_080178F4
sub_080178F4: @ 0x080178F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_08017674
	adds r1, r4, #0
	adds r1, #8
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _08017928
	adds r4, r1, #0
	adds r6, r4, #0
_0801790C:
	ldrb r0, [r4]
	bl CreateItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08017654
	adds r4, #1
	adds r0, r6, #3
	cmp r4, r0
	bgt _08017928
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801790C
_08017928:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08017930
sub_08017930: @ 0x08017930
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4, #4]
	ldrb r3, [r1, #0xc]
	ldrb r5, [r2, #0xb]
	adds r0, r3, r5
	movs r3, #0
	strb r0, [r4, #0x12]
	ldrb r6, [r1, #0xd]
	ldrb r5, [r2, #0xc]
	adds r0, r6, r5
	strb r0, [r4, #0x14]
	ldrb r6, [r1, #0xe]
	ldrb r5, [r2, #0xd]
	adds r0, r6, r5
	strb r0, [r4, #0x15]
	ldrb r6, [r1, #0xf]
	ldrb r5, [r2, #0xe]
	adds r0, r6, r5
	strb r0, [r4, #0x16]
	ldrb r6, [r1, #0x10]
	ldrb r5, [r2, #0xf]
	adds r0, r6, r5
	strb r0, [r4, #0x17]
	ldrb r6, [r1, #0x11]
	ldrb r2, [r2, #0x10]
	adds r0, r6, r2
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x12]
	strb r0, [r4, #0x19]
	strb r3, [r4, #0x1a]
	movs r1, #0
	adds r3, r4, #0
	adds r3, #0x28
_08017974:
	adds r2, r3, r1
	ldr r0, [r4, #4]
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r4]
	adds r0, #0x14
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801798E
	strb r0, [r2]
_0801798E:
	adds r1, #1
	cmp r1, #7
	ble _08017974
	movs r1, #0xc0
	ldrb r0, [r4, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _080179B0
	ldrb r3, [r4, #8]
	cmp r3, #0x14
	beq _080179B0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _080179B0
	strb r1, [r4, #9]
	b _080179B4
_080179B0:
	movs r0, #0xff
	strb r0, [r4, #9]
_080179B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080179BC
sub_080179BC: @ 0x080179BC
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080179E8
	ldrb r1, [r3, #4]
	subs r1, #1
	cmp r1, #0
	bgt _080179DE
	movs r1, #0
	b _080179E6
_080179DE:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _080179EC @ =0x08BDCE18
	adds r1, r1, r0
_080179E6:
	str r1, [r2]
_080179E8:
	bx lr
	.align 2, 0
_080179EC: .4byte 0x08BDCE18

	thumb_func_start sub_080179F0
sub_080179F0: @ 0x080179F0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_08026628
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _08017A16
	adds r7, r5, #0
	adds r7, #0x32
_08017A04:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080267F4
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, r6
	blt _08017A04
_08017A16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08017A1C
sub_08017A1C: @ 0x08017A1C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #1
	ldrb r1, [r1, #3]
	ands r0, r1
	cmp r0, #0
	beq _08017AB4
	movs r7, #0
	b _08017AAA
_08017A2E:
	lsls r1, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08017AA8
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08017A62
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017AA8
_08017A62:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08017A7E
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017AA8
_08017A7E:
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _08017ABC @ =0x003D3C00
	ands r1, r0
	cmp r1, #0
	bne _08017AA8
	adds r0, r4, #0
	bl GetItemKind
	adds r1, r6, #0
	adds r1, #0x28
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08017AA0
	movs r4, #0
_08017AA0:
	adds r0, r4, #0
	bl sub_080173B8
	strb r0, [r5]
_08017AA8:
	adds r7, #1
_08017AAA:
	adds r0, r6, #0
	bl sub_080176DC
	cmp r7, r0
	blt _08017A2E
_08017AB4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017ABC: .4byte 0x003D3C00

	thumb_func_start sub_08017AC0
sub_08017AC0: @ 0x08017AC0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r5, #0
	beq _08017B44
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029604
	ldrb r1, [r4, #0x12]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029604
	ldrb r1, [r4, #0x14]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029604
	ldrb r1, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029604
	ldrb r1, [r4, #0x16]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029604
	ldrb r1, [r4, #0x17]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	ldr r0, [r4, #4]
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029604
	ldrb r1, [r4, #0x18]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
_08017B44:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08017B4C
sub_08017B4C: @ 0x08017B4C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, [r4, #4]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl sub_08017AC0
	adds r0, r4, #0
	bl UnitCheckStatOverflow
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08017B80
sub_08017B80: @ 0x08017B80
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r2, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017BA8
	ldrb r4, [r2, #5]
	bl sub_0803486C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08017AC0
_08017BA8:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	movs r2, #8
	ldrsb r2, [r5, r2]
	subs r2, #1
	adds r0, r5, #0
	bl sub_08017AC0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08017BC0
sub_08017BC0: @ 0x08017BC0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #8
	ldrsb r3, [r4, r3]
	ldr r0, [r4]
	movs r2, #0xb
	ldrsb r2, [r0, r2]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017BE8
	adds r0, r2, #0
	subs r0, #0xe
	subs r0, r3, r0
	b _08017BEA
_08017BE8:
	subs r0, r3, r2
_08017BEA:
	cmp r0, #0
	ble _08017C5E
	adds r5, r0, #0
_08017BF0:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl sub_080295E0
	ldrb r1, [r4, #0x12]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl sub_080295E0
	ldrb r1, [r4, #0x14]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl sub_080295E0
	ldrb r1, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl sub_080295E0
	ldrb r1, [r4, #0x16]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl sub_080295E0
	ldrb r1, [r4, #0x17]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl sub_080295E0
	ldrb r1, [r4, #0x18]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl sub_080295E0
	ldrb r1, [r4, #0x19]
	adds r0, r1, r0
	strb r0, [r4, #0x19]
	subs r5, #1
	cmp r5, #0
	bne _08017BF0
_08017C5E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start UnitCheckStatOverflow
UnitCheckStatOverflow: @ 0x08017C64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ldrb r2, [r4, #0xb]
	ands r0, r2
	cmp r0, #0x80
	bne _08017C7C
	cmp r1, #0x78
	bgt _08017C80
	b _08017C90
_08017C7C:
	cmp r1, #0x3c
	ble _08017C90
_08017C80:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	movs r1, #0x3c
	cmp r0, #0x80
	bne _08017C8E
	movs r1, #0x78
_08017C8E:
	strb r1, [r4, #0x12]
_08017C90:
	ldr r7, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	ldrb r2, [r7, #0x14]
	movs r0, #0x14
	ldrsb r0, [r7, r0]
	adds r5, r7, #0
	cmp r1, r0
	ble _08017CA4
	strb r2, [r4, #0x14]
_08017CA4:
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x15]
	movs r0, #0x15
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CB4
	strb r2, [r4, #0x15]
_08017CB4:
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x16]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CC4
	strb r2, [r4, #0x16]
_08017CC4:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x17]
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CD4
	strb r2, [r4, #0x17]
_08017CD4:
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x18]
	movs r0, #0x18
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _08017CE4
	strb r2, [r4, #0x18]
_08017CE4:
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r0, #0x1e
	ble _08017CF0
	movs r0, #0x1e
	strb r0, [r4, #0x19]
_08017CF0:
	movs r3, #0x1a
	ldrsb r3, [r4, r3]
	movs r2, #0x19
	ldrsb r2, [r5, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r6, [r4]
	movs r1, #0x13
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	subs r2, r2, r0
	cmp r3, r2
	ble _08017D16
	ldrb r2, [r5, #0x11]
	ldrb r6, [r6, #0x13]
	adds r0, r2, r6
	ldrb r5, [r5, #0x19]
	subs r0, r5, r0
	strb r0, [r4, #0x1a]
_08017D16:
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	movs r1, #0x12
	ldrsb r1, [r7, r1]
	movs r0, #0xf
	subs r0, r0, r1
	cmp r2, r0
	ble _08017D2E
	movs r0, #0xf
	ldrb r7, [r7, #0x12]
	subs r0, r0, r7
	strb r0, [r4, #0x1d]
_08017D2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GetUnitByPid
GetUnitByPid: @ 0x08017D34
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #1
	ldr r5, _08017D5C @ =0x08B92EB0
	movs r4, #0xff
_08017D3E:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08017D60
	ldr r0, [r1]
	cmp r0, #0
	beq _08017D60
	ldrb r0, [r0, #4]
	cmp r0, r3
	bne _08017D60
	adds r0, r1, #0
	b _08017D68
	.align 2, 0
_08017D5C: .4byte 0x08B92EB0
_08017D60:
	adds r2, #1
	cmp r2, #0xff
	ble _08017D3E
	movs r0, #0
_08017D68:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017D70
sub_08017D70: @ 0x08017D70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r3, #0x40
	adds r1, #1
	cmp r1, r3
	bge _08017DAA
	ldr r6, _08017DA0 @ =0x08B92EB0
	movs r5, #0xff
_08017D82:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08017DA4
	ldr r0, [r2]
	cmp r0, #0
	beq _08017DA4
	ldrb r0, [r0, #4]
	cmp r0, r4
	bne _08017DA4
	adds r0, r2, #0
	b _08017DAC
	.align 2, 0
_08017DA0: .4byte 0x08B92EB0
_08017DA4:
	adds r1, #1
	cmp r1, r3
	blt _08017D82
_08017DAA:
	movs r0, #0
_08017DAC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CanUnitCarry
CanUnitCarry: @ 0x08017DB4
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitAid
	ldr r1, [r4, #4]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	ldr r1, [r4]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r2, r2, r1
	movs r1, #0
	cmp r0, r2
	blt _08017DDA
	movs r1, #1
_08017DDA:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UnitRescue
UnitRescue: @ 0x08017DE4
	ldr r2, [r0, #0xc]
	movs r3, #0x10
	orrs r2, r3
	str r2, [r0, #0xc]
	ldr r2, [r1, #0xc]
	movs r3, #0x21
	orrs r2, r3
	str r2, [r1, #0xc]
	ldrb r2, [r1, #0xb]
	strb r2, [r0, #0x1b]
	ldrb r2, [r0, #0xb]
	strb r2, [r1, #0x1b]
	ldrb r2, [r0, #0x10]
	strb r2, [r1, #0x10]
	ldrb r0, [r0, #0x11]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0

	thumb_func_start UnitDropRescue
UnitDropRescue: @ 0x08017E08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r1, _08017E54 @ =0x08B92EB0
	ldrb r2, [r5, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x31
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r3, [r2, #0xc]
	movs r0, #0x32
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r2, #0xc]
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	ldr r1, _08017E58 @ =0x0202BBF8
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _08017E44
	movs r0, #2
	orrs r3, r0
	str r3, [r2, #0xc]
_08017E44:
	movs r0, #0
	strb r0, [r5, #0x1b]
	strb r0, [r4, #0x1b]
	strb r6, [r4, #0x10]
	strb r7, [r4, #0x11]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017E54: .4byte 0x08B92EB0
_08017E58: .4byte 0x0202BBF8

	thumb_func_start UnitGiveRescue
UnitGiveRescue: @ 0x08017E5C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _08017E8C @ =0x08B92EB0
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl CanUnitCarry
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl UnitDropRescue
	adds r0, r6, #0
	adds r1, r5, #0
	bl UnitRescue
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017E8C: .4byte 0x08B92EB0

	thumb_func_start KillUnit
KillUnit: @ 0x08017E90
	push {lr}
	adds r2, r0, #0
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08017EAE
	ldr r0, [r2, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl ClearUnitSupports
	b _08017EB2
_08017EAE:
	movs r0, #0
	str r0, [r2]
_08017EB2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitChangeFaction
UnitChangeFaction: @ 0x08017EB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl sub_0801754C
	adds r4, r0, #0
	ldr r1, _08017EF4 @ =0x03004690
	ldr r0, [r1]
	cmp r0, r5
	bne _08017ED0
	str r4, [r1]
_08017ED0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08017530
	adds r0, r5, #0
	bl ClearUnit
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _08017EFC
	cmp r6, #0
	bne _08017EF8
	ldrb r0, [r4, #8]
	cmp r0, #0x14
	beq _08017EF8
	strb r6, [r4, #9]
	b _08017EFC
	.align 2, 0
_08017EF4: .4byte 0x03004690
_08017EF8:
	movs r0, #0xff
	strb r0, [r4, #9]
_08017EFC:
	ldr r0, [r4, #0xc]
	ldr r1, _08017F20 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _08017F18
	ldr r1, _08017F24 @ =0x08B92EB0
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #0x1b]
_08017F18:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017F20: .4byte 0xFFFFEFFF
_08017F24: .4byte 0x08B92EB0

	thumb_func_start UnitSyncMovement
UnitSyncMovement: @ 0x08017F28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08017F48
	ldr r1, _08017F68 @ =0x08B92EB0
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x10]
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0x11]
	strb r0, [r1, #0x11]
_08017F48:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017F62
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
_08017F62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017F68: .4byte 0x08B92EB0

	thumb_func_start sub_08017F6C
sub_08017F6C: @ 0x08017F6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r0, _08018070 @ =0x0000270F
	str r0, [sp, #8]
	ldr r1, _08018074 @ =0x08B92EB0
	movs r4, #0xff
	mov r2, r8
	ldrb r2, [r2, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	mov r3, r8
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r2, _08018078 @ =0x08BE3C16
	bl MapFloodExtended
	ldr r0, _0801807C @ =0x03004690
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r3, _08018080 @ =0x0202E3DC
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r4, [r0]
	mov r1, r8
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08018084 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r6, r0, #1
	cmp r6, #0
	blt _080180B6
_08017FE2:
	ldr r0, _08018084 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	ldr r2, _08018080 @ =0x0202E3DC
	subs r3, r6, #1
	mov sb, r3
	cmp r5, #0
	blt _080180B0
	lsls r7, r6, #2
_08017FF6:
	ldr r0, _08018088 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080180AA
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080180AA
	ldr r0, _0801808C @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r1, [r0]
	adds r1, r1, r5
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080180AA
	ldr r0, _08018090 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	mov r0, sl
	bl GetUnitMovementCost
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0801804A
	movs r1, #1
_0801804A:
	ldr r2, _08018080 @ =0x0202E3DC
	cmp r1, #0
	beq _080180AA
	mov r1, r8
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	subs r2, r5, r0
	cmp r2, #0
	bge _0801805E
	subs r2, r0, r5
_0801805E:
	mov r3, r8
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r1, r6, r0
	cmp r1, #0
	blt _08018094
	adds r0, r2, r1
	b _08018098
	.align 2, 0
_08018070: .4byte 0x0000270F
_08018074: .4byte 0x08B92EB0
_08018078: .4byte 0x08BE3C16
_0801807C: .4byte 0x03004690
_08018080: .4byte 0x0202E3DC
_08018084: .4byte 0x0202E3D8
_08018088: .4byte 0x0202E3E4
_0801808C: .4byte 0x0202E3F0
_08018090: .4byte 0x0202E3E0
_08018094:
	subs r0, r0, r6
	adds r0, r2, r0
_08018098:
	ldr r2, _080180E4 @ =0x0202E3DC
	ldr r1, [sp, #8]
	cmp r1, r0
	blt _080180AA
	str r0, [sp, #8]
	ldr r3, [sp]
	str r5, [r3]
	ldr r0, [sp, #4]
	str r6, [r0]
_080180AA:
	subs r5, #1
	cmp r5, #0
	bge _08017FF6
_080180B0:
	mov r6, sb
	cmp r6, #0
	bge _08017FE2
_080180B6:
	ldr r0, _080180E8 @ =0x03004690
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _080180E4 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080180E4: .4byte 0x0202E3DC
_080180E8: .4byte 0x03004690

	thumb_func_start UnitBeginAction
UnitBeginAction: @ 0x080180EC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0801814C @ =0x03004690
	str r4, [r6]
	ldr r0, _08018150 @ =0x0202BD48
	ldrb r2, [r4, #0xb]
	strb r2, [r0]
	ldr r1, _08018154 @ =0x0202BD4C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _08018158 @ =0x0203A85C
	strb r2, [r0, #0xc]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x10]
	ldr r0, _0801815C @ =0x0202BBB8
	adds r1, r0, #0
	adds r1, #0x3d
	strb r5, [r1]
	adds r0, #0x3f
	movs r1, #0xff
	strb r1, [r0]
	bl sub_08029D6C
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _08018160 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801814C: .4byte 0x03004690
_08018150: .4byte 0x0202BD48
_08018154: .4byte 0x0202BD4C
_08018158: .4byte 0x0203A85C
_0801815C: .4byte 0x0202BBB8
_08018160: .4byte 0x0202E3DC

	thumb_func_start UnitBeginReMoveAction
UnitBeginReMoveAction: @ 0x08018164
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080181B8 @ =0x03004690
	str r4, [r6]
	ldr r1, _080181BC @ =0x0202BD48
	ldrb r0, [r4, #0xb]
	strb r0, [r1]
	ldr r1, _080181C0 @ =0x0202BD4C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _080181C4 @ =0x0203A85C
	strb r5, [r0, #0x11]
	ldr r0, _080181C8 @ =0x0202BBB8
	adds r0, #0x3d
	strb r5, [r0]
	bl sub_08029D6C
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _080181CC @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080181B8: .4byte 0x03004690
_080181BC: .4byte 0x0202BD48
_080181C0: .4byte 0x0202BD4C
_080181C4: .4byte 0x0203A85C
_080181C8: .4byte 0x0202BBB8
_080181CC: .4byte 0x0202E3DC

	thumb_func_start sub_080181D0
sub_080181D0: @ 0x080181D0
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
	bl sub_080A003C
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

	thumb_func_start sub_08018268
sub_08018268: @ 0x08018268
	push {r4, r5, r6, lr}
	ldr r0, _080182F0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080182B2
	movs r4, #1
	ldr r5, _080182F4 @ =0x08B92EB0
_08018276:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _080182AC
	ldr r3, [r2]
	cmp r3, #0
	beq _080182AC
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080182AC
	ldr r0, [r2, #0xc]
	ldr r1, _080182F8 @ =0x0001000E
	ands r0, r1
	cmp r0, #0
	bne _080182AC
	ldrb r0, [r3, #4]
	bl sub_080A00FC
_080182AC:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018276
_080182B2:
	ldr r1, _080182F0 @ =0x0202BBF8
	ldrb r0, [r1, #0xf]
	adds r2, r0, #1
	adds r0, #0x40
	cmp r2, r0
	bge _080182EA
	ldr r6, _080182F4 @ =0x08B92EB0
	movs r5, #0xff
	ldr r4, _080182FC @ =0xFFFFFBBD
	adds r3, r1, #0
_080182C6:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _080182E0
	ldr r0, [r1]
	cmp r0, #0
	beq _080182E0
	ldr r0, [r1, #0xc]
	ands r0, r4
	str r0, [r1, #0xc]
_080182E0:
	adds r2, #1
	ldrb r0, [r3, #0xf]
	adds r0, #0x40
	cmp r2, r0
	blt _080182C6
_080182EA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080182F0: .4byte 0x0202BBF8
_080182F4: .4byte 0x08B92EB0
_080182F8: .4byte 0x0001000E
_080182FC: .4byte 0xFFFFFBBD

	thumb_func_start sub_08018300
sub_08018300: @ 0x08018300
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _08018318 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	b _080183BC
	.align 2, 0
_08018318: .4byte 0x0202BBF8
_0801831C:
	ldr r1, _080183E8 @ =0x08B92EB0
	movs r0, #0xff
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	cmp r2, #0
	beq _080183B6
	ldr r0, [r2]
	cmp r0, #0
	beq _080183B6
	ldr r0, [r2, #0xc]
	ldr r1, _080183EC @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080183B6
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r2, [r3]
	movs r6, #0xf0
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _0801835C
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0801835C:
	ldrb r2, [r3]
	movs r1, #0xf
	movs r7, #0xf
	mov ip, r7
	mov r0, ip
	ands r0, r2
	cmp r0, #0
	beq _08018382
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	ands r0, r1
	subs r7, #0x1f
	adds r1, r7, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	movs r0, #1
	mov r8, r0
_08018382:
	adds r3, r4, #0
	adds r3, #0x30
	ldrb r2, [r3]
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _080183B6
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	mov r0, ip
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ands r0, r6
	cmp r0, #0
	bne _080183B6
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080183B6:
	adds r5, #1
	ldr r0, _080183F0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
_080183BC:
	adds r0, #0x40
	cmp r5, r0
	blt _0801831C
	mov r7, r8
	cmp r7, #0
	beq _080183DE
	bl RenderMapForFade
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	bl RefreshUnitSprites
_080183DE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080183E8: .4byte 0x08B92EB0
_080183EC: .4byte 0x0001002C
_080183F0: .4byte 0x0202BBF8

	thumb_func_start sub_080183F4
sub_080183F4: @ 0x080183F4
	push {r4, r5, lr}
	movs r2, #1
	ldr r5, _08018424 @ =0x08B92EB0
	movs r4, #0xff
	ldr r3, _08018428 @ =0xFFFFFEFF
_080183FE:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018418
	ldr r0, [r1]
	cmp r0, #0
	beq _08018418
	ldr r0, [r1, #0xc]
	ands r0, r3
	str r0, [r1, #0xc]
_08018418:
	adds r2, #1
	cmp r2, #0xbf
	ble _080183FE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018424: .4byte 0x08B92EB0
_08018428: .4byte 0xFFFFFEFF

	thumb_func_start UnitUpdateUsedItem
UnitUpdateUsedItem: @ 0x0801842C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0
	beq _08018448
	bl GetItemAfterUse
	strh r0, [r4]
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_08018448:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetUnitAid
GetUnitAid: @ 0x08018450
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801847A
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	movs r1, #0x13
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	subs r0, #1
	b _080184AC
_0801847A:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r1, r0
	cmp r1, #0
	bne _08018498
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x19
	b _080184AA
_08018498:
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x14
_080184AA:
	subs r0, r0, r1
_080184AC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitMagRange
GetUnitMagRange: @ 0x080184B4
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r0, r1, #1
	cmp r0, #4
	bgt _080184D6
	movs r0, #5
_080184D6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start UnitKnowsMagic
UnitKnowsMagic: @ 0x080184DC
	adds r2, r0, #0
	adds r0, #0x2c
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	orrs r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0

	thumb_func_start sub_08018504
sub_08018504: @ 0x08018504
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0801851E
	movs r0, #0xa
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
	strb r1, [r4, #0x10]
	strb r2, [r4, #0x11]
_0801851E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GetUnitKeyItemSlotForTerrain
GetUnitKeyItemSlotForTerrain: @ 0x08018524
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801854A
	adds r0, r4, #0
	movs r1, #0x6a
	bl FindUnitItemSlot
	cmp r0, #0
	bge _08018572
_0801854A:
	cmp r5, #0x1e
	beq _08018568
	cmp r5, #0x21
	bne _0801856A
	adds r0, r4, #0
	movs r1, #0x68
	bl FindUnitItemSlot
	cmp r0, #0
	bge _08018572
	adds r0, r4, #0
	movs r1, #0x78
	bl FindUnitItemSlot
	b _08018572
_08018568:
	movs r6, #0x69
_0801856A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl FindUnitItemSlot
_08018572:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetAidIconFromAttributes
GetAidIconFromAttributes: @ 0x08018578
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08018588
	movs r0, #0x81
	b _080185A8
_08018588:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _08018596
	movs r0, #0x82
	b _080185A8
_08018596:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080185A6
	movs r0, #1
	rsbs r0, r0, #0
	b _080185A8
_080185A6:
	movs r0, #0x83
_080185A8:
	bx lr
	.align 2, 0

	thumb_func_start sub_080185AC
sub_080185AC: @ 0x080185AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08018616
	movs r0, #1
	mov r8, r0
_080185C2:
	adds r0, r4, #0
	bl GetItemAttributes
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080185E2
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080185E2
	mov r0, r8
	orrs r6, r0
_080185E2:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08018602
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018602
	movs r0, #2
	orrs r6, r0
_08018602:
	adds r7, #1
	cmp r7, #4
	bgt _08018616
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080185C2
_08018616:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018624
sub_08018624: @ 0x08018624
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r4, #0x81
	ldr r6, _08018658 @ =0x08B92EB0
_0801862C:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08018648
	ldr r0, [r1]
	cmp r0, #0
	beq _08018648
	adds r0, r1, #0
	bl sub_080185AC
	orrs r5, r0
_08018648:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801862C
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018658: .4byte 0x08B92EB0

	thumb_func_start sub_0801865C
sub_0801865C: @ 0x0801865C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _080186EC @ =0x081C3B6C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _080186F0 @ =0x03004690
	ldr r2, [r0]
	movs r1, #0x1d
	ldrsb r1, [r2, r1]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _080186F4 @ =0x0203A85C
	ldrb r0, [r0, #0x10]
	subs r0, r1, r0
	mov sl, r0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	mov sb, r0
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	movs r7, #0
	mov r4, sp
_0801869E:
	movs r0, #0
	ldrsb r0, [r4, r0]
	mov r1, sb
	adds r6, r1, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	add r1, r8
	ldr r0, _080186F8 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r1, [r0]
	adds r1, r1, r6
	movs r0, #0x80
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08018700
	ldr r0, _080186F0 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	ldr r1, _080186FC @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08018700
	cmp r0, sl
	bgt _08018700
	movs r0, #1
	b _0801870A
	.align 2, 0
_080186EC: .4byte 0x081C3B6C
_080186F0: .4byte 0x03004690
_080186F4: .4byte 0x0203A85C
_080186F8: .4byte 0x0202E3DC
_080186FC: .4byte 0x0202E3E0
_08018700:
	adds r4, #2
	adds r7, #1
	cmp r7, #3
	ble _0801869E
	movs r0, #0
_0801870A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801871C
sub_0801871C: @ 0x0801871C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0x81
	ldr r6, _0801876C @ =0x08B92EB0
_08018726:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _0801877C
	ldr r1, [r2]
	cmp r1, #0
	beq _0801877C
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801877C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	subs r1, r0, r5
	cmp r1, #0
	bge _08018758
	subs r1, r5, r0
_08018758:
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	subs r0, r2, r4
	cmp r0, #0
	blt _08018770
	adds r0, r1, r0
	cmp r0, #0xa
	ble _08018778
	b _0801877C
	.align 2, 0
_0801876C: .4byte 0x08B92EB0
_08018770:
	subs r0, r4, r2
	adds r0, r1, r0
	cmp r0, #0xa
	bgt _0801877C
_08018778:
	movs r0, #1
	b _08018784
_0801877C:
	adds r3, #1
	cmp r3, #0xbf
	ble _08018726
	movs r0, #0
_08018784:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801878C
sub_0801878C: @ 0x0801878C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _080187B4
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_0801871C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080187B4
	movs r0, #0
	b _080187B6
_080187B4:
	movs r0, #1
_080187B6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080187BC
sub_080187BC: @ 0x080187BC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080176DC
	subs r0, #1
	lsls r0, r0, #1
	adds r4, #0x1e
	adds r4, r4, r0
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetUnitMovementCost
GetUnitMovementCost: @ 0x080187D4
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080187EC
	ldr r0, _080187E8 @ =0x08BE3C98
	b _08018812
	.align 2, 0
_080187E8: .4byte 0x08BE3C98
_080187EC:
	ldr r0, _08018804 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	blt _0801880E
	cmp r0, #2
	ble _08018808
	cmp r0, #4
	bne _0801880E
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x3c]
	b _08018812
	.align 2, 0
_08018804: .4byte 0x0202BBF8
_08018808:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x40]
	b _08018812
_0801880E:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x38]
_08018812:
	bx lr

	thumb_func_start sub_08018814
sub_08018814: @ 0x08018814
	adds r1, r0, #0
	cmp r1, #0
	bgt _0801881E
	movs r0, #0
	b _08018826
_0801881E:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _0801882C @ =0x08BE015C
	adds r0, r1, r0
_08018826:
	ldrb r0, [r0, #6]
	bx lr
	.align 2, 0
_0801882C: .4byte 0x08BE015C

	thumb_func_start sub_08018830
sub_08018830: @ 0x08018830
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _08018868 @ =0x08B92EB0
_08018836:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _08018872
	ldr r0, [r2]
	cmp r0, #0
	beq _08018872
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801886C
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	b _08018872
	.align 2, 0
_08018868: .4byte 0x08B92EB0
_0801886C:
	ldr r0, _08018884 @ =0xFFEFFFFF
	ands r1, r0
	str r1, [r3, #0xc]
_08018872:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018836
	bl sub_0807A8B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018884: .4byte 0xFFEFFFFF

	thumb_func_start sub_08018888
sub_08018888: @ 0x08018888
	push {r4, r5, r6, lr}
	movs r4, #1
	ldr r6, _080188BC @ =0x08B92EB0
	ldr r5, _080188C0 @ =0xFFEFFFFF
_08018890:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _080188C8
	ldr r0, [r2]
	cmp r0, #0
	beq _080188C8
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r1
	cmp r0, #0
	beq _080188C4
	movs r0, #4
	orrs r1, r0
	ands r1, r5
	str r1, [r2, #0xc]
	b _080188C8
	.align 2, 0
_080188BC: .4byte 0x08B92EB0
_080188C0: .4byte 0xFFEFFFFF
_080188C4:
	ands r1, r5
	str r1, [r3, #0xc]
_080188C8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018890
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080188D4
sub_080188D4: @ 0x080188D4
	push {r4, r5, lr}
	movs r3, #1
	ldr r5, _08018904 @ =0x0202BBF8
	ldr r4, _08018908 @ =0x08B92EB0
_080188DC:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08018932
	ldr r0, [r2]
	cmp r0, #0
	beq _08018932
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801890C
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _08018910
	.align 2, 0
_08018904: .4byte 0x0202BBF8
_08018908: .4byte 0x08B92EB0
_0801890C:
	ldr r0, _08018928 @ =0xFFDFFFFF
	ands r1, r0
_08018910:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0801892C
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r1, r0
	b _08018930
	.align 2, 0
_08018928: .4byte 0xFFDFFFFF
_0801892C:
	ldr r0, _08018978 @ =0xFBFFFFFF
	ands r1, r0
_08018930:
	str r1, [r2, #0xc]
_08018932:
	adds r3, #1
	cmp r3, #0x3f
	ble _080188DC
	movs r0, #0x10
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _0801896E
	movs r3, #1
	ldr r5, _0801897C @ =0x08B92EB0
	movs r4, #0xff
_08018948:
	adds r0, r3, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018968
	ldr r0, [r2]
	cmp r0, #0
	beq _08018968
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r1, [r2, #0x10]
	strb r1, [r0]
	ldrb r1, [r2, #0x11]
	strb r1, [r0, #1]
_08018968:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018948
_0801896E:
	bl sub_0807A8B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018978: .4byte 0xFBFFFFFF
_0801897C: .4byte 0x08B92EB0

	thumb_func_start sub_08018980
sub_08018980: @ 0x08018980
	push {r4, r5, r6, lr}
	bl sub_0807A8B8
	movs r4, #1
	ldr r5, _080189B4 @ =0x08B92EB0
_0801898A:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _080189F2
	ldr r0, [r2]
	cmp r0, #0
	beq _080189F2
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080189B8
	adds r0, r2, #0
	bl ClearUnit
	b _080189F2
	.align 2, 0
_080189B4: .4byte 0x08B92EB0
_080189B8:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _080189C8
	movs r0, #8
	orrs r1, r0
	b _080189CE
_080189C8:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
_080189CE:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _080189E4
	movs r0, #0x80
	lsls r0, r0, #9
	orrs r1, r0
	b _080189E8
_080189E4:
	ldr r0, _08018A64 @ =0xFFFEFFFF
	ands r1, r0
_080189E8:
	str r1, [r2, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
_080189F2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0801898A
	ldr r1, _08018A68 @ =0x0202BBF8
	movs r0, #0x10
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08018A34
	movs r3, #1
	ldr r6, _08018A6C @ =0x08B92EB0
	movs r5, #0xff
	movs r4, #0
_08018A0C:
	adds r0, r3, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018A2E
	ldr r0, [r2]
	cmp r0, #0
	beq _08018A2E
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r1, [r0]
	strb r1, [r2, #0x10]
	ldrb r1, [r0, #1]
	strb r1, [r2, #0x11]
	strh r4, [r0]
_08018A2E:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018A0C
_08018A34:
	movs r4, #0x41
	ldr r5, _08018A6C @ =0x08B92EB0
_08018A38:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018A52
	ldr r0, [r1]
	cmp r0, #0
	beq _08018A52
	adds r0, r1, #0
	bl ClearUnit
_08018A52:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018A38
	bl sub_08079214
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018A64: .4byte 0xFFFEFFFF
_08018A68: .4byte 0x0202BBF8
_08018A6C: .4byte 0x08B92EB0

	thumb_func_start sub_08018A70
sub_08018A70: @ 0x08018A70
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018AA4
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08018AA4:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitMaxHp
GetUnitMaxHp: @ 0x08018AB0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	adds r1, r0, #0
	movs r0, #0x12
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitPower
GetUnitPower: @ 0x08018AD0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	adds r1, r0, #0
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitSkill
GetUnitSkill: @ 0x08018AF0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08018B14
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	b _08018B26
_08018B14:
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08018B26:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitSpeed
GetUnitSpeed: @ 0x08018B30
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08018B54
	adds r0, r2, #0
	bl GetItemSpdBonus
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	b _08018B66
_08018B54:
	adds r0, r2, #0
	bl GetItemSpdBonus
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08018B66:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitDefense
GetUnitDefense: @ 0x08018B70
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemDefBonus
	adds r1, r0, #0
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitResistance
GetUnitResistance: @ 0x08018B90
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemResBonus
	adds r1, r0, #0
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r4, #0x31
	ldrb r4, [r4]
	lsrs r1, r4, #4
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitLuck
GetUnitLuck: @ 0x08018BB8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemLckBonus
	adds r1, r0, #0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitFid
GetUnitFid: @ 0x08018BD8
	adds r2, r0, #0
	ldr r1, [r2]
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08018BF0
	ldr r1, [r2, #4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _08018BEE
	movs r0, #0
	b _08018BF0
_08018BEE:
	ldrh r0, [r1, #8]
_08018BF0:
	bx lr
	.align 2, 0

	thumb_func_start sub_08018BF4
sub_08018BF4: @ 0x08018BF4
	adds r2, r0, #0
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08018C08
	movs r0, #0xfe
	lsls r0, r0, #7
	ldrb r1, [r1, #8]
	orrs r0, r1
	b _08018C1C
_08018C08:
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08018C18
	ldr r2, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0
	cmp r0, #0
	beq _08018C1A
_08018C18:
	adds r1, r0, #0
_08018C1A:
	adds r0, r1, #0
_08018C1C:
	bx lr
	.align 2, 0

	thumb_func_start sub_08018C20
sub_08018C20: @ 0x08018C20
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r1, #0xb]
	ands r0, r2
	cmp r0, #0
	beq _08018C34
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	b _08018C36
_08018C34:
	movs r0, #0
_08018C36:
	bx lr

	thumb_func_start sub_08018C38
sub_08018C38: @ 0x08018C38
	adds r0, #0x38
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08018C40
sub_08018C40: @ 0x08018C40
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5, #0x13]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018C76
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08018C76:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08018C7C
sub_08018C7C: @ 0x08018C7C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r4, r4, r1
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018CB0
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r4, r1, r0
_08018CB0:
	cmp r4, #0
	bge _08018CB6
	movs r4, #0
_08018CB6:
	strb r4, [r5, #0x13]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08018CC0
sub_08018CC0: @ 0x08018CC0
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _08018CE0
	ldr r1, _08018CDC @ =0x08B92EB0
	ldrb r2, [r2, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	b _08018CE4
	.align 2, 0
_08018CDC: .4byte 0x08B92EB0
_08018CE0:
	ldr r0, _08018CEC @ =0x08B92E88
	ldr r0, [r0]
_08018CE4:
	bl GetMsg
	pop {r1}
	bx r1
	.align 2, 0
_08018CEC: .4byte 0x08B92E88

	thumb_func_start sub_08018CF0
sub_08018CF0: @ 0x08018CF0
	push {lr}
	ldr r1, _08018D08 @ =0x08B92E88
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1a
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	pop {r1}
	bx r1
	.align 2, 0
_08018D08: .4byte 0x08B92E88

	thumb_func_start GetUnit
GetUnit: @ 0x08018D0C
	ldr r2, _08018D1C @ =0x08B92EB0
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08018D1C: .4byte 0x08B92EB0

	thumb_func_start GetJobInfo
GetJobInfo: @ 0x08018D20
	adds r1, r0, #0
	cmp r1, #0
	ble _08018D34
	movs r0, #0x54
	muls r0, r1, r0
	ldr r1, _08018D30 @ =0x08BE015C
	adds r0, r0, r1
	b _08018D36
	.align 2, 0
_08018D30: .4byte 0x08BE015C
_08018D34:
	movs r0, #0
_08018D36:
	bx lr

	thumb_func_start sub_08018D38
sub_08018D38: @ 0x08018D38
	adds r1, r0, #0
	cmp r1, #0
	ble _08018D4C
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _08018D48 @ =0x08BDCE18
	adds r0, r0, r1
	b _08018D4E
	.align 2, 0
_08018D48: .4byte 0x08BDCE18
_08018D4C:
	movs r0, #0
_08018D4E:
	bx lr

	thumb_func_start sub_08018D50
sub_08018D50: @ 0x08018D50
	push {lr}
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r1
	movs r1, #0
	strh r1, [r2]
	bl UnitRemoveInvalidItems
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08018D68
sub_08018D68: @ 0x08018D68
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitMovementCost
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08018D80
	movs r1, #1
_08018D80:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start InitMapForChapter
InitMapForChapter: @ 0x08018D88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08018E40 @ =0x02001000
	adds r1, r4, #0
	bl UnpackRawMap
	adds r0, r4, #0
	bl ApplyChapterMapGraphics
	ldr r0, _08018E44 @ =0x0202E3F8
	ldr r6, _08018E48 @ =0x0202E3DC
	ldr r4, _08018E4C @ =0x0202E3D8
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r6, #0
	bl MapInit
	ldr r0, _08018E50 @ =0x0202EBB0
	ldr r5, _08018E54 @ =0x0202E3E0
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r5, #0
	bl MapInit
	ldr r0, _08018E58 @ =0x03000440
	ldr r1, _08018E5C @ =0x0202E3E4
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl MapInit
	ldr r0, _08018E60 @ =0x03000BF8
	ldr r1, _08018E64 @ =0x0202E3E8
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl MapInit
	ldr r0, _08018E68 @ =0x0202F368
	ldr r1, _08018E6C @ =0x0202E3EC
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl MapInit
	ldr r0, _08018E70 @ =0x0202FB20
	ldr r1, _08018E74 @ =0x0202E3F0
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl MapInit
	ldr r0, _08018E78 @ =0x020302D8
	ldr r1, _08018E7C @ =0x0202E3F4
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl MapInit
	ldr r0, [r6]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	movs r1, #0
	bl MapFill
	bl InitMetatilesMap
	bl ApplyEnabledMapChanges
	bl RefreshTerrainMap
	ldr r0, _08018E80 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x26
	bne _08018E38
	bl ApplyAutoWaterShadows
_08018E38:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018E40: .4byte 0x02001000
_08018E44: .4byte 0x0202E3F8
_08018E48: .4byte 0x0202E3DC
_08018E4C: .4byte 0x0202E3D8
_08018E50: .4byte 0x0202EBB0
_08018E54: .4byte 0x0202E3E0
_08018E58: .4byte 0x03000440
_08018E5C: .4byte 0x0202E3E4
_08018E60: .4byte 0x03000BF8
_08018E64: .4byte 0x0202E3E8
_08018E68: .4byte 0x0202F368
_08018E6C: .4byte 0x0202E3EC
_08018E70: .4byte 0x0202FB20
_08018E74: .4byte 0x0202E3F0
_08018E78: .4byte 0x020302D8
_08018E7C: .4byte 0x0202E3F4
_08018E80: .4byte 0x0202BBF8

	thumb_func_start InitChapterPreviewMap
InitChapterPreviewMap: @ 0x08018E84
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r0, _08018ED4 @ =0x02001000
	bl UnpackRawMap
	ldr r0, _08018ED8 @ =0x0202E3F8
	ldr r6, _08018EDC @ =0x0202E3DC
	ldr r4, _08018EE0 @ =0x0202E3D8
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r6, #0
	bl MapInit
	ldr r0, _08018EE4 @ =0x0202EBB0
	ldr r5, _08018EE8 @ =0x0202E3E0
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r5, #0
	bl MapInit
	ldr r0, [r6]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	movs r1, #0
	bl MapFill
	bl InitMetatilesMap
	bl RefreshTerrainMap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018ED4: .4byte 0x02001000
_08018ED8: .4byte 0x0202E3F8
_08018EDC: .4byte 0x0202E3DC
_08018EE0: .4byte 0x0202E3D8
_08018EE4: .4byte 0x0202EBB0
_08018EE8: .4byte 0x0202E3E0

	thumb_func_start ApplyAutoWaterShadows
ApplyAutoWaterShadows: @ 0x08018EEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	ldr r1, _08018FC4 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	mov sb, r1
	cmp r6, r0
	blt _08018F06
	b _08019032
_08018F06:
	ldr r0, _08018FC8 @ =0x08B932B4
	mov sl, r0
_08018F0A:
	movs r4, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r6, #1
	mov r8, r1
	cmp r4, r0
	blt _08018F1A
	b _08019024
_08018F1A:
	ldr r2, _08018FCC @ =0x0202E3E0
	mov ip, r2
	lsls r3, r6, #2
	mov r7, sl
	movs r5, #0
_08018F24:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x3c
	bne _08019014
	movs r2, #0
	cmp r4, #0
	ble _08018F56
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08018F44
	movs r2, #1
_08018F44:
	cmp r0, #0x2d
	bne _08018F4A
	movs r2, #1
_08018F4A:
	cmp r0, #0x20
	bne _08018F50
	movs r2, #1
_08018F50:
	cmp r0, #0x21
	bne _08018F56
	movs r2, #1
_08018F56:
	cmp r6, #0
	ble _08018F80
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08018F6E
	adds r2, #2
_08018F6E:
	cmp r0, #0x2d
	bne _08018F74
	adds r2, #2
_08018F74:
	cmp r0, #0x20
	bne _08018F7A
	adds r2, #2
_08018F7A:
	cmp r0, #0x21
	bne _08018F80
	adds r2, #2
_08018F80:
	cmp r4, #0
	ble _08018FB4
	cmp r6, #0
	ble _08018FB4
	mov r1, ip
	ldr r0, [r1]
	adds r1, r3, r0
	ldr r0, [r1]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08018FB4
	ldr r0, [r1, #4]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _08018FB4
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08018FB4
	movs r2, #4
_08018FB4:
	cmp r2, #2
	beq _08018FE8
	cmp r2, #2
	bgt _08018FD0
	cmp r2, #1
	beq _08018FDA
	b _08019014
	.align 2, 0
_08018FC4: .4byte 0x0202E3D8
_08018FC8: .4byte 0x08B932B4
_08018FCC: .4byte 0x0202E3E0
_08018FD0:
	cmp r2, #3
	beq _08018FF6
	cmp r2, #4
	beq _08019004
	b _08019014
_08018FDA:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb7
	lsls r2, r2, #2
	b _08019010
_08018FE8:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xb6
	lsls r2, r2, #2
	b _08019010
_08018FF6:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd6
	lsls r2, r2, #2
	b _08019010
_08019004:
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r5, r0
	movs r2, #0xd7
	lsls r2, r2, #2
_08019010:
	adds r1, r2, #0
	strh r1, [r0]
_08019014:
	adds r5, #2
	adds r4, #1
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _08019024
	b _08018F24
_08019024:
	mov r6, r8
	mov r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bge _08019032
	b _08018F0A
_08019032:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start RefreshAutoWaterShadows
RefreshAutoWaterShadows: @ 0x08019040
	push {lr}
	ldr r0, _08019064 @ =0x02001000
	ldr r1, _08019068 @ =0x0202BBF8
	ldrb r1, [r1, #0xe]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl UnpackRawMap
	bl InitMetatilesMap
	bl ApplyEnabledMapChanges
	bl RefreshTerrainMap
	bl ApplyAutoWaterShadows
	pop {r0}
	bx r0
	.align 2, 0
_08019064: .4byte 0x02001000
_08019068: .4byte 0x0202BBF8

	thumb_func_start MapInit
MapInit: @ 0x0801906C
	push {r4, r5, r6, r7, lr}
	mov ip, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r2, _080190A8 @ =0x03000438
	str r0, [r2]
	adds r6, #2
	adds r5, #4
	lsls r1, r5, #2
	adds r4, r0, r1
	movs r3, #0
	adds r7, r2, #0
	cmp r3, r5
	bge _08019098
_08019088:
	ldr r1, [r2]
	lsls r0, r3, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r4, r4, r6
	adds r3, #1
	cmp r3, r5
	blt _08019088
_08019098:
	ldr r0, [r7]
	adds r0, #8
	mov r1, ip
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080190A8: .4byte 0x03000438

	thumb_func_start MapFill
MapFill: @ 0x080190AC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r3, r1, #0
	ldr r0, _08019104 @ =0x0202E3D8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r1, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #2
	adds r4, r1, #0
	muls r4, r0, r4
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080190D0
	subs r4, #1
_080190D0:
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #8
	adds r3, r3, r0
	mov r0, sp
	strh r3, [r0]
	adds r0, r5, #0
	subs r0, #8
	ldr r1, [r0]
	lsrs r2, r4, #0x1f
	adds r2, r4, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuSet
	adds r0, r5, #0
	bl sub_0801B190
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019104: .4byte 0x0202E3D8

	thumb_func_start sub_08019108
sub_08019108: @ 0x08019108
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _08019170 @ =0x0202E3D8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r4, r1
	bge _0801913C
	adds r5, r7, #0
	adds r2, r6, #0
_08019122:
	ldr r0, [r2]
	strb r3, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldm r2!, {r1}
	adds r0, r0, r1
	subs r0, #1
	strb r3, [r0]
	adds r4, #1
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _08019122
_0801913C:
	movs r1, #0
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r1, r0
	bge _08019168
	adds r2, r7, #0
_08019148:
	ldr r0, [r6]
	adds r0, r0, r1
	strb r3, [r0]
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r6
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
	adds r1, #1
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	blt _08019148
_08019168:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019170: .4byte 0x0202E3D8

	thumb_func_start UnpackRawMap
UnpackRawMap: @ 0x08019174
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetChapterMap
	adds r1, r4, #0
	bl Decompress
	ldr r5, _080191C4 @ =0x0202E3D8
	ldrb r0, [r4]
	strh r0, [r5]
	ldrb r0, [r4, #1]
	strh r0, [r5, #2]
	ldr r4, _080191C8 @ =0x08C9C9C8
	adds r0, r6, #0
	bl GetChapterInfo
	ldrb r0, [r0, #7]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080191CC @ =0x02030A90
	bl Decompress
	ldr r1, _080191D0 @ =0x0202BBB8
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xf0
	strh r0, [r1, #0x28]
	movs r2, #2
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xa0
	strh r0, [r1, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080191C4: .4byte 0x0202E3D8
_080191C8: .4byte 0x08C9C9C8
_080191CC: .4byte 0x02030A90
_080191D0: .4byte 0x0202BBB8

	thumb_func_start ApplyChapterMapGraphics
ApplyChapterMapGraphics: @ 0x080191D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08019230 @ =0x08C9C9C8
	bl GetChapterInfo
	ldrb r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019234 @ =0x06008000
	bl Decompress
	adds r0, r4, #0
	bl GetChapterInfo
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08019212
	adds r0, r4, #0
	bl GetChapterInfo
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019238 @ =0x0600C000
	bl Decompress
_08019212:
	adds r0, r4, #0
	bl GetChapterInfo
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019230: .4byte 0x08C9C9C8
_08019234: .4byte 0x06008000
_08019238: .4byte 0x0600C000

	thumb_func_start ApplyChapterMapPalettes
ApplyChapterMapPalettes: @ 0x0801923C
	push {r4, lr}
	ldr r4, _08019264 @ =0x08C9C9C8
	ldr r0, _08019268 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019264: .4byte 0x08C9C9C8
_08019268: .4byte 0x0202BBF8

	thumb_func_start InitMetatilesMap
InitMetatilesMap: @ 0x0801926C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08019320 @ =0x08B932B4
	ldr r0, [r3]
	mov sb, r0
	ldr r5, _08019324 @ =0x02001000
	ldr r1, _08019328 @ =0x0202E3D8
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	adds r5, #2
	movs r4, #2
	ldrsh r2, [r1, r4]
	lsls r0, r2, #2
	add r0, sb
	mov ip, r0
	movs r4, #0
	mov sl, r1
	cmp r4, r2
	bge _080192E2
	mov r7, sl
_0801929C:
	lsls r3, r4, #2
	mov r1, sb
	adds r0, r3, r1
	mov r1, ip
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #1
	add ip, r0
	movs r2, #0
	adds r6, r4, #1
	cmp r2, r1
	bge _080192D8
	ldr r1, _08019320 @ =0x08B932B4
	mov r8, r1
	adds r4, r3, #0
_080192BC:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r5]
	strh r1, [r0]
	adds r5, #2
	adds r2, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r2, r0
	blt _080192BC
_080192D8:
	adds r4, r6, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r4, r0
	blt _0801929C
_080192E2:
	ldr r1, _08019320 @ =0x08B932B4
	ldr r0, [r1]
	lsls r1, r4, #2
	adds r1, r1, r0
	subs r1, #4
	ldr r5, [r1]
	movs r2, #0
	mov r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bge _0801930A
	movs r1, #0
_080192FC:
	strh r1, [r5]
	adds r5, #2
	adds r2, #1
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	blt _080192FC
_0801930A:
	mov r1, sl
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r1, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019320: .4byte 0x08B932B4
_08019324: .4byte 0x02001000
_08019328: .4byte 0x0202E3D8

	thumb_func_start RefreshTerrainMap
RefreshTerrainMap: @ 0x0801932C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _080193AC @ =0x0202E3D8
	mov sb, r0
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _0801939A
	mov r8, sb
	ldr r3, _080193B0 @ =0x08B932B4
	mov sl, r3
_0801934A:
	movs r3, #0
	mov r4, r8
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r6, r1, #1
	cmp r3, r0
	bge _0801938E
	ldr r4, _080193B4 @ =0x0202E3E0
	mov ip, r4
	lsls r4, r1, #2
	ldr r5, _080193B8 @ =0x08B932B0
	mov r7, sl
_08019362:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, [r0]
	adds r2, r2, r3
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r1, r0, #2
	ldr r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r3, r0
	blt _08019362
_0801938E:
	adds r1, r6, #0
	mov r2, sb
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _0801934A
_0801939A:
	bl sub_0802BC80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080193AC: .4byte 0x0202E3D8
_080193B0: .4byte 0x08B932B4
_080193B4: .4byte 0x0202E3E0
_080193B8: .4byte 0x08B932B0

	thumb_func_start sub_080193BC
sub_080193BC: @ 0x080193BC
	ldr r2, _080193D8 @ =0x08B932B4
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r1, r0, #2
	ldr r0, _080193DC @ =0x08B932B0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080193D8: .4byte 0x08B932B4
_080193DC: .4byte 0x08B932B0

	thumb_func_start PutMapMetatile
PutMapMetatile: @ 0x080193E0
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r2, r2, #7
	adds r0, r0, r2
	lsls r1, r1, #2
	adds r5, r0, r1
	ldr r0, _08019444 @ =0x08B932B4
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	ldr r0, _08019448 @ =0x02030A90
	adds r2, r1, r0
	ldr r0, _0801944C @ =0x0202E3EC
	ldr r0, [r0]
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r3, #0xb0
	lsls r3, r3, #8
	cmp r0, #0
	beq _0801941A
	movs r3, #0xc0
	lsls r3, r3, #7
_0801941A:
	ldrh r1, [r2]
	adds r0, r1, r3
	strh r0, [r5]
	adds r2, #2
	ldrh r4, [r2]
	adds r0, r4, r3
	strh r0, [r5, #2]
	adds r2, #2
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r4, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r1, #2
	ldrh r2, [r2, #2]
	adds r0, r2, r3
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019444: .4byte 0x08B932B4
_08019448: .4byte 0x02030A90
_0801944C: .4byte 0x0202E3EC

	thumb_func_start sub_08019450
sub_08019450: @ 0x08019450
	bx lr
	.align 2, 0

	thumb_func_start PutLimitViewSquare
PutLimitViewSquare: @ 0x08019454
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x10]
	lsls r0, r0, #5
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r4, r4, r0
	cmp r4, #0
	bne _0801946E
	bl sub_08019450
_0801946E:
	ldr r0, _08019490 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08019498
	movs r1, #0x85
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _08019494 @ =0x00004281
	b _080194D2
	.align 2, 0
_08019490: .4byte 0x0202E3E4
_08019494: .4byte 0x00004281
_08019498:
	ldr r0, _080194BC @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080194F0
	ldrh r0, [r4]
	cmp r0, #0
	beq _080194C8
	ldr r1, _080194C0 @ =0x00005284
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _080194C4 @ =0x00005285
	b _080194D2
	.align 2, 0
_080194BC: .4byte 0x0202E3E8
_080194C0: .4byte 0x00005284
_080194C4: .4byte 0x00005285
_080194C8:
	movs r1, #0xa5
	lsls r1, r1, #7
	adds r0, r1, #0
	strh r0, [r4]
	ldr r2, _080194EC @ =0x00005281
_080194D2:
	adds r0, r2, #0
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	b _080194FE
	.align 2, 0
_080194EC: .4byte 0x00005281
_080194F0:
	strh r1, [r4]
	strh r1, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_080194FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start RenderMap
RenderMap: @ 0x08019504
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08019578 @ =0x0202BBB8
	ldrh r2, [r0, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x24]
	ldrh r2, [r0, #0xe]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #0x26]
	movs r5, #9
	adds r7, r0, #0
_0801951E:
	movs r4, #0xe
	subs r6, r5, #1
_08019522:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _0801957C @ =0x02024460
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutMapMetatile
	subs r4, #1
	cmp r4, #0
	bge _08019522
	adds r5, r6, #0
	cmp r5, #0
	bge _0801951E
	movs r0, #8
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08019580 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019578: .4byte 0x0202BBB8
_0801957C: .4byte 0x02024460
_08019580: .4byte 0x03002870

	thumb_func_start RenderMapForFade
RenderMapForFade: @ 0x08019584
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl sub_08001434
	ldr r1, _080195E8 @ =0x0202BBB8
	ldrh r2, [r1, #0xc]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x26]
	movs r5, #9
	adds r7, r1, #0
_080195A8:
	movs r4, #0xe
	subs r6, r5, #1
_080195AC:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _080195EC @ =0x02023C60
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutMapMetatile
	subs r4, #1
	cmp r4, #0
	bge _080195AC
	adds r5, r6, #0
	cmp r5, #0
	bge _080195A8
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080195E8: .4byte 0x0202BBB8
_080195EC: .4byte 0x02023C60

	thumb_func_start sub_080195F0
sub_080195F0: @ 0x080195F0
	push {r4, r5, lr}
	ldr r2, _08019620 @ =0x0202BBB8
	ldrh r4, [r2, #0xc]
	movs r0, #0xc
	ldrsh r3, [r2, r0]
	ldrh r0, [r2, #0x10]
	movs r5, #0x10
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019634
	cmp r3, r1
	ble _08019624
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019634
	movs r0, #0xf
	bl sub_080196D0
	b _08019634
	.align 2, 0
_08019620: .4byte 0x0202BBB8
_08019624:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019634
	movs r0, #0
	bl sub_080196D0
_08019634:
	ldr r2, _08019664 @ =0x0202BBB8
	ldrh r4, [r2, #0xe]
	movs r5, #0xe
	ldrsh r3, [r2, r5]
	ldrh r0, [r2, #0x12]
	movs r5, #0x12
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019678
	cmp r3, r1
	ble _08019668
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019678
	movs r0, #0xa
	bl sub_0801979C
	b _08019678
	.align 2, 0
_08019664: .4byte 0x0202BBB8
_08019668:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019678
	movs r0, #0
	bl sub_0801979C
_08019678:
	ldr r4, _080196CC @ =0x0202BBB8
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldrh r5, [r4, #0x24]
	lsls r1, r5, #4
	ldrh r0, [r4, #0xc]
	subs r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #0x26]
	lsls r2, r3, #4
	ldrh r5, [r4, #0xe]
	subs r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
	movs r0, #1
	ldrb r1, [r4, #4]
	ands r0, r1
	cmp r0, #0
	beq _080196C4
	ldrh r3, [r4, #0x24]
	lsls r1, r3, #4
	ldrh r5, [r4, #0xc]
	subs r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x26]
	lsls r2, r0, #4
	ldrh r4, [r4, #0xe]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
_080196C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080196CC: .4byte 0x0202BBB8

	thumb_func_start sub_080196D0
sub_080196D0: @ 0x080196D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019744 @ =0x0202BBB8
	ldrh r1, [r4, #0xc]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r2, [r4, #0xe]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	lsls r2, r1, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	ldrh r2, [r4, #0x24]
	subs r3, r3, r2
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	ldrh r0, [r4, #0x26]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r0, #1
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	bne _0801974C
	movs r6, #0xa
	movs r4, #0xf
_0801971E:
	mov r1, sb
	adds r2, r1, r6
	ands r2, r4
	mov r1, sl
	adds r0, r1, r6
	str r0, [sp]
	ldr r0, _08019748 @ =0x02024460
	adds r1, r7, #0
	mov r3, r8
	bl PutMapMetatile
	subs r6, #1
	cmp r6, #0
	bge _0801971E
	movs r0, #8
	bl EnableBgSync
	b _08019782
	.align 2, 0
_08019744: .4byte 0x0202BBB8
_08019748: .4byte 0x02024460
_0801974C:
	movs r6, #0xa
_0801974E:
	mov r2, sb
	adds r4, r2, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	str r5, [sp]
	ldr r0, _08019794 @ =0x02024460
	adds r1, r7, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutMapMetatile
	str r4, [sp]
	ldr r0, _08019798 @ =0x02023C60
	mov r1, r8
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutLimitViewSquare
	subs r6, #1
	cmp r6, #0
	bge _0801974E
	movs r0, #0xc
	bl EnableBgSync
_08019782:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019794: .4byte 0x02024460
_08019798: .4byte 0x02023C60

	thumb_func_start sub_0801979C
sub_0801979C: @ 0x0801979C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019810 @ =0x0202BBB8
	ldrh r1, [r4, #0xc]
	lsls r2, r1, #0x10
	asrs r2, r2, #0x14
	lsls r1, r2, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r1, [r4, #0xe]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r4, #0x24]
	subs r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldrh r1, [r4, #0x26]
	subs r3, r3, r1
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	movs r0, #1
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	bne _08019818
	movs r6, #0xf
	movs r4, #0xf
_080197EA:
	mov r0, sb
	adds r1, r0, r6
	ands r1, r4
	mov r0, sl
	adds r3, r0, r6
	mov r0, r8
	str r0, [sp]
	ldr r0, _08019814 @ =0x02024460
	adds r2, r7, #0
	bl PutMapMetatile
	subs r6, #1
	cmp r6, #0
	bge _080197EA
	movs r0, #8
	bl EnableBgSync
	b _08019850
	.align 2, 0
_08019810: .4byte 0x0202BBB8
_08019814: .4byte 0x02024460
_08019818:
	movs r6, #0xf
_0801981A:
	mov r1, sb
	adds r4, r1, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	mov r1, r8
	str r1, [sp]
	ldr r0, _08019860 @ =0x02024460
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl PutMapMetatile
	str r7, [sp]
	ldr r0, _08019864 @ =0x02023C60
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl PutLimitViewSquare
	subs r6, #1
	cmp r6, #0
	bge _0801981A
	movs r0, #0xc
	bl EnableBgSync
_08019850:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019860: .4byte 0x02024460
_08019864: .4byte 0x02023C60

	thumb_func_start sub_08019868
sub_08019868: @ 0x08019868
	push {r4, r5, r6, r7, lr}
	movs r7, #1
_0801986C:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _080198C0
	ldr r0, [r6]
	cmp r0, #0
	beq _080198C0
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080198C0
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _08019950 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
	ldr r0, _08019954 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080198C0
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	adds r0, r6, #0
	bl sub_080175BC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A2D4
_080198C0:
	adds r7, #1
	cmp r7, #0x7f
	ble _0801986C
	ldr r0, _08019954 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	beq _08019998
	movs r7, #0x81
_080198D0:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019986
	ldr r2, [r6]
	cmp r2, #0
	beq _08019986
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019986
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08019910
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_08019910:
	ldr r0, _08019954 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019960
	ldr r0, _08019958 @ =0x0202E3EC
	ldr r0, [r0]
	lsls r1, r2, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019960
	ldr r0, _0801995C @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r6, #0xc]
	b _08019986
	.align 2, 0
_08019950: .4byte 0x0202E3DC
_08019954: .4byte 0x0202BBF8
_08019958: .4byte 0x0202E3EC
_0801995C: .4byte 0x0202E3F0
_08019960:
	ldr r0, _08019990 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
	ldr r1, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019986
	ldr r0, _08019994 @ =0xFFFFFDFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
	str r1, [r6, #0xc]
_08019986:
	adds r7, #1
	cmp r7, #0xc5
	ble _080198D0
	b _08019A2C
	.align 2, 0
_08019990: .4byte 0x0202E3DC
_08019994: .4byte 0xFFFFFDFF
_08019998:
	movs r7, #0x81
_0801999A:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019A26
	ldr r2, [r6]
	cmp r2, #0
	beq _08019A26
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019A26
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _080199DA
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_080199DA:
	ldr r0, _08019A08 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019A18
	ldr r0, _08019A0C @ =0x0202E3EC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019A10
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	b _08019A16
	.align 2, 0
_08019A08: .4byte 0x0202BBF8
_08019A0C: .4byte 0x0202E3EC
_08019A10:
	ldr r0, [r6, #0xc]
	ldr r1, _08019A34 @ =0xFFFFFDFF
	ands r0, r1
_08019A16:
	str r0, [r6, #0xc]
_08019A18:
	ldr r0, _08019A38 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
_08019A26:
	adds r7, #1
	cmp r7, #0xc5
	ble _0801999A
_08019A2C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019A34: .4byte 0xFFFFFDFF
_08019A38: .4byte 0x0202E3DC

	thumb_func_start sub_08019A3C
sub_08019A3C: @ 0x08019A3C
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _08019A5C
_08019A48:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	bne _08019A5A
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #3]
	movs r3, #1
	bl sub_0801A2D4
_08019A5A:
	adds r4, #8
_08019A5C:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08019A48
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08019A68
sub_08019A68: @ 0x08019A68
	push {r4, r5, lr}
	movs r0, #0
	bl GetTrap
	adds r2, r0, #0
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08019AAE
	ldr r5, _08019AB4 @ =0x0202E3DC
	ldr r4, _08019AB8 @ =0x0202E3F0
_08019A7C:
	ldrb r0, [r2, #2]
	cmp r0, #0xb
	bne _08019AA6
	ldr r0, [r5]
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldrb r3, [r2]
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019AA6
	ldr r0, [r4]
	adds r0, r1, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #2
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
_08019AA6:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _08019A7C
_08019AAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019AB4: .4byte 0x0202E3DC
_08019AB8: .4byte 0x0202E3F0

	thumb_func_start RefreshEntityMaps
RefreshEntityMaps: @ 0x08019ABC
	push {lr}
	ldr r0, _08019AF8 @ =0x0202E3DC
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, _08019AFC @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, _08019B00 @ =0x0202E3EC
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08019B04 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08019AE2
	movs r1, #1
_08019AE2:
	adds r0, r2, #0
	bl MapFill
	bl sub_08019A3C
	bl sub_08019868
	bl sub_08019A68
	pop {r0}
	bx r0
	.align 2, 0
_08019AF8: .4byte 0x0202E3DC
_08019AFC: .4byte 0x0202E3F0
_08019B00: .4byte 0x0202E3EC
_08019B04: .4byte 0x0202BBF8

	thumb_func_start sub_08019B08
sub_08019B08: @ 0x08019B08
	push {lr}
	ldr r1, _08019B1C @ =0x08BE50E8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	pop {r1}
	bx r1
	.align 2, 0
_08019B1C: .4byte 0x08BE50E8

	thumb_func_start sub_08019B20
sub_08019B20: @ 0x08019B20
	ldr r1, _08019B2C @ =0x08BE47C4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019B2C: .4byte 0x08BE47C4

	thumb_func_start sub_08019B30
sub_08019B30: @ 0x08019B30
	ldr r1, _08019B3C @ =0x08BE4805
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019B3C: .4byte 0x08BE4805

	thumb_func_start sub_08019B40
sub_08019B40: @ 0x08019B40
	push {r4, r5, r6, lr}
	ldr r4, _08019B94 @ =0x02030A90
	ldr r5, _08019B98 @ =0x000003FF
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r0, r6
	adds r4, #2
	bl sub_08001840
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	adds r0, r0, r6
	adds r4, #2
	bl sub_08001840
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	adds r0, r0, r6
	adds r4, #2
	bl sub_08001840
	ldrh r4, [r4]
	ands r5, r4
	adds r5, r5, r6
	adds r0, r5, #0
	bl sub_08001840
	ldr r1, _08019B9C @ =0x02022860
	movs r0, #0x86
	lsls r0, r0, #7
	strh r0, [r1]
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019B94: .4byte 0x02030A90
_08019B98: .4byte 0x000003FF
_08019B9C: .4byte 0x02022860

	thumb_func_start MapFloodUnit
MapFloodUnit: @ 0x08019BA0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08019BD8 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019BDC @ =0x030041E0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019BD8: .4byte 0x0202E3E4
_08019BDC: .4byte 0x030041E0

	thumb_func_start MapFloodUnitMovement
MapFloodUnitMovement: @ 0x08019BE0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08019C14 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019C18 @ =0x030041E0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019C14: .4byte 0x0202E3E4
_08019C18: .4byte 0x030041E0

	thumb_func_start MapFloodUnitExtended
MapFloodUnitExtended: @ 0x08019C1C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08019C48 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019C4C @ =0x030041E0
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019C48: .4byte 0x0202E3E4
_08019C4C: .4byte 0x030041E0

	thumb_func_start MapFloodRange_Unitless
MapFloodRange_Unitless: @ 0x08019C50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl SetWorkingMoveTable
	ldr r0, _08019C78 @ =0x0202E3E8
	ldr r1, [r0]
	ldr r0, _08019C7C @ =0x030041E0
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019C78: .4byte 0x0202E3E8
_08019C7C: .4byte 0x030041E0

	thumb_func_start MapFloodExtended
MapFloodExtended: @ 0x08019C80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl SetWorkingMoveTable
	ldr r0, _08019CA8 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019CAC @ =0x030041E0
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019CA8: .4byte 0x0202E3E4
_08019CAC: .4byte 0x030041E0

	thumb_func_start MapFloodOnWorkingMap
MapFloodOnWorkingMap: @ 0x08019CB0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	bl BeginMapFlood
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetWorkingMoveTable
SetWorkingMoveTable: @ 0x08019CE0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _08019CFC @ =0x030043F0
_08019CE8:
	adds r0, r2, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x40
	ble _08019CE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019CFC: .4byte 0x030043F0

	thumb_func_start BeginMapFlood
BeginMapFlood: @ 0x08019D00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, _08019D20 @ =0x030046A0
	ldr r0, _08019D24 @ =0x030041F0
	str r0, [r1, #4]
	ldr r0, _08019D28 @ =0x03004490
	str r0, [r1]
	strb r2, [r1, #9]
	adds r6, r1, #0
	cmp r3, #0
	bne _08019D2C
	strb r3, [r6, #8]
	b _08019D32
	.align 2, 0
_08019D20: .4byte 0x030046A0
_08019D24: .4byte 0x030041F0
_08019D28: .4byte 0x03004490
_08019D2C:
	movs r0, #1
	strb r0, [r6, #8]
	strb r3, [r6, #0xa]
_08019D32:
	movs r0, #0
	mov r8, r0
	movs r0, #0x78
	strb r0, [r6, #0xb]
	ldr r4, _08019D80 @ =0x030041E0
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, [r6, #4]
	strb r5, [r0]
	ldr r0, [r6, #4]
	strb r7, [r0, #1]
	ldr r1, [r6, #4]
	movs r0, #5
	strb r0, [r1, #2]
	ldr r0, [r6, #4]
	mov r1, r8
	strb r1, [r0, #3]
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r6, #4]
	adds r0, #4
	str r0, [r6, #4]
	movs r1, #4
	strb r1, [r0, #2]
	bl MapFloodCoreRam
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019D80: .4byte 0x030041E0

	thumb_func_start sub_08019D84
sub_08019D84: @ 0x08019D84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r6, r1, #0
	mov ip, r2
	ldr r5, _08019E48 @ =0x030046A0
	ldr r2, [r5]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r6, r6, r0
	movs r0, #1
	ldrsb r0, [r2, r0]
	add ip, r0
	ldr r3, _08019E4C @ =0x030043F0
	ldr r0, _08019E50 @ =0x0202E3E0
	ldr r0, [r0]
	mov r1, ip
	lsls r7, r1, #2
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, r0, r3
	mov sb, r0
	ldr r4, _08019E54 @ =0x030041E0
	ldr r1, [r4]
	ldrb r3, [r2, #1]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, sb
	ldrb r2, [r2]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	cmp r0, r1
	bge _08019E3C
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08019E0A
	ldr r0, _08019E58 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019E0A
	ldrb r3, [r5, #0xa]
	eors r0, r3
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08019E3C
_08019E0A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r5, #9]
	cmp r0, r1
	bgt _08019E3C
	ldr r0, [r5, #4]
	strb r6, [r0]
	ldr r0, [r5, #4]
	mov r3, ip
	strb r3, [r0, #1]
	ldr r0, [r5, #4]
	mov r1, r8
	strb r1, [r0, #2]
	ldr r0, [r5, #4]
	strb r2, [r0, #3]
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	ldr r1, [r4]
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
_08019E3C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019E48: .4byte 0x030046A0
_08019E4C: .4byte 0x030043F0
_08019E50: .4byte 0x0202E3E0
_08019E54: .4byte 0x030041E0
_08019E58: .4byte 0x0202E3DC

	thumb_func_start sub_08019E5C
sub_08019E5C: @ 0x08019E5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov sb, r1
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0
	mov ip, r0
	ldr r1, _08019EAC @ =0x030041E0
	ldr r0, [r1]
	mov r3, sb
	lsls r2, r3, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08019E8E
	b _08019FF2
_08019E8E:
	mov r4, sp
	add r7, sp, #4
	mov sl, r7
	mov r8, r2
_08019E96:
	ldr r0, _08019EB0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	cmp r6, r0
	bne _08019EB4
	movs r0, #0xff
	ldrb r3, [r4]
	orrs r0, r3
	b _08019EBE
	.align 2, 0
_08019EAC: .4byte 0x030041E0
_08019EB0: .4byte 0x0202E3D8
_08019EB4:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
_08019EBE:
	strb r0, [r4]
	cmp r6, #0
	bne _08019ECC
	ldrb r0, [r4, #1]
	movs r7, #0xff
	orrs r0, r7
	b _08019ED8
_08019ECC:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
_08019ED8:
	strb r0, [r4, #1]
	ldr r2, _08019EF0 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	cmp sb, r0
	bne _08019EF4
	ldrb r0, [r4, #3]
	movs r7, #0xff
	orrs r0, r7
	b _08019EFE
	.align 2, 0
_08019EF0: .4byte 0x0202E3D8
_08019EF4:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
_08019EFE:
	strb r0, [r4, #3]
	mov r0, sb
	cmp r0, #0
	bne _08019F0E
	ldrb r0, [r4, #2]
	movs r1, #0xff
	orrs r0, r1
	b _08019F1A
_08019F0E:
	ldr r0, [r1]
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
_08019F1A:
	strb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r7, #0
	movs r2, #0
	ldr r3, [sp, #8]
	adds r3, #1
	str r3, [sp, #0x10]
_08019F2A:
	mov r3, sp
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _08019F36
	adds r1, r0, #0
_08019F36:
	adds r2, #1
	cmp r2, #3
	ble _08019F2A
	movs r2, #0
	adds r5, r1, #0
	add r3, sp, #4
_08019F42:
	mov r1, sp
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r5, r0
	bne _08019F60
	adds r1, r7, #0
	lsls r0, r1, #0x10
	movs r7, #0x80
	lsls r7, r7, #9
	adds r0, r0, r7
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r3, r1
	strb r2, [r1]
_08019F60:
	adds r2, #1
	cmp r2, #3
	ble _08019F42
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08019F86
	cmp r0, #2
	bgt _08019F78
	cmp r0, #1
	beq _08019F82
	b _08019F9A
_08019F78:
	cmp r0, #3
	beq _08019F8A
	cmp r0, #4
	beq _08019F8E
	b _08019F9A
_08019F82:
	mov r0, sl
	b _08019F96
_08019F86:
	movs r0, #2
	b _08019F90
_08019F8A:
	movs r0, #3
	b _08019F90
_08019F8E:
	movs r0, #4
_08019F90:
	bl RandNext
	add r0, sl
_08019F96:
	ldrb r0, [r0]
	mov ip, r0
_08019F9A:
	mov r2, ip
	ldr r1, [sp, #8]
	strb r2, [r1]
	ldr r3, [sp, #0x10]
	str r3, [sp, #8]
	mov r0, ip
	cmp r0, #1
	beq _08019FC2
	cmp r0, #1
	bgt _08019FB4
	cmp r0, #0
	beq _08019FBE
	b _08019FDC
_08019FB4:
	cmp r0, #2
	beq _08019FD0
	cmp r0, #3
	beq _08019FC6
	b _08019FDC
_08019FBE:
	adds r6, #1
	b _08019FDC
_08019FC2:
	subs r6, #1
	b _08019FDC
_08019FC6:
	movs r7, #4
	add r8, r7
	movs r0, #1
	add sb, r0
	b _08019FDC
_08019FD0:
	movs r1, #4
	rsbs r1, r1, #0
	add r8, r1
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
_08019FDC:
	ldr r1, _0801A00C @ =0x030041E0
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08019FF2
	b _08019E96
_08019FF2:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl sub_0801A010
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A00C: .4byte 0x030041E0

	thumb_func_start sub_0801A010
sub_0801A010: @ 0x0801A010
	sub sp, #0x40
	adds r3, r0, #0
	mov r2, sp
	cmp r1, r3
	bls _0801A026
_0801A01A:
	subs r1, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #1
	cmp r1, r3
	bhi _0801A01A
_0801A026:
	movs r0, #4
	strb r0, [r2]
	mov r2, sp
	b _0801A034
_0801A02E:
	strb r0, [r3]
	adds r2, #1
	adds r3, #1
_0801A034:
	ldrb r0, [r2]
	cmp r0, #4
	bne _0801A02E
	movs r0, #4
	strb r0, [r3]
	add sp, #0x40
	bx lr
	.align 2, 0

	thumb_func_start sub_0801A044
sub_0801A044: @ 0x0801A044
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r3, r1, #0
	adds r4, r2, #0
	ldr r5, _0801A058 @ =0x02033E00
	ldr r6, _0801A05C @ =0x0203A85C
	ldr r0, _0801A060 @ =0x0202E3F0
	mov ip, r0
	b _0801A066
	.align 2, 0
_0801A058: .4byte 0x02033E00
_0801A05C: .4byte 0x0203A85C
_0801A060: .4byte 0x0202E3F0
_0801A064:
	adds r5, #1
_0801A066:
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	ldrb r0, [r5]
	cmp r0, #1
	beq _0801A08E
	cmp r0, #1
	bgt _0801A07A
	cmp r0, #0
	beq _0801A08A
	b _0801A090
_0801A07A:
	cmp r0, #2
	beq _0801A086
	cmp r0, #3
	bne _0801A090
	subs r4, #1
	b _0801A090
_0801A086:
	adds r4, #1
	b _0801A090
_0801A08A:
	subs r3, #1
	b _0801A090
_0801A08E:
	adds r3, #1
_0801A090:
	ldr r0, [r7]
	ldr r2, [r7, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	ldr r0, _0801A0C8 @ =0x02001808
	ands r1, r0
	lsls r2, r4, #2
	cmp r1, #0
	bne _0801A0CC
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A0CC
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1b
	strb r0, [r6, #0x11]
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	b _0801A0F4
	.align 2, 0
_0801A0C8: .4byte 0x02001808
_0801A0CC:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A0EE
	movs r0, #0xa
	strb r0, [r5]
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1b
	strb r0, [r6, #0x11]
	b _0801A0F4
_0801A0EE:
	ldrb r0, [r5]
	cmp r0, #4
	bne _0801A064
_0801A0F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801A0FC
sub_0801A0FC: @ 0x0801A0FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801A1DC @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801A1E0 @ =0x030046A0
	mov sb, r7
	cmp r4, #0
	blt _0801A1C4
	mov ip, r1
	mov sl, sb
_0801A11A:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801A1BE
	lsls r5, r4, #2
	mov r6, sl
_0801A12E:
	ldr r1, _0801A1E4 @ =0x0202E3E4
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r2, [r1]
	cmp r2, #0x78
	bhi _0801A1B8
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801A1B8
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A158
	cmp r3, #0
	beq _0801A158
	strb r2, [r1]
_0801A158:
	ldr r7, _0801A1E4 @ =0x0202E3E4
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A17A
	mov r2, ip
	movs r7, #0
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r3, r0
	beq _0801A17A
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801A17A:
	ldr r1, _0801A1E4 @ =0x0202E3E4
	ldr r0, [r1]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A196
	cmp r4, #0
	beq _0801A196
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A196:
	ldr r2, _0801A1E4 @ =0x0202E3E4
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A1B8
	mov r7, ip
	movs r2, #2
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r4, r0
	beq _0801A1B8
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A1B8:
	subs r3, #1
	cmp r3, #0
	bge _0801A12E
_0801A1BE:
	mov r4, r8
	cmp r4, #0
	bge _0801A11A
_0801A1C4:
	mov r7, sb
	ldrb r0, [r7, #0xb]
	adds r0, #1
	strb r0, [r7, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A1DC: .4byte 0x0202E3D8
_0801A1E0: .4byte 0x030046A0
_0801A1E4: .4byte 0x0202E3E4

	thumb_func_start sub_0801A1E8
sub_0801A1E8: @ 0x0801A1E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801A2C8 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801A2CC @ =0x030046A0
	mov sb, r7
	cmp r4, #0
	blt _0801A2B0
	mov ip, r1
	mov sl, sb
_0801A206:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801A2AA
	lsls r5, r4, #2
	mov r6, sl
_0801A21A:
	ldr r1, _0801A2D0 @ =0x030041E0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r2, [r1]
	cmp r2, #0x78
	bhi _0801A2A4
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801A2A4
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A244
	cmp r3, #0
	beq _0801A244
	strb r2, [r1]
_0801A244:
	ldr r7, _0801A2D0 @ =0x030041E0
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A266
	mov r2, ip
	movs r7, #0
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r3, r0
	beq _0801A266
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801A266:
	ldr r1, _0801A2D0 @ =0x030041E0
	ldr r0, [r1]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A282
	cmp r4, #0
	beq _0801A282
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A282:
	ldr r2, _0801A2D0 @ =0x030041E0
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A2A4
	mov r7, ip
	movs r2, #2
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r4, r0
	beq _0801A2A4
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A2A4:
	subs r3, #1
	cmp r3, #0
	bge _0801A21A
_0801A2AA:
	mov r4, r8
	cmp r4, #0
	bge _0801A206
_0801A2B0:
	mov r7, sb
	ldrb r0, [r7, #0xb]
	adds r0, #1
	strb r0, [r7, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A2C8: .4byte 0x0202E3D8
_0801A2CC: .4byte 0x030046A0
_0801A2D0: .4byte 0x030041E0

	thumb_func_start sub_0801A2D4
sub_0801A2D4: @ 0x0801A2D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sb, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r4, sb
	adds r0, r4, r5
	cmp r4, r0
	bgt _0801A354
	ldr r1, _0801A3D0 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _0801A354
_0801A2FC:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A30C
	adds r0, r0, r1
	movs r1, #0
_0801A30C:
	adds r3, r1, r0
	ldr r2, _0801A3D0 @ =0x0202E3D8
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801A31A
	adds r3, r0, #0
_0801A31A:
	adds r2, r1, #0
	subs r5, #1
	adds r7, r4, #1
	mov r6, sb
	add r6, r8
	cmp r2, r3
	bge _0801A344
	ldr r0, _0801A3D4 @ =0x030041E0
	mov ip, r0
	lsls r4, r4, #2
_0801A32E:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	add r1, sl
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0801A32E
_0801A344:
	adds r4, r7, #0
	cmp r4, r6
	bgt _0801A354
	ldr r2, _0801A3D0 @ =0x0202E3D8
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r4, r0
	blt _0801A2FC
_0801A354:
	mov r5, r8
	subs r5, #1
	mov r4, sb
	subs r4, #1
	mov r0, sb
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r4, r8
	blt _0801A3BE
	cmp r4, #0
	blt _0801A3BE
	ldr r2, _0801A3D0 @ =0x0202E3D8
	mov ip, r2
	ldr r6, _0801A3D4 @ =0x030041E0
	mov sb, r6
_0801A374:
	ldr r0, [sp]
	subs r1, r0, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A384
	adds r0, r0, r1
	movs r1, #0
_0801A384:
	adds r3, r1, r0
	mov r2, ip
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801A392
	adds r3, r0, #0
_0801A392:
	adds r2, r1, #0
	subs r5, #1
	subs r6, r4, #1
	cmp r2, r3
	bge _0801A3B4
	mov r7, sb
	lsls r4, r4, #2
_0801A3A0:
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	add r1, sl
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0801A3A0
_0801A3B4:
	adds r4, r6, #0
	cmp r6, r8
	blt _0801A3BE
	cmp r6, #0
	bge _0801A374
_0801A3BE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A3D0: .4byte 0x0202E3D8
_0801A3D4: .4byte 0x030041E0

	thumb_func_start sub_0801A3D8
sub_0801A3D8: @ 0x0801A3D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sb, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r3, sb
	adds r0, r3, r5
	cmp r3, r0
	bgt _0801A454
	ldr r4, _0801A4CC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _0801A454
_0801A400:
	ldr r2, [sp]
	subs r1, r2, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A410
	adds r0, r0, r1
	movs r1, #0
_0801A410:
	adds r2, r1, r0
	ldr r4, _0801A4CC @ =0x0202E3D8
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801A41E
	adds r2, r0, #0
_0801A41E:
	subs r6, r5, #1
	adds r7, r3, #1
	mov r0, sb
	add r0, r8
	mov ip, r0
	cmp r1, r2
	bge _0801A442
	ldr r5, _0801A4D0 @ =0x030041E0
	lsls r4, r3, #2
_0801A430:
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801A430
_0801A442:
	adds r5, r6, #0
	adds r3, r7, #0
	cmp r3, ip
	bgt _0801A454
	ldr r4, _0801A4CC @ =0x0202E3D8
	movs r6, #2
	ldrsh r0, [r4, r6]
	cmp r3, r0
	blt _0801A400
_0801A454:
	mov r5, r8
	subs r5, #1
	mov r3, sb
	subs r3, #1
	mov r0, sb
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r3, r8
	blt _0801A4BC
	cmp r3, #0
	blt _0801A4BC
	ldr r2, _0801A4CC @ =0x0202E3D8
	mov ip, r2
	ldr r4, _0801A4D0 @ =0x030041E0
	mov sb, r4
_0801A474:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A484
	adds r0, r0, r1
	movs r1, #0
_0801A484:
	adds r2, r1, r0
	mov r4, ip
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801A492
	adds r2, r0, #0
_0801A492:
	subs r6, r5, #1
	subs r4, r3, #1
	cmp r1, r2
	bge _0801A4B0
	mov r7, sb
	lsls r5, r3, #2
_0801A49E:
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801A49E
_0801A4B0:
	adds r5, r6, #0
	adds r3, r4, #0
	cmp r4, r8
	blt _0801A4BC
	cmp r4, #0
	bge _0801A474
_0801A4BC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A4CC: .4byte 0x0202E3D8
_0801A4D0: .4byte 0x030041E0

	thumb_func_start sub_0801A4D4
sub_0801A4D4: @ 0x0801A4D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	bl GetUnitWeaponReach
	subs r0, #1
	cmp r0, #0xe
	bls _0801A4F2
	b _0801AB72
_0801A4F2:
	lsls r0, r0, #2
	ldr r1, _0801A4FC @ =_0801A500
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A4FC: .4byte _0801A500
_0801A500: @ jump table
	.4byte _0801A53C @ case 0
	.4byte _0801A710 @ case 1
	.4byte _0801A5D8 @ case 2
	.4byte _0801A848 @ case 3
	.4byte _0801A980 @ case 4
	.4byte _0801A7AC @ case 5
	.4byte _0801A674 @ case 6
	.4byte _0801AB72 @ case 7
	.4byte _0801AB72 @ case 8
	.4byte _0801AB72 @ case 9
	.4byte _0801AB72 @ case 10
	.4byte _0801A8E4 @ case 11
	.4byte _0801AA34 @ case 12
	.4byte _0801AB72 @ case 13
	.4byte _0801AAEC @ case 14
_0801A53C:
	ldr r0, _0801A5C8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A54A
	b _0801AB72
_0801A54A:
	ldr r0, _0801A5C8 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A5C0
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A564:
	ldr r0, _0801A5CC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A5B4
	ldr r0, _0801A5D0 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A5B4
	ldr r0, _0801A5D4 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A5B4
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801A5B4:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A564
_0801A5C0:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A54A
	b _0801AB72
	.align 2, 0
_0801A5C8: .4byte 0x0202E3D8
_0801A5CC: .4byte 0x0202E3E4
_0801A5D0: .4byte 0x0202E3DC
_0801A5D4: .4byte 0x0202E3F4
_0801A5D8:
	ldr r0, _0801A664 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A5E6
	b _0801AB72
_0801A5E6:
	ldr r0, _0801A664 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801A65A
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A5FE:
	ldr r0, _0801A668 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A64E
	ldr r0, _0801A66C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A64E
	ldr r0, _0801A670 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A64E
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801A64E:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A5FE
_0801A65A:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A5E6
	b _0801AB72
	.align 2, 0
_0801A664: .4byte 0x0202E3D8
_0801A668: .4byte 0x0202E3E4
_0801A66C: .4byte 0x0202E3DC
_0801A670: .4byte 0x0202E3F4
_0801A674:
	ldr r0, _0801A700 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A682
	b _0801AB72
_0801A682:
	ldr r0, _0801A700 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A6F8
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A69C:
	ldr r0, _0801A704 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A6EC
	ldr r0, _0801A708 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A6EC
	ldr r0, _0801A70C @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A6EC
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801A6EC:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A69C
_0801A6F8:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A682
	b _0801AB72
	.align 2, 0
_0801A700: .4byte 0x0202E3D8
_0801A704: .4byte 0x0202E3E4
_0801A708: .4byte 0x0202E3DC
_0801A70C: .4byte 0x0202E3F4
_0801A710:
	ldr r0, _0801A79C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A71E
	b _0801AB72
_0801A71E:
	ldr r0, _0801A79C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801A792
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A736:
	ldr r0, _0801A7A0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A786
	ldr r0, _0801A7A4 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A786
	ldr r0, _0801A7A8 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A786
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801A786:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A736
_0801A792:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A71E
	b _0801AB72
	.align 2, 0
_0801A79C: .4byte 0x0202E3D8
_0801A7A0: .4byte 0x0202E3E4
_0801A7A4: .4byte 0x0202E3DC
_0801A7A8: .4byte 0x0202E3F4
_0801A7AC:
	ldr r0, _0801A838 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A7BA
	b _0801AB72
_0801A7BA:
	ldr r0, _0801A838 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A830
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A7D4:
	ldr r0, _0801A83C @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A824
	ldr r0, _0801A840 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A824
	ldr r0, _0801A844 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A824
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801A824:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A7D4
_0801A830:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A7BA
	b _0801AB72
	.align 2, 0
_0801A838: .4byte 0x0202E3D8
_0801A83C: .4byte 0x0202E3E4
_0801A840: .4byte 0x0202E3DC
_0801A844: .4byte 0x0202E3F4
_0801A848:
	ldr r0, _0801A8D4 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A856
	b _0801AB72
_0801A856:
	ldr r0, _0801A8D4 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801A8CA
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A86E:
	ldr r0, _0801A8D8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A8BE
	ldr r0, _0801A8DC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A8BE
	ldr r0, _0801A8E0 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A8BE
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801A8BE:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A86E
_0801A8CA:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A856
	b _0801AB72
	.align 2, 0
_0801A8D4: .4byte 0x0202E3D8
_0801A8D8: .4byte 0x0202E3E4
_0801A8DC: .4byte 0x0202E3DC
_0801A8E0: .4byte 0x0202E3F4
_0801A8E4:
	ldr r0, _0801A970 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A8F2
	b _0801AB72
_0801A8F2:
	ldr r0, _0801A970 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A968
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A90C:
	ldr r0, _0801A974 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A95C
	ldr r0, _0801A978 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A95C
	ldr r0, _0801A97C @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A95C
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801A95C:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A90C
_0801A968:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A8F2
	b _0801AB72
	.align 2, 0
_0801A970: .4byte 0x0202E3D8
_0801A974: .4byte 0x0202E3E4
_0801A978: .4byte 0x0202E3DC
_0801A97C: .4byte 0x0202E3F4
_0801A980:
	ldr r0, _0801AA24 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A98E
	b _0801AB72
_0801A98E:
	ldr r0, _0801AA24 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AA1C
	lsls r7, r6, #2
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801A9A6:
	ldr r0, _0801AA28 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AA10
	ldr r0, _0801AA2C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA10
	ldr r0, _0801AA30 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA10
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AA10:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A9A6
_0801AA1C:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A98E
	b _0801AB72
	.align 2, 0
_0801AA24: .4byte 0x0202E3D8
_0801AA28: .4byte 0x0202E3E4
_0801AA2C: .4byte 0x0202E3DC
_0801AA30: .4byte 0x0202E3F4
_0801AA34:
	ldr r0, _0801AADC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AA42
	b _0801AB72
_0801AA42:
	ldr r0, _0801AADC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801AAD2
	lsls r7, r6, #2
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801AA5C:
	ldr r0, _0801AAE0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AAC6
	ldr r0, _0801AAE4 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AAC6
	ldr r0, _0801AAE8 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AAC6
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AAC6:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801AA5C
_0801AAD2:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AA42
	b _0801AB72
	.align 2, 0
_0801AADC: .4byte 0x0202E3D8
_0801AAE0: .4byte 0x0202E3E4
_0801AAE4: .4byte 0x0202E3DC
_0801AAE8: .4byte 0x0202E3F4
_0801AAEC:
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801AB72
_0801AAF8:
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AB6C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AB10:
	ldr r0, _0801AC50 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AB60
	ldr r0, _0801AC54 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB60
	ldr r0, _0801AC58 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB60
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AB60:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801AB10
_0801AB6C:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AAF8
_0801AB72:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801AC34
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801AC34
_0801AB92:
	ldr r0, _0801AC4C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AC2E
	lsls r0, r6, #2
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801ABAE:
	ldr r0, _0801AC50 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AC22
	ldr r0, _0801AC54 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC22
	ldr r0, _0801AC58 @ =0x0202E3F4
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC22
	mov r0, r8
	adds r1, r6, #0
	bl sub_080346C8
	adds r7, r0, #0
	cmp r7, #0
	beq _0801AC22
	mov r1, r8
	lsls r5, r1, #0x10
	asrs r5, r5, #0x10
	bl sub_0801736C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl sub_08017384
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	mov r1, sl
	movs r3, #1
	bl sub_0801A2D4
	subs r4, #1
	adds r0, r5, #0
	mov r1, sl
	adds r2, r4, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AC22:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r0, r8
	cmp r0, #0
	bge _0801ABAE
_0801AC2E:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AB92
_0801AC34:
	ldr r2, _0801AC50 @ =0x0202E3E4
	ldr r1, [r2]
	ldr r0, _0801AC5C @ =0x030041E0
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801AC4C: .4byte 0x0202E3D8
_0801AC50: .4byte 0x0202E3E4
_0801AC54: .4byte 0x0202E3DC
_0801AC58: .4byte 0x0202E3F4
_0801AC5C: .4byte 0x030041E0

	thumb_func_start BuildUnitStandingRangeForReach
BuildUnitStandingRangeForReach: @ 0x0801AC60
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	subs r0, r1, #1
	cmp r0, #0x1f
	bls _0801AC74
	b _0801AE08
_0801AC74:
	lsls r0, r0, #2
	ldr r1, _0801AC80 @ =_0801AC84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801AC80: .4byte _0801AC84
_0801AC84: @ jump table
	.4byte _0801AD04 @ case 0
	.4byte _0801AD1C @ case 1
	.4byte _0801AD0C @ case 2
	.4byte _0801AD44 @ case 3
	.4byte _0801AD6C @ case 4
	.4byte _0801AD30 @ case 5
	.4byte _0801AD14 @ case 6
	.4byte _0801AE08 @ case 7
	.4byte _0801AE08 @ case 8
	.4byte _0801AE08 @ case 9
	.4byte _0801AE08 @ case 10
	.4byte _0801AD58 @ case 11
	.4byte _0801AD9A @ case 12
	.4byte _0801AE08 @ case 13
	.4byte _0801ADC8 @ case 14
	.4byte _0801AE08 @ case 15
	.4byte _0801AE08 @ case 16
	.4byte _0801AE08 @ case 17
	.4byte _0801AE08 @ case 18
	.4byte _0801AE08 @ case 19
	.4byte _0801AE08 @ case 20
	.4byte _0801AE08 @ case 21
	.4byte _0801AE08 @ case 22
	.4byte _0801AE08 @ case 23
	.4byte _0801AE08 @ case 24
	.4byte _0801AE08 @ case 25
	.4byte _0801AE08 @ case 26
	.4byte _0801AE08 @ case 27
	.4byte _0801AE08 @ case 28
	.4byte _0801AE08 @ case 29
	.4byte _0801AE08 @ case 30
	.4byte _0801ADE4 @ case 31
_0801AD04:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801ADCE
_0801AD0C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADCE
_0801AD14:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	b _0801ADCE
_0801AD1C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801ADDA
_0801AD30:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801ADDA
_0801AD44:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801AD58:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801AD6C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801AD9A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801ADC8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
_0801ADCE:
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
_0801ADDA:
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
	b _0801AE08
_0801ADE4:
	adds r0, r2, #0
	bl GetUnitMagRange
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AE08:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801AE10
sub_0801AE10: @ 0x0801AE10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl sub_08016FCC
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMagRange
	adds r2, r0, #0
	cmp r5, #3
	beq _0801AED0
	cmp r5, #3
	bgt _0801AE38
	cmp r5, #1
	beq _0801AE40
	b _0801AFEA
_0801AE38:
	cmp r5, #0x20
	bne _0801AE3E
	b _0801AF60
_0801AE3E:
	b _0801AFEA
_0801AE40:
	ldr r0, _0801AEC0 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801AE4E
	b _0801AFEA
_0801AE4E:
	ldr r0, _0801AEC0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801AEB8
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801AE64:
	ldr r0, _0801AEC4 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AEB2
	ldr r0, _0801AEC8 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB2
	ldr r0, _0801AECC @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB2
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AEB2:
	subs r5, #1
	cmp r5, #0
	bge _0801AE64
_0801AEB8:
	mov r1, r8
	cmp r1, #0
	bge _0801AE4E
	b _0801AFEA
	.align 2, 0
_0801AEC0: .4byte 0x0202E3D8
_0801AEC4: .4byte 0x0202E3E4
_0801AEC8: .4byte 0x0202E3DC
_0801AECC: .4byte 0x0202E3F4
_0801AED0:
	ldr r0, _0801AF50 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801AEDE
	b _0801AFEA
_0801AEDE:
	ldr r0, _0801AF50 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801AF48
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801AEF4:
	ldr r0, _0801AF54 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AF42
	ldr r0, _0801AF58 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF42
	ldr r0, _0801AF5C @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF42
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AF42:
	subs r5, #1
	cmp r5, #0
	bge _0801AEF4
_0801AF48:
	mov r1, r8
	cmp r1, #0
	bge _0801AEDE
	b _0801AFEA
	.align 2, 0
_0801AF50: .4byte 0x0202E3D8
_0801AF54: .4byte 0x0202E3E4
_0801AF58: .4byte 0x0202E3DC
_0801AF5C: .4byte 0x0202E3F4
_0801AF60:
	ldr r0, _0801AFF8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0801AFEA
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801AF72:
	ldr r0, _0801AFF8 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801AFE4
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r0, sl
	lsls r0, r0, #0x10
	mov sb, r0
_0801AF8E:
	ldr r0, _0801AFFC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AFDE
	ldr r0, _0801B000 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFDE
	ldr r0, _0801B004 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFDE
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, sb
	asrs r2, r3, #0x10
	movs r3, #1
	bl sub_0801A2D4
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A2D4
_0801AFDE:
	subs r5, #1
	cmp r5, #0
	bge _0801AF8E
_0801AFE4:
	mov r1, r8
	cmp r1, #0
	bge _0801AF72
_0801AFEA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801AFF8: .4byte 0x0202E3D8
_0801AFFC: .4byte 0x0202E3E4
_0801B000: .4byte 0x0202E3DC
_0801B004: .4byte 0x0202E3F4

	thumb_func_start sub_0801B008
sub_0801B008: @ 0x0801B008
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	ldr r0, _0801B038 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	bl sub_080238EC
	mov sb, r0
	mov r6, sb
	adds r6, #1
	b _0801B12C
	.align 2, 0
_0801B038: .4byte 0x0202E3E8
_0801B03C:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801B128
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B128
	ldr r1, [sp]
	lsls r0, r1, #0x18
	mov r8, r0
	cmp r0, #0
	beq _0801B064
	adds r0, r4, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B128
_0801B064:
	ldr r0, _0801B0F4 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801B086
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B0F8 @ =0x0202E3EC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B128
_0801B086:
	ldr r5, [r4, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0801B128
	ldr r0, [r4, #4]
	ldrb r2, [r4, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r1, r2, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl MapFloodUnitMovement
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B0FC @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r7, [r0]
	strb r5, [r0]
	adds r0, r4, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp sl, r5
	beq _0801B0DE
	ldr r0, _0801B100 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	cmp r5, #0
	beq _0801B0DC
	movs r0, #1
	bl sub_0801B148
_0801B0DC:
	mov sl, r5
_0801B0DE:
	ldr r0, _0801B104 @ =0x0202E3E8
	ldr r1, [r0]
	ldr r0, _0801B108 @ =0x030041E0
	str r1, [r0]
	mov r0, r8
	cmp r0, #0
	beq _0801B10C
	adds r0, r4, #0
	bl sub_0801AE10
	b _0801B112
	.align 2, 0
_0801B0F4: .4byte 0x0202BBF8
_0801B0F8: .4byte 0x0202E3EC
_0801B0FC: .4byte 0x0202E3DC
_0801B100: .4byte 0x0202E3F4
_0801B104: .4byte 0x0202E3E8
_0801B108: .4byte 0x030041E0
_0801B10C:
	adds r0, r4, #0
	bl sub_0801A4D4
_0801B112:
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B144 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
_0801B128:
	adds r6, #1
	mov r0, sb
_0801B12C:
	adds r0, #0x80
	cmp r6, r0
	bge _0801B134
	b _0801B03C
_0801B134:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B144: .4byte 0x0202E3DC

	thumb_func_start sub_0801B148
sub_0801B148: @ 0x0801B148
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x81
_0801B14E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801B182
	ldr r1, [r2]
	cmp r1, #0
	beq _0801B182
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801B182
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0xa
	adds r3, r5, #0
	bl sub_0801A3D8
_0801B182:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801B14E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801B190
sub_0801B190: @ 0x0801B190
	ldr r1, _0801B198 @ =0x030041E0
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B198: .4byte 0x030041E0

	thumb_func_start sub_0801B19C
sub_0801B19C: @ 0x0801B19C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r2, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_0801A2D4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #1
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0801A2D4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801B1DC
sub_0801B1DC: @ 0x0801B1DC
	ldr r0, _0801B1E0 @ =0x030043F0
	bx lr
	.align 2, 0
_0801B1E0: .4byte 0x030043F0

	thumb_func_start sub_0801B1E4
sub_0801B1E4: @ 0x0801B1E4
	push {r4, lr}
	sub sp, #8
	bl GetGameTime
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl FormatTime
	movs r0, #1
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #3
	cmp r0, #0
	bne _0801B208
	movs r1, #2
_0801B208:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801B214
sub_0801B214: @ 0x0801B214
	push {r4, lr}
	sub sp, #8
	bl GetGameTime
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl FormatTime
	movs r0, #1
	ldrh r4, [r4]
	ands r0, r4
	movs r1, #3
	cmp r0, #0
	beq _0801B238
	movs r1, #2
_0801B238:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801B244
sub_0801B244: @ 0x0801B244
	movs r0, #8
	bx lr

	thumb_func_start sub_0801B248
sub_0801B248: @ 0x0801B248
	movs r0, #0x17
	bx lr

	thumb_func_start sub_0801B24C
sub_0801B24C: @ 0x0801B24C
	bx lr
	.align 2, 0

	thumb_func_start sub_0801B250
sub_0801B250: @ 0x0801B250
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801B26C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #4
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801B268
	adds r0, r2, #0
	bl Proc_Break
_0801B268:
	pop {r0}
	bx r0
	.align 2, 0
_0801B26C: .4byte 0x08B857F8

	thumb_func_start sub_0801B270
sub_0801B270: @ 0x0801B270
	push {lr}
	movs r0, #0x10
	bl sub_08001D54
	pop {r0}
	bx r0

	thumb_func_start sub_0801B27C
sub_0801B27C: @ 0x0801B27C
	bx lr
	.align 2, 0

	thumb_func_start sub_0801B280
sub_0801B280: @ 0x0801B280
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	ldr r1, [r0, #0x2c]
	mov r8, r1
	ldr r4, [r0, #0x30]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r5, [r1]
	ldr r6, [r0, #0x54]
	add r0, sp, #4
	adds r1, r5, #0
	bl InitText
	add r0, sp, #4
	adds r1, r6, #0
	bl Text_DrawString
	adds r5, #2
	movs r0, #0
	str r0, [sp]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl sub_08049CE4
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _0801B2E0 @ =0x02022C60
	adds r4, r4, r0
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_08005590
	movs r0, #3
	bl EnableBgSync
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B2E0: .4byte 0x02022C60

	thumb_func_start sub_0801B2E4
sub_0801B2E4: @ 0x0801B2E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, _0801B310 @ =0x08B93344
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	str r4, [r0, #0x54]
	adds r0, #0x52
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B310: .4byte 0x08B93344

	thumb_func_start sub_0801B314
sub_0801B314: @ 0x0801B314
	push {lr}
	bl sub_0804A424
	bl ClearUi
	ldr r0, _0801B334 @ =0x08B958D8
	bl StartMenu
	movs r0, #2
	movs r1, #0
	bl sub_08004EF8
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0801B334: .4byte 0x08B958D8

	thumb_func_start sub_0801B338
sub_0801B338: @ 0x0801B338
	push {r4, r5, lr}
	adds r2, r1, #0
	ldr r3, _0801B3B8 @ =0x08B857F8
	ldr r1, [r3]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B354
	adds r1, r2, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B354:
	ldr r1, [r3]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r2, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801B36A
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801B36A:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x42
	ble _0801B378
	movs r0, #0x42
	strb r0, [r1]
_0801B378:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801B384
	movs r0, #0
	strb r0, [r1]
_0801B384:
	ldr r1, [r3]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B3B0
	ldr r4, _0801B3BC @ =0x02022D2E
	ldr r1, _0801B3C0 @ =0x081C3B74
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldr r1, [r0]
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
_0801B3B0:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B3B8: .4byte 0x08B857F8
_0801B3BC: .4byte 0x02022D2E
_0801B3C0: .4byte 0x081C3B74

	thumb_func_start sub_0801B3C4
sub_0801B3C4: @ 0x0801B3C4
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0802E3B0
	ldr r1, _0801B3E4 @ =0x0202BBF8
	adds r4, #0x3c
	ldrb r0, [r4]
	strb r0, [r1, #0xe]
	bl sub_0802E3D4
	bl sub_08012B88
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B3E4: .4byte 0x0202BBF8

	thumb_func_start sub_0801B3E8
sub_0801B3E8: @ 0x0801B3E8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl sub_080AAD7C
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x3c
	movs r0, #0
	strb r0, [r6]
	bl GetCurrentBgmSong
	movs r1, #0
	cmp r1, r4
	bge _0801B41C
	cmp r0, #0
	bne _0801B40C
	strb r1, [r6]
	b _0801B41C
_0801B40C:
	adds r1, #1
	cmp r1, r4
	bge _0801B41C
	cmp r0, r1
	bne _0801B40C
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
_0801B41C:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0801B468 @ =0x08CE4D28
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B46C @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005590
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B468: .4byte 0x08CE4D28
_0801B46C: .4byte 0x02022C60

	thumb_func_start sub_0801B470
sub_0801B470: @ 0x0801B470
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _0801B51C @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B48C
	adds r1, r6, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B48C:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801B4A2
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801B4A2:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801B4B0
	movs r0, #0
	strb r0, [r1]
_0801B4B0:
	ldr r7, _0801B520 @ =0x08CE4D28
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bge _0801B4C6
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0801B4C6:
	ldr r1, [r2]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B512
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B524 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005590
_0801B512:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B51C: .4byte 0x08B857F8
_0801B520: .4byte 0x08CE4D28
_0801B524: .4byte 0x02022C60

	thumb_func_start sub_0801B528
sub_0801B528: @ 0x0801B528
	push {lr}
	ldr r2, _0801B554 @ =0x08CE4D28
	ldr r0, _0801B558 @ =0x08CE5378
	cmp r2, r0
	bne _0801B560
	ldr r0, _0801B55C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801B578
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0]
	bl sub_080BE594
	b _0801B578
	.align 2, 0
_0801B554: .4byte 0x08CE4D28
_0801B558: .4byte 0x08CE5378
_0801B55C: .4byte 0x0202BBF8
_0801B560:
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	movs r2, #0
	bl StartBgmExt
_0801B578:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801B580
sub_0801B580: @ 0x0801B580
	push {lr}
	bl sub_0804A424
	movs r0, #0
	bl sub_08006D50
	bl ClearUi
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801B598
sub_0801B598: @ 0x0801B598
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r1, #0
	ldr r0, _0801B60C @ =0x081C3B80
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0801B610 @ =0x08B9333C
	bl Proc_Find
	adds r4, r0, #0
	adds r5, r6, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0801B614 @ =0x00001247
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B618 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_08005590
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B60C: .4byte 0x081C3B80
_0801B610: .4byte 0x08B9333C
_0801B614: .4byte 0x00001247
_0801B618: .4byte 0x02022C60

	thumb_func_start sub_0801B61C
sub_0801B61C: @ 0x0801B61C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801B660 @ =0x08B9333C
	bl Proc_Find
	adds r2, r0, #0
	ldr r0, _0801B664 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801B656
	adds r0, r2, #0
	adds r0, #0x66
	movs r1, #1
	ldrh r2, [r0]
	eors r1, r2
	strh r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801B598
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl sub_08005280
_0801B656:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B660: .4byte 0x08B9333C
_0801B664: .4byte 0x08B857F8

	thumb_func_start sub_0801B668
sub_0801B668: @ 0x0801B668
	movs r0, #0
	bx lr

	thumb_func_start sub_0801B66C
sub_0801B66C: @ 0x0801B66C
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801B6E8 @ =0x081C3B88
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0801B6EC @ =0x08B9333C
	bl Proc_Find
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801B6F0 @ =0x0000124F
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, [r6, #0x58]
	movs r1, #7
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B6F4 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005590
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B6E8: .4byte 0x081C3B88
_0801B6EC: .4byte 0x08B9333C
_0801B6F0: .4byte 0x0000124F
_0801B6F4: .4byte 0x02022C60

	thumb_func_start sub_0801B6F8
sub_0801B6F8: @ 0x0801B6F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0801B738 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801B796
	ldr r0, _0801B73C @ =0x08B9333C
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0801B66C
	ldr r0, [r4, #0x58]
	movs r1, #7
	bl __modsi3
	cmp r0, #6
	bhi _0801B796
	lsls r0, r0, #2
	ldr r1, _0801B740 @ =_0801B744
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B738: .4byte 0x08B857F8
_0801B73C: .4byte 0x08B9333C
_0801B740: .4byte _0801B744
_0801B744: @ jump table
	.4byte _0801B760 @ case 0
	.4byte _0801B768 @ case 1
	.4byte _0801B770 @ case 2
	.4byte _0801B778 @ case 3
	.4byte _0801B780 @ case 4
	.4byte _0801B788 @ case 5
	.4byte _0801B790 @ case 6
_0801B760:
	movs r0, #0
	bl SetWeather
	b _0801B796
_0801B768:
	movs r0, #6
	bl SetWeather
	b _0801B796
_0801B770:
	movs r0, #1
	bl SetWeather
	b _0801B796
_0801B778:
	movs r0, #2
	bl SetWeather
	b _0801B796
_0801B780:
	movs r0, #4
	bl SetWeather
	b _0801B796
_0801B788:
	movs r0, #3
	bl SetWeather
	b _0801B796
_0801B790:
	movs r0, #5
	bl SetWeather
_0801B796:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801B7A0
sub_0801B7A0: @ 0x0801B7A0
	movs r0, #0
	bx lr

	thumb_func_start sub_0801B7A4
sub_0801B7A4: @ 0x0801B7A4
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801B808 @ =0x00001250
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0801B80C @ =0x00001251
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertDrawString
	bl sub_080A03A8
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B810 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005590
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B808: .4byte 0x00001250
_0801B80C: .4byte 0x00001251
_0801B810: .4byte 0x02022C60

	thumb_func_start sub_0801B814
sub_0801B814: @ 0x0801B814
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r4, _0801B890 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B8AC
	bl sub_080A03A8
	adds r5, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B842
	cmp r5, #0
	blt _0801B842
	subs r5, #1
_0801B842:
	ldr r0, _0801B890 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B856
	cmp r5, #0xb
	bgt _0801B856
	adds r5, #1
_0801B856:
	mov r0, sp
	bl LoadMetaSave
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
_0801B864:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0801B864
	movs r4, #0
	cmp r4, r5
	bge _0801B880
_0801B872:
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl sub_080A03C8
	cmp r4, r5
	blt _0801B872
_0801B880:
	cmp r5, #0
	bne _0801B894
	mov r1, sp
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1, #0xe]
	ands r0, r2
	b _0801B89C
	.align 2, 0
_0801B890: .4byte 0x08B857F8
_0801B894:
	mov r1, sp
	movs r0, #1
	ldrb r2, [r1, #0xe]
	orrs r0, r2
_0801B89C:
	strb r0, [r1, #0xe]
	mov r0, sp
	bl SaveMetaSave
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0801B7A4
_0801B8AC:
	movs r0, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801B8B8
sub_0801B8B8: @ 0x0801B8B8
	movs r0, #0x17
	bx lr

	thumb_func_start sub_0801B8BC
sub_0801B8BC: @ 0x0801B8BC
	push {lr}
	bl ClearUi
	ldr r0, _0801B8D0 @ =0x08B95848
	bl StartMenu
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_0801B8D0: .4byte 0x08B95848

	thumb_func_start sub_0801B8D4
sub_0801B8D4: @ 0x0801B8D4
	push {lr}
	bl sub_080A049C
	ldr r0, _0801B8FC @ =0x0202BBF8
	movs r1, #0xef
	ldrb r2, [r0, #0x14]
	ands r1, r2
	strb r1, [r0, #0x14]
	bl sub_0802E3D4
	bl sub_080A05F4
	bl sub_080A0810
	movs r0, #0xff
	bl sub_080BFA40
	pop {r1}
	bx r1
	.align 2, 0
_0801B8FC: .4byte 0x0202BBF8

	thumb_func_start sub_0801B900
sub_0801B900: @ 0x0801B900
	push {r4, lr}
	ldr r4, _0801B920 @ =0x02022D2E
	movs r0, #0
	bl GetChapterInfo
	ldr r1, [r0]
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B920: .4byte 0x02022D2E

	thumb_func_start sub_0801B924
sub_0801B924: @ 0x0801B924
	push {r4, lr}
	ldr r0, _0801B974 @ =sub_0801529C
	bl sub_080019B8
	ldr r0, _0801B978 @ =OnVBlank
	bl SetOnVBlank
	bl sub_0802E368
	movs r0, #2
	movs r1, #0
	bl sub_08004EF8
	ldr r0, _0801B97C @ =0x081C3BA4
	bl sub_08009FF4
	ldr r0, _0801B980 @ =0x08B95890
	bl StartMenu
	ldr r4, _0801B984 @ =0x0202BBB8
	movs r1, #0x40
	ldrb r2, [r4, #4]
	orrs r1, r2
	strb r1, [r4, #4]
	ldr r1, _0801B988 @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	bl sub_0807F8D4
	movs r0, #0xbf
	ldrb r1, [r4, #4]
	ands r0, r1
	strb r0, [r4, #4]
	ldr r0, _0801B98C @ =0x02023CA0
	bl sub_08000B1C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B974: .4byte sub_0801529C
_0801B978: .4byte OnVBlank
_0801B97C: .4byte 0x081C3BA4
_0801B980: .4byte 0x08B95890
_0801B984: .4byte 0x0202BBB8
_0801B988: .4byte 0x0600B000
_0801B98C: .4byte 0x02023CA0

	thumb_func_start sub_0801B990
sub_0801B990: @ 0x0801B990
	push {lr}
	sub sp, #0x14
	ldr r0, [r0, #0x44]
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl EnableBgSync
	add r0, sp, #4
	movs r1, #3
	bl sub_0809E6FC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801B9C0
	ldr r0, [sp, #0x10]
	lsrs r1, r0, #0x10
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0801B9E0
_0801B9C0:
	ldr r0, _0801B9DC @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0xb7
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb6
	b _0801B9FA
	.align 2, 0
_0801B9DC: .4byte 0x00000103
_0801B9E0:
	ldr r0, _0801BA0C @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0xb4
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #0xb2
_0801B9FA:
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	movs r0, #0
	add sp, #0x14
	pop {r1}
	bx r1
	.align 2, 0
_0801BA0C: .4byte 0x00000103

	thumb_func_start sub_0801BA10
sub_0801BA10: @ 0x0801BA10
	push {lr}
	movs r0, #0
	bl sub_08006D50
	movs r0, #1
	bl sub_08006D50
	ldr r2, _0801BA4C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _0801BA50 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	pop {r1}
	bx r1
	.align 2, 0
_0801BA4C: .4byte 0x03002870
_0801BA50: .4byte 0x02022860

	thumb_func_start sub_0801BA54
sub_0801BA54: @ 0x0801BA54
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, #2
	mov ip, r1
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r0, #0
	adds r7, #0xa
	ldr r1, _0801BA98 @ =0x08B857F8
	ldr r3, [r1]
	movs r5, #0x10
	adds r0, r5, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _0801BAAA
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x41
	bgt _0801BA9C
	adds r0, r2, #1
	b _0801BAA8
	.align 2, 0
_0801BA98: .4byte 0x08B857F8
_0801BA9C:
	adds r0, r5, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _0801BAAA
	movs r0, #0
_0801BAA8:
	strb r0, [r1]
_0801BAAA:
	ldr r2, [r6]
	movs r3, #0x20
	adds r0, r3, #0
	ldrh r1, [r2, #6]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801BAD8
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _0801BACA
	subs r0, r1, #1
	b _0801BAD6
_0801BACA:
	adds r0, r3, #0
	ldrh r2, [r2, #8]
	ands r0, r2
	cmp r0, #0
	beq _0801BAD8
	movs r0, #0x42
_0801BAD6:
	strb r0, [r5]
_0801BAD8:
	ldr r1, [r6]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801BB0C
	lsls r4, r7, #5
	add r4, ip
	lsls r4, r4, #1
	ldr r0, _0801BB30 @ =0x02022C60
	adds r4, r4, r0
	ldr r1, _0801BB34 @ =0x081C3B74
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldr r1, [r0]
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
_0801BB0C:
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801BB40
	ldr r1, _0801BB38 @ =0x0202BBF8
	movs r0, #3
	strb r0, [r1, #0x1b]
	ldr r0, _0801BB3C @ =0x0841E2D8
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0801BB52
	.align 2, 0
_0801BB30: .4byte 0x02022C60
_0801BB34: .4byte 0x081C3B74
_0801BB38: .4byte 0x0202BBF8
_0801BB3C: .4byte 0x0841E2D8
_0801BB40:
	ldr r1, _0801BB6C @ =0x0202BBF8
	movs r0, #2
	strb r0, [r1, #0x1b]
	ldr r0, _0801BB70 @ =0x081C8184
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
_0801BB52:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	bgt _0801BB60
	ldr r1, _0801BB6C @ =0x0202BBF8
	movs r0, #1
	strb r0, [r1, #0x1b]
_0801BB60:
	bl EnablePalSync
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BB6C: .4byte 0x0202BBF8
_0801BB70: .4byte 0x081C8184

	thumb_func_start sub_0801BB74
sub_0801BB74: @ 0x0801BB74
	push {r4, lr}
	adds r4, r1, #0
	bl GetGameTime
	bl RandInit
	bl sub_080174D8
	ldr r0, _0801BBA0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801BBA4
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl SaveNewGame
	b _0801BBAE
	.align 2, 0
_0801BBA0: .4byte 0x08B857F8
_0801BBA4:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SaveNewGame
_0801BBAE:
	ldr r0, _0801BBD8 @ =0x0000055B
	bl GetMsg
	bl sub_0802E6EC
	ldr r1, _0801BBDC @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	movs r0, #0
	bl sub_080A0810
	bl sub_0802E3D4
	bl sub_08012B88
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BBD8: .4byte 0x0000055B
_0801BBDC: .4byte 0x0202BBF8

	thumb_func_start sub_0801BBE0
sub_0801BBE0: @ 0x0801BBE0
	push {lr}
	ldr r0, _0801BBF0 @ =0x08B958B4
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BBF0: .4byte 0x08B958B4

	thumb_func_start sub_0801BBF4
sub_0801BBF4: @ 0x0801BBF4
	push {lr}
	ldr r0, _0801BC04 @ =0x08B9586C
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BC04: .4byte 0x08B9586C

	thumb_func_start sub_0801BC08
sub_0801BC08: @ 0x0801BC08
	push {lr}
	movs r0, #3
	bl sub_080A4E0C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801BC18
sub_0801BC18: @ 0x0801BC18
	movs r0, #2
	bx lr

	thumb_func_start sub_0801BC1C
sub_0801BC1C: @ 0x0801BC1C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _0801BC30
	movs r0, #4
	bl sub_080A1100
	movs r0, #0x17
	b _0801BC32
_0801BC30:
	movs r0, #8
_0801BC32:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801BC38
sub_0801BC38: @ 0x0801BC38
	push {lr}
	movs r0, #4
	bl sub_080A1384
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801BC4A
	movs r1, #1
_0801BC4A:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0801BC50
sub_0801BC50: @ 0x0801BC50
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	beq _0801BC5E
	movs r0, #8
	b _0801BC78
_0801BC5E:
	ldr r0, _0801BC7C @ =0x08B92AF8
	bl Proc_Find
	cmp r0, #0
	beq _0801BC6C
	bl sub_0802E3B0
_0801BC6C:
	movs r0, #4
	bl sub_080A1258
	bl sub_08012BAC
	movs r0, #0x17
_0801BC78:
	pop {r1}
	bx r1
	.align 2, 0
_0801BC7C: .4byte 0x08B92AF8

	thumb_func_start sub_0801BC80
sub_0801BC80: @ 0x0801BC80
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	beq _0801BC8E
	movs r0, #8
	b _0801BCA2
_0801BC8E:
	ldr r0, _0801BCA8 @ =0x08B92AF8
	bl Proc_Find
	cmp r0, #0
	beq _0801BC9C
	bl sub_0802E3B0
_0801BC9C:
	bl sub_08012BD0
	movs r0, #0x17
_0801BCA2:
	pop {r1}
	bx r1
	.align 2, 0
_0801BCA8: .4byte 0x08B92AF8

	thumb_func_start sub_0801BCAC
sub_0801BCAC: @ 0x0801BCAC
	push {lr}
	movs r0, #3
	bl sub_080A1384
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801BCBE
	movs r1, #1
_0801BCBE:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0801BCC4
sub_0801BCC4: @ 0x0801BCC4
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _0801BCDC
	movs r0, #3
	bl sub_080A1258
	bl sub_08012BAC
	movs r0, #0x17
	b _0801BCDE
_0801BCDC:
	movs r0, #8
_0801BCDE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801BCE4
sub_0801BCE4: @ 0x0801BCE4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r0, _0801BD54 @ =0x081C3B80
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801BD58 @ =0x00001253
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _0801BD5C @ =0x0202BBF8
	ldrb r2, [r1, #0xd]
	rsbs r0, r2, #0
	orrs r0, r2
	asrs r0, r0, #0x1f
	movs r1, #4
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BD60 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005590
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BD54: .4byte 0x081C3B80
_0801BD58: .4byte 0x00001253
_0801BD5C: .4byte 0x0202BBF8
_0801BD60: .4byte 0x02022C60

	thumb_func_start sub_0801BD64
sub_0801BD64: @ 0x0801BD64
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801BDB2
	ldr r0, _0801BD9C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801BDB2
	ldr r1, _0801BDA0 @ =0x0202BBF8
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _0801BDA4
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	bl SetVisionWithFade
	b _0801BDAA
	.align 2, 0
_0801BD9C: .4byte 0x08B857F8
_0801BDA0: .4byte 0x0202BBF8
_0801BDA4:
	movs r0, #0
	bl SetVisionWithFade
_0801BDAA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801BCE4
_0801BDB2:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801BDBC
sub_0801BDBC: @ 0x0801BDBC
	movs r0, #0
	bx lr

	thumb_func_start sub_0801BDC0
sub_0801BDC0: @ 0x0801BDC0
	push {lr}
	bl StartGame
	movs r0, #7
	pop {r1}
	bx r1

	thumb_func_start sub_0801BDCC
sub_0801BDCC: @ 0x0801BDCC
	push {lr}
	movs r0, #0xc0
	lsls r0, r0, #2
	bl sub_08002D48
	movs r0, #0x17
	pop {r1}
	bx r1

	thumb_func_start sub_0801BDDC
sub_0801BDDC: @ 0x0801BDDC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801BE04 @ =0x081C3BB0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801BE0C
	ldr r0, _0801BE08 @ =0x0202BBF8
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801BE14
	.align 2, 0
_0801BE04: .4byte 0x081C3BB0
_0801BE08: .4byte 0x0202BBF8
_0801BE0C:
	ldr r0, _0801BE74 @ =0x0202BBF8
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801BE14:
	lsrs r6, r0, #0x1e
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _0801BE78 @ =0x081C3BC0
	cmp r0, #0
	beq _0801BE32
	ldr r3, _0801BE7C @ =0x081C3BBC
_0801BE32:
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	lsls r0, r6, #2
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BE80 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_08005590
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BE74: .4byte 0x0202BBF8
_0801BE78: .4byte 0x081C3BC0
_0801BE7C: .4byte 0x081C3BBC
_0801BE80: .4byte 0x02022C60

	thumb_func_start sub_0801BE84
sub_0801BE84: @ 0x0801BE84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r2, _0801BEB4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801BF2C
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _0801BEBC
	ldr r1, _0801BEB8 @ =0x0202BBF8
	adds r0, r1, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801BEC6
	.align 2, 0
_0801BEB4: .4byte 0x08B857F8
_0801BEB8: .4byte 0x0202BBF8
_0801BEBC:
	ldr r1, _0801BF0C @ =0x0202BBF8
	adds r0, r1, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801BEC6:
	lsrs r3, r0, #0x1e
	ldr r0, [r2]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801BED6
	subs r3, #1
_0801BED6:
	movs r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0801BEE0
	adds r3, #1
_0801BEE0:
	cmp r3, #2
	ble _0801BEE6
	movs r3, #2
_0801BEE6:
	cmp r3, #0
	bge _0801BEEC
	movs r3, #0
_0801BEEC:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0801BF10
	adds r2, r1, #0
	adds r2, #0x43
	movs r0, #3
	ands r3, r0
	lsls r1, r3, #1
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0801BF24
	.align 2, 0
_0801BF0C: .4byte 0x0202BBF8
_0801BF10:
	adds r2, r1, #0
	adds r2, #0x42
	movs r0, #3
	ands r3, r0
	lsls r1, r3, #7
	ldr r0, _0801BF34 @ =0xFFFFFE7F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_0801BF24:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0801BDDC
_0801BF2C:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BF34: .4byte 0xFFFFFE7F

	thumb_func_start sub_0801BF38
sub_0801BF38: @ 0x0801BF38
	push {lr}
	bl sub_08012B88
	ldr r0, _0801BF50 @ =0x08B924BC
	bl Proc_Find
	movs r1, #0xf
	bl Proc_Goto
	pop {r1}
	bx r1
	.align 2, 0
_0801BF50: .4byte 0x08B924BC

	thumb_func_start sub_0801BF54
sub_0801BF54: @ 0x0801BF54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r1, #0
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0801C01C @ =0x02022C60
	mov r8, r1
	add r0, r8
	movs r1, #8
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	ldr r6, _0801C020 @ =0x0202BBF8
	adds r7, r6, #0
	adds r7, #0x2b
	movs r0, #1
	ldrb r2, [r7]
	ands r0, r2
	cmp r0, #0
	beq _0801C028
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldrb r0, [r7]
	lsrs r3, r0, #4
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #0
	bl Text_InsertDrawNumberOrBlank
	ldrh r1, [r6, #0x2c]
	lsls r3, r1, #0x13
	lsrs r3, r3, #0x17
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldrh r6, [r6, #0x2c]
	lsls r0, r6, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0xa
	ble _0801BFD2
	movs r3, #0xa
_0801BFD2:
	adds r0, r4, #0
	movs r1, #0x58
	movs r2, #3
	bl Text_InsertDrawNumberOrBlank
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, r8
	adds r0, r4, #0
	bl sub_08005590
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	adds r0, #1
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	ldr r2, _0801C024 @ =0x081C3AC0
	ldrb r7, [r7]
	lsrs r1, r7, #4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl sub_08004E28
	b _0801C05A
	.align 2, 0
_0801C01C: .4byte 0x02022C60
_0801C020: .4byte 0x0202BBF8
_0801C024: .4byte 0x081C3AC0
_0801C028:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801C06C @ =0x00001290
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #1
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, r8
	adds r0, r4, #0
	bl sub_08005590
_0801C05A:
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C06C: .4byte 0x00001290

	thumb_func_start sub_0801C070
sub_0801C070: @ 0x0801C070
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0801C13C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r2, [r0, #6]
	movs r0, #0xcd
	lsls r0, r0, #2
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0801C15A
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801C0B4
	ldr r3, _0801C140 @ =0x0202BBF8
	ldrh r2, [r3, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	cmp r0, #0
	ble _0801C0B4
	subs r1, r0, #1
	cmp r1, #0xff
	ble _0801C0A4
	movs r1, #0xff
_0801C0A4:
	ldr r7, _0801C144 @ =0x000001FF
	adds r0, r7, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _0801C148 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x2c]
_0801C0B4:
	ldr r1, [r4]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801C0E0
	ldr r3, _0801C140 @ =0x0202BBF8
	ldrh r2, [r3, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	adds r1, r0, #1
	cmp r1, #0xff
	ble _0801C0D0
	movs r1, #0xff
_0801C0D0:
	ldr r7, _0801C144 @ =0x000001FF
	adds r0, r7, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _0801C148 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x2c]
_0801C0E0:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801C0FC
	ldr r1, _0801C140 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0801C0FC:
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r0, #0
	beq _0801C116
	ldr r1, _0801C140 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
	strb r0, [r1]
_0801C116:
	movs r0, #4
	ldrh r2, [r2, #6]
	ands r0, r2
	cmp r0, #0
	beq _0801C152
	ldr r0, _0801C140 @ =0x0202BBF8
	adds r3, r0, #0
	adds r3, #0x2b
	ldrb r2, [r3]
	lsrs r1, r2, #4
	cmp r1, #0xa
	bgt _0801C14C
	adds r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	b _0801C150
	.align 2, 0
_0801C13C: .4byte 0x08B857F8
_0801C140: .4byte 0x0202BBF8
_0801C144: .4byte 0x000001FF
_0801C148: .4byte 0xFFFFE00F
_0801C14C:
	movs r0, #0xf
	ands r0, r2
_0801C150:
	strb r0, [r3]
_0801C152:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0801BF54
_0801C15A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801C164
sub_0801C164: @ 0x0801C164
	movs r0, #0x17
	bx lr

	thumb_func_start sub_0801C168
sub_0801C168: @ 0x0801C168
	push {lr}
	ldr r0, _0801C178 @ =0x08B9335C
	movs r1, #3
	bl SpawnProc
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801C178: .4byte 0x08B9335C

	thumb_func_start sub_0801C17C
sub_0801C17C: @ 0x0801C17C
	push {lr}
	ldr r1, _0801C190 @ =0x0203A85C
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl sub_080A1100
	pop {r0}
	bx r0
	.align 2, 0
_0801C190: .4byte 0x0203A85C

	thumb_func_start HandlePlayerMapCursor
HandlePlayerMapCursor: @ 0x0801C194
	push {lr}
	ldr r1, _0801C1C8 @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #4]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0801C1D4
	ldr r0, _0801C1CC @ =0x0202BBB8
	ldr r0, [r0, #0x20]
	ldr r1, _0801C1D0 @ =0x00070007
	ands r0, r1
	cmp r0, #0
	bne _0801C1D4
	ldrh r0, [r2, #0x10]
	bl sub_080155EC
	movs r0, #8
	bl sub_08015714
	movs r0, #8
	bl sub_08015768
	b _0801C1E8
	.align 2, 0
_0801C1C8: .4byte 0x08B857F8
_0801C1CC: .4byte 0x0202BBB8
_0801C1D0: .4byte 0x00070007
_0801C1D4:
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	bl sub_080155EC
	movs r0, #4
	bl sub_08015714
	movs r0, #4
	bl sub_08015768
_0801C1E8:
	ldr r0, _0801C20C @ =0x0202BBB8
	ldrh r1, [r0, #0x20]
	ldrh r2, [r0, #0x22]
	orrs r1, r2
	adds r0, r1, #0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801C206
	ldr r0, _0801C210 @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _0801C214 @ =0x0000FCF4
	ldrh r3, [r1, #8]
	ands r0, r3
	strh r0, [r1, #8]
_0801C206:
	pop {r0}
	bx r0
	.align 2, 0
_0801C20C: .4byte 0x0202BBB8
_0801C210: .4byte 0x08B857F8
_0801C214: .4byte 0x0000FCF4

	thumb_func_start sub_0801C218
sub_0801C218: @ 0x0801C218
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x49
	beq _0801C22E
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x9e
	beq _0801C22E
	movs r0, #1
	b _0801C230
_0801C22E:
	movs r0, #0
_0801C230:
	bx lr
	.align 2, 0

	thumb_func_start PlayerPhase_IdleLoop
PlayerPhase_IdleLoop: @ 0x0801C234
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl HandlePlayerMapCursor
	ldr r4, _0801C270 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C280
	ldr r1, _0801C274 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl TrySwitchViewedUnit
	ldr r0, _0801C278 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801C268
	b _0801C498
_0801C268:
	ldr r0, _0801C27C @ =0x0000038B
	bl sub_080BE594
	b _0801C498
	.align 2, 0
_0801C270: .4byte 0x08B857F8
_0801C274: .4byte 0x0202BBB8
_0801C278: .4byte 0x0202BBF8
_0801C27C: .4byte 0x0000038B
_0801C280:
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C28C
	b _0801C498
_0801C28C:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C304
	ldr r4, _0801C2FC @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r5, _0801C300 @ =0x0202E3DC
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801C304
	bl GetUnit
	bl sub_0801C218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C304
	bl EndAllMus
	bl sub_08085C7C
	movs r0, #0x1f
	bl sub_0807FA2C
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatScreen
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0801C4C4
	.align 2, 0
_0801C2FC: .4byte 0x0202BBB8
_0801C300: .4byte 0x0202E3DC
_0801C304:
	ldr r0, _0801C344 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C3CC
	ldr r5, _0801C348 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _0801C34C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl GetPlayerSelectKind
	cmp r0, #2
	beq _0801C394
	cmp r0, #2
	ble _0801C350
	cmp r0, #3
	beq _0801C3B4
	b _0801C3CC
	.align 2, 0
_0801C344: .4byte 0x08B857F8
_0801C348: .4byte 0x0202BBB8
_0801C34C: .4byte 0x0202E3DC
_0801C350:
	cmp r0, #0
	blt _0801C3CC
	bl sub_08085C7C
	ldr r0, _0801C38C @ =0x0202BBF8
	ldrh r1, [r5, #0x14]
	strb r1, [r0, #0x12]
	ldrh r1, [r5, #0x16]
	strb r1, [r0, #0x13]
	cmp r4, #0
	beq _0801C370
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C370:
	ldr r0, _0801C390 @ =0x08B95AF4
	movs r3, #0x1c
	ldrsh r1, [r5, r3]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x17
	bl sub_0804A224
	bl sub_080790C0
	b _0801C486
	.align 2, 0
_0801C38C: .4byte 0x0202BBF8
_0801C390: .4byte 0x08B95AF4
_0801C394:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _0801C3B0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_0809FF6C
	adds r0, r6, #0
	bl Proc_Break
	b _0801C498
	.align 2, 0
_0801C3B0: .4byte 0x03004690
_0801C3B4:
	adds r0, r4, #0
	bl UnitBeginAction
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
	b _0801C498
_0801C3CC:
	ldr r1, _0801C42C @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #4
	ldrh r3, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq _0801C43C
	ldrh r2, [r2, #4]
	cmp r2, #4
	bne _0801C43C
	ldr r2, _0801C430 @ =0x0202BBF8
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	bne _0801C43C
	movs r0, #0x40
	ldrb r2, [r2, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0801C43C
	ldr r2, _0801C434 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801C438 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C41E
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C41E:
	bl sub_08085C7C
	adds r0, r6, #0
	bl sub_08032770
	b _0801C486
	.align 2, 0
_0801C42C: .4byte 0x08B857F8
_0801C430: .4byte 0x0202BBF8
_0801C434: .4byte 0x0202BBB8
_0801C438: .4byte 0x0202E3DC
_0801C43C:
	ldr r1, [r1]
	movs r0, #8
	ldrh r2, [r1, #8]
	ands r0, r2
	cmp r0, #0
	beq _0801C498
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0801C498
	ldr r2, _0801C490 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _0801C494 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C47E
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C47E:
	bl sub_08085C7C
	bl sub_080A3284
_0801C486:
	adds r0, r6, #0
	movs r1, #9
	bl Proc_Goto
	b _0801C4C4
	.align 2, 0
_0801C490: .4byte 0x0202BBB8
_0801C494: .4byte 0x0202E3DC
_0801C498:
	bl sub_08025FA8
	ldr r1, _0801C4CC @ =0x0202BBB8
	movs r0, #0x20
	ldrsh r4, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_08026064
	lsls r0, r0, #0x18
	movs r2, #0
	cmp r0, #0
	beq _0801C4BC
	movs r2, #3
_0801C4BC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutMapCursor
_0801C4C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C4CC: .4byte 0x0202BBB8

	thumb_func_start sub_0801C4D0
sub_0801C4D0: @ 0x0801C4D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #1
	ldr r5, _0801C538 @ =0x03004690
	ldr r0, [r5]
	ldr r1, [r0, #4]
	ldrb r2, [r0, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r2, r1
	ldr r2, _0801C53C @ =0x0203A85C
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapFloodUnitMovement
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801C570
	ldr r0, _0801C540 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C518
	movs r0, #1
	bl sub_0801B148
_0801C518:
	ldr r0, _0801C544 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	bl sub_080185AC
	cmp r0, #2
	beq _0801C558
	cmp r0, #2
	bgt _0801C548
	cmp r0, #1
	beq _0801C568
	b _0801C570
	.align 2, 0
_0801C538: .4byte 0x03004690
_0801C53C: .4byte 0x0203A85C
_0801C540: .4byte 0x0202E3F4
_0801C544: .4byte 0x0202E3E8
_0801C548:
	cmp r0, #3
	bne _0801C570
	ldr r0, _0801C564 @ =0x0202BBB8
	adds r0, #0x3e
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	beq _0801C568
_0801C558:
	ldr r0, [r5]
	bl sub_0801AE10
	movs r4, #5
	b _0801C570
	.align 2, 0
_0801C564: .4byte 0x0202BBB8
_0801C568:
	ldr r0, [r5]
	bl sub_0801A4D4
	movs r4, #3
_0801C570:
	adds r0, r4, #0
	bl sub_0801D2A0
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0801C57C
sub_0801C57C: @ 0x0801C57C
	push {r4, r5, lr}
	bl sub_0806C040
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C5B8
	ldr r4, _0801C608 @ =0x03004690
	ldr r2, [r4]
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	ldr r1, _0801C60C @ =0x0202BBF8
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _0801C5B8
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0801C5B8
	cmp r1, #4
	beq _0801C5B8
	adds r0, r2, #0
	bl StartMu
	ldr r0, [r4]
	bl HideUnitSprite
_0801C5B8:
	bl SetAutoMuDefaultFacing
	bl sub_08078FC8
	ldr r5, _0801C610 @ =0x0202BBB8
	movs r0, #2
	ldrb r2, [r5, #4]
	orrs r0, r2
	strb r0, [r5, #4]
	ldr r4, _0801C608 @ =0x03004690
	ldr r0, [r4]
	bl sub_0801C4D0
	ldr r4, [r4]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x14
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801C618
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801C618
	movs r0, #0
	bl sub_0802FEF4
	ldr r0, _0801C60C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C61E
	ldr r0, _0801C614 @ =0x00000389
	bl sub_080BE594
	b _0801C61E
	.align 2, 0
_0801C608: .4byte 0x03004690
_0801C60C: .4byte 0x0202BBF8
_0801C610: .4byte 0x0202BBB8
_0801C614: .4byte 0x00000389
_0801C618:
	movs r0, #1
	bl sub_0802FEF4
_0801C61E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0801C624
sub_0801C624: @ 0x0801C624
	push {lr}
	ldr r0, _0801C650 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C63A
	movs r0, #0xe2
	lsls r0, r0, #2
	bl sub_080BE594
_0801C63A:
	ldr r1, _0801C654 @ =0x0202BBB8
	movs r0, #0xfd
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	ldr r0, _0801C658 @ =0x03004690
	ldr r0, [r0]
	bl sub_0801C4D0
	pop {r0}
	bx r0
	.align 2, 0
_0801C650: .4byte 0x0202BBF8
_0801C654: .4byte 0x0202BBB8
_0801C658: .4byte 0x03004690

	thumb_func_start sub_0801C65C
sub_0801C65C: @ 0x0801C65C
	push {r4, r5, r6, lr}
	ldr r4, _0801C6B0 @ =0x0202BBB8
	adds r5, r4, #0
	adds r5, #0x3e
	movs r6, #1
	adds r0, r6, #0
	ldrb r1, [r5]
	ands r0, r1
	bl sub_0801B008
	ldr r0, _0801C6B4 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _0801C6B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C690
	movs r0, #0xe2
	lsls r0, r0, #2
	bl sub_080BE594
_0801C690:
	movs r0, #8
	ldrb r1, [r4, #4]
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #4]
	adds r0, r6, #0
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0801C6BC
	movs r0, #5
	bl sub_0801D2A0
	b _0801C6C2
	.align 2, 0
_0801C6B0: .4byte 0x0202BBB8
_0801C6B4: .4byte 0x0202E3E4
_0801C6B8: .4byte 0x0202BBF8
_0801C6BC:
	movs r0, #3
	bl sub_0801D2A0
_0801C6C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0801C6C8
sub_0801C6C8: @ 0x0801C6C8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xff
	bl HandlePlayerMapCursor
	ldr r0, _0801C6F0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C744
	ldr r4, _0801C6F4 @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	bne _0801C6F8
	bl sub_08018624
	b _0801C722
	.align 2, 0
_0801C6F0: .4byte 0x08B857F8
_0801C6F4: .4byte 0x03004690
_0801C6F8:
	bl sub_0807905C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C706
	movs r4, #5
	b _0801C78E
_0801C706:
	ldr r0, [r4]
	bl GetPlayerSelectKind
	cmp r0, #2
	beq _0801C72C
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801C72C
	adds r0, r2, #0
	bl sub_080185AC
_0801C722:
	movs r4, #2
	cmp r0, #3
	bne _0801C78E
	movs r4, #6
	b _0801C78E
_0801C72C:
	ldr r1, _0801C768 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_0801CEF4
	lsls r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	beq _0801C78E
	movs r4, #1
_0801C744:
	ldr r0, _0801C76C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C774
	ldr r0, _0801C770 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	movs r4, #2
	cmp r0, #0
	beq _0801C78E
	movs r4, #0
	b _0801C78E
	.align 2, 0
_0801C768: .4byte 0x0202BBB8
_0801C76C: .4byte 0x08B857F8
_0801C770: .4byte 0x03004690
_0801C774:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801C782
	movs r4, #3
	b _0801C78E
_0801C782:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C78E
	movs r4, #4
_0801C78E:
	cmp r4, #6
	bls _0801C794
	b _0801C974
_0801C794:
	lsls r0, r4, #2
	ldr r1, _0801C7A0 @ =_0801C7A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C7A0: .4byte _0801C7A4
_0801C7A4: @ jump table
	.4byte _0801C7C0 @ case 0
	.4byte _0801C7DC @ case 1
	.4byte _0801C7FC @ case 2
	.4byte _0801C880 @ case 3
	.4byte _0801C8FC @ case 4
	.4byte _0801C974 @ case 5
	.4byte _0801C944 @ case 6
_0801C7C0:
	ldr r0, _0801C7D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801C7CE
	b _0801C974
_0801C7CE:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl sub_080BE594
	b _0801C974
	.align 2, 0
_0801C7D8: .4byte 0x0202BBF8
_0801C7DC:
	ldr r0, _0801C7F8 @ =0x0202BD4C
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	bl sub_0801D2D4
	adds r0, r5, #0
	bl Proc_Break
	b _0801C994
	.align 2, 0
_0801C7F8: .4byte 0x0202BD4C
_0801C7FC:
	ldr r4, _0801C86C @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	beq _0801C83A
	bl EndAllMus
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xc0
	ldrb r2, [r2, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0801C83A
	ldr r4, _0801C870 @ =0x0202BD4C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetMapCursorPosition
_0801C83A:
	ldr r1, _0801C874 @ =0x0202BBB8
	movs r0, #0xf7
	ldrb r3, [r1, #4]
	ands r0, r3
	strb r0, [r1, #4]
	bl sub_0801D2D4
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, _0801C878 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C862
	ldr r0, _0801C87C @ =0x0000038B
	bl sub_080BE594
_0801C862:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0801C994
	.align 2, 0
_0801C86C: .4byte 0x03004690
_0801C870: .4byte 0x0202BD4C
_0801C874: .4byte 0x0202BBB8
_0801C878: .4byte 0x0202BBF8
_0801C87C: .4byte 0x0000038B
_0801C880:
	ldr r0, _0801C8E8 @ =0x08B90D88
	bl Proc_Find
	cmp r0, #0
	bne _0801C974
	ldr r2, _0801C8EC @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801C8F0 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _0801C8F4 @ =0x0202BD4C
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _0801C8B2
	ldr r0, _0801C8F8 @ =0x03004690
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_0801C8B2:
	cmp r4, #0
	beq _0801C974
	adds r0, r4, #0
	bl GetUnit
	bl sub_0801C218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C974
	bl EndAllMus
	movs r0, #0x1f
	bl sub_0807FA2C
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	b _0801C994
	.align 2, 0
_0801C8E8: .4byte 0x08B90D88
_0801C8EC: .4byte 0x0202BBB8
_0801C8F0: .4byte 0x0202E3DC
_0801C8F4: .4byte 0x0202BD4C
_0801C8F8: .4byte 0x03004690
_0801C8FC:
	ldr r0, _0801C934 @ =0x03004690
	ldr r0, [r0]
	cmp r0, #0
	beq _0801C974
	ldr r4, _0801C938 @ =0x0202BD4C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetMapCursorPosition
	ldr r0, _0801C93C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C974
	ldr r0, _0801C940 @ =0x0000038B
	bl sub_080BE594
	b _0801C974
	.align 2, 0
_0801C934: .4byte 0x03004690
_0801C938: .4byte 0x0202BD4C
_0801C93C: .4byte 0x0202BBF8
_0801C940: .4byte 0x0000038B
_0801C944:
	ldr r4, _0801C968 @ =0x0202BBB8
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_0801D2D4
	movs r0, #8
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	beq _0801C96C
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801C974
	.align 2, 0
_0801C968: .4byte 0x0202BBB8
_0801C96C:
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_0801C974:
	ldr r0, _0801C99C @ =0x03004690
	ldr r0, [r0]
	bl GetPlayerSelectKind
	cmp r0, #2
	bne _0801C984
	bl sub_0803030C
_0801C984:
	ldr r1, _0801C9A0 @ =0x0202BBB8
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl PutMapCursor
_0801C994:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801C99C: .4byte 0x03004690
_0801C9A0: .4byte 0x0202BBB8

	thumb_func_start sub_0801C9A4
sub_0801C9A4: @ 0x0801C9A4
	push {lr}
	ldr r2, _0801C9B8 @ =0x0203A85C
	movs r1, #0
	strb r1, [r2, #0x11]
	movs r1, #2
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0801C9B8: .4byte 0x0203A85C

	thumb_func_start sub_0801C9BC
sub_0801C9BC: @ 0x0801C9BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801CA04 @ =0x03004690
	ldr r1, [r4]
	ldr r2, _0801CA08 @ =0x0202BD4C
	ldrh r0, [r2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	ldr r4, [r4]
	ldr r0, [r4, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CA0C
	adds r0, r4, #0
	bl UnitBeginAction
	b _0801CA12
	.align 2, 0
_0801CA04: .4byte 0x03004690
_0801CA08: .4byte 0x0202BD4C
_0801CA0C:
	adds r0, r4, #0
	bl UnitBeginReMoveAction
_0801CA12:
	ldr r4, _0801CA34 @ =0x03004690
	ldr r0, [r4]
	bl HideUnitSprite
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CA34: .4byte 0x03004690

	thumb_func_start sub_0801CA38
sub_0801CA38: @ 0x0801CA38
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801CA78 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r5, #0
	bl CameraMoveWatchPosition
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	lsrs r5, r1, #0x18
	ldrb r0, [r4, #0x11]
	cmp r0, #0x1f
	bls _0801CA6C
	b _0801CB68
_0801CA6C:
	lsls r0, r0, #2
	ldr r1, _0801CA7C @ =_0801CA80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CA78: .4byte 0x0203A85C
_0801CA7C: .4byte _0801CA80
_0801CA80: @ jump table
	.4byte _0801CB00 @ case 0
	.4byte _0801CB68 @ case 1
	.4byte _0801CB68 @ case 2
	.4byte _0801CB68 @ case 3
	.4byte _0801CB68 @ case 4
	.4byte _0801CB68 @ case 5
	.4byte _0801CB68 @ case 6
	.4byte _0801CB68 @ case 7
	.4byte _0801CB68 @ case 8
	.4byte _0801CB40 @ case 9
	.4byte _0801CB40 @ case 10
	.4byte _0801CB68 @ case 11
	.4byte _0801CB68 @ case 12
	.4byte _0801CB68 @ case 13
	.4byte _0801CB68 @ case 14
	.4byte _0801CB68 @ case 15
	.4byte _0801CB68 @ case 16
	.4byte _0801CB68 @ case 17
	.4byte _0801CB68 @ case 18
	.4byte _0801CB68 @ case 19
	.4byte _0801CB68 @ case 20
	.4byte _0801CB68 @ case 21
	.4byte _0801CB68 @ case 22
	.4byte _0801CB68 @ case 23
	.4byte _0801CB26 @ case 24
	.4byte _0801CB34 @ case 25
	.4byte _0801CB58 @ case 26
	.4byte _0801CB68 @ case 27
	.4byte _0801CB68 @ case 28
	.4byte _0801CB68 @ case 29
	.4byte _0801CB4C @ case 30
	.4byte _0801CB4C @ case 31
_0801CB00:
	ldr r0, _0801CB14 @ =0x0202BBB8
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801CB1C
	ldr r1, _0801CB18 @ =0x0203A85C
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	b _0801CB68
	.align 2, 0
_0801CB14: .4byte 0x0202BBB8
_0801CB18: .4byte 0x0203A85C
_0801CB1C:
	adds r0, r6, #0
	bl sub_0801C9BC
	movs r0, #1
	b _0801CB88
_0801CB26:
	ldr r0, _0801CB30 @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #2
	b _0801CB52
	.align 2, 0
_0801CB30: .4byte 0x0202BBB8
_0801CB34:
	ldr r0, _0801CB3C @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #4
	b _0801CB52
	.align 2, 0
_0801CB3C: .4byte 0x0202BBB8
_0801CB40:
	ldr r0, _0801CB48 @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #1
	b _0801CB52
	.align 2, 0
_0801CB48: .4byte 0x0202BBB8
_0801CB4C:
	ldr r0, _0801CB64 @ =0x0202BBB8
	adds r0, #0x3d
	movs r1, #8
_0801CB52:
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0801CB58:
	adds r0, r6, #0
	bl sub_0801C9A4
	movs r0, #1
	b _0801CB88
	.align 2, 0
_0801CB64: .4byte 0x0202BBB8
_0801CB68:
	ldr r1, _0801CB90 @ =0x0203A85C
	ldrb r0, [r1, #0x11]
	cmp r0, #1
	beq _0801CB84
	ldr r0, _0801CB94 @ =0x0202BBB8
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CB84
	movs r0, #1
	strb r0, [r1, #0x16]
	movs r0, #3
	bl sub_080A1100
_0801CB84:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
_0801CB88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801CB90: .4byte 0x0203A85C
_0801CB94: .4byte 0x0202BBB8

	thumb_func_start sub_0801CB98
sub_0801CB98: @ 0x0801CB98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801CBE8 @ =0x03004690
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r3, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CBE4
	ldr r0, [r2, #0xc]
	ldr r1, _0801CBEC @ =0x00010044
	ands r0, r1
	cmp r0, #0
	bne _0801CBE4
	ldr r4, _0801CBF0 @ =0x0203A85C
	ldrb r0, [r4, #0x11]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801CBE4
	movs r0, #0x1d
	ldrsb r0, [r2, r0]
	movs r1, #0x12
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	ldrb r4, [r4, #0x10]
	cmp r0, r4
	ble _0801CBE4
	bl sub_0801865C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CBF4
_0801CBE4:
	movs r0, #0
	b _0801CC46
	.align 2, 0
_0801CBE8: .4byte 0x03004690
_0801CBEC: .4byte 0x00010044
_0801CBF0: .4byte 0x0203A85C
_0801CBF4:
	ldr r0, _0801CC34 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	bl UnitBeginReMoveAction
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	subs r1, #0x43
	ands r0, r1
	str r0, [r2, #0xc]
	bl EndAllMus
	ldr r0, [r5]
	bl StartMu
	bl SetAutoMuDefaultFacing
	ldr r0, _0801CC38 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801CC3C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0801CC44
	.align 2, 0
_0801CC34: .4byte 0x0202E3E8
_0801CC38: .4byte 0x0202BBF8
_0801CC3C:
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_0801CC44:
	movs r0, #1
_0801CC46:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0801CC4C
sub_0801CC4C: @ 0x0801CC4C
	push {lr}
	bl sub_08079140
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CC5C
	movs r0, #1
	b _0801CC62
_0801CC5C:
	bl sub_08079180
	movs r0, #0
_0801CC62:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801CC68
sub_0801CC68: @ 0x0801CC68
	push {lr}
	ldr r1, _0801CC8C @ =0x03004690
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl CameraMoveWatchPosition
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CC86
	movs r1, #1
_0801CC86:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801CC8C: .4byte 0x03004690

	thumb_func_start sub_0801CC90
sub_0801CC90: @ 0x0801CC90
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801CCC0 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801CCC8
	bl RenderMapForFade
	ldr r1, _0801CCC4 @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl sub_080181D0
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #0
	bl StartMapFade
	bl RefreshUnitSprites
	b _0801CCDA
	.align 2, 0
_0801CCC0: .4byte 0x0202BBF8
_0801CCC4: .4byte 0x0203A85C
_0801CCC8:
	ldr r1, _0801CD0C @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl sub_080181D0
	bl RefreshEntityMaps
	bl RenderMap
_0801CCDA:
	ldr r4, _0801CD10 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	ldr r2, _0801CD14 @ =0x0202BBF8
	ldr r1, _0801CD18 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r2, #0x13]
	adds r0, r5, #0
	bl sub_0801CB98
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CD1C
	ldr r0, [r4]
	bl HideUnitSprite
	b _0801CD48
	.align 2, 0
_0801CD0C: .4byte 0x0203A85C
_0801CD10: .4byte 0x03004690
_0801CD14: .4byte 0x0202BBF8
_0801CD18: .4byte 0x0202BBB8
_0801CD1C:
	bl sub_08078FAC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CD44
	bl EndAllMus
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl sub_08078FBC
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0801CD48
_0801CD44:
	bl EndAllMus
_0801CD48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801CD50
sub_0801CD50: @ 0x0801CD50
	push {lr}
	ldr r0, _0801CD78 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0801CD74
	ldr r1, _0801CD7C @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl sub_080181D0
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl EndAllMus
_0801CD74:
	pop {r0}
	bx r0
	.align 2, 0
_0801CD78: .4byte 0x0202BBF8
_0801CD7C: .4byte 0x0203A85C

	thumb_func_start sub_0801CD80
sub_0801CD80: @ 0x0801CD80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801CDB0 @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	beq _0801CDA2
	ldr r0, _0801CDB4 @ =0x08B95AAC
	ldr r2, _0801CDB8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_0804AB00
_0801CDA2:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801CDB0: .4byte 0x0203A85C
_0801CDB4: .4byte 0x08B95AAC
_0801CDB8: .4byte 0x0202BBB8

	thumb_func_start sub_0801CDBC
sub_0801CDBC: @ 0x0801CDBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801CE20 @ =0x03004690
	ldr r1, [r4]
	ldr r5, _0801CE24 @ =0x0203A85C
	ldrb r0, [r5, #0xe]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r5, #0xf]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CE06
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	bne _0801CE06
	ldr r0, _0801CE28 @ =0x0202BBB8
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CE06
	ldr r0, _0801CE2C @ =0x0202E3E4
	ldr r1, [r0]
	ldrb r2, [r5, #0xf]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r3, [r5, #0xe]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
_0801CE06:
	bl ResetTextFont
	bl sub_08079004
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801CE34
	ldr r1, _0801CE30 @ =sub_0801CD80
	adds r0, r6, #0
	bl sub_08004C40
	b _0801CE58
	.align 2, 0
_0801CE20: .4byte 0x03004690
_0801CE24: .4byte 0x0203A85C
_0801CE28: .4byte 0x0202BBB8
_0801CE2C: .4byte 0x0202E3E4
_0801CE30: .4byte sub_0801CD80
_0801CE34:
	ldr r0, _0801CE60 @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	beq _0801CE52
	ldr r0, _0801CE64 @ =0x08B95AAC
	ldr r2, _0801CE68 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_0804AB00
_0801CE52:
	adds r0, r6, #0
	bl Proc_Break
_0801CE58:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801CE60: .4byte 0x0203A85C
_0801CE64: .4byte 0x08B95AAC
_0801CE68: .4byte 0x0202BBB8

	thumb_func_start GetPlayerSelectKind
GetPlayerSelectKind: @ 0x0801CE6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801CE98 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	cmp r4, #0
	beq _0801CEA6
	ldr r1, _0801CE9C @ =0x0202BBB8
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801CEA2
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_0803077C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CEA0
	movs r0, #4
	b _0801CEEE
	.align 2, 0
_0801CE98: .4byte 0x0202BBF8
_0801CE9C: .4byte 0x0202BBB8
_0801CEA0:
	movs r2, #0
_0801CEA2:
	cmp r4, #0
	bne _0801CEAA
_0801CEA6:
	movs r0, #0
	b _0801CEEE
_0801CEAA:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, r2
	bne _0801CEEC
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0801CED2
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _0801CED6
_0801CED2:
	movs r0, #1
	b _0801CEEE
_0801CED6:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0801CEEC
	cmp r1, #4
	beq _0801CEEC
	movs r0, #2
	b _0801CEEE
_0801CEEC:
	movs r0, #3
_0801CEEE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801CEF4
sub_0801CEF4: @ 0x0801CEF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801CF58 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CF52
	ldr r0, _0801CF5C @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0801CF52
	ldr r0, _0801CF60 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0801CF68
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802BA70
	adds r2, r0, #0
	ldr r1, _0801CF64 @ =0x0202BD4C
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _0801CF48
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r5, r0
	beq _0801CF68
_0801CF48:
	cmp r2, #0
	beq _0801CF68
	ldrb r2, [r2, #2]
	cmp r2, #1
	bne _0801CF68
_0801CF52:
	movs r0, #0
	b _0801CF6A
	.align 2, 0
_0801CF58: .4byte 0x0202E3DC
_0801CF5C: .4byte 0x0202E3E4
_0801CF60: .4byte 0x03004690
_0801CF64: .4byte 0x0202BD4C
_0801CF68:
	movs r0, #1
_0801CF6A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0801CF70
sub_0801CF70: @ 0x0801CF70
	push {lr}
	bl sub_0802FD64
	ldr r0, _0801CF90 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl sub_0801A044
	ldr r0, _0801CF94 @ =0x02033E00
	bl sub_0806C00C
	pop {r0}
	bx r0
	.align 2, 0
_0801CF90: .4byte 0x03004690
_0801CF94: .4byte 0x02033E00

	thumb_func_start sub_0801CF98
sub_0801CF98: @ 0x0801CF98
	push {r4, lr}
	adds r4, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CFAC
	adds r0, r4, #0
	bl Proc_Break
_0801CFAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801CFB4
sub_0801CFB4: @ 0x0801CFB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801CFD0 @ =0x03004690
	ldr r2, [r5]
	cmp r2, #0
	bne _0801CFD4
	bl sub_0802E368
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801D040
	.align 2, 0
_0801CFD0: .4byte 0x03004690
_0801CFD4:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _0801D02C @ =0x0202E3DC
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl sub_0802E368
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl GetPlayerSelectKind
	cmp r0, #2
	beq _0801D030
	cmp r0, #3
	beq _0801D038
	b _0801D040
	.align 2, 0
_0801D02C: .4byte 0x0202E3DC
_0801D030:
	ldr r0, [r5]
	bl HideUnitSprite
	b _0801D040
_0801D038:
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0801D040:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801D048
sub_0801D048: @ 0x0801D048
	push {lr}
	bl sub_0802E368
	ldr r3, _0801D074 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0801D074: .4byte 0x03002870

	thumb_func_start sub_0801D078
sub_0801D078: @ 0x0801D078
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801D0A0 @ =0x083FDC9C
	ldr r1, _0801D0A4 @ =0x06005080
	adds r0, r5, #0
	movs r2, #0x80
	bl sub_08003078
	ldr r1, _0801D0A8 @ =0x0202BBB8
	movs r0, #1
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0801D0AC
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #2
	strh r0, [r1]
	b _0801D0BC
	.align 2, 0
_0801D0A0: .4byte 0x083FDC9C
_0801D0A4: .4byte 0x06005080
_0801D0A8: .4byte 0x0202BBB8
_0801D0AC:
	ldr r1, _0801D0C4 @ =0x06005000
	adds r0, r5, #0
	movs r2, #0x80
	bl sub_08003078
	adds r0, r4, #0
	bl Proc_End
_0801D0BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D0C4: .4byte 0x06005000

	thumb_func_start sub_0801D0C8
sub_0801D0C8: @ 0x0801D0C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0801D100 @ =0x08B9356C
	adds r4, r5, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0801D104 @ =0x06005000
	movs r2, #0x80
	bl sub_08003078
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0801D0F8
	adds r0, r5, #0
	bl Proc_Break
_0801D0F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D100: .4byte 0x08B9356C
_0801D104: .4byte 0x06005000

	thumb_func_start sub_0801D108
sub_0801D108: @ 0x0801D108
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r2, _0801D1D0 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r4, _0801D1D4 @ =0x0202BBB8
	movs r0, #1
	ldrb r2, [r4, #4]
	orrs r0, r2
	strb r0, [r4, #4]
	bl RenderMap
	movs r5, #9
	adds r7, r4, #0
_0801D134:
	movs r4, #0xe
	subs r6, r5, #1
_0801D138:
	movs r0, #0x24
	ldrsh r1, [r7, r0]
	adds r1, r1, r4
	movs r0, #0x26
	ldrsh r2, [r7, r0]
	adds r2, r2, r5
	str r5, [sp]
	ldr r0, _0801D1D8 @ =0x02023C60
	adds r3, r4, #0
	bl PutLimitViewSquare
	subs r4, #1
	cmp r4, #0
	bge _0801D138
	adds r5, r6, #0
	cmp r5, #0
	bge _0801D134
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _0801D1D0 @ =0x03002870
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0801D1DC @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0801D1E0 @ =0x0000E0FF
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_0801551C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D1D0: .4byte 0x03002870
_0801D1D4: .4byte 0x0202BBB8
_0801D1D8: .4byte 0x02023C60
_0801D1DC: .4byte 0x0000FFE0
_0801D1E0: .4byte 0x0000E0FF

	thumb_func_start sub_0801D1E4
sub_0801D1E4: @ 0x0801D1E4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameTime
	lsrs r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	adds r4, #0x4a
	movs r0, #1
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D20C
	lsls r0, r5, #1
	ldr r1, _0801D25C @ =0x083FDD1C
	adds r0, r0, r1
	movs r1, #0x82
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D20C:
	movs r0, #2
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D224
	lsls r0, r5, #1
	ldr r1, _0801D260 @ =0x083FDD7C
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D224:
	movs r0, #4
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D23C
	lsls r0, r5, #1
	ldr r1, _0801D264 @ =0x083FDDDC
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D23C:
	movs r0, #0x10
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0801D254
	lsls r0, r5, #1
	ldr r1, _0801D25C @ =0x083FDD1C
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D254:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D25C: .4byte 0x083FDD1C
_0801D260: .4byte 0x083FDD7C
_0801D264: .4byte 0x083FDDDC

	thumb_func_start sub_0801D268
sub_0801D268: @ 0x0801D268
	push {lr}
	adds r0, #0x4a
	movs r1, #0x11
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0801D284
	ldr r0, _0801D298 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0801D284:
	ldr r1, _0801D29C @ =0x0202BBB8
	movs r0, #0xfc
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bl sub_0801551C
	pop {r0}
	bx r0
	.align 2, 0
_0801D298: .4byte 0x02023C60
_0801D29C: .4byte 0x0202BBB8

	thumb_func_start sub_0801D2A0
sub_0801D2A0: @ 0x0801D2A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801D2BC @ =0x08B935B4
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0801D2C0
	bl sub_0801D108
	movs r0, #0
	bl sub_0801D078
	b _0801D2CC
	.align 2, 0
_0801D2BC: .4byte 0x08B935B4
_0801D2C0:
	adds r0, r4, #0
	movs r1, #4
	bl SpawnProc
	adds r0, #0x4a
	strh r5, [r0]
_0801D2CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801D2D4
sub_0801D2D4: @ 0x0801D2D4
	push {lr}
	ldr r0, _0801D2E0 @ =0x08B935B4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801D2E0: .4byte 0x08B935B4

	thumb_func_start sub_0801D2E4
sub_0801D2E4: @ 0x0801D2E4
	push {r4, lr}
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801D312
	ldr r0, [r4]
	cmp r0, #0
	beq _0801D312
	ldr r0, [r4, #0xc]
	ldr r1, _0801D318 @ =0x00010007
	ands r0, r1
	cmp r0, #0
	bne _0801D312
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0801D312
	cmp r1, #2
	bne _0801D31C
_0801D312:
	movs r0, #0
	b _0801D346
	.align 2, 0
_0801D318: .4byte 0x00010007
_0801D31C:
	ldr r0, _0801D34C @ =0x08B93374
	bl Proc_Find
	cmp r0, #0
	bne _0801D32C
	ldr r0, _0801D350 @ =0x08B96460
	bl Proc_Find
_0801D32C:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	bl CameraMoveWatchPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	movs r0, #1
_0801D346:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801D34C: .4byte 0x08B93374
_0801D350: .4byte 0x08B96460

	thumb_func_start TrySwitchViewedUnit
TrySwitchViewedUnit: @ 0x0801D354
	push {r4, r5, lr}
	ldr r2, _0801D3A8 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	movs r0, #0xc0
	ands r0, r5
	cmp r0, #0
	beq _0801D36E
	movs r5, #0
_0801D36E:
	adds r5, #1
	adds r4, r5, #0
	cmp r5, #0x3e
	bgt _0801D388
_0801D376:
	adds r0, r4, #0
	bl sub_0801D2E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D3A0
	adds r4, #1
	cmp r4, #0x3e
	ble _0801D376
_0801D388:
	movs r4, #1
	cmp r4, r5
	bgt _0801D3A0
_0801D38E:
	adds r0, r4, #0
	bl sub_0801D2E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D3A0
	adds r4, #1
	cmp r4, r5
	ble _0801D38E
_0801D3A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D3A8: .4byte 0x0202E3DC

	thumb_func_start PlayerPhase_HandleAutoEnd
PlayerPhase_HandleAutoEnd: @ 0x0801D3AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0801D3D8 @ =0x0202BBF8
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0801D3D0
	ldrb r0, [r1, #0xf]
	bl sub_08023810
	cmp r0, #0
	bne _0801D3D0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0801D3D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D3D8: .4byte 0x0202BBF8

	thumb_func_start sub_0801D3DC
sub_0801D3DC: @ 0x0801D3DC
	cmp r0, r2
	bne _0801D3F0
	cmp r1, r3
	bge _0801D3E8
	movs r0, #3
	b _0801D402
_0801D3E8:
	cmp r1, r3
	ble _0801D3F0
	movs r0, #2
	b _0801D402
_0801D3F0:
	cmp r1, r3
	bne _0801D400
	cmp r0, r2
	blt _0801D400
	cmp r0, r2
	ble _0801D400
	movs r0, #1
	b _0801D402
_0801D400:
	movs r0, #0
_0801D402:
	bx lr

	thumb_func_start sub_0801D404
sub_0801D404: @ 0x0801D404
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0801D422
	adds r0, r3, #0
	bl StartMu
	b _0801D43C
_0801D422:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r2, r0
	cmp r2, #0
	bne _0801D432
	adds r0, r3, #0
	movs r1, #0x61
	b _0801D436
_0801D432:
	adds r0, r3, #0
	movs r1, #0x62
_0801D436:
	movs r2, #0xc
	bl sub_0806BA88
_0801D43C:
	pop {r1}
	bx r1

	thumb_func_start sub_0801D440
sub_0801D440: @ 0x0801D440
	push {r4, r5, lr}
	adds r4, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D476
	adds r5, r4, #0
	adds r5, #0x3c
	ldrb r0, [r5]
	cmp r0, #2
	beq _0801D45E
	ldr r0, [r4, #0x34]
	bl EndMu
_0801D45E:
	adds r0, r4, #0
	bl Proc_Break
	ldrb r5, [r5]
	cmp r5, #1
	bne _0801D476
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
_0801D476:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0801D47C
sub_0801D47C: @ 0x0801D47C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r1, r3, #0
	ldr r0, _0801D4CC @ =0x08B935EC
	bl SpawnProcLocking
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3a
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, r8
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_0801D404
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl SetMuMoveScript
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D4CC: .4byte 0x08B935EC

	thumb_func_start sub_0801D4D0
sub_0801D4D0: @ 0x0801D4D0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0801D518 @ =0x08B93604
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r1, #0
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r2, r7, #0
	adds r2, #0x3a
	movs r0, #4
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_0801D404
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl SetMuMoveScript
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D518: .4byte 0x08B93604

	thumb_func_start sub_0801D51C
sub_0801D51C: @ 0x0801D51C
	push {lr}
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bl sub_0801551C
	ldr r2, _0801D548 @ =0x030028AC
	ldr r0, _0801D54C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801D550 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801D548: .4byte 0x030028AC
_0801D54C: .4byte 0x0000FFE0
_0801D550: .4byte 0x0000E0FF

	thumb_func_start sub_0801D554
sub_0801D554: @ 0x0801D554
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r0, _0801D5E4 @ =0x03002870
	mov ip, r0
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0x3f
	mov sl, r1
	mov r0, sl
	ldrb r6, [r4]
	ands r0, r6
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4]
	adds r3, r5, #0
	adds r3, #0x4c
	ldrh r1, [r3]
	movs r0, #0x44
	add r0, ip
	mov sb, r0
	movs r2, #0
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	movs r6, #0x45
	add r6, ip
	mov r8, r6
	strb r0, [r6]
	mov r7, ip
	adds r7, #0x46
	strb r2, [r7]
	subs r1, #1
	movs r6, #0
	strh r1, [r3]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0801D5D6
	adds r0, r5, #0
	bl Proc_Break
	mov r0, sl
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x10
	mov r1, sb
	strb r0, [r1]
	mov r0, r8
	strb r6, [r0]
	strb r6, [r7]
	movs r0, #2
	movs r1, #0
	bl sub_08001434
	ldr r0, _0801D5E8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0801D5D6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D5E4: .4byte 0x03002870
_0801D5E8: .4byte 0x02023C60

	thumb_func_start sub_0801D5EC
sub_0801D5EC: @ 0x0801D5EC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080183F4
	adds r4, #0x4e
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801D602
	bl ReleaseGame
_0801D602:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartMapFade
StartMapFade: @ 0x0801D608
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0801D630 @ =0x08B9362C
	movs r1, #3
	bl SpawnProc
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801D628
	bl LockGame
_0801D628:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D630: .4byte 0x08B9362C

	thumb_func_start IsMapFadeActive
IsMapFadeActive: @ 0x0801D634
	push {lr}
	ldr r0, _0801D648 @ =0x08B9362C
	bl Proc_Find
	cmp r0, #0
	beq _0801D642
	movs r0, #1
_0801D642:
	pop {r1}
	bx r1
	.align 2, 0
_0801D648: .4byte 0x08B9362C

	thumb_func_start sub_0801D64C
sub_0801D64C: @ 0x0801D64C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0801D68C @ =0x0202BBF8
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0801D66A
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #0x13]
_0801D66A:
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0801D690
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r5]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	b _0801D696
	.align 2, 0
_0801D68C: .4byte 0x0202BBF8
_0801D690:
	ldrb r0, [r4, #0x12]
	str r0, [r5]
	ldrb r0, [r4, #0x13]
_0801D696:
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801D6A0
sub_0801D6A0: @ 0x0801D6A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0801D6B0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _0801D6F4
	.align 2, 0
_0801D6B0: .4byte 0x0202BBF8
_0801D6B4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801D6EE
	ldr r3, [r2]
	cmp r3, #0
	beq _0801D6EE
	ldr r0, [r2, #0xc]
	ldr r1, _0801D700 @ =0x00000201
	ands r0, r1
	cmp r0, #0
	bne _0801D6EE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	str r0, [r5]
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0801D6FA
_0801D6EE:
	adds r4, #1
	ldr r0, _0801D704 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
_0801D6F4:
	adds r0, #0x40
	cmp r4, r0
	blt _0801D6B4
_0801D6FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D700: .4byte 0x00000201
_0801D704: .4byte 0x0202BBF8

	thumb_func_start sub_0801D708
sub_0801D708: @ 0x0801D708
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r4, _0801D72C @ =0x0202BBF8
	ldrb r0, [r4, #0xf]
	bl sub_08023810
	cmp r0, #0
	bne _0801D730
	adds r0, r5, #0
	bl Proc_End
	b _0801D772
	.align 2, 0
_0801D72C: .4byte 0x0202BBF8
_0801D730:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x40
	beq _0801D750
	cmp r0, #0x40
	bgt _0801D740
	cmp r0, #0
	beq _0801D746
	b _0801D758
_0801D740:
	cmp r0, #0x80
	beq _0801D750
	b _0801D758
_0801D746:
	add r1, sp, #4
	mov r0, sp
	bl sub_0801D64C
	b _0801D758
_0801D750:
	add r1, sp, #4
	mov r0, sp
	bl sub_0801D6A0
_0801D758:
	ldr r1, [sp]
	cmp r1, #0
	blt _0801D772
	ldr r2, [sp, #4]
	cmp r2, #0
	blt _0801D772
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl SetMapCursorPosition
_0801D772:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801D77C
sub_0801D77C: @ 0x0801D77C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_0807FA14
	bl GetUnit
	cmp r0, #0
	beq _0801D7A6
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl CameraMoveWatchPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
_0801D7A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0801D7AC
sub_0801D7AC: @ 0x0801D7AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801D7D8 @ =0x02001F70
	bl sub_0802E770
	strb r0, [r5]
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_0802E818
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D7E0
	ldrb r5, [r5]
	cmp r5, #0x63
	bhi _0801D7E0
	ldr r0, _0801D7DC @ =0x08B95968
	adds r1, r4, #0
	bl sub_0804A254
	b _0801D7E8
	.align 2, 0
_0801D7D8: .4byte 0x02001F70
_0801D7DC: .4byte 0x08B95968
_0801D7E0:
	ldr r0, _0801D7F0 @ =0x08B95944
	adds r1, r4, #0
	bl sub_0804A254
_0801D7E8:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801D7F0: .4byte 0x08B95944

	thumb_func_start sub_0801D7F4
sub_0801D7F4: @ 0x0801D7F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803279C
	bl sub_0801E2CC
	ldr r0, _0801D80C @ =0x0202BBB8
	ldrh r0, [r0, #0x2e]
	cmp r0, #0
	beq _0801D810
	movs r0, #0
	b _0801D81A
	.align 2, 0
_0801D80C: .4byte 0x0202BBB8
_0801D810:
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	movs r0, #1
_0801D81A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801D820
sub_0801D820: @ 0x0801D820
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_080974EC
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0801D830
sub_0801D830: @ 0x0801D830
	push {lr}
	ldr r0, _0801D840 @ =0x0202BBB8
	ldrh r0, [r0, #0x2e]
	bl sub_0802E790
	pop {r1}
	bx r1
	.align 2, 0
_0801D840: .4byte 0x0202BBB8

	thumb_func_start sub_0801D844
sub_0801D844: @ 0x0801D844
	push {lr}
	ldr r0, _0801D858 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, _0801D85C @ =0x03004690
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801D858: .4byte 0x0203A85C
_0801D85C: .4byte 0x03004690

	thumb_func_start sub_0801D860
sub_0801D860: @ 0x0801D860
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802E818
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D89C
	ldr r0, _0801D884 @ =0x02001F70
	ldrb r0, [r0]
	cmp r0, #0x63
	bhi _0801D88C
	ldr r0, _0801D888 @ =0x0203A85C
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_0801F2B0
	b _0801D8A6
	.align 2, 0
_0801D884: .4byte 0x02001F70
_0801D888: .4byte 0x0203A85C
_0801D88C:
	ldr r0, _0801D898 @ =0x0203A85C
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_0801F298
	b _0801D8A6
	.align 2, 0
_0801D898: .4byte 0x0203A85C
_0801D89C:
	ldr r0, _0801D8AC @ =0x0203A85C
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl sub_0801F298
_0801D8A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D8AC: .4byte 0x0203A85C

	thumb_func_start HandleGiveUnitItem
HandleGiveUnitItem: @ 0x0801D8B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl sub_08017654
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D942
	ldr r0, _0801D918 @ =0x03004690
	str r4, [r0]
	ldr r0, _0801D91C @ =0x0202BBB8
	strh r5, [r0, #0x2c]
	adds r0, r4, #0
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #4
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl sub_08007A64
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xf
	movs r3, #0xa
	bl StartEquipInfoWindow
	bl sub_0802E818
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D924
	bl sub_0802E770
	cmp r0, #0x63
	bgt _0801D924
	ldr r0, _0801D920 @ =0x00000727
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_08032560
	b _0801D934
	.align 2, 0
_0801D918: .4byte 0x03004690
_0801D91C: .4byte 0x0202BBB8
_0801D920: .4byte 0x00000727
_0801D924:
	movs r0, #0xe5
	lsls r0, r0, #3
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_08032560
_0801D934:
	movs r0, #2
	bl sub_08009FDC
	ldr r0, _0801D94C @ =0x08B9369C
	adds r1, r6, #0
	bl SpawnProcLocking
_0801D942:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D94C: .4byte 0x08B9369C

	thumb_func_start sub_0801D950
sub_0801D950: @ 0x0801D950
	push {lr}
	bl sub_08022204
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801D95C
sub_0801D95C: @ 0x0801D95C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0801D998 @ =0x0202BBB8
	ldrh r6, [r0, #0x2c]
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	movs r0, #0x2c
	ldrsh r2, [r4, r0]
	lsls r2, r2, #5
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _0801D99C @ =0x02022C60
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080165DC
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801D998: .4byte 0x0202BBB8
_0801D99C: .4byte 0x02022C60

	thumb_func_start sub_0801D9A0
sub_0801D9A0: @ 0x0801D9A0
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _0801D9E8 @ =0x03004690
	ldr r1, [r5]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_0802E790
	ldr r3, _0801D9EC @ =0x0203A85C
	ldr r0, [r5]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r3, #6]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_08018D50
	ldr r0, [r5]
	ldr r1, _0801D9F0 @ =0x0202BBB8
	ldrh r1, [r1, #0x2c]
	bl sub_08017654
	movs r0, #0x37
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801D9E8: .4byte 0x03004690
_0801D9EC: .4byte 0x0203A85C
_0801D9F0: .4byte 0x0202BBB8

	thumb_func_start sub_0801D9F4
sub_0801D9F4: @ 0x0801D9F4
	push {r4, lr}
	ldr r4, _0801DA0C @ =0x0202BBB8
	ldrh r0, [r4, #0x2c]
	bl sub_0802E790
	ldr r1, _0801DA10 @ =0x0203A85C
	ldrh r0, [r4, #0x2c]
	strh r0, [r1, #6]
	movs r0, #0x37
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DA0C: .4byte 0x0202BBB8
_0801DA10: .4byte 0x0203A85C

	thumb_func_start sub_0801DA14
sub_0801DA14: @ 0x0801DA14
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0801DA68 @ =0x03004690
	ldr r2, [r0]
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #1
	adds r2, #0x1e
	adds r2, r2, r0
	ldrh r4, [r2]
	ldr r1, _0801DA6C @ =0x0203A85C
	strh r4, [r1, #6]
	movs r0, #0
	ldrsb r0, [r5, r0]
	strh r0, [r1, #8]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08082528
	movs r0, #2
	bl sub_08009FDC
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0801DA74
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DA70 @ =0x00000762
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxTalk
	b _0801DA86
	.align 2, 0
_0801DA68: .4byte 0x03004690
_0801DA6C: .4byte 0x0203A85C
_0801DA70: .4byte 0x00000762
_0801DA74:
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DA90 @ =0x00000761
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxTalk
_0801DA86:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801DA90: .4byte 0x00000761

	thumb_func_start sub_0801DA94
sub_0801DA94: @ 0x0801DA94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0801DADC @ =0x0202BBB8
	ldrh r4, [r0, #0x2c]
	ldr r1, _0801DAE0 @ =0x0203A85C
	strh r4, [r1, #6]
	movs r0, #5
	strh r0, [r1, #8]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08082528
	movs r0, #2
	bl sub_08009FDC
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0801DAE8
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DAE4 @ =0x00000762
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxTalk
	b _0801DAFE
	.align 2, 0
_0801DADC: .4byte 0x0202BBB8
_0801DAE0: .4byte 0x0203A85C
_0801DAE4: .4byte 0x00000762
_0801DAE8:
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DB08 @ =0x00000761
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxTalk
_0801DAFE:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801DB08: .4byte 0x00000761

	thumb_func_start sub_0801DB0C
sub_0801DB0C: @ 0x0801DB0C
	push {r4, lr}
	bl GetTalkResult
	cmp r0, #1
	beq _0801DB1A
	movs r0, #0
	b _0801DB40
_0801DB1A:
	ldr r0, _0801DB48 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #8]
	ldr r1, _0801DB4C @ =0x0203A85C
	ldrh r0, [r1, #8]
	cmp r0, #4
	bhi _0801DB3E
	ldr r4, _0801DB50 @ =0x03004690
	ldr r0, [r4]
	ldrh r1, [r1, #8]
	bl sub_08018D50
	ldr r0, [r4]
	ldr r1, _0801DB54 @ =0x0202BBB8
	ldrh r1, [r1, #0x2c]
	bl sub_08017654
_0801DB3E:
	movs r0, #0x37
_0801DB40:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DB48: .4byte 0x08B857F8
_0801DB4C: .4byte 0x0203A85C
_0801DB50: .4byte 0x03004690
_0801DB54: .4byte 0x0202BBB8

	thumb_func_start SetVisionWithFade
SetVisionWithFade: @ 0x0801DB58
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _0801DB6E
	ldr r0, _0801DB90 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r4, [r0, #0xc]
_0801DB6E:
	bl RenderMapForFade
	ldr r0, _0801DB90 @ =0x0202BBF8
	strb r4, [r0, #0xd]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DB90: .4byte 0x0202BBF8

	thumb_func_start SetVision
SetVision: @ 0x0801DB94
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _0801DBAA
	ldr r0, _0801DBC0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0xc]
_0801DBAA:
	ldr r0, _0801DBC0 @ =0x0202BBF8
	strb r1, [r0, #0xd]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
_0801DBC0: .4byte 0x0202BBF8

	thumb_func_start sub_0801DBC4
sub_0801DBC4: @ 0x0801DBC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r6, _0801DC90 @ =0x0202E3E4
	ldr r0, [r6]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _0801DC94 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r6]
	bl sub_0801B190
	mov r0, r8
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	mov r0, sb
	bl GetUnitMagRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0801B19C
	ldr r0, _0801DC98 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0801DCA8
	ldr r0, _0801DC9C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r3, r0, #1
	adds r2, r6, #0
	cmp r3, #0
	bge _0801DC24
	b _0801DD2C
_0801DC24:
	ldr r0, _0801DC9C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r3, #1
	cmp r4, #0
	blt _0801DC86
	ldr r6, _0801DC90 @ =0x0202E3E4
	lsls r5, r3, #2
_0801DC36:
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801DC80
	ldr r0, _0801DCA0 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, r8
	bl sub_08018D68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DC6E
	ldr r0, _0801DCA4 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0801DC90 @ =0x0202E3E4
	cmp r0, #0
	beq _0801DC80
_0801DC6E:
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r0]
	ldr r2, _0801DC90 @ =0x0202E3E4
_0801DC80:
	subs r4, #1
	cmp r4, #0
	bge _0801DC36
_0801DC86:
	adds r3, r7, #0
	cmp r3, #0
	bge _0801DC24
	b _0801DD2C
	.align 2, 0
_0801DC90: .4byte 0x0202E3E4
_0801DC94: .4byte 0x0202E3E8
_0801DC98: .4byte 0x0202BBF8
_0801DC9C: .4byte 0x0202E3D8
_0801DCA0: .4byte 0x0202E3E0
_0801DCA4: .4byte 0x0202E3DC
_0801DCA8:
	ldr r0, _0801DD58 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r3, r0, #1
	adds r2, r6, #0
	cmp r3, #0
	blt _0801DD2C
_0801DCB6:
	ldr r0, _0801DD58 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r3, #1
	cmp r4, #0
	blt _0801DD26
	lsls r5, r3, #2
_0801DCC6:
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801DD20
	ldr r0, _0801DD5C @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, r8
	bl sub_08018D68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DD0E
	ldr r0, _0801DD60 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801DD0E
	ldr r0, _0801DD64 @ =0x0202E3EC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0801DD68 @ =0x0202E3E4
	cmp r0, #0
	bne _0801DD20
_0801DD0E:
	ldr r2, _0801DD68 @ =0x0202E3E4
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
_0801DD20:
	subs r4, #1
	cmp r4, #0
	bge _0801DCC6
_0801DD26:
	adds r3, r7, #0
	cmp r3, #0
	bge _0801DCB6
_0801DD2C:
	mov r1, sb
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sb
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DD58: .4byte 0x0202E3D8
_0801DD5C: .4byte 0x0202E3E0
_0801DD60: .4byte 0x0202E3DC
_0801DD64: .4byte 0x0202E3EC
_0801DD68: .4byte 0x0202E3E4

	thumb_func_start sub_0801DD6C
sub_0801DD6C: @ 0x0801DD6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x64
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801DD7E
	b _0801DEEA
_0801DD7E:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0801DD8E
	b _0801DEEA
_0801DD8E:
	ldr r6, _0801DEF4 @ =0x0203A3F0
	movs r0, #0x5a
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0801DEF8 @ =0x0203A470
	adds r7, r5, #0
	adds r7, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	ble _0801DDC2
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl sub_08015AA8
_0801DDC2:
	mov r0, r8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bge _0801DDEA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl sub_08015AA8
_0801DDEA:
	adds r7, r6, #0
	adds r7, #0x60
	movs r0, #0x60
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801DE1A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl sub_08015AA8
_0801DE1A:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801DE42
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x2d
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl sub_08015AA8
_0801DE42:
	adds r7, r6, #0
	adds r7, #0x66
	movs r0, #0x66
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801DE72
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl sub_08015AA8
_0801DE72:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801DE9A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl sub_08015AA8
_0801DE9A:
	adds r6, #0x62
	adds r5, #0x62
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0801DEC4
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl sub_08015AA8
_0801DEC4:
	movs r3, #0
	ldrsh r1, [r6, r3]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _0801DEEA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl sub_08015AA8
_0801DEEA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DEF4: .4byte 0x0203A3F0
_0801DEF8: .4byte 0x0203A470

	thumb_func_start StartEquipInfoWindow
StartEquipInfoWindow: @ 0x0801DEFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r4, _0801DFB4 @ =0x08B936EC
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _0801DFAA
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x2c]
	adds r0, #0x30
	strb r7, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x32
	movs r0, #3
	strb r0, [r5]
	adds r0, r6, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0xc
	bl sub_0800549C
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0xc
	bl sub_0800549C
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xc
	bl sub_0800549C
	ldrb r1, [r5]
	movs r0, #1
	bl sub_08004D44
	ldr r0, [r4, #0x2c]
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleGenerateDisplayStats
	ldr r3, _0801DFB8 @ =0x0203A470
	ldr r2, _0801DFBC @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801DFAA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFB4: .4byte 0x08B936EC
_0801DFB8: .4byte 0x0203A470
_0801DFBC: .4byte 0x0203A3F0

	thumb_func_start sub_0801DFC0
sub_0801DFC0: @ 0x0801DFC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0801E03C @ =0x08B936EC
	bl Proc_Find
	adds r7, r0, #0
	movs r0, #0
	bl sub_08002BE8
	adds r4, r7, #0
	adds r4, #0x30
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r3, #0x31
	adds r3, r3, r7
	mov r8, r3
	ldrb r2, [r3]
	lsls r1, r2, #6
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r7, #0
	adds r6, #0x34
	ldr r3, [r7, #0x2c]
	mov sb, r3
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ClearText
	adds r0, r7, #0
	adds r0, #0x3c
	bl ClearText
	adds r0, r7, #0
	adds r0, #0x44
	bl ClearText
	ldrb r0, [r4]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #0xe
	movs r3, #8
	bl sub_08049CE4
	cmp r5, #0
	blt _0801E058
	cmp r5, #4
	ble _0801E040
	cmp r5, #5
	beq _0801E04C
	b _0801E058
	.align 2, 0
_0801E03C: .4byte 0x08B936EC
_0801E040:
	lsls r1, r5, #1
	mov r0, sb
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	b _0801E05C
_0801E04C:
	ldr r0, _0801E054 @ =0x0202BBB8
	ldrh r4, [r0, #0x2c]
	b _0801E05C
	.align 2, 0
_0801E054: .4byte 0x0202BBB8
_0801E058:
	adds r4, r5, #0
	movs r5, #8
_0801E05C:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #9
	beq _0801E078
	cmp r0, #9
	bgt _0801E070
	cmp r0, #4
	beq _0801E078
	b _0801E11C
_0801E070:
	cmp r0, #0xc
	bgt _0801E11C
	cmp r0, #0xb
	blt _0801E11C
_0801E078:
	adds r0, r4, #0
	bl sub_08017244
	bl GetMsg
	adds r4, r0, #0
	movs r5, #0
	ldr r7, [sp, #4]
	adds r7, #0x42
	movs r3, #8
	adds r3, r3, r6
	mov r8, r3
	ldr r0, [sp, #4]
	adds r0, #0xc2
	mov sb, r0
	movs r1, #0x10
	adds r1, r1, r6
	mov sl, r1
	b _0801E0A2
_0801E09E:
	adds r4, #1
	adds r5, #1
_0801E0A2:
	lsls r0, r5, #3
	adds r0, r6, r0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	bl sub_0800570C
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801E09E
	ldr r3, _0801E114 @ =0x0203A3F0
	ldr r2, _0801E118 @ =0x0203A470
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08005590
	mov r0, r8
	mov r1, sb
	bl sub_08005590
	ldr r2, [sp, #4]
	movs r3, #0xa1
	lsls r3, r3, #1
	adds r1, r2, r3
	mov r0, sl
	bl sub_08005590
	b _0801E294
	.align 2, 0
_0801E114: .4byte 0x0203A3F0
_0801E118: .4byte 0x0203A470
_0801E11C:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	mov r0, sb
	bl BattleGenerateDisplayStats
	cmp r5, #8
	bne _0801E15E
	ldr r3, _0801E2AC @ =0x0203A470
	ldr r2, _0801E2B0 @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801E15E:
	ldr r0, _0801E2B0 @ =0x0203A3F0
	mov r8, r0
	movs r1, #0x48
	add r1, r8
	mov sl, r1
	ldrh r1, [r1]
	mov r0, sb
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r2, #1
	mov sb, r2
	cmp r0, #0
	beq _0801E17E
	movs r3, #2
	mov sb, r3
_0801E17E:
	ldr r0, _0801E2B4 @ =0x00001101
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, r6, #0
	adds r5, #8
	ldr r0, _0801E2B8 @ =0x00001103
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, r6, #0
	adds r4, #0x10
	ldr r0, _0801E2BC @ =0x00001104
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0801E2C0 @ =0x0000110D
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0801E2C4 @ =0x00001105
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #0
	bl Text_InsertDrawString
	mov r0, r8
	adds r0, #0x5a
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x1e
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x60
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x1e
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x54
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x62
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x54
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x34
	adds r6, r7, #0
	adds r6, #0x31
	ldrb r1, [r6]
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r5, r7, #0
	adds r5, #0x30
	ldrb r3, [r5]
	adds r1, r3, r1
	lsls r1, r1, #1
	ldr r4, _0801E2C8 @ =0x02022C60
	adds r1, r1, r4
	bl sub_08005590
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r1, [r6]
	adds r1, #3
	lsls r1, r1, #5
	adds r1, #1
	ldrb r2, [r5]
	adds r1, r2, r1
	lsls r1, r1, #1
	adds r1, r1, r4
	bl sub_08005590
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r1, [r6]
	adds r1, #5
	lsls r1, r1, #5
	adds r1, #1
	ldrb r5, [r5]
	adds r1, r5, r1
	lsls r1, r1, #1
	adds r1, r1, r4
	bl sub_08005590
	ldr r4, [sp, #4]
	adds r4, #0x4e
	mov r3, sl
	ldrh r0, [r3]
	bl GetItemKind
	adds r1, r0, #0
	adds r1, #0x70
	ldr r0, [sp, #8]
	lsls r2, r0, #0xc
	adds r0, r4, #0
	bl sub_08004E28
_0801E294:
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E2AC: .4byte 0x0203A470
_0801E2B0: .4byte 0x0203A3F0
_0801E2B4: .4byte 0x00001101
_0801E2B8: .4byte 0x00001103
_0801E2BC: .4byte 0x00001104
_0801E2C0: .4byte 0x0000110D
_0801E2C4: .4byte 0x00001105
_0801E2C8: .4byte 0x02022C60

	thumb_func_start sub_0801E2CC
sub_0801E2CC: @ 0x0801E2CC
	push {lr}
	ldr r0, _0801E2D8 @ =0x08B936EC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801E2D8: .4byte 0x08B936EC

	thumb_func_start sub_0801E2DC
sub_0801E2DC: @ 0x0801E2DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r2, #0
	mov r8, r2
	strh r0, [r4, #0x30]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	subs r2, r2, r0
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r3, #0x32
	ldrsh r0, [r4, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl sub_080BFA68
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	movs r2, #0x80
	lsls r2, r2, #0xa
	movs r6, #0x80
	lsls r6, r6, #2
	str r6, [sp]
	movs r0, #0
	adds r3, r5, #0
	bl sub_08012FE8
	str r0, [r4, #0x44]
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0x30
	adds r3, r5, #0
	bl sub_08012FE8
	strh r0, [r4, #0x3e]
	mov r3, r8
	strh r3, [r4, #0x3c]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801E360
sub_0801E360: @ 0x0801E360
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #9
	movs r0, #0x3c
	ldrsh r3, [r7, r0]
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_08012FE8
	str r0, [sp, #4]
	movs r2, #0x34
	ldrsh r6, [r7, r2]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	mov sb, r0
	subs r6, r6, r0
	movs r0, #0x36
	ldrsh r2, [r7, r0]
	mov r8, r2
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	str r1, [sp, #8]
	mov r0, r8
	subs r0, r0, r1
	mov r8, r0
	ldr r2, _0801E450 @ =0x080C5A48
	ldr r1, [sp, #4]
	asrs r0, r1, #9
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r4, [r0, r2]
	adds r0, r6, #0
	muls r0, r4, r0
	ldr r5, [r7, #0x44]
	adds r1, r5, #0
	bl __divsi3
	mov sl, r0
	mov r0, r8
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	ldr r2, [sp, #4]
	adds r1, r6, #0
	muls r1, r2, r1
	asrs r1, r1, #0x10
	adds r5, r1, r0
	mov r0, r8
	muls r0, r2, r0
	asrs r0, r0, #0x10
	mov r1, sl
	subs r4, r0, r1
	add sb, r5
	ldr r1, _0801E454 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r2, sb
	subs r5, r2, r0
	ldr r0, [sp, #8]
	adds r4, r4, r0
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0801E42A
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0801E42A
	adds r2, r4, #0
	subs r2, #0xc
	ldr r3, _0801E458 @ =0x08B905B8
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl sub_080069F4
	ldr r3, [r7, #0x2c]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080260B4
_0801E42A:
	ldrh r0, [r7, #0x3c]
	adds r0, #1
	strh r0, [r7, #0x3c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x3e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0801E440
	adds r0, r7, #0
	bl Proc_Break
_0801E440:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E450: .4byte 0x080C5A48
_0801E454: .4byte 0x0202BBB8
_0801E458: .4byte 0x08B905B8

	thumb_func_start sub_0801E45C
sub_0801E45C: @ 0x0801E45C
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r3, #0x34
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801E46A
	adds r0, #0xf
_0801E46A:
	asrs r0, r0, #4
	strb r0, [r2, #0x10]
	ldr r2, [r1, #0x2c]
	movs r3, #0x36
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801E47A
	adds r0, #0xf
_0801E47A:
	asrs r0, r0, #4
	strb r0, [r2, #0x11]
	bx lr

	thumb_func_start sub_0801E480
sub_0801E480: @ 0x0801E480
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _0801E4B4 @ =0x08B93704
	adds r1, r6, #0
	bl SpawnProc
	mov r1, r8
	str r1, [r0, #0x2c]
	lsls r4, r4, #4
	strh r4, [r0, #0x34]
	lsls r5, r5, #4
	strh r5, [r0, #0x36]
	mov r0, r8
	bl HideUnitSprite
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E4B4: .4byte 0x08B93704

	thumb_func_start sub_0801E4B8
sub_0801E4B8: @ 0x0801E4B8
	push {lr}
	ldr r0, _0801E4C8 @ =0x08B93704
	bl Proc_Find
	cmp r0, #0
	bne _0801E4CC
	movs r0, #0
	b _0801E4CE
	.align 2, 0
_0801E4C8: .4byte 0x08B93704
_0801E4CC:
	movs r0, #1
_0801E4CE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801E4D4
sub_0801E4D4: @ 0x0801E4D4
	push {lr}
	ldr r1, _0801E504 @ =0x04000050
	ldr r2, _0801E508 @ =0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E50C @ =0x04000052
	ldr r1, _0801E510 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x48
	bl sub_08001948
	ldr r0, _0801E514 @ =sub_0801E518
	bl sub_080018D0
	pop {r0}
	bx r0
	.align 2, 0
_0801E504: .4byte 0x04000050
_0801E508: .4byte 0x00003C42
_0801E50C: .4byte 0x04000052
_0801E510: .4byte 0x0202BBB8
_0801E514: .4byte sub_0801E518

	thumb_func_start sub_0801E518
sub_0801E518: @ 0x0801E518
	push {lr}
	ldr r1, _0801E548 @ =0x04000050
	ldr r2, _0801E54C @ =0x00003E41
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E550 @ =0x04000052
	ldr r1, _0801E554 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x39
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x60
	bl sub_08001948
	ldr r0, _0801E558 @ =sub_0801E55C
	bl sub_080018D0
	pop {r0}
	bx r0
	.align 2, 0
_0801E548: .4byte 0x04000050
_0801E54C: .4byte 0x00003E41
_0801E550: .4byte 0x04000052
_0801E554: .4byte 0x0202BBB8
_0801E558: .4byte sub_0801E55C

	thumb_func_start sub_0801E55C
sub_0801E55C: @ 0x0801E55C
	push {lr}
	ldr r1, _0801E58C @ =0x04000050
	ldr r2, _0801E590 @ =0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E594 @ =0x04000052
	ldr r1, _0801E598 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0
	bl sub_08001948
	ldr r0, _0801E59C @ =sub_0801E4D4
	bl sub_080018D0
	pop {r0}
	bx r0
	.align 2, 0
_0801E58C: .4byte 0x04000050
_0801E590: .4byte 0x00003C42
_0801E594: .4byte 0x04000052
_0801E598: .4byte 0x0202BBB8
_0801E59C: .4byte sub_0801E4D4

	thumb_func_start sub_0801E5A0
sub_0801E5A0: @ 0x0801E5A0
	push {lr}
	ldr r2, _0801E5C0 @ =0x02022EA0
	movs r1, #0
	ldr r0, _0801E5C4 @ =0x00005140
	adds r3, r0, #0
_0801E5AA:
	adds r0, r1, r3
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x5f
	ble _0801E5AA
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0801E5C0: .4byte 0x02022EA0
_0801E5C4: .4byte 0x00005140

	thumb_func_start sub_0801E5C8
sub_0801E5C8: @ 0x0801E5C8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetCurrentBgmSong
	adds r4, r0, #0
	bl GetMapBgmSong
	cmp r4, r0
	beq _0801E5E0
	movs r0, #4
	bl FadeBgmOut
_0801E5E0:
	ldr r0, _0801E600 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801E5F2
	ldr r0, _0801E604 @ =0x00000393
	bl sub_080BE594
_0801E5F2:
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E600: .4byte 0x0202BBF8
_0801E604: .4byte 0x00000393

	thumb_func_start sub_0801E608
sub_0801E608: @ 0x0801E608
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x1c
	rsbs r1, r1, #0
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl sub_08012FE8
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801E668 @ =0x0202BBB8
	adds r2, r0, #0
	adds r2, #0x38
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	adds r0, #0x39
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801E660
	movs r0, #0xf
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0801E660:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E668: .4byte 0x0202BBB8

	thumb_func_start sub_0801E66C
sub_0801E66C: @ 0x0801E66C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r2, #0x1c
	rsbs r2, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0x24
	bl sub_08012FE8
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801E6CC @ =0x0202BBB8
	adds r2, r0, #0
	adds r2, #0x38
	ldrb r1, [r2]
	subs r1, #1
	strb r1, [r2]
	adds r0, #0x39
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801E6C2
	movs r0, #0xf
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0801E6C2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E6CC: .4byte 0x0202BBB8

	thumb_func_start sub_0801E6D0
sub_0801E6D0: @ 0x0801E6D0
	push {lr}
	ldr r0, _0801E6E4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0801E6E4: .4byte 0x02022C60

	thumb_func_start sub_0801E6E8
sub_0801E6E8: @ 0x0801E6E8
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0801E6F0
sub_0801E6F0: @ 0x0801E6F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801E7C0 @ =0x02023460
	mov ip, r1
_0801E70A:
	movs r3, #0xe
	str r3, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r7, r6, #1
	mov sb, r7
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801E736:
	mov r3, r8
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldr r3, [sp]
	subs r0, r3, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801E74A
	movs r3, #0x10
_0801E74A:
	cmp r3, #0
	bge _0801E750
	movs r3, #0
_0801E750:
	movs r0, #0x10
	subs r3, r0, r3
	movs r0, #0xfe
	ands r3, r0
	movs r7, #0xa2
	lsls r7, r7, #7
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	adds r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x1f
	adds r0, r3, r7
	strh r0, [r5]
	adds r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801E736
	mov r6, sb
	cmp r6, #0
	bge _0801E70A
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	mov r3, r8
	ldrh r3, [r3]
	cmp r3, #0x22
	bne _0801E7B0
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	mov r0, sl
	bl Proc_Break
_0801E7B0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E7C0: .4byte 0x02023460

	thumb_func_start sub_0801E7C4
sub_0801E7C4: @ 0x0801E7C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801E890 @ =0x02023460
	mov ip, r1
_0801E7DE:
	movs r3, #0xe
	str r3, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r7, r6, #1
	mov sb, r7
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801E80A:
	mov r3, r8
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldr r3, [sp]
	subs r0, r3, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801E81E
	movs r3, #0x10
_0801E81E:
	cmp r3, #0
	bge _0801E824
	movs r3, #0
_0801E824:
	movs r0, #0xfe
	ands r3, r0
	ldr r7, _0801E894 @ =0x00005501
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	subs r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x21
	adds r0, r3, r7
	strh r0, [r5]
	subs r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801E80A
	mov r6, sb
	cmp r6, #0
	bge _0801E7DE
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	mov r3, r8
	ldrh r3, [r3]
	cmp r3, #0x24
	bne _0801E87E
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	mov r0, sl
	bl Proc_Break
_0801E87E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E890: .4byte 0x02023460
_0801E894: .4byte 0x00005501

	thumb_func_start sub_0801E898
sub_0801E898: @ 0x0801E898
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0801E8A0
sub_0801E8A0: @ 0x0801E8A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0x3c
	bl sub_08012FE8
	ldr r3, _0801E920 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #8
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	bl sub_08012FE8
	ldr r2, _0801E924 @ =0x0202BBB8
	adds r1, r2, #0
	adds r1, #0x3a
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x3b
	strb r1, [r2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0801E916
	adds r0, r6, #0
	bl Proc_Break
_0801E916:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E920: .4byte 0x03002870
_0801E924: .4byte 0x0202BBB8

	thumb_func_start sub_0801E928
sub_0801E928: @ 0x0801E928
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x3c
	bl sub_08012FE8
	ldr r3, _0801E9A4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #8
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	bl sub_08012FE8
	ldr r2, _0801E9A8 @ =0x0202BBB8
	adds r1, r2, #0
	adds r1, #0x3a
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x3b
	strb r1, [r2]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801E99C
	adds r0, r6, #0
	bl Proc_Break
_0801E99C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E9A4: .4byte 0x03002870
_0801E9A8: .4byte 0x0202BBB8

	thumb_func_start sub_0801E9AC
sub_0801E9AC: @ 0x0801E9AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801E9C8 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl sub_08023810
	cmp r0, #0
	bne _0801E9C2
	adds r0, r4, #0
	bl Proc_End
_0801E9C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E9C8: .4byte 0x0202BBF8

	thumb_func_start sub_0801E9CC
sub_0801E9CC: @ 0x0801E9CC
	push {lr}
	ldr r0, _0801EA08 @ =0x08195520
	ldr r1, _0801EA0C @ =0x06002000
	bl Decompress
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801EA10 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0801EA54
	cmp r0, #0x40
	bgt _0801EA14
	cmp r0, #0
	beq _0801EA1A
	b _0801EA66
	.align 2, 0
_0801EA08: .4byte 0x08195520
_0801EA0C: .4byte 0x06002000
_0801EA10: .4byte 0x0202BBF8
_0801EA14:
	cmp r0, #0x80
	beq _0801EA34
	b _0801EA66
_0801EA1A:
	ldr r0, _0801EA28 @ =0x08194794
	ldr r1, _0801EA2C @ =0x06002800
	bl Decompress
	ldr r0, _0801EA30 @ =0x08194C10
	b _0801EA3E
	.align 2, 0
_0801EA28: .4byte 0x08194794
_0801EA2C: .4byte 0x06002800
_0801EA30: .4byte 0x08194C10
_0801EA34:
	ldr r0, _0801EA48 @ =0x08194C30
	ldr r1, _0801EA4C @ =0x06002800
	bl Decompress
	ldr r0, _0801EA50 @ =0x08195088
_0801EA3E:
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0801EA66
	.align 2, 0
_0801EA48: .4byte 0x08194C30
_0801EA4C: .4byte 0x06002800
_0801EA50: .4byte 0x08195088
_0801EA54:
	ldr r0, _0801EA6C @ =0x081950A8
	ldr r1, _0801EA70 @ =0x06002800
	bl Decompress
	ldr r0, _0801EA74 @ =0x08195500
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
_0801EA66:
	pop {r0}
	bx r0
	.align 2, 0
_0801EA6C: .4byte 0x081950A8
_0801EA70: .4byte 0x06002800
_0801EA74: .4byte 0x08195500

	thumb_func_start sub_0801EA78
sub_0801EA78: @ 0x0801EA78
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0801EB60 @ =0x03002870
	mov ip, r0
	movs r1, #0x20
	mov r8, r1
	mov r0, r8
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r6, #0
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r7]
	ldr r1, _0801EB64 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3a
	strb r6, [r0]
	adds r0, #1
	movs r3, #0x10
	strb r3, [r0]
	subs r0, #3
	strb r6, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0801EB68 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _0801EB6C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0
	bl sub_08001990
	ldr r0, _0801EB70 @ =sub_0801E4D4
	bl sub_080018D0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EB60: .4byte 0x03002870
_0801EB64: .4byte 0x0202BBB8
_0801EB68: .4byte 0x0000FFE0
_0801EB6C: .4byte 0x0000E0FF
_0801EB70: .4byte sub_0801E4D4

	thumb_func_start sub_0801EB74
sub_0801EB74: @ 0x0801EB74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801EBFC @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801EC00 @ =0x0202BBB8
	adds r1, r0, #0
	adds r1, #0x3a
	ldrb r2, [r1]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r2, [r1]
	adds r0, #0x3b
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0801EC04 @ =0x08B9372C
	bl Proc_Find
	cmp r0, #0
	bne _0801EBF6
	ldr r0, _0801EC08 @ =0x08B9376C
	bl Proc_Find
	cmp r0, #0
	bne _0801EBF6
	ldr r0, _0801EC0C @ =0x08B9378C
	bl Proc_Find
	cmp r0, #0
	bne _0801EBF6
	bl ClearUi
	movs r0, #0
	bl sub_080018D0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
_0801EBF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EBFC: .4byte 0x03002870
_0801EC00: .4byte 0x0202BBB8
_0801EC04: .4byte 0x08B9372C
_0801EC08: .4byte 0x08B9376C
_0801EC0C: .4byte 0x08B9378C

	thumb_func_start sub_0801EC10
sub_0801EC10: @ 0x0801EC10
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0801EC3C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_0806F478
	adds r0, #5
	ldr r1, _0801EC40 @ =0x02033E00
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r1, #0
	bl sub_0806C00C
	pop {r0}
	bx r0
	.align 2, 0
_0801EC3C: .4byte 0x03004690
_0801EC40: .4byte 0x02033E00

	thumb_func_start sub_0801EC44
sub_0801EC44: @ 0x0801EC44
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	movs r6, #0
	movs r7, #0
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r1, #1
	beq _0801EC9C
	cmp r1, #1
	bgt _0801EC66
	cmp r1, #0
	beq _0801EC8C
	b _0801ECA0
_0801EC66:
	cmp r1, #2
	beq _0801EC7C
	cmp r1, #3
	bne _0801ECA0
	ldr r0, _0801EC74 @ =0x08196898
	ldr r6, _0801EC78 @ =0x08196380
	b _0801ECA0
	.align 2, 0
_0801EC74: .4byte 0x08196898
_0801EC78: .4byte 0x08196380
_0801EC7C:
	ldr r0, _0801EC84 @ =0x08196898
	ldr r6, _0801EC88 @ =0x08196380
	movs r7, #1
	b _0801ECA0
	.align 2, 0
_0801EC84: .4byte 0x08196898
_0801EC88: .4byte 0x08196380
_0801EC8C:
	ldr r0, _0801EC94 @ =0x08196E80
	ldr r6, _0801EC98 @ =0x08196624
	movs r7, #1
	b _0801ECA0
	.align 2, 0
_0801EC94: .4byte 0x08196E80
_0801EC98: .4byte 0x08196624
_0801EC9C:
	ldr r0, _0801ECF0 @ =0x08196E80
	ldr r6, _0801ECF4 @ =0x08196624
_0801ECA0:
	ldr r1, _0801ECF8 @ =0x06014800
	bl Decompress
	ldr r0, _0801ECFC @ =0x081973F4
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801ED00 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0801245C
	adds r4, #8
	movs r0, #0xba
	adds r1, r4, #0
	bl sub_08014D80
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801ECF0: .4byte 0x08196E80
_0801ECF4: .4byte 0x08196624
_0801ECF8: .4byte 0x06014800
_0801ECFC: .4byte 0x081973F4
_0801ED00: .4byte 0x0202BBB8

	thumb_func_start sub_0801ED04
sub_0801ED04: @ 0x0801ED04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _0801ED30 @ =0x08B937F4
	adds r1, r4, #0
	bl SpawnProcLocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	adds r0, #0x4a
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED30: .4byte 0x08B937F4

	thumb_func_start sub_0801ED34
sub_0801ED34: @ 0x0801ED34
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801ED80 @ =0x08197CC8
	ldr r1, _0801ED84 @ =0x06014800
	bl Decompress
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801ED88 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801ED8C @ =0x08198184
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_0801245C
	adds r4, #8
	movs r0, #0xbf
	adds r1, r4, #0
	bl sub_08014D80
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED80: .4byte 0x08197CC8
_0801ED84: .4byte 0x06014800
_0801ED88: .4byte 0x0202BBB8
_0801ED8C: .4byte 0x08198184

	thumb_func_start sub_0801ED90
sub_0801ED90: @ 0x0801ED90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801EDB8 @ =0x08198164
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801EDBC @ =0x08B93814
	adds r1, r4, #0
	bl SpawnProcLocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801EDB8: .4byte 0x08198164
_0801EDBC: .4byte 0x08B93814

	thumb_func_start sub_0801EDC0
sub_0801EDC0: @ 0x0801EDC0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801EDE8 @ =0x08198818
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801EDEC @ =0x08B93814
	adds r1, r4, #0
	bl SpawnProcLocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801EDE8: .4byte 0x08198818
_0801EDEC: .4byte 0x08B93814

	thumb_func_start sub_0801EDF0
sub_0801EDF0: @ 0x0801EDF0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsls r1, r1, #4
	ldr r3, _0801EE4C @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r0, #8
	subs r1, r1, r0
	ldr r0, _0801EE50 @ =0x000001FF
	ands r1, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	subs r0, #8
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801EE54 @ =0x083EDA80
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_0801245C
	ldr r0, [r5, #0x5c]
	subs r0, #1
	str r0, [r5, #0x5c]
	cmp r0, #0
	bgt _0801EE3A
	adds r0, r5, #0
	movs r1, #0x64
	bl Proc_Goto
_0801EE3A:
	ldr r0, [r5, #0x58]
	cmp r0, #1
	beq _0801EE76
	cmp r0, #1
	bgt _0801EE58
	cmp r0, #0
	beq _0801EE70
	b _0801EE7C
	.align 2, 0
_0801EE4C: .4byte 0x0202BBB8
_0801EE50: .4byte 0x000001FF
_0801EE54: .4byte 0x083EDA80
_0801EE58:
	cmp r0, #2
	beq _0801EE68
	cmp r0, #3
	bne _0801EE7C
	ldr r0, [r5, #0x30]
	subs r0, #1
	str r0, [r5, #0x30]
	b _0801EE7C
_0801EE68:
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	b _0801EE7C
_0801EE70:
	ldr r0, [r5, #0x2c]
	subs r0, #1
	b _0801EE7A
_0801EE76:
	ldr r0, [r5, #0x2c]
	adds r0, #1
_0801EE7A:
	str r0, [r5, #0x2c]
_0801EE7C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0801EE84
sub_0801EE84: @ 0x0801EE84
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov sb, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, _0801EECC @ =0x083F4464
	ldr r1, _0801EED0 @ =0x06014800
	bl Decompress
	ldr r0, _0801EED4 @ =0x083F46F0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801EED8 @ =0x08B93834
	adds r1, r4, #0
	bl SpawnProcLocking
	str r5, [r0, #0x58]
	str r6, [r0, #0x5c]
	mov r1, r8
	str r1, [r0, #0x2c]
	mov r1, sb
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801EECC: .4byte 0x083F4464
_0801EED0: .4byte 0x06014800
_0801EED4: .4byte 0x083F46F0
_0801EED8: .4byte 0x08B93834

	thumb_func_start sub_0801EEDC
sub_0801EEDC: @ 0x0801EEDC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801EF34 @ =0x08197434
	ldr r1, _0801EF38 @ =0x06014800
	bl Decompress
	ldr r0, _0801EF3C @ =0x08197414
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r0, _0801EF40 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	subs r0, #8
	subs r4, r4, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801EF44 @ =0x0819770C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0x50
	bl sub_0801245C
	adds r4, #8
	movs r0, #0xbc
	adds r1, r4, #0
	bl sub_08014D80
	ldr r1, [r5, #0x2c]
	adds r0, r5, #0
	movs r2, #0x1f
	bl CameraMoveWatchPosition
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801EF34: .4byte 0x08197434
_0801EF38: .4byte 0x06014800
_0801EF3C: .4byte 0x08197414
_0801EF40: .4byte 0x0202BBB8
_0801EF44: .4byte 0x0819770C

	thumb_func_start sub_0801EF48
sub_0801EF48: @ 0x0801EF48
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0801EF60 @ =0x08B93874
	adds r1, r2, #0
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EF60: .4byte 0x08B93874

	thumb_func_start sub_0801EF64
sub_0801EF64: @ 0x0801EF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl sub_0802BCD0
	ldrb r1, [r0, #3]
	lsrs r4, r1, #1
	ldrb r1, [r0, #1]
	adds r4, r1, r4
	ldrb r1, [r0, #4]
	lsrs r2, r1, #1
	ldrb r0, [r0, #2]
	adds r2, r0, r2
	adds r0, r5, #0
	adds r1, r4, #0
	bl CameraMoveWatchPosition
	str r4, [r5, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801EF90
sub_0801EF90: @ 0x0801EF90
	push {r4, lr}
	adds r4, r0, #0
	bl RenderMapForFade
	bl RefreshAutoWaterShadows
	bl RenderMap
	movs r0, #0
	bl StartMapFade
	ldr r0, [r4, #0x30]
	movs r2, #0xbd
	cmp r0, #0
	beq _0801EFB0
	movs r2, #0xbe
_0801EFB0:
	ldr r0, _0801EFC8 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	ldr r1, [r4, #0x34]
	subs r1, r1, r0
	adds r0, r2, #0
	bl sub_08014D80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EFC8: .4byte 0x0202BBB8

	thumb_func_start sub_0801EFCC
sub_0801EFCC: @ 0x0801EFCC
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r4, r2, #0
	ldr r0, _0801EFF4 @ =0x08B9389C
	bl SpawnProcLocking
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetTrap
	adds r1, r0, #0
	movs r0, #1
	ldrb r2, [r1, #3]
	eors r0, r2
	strb r0, [r1, #3]
	cmp r0, #0
	beq _0801EFF8
	ldrb r0, [r1, #1]
	b _0801EFFA
	.align 2, 0
_0801EFF4: .4byte 0x08B9389C
_0801EFF8:
	ldrb r0, [r1]
_0801EFFA:
	str r0, [r5, #0x2c]
	ldrb r0, [r1, #3]
	str r0, [r5, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801F008
sub_0801F008: @ 0x0801F008
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0801F068 @ =0x08198FA4
	ldr r1, _0801F06C @ =0x06014800
	bl Decompress
	ldr r0, _0801F070 @ =0x08199438
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, [r5, #0x2c]
	lsls r4, r4, #4
	ldr r1, _0801F074 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r0, #8
	subs r4, r4, r0
	ldr r2, [r5, #0x30]
	lsls r2, r2, #4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r0, #8
	subs r2, r2, r0
	movs r3, #0x99
	lsls r3, r3, #6
	ldr r0, _0801F078 @ =0x08199224
	adds r5, #0x4a
	movs r6, #0
	ldrsh r1, [r5, r6]
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_0801245C
	adds r4, #8
	movs r0, #0xbb
	adds r1, r4, #0
	bl sub_08014D80
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F068: .4byte 0x08198FA4
_0801F06C: .4byte 0x06014800
_0801F070: .4byte 0x08199438
_0801F074: .4byte 0x0202BBB8
_0801F078: .4byte 0x08199224

	thumb_func_start sub_0801F07C
sub_0801F07C: @ 0x0801F07C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0801F0A0 @ =0x08B938CC
	adds r1, r4, #0
	bl SpawnProcLocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	cmp r7, #1
	beq _0801F0AA
	cmp r7, #1
	bgt _0801F0A4
	cmp r7, #0
	beq _0801F0B2
	b _0801F0C2
	.align 2, 0
_0801F0A0: .4byte 0x08B938CC
_0801F0A4:
	cmp r7, #3
	beq _0801F0BA
	b _0801F0C2
_0801F0AA:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #0
	b _0801F0C0
_0801F0B2:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #1
	b _0801F0C0
_0801F0BA:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #2
_0801F0C0:
	strh r0, [r1]
_0801F0C2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0801F0C8
sub_0801F0C8: @ 0x0801F0C8
	adds r0, #0x4c
	movs r1, #0xf0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0801F0D0
sub_0801F0D0: @ 0x0801F0D0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0801F0F2
	ldr r0, _0801F0FC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801F0F8
_0801F0F2:
	adds r0, r2, #0
	bl Proc_Break
_0801F0F8:
	pop {r0}
	bx r0
	.align 2, 0
_0801F0FC: .4byte 0x08B857F8

	thumb_func_start sub_0801F100
sub_0801F100: @ 0x0801F100
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r6, #0
	bl sub_080055FC
	adds r2, r0, #0
	cmp r5, #0
	blt _0801F118
	adds r2, #0x10
_0801F118:
	adds r2, #0x18
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F124
	adds r0, #0xf
_0801F124:
	asrs r4, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F12E
	adds r0, #7
_0801F12E:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r3, #4
	bl sub_08049CE4
	cmp r5, #0
	blt _0801F15E
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	lsls r0, r4, #1
	ldr r1, _0801F188 @ =0x02022EA2
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r5, #0
	bl sub_08004E28
	adds r4, #2
_0801F15E:
	bl ResetTextFont
	lsls r1, r4, #1
	ldr r0, _0801F188 @ =0x02022EA2
	adds r1, r1, r0
	movs r0, #0x14
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl sub_08005AD4
	ldr r0, _0801F18C @ =0x08B938EC
	adds r1, r7, #0
	bl SpawnProcLocking
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F188: .4byte 0x02022EA2
_0801F18C: .4byte 0x08B938EC

	thumb_func_start sub_0801F190
sub_0801F190: @ 0x0801F190
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	bl ResetTextFont
	add r0, sp, #4
	movs r1, #0x14
	bl InitText
	cmp r4, #0
	beq _0801F1CE
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	bl GetMsg
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	add r0, sp, #4
	movs r1, #2
	bl Text_Skip
_0801F1CE:
	add r0, sp, #4
	movs r1, #2
	bl Text_SetColor
	cmp r4, #0
	beq _0801F1E0
	adds r0, r7, #0
	movs r1, #0
	b _0801F1E4
_0801F1E0:
	adds r0, r7, #0
	movs r1, #1
_0801F1E4:
	bl GetItemNameWithArticle
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	add r0, sp, #4
	bl sub_08005570
	adds r1, r0, #7
	cmp r1, #0
	bge _0801F1FE
	adds r1, #7
_0801F1FE:
	asrs r4, r1, #3
	adds r1, r4, #2
	lsls r1, r1, #3
	add r0, sp, #4
	bl Text_SetCursor
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColor
	cmp r5, #0
	beq _0801F224
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
_0801F224:
	add r0, sp, #4
	bl sub_08005570
	adds r2, r0, #0
	adds r2, #0x18
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F238
	adds r0, #0xf
_0801F238:
	asrs r6, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F242
	adds r0, #7
_0801F242:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #8
	movs r3, #4
	bl sub_08049CE4
	lsls r1, r6, #1
	ldr r5, _0801F290 @ =0x02022EA2
	adds r1, r1, r5
	add r0, sp, #4
	bl sub_08005590
	adds r4, #1
	adds r4, r6, r4
	lsls r4, r4, #1
	subs r5, #2
	adds r4, r4, r5
	adds r0, r7, #0
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl sub_08004E28
	ldr r0, _0801F294 @ =0x08B938EC
	mov r1, r8
	bl SpawnProcLocking
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F290: .4byte 0x02022EA2
_0801F294: .4byte 0x08B938EC

	thumb_func_start sub_0801F298
sub_0801F298: @ 0x0801F298
	push {lr}
	ldr r2, _0801F2A8 @ =0x0000075E
	ldr r3, _0801F2AC @ =0x000012B2
	bl sub_0801F190
	pop {r0}
	bx r0
	.align 2, 0
_0801F2A8: .4byte 0x0000075E
_0801F2AC: .4byte 0x000012B2

	thumb_func_start sub_0801F2B0
sub_0801F2B0: @ 0x0801F2B0
	push {lr}
	ldr r2, _0801F2C0 @ =0x0000075F
	movs r3, #0xec
	lsls r3, r3, #3
	bl sub_0801F190
	pop {r0}
	bx r0
	.align 2, 0
_0801F2C0: .4byte 0x0000075F

	thumb_func_start sub_0801F2C4
sub_0801F2C4: @ 0x0801F2C4
	push {lr}
	bl GetGameTime
	adds r2, r0, #0
	lsrs r2, r2, #1
	movs r0, #0xff
	ands r2, r0
	movs r0, #3
	adds r1, r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801F2E0
sub_0801F2E0: @ 0x0801F2E0
	ldr r1, [r0, #0x14]
	adds r1, #0x50
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_0801F2F0
sub_0801F2F0: @ 0x0801F2F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801F344 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801F316
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801F312
	adds r1, r4, #0
	adds r1, #0x50
_0801F312:
	movs r0, #1
	strh r0, [r1]
_0801F316:
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0801F33E
	ldr r2, [r4, #0x14]
	adds r1, r2, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0801F33E
	adds r1, r0, #0
	adds r0, r2, #0
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_End
_0801F33E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F344: .4byte 0x08B857F8

	thumb_func_start sub_0801F348
sub_0801F348: @ 0x0801F348
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r4, _0801F3A4 @ =0x02023C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0801F3A8 @ =0x083FF538
	ldr r5, _0801F3AC @ =0x02001F72
	adds r1, r5, #0
	bl Decompress
	movs r1, #0
	mov ip, r4
	mov r8, r5
	ldr r0, _0801F3B0 @ =0x00005001
	adds r5, r0, #0
_0801F36E:
	movs r3, #0
	adds r4, r1, #1
	lsls r1, r4, #5
	adds r1, #3
	lsls r0, r6, #1
	mov r7, r8
	adds r2, r0, r7
	lsls r1, r1, #1
	add r1, ip
_0801F380:
	ldrh r7, [r2]
	adds r0, r5, r7
	strh r0, [r1]
	adds r2, #2
	adds r6, #1
	adds r1, #2
	adds r3, #1
	cmp r3, #0x17
	ble _0801F380
	adds r1, r4, #0
	cmp r1, #0x11
	ble _0801F36E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F3A4: .4byte 0x02023C60
_0801F3A8: .4byte 0x083FF538
_0801F3AC: .4byte 0x02001F72
_0801F3B0: .4byte 0x00005001

	thumb_func_start sub_0801F3B4
sub_0801F3B4: @ 0x0801F3B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0x82
	lsls r0, r0, #7
	mov sb, r0
	ldr r1, _0801F480 @ =0x00004110
	mov r8, r1
	movs r6, #0
	ldr r7, _0801F484 @ =0x02024460
	mov sl, r7
_0801F3D0:
	movs r0, #0
	str r0, [sp]
	lsls r5, r6, #5
	adds r2, r6, #0
	adds r2, #0x10
	adds r0, r6, #0
	adds r0, #8
	adds r4, r6, #0
	adds r4, #0x18
	adds r1, r6, #1
	str r1, [sp, #4]
	adds r5, #0x10
	lsls r3, r2, #5
	adds r3, #0x10
	lsls r1, r0, #5
	adds r1, #0x10
	lsls r0, r0, #6
	add r0, sl
	mov ip, r0
	lsls r2, r2, #6
	add r2, sl
	str r2, [sp, #0xc]
	lsls r0, r6, #6
	mov r6, sl
	adds r2, r0, r6
	lsls r0, r4, #5
	adds r0, #0x10
	str r0, [sp, #8]
	lsls r4, r4, #6
	add r4, sl
	lsls r1, r1, #1
	add r1, sl
	lsls r3, r3, #1
	add r3, sl
	lsls r5, r5, #1
	add r5, sl
_0801F418:
	mov r7, sb
	strh r7, [r2]
	mov r0, sb
	strh r0, [r5]
	ldr r6, [sp, #0xc]
	strh r0, [r6]
	strh r0, [r3]
	mov r0, r8
	mov r7, ip
	strh r0, [r7]
	strh r0, [r1]
	strh r0, [r4]
	ldr r6, [sp, #8]
	ldr r7, [sp]
	adds r0, r6, r7
	lsls r0, r0, #1
	add r0, sl
	mov r6, r8
	strh r6, [r0]
	movs r7, #1
	add sb, r7
	movs r0, #1
	add r8, r0
	movs r6, #2
	add ip, r6
	ldr r7, [sp, #0xc]
	adds r7, #2
	str r7, [sp, #0xc]
	adds r2, #2
	adds r4, #2
	adds r1, #2
	adds r3, #2
	adds r5, #2
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	cmp r0, #0xf
	ble _0801F418
	movs r1, #0x10
	add sb, r1
	add r8, r1
	ldr r6, [sp, #4]
	cmp r6, #7
	ble _0801F3D0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F480: .4byte 0x00004110
_0801F484: .4byte 0x02024460

	thumb_func_start sub_0801F488
sub_0801F488: @ 0x0801F488
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0x82
	lsls r0, r0, #7
	mov r8, r0
	ldr r1, _0801F568 @ =0x00004110
	str r1, [sp, #0xc]
	movs r2, #0
	ldr r6, _0801F56C @ =0x02023C60
_0801F4A2:
	movs r5, #0
	adds r0, r2, #0
	adds r0, #0x10
	adds r3, r2, #0
	adds r3, #8
	adds r4, r2, #0
	adds r4, #0x18
	adds r7, r2, #1
	str r7, [sp, #8]
	lsls r2, r2, #5
	str r2, [sp]
	adds r2, #0x1f
	lsls r0, r0, #5
	mov sl, r0
	mov r1, sl
	adds r1, #0x1f
	lsls r3, r3, #5
	mov sb, r3
	mov r0, sb
	adds r0, #0x1f
	lsls r4, r4, #5
	mov ip, r4
	mov r3, ip
	adds r3, #0x1f
	str r3, [sp, #4]
	lsls r0, r0, #1
	adds r4, r0, r6
	lsls r1, r1, #1
	adds r3, r1, r6
	lsls r2, r2, #1
	adds r2, r2, r6
_0801F4E0:
	ldr r0, [sp]
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	strh r1, [r0]
	strh r1, [r2]
	mov r0, sl
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	strh r1, [r3]
	mov r0, sb
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r7, r0
	ldr r7, [sp, #0x10]
	strh r1, [r7]
	strh r1, [r4]
	mov r0, ip
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	ldr r7, [sp, #4]
	subs r0, r7, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	subs r4, #2
	subs r3, #2
	subs r2, #2
	adds r5, #1
	cmp r5, #0xf
	ble _0801F4E0
	movs r3, #0x10
	add r8, r3
	adds r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [sp, #8]
	cmp r2, #7
	ble _0801F4A2
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F568: .4byte 0x00004110
_0801F56C: .4byte 0x02023C60

	thumb_func_start sub_0801F570
sub_0801F570: @ 0x0801F570
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	bl sub_0801551C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801F6F4 @ =0x02022C60
	mov sl, r0
	movs r1, #0
	bl TmFill
	ldr r1, _0801F6F8 @ =0x02023460
	mov sb, r1
	mov r0, sb
	movs r1, #0
	bl TmFill
	ldr r0, _0801F6FC @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0801F700 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl sub_08001434
	ldr r2, _0801F704 @ =0x03002870
	mov ip, r2
	movs r5, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0x34
	add r0, ip
	mov r8, r0
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r6, #4
	orrs r1, r6
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r7]
	ands r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, r8
	strb r1, [r2]
	orrs r0, r5
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	movs r0, #8
	movs r1, #0
	bl sub_08082058
	movs r0, #0
	movs r1, #1
	bl sub_08082058
	movs r0, #0x80
	bl sub_08082410
	movs r4, #0x80
	lsls r4, r4, #1
	ldr r0, _0801F708 @ =0x0202BBF8
	bl sub_080824A4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08082308
	movs r0, #0x80
	lsls r0, r0, #2
	add sb, r0
	mov r0, sb
	movs r1, #0
	bl sub_08082480
	ldr r1, _0801F70C @ =0x00000246
	add sl, r1
	mov r0, sl
	movs r1, #1
	bl sub_08082440
	bl sub_080020BC
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	movs r1, #2
	movs r2, #0x40
	bl sub_08002218
	bl sub_080C57C4
	bl EnablePalSync
	ldr r0, _0801F710 @ =0x083FF780
	ldr r1, _0801F714 @ =0x0600A000
	bl Decompress
	ldr r0, _0801F718 @ =0x08401404
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801F71C @ =0x083FE578
	ldr r1, _0801F720 @ =0x06008020
	bl Decompress
	ldr r0, _0801F724 @ =0x083FF760
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0x80
	lsls r0, r0, #3
	bl sub_08001840
	ldr r0, _0801F728 @ =0x02022860
	strh r5, [r0]
	bl sub_0801F348
	bl sub_0801F3B4
	movs r0, #0xf
	bl EnableBgSync
	ldr r0, [sp]
	adds r0, #0x52
	strh r5, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F6F4: .4byte 0x02022C60
_0801F6F8: .4byte 0x02023460
_0801F6FC: .4byte 0x02023C60
_0801F700: .4byte 0x02024460
_0801F704: .4byte 0x03002870
_0801F708: .4byte 0x0202BBF8
_0801F70C: .4byte 0x00000246
_0801F710: .4byte 0x083FF780
_0801F714: .4byte 0x0600A000
_0801F718: .4byte 0x08401404
_0801F71C: .4byte 0x083FE578
_0801F720: .4byte 0x06008020
_0801F724: .4byte 0x083FF760
_0801F728: .4byte 0x02022860

	thumb_func_start sub_0801F72C
sub_0801F72C: @ 0x0801F72C
	push {lr}
	ldr r3, _0801F768 @ =0x03002870
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	ldr r1, _0801F76C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r1, r2
	movs r2, #0x18
	orrs r1, r2
	strh r1, [r3, #0x3c]
	adds r0, #0x4c
	movs r1, #0xc
	strh r1, [r0]
	movs r0, #2
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
_0801F768: .4byte 0x03002870
_0801F76C: .4byte 0x0000FFE0

	thumb_func_start sub_0801F770
sub_0801F770: @ 0x0801F770
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0801F7C0 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #3
	beq _0801F7AE
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0801F7FA
_0801F7AE:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F7C4
	ldrh r0, [r4]
	subs r0, #4
	b _0801F7C8
	.align 2, 0
_0801F7C0: .4byte 0x03002870
_0801F7C4:
	ldrh r0, [r4]
	subs r0, #1
_0801F7C8:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0801F7FA
	ldr r2, _0801F800 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0801F7FA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F800: .4byte 0x03002870

	thumb_func_start sub_0801F804
sub_0801F804: @ 0x0801F804
	push {lr}
	ldr r3, _0801F858 @ =0x03002870
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0801F85C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801F860 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0801F864 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801F854
	movs r0, #0x60
	bl sub_080BE594
_0801F854:
	pop {r0}
	bx r0
	.align 2, 0
_0801F858: .4byte 0x03002870
_0801F85C: .4byte 0x0000FFE0
_0801F860: .4byte 0x0000E0FF
_0801F864: .4byte 0x0202BBF8

	thumb_func_start sub_0801F868
sub_0801F868: @ 0x0801F868
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0801F8C4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0x10
	ldrb r1, [r4]
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #3
	beq _0801F8B2
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0801F906
_0801F8B2:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F8C8
	ldrh r0, [r4]
	subs r0, #4
	b _0801F8CC
	.align 2, 0
_0801F8C4: .4byte 0x03002870
_0801F8C8:
	ldrh r0, [r4]
	subs r0, #1
_0801F8CC:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0801F906
	ldr r3, _0801F90C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0801F906:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F90C: .4byte 0x03002870

	thumb_func_start sub_0801F910
sub_0801F910: @ 0x0801F910
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0801F948 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _0801F94C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801F944
	movs r0, #0x61
	bl sub_080BE594
_0801F944:
	pop {r0}
	bx r0
	.align 2, 0
_0801F948: .4byte 0x03002870
_0801F94C: .4byte 0x0202BBF8

	thumb_func_start sub_0801F950
sub_0801F950: @ 0x0801F950
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x78
	bl sub_08012FE8
	ldr r2, _0801F9A8 @ =0x03002870
	movs r1, #0x78
	subs r1, r1, r0
	adds r3, r2, #0
	adds r3, #0x2d
	strb r1, [r3]
	adds r3, #4
	movs r1, #0x4e
	strb r1, [r3]
	adds r0, #0x78
	adds r1, r2, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x51
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F9AC
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801F9AC
	adds r0, r1, #2
	strh r0, [r4]
	adds r0, r4, #0
	b _0801F9B6
	.align 2, 0
_0801F9A8: .4byte 0x03002870
_0801F9AC:
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_0801F9B6:
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	ble _0801F9C4
	adds r0, r5, #0
	bl Proc_Break
_0801F9C4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0801F9CC
sub_0801F9CC: @ 0x0801F9CC
	adds r0, #0x4c
	movs r1, #1
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0801F9D4
sub_0801F9D4: @ 0x0801F9D4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_08012FE8
	ldr r3, _0801FA2C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	movs r1, #0x50
	subs r1, r1, r0
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	adds r0, #0x50
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0801FA24
	adds r0, r5, #0
	bl Proc_Break
_0801FA24:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FA2C: .4byte 0x03002870

	thumb_func_start sub_0801FA30
sub_0801FA30: @ 0x0801FA30
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, _0801FA7C @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _0801FA80 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #6
	orrs r0, r1
	ldr r1, _0801FA84 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0801FA7C: .4byte 0x03002870
_0801FA80: .4byte 0x0000FFE0
_0801FA84: .4byte 0x0000E0FF

	thumb_func_start sub_0801FA88
sub_0801FA88: @ 0x0801FA88
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080C57C4
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801FAAA
	adds r0, r4, #0
	bl Proc_Break
_0801FAAA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0801FAB0
sub_0801FAB0: @ 0x0801FAB0
	push {lr}
	adds r0, #0x4c
	movs r1, #0xd
	strh r1, [r0]
	bl sub_080020BC
	ldr r0, _0801FAD0 @ =0x020228E0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #4
	movs r2, #2
	bl sub_080020F4
	pop {r0}
	bx r0
	.align 2, 0
_0801FAD0: .4byte 0x020228E0

	thumb_func_start sub_0801FAD4
sub_0801FAD4: @ 0x0801FAD4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #3
	ands r4, r0
	cmp r4, #0
	bne _0801FB30
	bl sub_080C57C4
	bl EnablePalSync
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801FB30
	ldr r2, _0801FB38 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl sub_08001434
	ldr r0, _0801FB3C @ =0x02022860
	strh r4, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
_0801FB30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FB38: .4byte 0x03002870
_0801FB3C: .4byte 0x02022860

	thumb_func_start sub_0801FB40
sub_0801FB40: @ 0x0801FB40
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	ldr r0, _0801FB64 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl InitSystemTextFont
	pop {r0}
	bx r0
	.align 2, 0
_0801FB64: .4byte 0x0202BBF8

	thumb_func_start sub_0801FB68
sub_0801FB68: @ 0x0801FB68
	ldr r1, _0801FB74 @ =0x0202BBB8
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801FB74: .4byte 0x0202BBB8

	thumb_func_start sub_0801FB78
sub_0801FB78: @ 0x0801FB78
	push {r4, r5, lr}
	ldr r3, _0801FC4C @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0801FC50 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _0801FC54 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0801FC58 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl sub_0802DE50
	ldr r4, _0801FC5C @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl ApplyChapterMapGraphics
	bl ApplyUnitSpritePalettes
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xf8
	lsls r1, r1, #1
	ands r0, r1
	ldr r5, _0801FC60 @ =0x0202BBB8
	strh r0, [r5, #0xc]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xfc
	lsls r1, r1, #2
	ands r0, r1
	strh r0, [r5, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC4C: .4byte 0x03002870
_0801FC50: .4byte 0x0000FFE0
_0801FC54: .4byte 0x0000E0FF
_0801FC58: .4byte 0x02023C60
_0801FC5C: .4byte 0x0202BBF8
_0801FC60: .4byte 0x0202BBB8

	thumb_func_start sub_0801FC64
sub_0801FC64: @ 0x0801FC64
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080020BC
	ldr r5, _0801FCD4 @ =0x02022920
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #1
	bl sub_080020F4
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #1
	bl sub_080020F4
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #1
	bl sub_080020F4
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #1
	bl sub_080020F4
	bl sub_080C57C4
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0x1e
	strh r0, [r4]
	ldr r0, _0801FCD8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0801FCCE
	bl ApplyFlamesWeatherGradient
_0801FCCE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FCD4: .4byte 0x02022920
_0801FCD8: .4byte 0x0202BBF8

	thumb_func_start sub_0801FCDC
sub_0801FCDC: @ 0x0801FCDC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0801FCEE
	b _0801FE2C
_0801FCEE:
	bl sub_080C57C4
	ldr r4, _0801FD7C @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0801FD06
	bl ApplyFlamesWeatherGradient
_0801FD06:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x8b
	ldrb r6, [r0]
	cmp r6, #0
	beq _0801FD88
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0801FD28
	movs r1, #2
_0801FD28:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _0801FD80 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801FD52
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0801FD46
	movs r1, #2
_0801FD46:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_0801FD52:
	adds r3, r7, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0801FD84 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r5, r3, #0
	b _0801FDCE
	.align 2, 0
_0801FD7C: .4byte 0x0202BBF8
_0801FD80: .4byte 0x0000FFFF
_0801FD84: .4byte 0x03002870
_0801FD88:
	bl EnablePalSync
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r1, #7
	adds r5, r0, #0
	cmp r3, #0
	bge _0801FD9E
	adds r3, #7
_0801FD9E:
	asrs r3, r3, #3
	ldr r0, _0801FE34 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0xc
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #4
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
_0801FDCE:
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _0801FE1A
	ldr r4, _0801FE38 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0801FDF0
	movs r1, #2
_0801FDF0:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _0801FE3C @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801FE1A
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0801FE0E
	movs r1, #2
_0801FE0E:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_0801FE1A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0801FE2C
	bl sub_0802DE6C
	adds r0, r7, #0
	bl Proc_Break
_0801FE2C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE34: .4byte 0x03002870
_0801FE38: .4byte 0x0202BBF8
_0801FE3C: .4byte 0x0000FFFF

	thumb_func_start sub_0801FE40
sub_0801FE40: @ 0x0801FE40
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0801FE48
sub_0801FE48: @ 0x0801FE48
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801FE90 @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x50
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	subs r1, #1
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0801FE88
	adds r0, r5, #0
	bl Proc_Break
_0801FE88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE90: .4byte 0x03002870

	thumb_func_start sub_0801FE94
sub_0801FE94: @ 0x0801FE94
	adds r0, #0x4c
	movs r1, #8
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0801FE9C
sub_0801FE9C: @ 0x0801FE9C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801FEE4 @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x50
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	subs r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0801FEDC
	adds r0, r5, #0
	bl Proc_Break
_0801FEDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FEE4: .4byte 0x03002870

	thumb_func_start sub_0801FEE8
sub_0801FEE8: @ 0x0801FEE8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080020BC
	ldr r0, _0801FF10 @ =0x02022860
	movs r3, #2
	rsbs r3, r3, #0
	movs r1, #0
	movs r2, #6
	bl sub_080020F4
	adds r4, #0x4c
	movs r0, #0xf
	strh r0, [r4]
	movs r0, #1
	bl sub_08003710
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FF10: .4byte 0x02022860

	thumb_func_start sub_0801FF14
sub_0801FF14: @ 0x0801FF14
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080C57C4
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801FF5C
	ldr r2, _0801FF64 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl sub_08001434
	adds r0, r4, #0
	bl Proc_Break
_0801FF5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FF64: .4byte 0x03002870

	thumb_func_start sub_0801FF68
sub_0801FF68: @ 0x0801FF68
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ClearUi
	bl sub_080020BC
	ldr r5, _08020004 @ =0x02022920
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #2
	bl sub_080020F4
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #2
	bl sub_080020F4
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r1, #0x10
	movs r2, #2
	movs r3, #2
	bl sub_080020F4
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #2
	bl sub_080020F4
	bl sub_080C57C4
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0xe
	strh r0, [r4]
	ldr r4, _08020008 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0801FFD4
	movs r1, #2
_0801FFD4:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _0802000C @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801FFFE
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0801FFF2
	movs r1, #2
_0801FFF2:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_0801FFFE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020004: .4byte 0x02022920
_08020008: .4byte 0x0202BBF8
_0802000C: .4byte 0x0000FFFF

	thumb_func_start sub_08020010
sub_08020010: @ 0x08020010
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080C57C4
	ldr r5, _08020064 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0802002C
	bl ApplyFlamesWeatherGradient
_0802002C:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802006C
	adds r3, r4, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08020068 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _08020074
	.align 2, 0
_08020064: .4byte 0x0202BBF8
_08020068: .4byte 0x03002870
_0802006C:
	bl EnablePalSync
	adds r3, r4, #0
	adds r3, #0x4c
_08020074:
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802008A
	bl sub_0802DE6C
	adds r0, r4, #0
	bl Proc_Break
_0802008A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08020090
sub_08020090: @ 0x08020090
	adds r1, #0x50
	strh r0, [r1]
	bx lr
	.align 2, 0

