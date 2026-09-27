	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcPrepUnit_Idle
ProcPrepUnit_Idle: @ 0x08093AA0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _08093AAE
	b _08093CD2
_08093AAE:
	ldr r3, _08093AFC @ =0x08B857F8
	ldr r1, [r3]
	ldrh r6, [r1, #6]
	adds r2, r5, #0
	adds r2, #0x36
	movs r4, #4
	strb r4, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _08093ACE
	ldrh r6, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_08093ACE:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08093B28
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093B04
	ldr r0, _08093B00 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08093AF2
	b _08093D4C
_08093AF2:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08093D4C
	.align 2, 0
_08093AFC: .4byte 0x08B857F8
_08093B00: .4byte 0x0202BBF8
_08093B04:
	ldr r0, _08093B20 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093B16
	ldr r0, _08093B24 @ =0x0000038A
	bl m4aSongNumStart
_08093B16:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08093D4C
	.align 2, 0
_08093B20: .4byte 0x0202BBF8
_08093B24: .4byte 0x0000038A
_08093B28:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08093B54
	ldr r0, _08093B4C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093B42
	ldr r0, _08093B50 @ =0x0000038A
	bl m4aSongNumStart
_08093B42:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08093D4C
	.align 2, 0
_08093B4C: .4byte 0x0202BBF8
_08093B50: .4byte 0x0000038A
_08093B54:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093B68
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08093D4C
_08093B68:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08093B8A
	adds r0, r5, #0
	bl PrepUnit_HandlePressA
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093B80
	b _08093D4C
_08093B80:
	adds r0, r5, #0
	movs r1, #1
	bl PrepUnit_DrawPickLeftBar
	b _08093D4C
_08093B8A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08093BB8
	ldr r0, _08093BB0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093BA4
	ldr r0, _08093BB4 @ =0x0000038B
	bl m4aSongNumStart
_08093BA4:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08093D4C
	.align 2, 0
_08093BB0: .4byte 0x0202BBF8
_08093BB4: .4byte 0x0000038B
_08093BB8:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _08093BCE
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08093BCE
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_08093BCE:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _08093BF2
	movs r0, #1
	ldrh r1, [r5, #0x2e]
	ands r0, r1
	cmp r0, #0
	bne _08093BF2
	ldrh r4, [r5, #0x2e]
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bge _08093BF2
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_08093BF2:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _08093C04
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _08093C04
	strh r0, [r5, #0x2e]
_08093C04:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08093C20
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bgt _08093C20
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_08093C20:
	ldrh r3, [r5, #0x2c]
	ldrh r7, [r5, #0x2e]
	cmp r3, r7
	bne _08093C2A
	b _08093D4C
_08093C2A:
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldr r0, _08093C98 @ =PrepUnit_DrawLeftUnitNameCur
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	ldr r0, _08093C9C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093C50
	ldr r0, _08093CA0 @ =0x00000385
	bl m4aSongNumStart
_08093C50:
	adds r0, r5, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093CA4
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _08093C70
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	subs r1, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_08093C70:
	ldrh r7, [r5, #0x2e]
	ldrh r0, [r5, #0x2c]
	cmp r7, r0
	bls _08093C84
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, #6
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_08093C84:
	movs r1, #1
	ldrh r7, [r5, #0x2e]
	ands r1, r7
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	bl SetSysHandCursorXPos
	b _08093CCA
	.align 2, 0
_08093C98: .4byte PrepUnit_DrawLeftUnitNameCur
_08093C9C: .4byte 0x0202BBF8
_08093CA0: .4byte 0x00000385
_08093CA4:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_08093CCA:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _08093D4C
_08093CD2:
	ldrh r2, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r2, r1
	bhs _08093CE6
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r3, [r5, #0x30]
	ldrb r0, [r0]
	subs r0, r3, r0
	strh r0, [r5, #0x30]
_08093CE6:
	cmp r2, r1
	bls _08093CF6
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r7, [r5, #0x30]
	ldrb r0, [r0]
	adds r0, r7, r0
	strh r0, [r5, #0x30]
_08093CF6:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093D1C
	lsrs r0, r1, #4
	subs r0, #1
	bl PrepUpdateMenuTsaScroll
	ldrh r1, [r5, #0x30]
	lsrs r0, r1, #4
	adds r0, #6
	bl PrepUpdateMenuTsaScroll
	adds r0, r5, #0
	bl sub_08093814
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_08093D1C:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl UpdateMenuScrollBarConfig
_08093D4C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
