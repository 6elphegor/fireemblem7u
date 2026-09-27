	.include "macro.inc"

	.syntax unified

	thumb_func_start AiAttemptStealActionWithinMovement
AiAttemptStealActionWithinMovement: @ 0x08038C44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0xff
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	ldr r0, _08038C68 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r0, #1
	b _08038D40
	.align 2, 0
_08038C68: .4byte 0x0202E3D8
_08038C6C:
	ldr r0, _08038D50 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	mov r2, r8
	subs r2, #1
	str r2, [sp, #0x20]
	cmp r5, #0
	blt _08038D3E
	mov r3, r8
	lsls r7, r3, #2
_08038C82:
	ldr r0, _08038D54 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038D38
	ldr r0, _08038D58 @ =0x0202E3DC
	mov sl, r0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08038D38
	ldr r0, _08038D5C @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08038D38
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, r8
	ldr r2, _08038D60 @ =sub_08038BEC
	add r3, sp, #0xc
	bl AiFindBestAdjacentPositionByFunc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D38
	mov r2, sl
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _08038D64 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _08038D38
	adds r0, r4, #0
	bl AiGetUnitStealItemSlot
	lsls r6, r0, #0x18
	asrs r1, r6, #0x18
	cmp r1, #0
	blt _08038D38
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl AiGetItemStealRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r3, r0
	blo _08038D38
	str r0, [sp, #0x14]
	add r1, sp, #0xc
	ldr r2, [sp, #0x1c]
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	ldrh r1, [r1]
	orrs r1, r0
	mov sb, r1
	mov r3, sl
	ldr r0, [r3]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
_08038D38:
	subs r5, #1
	cmp r5, #0
	bge _08038C82
_08038D3E:
	ldr r0, [sp, #0x20]
_08038D40:
	mov r8, r0
	cmp r0, #0
	bge _08038C6C
	ldr r1, [sp, #0x14]
	cmp r1, #0xff
	bne _08038D68
	movs r0, #0
	b _08038D90
	.align 2, 0
_08038D50: .4byte 0x0202E3D8
_08038D54: .4byte 0x0202E3E4
_08038D58: .4byte 0x0202E3DC
_08038D5C: .4byte 0x0202BD48
_08038D60: .4byte sub_08038BEC
_08038D64: .4byte 0x03004690
_08038D68:
	ldr r0, _08038DA0 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	asrs r1, r3, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #3
	ldr r3, [sp, #0x18]
	bl AiSetDecision
	movs r0, #1
_08038D90:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038DA0: .4byte 0x03004690
