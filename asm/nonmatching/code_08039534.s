	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryGetNearestHealPoint
AiTryGetNearestHealPoint: @ 0x08039534
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _080395F8 @ =0x00002710
	str r0, [sp]
	movs r1, #0xff
	mov sb, r1
	ldr r0, _080395FC @ =0x03004690
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08039562
	b _080396F0
_08039562:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08039574
	b _080396F0
_08039574:
	adds r0, r2, #0
	movs r1, #0x7c
	bl MapFloodUnitMovement
	ldr r0, _08039600 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803958A
	b _080396A6
_0803958A:
	ldr r0, _08039600 @ =0x0202E3D8
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r4, #0
	bge _0803959C
	b _0803969E
_0803959C:
	lsls r5, r7, #2
_0803959E:
	ldr r0, _08039604 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08039696
	ldr r0, _08039608 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, _0803960C @ =0x08B98AC4
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039618
	ldr r6, _08039610 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039696
	ldr r0, _08039614 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039696
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	b _0803965A
	.align 2, 0
_080395F8: .4byte 0x00002710
_080395FC: .4byte 0x03004690
_08039600: .4byte 0x0202E3D8
_08039604: .4byte 0x0202E3E4
_08039608: .4byte 0x0202E3E0
_0803960C: .4byte 0x08B98AC4
_08039610: .4byte 0x0202E3DC
_08039614: .4byte 0x0202BD48
_08039618:
	ldr r6, _080396E4 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039664
	ldr r0, _080396E8 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039696
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08039664
_0803965A:
	movs r0, #4
	ldrb r2, [r2, #0xa]
	ands r0, r2
	cmp r0, #0
	beq _08039696
_08039664:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	adds r2, r0, #0
	ldr r0, [sp]
	cmp r2, r0
	bgt _08039696
	ldr r0, _080396EC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, sb
	bgt _08039696
	str r2, [sp]
	ldrb r1, [r1]
	mov sb, r1
	mov r1, r8
	strh r4, [r1]
	strh r7, [r1, #2]
_08039696:
	subs r4, #1
	cmp r4, #0
	blt _0803969E
	b _0803959E
_0803969E:
	mov r7, sl
	cmp r7, #0
	blt _080396A6
	b _0803958A
_080396A6:
	mov r2, sb
	cmp r2, #0xff
	beq _080396F0
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _080396E4 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _080396E0
	ldr r0, _080396E8 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _080396E0
	adds r0, r1, #0
	bl GetUnit
	adds r2, r0, #0
	movs r0, #2
	ldrb r3, [r2, #0xa]
	orrs r0, r3
	strb r0, [r2, #0xa]
_080396E0:
	movs r0, #1
	b _080396F2
	.align 2, 0
_080396E4: .4byte 0x0202E3DC
_080396E8: .4byte 0x0202BD48
_080396EC: .4byte 0x0202E3E4
_080396F0:
	movs r0, #0
_080396F2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
