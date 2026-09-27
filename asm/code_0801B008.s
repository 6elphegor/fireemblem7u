	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B008
sub_0801B008: @ 0x0801B008
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	ldr r0, _0801B038 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	bl GetActiveFactionOpposingAlliance
	mov sb, r0
	mov r6, sb
	adds r6, #1
	b _0801B12C
	.align 2, 0
_0801B038: .4byte 0x0202E3E8
_0801B03C:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801B128
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B128
	ldr r1, [sp]
	lsls r0, r1, #0x18
	mov r8, r0
	cmp r0, #0
	beq _0801B064
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B128
_0801B064:
	ldr r0, _0801B0F4 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801B086
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B0F8 @ =0x0202E3EC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B128
_0801B086:
	ldr r5, [r4, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0801B128
	ldr r0, [r4, #4]
	ldrb r2, [r4, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r1, r2, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl MapFloodUnitMovement
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B0FC @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r7, [r0]
	strb r5, [r0]
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp sl, r5
	beq _0801B0DE
	ldr r0, _0801B100 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r5, #0
	beq _0801B0DC
	movs r0, #1
	bl GenerateMagicSealMap
_0801B0DC:
	mov sl, r5
_0801B0DE:
	ldr r0, _0801B104 @ =0x0202E3E8
	ldr r1, [r0]
	ldr r0, _0801B108 @ =0x030041E0
	str r1, [r0]
	mov r0, r8
	cmp r0, #0
	beq _0801B10C
	adds r0, r4, #0
	bl GenerateUnitCompleteStaffRange
	b _0801B112
	.align 2, 0
_0801B0F4: .4byte 0x0202BBF8
_0801B0F8: .4byte 0x0202E3EC
_0801B0FC: .4byte 0x0202E3DC
_0801B100: .4byte 0x0202E3F4
_0801B104: .4byte 0x0202E3E8
_0801B108: .4byte 0x030041E0
_0801B10C:
	adds r0, r4, #0
	bl GenerateUnitCompleteAttackRange
_0801B112:
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B144 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
_0801B128:
	adds r6, #1
	mov r0, sb
_0801B12C:
	adds r0, #0x80
	cmp r6, r0
	bge _0801B134
	b _0801B03C
_0801B134:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B144: .4byte 0x0202E3DC
