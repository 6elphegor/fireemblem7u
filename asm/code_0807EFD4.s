	.include "macro.inc"

	.syntax unified

	thumb_func_start TransferLynModeUnits
TransferLynModeUnits: @ 0x0807EFD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	movs r6, #1
	ldr r0, _0807F01C @ =0x0202BBF8
	bl RegisterChapterStats
	bl ComputeChapterRankings
	bl SaveEndgameRankings
	bl sub_0807EF90
	movs r5, #1
_0807EFF2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r5, #1
	mov r8, r5
	cmp r4, #0
	beq _0807F09C
	ldr r0, [r4]
	cmp r0, #0
	beq _0807F09C
	adds r0, r4, #0
	bl UnitLoadSupports
	ldr r5, _0807F020 @ =0x08CA0448
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807F09C
	ldr r0, [r4]
	b _0807F08A
	.align 2, 0
_0807F01C: .4byte 0x0202BBF8
_0807F020: .4byte 0x08CA0448
_0807F024:
	ldrb r0, [r5, #1]
	cmp r0, r2
	beq _0807F032
	ldrb r0, [r5, #1]
	bl GetCharacterData
	str r0, [r4]
_0807F032:
	ldr r0, [r4, #0xc]
	ldr r1, _0807F058 @ =0x00010008
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl UnitClearInventory
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0807F04A
	bl ClearFlag
_0807F04A:
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807F05E
	b _0807F078
	.align 2, 0
_0807F058: .4byte 0x00010008
_0807F05C:
	adds r6, #1
_0807F05E:
	cmp r6, #0x3f
	bgt _0807F070
	adds r0, r6, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r0, [r7]
	cmp r0, #0
	bne _0807F05C
_0807F070:
	adds r0, r4, #0
	adds r1, r7, #0
	bl CopyUnit
_0807F078:
	adds r0, r4, #0
	bl ClearUnit
	b _0807F09C
_0807F080:
	adds r5, #8
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807F09C
_0807F08A:
	ldrb r3, [r0, #4]
	cmp r3, r1
	bne _0807F080
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0807F024
_0807F09C:
	mov r5, r8
	cmp r5, #0x3f
	ble _0807EFF2
	bl ClearPidStats_ret
	ldr r1, _0807F0C0 @ =0x0202BBF8
	movs r0, #0xc
	strb r0, [r1, #0xe]
	bl CleanupUnitsBeforeChapter
	bl SavePlayThroughData
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F0C0: .4byte 0x0202BBF8
