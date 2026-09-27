	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeChapterRankings
ComputeChapterRankings: @ 0x080B6A74
	push {r4, r5, r6, lr}
	sub sp, #4
	bl GetNextChapterStatsSlot
	cmp r0, #0
	ble _080B6B3E
	ldr r6, _080B6B48 @ =0x0202BBF8
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bgt _080B6AF6
	cmp r0, #1
	blt _080B6AF6
	bl sub_080B66B4
	adds r5, r6, #0
	adds r5, #0x3e
	movs r4, #7
	ands r0, r4
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r2, [r5]
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	bl sub_080B6734
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r0
	strb r1, [r5]
	bl sub_080B6848
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [r6, #0x3c]
	ldr r2, _080B6B4C @ =0xFFFC7FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #0x3c]
	bl GetChapterCombatRank
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _080B6B50 @ =0xFFFFFE3F
	ldrh r2, [r6, #0x3c]
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x3c]
	bl sub_080B6994
	adds r2, r6, #0
	adds r2, #0x3d
	ands r0, r4
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r3, [r2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
_080B6AF6:
	ldr r5, _080B6B48 @ =0x0202BBF8
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	lsrs r1, r1, #5
	ldr r2, [r5, #0x3c]
	lsls r2, r2, #0xe
	lsrs r2, r2, #0x1d
	adds r3, r5, #0
	adds r3, #0x3d
	ldrb r3, [r3]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1d
	ldrh r6, [r5, #0x3c]
	lsls r4, r6, #0x17
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl GetOverallRank
	ldrh r2, [r5, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	adds r1, r1, r0
	cmp r1, #0xff
	ble _080B6B2E
	movs r1, #0xff
_080B6B2E:
	ldr r3, _080B6B54 @ =0x000001FF
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080B6B58 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2c]
_080B6B3E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6B48: .4byte 0x0202BBF8
_080B6B4C: .4byte 0xFFFC7FFF
_080B6B50: .4byte 0xFFFFFE3F
_080B6B54: .4byte 0x000001FF
_080B6B58: .4byte 0xFFFFE00F
