	.include "macro.inc"

	.syntax unified

	thumb_func_start GetRescueStaffTargetPosition
GetRescueStaffTargetPosition: @ 0x0802C42C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	str r1, [sp]
	mov sb, r2
	mov sl, r3
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2]
	str r0, [r3]
	ldr r0, _0802C4F0 @ =0x0000270F
	str r0, [sp, #4]
	adds r0, r7, #0
	bl MapFloodUnitExtended
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802C4F4 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802C4F8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802C528
_0802C476:
	ldr r0, _0802C4F8 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802C522
	lsls r6, r5, #2
_0802C488:
	ldr r0, _0802C4FC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802C51C
	ldr r0, _0802C4F4 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C51C
	ldr r0, _0802C500 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802C51C
	ldr r0, _0802C504 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C51C
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802C4E0
	subs r2, r0, r4
_0802C4E0:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r1, r5, r0
	cmp r1, #0
	blt _0802C508
	adds r0, r2, r1
	b _0802C50C
	.align 2, 0
_0802C4F0: .4byte 0x0000270F
_0802C4F4: .4byte 0x0202E3DC
_0802C4F8: .4byte 0x0202E3D8
_0802C4FC: .4byte 0x0202E3E4
_0802C500: .4byte 0x0202E3F0
_0802C504: .4byte 0x0202E3E0
_0802C508:
	subs r0, r0, r5
	adds r0, r2, r0
_0802C50C:
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802C51C
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802C51C:
	subs r4, #1
	cmp r4, #0
	bge _0802C488
_0802C522:
	mov r5, r8
	cmp r5, #0
	bge _0802C476
_0802C528:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802C538
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802C626
_0802C538:
	ldr r0, _0802C638 @ =0x0000270F
	str r0, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	ldr r2, _0802C63C @ =0x08BE3C16
	bl GenerateExtendedMovementMap
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802C640 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802C644 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802C602
_0802C56E:
	ldr r0, _0802C644 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802C5FC
	lsls r6, r5, #2
_0802C580:
	ldr r0, _0802C648 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802C5F6
	ldr r0, _0802C640 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C5F6
	ldr r0, _0802C64C @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802C5F6
	ldr r0, _0802C650 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C5F6
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802C5D8
	subs r2, r0, r4
_0802C5D8:
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	subs r0, r5, r1
	cmp r0, #0
	bge _0802C5E4
	subs r0, r1, r5
_0802C5E4:
	adds r0, r2, r0
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802C5F6
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802C5F6:
	subs r4, #1
	cmp r4, #0
	bge _0802C580
_0802C5FC:
	mov r5, r8
	cmp r5, #0
	bge _0802C56E
_0802C602:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802C612
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802C626
_0802C612:
	ldr r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	mov r1, sb
	str r0, [r1]
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	mov r1, sl
	str r0, [r1]
_0802C626:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C638: .4byte 0x0000270F
_0802C63C: .4byte 0x08BE3C16
_0802C640: .4byte 0x0202E3DC
_0802C644: .4byte 0x0202E3D8
_0802C648: .4byte 0x0202E3E4
_0802C64C: .4byte 0x0202E3F0
_0802C650: .4byte 0x0202E3E0
