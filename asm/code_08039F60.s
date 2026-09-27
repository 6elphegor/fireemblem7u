	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08039F60
sub_08039F60: @ 0x08039F60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r1
	ldr r0, _08039F84 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _08039FB8
	b _0803A06E
	.align 2, 0
_08039F84: .4byte 0x03004690
_08039F88:
	ldr r0, _08039FB4 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitEquippedWeaponSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	asrs r2, r1, #0x10
	mov r3, r8
	asrs r1, r3, #0x10
	ldrb r3, [r5, #0xb]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #1
	bl AiSetDecision
	movs r0, #1
	b _0803A070
	.align 2, 0
_08039FB4: .4byte 0x03004690
_08039FB8:
	ldr r0, _0803A080 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x10
	mov sb, r0
	asrs r6, r0, #0x10
	mov r1, sl
	lsls r1, r1, #0x10
	mov r8, r1
	asrs r5, r1, #0x10
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
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _0803A084 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803A06E
_0803A000:
	ldr r0, _0803A084 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803A068
	lsls r6, r7, #2
_0803A00E:
	ldr r0, _0803A080 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803A062
	ldr r5, _0803A088 @ =0x0202E3DC
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803A062
	ldr r0, _0803A08C @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A062
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, sl
	adds r2, r5, #0
	bl AiGetInRangeCombatPositionScoreComponent
	cmp r0, #0
	bne _08039F88
_0803A062:
	subs r4, #1
	cmp r4, #0
	bge _0803A00E
_0803A068:
	subs r7, #1
	cmp r7, #0
	bge _0803A000
_0803A06E:
	movs r0, #0
_0803A070:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A080: .4byte 0x0202E3E4
_0803A084: .4byte 0x0202E3D8
_0803A088: .4byte 0x0202E3DC
_0803A08C: .4byte 0x0202BD48
