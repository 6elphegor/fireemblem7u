	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindClosestTerrainPosition
AiFindClosestTerrainPosition: @ 0x08035E44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov sb, r0
	ldr r0, _08035F20 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08035F16
_08035E66:
	ldr r0, _08035F20 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _08035F10
	lsls r6, r5, #2
_08035E78:
	ldr r0, _08035F24 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035F0A
	ldr r0, _08035F28 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035F0A
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08035ED0
	ldr r0, _08035F2C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08035ED0
	ldr r0, _08035F30 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035F0A
_08035ED0:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08035EEA
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _08035F0A
_08035EEA:
	ldr r0, _08035F24 @ =0x0202E3E8
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	ble _08035F0A
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_08035F0A:
	subs r4, #1
	cmp r4, #0
	bge _08035E78
_08035F10:
	mov r5, sl
	cmp r5, #0
	bge _08035E66
_08035F16:
	mov r0, sb
	cmp r0, #0xff
	bne _08035F34
	movs r0, #0
	b _08035F36
	.align 2, 0
_08035F20: .4byte 0x0202E3D8
_08035F24: .4byte 0x0202E3E8
_08035F28: .4byte 0x0202E3E0
_08035F2C: .4byte 0x0202E3DC
_08035F30: .4byte 0x03004690
_08035F34:
	movs r0, #1
_08035F36:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
