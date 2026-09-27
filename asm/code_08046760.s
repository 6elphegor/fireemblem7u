	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046760
sub_08046760: @ 0x08046760
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl sub_08046674
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804678C
	b _0804697A
_0804678C:
	ldr r0, _080468CC @ =0x0203A8EC
	adds r0, #0x7d
	movs r1, #0xe
	strb r1, [r0]
	ldr r0, _080468D0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #6
	ldr r1, [sp, #0x10]
	adds r1, #0x2c
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x10]
	adds r2, #0x30
	str r2, [sp, #0x38]
	cmp r4, r0
	blt _080467B4
	b _0804695C
_080467B4:
	ldr r0, _080468D4 @ =0x0202BD48
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, _080468D8 @ =0x03004690
	str r2, [r0]
	ldr r1, [r2, #0xc]
	ldr r0, _080468DC @ =0x00010004
	ands r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #6
	str r0, [sp, #0x30]
	adds r4, #1
	str r4, [sp, #0x28]
	cmp r1, #0
	beq _080467DA
	b _08046952
_080467DA:
	ldr r0, [r2]
	cmp r0, #0
	bne _080467E2
	b _08046952
_080467E2:
	movs r5, #0
_080467E4:
	ldr r0, _080468D8 @ =0x03004690
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x2c]
	cmp r4, #0
	bne _080467FE
	b _0804694A
_080467FE:
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804680E
	b _0804694A
_0804680E:
	mov sl, r5
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _08046820
	b _0804694A
_08046820:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08046830
	b _0804694A
_08046830:
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _0804683E
	movs r0, #2
	mov r8, r0
_0804683E:
	adds r0, r6, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _08046850
	movs r0, #1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_08046850:
	add r0, sp, #4
	strh r5, [r0, #4]
	ldr r0, _080468E0 @ =0x0203DC9C
	ldrb r0, [r0, #2]
	lsls r0, r0, #6
	mov sb, r0
	mov r5, sb
	adds r5, #1
	adds r0, #6
	cmp r5, r0
	bge _0804694A
	add r6, sp, #4
	ldr r7, _080468E4 @ =0x0300141C
	mov r0, r8
	movs r2, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
_08046876:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, _080468DC @ =0x00010004
	ands r1, r0
	cmp r1, #0
	bne _08046940
	ldr r0, [r4]
	cmp r0, #0
	beq _08046940
	strb r5, [r6, #2]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _080468F0
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bhi _080468F0
	str r0, [sp, #0x18]
	ldr r0, _080468D4 @ =0x0202BD48
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r2, r8
	cmp r2, #3
	bne _080468E8
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	b _080468EA
	.align 2, 0
_080468CC: .4byte 0x0203A8EC
_080468D0: .4byte 0x0202BBF8
_080468D4: .4byte 0x0202BD48
_080468D8: .4byte 0x03004690
_080468DC: .4byte 0x00010004
_080468E0: .4byte 0x0203DC9C
_080468E4: .4byte 0x0300141C
_080468E8:
	movs r0, #1
_080468EA:
	strb r0, [r7, #2]
	mov r0, sl
	strb r0, [r7, #3]
_080468F0:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046940
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r2, r0
	bhi _08046940
	str r0, [sp, #0x18]
	ldr r0, _08046934 @ =0x0202BD48
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r0, r8
	cmp r0, #3
	bne _08046938
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	strb r0, [r7, #2]
	b _0804693C
	.align 2, 0
_08046934: .4byte 0x0202BD48
_08046938:
	movs r1, #2
	strb r1, [r7, #2]
_0804693C:
	mov r2, sl
	strb r2, [r7, #3]
_08046940:
	adds r5, #1
	mov r0, sb
	adds r0, #6
	cmp r5, r0
	blt _08046876
_0804694A:
	ldr r5, [sp, #0x2c]
	cmp r5, #4
	bgt _08046952
	b _080467E4
_08046952:
	ldr r4, [sp, #0x28]
	ldr r0, [sp, #0x30]
	cmp r4, r0
	bge _0804695C
	b _080467B4
_0804695C:
	ldr r2, _0804698C @ =0x0203DCA0
	ldr r1, [sp, #0x38]
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	ldr r3, [sp, #0x34]
	bl sub_08044C10
	ldr r0, _08046990 @ =0x0300141C
	add r2, sp, #0x20
	ldrb r2, [r2]
	strb r2, [r0, #1]
	ldr r0, [sp, #0x10]
	bl Proc_Break
_0804697A:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804698C: .4byte 0x0203DCA0
_08046990: .4byte 0x0300141C
