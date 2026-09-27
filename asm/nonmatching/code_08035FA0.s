	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindClosestTerrainAdjacentPosition
AiFindClosestTerrainAdjacentPosition: @ 0x08035FA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	mov sl, r1
	mov sb, r2
	movs r0, #0xff
	str r0, [sp, #8]
	ldr r0, _080360BC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _080360B0
	mov r8, sp
_08035FC4:
	ldr r0, _080360BC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r6, #1
	str r3, [sp, #0xc]
	cmp r5, #0
	blt _080360AA
	lsls r7, r6, #2
	str r7, [sp, #0x10]
_08035FD8:
	ldr r0, _080360C0 @ =0x0202E3E8
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080360A4
	ldr r0, _080360C4 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080360A4
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08036034
	ldr r0, _080360C8 @ =0x0202E3DC
	ldr r0, [r0]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036034
	ldr r0, _080360CC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080360A4
_08036034:
	movs r0, #2
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _0803604E
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080360A4
_0803604E:
	mov r4, sp
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _080360D0 @ =AiGetPositionRange
	mov r3, sp
	bl AiFindBestAdjacentPositionByFunc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080360A4
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _080360C0 @ =0x0202E3E8
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r3, r8
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _080360A4
	ldrh r0, [r3]
	mov r3, sb
	strh r0, [r3]
	ldrh r0, [r4, #2]
	strh r0, [r3, #2]
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
_080360A4:
	subs r5, #1
	cmp r5, #0
	bge _08035FD8
_080360AA:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	bge _08035FC4
_080360B0:
	ldr r7, [sp, #8]
	cmp r7, #0xff
	bne _080360D4
	movs r0, #0
	b _080360D6
	.align 2, 0
_080360BC: .4byte 0x0202E3D8
_080360C0: .4byte 0x0202E3E8
_080360C4: .4byte 0x0202E3E0
_080360C8: .4byte 0x0202E3DC
_080360CC: .4byte 0x03004690
_080360D0: .4byte AiGetPositionRange
_080360D4:
	movs r0, #1
_080360D6:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
