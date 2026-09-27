	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateGameRankSaveData
GenerateGameRankSaveData: @ 0x0809F388
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	add r0, sp, #4
	movs r1, #0
	mov r8, r1
	mov r2, sb
	strh r2, [r0]
	ldr r2, _0809F494 @ =0x0100000C
	adds r1, r7, #0
	bl CpuSet
	movs r6, #1
	ldrb r0, [r7]
	orrs r0, r6
	strb r0, [r7]
	movs r0, #3
	ands r4, r0
	lsls r4, r4, #3
	movs r0, #0x19
	rsbs r0, r0, #0
	ldrb r3, [r7, #2]
	ands r0, r3
	orrs r0, r4
	ands r5, r6
	lsls r5, r5, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r7, #2]
	bl GetPartyTotalGoldValue
	movs r2, #7
	ands r2, r0
	lsls r2, r2, #5
	movs r1, #0x1f
	ldrb r3, [r7, #7]
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #7]
	lsls r0, r0, #8
	lsrs r0, r0, #0xb
	ldr r1, [r7, #8]
	ldr r2, _0809F498 @ =0xFFE00000
	ands r1, r2
	orrs r1, r0
	str r1, [r7, #8]
	ldr r2, _0809F49C @ =0x0202BBF8
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ands r0, r6
	lsls r0, r0, #6
	movs r1, #0x41
	rsbs r1, r1, #0
	ldrb r3, [r7, #2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #2]
	ldrh r2, [r2, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #7
	ldr r0, _0809F4A0 @ =0xFFFF807F
	ldrh r2, [r7, #2]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #2]
	bl GetGameTotalTime
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	mov r6, sp
	adds r6, #0xa
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl FormatTime
	ldr r1, _0809F4A4 @ =0x000003FF
	ldrh r4, [r4]
	ands r1, r4
	lsls r1, r1, #7
	ldr r0, [r7, #4]
	ldr r2, _0809F4A8 @ =0xFFFE007F
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #4]
	movs r1, #0x3f
	ldrh r5, [r5]
	ands r1, r5
	lsls r1, r1, #1
	movs r0, #0x7f
	rsbs r0, r0, #0
	ldrb r3, [r7, #6]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #6]
	movs r1, #0x3f
	ldrh r6, [r6]
	ands r1, r6
	lsls r1, r1, #7
	ldr r0, _0809F4AC @ =0xFFFFE07F
	ldrh r2, [r7, #6]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #6]
	movs r0, #0x7f
	ldrb r3, [r7, #3]
	ands r0, r3
	strb r0, [r7, #3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r7, #4]
	ands r0, r1
	strb r0, [r7, #4]
	mov r2, r8
	strb r2, [r7, #0x17]
	movs r4, #1
	b _0809F4B8
	.align 2, 0
_0809F494: .4byte 0x0100000C
_0809F498: .4byte 0xFFE00000
_0809F49C: .4byte 0x0202BBF8
_0809F4A0: .4byte 0xFFFF807F
_0809F4A4: .4byte 0x000003FF
_0809F4A8: .4byte 0xFFFE007F
_0809F4AC: .4byte 0xFFFFE07F
_0809F4B0:
	ldrb r0, [r2, #4]
	strb r0, [r7, #0x17]
	b _0809F4E0
_0809F4B6:
	adds r4, #1
_0809F4B8:
	cmp r4, #0x3f
	bgt _0809F4E0
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809F4B6
	ldr r2, [r0]
	cmp r2, #0
	beq _0809F4B6
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0809F4B6
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809F4B0
_0809F4E0:
	movs r5, #1
	movs r3, #0xc
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0x7f
	mov r8, r0
	movs r6, #0x7f
_0809F4EE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0809F548
	ldr r2, [r4]
	cmp r2, #0
	beq _0809F548
	ldr r0, [r4, #0xc]
	ldr r1, _0809F60C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809F548
	ldrb r0, [r2, #4]
	bl PidStatsGetFavval
	cmp r0, sb
	ble _0809F548
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl PidStatsGetFavval
	mov sb, r0
	ldr r0, [r4]
	ldrb r2, [r0, #4]
	movs r1, #1
	ands r1, r2
	lsls r1, r1, #7
	adds r0, r6, #0
	ldrb r3, [r7, #3]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	lsrs r2, r2, #1
	ands r2, r6
	mov r0, r8
	ands r2, r0
	movs r1, #0x80
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r7, #4]
_0809F548:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809F4EE
	bl GetGameTacticsRank
	movs r5, #7
	ands r0, r5
	lsls r0, r0, #4
	movs r1, #0x71
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl GetGameFundsRank
	ands r0, r5
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl GetGameSurvivalRank
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _0809F610 @ =0xFFFFFC7F
	ldrh r2, [r7]
	ands r1, r2
	orrs r1, r0
	strh r1, [r7]
	bl GetGameExpRank
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl GetGameCombatRank
	ands r0, r5
	movs r4, #8
	rsbs r4, r4, #0
	ldrb r1, [r7, #2]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7, #2]
	ldrb r2, [r7]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	ldrh r3, [r7]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x1d
	ldrb r3, [r7, #1]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1d
	lsrs r3, r3, #5
	lsls r4, r4, #0x1d
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl GetOverallRank
	ands r0, r5
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl GetCurCompleteChapters
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _0809F614 @ =0xFFFFF81F
	ldrh r3, [r7, #0xa]
	ands r1, r3
	orrs r1, r0
	strh r1, [r7, #0xa]
	bl GetTacticianName
	adds r1, r0, #0
	mov r0, sl
	bl strcpy
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F60C: .4byte 0x00010004
_0809F610: .4byte 0xFFFFFC7F
_0809F614: .4byte 0xFFFFF81F
