	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_IdleLoop
PlayerPhase_IdleLoop: @ 0x0801C234
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl HandlePlayerMapCursor
	ldr r4, _0801C270 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C280
	ldr r1, _0801C274 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl TrySwitchViewedUnit
	ldr r0, _0801C278 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801C268
	b _0801C498
_0801C268:
	ldr r0, _0801C27C @ =0x0000038B
	bl m4aSongNumStart
	b _0801C498
	.align 2, 0
_0801C270: .4byte 0x08B857F8
_0801C274: .4byte 0x0202BBB8
_0801C278: .4byte 0x0202BBF8
_0801C27C: .4byte 0x0000038B
_0801C280:
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C28C
	b _0801C498
_0801C28C:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C304
	ldr r4, _0801C2FC @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r5, _0801C300 @ =0x0202E3DC
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801C304
	bl GetUnit
	bl sub_0801C218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C304
	bl EndAllMus
	bl EndPlayerPhaseSideWindows
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatScreen
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0801C4C4
	.align 2, 0
_0801C2FC: .4byte 0x0202BBB8
_0801C300: .4byte 0x0202E3DC
_0801C304:
	ldr r0, _0801C344 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C3CC
	ldr r5, _0801C348 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _0801C34C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl GetPlayerSelectKind
	cmp r0, #2
	beq _0801C394
	cmp r0, #2
	ble _0801C350
	cmp r0, #3
	beq _0801C3B4
	b _0801C3CC
	.align 2, 0
_0801C344: .4byte 0x08B857F8
_0801C348: .4byte 0x0202BBB8
_0801C34C: .4byte 0x0202E3DC
_0801C350:
	cmp r0, #0
	blt _0801C3CC
	bl EndPlayerPhaseSideWindows
	ldr r0, _0801C38C @ =0x0202BBF8
	ldrh r1, [r5, #0x14]
	strb r1, [r0, #0x12]
	ldrh r1, [r5, #0x16]
	strb r1, [r0, #0x13]
	cmp r4, #0
	beq _0801C370
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C370:
	ldr r0, _0801C390 @ =0x08B95AF4
	movs r3, #0x1c
	ldrsh r1, [r5, r3]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x17
	bl StartAdjustedMenu
	bl sub_080790C0
	b _0801C486
	.align 2, 0
_0801C38C: .4byte 0x0202BBF8
_0801C390: .4byte 0x08B95AF4
_0801C394:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _0801C3B0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PidStatsAddActAmt
	adds r0, r6, #0
	bl Proc_Break
	b _0801C498
	.align 2, 0
_0801C3B0: .4byte 0x03004690
_0801C3B4:
	adds r0, r4, #0
	bl UnitBeginAction
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
	b _0801C498
_0801C3CC:
	ldr r1, _0801C42C @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #4
	ldrh r3, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq _0801C43C
	ldrh r2, [r2, #4]
	cmp r2, #4
	bne _0801C43C
	ldr r2, _0801C430 @ =0x0202BBF8
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	bne _0801C43C
	movs r0, #0x40
	ldrb r2, [r2, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0801C43C
	ldr r2, _0801C434 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801C438 @ =0x0202E3DC
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
	beq _0801C41E
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C41E:
	bl EndPlayerPhaseSideWindows
	adds r0, r6, #0
	bl sub_08032770
	b _0801C486
	.align 2, 0
_0801C42C: .4byte 0x08B857F8
_0801C430: .4byte 0x0202BBF8
_0801C434: .4byte 0x0202BBB8
_0801C438: .4byte 0x0202E3DC
_0801C43C:
	ldr r1, [r1]
	movs r0, #8
	ldrh r2, [r1, #8]
	ands r0, r2
	cmp r0, #0
	beq _0801C498
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0801C498
	ldr r2, _0801C490 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _0801C494 @ =0x0202E3DC
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
	beq _0801C47E
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C47E:
	bl EndPlayerPhaseSideWindows
	bl sub_080A3284
_0801C486:
	adds r0, r6, #0
	movs r1, #9
	bl Proc_Goto
	b _0801C4C4
	.align 2, 0
_0801C490: .4byte 0x0202BBB8
_0801C494: .4byte 0x0202E3DC
_0801C498:
	bl UnitSpriteHoverUpdate
	ldr r1, _0801C4CC @ =0x0202BBB8
	movs r0, #0x20
	ldrsh r4, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_08026064
	lsls r0, r0, #0x18
	movs r2, #0
	cmp r0, #0
	beq _0801C4BC
	movs r2, #3
_0801C4BC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutMapCursor
_0801C4C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C4CC: .4byte 0x0202BBB8
