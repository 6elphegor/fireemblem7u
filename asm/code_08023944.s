	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023944
sub_08023944: @ 0x08023944
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _080239A4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0802399C
_08023954:
	ldr r0, _080239A4 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023996
	lsls r5, r1, #2
_08023964:
	ldr r0, _080239A8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023990
	ldr r0, _080239AC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08023990
	bl GetUnit
	bl sub_080BFC68
_08023990:
	subs r4, #1
	cmp r4, #0
	bge _08023964
_08023996:
	adds r1, r6, #0
	cmp r1, #0
	bge _08023954
_0802399C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080239A4: .4byte 0x0202E3D8
_080239A8: .4byte 0x0202E3E4
_080239AC: .4byte 0x0202E3DC

	thumb_func_start ForEachUnitInRange
ForEachUnitInRange: @ 0x080239B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023A10 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08023A08
_080239C0:
	ldr r0, _08023A10 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023A02
	lsls r5, r1, #2
_080239D0:
	ldr r0, _08023A14 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080239FC
	ldr r0, _08023A18 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080239FC
	bl GetUnit
	bl sub_080BFC68
_080239FC:
	subs r4, #1
	cmp r4, #0
	bge _080239D0
_08023A02:
	adds r1, r6, #0
	cmp r1, #0
	bge _080239C0
_08023A08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023A10: .4byte 0x0202E3D8
_08023A14: .4byte 0x0202E3E8
_08023A18: .4byte 0x0202E3DC

	thumb_func_start ForEachPosInRange
ForEachPosInRange: @ 0x08023A1C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023A6C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08023A64
_08023A2C:
	ldr r0, _08023A6C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08023A5E
_08023A3A:
	ldr r0, _08023A70 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023A58
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080BFC68
_08023A58:
	subs r4, #1
	cmp r4, #0
	bge _08023A3A
_08023A5E:
	adds r5, r6, #0
	cmp r5, #0
	bge _08023A2C
_08023A64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023A6C: .4byte 0x0202E3D8
_08023A70: .4byte 0x0202E3E8

	thumb_func_start ForEachAdjacentUnit
ForEachAdjacentUnit: @ 0x08023A74
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ForEachAdjacentPosition
ForEachAdjacentPosition: @ 0x08023AA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachPosInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ForEachPosIn12Range
ForEachPosIn12Range: @ 0x08023ADC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachPosInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ForEachUnitInMagBy2Range
ForEachUnitInMagBy2Range: @ 0x08023B10
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _08023B5C @ =0x02033E40
	ldr r0, [r6]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl BeginTargetList
	ldr r0, [r6]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	mov r0, r8
	bl ForEachUnitInRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023B5C: .4byte 0x02033E40

	thumb_func_start TryAddTrapsToTargetList
TryAddTrapsToTargetList: @ 0x08023B60
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08023C12
	ldr r6, _08023C18 @ =0x0202E3E0
	ldr r5, _08023C1C @ =0x0202E3E8
_08023B74:
	cmp r0, #2
	bne _08023C0A
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08023BA8
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023BA8
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023BA8:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08023BDA
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023BDA
	adds r1, #1
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023BDA:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08023C0A
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023C0A
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023C0A:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08023B74
_08023C12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023C18: .4byte 0x0202E3E0
_08023C1C: .4byte 0x0202E3E8

	thumb_func_start AddUnitToTargetListIfNotAllied
AddUnitToTargetListIfNotAllied: @ 0x08023C20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08023C54 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023C4E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023C4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023C54: .4byte 0x02033E40

	thumb_func_start ListAttackTargetsForWeapon
ListAttackTargetsForWeapon: @ 0x08023C58
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08023CB4 @ =0x02033E40
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08023CB8 @ =0x0202E3E8
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
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _08023CBC @ =AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023CB4: .4byte 0x02033E40
_08023CB8: .4byte 0x0202E3E8
_08023CBC: .4byte AddUnitToTargetListIfNotAllied

	thumb_func_start TryAddUnitToTradeTargetList
TryAddUnitToTradeTargetList: @ 0x08023CC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08023D60 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023D5A
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08023D1E
	ldr r0, [r5]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08023CF8
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08023D1E
_08023CF8:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023D1E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023D1E:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023D5A
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _08023D5A
	ldr r0, _08023D60 @ =0x02033E40
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08023D4C
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq _08023D5A
_08023D4C:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0
	bl EnlistTarget
_08023D5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023D60: .4byte 0x02033E40

	thumb_func_start MakeTradeTargetList
MakeTradeTargetList: @ 0x08023D64
	push {r4, r5, r6, r7, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r6, _08023DCC @ =0x02033E40
	str r0, [r6]
	ldr r0, _08023DD0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r7, _08023DD4 @ =TryAddUnitToTradeTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ForEachAdjacentUnit
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023DC6
	bl CountTargets
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	bl sub_080BFC68
	bl CountTargets
	cmp r4, r0
	beq _08023DC6
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x11]
	strb r1, [r0, #1]
_08023DC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023DCC: .4byte 0x02033E40
_08023DD0: .4byte 0x0202E3E8
_08023DD4: .4byte TryAddUnitToTradeTargetList

	thumb_func_start TryAddUnitToRescueTargetList
TryAddUnitToRescueTargetList: @ 0x08023DD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08023E34 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023E2C
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08023E2C
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08023E2C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023E2C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023E2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023E34: .4byte 0x02033E40

	thumb_func_start MakeRescueTargetList
MakeRescueTargetList: @ 0x08023E38
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08023E60 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08023E64 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08023E68 @ =TryAddUnitToRescueTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023E60: .4byte 0x02033E40
_08023E64: .4byte 0x0202E3E8
_08023E68: .4byte TryAddUnitToRescueTargetList

	thumb_func_start TryAddToDropTargetList
TryAddToDropTargetList: @ 0x08023E6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08023EB8 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08023EB0
	ldr r0, _08023EBC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	ldr r1, _08023EC0 @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023EB0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08023EB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023EB8: .4byte 0x0202E3DC
_08023EBC: .4byte 0x02033E40
_08023EC0: .4byte 0x0202E3E0

	thumb_func_start MakeDropTargetList
MakeDropTargetList: @ 0x08023EC4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08023EEC @ =0x02033E40
	str r0, [r1]
	ldr r0, _08023EF0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08023EF4 @ =TryAddToDropTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023EEC: .4byte 0x02033E40
_08023EF0: .4byte 0x0202E3E8
_08023EF4: .4byte TryAddToDropTargetList

	thumb_func_start TryAddRescuedUnitToTakeTargetList
TryAddRescuedUnitToTakeTargetList: @ 0x08023EF8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08023F60 @ =0x02033E40
	ldr r0, [r4]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023F5A
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023F5A
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023F5A
	ldr r4, [r4]
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023F5A
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08023F5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023F60: .4byte 0x02033E40

	thumb_func_start sub_08023F64
sub_08023F64: @ 0x08023F64
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08023F8C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08023F90 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08023F94 @ =TryAddRescuedUnitToTakeTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023F8C: .4byte 0x02033E40
_08023F90: .4byte 0x0202E3E8
_08023F94: .4byte TryAddRescuedUnitToTakeTargetList

	thumb_func_start sub_08023F98
sub_08023F98: @ 0x08023F98
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08024014 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802400C
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802400C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0802400C
	cmp r1, #2
	beq _0802400C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802400C
	ldr r0, [r5]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802400C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802400C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024014: .4byte 0x02033E40

	thumb_func_start sub_08024018
sub_08024018: @ 0x08024018
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024040 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024044 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024048 @ =sub_08023F98
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024040: .4byte 0x02033E40
_08024044: .4byte 0x0202E3E8
_08024048: .4byte sub_08023F98

	thumb_func_start sub_0802404C
sub_0802404C: @ 0x0802404C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0802408A
	cmp r1, #2
	beq _0802408A
	ldr r0, _08024090 @ =0x02033E40
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_080789FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802408A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	ldr r3, [r4]
	ldrb r3, [r3, #4]
	bl EnlistTarget
_0802408A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024090: .4byte 0x02033E40

	thumb_func_start sub_08024094
sub_08024094: @ 0x08024094
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080240BC @ =0x02033E40
	str r0, [r1]
	ldr r0, _080240C0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080240C4 @ =sub_0802404C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080240BC: .4byte 0x02033E40
_080240C0: .4byte 0x0202E3E8
_080240C4: .4byte sub_0802404C

	thumb_func_start sub_080240C8
sub_080240C8: @ 0x080240C8
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802416C @ =0x02033E40
	str r0, [r4]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl BeginTargetList
	ldr r0, [r4]
	bl GetUnitSupporterCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _08024166
	adds r7, r4, #0
_080240EC:
	ldr r0, [r7]
	adds r1, r5, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08024160
	ldr r3, [r7]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802410C
	subs r1, r0, r2
_0802410C:
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802411E
	subs r0, r2, r3
_0802411E:
	adds r0, r1, r0
	cmp r0, #1
	bne _08024160
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024160
	ldr r0, [r4, #0xc]
	ldr r1, _08024170 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08024160
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08024160
	cmp r1, #2
	beq _08024160
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	adds r3, r5, #0
	bl EnlistTarget
_08024160:
	adds r5, #1
	cmp r5, r6
	blt _080240EC
_08024166:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802416C: .4byte 0x02033E40
_08024170: .4byte 0x0001002C

	thumb_func_start AddUnitToTargetListIfAllied
AddUnitToTargetListIfAllied: @ 0x08024174
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080241A8 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080241A2
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #1
	bl EnlistTarget
_080241A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080241A8: .4byte 0x02033E40

	thumb_func_start FillBallistaRangeMaybe
FillBallistaRangeMaybe: @ 0x080241AC
	push {r4, r5, r6, r7, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _0802420C @ =0x02033E40
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetSomeBallistaItemAt
	adds r7, r0, #0
	cmp r7, #0
	beq _08024206
	ldr r0, _08024210 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _08024214 @ =AddUnitToTargetListIfAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
_08024206:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802420C: .4byte 0x02033E40
_08024210: .4byte 0x0202E3E8
_08024214: .4byte AddUnitToTargetListIfAllied

	thumb_func_start TryAddClosedDoorToTargetList
TryAddClosedDoorToTargetList: @ 0x08024218
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024254 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0802424E
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_08078F24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802424E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x1e
	movs r3, #0
	bl EnlistTarget
_0802424E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024254: .4byte 0x0202E3E0

	thumb_func_start TryAddBridgeToTargetList
TryAddBridgeToTargetList: @ 0x08024258
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024294 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0802428E
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_08078F24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802428E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #0
	bl EnlistTarget
_0802428E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024294: .4byte 0x0202E3E0

	thumb_func_start MakeTargetListForDoorAndBridges
MakeTargetListForDoorAndBridges: @ 0x08024298
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _080242C8 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080242CC @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #0x14
	beq _080242D4
	cmp r4, #0x1e
	bne _080242DE
	ldr r2, _080242D0 @ =TryAddClosedDoorToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
	b _080242DE
	.align 2, 0
_080242C8: .4byte 0x02033E40
_080242CC: .4byte 0x0202E3E8
_080242D0: .4byte TryAddClosedDoorToTargetList
_080242D4:
	ldr r2, _080242E4 @ =TryAddBridgeToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
_080242DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080242E4: .4byte TryAddBridgeToTargetList

	thumb_func_start sub_080242E8
sub_080242E8: @ 0x080242E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _080243A0
_080242FC:
	adds r0, r7, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _080243A0
	ldr r0, [r5]
	cmp r0, #0
	beq _080243A0
	ldr r0, [r5, #0xc]
	ldr r1, _080243B4 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080243A0
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, _080243B8 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetTerrainHealAmount
	cmp r0, #0
	beq _08024372
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08024372
	adds r0, r6, #0
	bl GetTerrainHealAmount
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	bl EnlistTarget
_08024372:
	adds r0, r6, #0
	bl GetTerrainHealsStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080243A0
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080243A0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #1
	rsbs r3, r3, #0
	bl EnlistTarget
_080243A0:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080242FC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080243B4: .4byte 0x0001002C
_080243B8: .4byte 0x0202E3E0

	thumb_func_start MakePoisonDamageTargetList
MakePoisonDamageTargetList: @ 0x080243BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _0802441A
_080243D0:
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802441A
	ldr r0, [r2]
	cmp r0, #0
	beq _0802441A
	ldr r0, [r2, #0xc]
	ldr r1, _08024430 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _0802441A
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _0802441A
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	movs r6, #0xb
	ldrsb r6, [r2, r6]
	movs r0, #3
	bl RandNext
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnlistTarget
_0802441A:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080243D0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024430: .4byte 0x0001002C

	thumb_func_start TryAddUnitToRefreshTargetList
TryAddUnitToRefreshTargetList: @ 0x08024434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024474 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802446C
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802446C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802446C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024474: .4byte 0x02033E40

	thumb_func_start MakeTargetListForRefresh
MakeTargetListForRefresh: @ 0x08024478
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080244A0 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080244A4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080244A8 @ =TryAddUnitToRefreshTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080244A0: .4byte 0x02033E40
_080244A4: .4byte 0x0202E3E8
_080244A8: .4byte TryAddUnitToRefreshTargetList

	thumb_func_start AddAsTarget_IfCanStealFrom
AddAsTarget_IfCanStealFrom: @ 0x080244AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _080244FC
	ldr r0, _080244F0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	blt _080244FC
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x1e
_080244D0:
	ldrh r0, [r4]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080244F4
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
	b _080244FC
	.align 2, 0
_080244F0: .4byte 0x03004690
_080244F4:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _080244D0
_080244FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MakeTargetListForSteal
MakeTargetListForSteal: @ 0x08024504
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _0802452C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024530 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024534 @ =AddAsTarget_IfCanStealFrom
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802452C: .4byte 0x02033E40
_08024530: .4byte 0x0202E3E8
_08024534: .4byte AddAsTarget_IfCanStealFrom

	thumb_func_start TryAddUnitToHealTargetList
TryAddUnitToHealTargetList: @ 0x08024538
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08024588 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024582
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024582
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08024582
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024582:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024588: .4byte 0x02033E40

	thumb_func_start sub_0802458C
sub_0802458C: @ 0x0802458C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080245B4 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080245B8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080245BC @ =TryAddUnitToHealTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080245B4: .4byte 0x02033E40
_080245B8: .4byte 0x0202E3E8
_080245BC: .4byte TryAddUnitToHealTargetList

	thumb_func_start MakeTargetListForRangedHeal
MakeTargetListForRangedHeal: @ 0x080245C0
	push {r4, r5, r6, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r4, _08024600 @ =0x02033E40
	str r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08024604 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	ldr r0, _08024608 @ =TryAddUnitToHealTargetList
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024600: .4byte 0x02033E40
_08024604: .4byte 0x0202E3E8
_08024608: .4byte TryAddUnitToHealTargetList

	thumb_func_start sub_0802460C
sub_0802460C: @ 0x0802460C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024658 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024652
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024652
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024652
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024658: .4byte 0x02033E40

	thumb_func_start sub_0802465C
sub_0802465C: @ 0x0802465C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024684 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024688 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _0802468C @ =sub_0802460C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024684: .4byte 0x02033E40
_08024688: .4byte 0x0202E3E8
_0802468C: .4byte sub_0802460C

	thumb_func_start TryAddUnitToBarrierTargetList
TryAddUnitToBarrierTargetList: @ 0x08024690
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080246DC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080246D4
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080246D4
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #6
	bhi _080246D4
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080246D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080246DC: .4byte 0x02033E40

	thumb_func_start sub_080246E0
sub_080246E0: @ 0x080246E0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024708 @ =0x02033E40
	str r0, [r1]
	ldr r0, _0802470C @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024710 @ =TryAddUnitToBarrierTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024708: .4byte 0x02033E40
_0802470C: .4byte 0x0202E3E8
_08024710: .4byte TryAddUnitToBarrierTargetList

	thumb_func_start sub_08024714
sub_08024714: @ 0x08024714
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024748 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024742
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024748: .4byte 0x02033E40

	thumb_func_start sub_0802474C
sub_0802474C: @ 0x0802474C
	push {lr}
	ldr r1, _08024768 @ =0x02033E40
	str r0, [r1]
	ldr r0, _0802476C @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08024770 @ =sub_08024714
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_08024768: .4byte 0x02033E40
_0802476C: .4byte 0x0202E3E8
_08024770: .4byte sub_08024714

	thumb_func_start sub_08024774
sub_08024774: @ 0x08024774
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080247BC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080247B4
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080247A2
	cmp r1, #3
	bne _080247B4
_080247A2:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080247B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080247BC: .4byte 0x02033E40

	thumb_func_start sub_080247C0
sub_080247C0: @ 0x080247C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024808 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024800
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080247EE
	cmp r1, #2
	bne _08024800
_080247EE:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024808: .4byte 0x02033E40

	thumb_func_start sub_0802480C
sub_0802480C: @ 0x0802480C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024854 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802484C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0802483A
	cmp r1, #4
	bne _0802484C
_0802483A:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802484C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024854: .4byte 0x02033E40

	thumb_func_start sub_08024858
sub_08024858: @ 0x08024858
	push {lr}
	ldr r1, _08024874 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024878 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0802487C @ =sub_08024774
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_08024874: .4byte 0x02033E40
_08024878: .4byte 0x0202E3E8
_0802487C: .4byte sub_08024774

	thumb_func_start sub_08024880
sub_08024880: @ 0x08024880
	push {lr}
	ldr r1, _0802489C @ =0x02033E40
	str r0, [r1]
	ldr r0, _080248A0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080248A4 @ =sub_080247C0
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_0802489C: .4byte 0x02033E40
_080248A0: .4byte 0x0202E3E8
_080248A4: .4byte sub_080247C0

	thumb_func_start sub_080248A8
sub_080248A8: @ 0x080248A8
	push {lr}
	ldr r1, _080248C4 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080248C8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080248CC @ =sub_0802480C
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_080248C4: .4byte 0x02033E40
_080248C8: .4byte 0x0202E3E8
_080248CC: .4byte sub_0802480C

	thumb_func_start sub_080248D0
sub_080248D0: @ 0x080248D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024904 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080248FE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080248FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024904: .4byte 0x02033E40

	thumb_func_start sub_08024908
sub_08024908: @ 0x08024908
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024930 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024934 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024938 @ =sub_080248D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024930: .4byte 0x02033E40
_08024934: .4byte 0x0202E3E8
_08024938: .4byte sub_080248D0

	thumb_func_start sub_0802493C
sub_0802493C: @ 0x0802493C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024964 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024968 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _0802496C @ =TryAddClosedDoorToTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachPosIn12Range
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024964: .4byte 0x02033E40
_08024968: .4byte 0x0202E3E8
_0802496C: .4byte TryAddClosedDoorToTargetList

	thumb_func_start TryAddUnitToHammerneTargetList
TryAddUnitToHammerneTargetList: @ 0x08024970
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08024990 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080249C0
	movs r5, #0
	b _08024996
	.align 2, 0
_08024990: .4byte 0x02033E40
_08024994:
	adds r5, #1
_08024996:
	cmp r5, #4
	bgt _080249C0
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl IsItemRepairable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024994
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080249C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080249C8
sub_080249C8: @ 0x080249C8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080249F0 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080249F4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080249F8 @ =TryAddUnitToHammerneTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080249F0: .4byte 0x02033E40
_080249F4: .4byte 0x0202E3E8
_080249F8: .4byte TryAddUnitToHammerneTargetList

	thumb_func_start sub_080249FC
sub_080249FC: @ 0x080249FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl BeginTargetList
	bl GetActiveFactionAlliance
	adds r7, r0, #0
	adds r6, r7, #1
	b _08024A74
_08024A1E:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08024A70
	ldr r0, [r5]
	cmp r0, #0
	beq _08024A70
	ldr r0, [r5, #0xc]
	ldr r1, _08024A84 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08024A70
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	bne _08024A5A
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024A70
_08024A5A:
	cmp r5, r8
	beq _08024A70
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024A70:
	adds r6, #1
	adds r0, r7, #0
_08024A74:
	adds r0, #0x80
	cmp r6, r0
	blt _08024A1E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024A84: .4byte 0x0001000C

	thumb_func_start sub_08024A88
sub_08024A88: @ 0x08024A88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	bl CountTargets
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08024AD4
_08024A9C:
	adds r0, r6, #0
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r0, r1
	bgt _08024ACE
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	movs r1, #0
	mov r2, r8
	bl PidStatsRecordDefeatInfo
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl PidStatsRecordLoseData
_08024ACE:
	adds r6, #1
	cmp r6, r7
	blt _08024A9C
_08024AD4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TryAddToMineTargetList
TryAddToMineTargetList: @ 0x08024AE0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024B50 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024B48
	ldr r0, _08024B54 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08024B10
	ldr r0, _08024B58 @ =0x0202E3EC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024B48
_08024B10:
	ldr r0, _08024B5C @ =0x02033E40
	ldr r0, [r0]
	ldr r1, _08024B60 @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024B48
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	cmp r0, #0
	beq _08024B3C
	ldrb r0, [r0, #2]
	cmp r0, #0xa
	bne _08024B48
_08024B3C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08024B48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B50: .4byte 0x0202E3DC
_08024B54: .4byte 0x0202BBF8
_08024B58: .4byte 0x0202E3EC
_08024B5C: .4byte 0x02033E40
_08024B60: .4byte 0x0202E3E0

	thumb_func_start MakeTargetListForDanceRing
MakeTargetListForDanceRing: @ 0x08024B64
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024B8C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024B90 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024B94 @ =TryAddToMineTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B8C: .4byte 0x02033E40
_08024B90: .4byte 0x0202E3E8
_08024B94: .4byte TryAddToMineTargetList

	thumb_func_start sub_08024B98
sub_08024B98: @ 0x08024B98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024BE4 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r6, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024BDE
	adds r0, r4, #0
	bl GetTrapAt
	cmp r0, #0
	bne _08024BDE
	ldr r1, _08024BE8 @ =0x08BE3C16
	ldr r0, _08024BEC @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r1, r0, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08024BDE
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08024BDE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024BE4: .4byte 0x0202E3DC
_08024BE8: .4byte 0x08BE3C16
_08024BEC: .4byte 0x0202E3E0

	thumb_func_start MakeTargetListForMine
MakeTargetListForMine: @ 0x08024BF0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024C18 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024C1C @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024C20 @ =sub_08024B98
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024C18: .4byte 0x02033E40
_08024C1C: .4byte 0x0202E3E8
_08024C20: .4byte sub_08024B98

	thumb_func_start sub_08024C24
sub_08024C24: @ 0x08024C24
	push {lr}
	adds r3, r0, #0
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _08024C50
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08024C50
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	movs r3, #0
	bl EnlistTarget
_08024C50:
	pop {r0}
	bx r0

	thumb_func_start sub_08024C54
sub_08024C54: @ 0x08024C54
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024C7C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024C80 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024C84 @ =sub_08024C24
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024C7C: .4byte 0x02033E40
_08024C80: .4byte 0x0202E3E8
_08024C84: .4byte sub_08024C24

	thumb_func_start sub_08024C88
sub_08024C88: @ 0x08024C88
	ldr r1, _08024C94 @ =0x0203A3D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08024C94: .4byte 0x0203A3D0

	thumb_func_start ApplyUnitSpritePalettes
ApplyUnitSpritePalettes: @ 0x08024C98
	push {lr}
	ldr r0, _08024CC0 @ =0x08194594
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r1, _08024CC4 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08024CCC
	ldr r0, _08024CC8 @ =0x08194614
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08024CD8
	.align 2, 0
_08024CC0: .4byte 0x08194594
_08024CC4: .4byte 0x0202BBB8
_08024CC8: .4byte 0x08194614
_08024CCC:
	ldr r0, _08024CDC @ =0x08194634
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
_08024CD8:
	pop {r0}
	bx r0
	.align 2, 0
_08024CDC: .4byte 0x08194634

	thumb_func_start sub_08024CE0
sub_08024CE0: @ 0x08024CE0
	push {lr}
	ldr r0, _08024CF4 @ =0x08194654
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08024CF4: .4byte 0x08194654

	thumb_func_start ResetUnitSprites
ResetUnitSprites: @ 0x08024CF8
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _08024D20 @ =0x02039F18
	ldr r6, _08024D24 @ =0x02039F14
	ldr r4, _08024D28 @ =0x02033E44
	movs r3, #0xff
_08024D04:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08024D04
	movs r0, #0
	str r0, [r5]
	movs r0, #0x3f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024D20: .4byte 0x02039F18
_08024D24: .4byte 0x02039F14
_08024D28: .4byte 0x02033E44

	thumb_func_start ResetUnitSpritesB
ResetUnitSpritesB: @ 0x08024D2C
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _08024D54 @ =0x02039F18
	ldr r6, _08024D58 @ =0x02039F14
	ldr r4, _08024D5C @ =0x02033E44
	movs r3, #0xff
_08024D38:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08024D38
	movs r0, #0
	str r0, [r5]
	movs r0, #0x5f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024D54: .4byte 0x02039F18
_08024D58: .4byte 0x02039F14
_08024D5C: .4byte 0x02033E44

	thumb_func_start StartUiSMS
StartUiSMS: @ 0x08024D60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r1, _08024D9C @ =0x08B93E48
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r5, _08024DA0 @ =0x08C99700
	movs r4, #0x7f
	ands r4, r7
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08024DA4 @ =0x08B93E44
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08024DB8
	cmp r0, #1
	bgt _08024DA8
	cmp r0, #0
	beq _08024DAE
	b _08024DD6
	.align 2, 0
_08024D9C: .4byte 0x08B93E48
_08024DA0: .4byte 0x08C99700
_08024DA4: .4byte 0x08B93E44
_08024DA8:
	cmp r0, #2
	beq _08024DC2
	b _08024DD6
_08024DAE:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08024F4C
	b _08024DCA
_08024DB8:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage16x32
	b _08024DCA
_08024DC2:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage32x32
_08024DCA:
	ldr r2, _08024DE8 @ =0x02033E44
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_08024DD6:
	ldr r0, _08024DE8 @ =0x02033E44
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024DE8: .4byte 0x02033E44

	thumb_func_start UseUnitSprite
UseUnitSprite: @ 0x08024DEC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08024E24 @ =0x02033E44
	adds r7, r6, r0
	ldrb r1, [r7]
	cmp r1, #0xff
	bne _08024EA0
	ldr r5, _08024E28 @ =0x08C99700
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08024E2C @ =0x08B93E44
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08024E54
	cmp r0, #1
	bgt _08024E30
	cmp r0, #0
	beq _08024E36
	b _08024E96
	.align 2, 0
_08024E24: .4byte 0x02033E44
_08024E28: .4byte 0x08C99700
_08024E2C: .4byte 0x08B93E44
_08024E30:
	cmp r0, #2
	beq _08024E70
	b _08024E96
_08024E36:
	ldr r4, _08024E50 @ =0x02039F14
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08024EB8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	subs r0, #1
	b _08024E94
	.align 2, 0
_08024E50: .4byte 0x02039F14
_08024E54:
	ldr r4, _08024E6C @ =0x02039F18
	ldr r0, [r4]
	adds r1, r6, #0
	bl ApplyUnitSpriteImage16x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #2
	b _08024E94
	.align 2, 0
_08024E6C: .4byte 0x02039F18
_08024E70:
	ldr r4, _08024EAC @ =0x02039F18
	ldr r1, [r4]
	movs r0, #0x1e
	ands r0, r1
	cmp r0, #0x1e
	bne _08024E80
	adds r0, r1, #2
	str r0, [r4]
_08024E80:
	ldr r0, [r4]
	adds r1, r6, #0
	bl ApplyUnitSpriteImage32x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #4
_08024E94:
	str r0, [r4]
_08024E96:
	ldr r1, _08024EB0 @ =0x0203A3D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08024EB4 @ =0x02033E44
_08024EA0:
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024EAC: .4byte 0x02039F18
_08024EB0: .4byte 0x0203A3D0
_08024EB4: .4byte 0x02033E44

	thumb_func_start sub_08024EB8
sub_08024EB8: @ 0x08024EB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08024F40 @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	mov sb, r0
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r6, #0
	ldr r0, _08024F44 @ =0x08B93E44
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #3
	add r0, sb
	ldr r2, _08024F48 @ =0x02033F14
	adds r4, r0, r2
	movs r3, #0x40
	mov r8, r3
	movs r7, #0
	lsls r5, r1, #7
_08024EF2:
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	lsls r1, r6, #0xd
	ldr r2, _08024F48 @ =0x02033F14
	add r2, sb
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuFastSet
	mov r2, sl
	ldr r0, [r2]
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r4, r4, r3
	add r8, r5
	adds r7, r7, r5
	adds r6, #1
	cmp r6, #2
	ble _08024EF2
	ldr r0, _08024F40 @ =0x08B93E58
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024F40: .4byte 0x08B93E58
_08024F44: .4byte 0x08B93E44
_08024F48: .4byte 0x02033F14

	thumb_func_start sub_08024F4C
sub_08024F4C: @ 0x08024F4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	mov sb, r1
	ldr r1, _08025018 @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r5, r0, #5
	mov r1, sb
	lsrs r0, r1, #7
	movs r2, #1
	mov sb, r2
	mov r1, sb
	bics r1, r0
	mov sb, r1
	movs r7, #0
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0xc]
	ldr r0, _0802501C @ =0x02033F14
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r5, r1
	mov r2, r8
	adds r6, r0, r2
	movs r0, #0x40
	str r0, [sp, #0x10]
	movs r1, #0
	mov sl, r1
_08024F92:
	movs r2, #0
	str r2, [sp]
	lsls r4, r7, #0xd
	mov r0, r8
	adds r1, r5, r0
	adds r1, r4, r1
	mov r0, sp
	ldr r2, _08025020 @ =0x01000010
	bl CpuFastSet
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	adds r1, r4, r1
	adds r1, r1, r5
	ldr r0, [sp, #0xc]
	ldr r2, _08025020 @ =0x01000010
	bl CpuFastSet
	ldr r2, _08025024 @ =0x08B93E44
	ldr r0, [r2]
	add r0, sl
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	adds r4, r4, r1
	adds r4, r4, r5
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _08025024 @ =0x08B93E44
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	add sl, r0
	adds r7, #1
	cmp r7, #2
	ble _08024F92
	ldr r0, _08025018 @ =0x08B93E58
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08025018: .4byte 0x08B93E58
_0802501C: .4byte 0x02033F14
_08025020: .4byte 0x01000010
_08025024: .4byte 0x08B93E44

	thumb_func_start ApplyUnitSpriteImage16x32
ApplyUnitSpriteImage16x32: @ 0x08025028
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _0802510C @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov sb, r0
	ldr r2, _08025110 @ =0x08B93E44
	mov r8, r2
	ldr r3, _08025114 @ =0x02033F14
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	str r3, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r2, #0x40
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #8
_0802506E:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, sb
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x10
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x10
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #2
	ble _0802506E
	ldr r0, _0802510C @ =0x08B93E58
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802510C: .4byte 0x08B93E58
_08025110: .4byte 0x08B93E44
_08025114: .4byte 0x02033F14

	thumb_func_start ApplyUnitSpriteImage32x32
ApplyUnitSpriteImage32x32: @ 0x08025118
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08025200 @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov sb, r0
	ldr r2, _08025204 @ =0x08B93E44
	mov r8, r2
	ldr r3, _08025208 @ =0x02033F14
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	lsls r3, r3, #1
	str r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r2, #0x80
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #9
_08025162:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, sb
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x20
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x20
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #2
	ble _08025162
	ldr r0, _08025200 @ =0x08B93E58
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08025200: .4byte 0x08B93E58
_08025204: .4byte 0x08B93E44
_08025208: .4byte 0x02033F14

	thumb_func_start TornOutUnitSprite
TornOutUnitSprite: @ 0x0802520C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	bl GetUnitSMSId
	str r0, [sp, #4]
	bl UseUnitSprite
	lsls r6, r0, #5
	ldr r1, _08025274 @ =0x08B93F18
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x43
	ble _08025244
	movs r4, #1
_08025244:
	cmp r1, #0x23
	ble _0802524A
	movs r4, #2
_0802524A:
	cmp r1, #0x1f
	ble _08025250
	movs r4, #1
_08025250:
	cmp r1, #0
	blt _08025256
	movs r4, #0
_08025256:
	ldr r1, _08025278 @ =0x08C99700
	movs r0, #0x7f
	ldr r3, [sp, #4]
	ands r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08025304
	cmp r0, #1
	bgt _0802527C
	cmp r0, #0
	beq _08025284
	b _080254DE
	.align 2, 0
_08025274: .4byte 0x08B93F18
_08025278: .4byte 0x08C99700
_0802527C:
	cmp r0, #2
	bne _08025282
	b _080253FC
_08025282:
	b _080254DE
_08025284:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r7, _080252F8 @ =0x02033F14
	mov sb, r7
	lsrs r7, r5, #1
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r4, #0xf
	lsls r4, r0
_0802529A:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r0, r6, r7
	adds r0, r0, r3
	mov r1, sb
	adds r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r7, r1
	adds r0, r6, r0
	adds r0, r0, r3
	mov r3, sb
	adds r1, r0, r3
_080252B8:
	adds r0, r4, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r2, #0x20
	adds r1, #0x20
	adds r5, #1
	cmp r5, #1
	ble _080252B8
	mov r1, r8
	cmp r1, #2
	ble _0802529A
	ldr r7, _080252F8 @ =0x02033F14
	adds r0, r6, r7
	add r0, sl
	ldr r2, _080252FC @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	add r0, sl
	adds r0, r0, r6
	ldr r7, _08025300 @ =0x06011400
	adds r1, r6, r7
	b _080253E0
	.align 2, 0
_080252F8: .4byte 0x02033F14
_080252FC: .4byte 0x06011000
_08025300: .4byte 0x06011400
_08025304:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r2, _080253E8 @ =0x02033F14
	mov sb, r2
	lsrs r3, r5, #1
	str r3, [sp, #8]
	bics r0, r5
	lsls r0, r0, #2
	movs r7, #0xf
	mov ip, r7
	mov r2, ip
	lsls r2, r0
	mov ip, r2
_08025320:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r4, r3, #0
	ldr r3, [sp, #8]
	adds r0, r6, r3
	adds r0, r0, r4
	mov r7, sb
	adds r3, r0, r7
_08025334:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r2, r7
	adds r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #1
	ble _08025334
	mov r1, r8
	cmp r1, #2
	ble _08025320
	ldr r1, _080253E8 @ =0x02033F14
	adds r0, r6, r1
	add r0, sl
	ldr r2, _080253EC @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F0 @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F4 @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F8 @ =0x06011C00
	adds r1, r6, r2
_080253E0:
	movs r2, #0x10
	bl CpuFastSet
	b _080254DE
	.align 2, 0
_080253E8: .4byte 0x02033F14
_080253EC: .4byte 0x06011000
_080253F0: .4byte 0x06011400
_080253F4: .4byte 0x06011800
_080253F8: .4byte 0x06011C00
_080253FC:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r3, _08025500 @ =0x02033F14
	mov sb, r3
	lsrs r7, r5, #1
	str r7, [sp, #8]
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r2, #0xf
	mov ip, r2
	mov r3, ip
	lsls r3, r0
	mov ip, r3
_0802541A:
	movs r5, #0
	adds r7, r1, #1
	mov r8, r7
	lsls r4, r1, #0xd
	ldr r1, [sp, #8]
	adds r0, r6, r1
	adds r0, r0, r4
	mov r2, sb
	adds r3, r0, r2
_0802542C:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r7, [r3]
	ands r0, r7
	strb r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #3
	ble _0802542C
	mov r1, r8
	cmp r1, #2
	ble _0802541A
	ldr r1, _08025500 @ =0x02033F14
	adds r0, r6, r1
	add r0, sl
	ldr r2, _08025504 @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025508 @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _0802550C @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025510 @ =0x06011C00
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
_080254DE:
	ldr r3, [sp]
	cmp r3, #0x3f
	bne _080254EE
	ldr r0, _08025514 @ =0x02033E44
	ldr r7, [sp, #4]
	adds r0, r7, r0
	movs r1, #0xff
	strb r1, [r0]
_080254EE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025500: .4byte 0x02033F14
_08025504: .4byte 0x06011000
_08025508: .4byte 0x06011400
_0802550C: .4byte 0x06011800
_08025510: .4byte 0x06011C00
_08025514: .4byte 0x02033E44

	thumb_func_start SyncUnitSpriteSheet
SyncUnitSpriteSheet: @ 0x08025518
	push {r4, r5, lr}
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r4, r0, #0
	adds r5, r4, #0
	cmp r4, #0
	bne _08025538
	ldr r0, _08025570 @ =0x02033F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025538:
	cmp r4, #0x20
	bne _08025548
	ldr r0, _08025578 @ =0x02035F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025548:
	cmp r4, #0x24
	bne _08025558
	ldr r0, _0802557C @ =0x02037F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025558:
	cmp r5, #0x44
	bne _08025568
	ldr r0, _08025578 @ =0x02035F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025568:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025570: .4byte 0x02033F14
_08025574: .4byte 0x06011000
_08025578: .4byte 0x02035F14
_0802557C: .4byte 0x02037F14

	thumb_func_start ForceSyncUnitSpriteSheet
ForceSyncUnitSpriteSheet: @ 0x08025580
	push {lr}
	ldr r0, _080255A0 @ =0x0203A3D0
	movs r1, #0
	str r1, [r0]
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r0, #0x43
	bgt _080255AC
	cmp r0, #0x23
	ble _080255A8
	ldr r0, _080255A4 @ =0x02037F14
	b _080255AE
	.align 2, 0
_080255A0: .4byte 0x0203A3D0
_080255A4: .4byte 0x02037F14
_080255A8:
	cmp r0, #0x1f
	ble _080255C4
_080255AC:
	ldr r0, _080255BC @ =0x02035F14
_080255AE:
	ldr r1, _080255C0 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
	b _080255D4
	.align 2, 0
_080255BC: .4byte 0x02035F14
_080255C0: .4byte 0x06011000
_080255C4:
	cmp r1, #0
	blt _080255D4
	ldr r0, _080255D8 @ =0x02033F14
	ldr r1, _080255DC @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
_080255D4:
	pop {r0}
	bx r0
	.align 2, 0
_080255D8: .4byte 0x02033F14
_080255DC: .4byte 0x06011000

	thumb_func_start sub_080255E0
sub_080255E0: @ 0x080255E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0
	bne _080255FA
	ldr r2, _08025644 @ =0x02033F14
_080255FA:
	cmp r0, #0x20
	bne _08025600
	ldr r2, _08025648 @ =0x02035F14
_08025600:
	cmp r0, #0x24
	bne _08025606
	ldr r2, _0802564C @ =0x02037F14
_08025606:
	cmp r1, #0x44
	bne _0802560C
	ldr r2, _08025648 @ =0x02035F14
_0802560C:
	cmp r2, #0
	beq _0802563C
	ldr r1, _08025650 @ =0x08B93E48
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_08025624:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _08025624
_0802563C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025644: .4byte 0x02033F14
_08025648: .4byte 0x02035F14
_0802564C: .4byte 0x02037F14
_08025650: .4byte 0x08B93E48

	thumb_func_start SetStandingMuFacing
SetStandingMuFacing: @ 0x08025654
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0x43
	bgt _0802567C
	cmp r0, #0x23
	ble _08025678
	ldr r2, _08025674 @ =0x02037F14
	b _0802568A
	.align 2, 0
_08025674: .4byte 0x02037F14
_08025678:
	cmp r0, #0x1f
	ble _08025684
_0802567C:
	ldr r2, _08025680 @ =0x02035F14
	b _0802568A
	.align 2, 0
_08025680: .4byte 0x02035F14
_08025684:
	cmp r1, #0
	blt _0802568A
	ldr r2, _080256C0 @ =0x02033F14
_0802568A:
	cmp r2, #0
	beq _080256BA
	ldr r1, _080256C4 @ =0x08B93E48
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_080256A2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataMove
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _080256A2
_080256BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080256C0: .4byte 0x02033F14
_080256C4: .4byte 0x08B93E48

	thumb_func_start GetUnitDisplayedSpritePalette
GetUnitDisplayedSpritePalette: @ 0x080256C8
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _080256DC
	movs r0, #0xb
	b _080256EE
_080256DC:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080256EC
	adds r0, r2, #0
	bl GetUnitSpritePalette
	b _080256EE
_080256EC:
	movs r0, #0xf
_080256EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitSpritePalette
GetUnitSpritePalette: @ 0x080256F4
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0x40
	beq _0802571A
	cmp r1, #0x40
	bgt _08025708
	cmp r1, #0
	beq _08025712
	b _08025720
_08025708:
	cmp r1, #0x80
	beq _08025716
	cmp r1, #0xc0
	beq _0802571E
	b _08025720
_08025712:
	movs r0, #0xc
	b _08025720
_08025716:
	movs r0, #0xd
	b _08025720
_0802571A:
	movs r0, #0xe
	b _08025720
_0802571E:
	movs r0, #0xb
_08025720:
	bx lr
	.align 2, 0

	thumb_func_start RefreshUnitSprites
RefreshUnitSprites: @ 0x08025724
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _0802582C @ =0x0203A3CC
	ldr r1, _08025830 @ =0x02039F1C
	mov r2, r8
	str r2, [r1]
	movs r2, #0x80
	lsls r2, r2, #3
	strh r2, [r1, #6]
	adds r1, #0xc
	str r1, [r0]
	movs r7, #1
_08025744:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _080257EE
	ldr r0, [r6]
	cmp r0, #0
	beq _080257EE
	movs r0, #0
	str r0, [r6, #0x3c]
	ldr r0, [r6, #0xc]
	ldr r1, _08025834 @ =0x00000201
	ands r0, r1
	cmp r0, #0
	bne _080257EE
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	ldr r0, _08025838 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080257EE
	lsls r0, r2, #4
	bl AddUnitSprite
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl GetUnitSMSId
	bl UseUnitSprite
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitDisplayedSpritePalette
	adds r4, #0x80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r4, r4, r1
	strh r4, [r5, #8]
	adds r0, r6, #0
	bl GetUnitSMSId
	ldr r2, _0802583C @ =0x08C99700
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #2]
	adds r2, r0, #0
	strb r0, [r5, #0xb]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080257DA
	adds r0, r2, #3
	strb r0, [r5, #0xb]
_080257DA:
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _080257EC
	ldrb r0, [r5, #0xb]
	adds r0, #0x40
	strb r0, [r5, #0xb]
_080257EC:
	str r5, [r6, #0x3c]
_080257EE:
	adds r7, #1
	cmp r7, #0xc5
	ble _08025744
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _080258B8
	ldr r1, _08025840 @ =0xFFFFC080
	adds r6, r1, #0
	ldr r7, _08025844 @ =0x08C99992
	movs r2, #0x28
	adds r2, r2, r7
	mov sb, r2
_0802580E:
	cmp r0, #1
	bne _08025882
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08025882
	ldrb r0, [r4, #3]
	cmp r0, #0x35
	beq _08025852
	cmp r0, #0x35
	bgt _08025848
	cmp r0, #0x34
	beq _0802584E
	b _08025864
	.align 2, 0
_0802582C: .4byte 0x0203A3CC
_08025830: .4byte 0x02039F1C
_08025834: .4byte 0x00000201
_08025838: .4byte 0x0202E3DC
_0802583C: .4byte 0x08C99700
_08025840: .4byte 0xFFFFC080
_08025844: .4byte 0x08C99992
_08025848:
	cmp r0, #0x36
	beq _08025856
	b _08025864
_0802584E:
	movs r0, #0x52
	b _08025858
_08025852:
	movs r0, #0x53
	b _08025858
_08025856:
	movs r0, #0x54
_08025858:
	bl UseUnitSprite
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08025864:
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	mov r2, r8
	strh r2, [r5, #8]
	ldrh r0, [r7]
	strb r0, [r5, #0xb]
_08025882:
	ldrb r0, [r4, #2]
	cmp r0, #0xc
	bne _080258B0
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	movs r0, #0x57
	bl UseUnitSprite
	ldr r2, _080258D0 @ =0xFFFFB080
	adds r0, r0, r2
	strh r0, [r5, #8]
	mov r1, sb
	ldrh r0, [r1]
	strb r0, [r5, #0xb]
_080258B0:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802580E
_080258B8:
	ldr r0, _080258D4 @ =0x0203A3D0
	ldr r0, [r0]
	cmp r0, #0
	beq _080258C4
	bl ForceSyncUnitSpriteSheet
_080258C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080258D0: .4byte 0xFFFFB080
_080258D4: .4byte 0x0203A3D0

	thumb_func_start AddUnitSprite
AddUnitSprite: @ 0x080258D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _080258F4 @ =0x02039F1C
	ldr r3, _080258F8 @ =0x0203A3CC
_080258E0:
	ldr r1, [r2]
	cmp r1, #0
	beq _080258FC
	movs r5, #6
	ldrsh r0, [r1, r5]
	cmp r0, r4
	blt _080258FC
	adds r2, r1, #0
	b _080258E0
	.align 2, 0
_080258F4: .4byte 0x02039F1C
_080258F8: .4byte 0x0203A3CC
_080258FC:
	ldr r0, [r3]
	str r1, [r0]
	str r0, [r2]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r3]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PutUnitSpritesOam
PutUnitSpritesOam: @ 0x08025910
	push {r4, r5, r6, lr}
	ldr r0, _08025984 @ =0x02039F1C
	ldr r6, [r0]
	bl PutUnitSpriteIconsOam
	cmp r6, #0
	bne _08025920
	b _08025A92
_08025920:
	movs r3, #0
	movs r0, #4
	ldrsh r1, [r6, r0]
	ldr r2, _08025988 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r5, #6
	ldrsh r1, [r6, r5]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _08025946
	b _08025A8A
_08025946:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bls _08025950
	b _08025A8A
_08025950:
	movs r0, #0x80
	ldrb r1, [r6, #0xb]
	ands r0, r1
	cmp r0, #0
	beq _0802595C
	b _08025A8A
_0802595C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802596E
	bl GetGameTime
	adds r3, r0, #0
	movs r0, #2
	ands r3, r0
_0802596E:
	movs r0, #0xf
	ldrb r2, [r6, #0xb]
	ands r0, r2
	cmp r0, #5
	bls _0802597A
	b _08025A8A
_0802597A:
	lsls r0, r0, #2
	ldr r1, _0802598C @ =_08025990
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025984: .4byte 0x02039F1C
_08025988: .4byte 0x0202BBB8
_0802598C: .4byte _08025990
_08025990: @ jump table
	.4byte _080259A8 @ case 0
	.4byte _080259D0 @ case 1
	.4byte _080259F4 @ case 2
	.4byte _08025A1C @ case 3
	.4byte _08025A3C @ case 4
	.4byte _08025A64 @ case 5
_080259A8:
	adds r0, r4, r3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r1, _080259C8 @ =0x000001FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080259CC @ =0x08B905B8
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_080259C8: .4byte 0x000001FF
_080259CC: .4byte 0x08B905B8
_080259D0:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080259F0 @ =0x08B905D8
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_080259F0: .4byte 0x08B905D8
_080259F4:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A18 @ =0x08B905C0
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_08025A18: .4byte 0x08B905C0
_08025A1C:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A38 @ =0x08B905B8
	b _08025A52
	.align 2, 0
_08025A38: .4byte 0x08B905B8
_08025A3C:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A60 @ =0x08B905D8
_08025A52:
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
_08025A58:
	adds r3, r4, r5
	bl PutOamHiRam
	b _08025A8A
	.align 2, 0
_08025A60: .4byte 0x08B905D8
_08025A64:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A98 @ =0x08B905C0
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
	adds r3, r4, r5
	bl PutOamHiRam
_08025A8A:
	ldr r6, [r6]
	cmp r6, #0
	beq _08025A92
	b _08025920
_08025A92:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025A98: .4byte 0x08B905C0

	thumb_func_start sub_08025A9C
sub_08025A9C: @ 0x08025A9C
	push {r4, r5, lr}
	ldr r4, _08025B38 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x93
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x94
	ldrb r4, [r0]
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08025AC8
	movs r2, #1
_08025AC8:
	cmp r5, #0xff
	beq _08025B32
	cmp r2, #0
	beq _08025B32
	ldr r0, _08025B3C @ =0x0202E3EC
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025B32
	ldr r0, _08025B40 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _08025B32
	lsls r1, r5, #4
	ldr r2, _08025B44 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	lsls r1, r4, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r2, r1, r0
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025B32
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025B32
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r3, r1
	subs r1, #5
	ands r0, r1
	ldr r3, _08025B48 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025B4C @ =0x08B905B0
	ldr r3, _08025B50 @ =0x00000C51
	bl PutOamHiRam
_08025B32:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025B38: .4byte 0x0202BBF8
_08025B3C: .4byte 0x0202E3EC
_08025B40: .4byte 0x0202E3E0
_08025B44: .4byte 0x0202BBB8
_08025B48: .4byte 0x00000107
_08025B4C: .4byte 0x08B905B0
_08025B50: .4byte 0x00000C51

	thumb_func_start PutUnitSpriteIconsOam
PutUnitSpriteIconsOam: @ 0x08025B54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08025C2C @ =0x081C3CB8
	mov r0, sp
	movs r2, #6
	bl memcpy
	ldr r0, _08025C30 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x92
	ldrb r0, [r0]
	str r0, [sp, #8]
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08025B8C
	movs r2, #1
_08025B8C:
	adds r7, r2, #0
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #0xc
	bl __umodsi3
	str r0, [sp, #0xc]
	bl GetGameTime
	lsrs r0, r0, #4
	movs r1, #7
	bl __umodsi3
	str r0, [sp, #0x10]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #9
	bl __umodsi3
	mov sl, r0
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0x12
	bl __umodsi3
	mov sb, r0
	movs r0, #0x91
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025BD4
	b _08025F62
_08025BD4:
	bl sub_08025A9C
	movs r0, #1
	mov r8, r0
_08025BDC:
	mov r0, r8
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08025BEA
	b _08025F56
_08025BEA:
	ldr r0, [r4]
	cmp r0, #0
	bne _08025BF2
	b _08025F56
_08025BF2:
	ldr r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08025BFE
	b _08025F56
_08025BFE:
	adds r0, r4, #0
	bl GetUnitSpriteHideFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025C0C
	b _08025F56
_08025C0C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	lsls r6, r7, #0x18
	cmp r0, #7
	bls _08025C20
	b _08025DFE
_08025C20:
	lsls r0, r0, #2
	ldr r1, _08025C34 @ =_08025C38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025C2C: .4byte 0x081C3CB8
_08025C30: .4byte 0x0202BBF8
_08025C34: .4byte _08025C38
_08025C38: @ jump table
	.4byte _08025C58 @ case 0
	.4byte _08025D00 @ case 1
	.4byte _08025CAC @ case 2
	.4byte _08025D50 @ case 3
	.4byte _08025DB0 @ case 4
	.4byte _08025DB0 @ case 5
	.4byte _08025DB0 @ case 6
	.4byte _08025DB0 @ case 7
_08025C58:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025CA4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _08025C82
	b _08025DFE
_08025C82:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08025C8C
	b _08025DFE
_08025C8C:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025CA8 @ =0x08B94114
	ldr r5, [sp, #0xc]
	b _08025D94
	.align 2, 0
_08025CA4: .4byte 0x0202BBB8
_08025CA8: .4byte 0x08B94114
_08025CAC:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025CF8 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _08025CD6
	b _08025DFE
_08025CD6:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08025CE0
	b _08025DFE
_08025CE0:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025CFC @ =0x08B94074
	mov r5, sb
	b _08025D94
	.align 2, 0
_08025CF8: .4byte 0x0202BBB8
_08025CFC: .4byte 0x08B94074
_08025D00:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025D44 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r0, r3, #0
	adds r0, #0x10
	movs r5, #0x80
	lsls r5, r5, #1
	lsls r6, r7, #0x18
	cmp r0, r5
	bhi _08025DFE
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025DFE
	ldr r1, _08025D48 @ =0x00000202
	adds r0, r3, r1
	subs r1, #3
	ands r0, r1
	adds r1, r2, r5
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025D4C @ =0x08B93FD0
	ldr r5, [sp, #0x10]
	b _08025D94
	.align 2, 0
_08025D44: .4byte 0x0202BBB8
_08025D48: .4byte 0x00000202
_08025D4C: .4byte 0x08B93FD0
_08025D50:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025DA4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bhi _08025DFE
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025DFE
	ldr r1, _08025DA8 @ =0x00000201
	adds r0, r3, r1
	subs r1, #2
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025DAC @ =0x08B94034
	mov r5, sl
_08025D94:
	lsls r2, r5, #2
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl PutOamHiRam
	b _08025DFE
	.align 2, 0
_08025DA4: .4byte 0x0202BBB8
_08025DA8: .4byte 0x00000201
_08025DAC: .4byte 0x08B94034
_08025DB0:
	lsls r0, r7, #0x18
	adds r6, r0, #0
	cmp r6, #0
	bne _08025DBA
	b _08025F56
_08025DBA:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025E70 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025DFE
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025DFE
	ldr r1, _08025E74 @ =0x000001FF
	adds r0, r3, r1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025E78 @ =0x08B94144
	movs r3, #0
	bl PutOamHiRam
_08025DFE:
	cmp r6, #0
	bne _08025E04
	b _08025F56
_08025E04:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08025E8C
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025E70 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _08025E36
	b _08025F56
_08025E36:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08025E40
	b _08025F56
_08025E40:
	ldr r1, _08025E7C @ =0x00000209
	adds r0, r3, r1
	subs r1, #0xa
	ands r0, r1
	ldr r3, _08025E80 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025E84 @ =0x08B905B0
	ldrb r4, [r4, #0x1b]
	lsrs r3, r4, #6
	lsls r3, r3, #1
	mov r5, sp
	adds r4, r5, r3
	movs r3, #0xf
	ldrh r4, [r4]
	ands r3, r4
	lsls r3, r3, #0xc
	ldr r4, _08025E88 @ =0x00000803
	adds r3, r3, r4
	bl PutOamHiRam
	b _08025F56
	.align 2, 0
_08025E70: .4byte 0x0202BBB8
_08025E74: .4byte 0x000001FF
_08025E78: .4byte 0x08B94144
_08025E7C: .4byte 0x00000209
_08025E80: .4byte 0x00000107
_08025E84: .4byte 0x08B905B0
_08025E88: .4byte 0x00000803
_08025E8C:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	ldr r2, [r4]
	cmp r0, #0
	beq _08025F08
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08025F08
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025EF4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025F56
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025F56
	ldr r5, _08025EF8 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _08025EFC @ =0x000001FF
	ands r0, r1
	ldr r3, _08025F00 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025F04 @ =0x08B905B0
	movs r3, #0x81
	lsls r3, r3, #4
	bl PutOamHiRam
	b _08025F56
	.align 2, 0
_08025EF4: .4byte 0x0202BBB8
_08025EF8: .4byte 0x00000209
_08025EFC: .4byte 0x000001FF
_08025F00: .4byte 0x00000107
_08025F04: .4byte 0x08B905B0
_08025F08:
	ldr r5, [sp, #8]
	ldrb r2, [r2, #4]
	cmp r5, r2
	bne _08025F56
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025F74 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025F56
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025F56
	ldr r5, _08025F78 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _08025F7C @ =0x000001FF
	ands r0, r1
	ldr r3, _08025F80 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025F84 @ =0x08B905B0
	ldr r3, _08025F88 @ =0x00000811
	bl PutOamHiRam
_08025F56:
	movs r4, #1
	add r8, r4
	mov r5, r8
	cmp r5, #0xbf
	bgt _08025F62
	b _08025BDC
_08025F62:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025F74: .4byte 0x0202BBB8
_08025F78: .4byte 0x00000209
_08025F7C: .4byte 0x000001FF
_08025F80: .4byte 0x00000107
_08025F84: .4byte 0x08B905B0
_08025F88: .4byte 0x00000811

	thumb_func_start sub_08025F8C
sub_08025F8C: @ 0x08025F8C
	ldr r1, _08025F94 @ =0x0202BBB8
	ldr r0, _08025F98 @ =0x0000FFFF
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08025F94: .4byte 0x0202BBB8
_08025F98: .4byte 0x0000FFFF

	thumb_func_start sub_08025F9C
sub_08025F9C: @ 0x08025F9C
	ldr r1, _08025FA4 @ =0x0203A3D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08025FA4: .4byte 0x0203A3D4

	thumb_func_start UnitSpriteHoverUpdate
UnitSpriteHoverUpdate: @ 0x08025FA8
	push {r4, lr}
	ldr r2, _0802600C @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08026010 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026018
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08026018
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08026018
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08026018
	cmp r1, #2
	beq _08026018
	ldr r1, _08026014 @ =0x0203A3D4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #5
	bne _08026018
	adds r0, r4, #0
	bl StartMu
	adds r0, r4, #0
	bl HideUnitSprite
	b _08026052
	.align 2, 0
_0802600C: .4byte 0x0202BBB8
_08026010: .4byte 0x0202E3DC
_08026014: .4byte 0x0203A3D4
_08026018:
	ldr r2, _08026058 @ =0x0202BBB8
	ldr r1, [r2, #0x18]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	beq _08026052
	ldr r1, _0802605C @ =0x0203A3D4
	movs r0, #0
	str r0, [r1]
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	ldr r1, _08026060 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x18
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026052
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_08026052:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026058: .4byte 0x0202BBB8
_0802605C: .4byte 0x0203A3D4
_08026060: .4byte 0x0202E3DC

	thumb_func_start sub_08026064
sub_08026064: @ 0x08026064
	push {lr}
	ldr r2, _080260A8 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080260AC
	ldr r0, [r2, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080260AC
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080260AC
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _080260AC
	cmp r1, #2
	beq _080260AC
	movs r0, #1
	b _080260AE
	.align 2, 0
_080260A8: .4byte 0x0202E3DC
_080260AC:
	movs r0, #0
_080260AE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PutUnitSprite
PutUnitSprite: @ 0x080260B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r7, r2, #0
	adds r4, r3, #0
	adds r0, r4, #0
	bl GetUnitSMSId
	adds r5, r0, #0
	bl UseUnitSprite
	adds r6, r0, #0
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802618A
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802618A
	ldr r1, _08026104 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026138
	cmp r0, #1
	bgt _08026108
	cmp r0, #0
	beq _0802610E
	b _0802618A
	.align 2, 0
_08026104: .4byte 0x08C99700
_08026108:
	cmp r0, #2
	beq _08026164
	b _0802618A
_0802610E:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	ldr r3, _08026134 @ =0x08B905B8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	bl PutSprite
	b _0802618A
	.align 2, 0
_08026134: .4byte 0x08B905B8
_08026138:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08026160 @ =0x08B905D8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _0802618A
	.align 2, 0
_08026160: .4byte 0x08B905D8
_08026164:
	adds r0, r4, #0
	bl GetUnitDisplayedSpritePalette
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r1, #0x88
	lsls r1, r1, #4
	adds r0, r6, r1
	adds r4, r4, r0
	mov r1, r8
	subs r1, #8
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08026198 @ =0x08B905C0
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_0802618A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026198: .4byte 0x08B905C0

	thumb_func_start PutUnitSpriteForClassId
PutUnitSpriteForClassId: @ 0x0802619C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	mov r8, r0
	bl UseUnitSprite
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802623C
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802623C
	ldr r1, _080261F0 @ =0x08C99700
	movs r0, #0x7f
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026210
	cmp r0, #1
	bgt _080261F4
	cmp r0, #0
	beq _080261FA
	b _0802623C
	.align 2, 0
_080261F0: .4byte 0x08C99700
_080261F4:
	cmp r0, #2
	beq _08026228
	b _0802623C
_080261FA:
	ldr r3, _0802620C @ =0x08B905B8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	bl PutSprite
	b _0802623C
	.align 2, 0
_0802620C: .4byte 0x08B905B8
_08026210:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026224 @ =0x08B905D8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	bl PutSprite
	b _0802623C
	.align 2, 0
_08026224: .4byte 0x08B905D8
_08026228:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _0802624C @ =0x08B905C0
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	bl PutSprite
_0802623C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802624C: .4byte 0x08B905C0

	thumb_func_start sub_08026250
sub_08026250: @ 0x08026250
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	bl GetClassSMSId
	adds r6, r0, #0
	bl UseUnitSprite
	adds r7, r0, #0
	adds r7, #0x80
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080262F4
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _080262F4
	ldr r1, _0802629C @ =0x08C99700
	movs r0, #0x7f
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _080262B4
	cmp r0, #1
	bgt _080262A0
	cmp r0, #0
	beq _080262A6
	b _080262F4
	.align 2, 0
_0802629C: .4byte 0x08C99700
_080262A0:
	cmp r0, #2
	beq _080262D4
	b _080262F4
_080262A6:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r4, r0
	ldr r3, _080262B0 @ =0x08B905B8
	b _080262C4
	.align 2, 0
_080262B0: .4byte 0x08B905B8
_080262B4:
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _080262D0 @ =0x08B905D8
_080262C4:
	str r7, [sp]
	mov r0, r8
	adds r1, r5, #0
	bl PutSpriteExt
	b _080262F4
	.align 2, 0
_080262D0: .4byte 0x08B905D8
_080262D4:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08026300 @ =0x000001FF
	ands r1, r0
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08026304 @ =0x08B905C0
	str r7, [sp]
	mov r0, r8
	bl PutSpriteExt
_080262F4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026300: .4byte 0x000001FF
_08026304: .4byte 0x08B905C0

	thumb_func_start sub_08026308
sub_08026308: @ 0x08026308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	adds r2, r0, #0
	ldr r0, _0802635C @ =0x08B93E48
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r4, r0, #1
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026390
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026390
	ldr r1, _08026360 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	blt _08026390
	cmp r0, #1
	ble _08026364
	cmp r0, #2
	beq _0802637C
	b _08026390
	.align 2, 0
_0802635C: .4byte 0x08B93E48
_08026360: .4byte 0x08C99700
_08026364:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026378 @ =0x08B905D8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	bl PutSprite
	b _08026390
	.align 2, 0
_08026378: .4byte 0x08B905D8
_0802637C:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _0802639C @ =0x08B905C0
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	bl PutSprite
_08026390:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802639C: .4byte 0x08B905C0

	thumb_func_start sub_080263A0
sub_080263A0: @ 0x080263A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r4, r0, #0
	bl UseUnitSprite
	adds r5, r0, #0
	adds r5, #0x80
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802646A
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802646A
	ldr r1, _080263F0 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026420
	cmp r0, #1
	bgt _080263F4
	cmp r0, #0
	beq _080263FA
	b _0802646A
	.align 2, 0
_080263F0: .4byte 0x08C99700
_080263F4:
	cmp r0, #2
	beq _08026448
	b _0802646A
_080263FA:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	ldr r3, _0802641C @ =0x08B905B8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r6, #0
	bl PutSprite
	b _0802646A
	.align 2, 0
_0802641C: .4byte 0x08B905B8
_08026420:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08026444 @ =0x08B905D8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl PutSprite
	b _0802646A
	.align 2, 0
_08026444: .4byte 0x08B905D8
_08026448:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r4, r7, r4
	adds r4, r4, r5
	mov r1, r8
	subs r1, #8
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08026478 @ =0x08B905C0
	str r4, [sp]
	mov r0, sb
	bl PutSprite
_0802646A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026478: .4byte 0x08B905C0

	thumb_func_start PutBlendWindowUnitSprite
PutBlendWindowUnitSprite: @ 0x0802647C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r5, r0, #0
	bl UseUnitSprite
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r7, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026550
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026550
	ldr r1, _080264CC @ =0x08C99700
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026500
	cmp r0, #1
	bgt _080264D0
	cmp r0, #0
	beq _080264D6
	b _08026550
	.align 2, 0
_080264CC: .4byte 0x08C99700
_080264D0:
	cmp r0, #2
	beq _0802652C
	b _08026550
_080264D6:
	ldr r3, _080264F8 @ =0x08B94152
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _080264FC @ =0x08B9416A
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	b _08026550
	.align 2, 0
_080264F8: .4byte 0x08B94152
_080264FC: .4byte 0x08B9416A
_08026500:
	adds r5, r6, #0
	subs r5, #0x10
	ldr r3, _08026524 @ =0x08B9415A
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	ldr r3, _08026528 @ =0x08B94172
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	b _08026550
	.align 2, 0
_08026524: .4byte 0x08B9415A
_08026528: .4byte 0x08B94172
_0802652C:
	adds r5, r7, #0
	subs r5, #8
	subs r6, #0x10
	ldr r3, _08026560 @ =0x08B94162
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _08026564 @ =0x08B9417A
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
_08026550:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026560: .4byte 0x08B94162
_08026564: .4byte 0x08B9417A

	thumb_func_start sub_08026568
sub_08026568: @ 0x08026568
	ldr r1, _08026570 @ =0x02039F1C
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08026570: .4byte 0x02039F1C

	thumb_func_start HideUnitSprite
HideUnitSprite: @ 0x08026574
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08026580
	bl RefreshUnitSprites
_08026580:
	ldr r1, [r4, #0x3c]
	cmp r1, #0
	beq _08026592
	movs r2, #0x80
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r2, [r1, #0xb]
	orrs r0, r2
	strb r0, [r1, #0xb]
_08026592:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ShowUnitSprite
ShowUnitSprite: @ 0x08026598
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _080265A6
	movs r0, #0x7f
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
_080265A6:
	bx lr

	thumb_func_start GetUnitSpriteHideFlag
GetUnitSpriteHideFlag: @ 0x080265A8
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _080265BC
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080265BE
_080265BC:
	movs r0, #0x80
_080265BE:
	bx lr

	thumb_func_start sub_080265C0
sub_080265C0: @ 0x080265C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r5, r1, #0
	mov sb, r2
	ldr r0, _08026624 @ =0x08B93F18
	lsls r3, r3, #1
	adds r3, r3, r0
	ldrh r6, [r3]
	movs r3, #0
	cmp r3, sb
	bge _08026618
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #2
	movs r1, #0xf
	mov ip, r1
	mov r7, ip
	lsls r7, r0
	mov ip, r7
_080265EC:
	adds r4, r3, #1
	cmp r5, #0
	ble _08026612
	mov r0, ip
	mvns r2, r0
	asrs r1, r6, #3
	lsls r1, r1, #2
	lsls r0, r3, #0xa
	adds r3, r5, #0
	adds r0, r0, r1
	mov r7, r8
	adds r1, r7, r0
_08026604:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x20
	subs r3, #1
	cmp r3, #0
	bne _08026604
_08026612:
	adds r3, r4, #0
	cmp r3, sb
	blt _080265EC
_08026618:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026624: .4byte 0x08B93F18

	thumb_func_start GetUnitSupporterCount
GetUnitSupporterCount: @ 0x08026628
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026634
	ldrb r0, [r0, #0x15]
	b _08026636
_08026634:
	movs r0, #0
_08026636:
	bx lr

	thumb_func_start GetUnitSupportPid
GetUnitSupportPid: @ 0x08026638
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026646
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026648
_08026646:
	movs r0, #0
_08026648:
	bx lr
	.align 2, 0

	thumb_func_start GetUnitSupportUnit
GetUnitSupportUnit: @ 0x0802664C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	adds r5, r0, #1
	adds r6, r0, #0
	adds r6, #0x40
	cmp r5, r6
	bge _0802668A
_08026668:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026684
	ldr r0, [r4]
	cmp r0, #0
	beq _08026684
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _08026684
	adds r0, r4, #0
	b _0802668C
_08026684:
	adds r5, #1
	cmp r5, r6
	blt _08026668
_0802668A:
	movs r0, #0
_0802668C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitSupportLevel
GetUnitSupportLevel: @ 0x08026694
	adds r0, #0x32
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xf0
	ble _080266A2
	movs r0, #3
	b _080266B4
_080266A2:
	cmp r0, #0xa0
	ble _080266AA
	movs r0, #2
	b _080266B4
_080266AA:
	cmp r0, #0x50
	bgt _080266B2
	movs r0, #0
	b _080266B4
_080266B2:
	movs r0, #1
_080266B4:
	bx lr
	.align 2, 0

	thumb_func_start GetUnitTotalSupportLevel
GetUnitTotalSupportLevel: @ 0x080266B8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0
	cmp r6, r5
	bge _080266DA
_080266CA:
	adds r0, r7, #0
	adds r1, r4, #0
	bl GetUnitSupportLevel
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _080266CA
_080266DA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080266E4
sub_080266E4: @ 0x080266E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _0802673C @ =0x0202BBF8
	mov r8, r0
	ldrb r3, [r0, #0x1b]
	cmp r3, #1
	beq _08026730
	ldr r0, [r2]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026730
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r6, [r0]
	adds r0, r2, #0
	adds r0, #0x32
	adds r7, r0, r1
	ldrb r5, [r7]
	ldr r4, _08026740 @ =0x08B94184
	adds r0, r2, #0
	bl GetUnitSupportLevel
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, r6
	cmp r0, r1
	ble _08026722
	subs r6, r1, r5
_08026722:
	adds r0, r5, r6
	strb r0, [r7]
	mov r1, r8
	ldrh r1, [r1, #0x16]
	adds r0, r1, r6
	mov r2, r8
	strh r0, [r2, #0x16]
_08026730:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802673C: .4byte 0x0202BBF8
_08026740: .4byte 0x08B94184

	thumb_func_start UnitGainSupportLevel
UnitGainSupportLevel: @ 0x08026744
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x32
	adds r2, r2, r1
	ldrb r3, [r2]
	adds r3, #1
	strb r3, [r2]
	ldr r3, _08026774 @ =0x0202BBF8
	ldrh r2, [r3, #0x16]
	adds r2, #1
	strh r2, [r3, #0x16]
	ldr r2, [r0]
	ldrb r4, [r2, #4]
	bl GetUnitSupportPid
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08026BA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026774: .4byte 0x0202BBF8

	thumb_func_start CanUnitSupportNow
CanUnitSupportNow: @ 0x08026778
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080267DC @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080267D6
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080267D6
	adds r0, r5, #0
	adds r1, r6, #0
	bl HasUnitGainedSupportLevel
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080267D6
	adds r0, r5, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _080267D6
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportUnit
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _080267D6
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	ldrb r7, [r0]
	ldr r4, _080267E0 @ =0x08B94184
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r7, #0xf1
	bne _080267E4
_080267D6:
	movs r0, #0
	b _080267EE
	.align 2, 0
_080267DC: .4byte 0x0202BBF8
_080267E0: .4byte 0x08B94184
_080267E4:
	movs r1, #0
	cmp r7, r0
	bne _080267EC
	movs r1, #1
_080267EC:
	adds r0, r1, #0
_080267EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetUnitInitialSupportExp
GetUnitInitialSupportExp: @ 0x080267F4
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026804
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026808
_08026804:
	movs r0, #1
	rsbs r0, r0, #0
_08026808:
	bx lr
	.align 2, 0

	thumb_func_start GetUnitSupportNumByPid
GetUnitSupportNumByPid: @ 0x0802680C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802683A
_08026820:
	adds r0, r6, #0
	adds r1, r4, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r7
	bne _08026834
	adds r0, r4, #0
	b _0802683E
_08026834:
	adds r4, #1
	cmp r4, r5
	blt _08026820
_0802683A:
	movs r0, #1
	rsbs r0, r0, #0
_0802683E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ClearUnitSupports
ClearUnitSupports: @ 0x08026844
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	bl GetUnitSupporterCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0802688C
	mov r8, r6
_0802685A:
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026886
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetUnitSupportNumByPid
	adds r1, r4, #0
	adds r1, #0x32
	adds r1, r1, r0
	mov r0, r8
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
_08026886:
	adds r6, #1
	cmp r6, r7
	blt _0802685A
_0802688C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DoTurnSupportExp
DoTurnSupportExp: @ 0x08026898
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08026938 @ =0x0202BBF8
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	beq _08026984
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08026984
	movs r4, #1
_080268B4:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov sb, r4
	cmp r5, #0
	beq _0802697E
	ldr r0, [r5]
	cmp r0, #0
	beq _0802697E
	ldr r0, [r5, #0xc]
	ldr r1, _0802693C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0802697E
	adds r0, r5, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _0802697E
	adds r0, r5, #0
	bl GetUnitSupporterCount
	mov r8, r0
	movs r7, #0
	cmp r7, r8
	bge _0802697E
_080268EC:
	adds r0, r5, #0
	adds r1, r7, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026978
	ldr r1, [r4, #0xc]
	ldr r0, _0802693C @ =0x0001000C
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0
	bne _08026978
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	mov ip, r1
	cmp r0, #0
	bne _08026978
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026924
	subs r1, r0, r2
_08026924:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08026940
	adds r0, r1, r2
	b _08026944
	.align 2, 0
_08026938: .4byte 0x0202BBF8
_0802693C: .4byte 0x0001000C
_08026940:
	subs r0, r0, r3
	adds r0, r1, r0
_08026944:
	cmp r0, #0
	beq _0802694E
	cmp r0, #1
	beq _08026956
	b _08026978
_0802694E:
	ldrb r0, [r5, #0x1b]
	cmp r0, ip
	bne _08026978
	b _08026966
_08026956:
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08026978
	ands r6, r1
	cmp r6, #0
	bne _08026978
_08026966:
	adds r0, r4, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _08026978
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_080266E4
_08026978:
	adds r7, #1
	cmp r7, r8
	blt _080268EC
_0802697E:
	mov r4, sb
	cmp r4, #0x3f
	ble _080268B4
_08026984:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08026990
sub_08026990: @ 0x08026990
	adds r2, r0, #0
	ldr r1, _08026998 @ =0x08C9A1C0
	b _080269A8
	.align 2, 0
_08026998: .4byte 0x08C9A1C0
_0802699C:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080269A6
	adds r0, r1, #0
	b _080269AE
_080269A6:
	adds r1, #8
_080269A8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0802699C
_080269AE:
	bx lr

	thumb_func_start sub_080269B0
sub_080269B0: @ 0x080269B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	bl sub_08026990
	ldrb r2, [r0, #1]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #1]
	adds r1, r2, r1
	strb r1, [r4, #1]
	ldrb r2, [r0, #2]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #2]
	adds r1, r2, r1
	strb r1, [r4, #2]
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #3]
	adds r1, r2, r1
	strb r1, [r4, #3]
	ldrb r2, [r0, #4]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #4]
	adds r1, r2, r1
	strb r1, [r4, #4]
	ldrb r2, [r0, #5]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #5]
	adds r1, r2, r1
	strb r1, [r4, #5]
	ldrb r0, [r0, #6]
	muls r0, r5, r0
	ldrb r1, [r4, #6]
	adds r0, r1, r0
	strb r0, [r4, #6]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start InitBonuses
InitBonuses: @ 0x08026A08
	movs r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	bx lr

	thumb_func_start sub_08026A18
sub_08026A18: @ 0x08026A18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	bl InitBonuses
	adds r0, r7, #0
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov r8, r1
	cmp sb, sl
	bge _08026AE4
	subs r0, #1
	str r0, [sp]
_08026A46:
	mov r1, sb
	asrs r1, r1, #1
	mov sb, r1
	adds r0, r7, #0
	mov r1, r8
	bl GetUnitSupportUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08026ADC
	ldr r1, _08026B1C @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08026A8C
	movs r2, #0x10
	ldrsb r2, [r7, r2]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026A76
	subs r1, r0, r2
_08026A76:
	movs r3, #0x11
	ldrsb r3, [r7, r3]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _08026A86
	subs r0, r2, r3
_08026A86:
	adds r0, r1, r0
	cmp r0, #3
	bgt _08026ADC
_08026A8C:
	ldr r0, [r5, #0xc]
	ldr r1, _08026B20 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08026ADC
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl GetUnitSupportNumByPid
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetUnitSupportLevel
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_080269B0
	adds r0, r7, #0
	mov r1, r8
	bl GetUnitSupportLevel
	adds r5, r0, #0
	ldr r0, [r7]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r5, #0
	bl sub_080269B0
	cmp r4, #0
	beq _08026ADC
	cmp r5, #0
	beq _08026ADC
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r1
	add sb, r0
_08026ADC:
	movs r0, #1
	add r8, r0
	cmp r8, sl
	blt _08026A46
_08026AE4:
	ldrb r1, [r6, #1]
	lsrs r0, r1, #1
	strb r0, [r6, #1]
	ldrb r1, [r6, #2]
	lsrs r0, r1, #1
	strb r0, [r6, #2]
	ldrb r1, [r6, #3]
	lsrs r0, r1, #1
	strb r0, [r6, #3]
	ldrb r1, [r6, #4]
	lsrs r0, r1, #1
	strb r0, [r6, #4]
	ldrb r1, [r6, #5]
	lsrs r0, r1, #1
	strb r0, [r6, #5]
	ldrb r1, [r6, #6]
	lsrs r0, r1, #1
	strb r0, [r6, #6]
	mov r0, sb
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026B1C: .4byte 0x0202BBB8
_08026B20: .4byte 0x0001002C

	thumb_func_start sub_08026B24
sub_08026B24: @ 0x08026B24
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026B30
	adds r0, #0x79
	b _08026B34
_08026B30:
	movs r0, #1
	rsbs r0, r0, #0
_08026B34:
	bx lr
	.align 2, 0

	thumb_func_start GetAffinityIconByPid
GetAffinityIconByPid: @ 0x08026B38
	push {lr}
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026B48
	adds r0, #0x79
	b _08026B4C
_08026B48:
	movs r0, #1
	rsbs r0, r0, #0
_08026B4C:
	pop {r1}
	bx r1

	thumb_func_start GetSupportLevelSpecialChar
GetSupportLevelSpecialChar: @ 0x08026B50
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08026B70 @ =0x081C3CC0
	mov r0, sp
	movs r2, #4
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08026B70: .4byte 0x081C3CC0

	thumb_func_start GetAffinityName
GetAffinityName: @ 0x08026B74
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08026B9C @ =0x081C3CC4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08026B9C: .4byte 0x081C3CC4

	thumb_func_start sub_08026BA0
sub_08026BA0: @ 0x08026BA0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetUnitByPid
	adds r7, r0, #0
	adds r1, r5, #0
	bl GetUnitSupportNumByPid
	adds r2, r0, #0
	adds r1, r7, #0
	adds r1, #0x39
	movs r4, #1
	adds r0, r4, #0
	lsls r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	bl GetUnitByPid
	adds r7, r0, #0
	adds r1, r6, #0
	bl GetUnitSupportNumByPid
	adds r2, r0, #0
	adds r0, r7, #0
	adds r0, #0x39
	lsls r4, r2
	ldrb r1, [r0]
	orrs r4, r1
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HasUnitGainedSupportLevel
HasUnitGainedSupportLevel: @ 0x08026BF0
	adds r0, #0x39
	movs r2, #1
	lsls r2, r1
	ldrb r0, [r0]
	ands r2, r0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0

	thumb_func_start ArePidsAtMaxSupport
ArePidsAtMaxSupport: @ 0x08026C08
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitByPid
	adds r5, r0, #0
	adds r1, r4, #0
	bl GetUnitSupportNumByPid
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetUnitSupportLevel
	cmp r0, #2
	bgt _08026C30
	movs r0, #0
	b _08026C32
_08026C30:
	movs r0, #1
_08026C32:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SwapUnitStats
SwapUnitStats: @ 0x08026C38
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _08026CCC
	cmp r3, #0
	beq _08026CCC
	ldrb r1, [r2, #8]
	ldrb r0, [r3, #8]
	strb r0, [r2, #8]
	strb r1, [r3, #8]
	ldrb r1, [r2, #9]
	ldrb r0, [r3, #9]
	strb r0, [r2, #9]
	strb r1, [r3, #9]
	ldrb r1, [r2, #0x12]
	ldrb r0, [r3, #0x12]
	strb r0, [r2, #0x12]
	strb r1, [r3, #0x12]
	ldrb r1, [r2, #0x13]
	ldrb r0, [r3, #0x13]
	strb r0, [r2, #0x13]
	strb r1, [r3, #0x13]
	ldrb r1, [r2, #0x14]
	ldrb r0, [r3, #0x14]
	strb r0, [r2, #0x14]
	strb r1, [r3, #0x14]
	ldrb r1, [r2, #0x15]
	ldrb r0, [r3, #0x15]
	strb r0, [r2, #0x15]
	strb r1, [r3, #0x15]
	ldrb r1, [r2, #0x16]
	ldrb r0, [r3, #0x16]
	strb r0, [r2, #0x16]
	strb r1, [r3, #0x16]
	ldrb r1, [r2, #0x17]
	ldrb r0, [r3, #0x17]
	strb r0, [r2, #0x17]
	strb r1, [r3, #0x17]
	ldrb r1, [r2, #0x18]
	ldrb r0, [r3, #0x18]
	strb r0, [r2, #0x18]
	strb r1, [r3, #0x18]
	ldrb r1, [r2, #0x19]
	ldrb r0, [r3, #0x19]
	strb r0, [r2, #0x19]
	strb r1, [r3, #0x19]
	ldrb r1, [r2, #0x1a]
	ldrb r0, [r3, #0x1a]
	strb r0, [r2, #0x1a]
	strb r1, [r3, #0x1a]
	ldrb r1, [r2, #0x1d]
	ldrb r0, [r3, #0x1d]
	strb r0, [r2, #0x1d]
	strb r1, [r3, #0x1d]
	ldrh r1, [r2, #0x1e]
	ldrh r0, [r3, #0x1e]
	strh r0, [r2, #0x1e]
	strh r1, [r3, #0x1e]
	ldrh r1, [r2, #0x20]
	ldrh r0, [r3, #0x20]
	strh r0, [r2, #0x20]
	strh r1, [r3, #0x20]
	ldrh r1, [r2, #0x22]
	ldrh r0, [r3, #0x22]
	strh r0, [r2, #0x22]
	strh r1, [r3, #0x22]
	ldrh r1, [r2, #0x24]
	ldrh r0, [r3, #0x24]
	strh r0, [r2, #0x24]
	strh r1, [r3, #0x24]
	ldrh r1, [r2, #0x26]
	ldrh r0, [r3, #0x26]
	strh r0, [r2, #0x26]
	strh r1, [r3, #0x26]
_08026CCC:
	bx lr
	.align 2, 0

	thumb_func_start CanUnitUseItem
CanUnitUseItem: @ 0x08026CD0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08026CF4
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08026CF4
	b _08026F44
_08026CF4:
	adds r0, r5, #0
	bl GetItemIid
	subs r0, #0x4a
	cmp r0, #0x50
	bls _08026D02
	b _08026F44
_08026D02:
	lsls r0, r0, #2
	ldr r1, _08026D0C @ =_08026D10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026D0C: .4byte _08026D10
_08026D10: @ jump table
	.4byte _08026E54 @ case 0
	.4byte _08026E54 @ case 1
	.4byte _08026E54 @ case 2
	.4byte _08026E5C @ case 3
	.4byte _08026E64 @ case 4
	.4byte _08026E6C @ case 5
	.4byte _08026E84 @ case 6
	.4byte _08026E8C @ case 7
	.4byte _08026E94 @ case 8
	.4byte _08026E9C @ case 9
	.4byte _08026E74 @ case 10
	.4byte _08026F10 @ case 11
	.4byte _08026EA4 @ case 12
	.4byte _08026EAC @ case 13
	.4byte _08026E7C @ case 14
	.4byte _08026F44 @ case 15
	.4byte _08026EB4 @ case 16
	.4byte _08026EB4 @ case 17
	.4byte _08026EB4 @ case 18
	.4byte _08026EB4 @ case 19
	.4byte _08026EB4 @ case 20
	.4byte _08026EB4 @ case 21
	.4byte _08026EB4 @ case 22
	.4byte _08026EB4 @ case 23
	.4byte _08026EB4 @ case 24
	.4byte _08026EBE @ case 25
	.4byte _08026EBE @ case 26
	.4byte _08026EBE @ case 27
	.4byte _08026EBE @ case 28
	.4byte _08026EBE @ case 29
	.4byte _08026EE8 @ case 30
	.4byte _08026EF0 @ case 31
	.4byte _08026EF8 @ case 32
	.4byte _08026EC8 @ case 33
	.4byte _08026EC8 @ case 34
	.4byte _08026ED0 @ case 35
	.4byte _08026EE0 @ case 36
	.4byte _08026ED8 @ case 37
	.4byte _08026F44 @ case 38
	.4byte _08026F44 @ case 39
	.4byte _08026F44 @ case 40
	.4byte _08026F44 @ case 41
	.4byte _08026F44 @ case 42
	.4byte _08026F44 @ case 43
	.4byte _08026F44 @ case 44
	.4byte _08026F44 @ case 45
	.4byte _08026EE8 @ case 46
	.4byte _08026F00 @ case 47
	.4byte _08026F08 @ case 48
	.4byte _08026F44 @ case 49
	.4byte _08026F20 @ case 50
	.4byte _08026F20 @ case 51
	.4byte _08026F20 @ case 52
	.4byte _08026F20 @ case 53
	.4byte _08026F44 @ case 54
	.4byte _08026F44 @ case 55
	.4byte _08026F44 @ case 56
	.4byte _08026F44 @ case 57
	.4byte _08026F44 @ case 58
	.4byte _08026F44 @ case 59
	.4byte _08026F44 @ case 60
	.4byte _08026EBE @ case 61
	.4byte _08026F34 @ case 62
	.4byte _08026EBE @ case 63
	.4byte _08026F44 @ case 64
	.4byte _08026EBE @ case 65
	.4byte _08026F44 @ case 66
	.4byte _08026F44 @ case 67
	.4byte _08026F44 @ case 68
	.4byte _08026F44 @ case 69
	.4byte _08026F44 @ case 70
	.4byte _08026F44 @ case 71
	.4byte _08026F44 @ case 72
	.4byte _08026F44 @ case 73
	.4byte _08026F44 @ case 74
	.4byte _08026F44 @ case 75
	.4byte _08026EBE @ case 76
	.4byte _08026F44 @ case 77
	.4byte _08026F44 @ case 78
	.4byte _08026F44 @ case 79
	.4byte _08026EC8 @ case 80
_08026E54:
	ldr r1, _08026E58 @ =sub_0802458C
	b _08026F22
	.align 2, 0
_08026E58: .4byte sub_0802458C
_08026E5C:
	ldr r1, _08026E60 @ =MakeTargetListForRangedHeal
	b _08026F22
	.align 2, 0
_08026E60: .4byte MakeTargetListForRangedHeal
_08026E64:
	ldr r1, _08026E68 @ =MakeTargetListForRangedHeal
	b _08026F22
	.align 2, 0
_08026E68: .4byte MakeTargetListForRangedHeal
_08026E6C:
	ldr r1, _08026E70 @ =sub_0802465C
	b _08026F22
	.align 2, 0
_08026E70: .4byte sub_0802465C
_08026E74:
	ldr r1, _08026E78 @ =sub_0802474C
	b _08026F22
	.align 2, 0
_08026E78: .4byte sub_0802474C
_08026E7C:
	ldr r1, _08026E80 @ =sub_080246E0
	b _08026F22
	.align 2, 0
_08026E80: .4byte sub_080246E0
_08026E84:
	ldr r1, _08026E88 @ =sub_08024858
	b _08026F22
	.align 2, 0
_08026E88: .4byte sub_08024858
_08026E8C:
	ldr r1, _08026E90 @ =sub_08024880
	b _08026F22
	.align 2, 0
_08026E90: .4byte sub_08024880
_08026E94:
	ldr r1, _08026E98 @ =sub_080248A8
	b _08026F22
	.align 2, 0
_08026E98: .4byte sub_080248A8
_08026E9C:
	ldr r1, _08026EA0 @ =sub_08024908
	b _08026F22
	.align 2, 0
_08026EA0: .4byte sub_08024908
_08026EA4:
	ldr r1, _08026EA8 @ =sub_080249C8
	b _08026F22
	.align 2, 0
_08026EA8: .4byte sub_080249C8
_08026EAC:
	ldr r1, _08026EB0 @ =sub_0802493C
	b _08026F22
	.align 2, 0
_08026EB0: .4byte sub_0802493C
_08026EB4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStatGainItem
	b _08026F28
_08026EBE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08027400
	b _08026F28
_08026EC8:
	adds r0, r4, #0
	bl CanUnitUseHealItem
	b _08026F28
_08026ED0:
	adds r0, r4, #0
	bl sub_08027308
	b _08026F28
_08026ED8:
	adds r0, r4, #0
	bl sub_0802731C
	b _08026F28
_08026EE0:
	adds r0, r4, #0
	bl sub_08027340
	b _08026F28
_08026EE8:
	adds r0, r4, #0
	bl CanUnitUseChestKeyItem
	b _08026F28
_08026EF0:
	adds r0, r4, #0
	bl CanUnitUseDoorKeyItem
	b _08026F28
_08026EF8:
	adds r0, r4, #0
	bl CanUnitUseLockpickItem
	b _08026F28
_08026F00:
	ldr r1, _08026F04 @ =MakeTargetListForDanceRing
	b _08026F22
	.align 2, 0
_08026F04: .4byte MakeTargetListForDanceRing
_08026F08:
	ldr r1, _08026F0C @ =MakeTargetListForMine
	b _08026F22
	.align 2, 0
_08026F0C: .4byte MakeTargetListForMine
_08026F10:
	ldr r1, _08026F1C @ =0x0202BBF8
	ldrb r2, [r1, #0xd]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	b _08026F46
	.align 2, 0
_08026F1C: .4byte 0x0202BBF8
_08026F20:
	ldr r1, _08026F30 @ =sub_08024C54
_08026F22:
	adds r0, r4, #0
	bl HasSelectTarget
_08026F28:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08026F46
	.align 2, 0
_08026F30: .4byte sub_08024C54
_08026F34:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _08026F44
	movs r0, #1
	b _08026F46
_08026F44:
	movs r0, #0
_08026F46:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start GetItemCantUseMsgid
GetItemCantUseMsgid: @ 0x08026F4C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetItemIid
	subs r0, #0x55
	cmp r0, #0x45
	bls _08026F5E
	b _080270F0
_08026F5E:
	lsls r0, r0, #2
	ldr r1, _08026F68 @ =_08026F6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026F68: .4byte _08026F6C
_08026F6C: @ jump table
	.4byte _08027084 @ case 0
	.4byte _080270F0 @ case 1
	.4byte _080270F0 @ case 2
	.4byte _080270F0 @ case 3
	.4byte _080270F0 @ case 4
	.4byte _08027084 @ case 5
	.4byte _08027084 @ case 6
	.4byte _08027084 @ case 7
	.4byte _08027084 @ case 8
	.4byte _08027084 @ case 9
	.4byte _08027084 @ case 10
	.4byte _08027084 @ case 11
	.4byte _08027084 @ case 12
	.4byte _08027084 @ case 13
	.4byte _080270C6 @ case 14
	.4byte _080270C6 @ case 15
	.4byte _080270C6 @ case 16
	.4byte _080270C6 @ case 17
	.4byte _080270C6 @ case 18
	.4byte _0802708C @ case 19
	.4byte _08027094 @ case 20
	.4byte _0802709C @ case 21
	.4byte _08027084 @ case 22
	.4byte _08027084 @ case 23
	.4byte _08027084 @ case 24
	.4byte _08027084 @ case 25
	.4byte _08027084 @ case 26
	.4byte _080270F0 @ case 27
	.4byte _080270F0 @ case 28
	.4byte _080270F0 @ case 29
	.4byte _080270F0 @ case 30
	.4byte _080270F0 @ case 31
	.4byte _080270F0 @ case 32
	.4byte _080270F0 @ case 33
	.4byte _080270F0 @ case 34
	.4byte _0802708C @ case 35
	.4byte _080270F0 @ case 36
	.4byte _080270F0 @ case 37
	.4byte _080270F0 @ case 38
	.4byte _080270F0 @ case 39
	.4byte _080270F0 @ case 40
	.4byte _080270F0 @ case 41
	.4byte _080270F0 @ case 42
	.4byte _080270F0 @ case 43
	.4byte _080270F0 @ case 44
	.4byte _080270F0 @ case 45
	.4byte _080270F0 @ case 46
	.4byte _080270F0 @ case 47
	.4byte _080270F0 @ case 48
	.4byte _080270F0 @ case 49
	.4byte _080270C6 @ case 50
	.4byte _080270F0 @ case 51
	.4byte _080270C6 @ case 52
	.4byte _080270F0 @ case 53
	.4byte _080270C6 @ case 54
	.4byte _080270F0 @ case 55
	.4byte _080270F0 @ case 56
	.4byte _080270F0 @ case 57
	.4byte _080270F0 @ case 58
	.4byte _080270F0 @ case 59
	.4byte _080270F0 @ case 60
	.4byte _080270F0 @ case 61
	.4byte _080270F0 @ case 62
	.4byte _080270F0 @ case 63
	.4byte _080270F0 @ case 64
	.4byte _080270C6 @ case 65
	.4byte _080270F0 @ case 66
	.4byte _080270F0 @ case 67
	.4byte _080270F0 @ case 68
	.4byte _08027084 @ case 69
_08027084:
	ldr r0, _08027088 @ =0x00000743
	b _080270F2
	.align 2, 0
_08027088: .4byte 0x00000743
_0802708C:
	ldr r0, _08027090 @ =0x00000747
	b _080270F2
	.align 2, 0
_08027090: .4byte 0x00000747
_08027094:
	ldr r0, _08027098 @ =0x00000746
	b _080270F2
	.align 2, 0
_08027098: .4byte 0x00000746
_0802709C:
	ldr r0, _080270B8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080270C0
	ldr r0, _080270BC @ =0x0000074A
	b _080270F2
	.align 2, 0
_080270B8: .4byte 0x03004690
_080270BC: .4byte 0x0000074A
_080270C0:
	movs r0, #0xe9
	lsls r0, r0, #3
	b _080270F2
_080270C6:
	ldr r4, _080270E8 @ =0x03004690
	ldr r1, [r4]
	movs r5, #8
	ldrsb r5, [r1, r5]
	movs r0, #0xa
	strb r0, [r1, #8]
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08027400
	ldr r1, [r4]
	strb r5, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080270F0
	ldr r0, _080270EC @ =0x00000745
	b _080270F2
	.align 2, 0
_080270E8: .4byte 0x03004690
_080270EC: .4byte 0x00000745
_080270F0:
	ldr r0, _080270F8 @ =0x00000744
_080270F2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080270F8: .4byte 0x00000744

	thumb_func_start DoItemUse
DoItemUse: @ 0x080270FC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ClearUi
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	bl GetItemIid
	subs r0, #0x4a
	cmp r0, #0x35
	bls _0802711A
	b _080272C4
_0802711A:
	lsls r0, r0, #2
	ldr r1, _08027124 @ =_08027128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027124: .4byte _08027128
_08027128: @ jump table
	.4byte _08027200 @ case 0
	.4byte _08027200 @ case 1
	.4byte _08027200 @ case 2
	.4byte _08027208 @ case 3
	.4byte _0802727C @ case 4
	.4byte _08027228 @ case 5
	.4byte _08027238 @ case 6
	.4byte _08027240 @ case 7
	.4byte _08027248 @ case 8
	.4byte _0802726C @ case 9
	.4byte _08027218 @ case 10
	.4byte _080272A8 @ case 11
	.4byte _08027274 @ case 12
	.4byte _08027260 @ case 13
	.4byte _08027258 @ case 14
	.4byte _080272C4 @ case 15
	.4byte _080272C4 @ case 16
	.4byte _080272C4 @ case 17
	.4byte _080272C4 @ case 18
	.4byte _080272C4 @ case 19
	.4byte _080272C4 @ case 20
	.4byte _080272C4 @ case 21
	.4byte _080272C4 @ case 22
	.4byte _080272C4 @ case 23
	.4byte _080272C4 @ case 24
	.4byte _080272C4 @ case 25
	.4byte _080272C4 @ case 26
	.4byte _080272C4 @ case 27
	.4byte _080272C4 @ case 28
	.4byte _080272C4 @ case 29
	.4byte _080272C4 @ case 30
	.4byte _080272C4 @ case 31
	.4byte _080272C4 @ case 32
	.4byte _080272C4 @ case 33
	.4byte _080272C4 @ case 34
	.4byte _080272C4 @ case 35
	.4byte _080272C4 @ case 36
	.4byte _080272C4 @ case 37
	.4byte _080272C4 @ case 38
	.4byte _080272C4 @ case 39
	.4byte _080272C4 @ case 40
	.4byte _080272C4 @ case 41
	.4byte _080272C4 @ case 42
	.4byte _080272C4 @ case 43
	.4byte _080272C4 @ case 44
	.4byte _080272C4 @ case 45
	.4byte _080272C4 @ case 46
	.4byte _08027284 @ case 47
	.4byte _08027294 @ case 48
	.4byte _080272C4 @ case 49
	.4byte _080272B0 @ case 50
	.4byte _080272B0 @ case 51
	.4byte _080272B0 @ case 52
	.4byte _080272B0 @ case 53
_08027200:
	ldr r1, _08027204 @ =sub_0802458C
	b _0802720A
	.align 2, 0
_08027204: .4byte sub_0802458C
_08027208:
	ldr r1, _08027214 @ =MakeTargetListForRangedHeal
_0802720A:
	adds r0, r5, #0
	bl sub_08027CBC
	b _080272CA
	.align 2, 0
_08027214: .4byte MakeTargetListForRangedHeal
_08027218:
	ldr r1, _08027224 @ =sub_0802474C
	adds r0, r5, #0
	bl DoUseRescueStaff
	b _080272CA
	.align 2, 0
_08027224: .4byte sub_0802474C
_08027228:
	ldr r1, _08027234 @ =sub_0802465C
	adds r0, r5, #0
	bl sub_08027CF8
	b _080272CA
	.align 2, 0
_08027234: .4byte sub_0802465C
_08027238:
	ldr r1, _0802723C @ =sub_08024858
	b _0802724A
	.align 2, 0
_0802723C: .4byte sub_08024858
_08027240:
	ldr r1, _08027244 @ =sub_08024880
	b _0802724A
	.align 2, 0
_08027244: .4byte sub_08024880
_08027248:
	ldr r1, _08027254 @ =sub_080248A8
_0802724A:
	adds r0, r5, #0
	bl sub_08027DD0
	b _080272CA
	.align 2, 0
_08027254: .4byte sub_080248A8
_08027258:
	adds r0, r5, #0
	bl sub_08027D64
	b _080272CA
_08027260:
	ldr r1, _08027268 @ =sub_0802493C
	movs r2, #0xe6
	lsls r2, r2, #3
	b _08027298
	.align 2, 0
_08027268: .4byte sub_0802493C
_0802726C:
	adds r0, r5, #0
	bl sub_080279B8
	b _080272CA
_08027274:
	adds r0, r5, #0
	bl sub_08027AE8
	b _080272CA
_0802727C:
	adds r0, r5, #0
	bl SetStaffUseAction
	b _080272CA
_08027284:
	ldr r1, _0802728C @ =MakeTargetListForDanceRing
	ldr r2, _08027290 @ =0x00000732
	b _08027298
	.align 2, 0
_0802728C: .4byte MakeTargetListForDanceRing
_08027290: .4byte 0x00000732
_08027294:
	ldr r1, _080272A0 @ =MakeTargetListForMine
	ldr r2, _080272A4 @ =0x00000733
_08027298:
	adds r0, r5, #0
	bl sub_08027A30
	b _080272CA
	.align 2, 0
_080272A0: .4byte MakeTargetListForMine
_080272A4: .4byte 0x00000733
_080272A8:
	adds r0, r5, #0
	bl sub_08028010
	b _080272CA
_080272B0:
	ldr r1, _080272BC @ =sub_08024C54
	ldr r2, _080272C0 @ =0x00000734
	adds r0, r5, #0
	bl DoUseSpecialDance
	b _080272CA
	.align 2, 0
_080272BC: .4byte sub_08024C54
_080272C0: .4byte 0x00000734
_080272C4:
	adds r0, r5, #0
	bl sub_08027674
_080272CA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start HasSelectTarget
HasSelectTarget: @ 0x080272D0
	push {lr}
	bl _call_via_r1
	bl CountTargets
	cmp r0, #0
	beq _080272E0
	movs r0, #1
_080272E0:
	pop {r1}
	bx r1

	thumb_func_start CanUnitUseHealItem
CanUnitUseHealItem: @ 0x080272E4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r5, r0
	beq _080272FC
	movs r0, #1
	b _080272FE
_080272FC:
	movs r0, #0
_080272FE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08027304
sub_08027304: @ 0x08027304
	movs r0, #0
	bx lr

	thumb_func_start sub_08027308
sub_08027308: @ 0x08027308
	adds r0, #0x31
	movs r1, #0xf0
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0x70
	beq _08027318
	movs r0, #1
	b _0802731A
_08027318:
	movs r0, #0
_0802731A:
	bx lr

	thumb_func_start sub_0802731C
sub_0802731C: @ 0x0802731C
	adds r1, r0, #0
	ldr r0, _08027338 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0802733C
	adds r1, #0x31
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _0802733C
	movs r0, #1
	b _0802733E
	.align 2, 0
_08027338: .4byte 0x0202BBF8
_0802733C:
	movs r0, #0
_0802733E:
	bx lr

	thumb_func_start sub_08027340
sub_08027340: @ 0x08027340
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	bne _08027350
	movs r0, #1
	b _08027352
_08027350:
	movs r0, #0
_08027352:
	bx lr

	thumb_func_start CanUnitUseChestKeyItem
CanUnitUseChestKeyItem: @ 0x08027354
	push {lr}
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r1, _08027384 @ =0x0202E3E0
	ldr r2, [r1]
	lsls r1, r3, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _08027388
	adds r0, r2, #0
	adds r1, r3, #0
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027388
	movs r0, #1
	b _0802738A
	.align 2, 0
_08027384: .4byte 0x0202E3E0
_08027388:
	movs r0, #0
_0802738A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CanUnitUseDoorKeyItem
CanUnitUseDoorKeyItem: @ 0x08027390
	push {lr}
	movs r1, #0x1e
	bl MakeTargetListForDoorAndBridges
	bl CountTargets
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start CanUnitOpenBridge
CanUnitOpenBridge: @ 0x080273A4
	push {lr}
	movs r1, #0x14
	bl MakeTargetListForDoorAndBridges
	bl CountTargets
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start CanUnitUseLockpickItem
CanUnitUseLockpickItem: @ 0x080273B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080273F2
	adds r0, r4, #0
	bl CanUnitUseChestKeyItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
	adds r0, r4, #0
	bl CanUnitUseDoorKeyItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
	adds r0, r4, #0
	bl CanUnitOpenBridge
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
_080273F2:
	movs r0, #0
	b _080273F8
_080273F6:
	movs r0, #1
_080273F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027400
sub_08027400: @ 0x08027400
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #9
	bgt _08027410
	b _0802756C
_08027410:
	adds r0, r1, #0
	bl GetItemIid
	subs r0, #0x63
	cmp r0, #0x33
	bls _0802741E
	b _08027556
_0802741E:
	lsls r0, r0, #2
	ldr r1, _08027428 @ =_0802742C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027428: .4byte _0802742C
_0802742C: @ jump table
	.4byte _080274FC @ case 0
	.4byte _08027504 @ case 1
	.4byte _0802750C @ case 2
	.4byte _08027514 @ case 3
	.4byte _0802751C @ case 4
	.4byte _08027556 @ case 5
	.4byte _08027556 @ case 6
	.4byte _08027556 @ case 7
	.4byte _08027556 @ case 8
	.4byte _08027556 @ case 9
	.4byte _08027556 @ case 10
	.4byte _08027556 @ case 11
	.4byte _08027556 @ case 12
	.4byte _08027556 @ case 13
	.4byte _08027556 @ case 14
	.4byte _08027556 @ case 15
	.4byte _08027556 @ case 16
	.4byte _08027556 @ case 17
	.4byte _08027556 @ case 18
	.4byte _08027556 @ case 19
	.4byte _08027556 @ case 20
	.4byte _08027556 @ case 21
	.4byte _08027556 @ case 22
	.4byte _08027556 @ case 23
	.4byte _08027556 @ case 24
	.4byte _08027556 @ case 25
	.4byte _08027556 @ case 26
	.4byte _08027556 @ case 27
	.4byte _08027556 @ case 28
	.4byte _08027556 @ case 29
	.4byte _08027556 @ case 30
	.4byte _08027556 @ case 31
	.4byte _08027556 @ case 32
	.4byte _08027556 @ case 33
	.4byte _08027556 @ case 34
	.4byte _08027556 @ case 35
	.4byte _08027524 @ case 36
	.4byte _08027556 @ case 37
	.4byte _0802752C @ case 38
	.4byte _08027556 @ case 39
	.4byte _08027548 @ case 40
	.4byte _08027556 @ case 41
	.4byte _08027556 @ case 42
	.4byte _08027556 @ case 43
	.4byte _08027556 @ case 44
	.4byte _08027556 @ case 45
	.4byte _08027556 @ case 46
	.4byte _08027556 @ case 47
	.4byte _08027556 @ case 48
	.4byte _08027556 @ case 49
	.4byte _08027556 @ case 50
	.4byte _08027554 @ case 51
_080274FC:
	ldr r4, _08027500 @ =0x08C97EDD
	b _08027556
	.align 2, 0
_08027500: .4byte 0x08C97EDD
_08027504:
	ldr r4, _08027508 @ =0x08C97EE3
	b _08027556
	.align 2, 0
_08027508: .4byte 0x08C97EE3
_0802750C:
	ldr r4, _08027510 @ =0x08C97EE8
	b _08027556
	.align 2, 0
_08027510: .4byte 0x08C97EE8
_08027514:
	ldr r4, _08027518 @ =0x08C97EED
	b _08027556
	.align 2, 0
_08027518: .4byte 0x08C97EED
_0802751C:
	ldr r4, _08027520 @ =0x08C97EF1
	b _08027556
	.align 2, 0
_08027520: .4byte 0x08C97EF1
_08027524:
	ldr r4, _08027528 @ =0x08C97EFD
	b _08027556
	.align 2, 0
_08027528: .4byte 0x08C97EFD
_0802752C:
	ldr r0, _0802753C @ =0x0202BBF8
	ldr r4, _08027540 @ =0x08C97F16
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08027556
	ldr r4, _08027544 @ =0x08C97F21
	b _08027556
	.align 2, 0
_0802753C: .4byte 0x0202BBF8
_08027540: .4byte 0x08C97F16
_08027544: .4byte 0x08C97F21
_08027548:
	ldr r4, _0802754C @ =0x08C97F29
	b _08027556
	.align 2, 0
_0802754C: .4byte 0x08C97F29
_08027550:
	movs r0, #1
	b _0802756E
_08027554:
	ldr r4, _08027574 @ =0x08C97F24
_08027556:
	ldrb r1, [r4]
	cmp r1, #0
	beq _0802756C
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
_08027560:
	cmp r0, r1
	beq _08027550
	adds r4, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _08027560
_0802756C:
	movs r0, #0
_0802756E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027574: .4byte 0x08C97F24

	thumb_func_start CanUnitUseStatGainItem
CanUnitUseStatGainItem: @ 0x08027578
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl GetItemBonuses
	adds r4, r0, #0
	ldr r6, _08027648 @ =0x03004440
	adds r0, r6, #0
	bl ClearUnit
	ldr r0, [r5]
	str r0, [r6]
	ldr r0, [r5, #4]
	str r0, [r6, #4]
	ldrb r1, [r5, #0x12]
	ldrb r2, [r4]
	adds r0, r1, r2
	strb r0, [r6, #0x12]
	ldrb r1, [r5, #0x14]
	ldrb r2, [r4, #1]
	adds r0, r1, r2
	strb r0, [r6, #0x14]
	ldrb r1, [r5, #0x15]
	ldrb r2, [r4, #2]
	adds r0, r1, r2
	strb r0, [r6, #0x15]
	ldrb r1, [r5, #0x16]
	ldrb r2, [r4, #3]
	adds r0, r1, r2
	strb r0, [r6, #0x16]
	ldrb r1, [r5, #0x17]
	ldrb r2, [r4, #4]
	adds r0, r1, r2
	strb r0, [r6, #0x17]
	ldrb r1, [r5, #0x18]
	ldrb r2, [r4, #5]
	adds r0, r1, r2
	strb r0, [r6, #0x18]
	ldrb r1, [r5, #0x19]
	ldrb r2, [r4, #6]
	adds r0, r1, r2
	strb r0, [r6, #0x19]
	ldrb r1, [r5, #0x1d]
	ldrb r2, [r4, #7]
	adds r0, r1, r2
	strb r0, [r6, #0x1d]
	ldrb r1, [r5, #0x1a]
	ldrb r4, [r4, #8]
	adds r0, r1, r4
	strb r0, [r6, #0x1a]
	adds r0, r6, #0
	bl UnitCheckStatOverflow
	movs r1, #0x12
	ldrsb r1, [r6, r1]
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	ldrb r2, [r6, #0x14]
	ldrb r1, [r5, #0x14]
	cmp r2, r1
	beq _080275FC
	movs r0, #1
_080275FC:
	ldrb r2, [r6, #0x15]
	ldrb r1, [r5, #0x15]
	cmp r2, r1
	beq _08027606
	movs r0, #1
_08027606:
	ldrb r2, [r6, #0x16]
	ldrb r1, [r5, #0x16]
	cmp r2, r1
	beq _08027610
	movs r0, #1
_08027610:
	ldrb r2, [r6, #0x17]
	ldrb r1, [r5, #0x17]
	cmp r2, r1
	beq _0802761A
	movs r0, #1
_0802761A:
	ldrb r2, [r6, #0x18]
	ldrb r1, [r5, #0x18]
	cmp r2, r1
	beq _08027624
	movs r0, #1
_08027624:
	ldrb r2, [r6, #0x19]
	ldrb r1, [r5, #0x19]
	cmp r2, r1
	beq _0802762E
	movs r0, #1
_0802762E:
	ldrb r2, [r6, #0x1d]
	ldrb r1, [r5, #0x1d]
	cmp r2, r1
	beq _08027638
	movs r0, #1
_08027638:
	ldrb r6, [r6, #0x1a]
	ldrb r5, [r5, #0x1a]
	cmp r6, r5
	beq _08027642
	movs r0, #1
_08027642:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027648: .4byte 0x03004440

	thumb_func_start SetStaffUseAction
SetStaffUseAction: @ 0x0802764C
	push {lr}
	bl HideMoveRangeGraphics
	ldr r0, _0802766C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r1, _08027670 @ =0x0203A85C
	movs r0, #3
	strb r0, [r1, #0x11]
	pop {r0}
	bx r0
	.align 2, 0
_0802766C: .4byte 0x02023C60
_08027670: .4byte 0x0203A85C

	thumb_func_start sub_08027674
sub_08027674: @ 0x08027674
	ldr r1, _0802767C @ =0x0203A85C
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_0802767C: .4byte 0x0203A85C

	thumb_func_start StaffSelectOnSelect
StaffSelectOnSelect: @ 0x08027680
	push {lr}
	ldr r2, _08027694 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0
	bl SetStaffUseAction
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027694: .4byte 0x0203A85C

	thumb_func_start DoUseRescueStaff
DoUseRescueStaff: @ 0x08027698
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _080276C8 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _080276CC @ =0x08B95BD8
	ldr r1, _080276D0 @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _080276D4 @ =0x0000072C
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080276C8: .4byte 0x0202E3E4
_080276CC: .4byte 0x08B95BD8
_080276D0: .4byte StaffSelectOnSelect
_080276D4: .4byte 0x0000072C

	thumb_func_start DoUseSpecialDance
DoUseSpecialDance: @ 0x080276D8
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _0802770C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027710 @ =0x08B95BD8
	ldr r1, _08027714 @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802770C: .4byte 0x0202E3E4
_08027710: .4byte 0x08B95BD8
_08027714: .4byte StaffSelectOnSelect

	thumb_func_start sub_08027718
sub_08027718: @ 0x08027718
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r0, _080277B8 @ =0x00000725
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartSubtitleHelp
	ldr r5, _080277BC @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl CameraMoveWatchPosition
	bl HideMoveRangeGraphics
	ldr r0, _080277C0 @ =0x03004690
	ldr r4, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl FillWarpRangeMap
	ldr r1, _080277C4 @ =0x0202BBB8
	movs r0, #0xfd
	ldrb r2, [r1, #4]
	ands r0, r2
	movs r2, #0
	mov r8, r2
	strb r0, [r1, #4]
	movs r0, #1
	bl DisplayMoveRangeGraphics
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl SetMapCursorPosition
	ldr r0, _080277C8 @ =0x08196228
	movs r1, #0
	bl StartSpriteAnim
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl SetSpriteAnimId
	str r4, [r6, #0x54]
	adds r6, #0x4a
	movs r0, #2
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080277B8: .4byte 0x00000725
_080277BC: .4byte 0x0203A85C
_080277C0: .4byte 0x03004690
_080277C4: .4byte 0x0202BBB8
_080277C8: .4byte 0x08196228

	thumb_func_start sub_080277CC
sub_080277CC: @ 0x080277CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08027844 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r1, _08027848 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
	bl HandlePlayerMapCursor
	ldr r0, _0802784C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027878
	cmp r6, #0
	beq _08027864
	adds r0, r5, #0
	bl Proc_Break
	ldr r1, _08027850 @ =0x0203A85C
	ldrh r0, [r4, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r4, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08027854 @ =0x03004690
	ldr r0, [r0]
	bl SetStaffUseAction
	ldr r0, _08027858 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0802785C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080278F0
	ldr r0, _08027860 @ =0x0000038A
	bl m4aSongNumStart
	b _080278F0
	.align 2, 0
_08027844: .4byte 0x0202BBB8
_08027848: .4byte 0x0202E3E4
_0802784C: .4byte 0x08B857F8
_08027850: .4byte 0x0203A85C
_08027854: .4byte 0x03004690
_08027858: .4byte 0x02023C60
_0802785C: .4byte 0x0202BBF8
_08027860: .4byte 0x0000038A
_08027864:
	ldr r0, _080278F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027878
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08027878:
	ldr r0, _080278FC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080278AE
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08027900 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _080278F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080278AE
	ldr r0, _08027904 @ =0x0000038B
	bl m4aSongNumStart
_080278AE:
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r1, r5, #0
	adds r1, #0x4a
	movs r4, #0
	ldrsh r2, [r1, r4]
	adds r4, r0, #0
	adds r6, r1, #0
	cmp r3, r2
	beq _080278D0
	ldr r0, [r5, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _080278CC
	movs r1, #1
_080278CC:
	bl SetSpriteAnimId
_080278D0:
	ldr r0, [r5, #0x54]
	ldr r3, _08027908 @ =0x0202BBB8
	movs r5, #0x20
	ldrsh r1, [r3, r5]
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	movs r5, #0x22
	ldrsh r2, [r3, r5]
	movs r5, #0xe
	ldrsh r3, [r3, r5]
	subs r2, r2, r3
	bl DisplaySpriteAnim
	asrs r0, r4, #0x18
	strh r0, [r6]
_080278F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080278F8: .4byte 0x0202BBF8
_080278FC: .4byte 0x08B857F8
_08027900: .4byte 0x02023C60
_08027904: .4byte 0x0000038B
_08027908: .4byte 0x0202BBB8

	thumb_func_start WarpSelect_OnConfirm
WarpSelect_OnConfirm: @ 0x0802790C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ResetTextFont
	bl HideMoveRangeGraphics
	bl EndSubtitleHelp
	ldr r4, _08027944 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027944: .4byte 0x03004690

	thumb_func_start WarpSelect_OnCancel
WarpSelect_OnCancel: @ 0x08027948
	push {lr}
	bl ResetTextFont
	bl HideMoveRangeGraphics
	bl EndSubtitleHelp
	ldr r0, _08027974 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	ldr r0, _08027978 @ =0x08B93DDC
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_08027974: .4byte 0x03004690
_08027978: .4byte 0x08B93DDC

	thumb_func_start WarpSelect_OnEnd
WarpSelect_OnEnd: @ 0x0802797C
	push {r4, lr}
	adds r4, r0, #0
	bl HideMoveRangeGraphics
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start WarpOnSelectTarget
WarpOnSelectTarget: @ 0x08027990
	push {r4, lr}
	adds r4, r1, #0
	bl EndTargetSelection
	ldr r1, _080279B0 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	ldr r0, _080279B4 @ =0x08B94194
	movs r1, #3
	bl SpawnProc
	movs r0, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080279B0: .4byte 0x0203A85C
_080279B4: .4byte 0x08B94194

	thumb_func_start sub_080279B8
sub_080279B8: @ 0x080279B8
	push {r4, lr}
	bl sub_08024908
	ldr r0, _080279FC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027A00 @ =0x08B95BD8
	ldr r1, _08027A04 @ =WarpOnSelectTarget
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _08027A08 @ =0x0000072B
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	ldr r0, _08027A0C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080279F4
	ldr r0, _08027A10 @ =0x0000038A
	bl m4aSongNumStart
_080279F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080279FC: .4byte 0x0202E3E4
_08027A00: .4byte 0x08B95BD8
_08027A04: .4byte WarpOnSelectTarget
_08027A08: .4byte 0x0000072B
_08027A0C: .4byte 0x0202BBF8
_08027A10: .4byte 0x0000038A

	thumb_func_start OnSelectPutTrap
OnSelectPutTrap: @ 0x08027A14
	push {lr}
	ldr r2, _08027A2C @ =0x0203A85C
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0
	bl SetStaffUseAction
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027A2C: .4byte 0x0203A85C

	thumb_func_start sub_08027A30
sub_08027A30: @ 0x08027A30
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _08027A74 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027A78 @ =0x08B95BB8
	ldr r1, _08027A7C @ =OnSelectPutTrap
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	ldr r0, _08027A80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027A6E
	ldr r0, _08027A84 @ =0x0000038A
	bl m4aSongNumStart
_08027A6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027A74: .4byte 0x0202E3E4
_08027A78: .4byte 0x08B95BB8
_08027A7C: .4byte OnSelectPutTrap
_08027A80: .4byte 0x0202BBF8
_08027A84: .4byte 0x0000038A

	thumb_func_start sub_08027A88
sub_08027A88: @ 0x08027A88
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	bl ResetTextFont
	ldr r5, _08027AE0 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r5, #0xd]
	ldr r0, _08027AE4 @ =0x08B958FC
	bl StartMenu
	adds r4, r0, #0
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x10
	movs r3, #0xb
	bl StartEquipInfoWindow
	ldrb r0, [r5, #0xd]
	bl GetUnit
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027AE0: .4byte 0x0203A85C
_08027AE4: .4byte 0x08B958FC

	thumb_func_start sub_08027AE8
sub_08027AE8: @ 0x08027AE8
	push {r4, lr}
	bl sub_080249C8
	ldr r0, _08027B28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027B2C @ =0x08B95C58
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027B30 @ =0x0000072E
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	ldr r0, _08027B34 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027B22
	ldr r0, _08027B38 @ =0x0000038A
	bl m4aSongNumStart
_08027B22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027B28: .4byte 0x0202E3E4
_08027B2C: .4byte 0x08B95C58
_08027B30: .4byte 0x0000072E
_08027B34: .4byte 0x0202BBF8
_08027B38: .4byte 0x0000038A

	thumb_func_start sub_08027B3C
sub_08027B3C: @ 0x08027B3C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshHammerneUnitInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027B60
sub_08027B60: @ 0x08027B60
	push {lr}
	bl StartUnitInventoryInfoWindow
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08027B6C
sub_08027B6C: @ 0x08027B6C
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl UpdateMenuItemPanel
	pop {r1}
	bx r1

	thumb_func_start sub_08027B7C
sub_08027B7C: @ 0x08027B7C
	bx lr
	.align 2, 0

	thumb_func_start RepairMenuItemIsAvailable
RepairMenuItemIsAvailable: @ 0x08027B80
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _08027B9C @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08027BA0
	movs r0, #3
	b _08027BB0
	.align 2, 0
_08027B9C: .4byte 0x0203A85C
_08027BA0:
	bl IsItemRepairable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027BAE
	movs r0, #1
	b _08027BB0
_08027BAE:
	movs r0, #2
_08027BB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RepairMenuItemDraw
RepairMenuItemDraw: @ 0x08027BB8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08027C0C @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl IsItemRepairable
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08027C10 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLineLong
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027C0C: .4byte 0x0203A85C
_08027C10: .4byte 0x02022C60

	thumb_func_start sub_08027C14
sub_08027C14: @ 0x08027C14
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08027C9A
	movs r6, #0
	ldr r0, _08027C54 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0xc1
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08027C5C
	ldr r6, _08027C58 @ =0x0000074C
	b _08027C8E
	.align 2, 0
_08027C54: .4byte 0x0203A85C
_08027C58: .4byte 0x0000074C
_08027C5C:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08027C74
	ldr r6, _08027C70 @ =0x00000741
	b _08027C8E
	.align 2, 0
_08027C70: .4byte 0x00000741
_08027C74:
	adds r0, r5, #0
	bl GetItemUses
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemMaxUses
	cmp r4, r0
	bne _08027C8A
	movs r6, #0xe8
	lsls r6, r6, #3
_08027C8A:
	cmp r6, #0
	beq _08027C96
_08027C8E:
	adds r0, r7, #0
	adds r1, r6, #0
	bl MenuFrozenHelpBox
_08027C96:
	movs r0, #8
	b _08027CAE
_08027C9A:
	ldr r1, _08027CB4 @ =0x0203A85C
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x15]
	ldr r0, _08027CB8 @ =0x03004690
	ldr r0, [r0]
	bl SetStaffUseAction
	movs r0, #0x37
_08027CAE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08027CB4: .4byte 0x0203A85C
_08027CB8: .4byte 0x03004690

	thumb_func_start sub_08027CBC
sub_08027CBC: @ 0x08027CBC
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027CEC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027CF0 @ =0x08B95B78
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027CF4 @ =0x0000072A
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027CEC: .4byte 0x0202E3E4
_08027CF0: .4byte 0x08B95B78
_08027CF4: .4byte 0x0000072A

	thumb_func_start sub_08027CF8
sub_08027CF8: @ 0x08027CF8
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027D28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027D2C @ =0x08B95B58
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027D30 @ =0x0000072D
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027D28: .4byte 0x0202E3E4
_08027D2C: .4byte 0x08B95B58
_08027D30: .4byte 0x0000072D

	thumb_func_start sub_08027D34
sub_08027D34: @ 0x08027D34
	push {lr}
	bl sub_08031E5C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027D40
sub_08027D40: @ 0x08027D40
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitHpStatusInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027D64
sub_08027D64: @ 0x08027D64
	push {r4, lr}
	bl sub_080246E0
	ldr r0, _08027D94 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027D98 @ =0x08B95B38
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027D9C @ =0x0000072F
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027D94: .4byte 0x0202E3E4
_08027D98: .4byte 0x08B95B38
_08027D9C: .4byte 0x0000072F

	thumb_func_start sub_08027DA0
sub_08027DA0: @ 0x08027DA0
	push {lr}
	bl sub_08031EF0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027DAC
sub_08027DAC: @ 0x08027DAC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitResChangeInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027DD0
sub_08027DD0: @ 0x08027DD0
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027E00 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027E04 @ =0x08B95B18
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027E08 @ =0x00000731
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027E00: .4byte 0x0202E3E4
_08027E04: .4byte 0x08B95B18
_08027E08: .4byte 0x00000731

	thumb_func_start sub_08027E0C
sub_08027E0C: @ 0x08027E0C
	push {lr}
	bl sub_08031F5C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AttackStaffMapSelect_SwitchIn
AttackStaffMapSelect_SwitchIn: @ 0x08027E18
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08027E54 @ =0x03004690
	ldr r5, [r0]
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	adds r1, r0, #0
	adds r0, r6, #0
	bl RefreshUnitStaffOffenseInfoWindow
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027E54: .4byte 0x03004690

	thumb_func_start sub_08027E58
sub_08027E58: @ 0x08027E58
	push {lr}
	bl EndSubtitleHelp
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08027E68
sub_08027E68: @ 0x08027E68
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08027E94
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	bne _08027E94
	movs r0, #1
	b _08027E96
_08027E94:
	movs r0, #0
_08027E96:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027E9C
sub_08027E9C: @ 0x08027E9C
	push {r4, lr}
	ldr r0, _08027EBC @ =0x08B95BD8
	ldr r1, _08027EC0 @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _08027EC4 @ =0x0000072C
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027EBC: .4byte 0x08B95BD8
_08027EC0: .4byte StaffSelectOnSelect
_08027EC4: .4byte 0x0000072C

