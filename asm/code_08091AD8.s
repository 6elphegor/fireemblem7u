	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091AD8
sub_08091AD8: @ 0x08091AD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r2, r8
	adds r2, #0x29
	ldrb r7, [r2]
	ldr r0, _08091BB4 @ =0x08B857F8
	ldr r1, [r0]
	ldrh r5, [r1, #6]
	mov r3, r8
	adds r3, #0x30
	movs r0, #4
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r4, [r1, #4]
	ands r0, r4
	cmp r0, #0
	beq _08091B06
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r3]
_08091B06:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08091B18
	ldrb r0, [r2]
	subs r0, #3
	cmp r0, #0
	blt _08091B18
	strb r0, [r2]
_08091B18:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x29
	cmp r0, #0
	beq _08091B36
	ldrb r4, [r6]
	adds r4, #3
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08091B36
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_08091B36:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08091B52
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091B52
	subs r0, r4, #1
	strb r0, [r6]
_08091B52:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _08091B7C
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08091B7C
	adds r4, #1
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08091B7C
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08091B7C:
	ldrb r0, [r6]
	cmp r0, r7
	beq _08091C3C
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x32]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _08091BB8
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08091BB8
	lsrs r1, r1, #4
	adds r1, #4
	b _08091BCC
	.align 2, 0
_08091BB4: .4byte 0x08B857F8
_08091BB8:
	mov r1, r8
	ldrh r0, [r1, #0x32]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _08091BEC
	cmp r7, #0
	beq _08091BEC
	lsrs r1, r7, #4
	subs r1, #1
_08091BCC:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl sub_08092B6C
	ldrb r0, [r6]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	adds r0, #0x18
	bl SetSysHandCursorXPos
	b _08091C1C
_08091BEC:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
_08091C1C:
	ldr r0, _08091C34 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091C2E
	ldr r0, _08091C38 @ =0x00000385
	bl m4aSongNumStart
_08091C2E:
	movs r0, #1
	b _08091C3E
	.align 2, 0
_08091C34: .4byte 0x0202BBF8
_08091C38: .4byte 0x00000385
_08091C3C:
	movs r0, #0
_08091C3E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
