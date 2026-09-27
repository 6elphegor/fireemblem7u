	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080380A8
sub_080380A8: @ 0x080380A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r4, _080381EC @ =0x03004690
	ldr r0, [r4]
	bl RevertMapChange
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	mov r8, r0
	cmp r0, #0
	beq _080381D2
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	lsls r6, r6, #0x10
	str r6, [sp, #0x1c]
_080380E6:
	ldr r0, _080381EC @ =0x03004690
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov sb, r1
	cmp r0, #0
	beq _080381B8
	ldr r0, _080381F0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	mov r0, r8
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _080381F4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _080381B8
_08038138:
	ldr r0, _080381F4 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _080381B2
	lsls r7, r6, #2
_0803814A:
	ldr r0, _080381F8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080381AC
	ldr r0, _080381F0 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080381AC
	ldr r0, _080381FC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _08038186
	ldr r0, _08038200 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _080381AC
_08038186:
	mov r0, r8
	bl GetItemMight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08038054
	adds r4, r4, r0
	ldr r1, [sp, #0x14]
	cmp r4, r1
	bls _080381AC
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
_080381AC:
	subs r5, #1
	cmp r5, #0
	bge _0803814A
_080381B2:
	mov r6, sl
	cmp r6, #0
	bge _08038138
_080381B8:
	mov r1, sb
	str r1, [sp, #8]
	cmp r1, #4
	bgt _080381D2
	ldr r0, _080381EC @ =0x03004690
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _080380E6
_080381D2:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _08038204
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
	b _08038206
	.align 2, 0
_080381EC: .4byte 0x03004690
_080381F0: .4byte 0x0202E3E8
_080381F4: .4byte 0x0202E3D8
_080381F8: .4byte 0x0202E3E4
_080381FC: .4byte 0x0202E3DC
_08038200: .4byte 0x0202BD48
_08038204:
	movs r0, #0
_08038206:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
