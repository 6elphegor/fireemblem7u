	.include "macro.inc"

	.syntax unified

	thumb_func_start FillWarpRangeMap
FillWarpRangeMap: @ 0x0801DBC4
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
	bl BmMapFillg
	ldr r0, _0801DC94 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r6]
	bl SetWorkingBmMap
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
	bl MapAddInBoundedRange
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
	bl CanUnitCrossTerrain
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
	bl CanUnitCrossTerrain
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
