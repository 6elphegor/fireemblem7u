	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitGetDeathDropLocation
UnitGetDeathDropLocation: @ 0x08017F6C
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
	bl GenerateExtendedMovementMap
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
