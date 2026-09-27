	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveNumberOfAlliedUnitsIn0To8Range
SaveNumberOfAlliedUnitsIn0To8Range: @ 0x080372AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r0, _08037344 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #1
	movs r3, #8
	bl MapAddInBoundedRange
	ldr r0, _08037348 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08037332
_080372DE:
	ldr r0, _08037348 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803732C
	lsls r5, r1, #2
_080372EE:
	ldr r0, _08037344 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08037326
	ldr r0, _0803734C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08037326
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037326
	movs r0, #1
	add r8, r0
_08037326:
	subs r4, #1
	cmp r4, #0
	bge _080372EE
_0803732C:
	adds r1, r7, #0
	cmp r1, #0
	bge _080372DE
_08037332:
	adds r0, r6, #0
	adds r0, #0x46
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037344: .4byte 0x0202E3E4
_08037348: .4byte 0x0202E3D8
_0803734C: .4byte 0x0202E3DC
