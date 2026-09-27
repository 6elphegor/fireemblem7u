	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030F54
sub_08030F54: @ 0x08030F54
	push {r4, r5, lr}
	adds r5, r0, #0
	bl HandlePlayerMapCursor
	ldr r0, _08030FB0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08030FC4
	bl EndAllMus
	ldr r0, _08030FB4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r1, _08030FB8 @ =0x0202BBB8
	movs r0, #0xf7
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, _08030FBC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030FA4
	ldr r0, _08030FC0 @ =0x0000038B
	bl m4aSongNumStart
_08030FA4:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0803106E
	.align 2, 0
_08030FB0: .4byte 0x08B857F8
_08030FB4: .4byte 0x03004690
_08030FB8: .4byte 0x0202BBB8
_08030FBC: .4byte 0x0202BBF8
_08030FC0: .4byte 0x0000038B
_08030FC4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08031018
	ldr r2, _08031074 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _08031078 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _0803107C @ =0x0202BD4C
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _08030FF6
	ldr r0, _08031080 @ =0x03004690
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_08030FF6:
	cmp r4, #0
	beq _08031018
	bl EndAllMus
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
_08031018:
	ldr r0, _08031084 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803105E
	ldr r0, _08031080 @ =0x03004690
	ldr r0, [r0]
	cmp r0, #0
	beq _0803105E
	ldr r4, _0803107C @ =0x0202BD4C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetMapCursorPosition
	ldr r0, _08031088 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803105E
	ldr r0, _0803108C @ =0x0000038B
	bl m4aSongNumStart
_0803105E:
	ldr r1, _08031074 @ =0x0202BBB8
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl PutMapCursor
_0803106E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031074: .4byte 0x0202BBB8
_08031078: .4byte 0x0202E3DC
_0803107C: .4byte 0x0202BD4C
_08031080: .4byte 0x03004690
_08031084: .4byte 0x08B857F8
_08031088: .4byte 0x0202BBF8
_0803108C: .4byte 0x0000038B

	thumb_func_start sub_08031090
sub_08031090: @ 0x08031090
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	adds r0, r4, #0
	bl EndAllProcChildren
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080310A8
sub_080310A8: @ 0x080310A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080310C4 @ =0x03004690
	ldr r2, [r5]
	cmp r2, #0
	bne _080310C8
	bl RefreshBMapGraphics
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0803111A
	.align 2, 0
_080310C4: .4byte 0x03004690
_080310C8:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _08031120 @ =0x0202E3DC
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshBMapGraphics
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0803111A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031120: .4byte 0x0202E3DC

	thumb_func_start sub_08031124
sub_08031124: @ 0x08031124
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl SyncUnitDeploymentState
	adds r0, r4, #0
	bl sub_080A4E0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08031148
sub_08031148: @ 0x08031148
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start sub_0803115C
sub_0803115C: @ 0x0803115C
	push {lr}
	sub sp, #4
	bl sub_08004234
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_0803117C
sub_0803117C: @ 0x0803117C
	push {r4, lr}
	ldr r1, _080311D0 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080311CA
	ldr r1, _080311D4 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080311CA
	ldr r0, _080311D8 @ =0x02020140
	bl InitUnitStack
	movs r4, #1
_0803119E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080311C0
	ldr r0, [r2]
	cmp r0, #0
	beq _080311C0
	ldr r0, [r2, #0xc]
	ldr r1, _080311DC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080311C0
	adds r0, r2, #0
	bl PushUnit
_080311C0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0803119E
	bl LoadPlayerUnitsFromUnitStack2
_080311CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080311D0: .4byte 0x0202BBF8
_080311D4: .4byte 0x0202BBB8
_080311D8: .4byte 0x02020140
_080311DC: .4byte 0x0001000C

	thumb_func_start EndPrepScreen
EndPrepScreen: @ 0x080311E0
	push {r4, lr}
	movs r4, #1
_080311E4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08031222
	ldr r3, [r2]
	cmp r3, #0
	beq _08031222
	ldr r1, [r2, #0xc]
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, _08031218 @ =0x02010004
	ands r0, r1
	cmp r0, #0
	bne _08031222
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0803121C
	ldrb r0, [r3, #4]
	bl PidStatsSubFavval100
	b _08031222
	.align 2, 0
_08031218: .4byte 0x02010004
_0803121C:
	ldrb r0, [r3, #4]
	bl PidStatsAddDeployAmt
_08031222:
	adds r4, #1
	cmp r4, #0x3f
	ble _080311E4
	bl sub_0803117C
	ldr r0, _0803124C @ =0x08B96460
	bl Proc_EndEach
	ldr r2, _08031250 @ =0x0202BBB8
	movs r1, #0xef
	adds r0, r1, #0
	ldrb r3, [r2, #4]
	ands r0, r3
	strb r0, [r2, #4]
	ldr r0, _08031254 @ =0x0202BBF8
	ldrb r2, [r0, #0x14]
	ands r1, r2
	strb r1, [r0, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803124C: .4byte 0x08B96460
_08031250: .4byte 0x0202BBB8
_08031254: .4byte 0x0202BBF8

	thumb_func_start sub_08031258
sub_08031258: @ 0x08031258
	push {lr}
	ldr r0, _0803126C @ =0x08B96460
	bl Proc_Find
	cmp r0, #0
	beq _08031266
	movs r0, #1
_08031266:
	pop {r1}
	bx r1
	.align 2, 0
_0803126C: .4byte 0x08B96460

	thumb_func_start CanUnitUseVisit
CanUnitUseVisit: @ 0x08031270
	push {r4, r5, r6, r7, lr}
	ldr r0, _08031284 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803128C
	b _080312EE
	.align 2, 0
_08031284: .4byte 0x03004690
_08031288:
	movs r0, #1
	b _080312F0
_0803128C:
	ldr r0, _080312F8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080312EE
_08031298:
	ldr r0, _080312F8 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _080312E8
	lsls r6, r5, #2
	lsls r7, r5, #0x18
_080312A8:
	ldr r0, _080312FC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080312E2
	ldr r0, _08031300 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	beq _080312D4
	cmp r0, #5
	beq _080312D4
	cmp r0, #0x38
	beq _080312D4
	cmp r0, #0x37
	bne _080312E2
_080312D4:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r7, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xe
	beq _08031288
_080312E2:
	subs r4, #1
	cmp r4, #0
	bge _080312A8
_080312E8:
	subs r5, #1
	cmp r5, #0
	bge _08031298
_080312EE:
	movs r0, #0
_080312F0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080312F8: .4byte 0x0202E3D8
_080312FC: .4byte 0x0202E3E4
_08031300: .4byte 0x0202E3E0

	thumb_func_start CanUnitUseSeize
CanUnitUseSeize: @ 0x08031304
	push {r4, r5, r6, lr}
	ldr r0, _08031324 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08031372
	adds r0, r2, #0
	bl sub_08034884
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803132C
	b _08031372
	.align 2, 0
_08031324: .4byte 0x03004690
_08031328:
	movs r0, #1
	b _08031374
_0803132C:
	ldr r0, _0803137C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08031372
_08031338:
	ldr r0, _0803137C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803136C
	lsls r6, r5, #0x18
_08031346:
	ldr r0, _08031380 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08031366
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r6, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xf
	beq _08031328
_08031366:
	subs r4, #1
	cmp r4, #0
	bge _08031346
_0803136C:
	subs r5, #1
	cmp r5, #0
	bge _08031338
_08031372:
	movs r0, #0
_08031374:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803137C: .4byte 0x0202E3D8
_08031380: .4byte 0x0202E3E4

	thumb_func_start CanUnitUseAttack
CanUnitUseAttack: @ 0x08031384
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _080313BC @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _080313C0 @ =0x03004690
	ldr r0, [r4]
	bl GenerateUnitCompleteAttackRange
	ldr r1, _080313C4 @ =0x02033E40
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, _080313C8 @ =AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl CountTargets
	cmp r0, #0
	beq _080313B6
	movs r0, #1
_080313B6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080313BC: .4byte 0x0202E3E8
_080313C0: .4byte 0x03004690
_080313C4: .4byte 0x02033E40
_080313C8: .4byte AddUnitToTargetListIfNotAllied

	thumb_func_start CanActiveUnitUseRescue
CanActiveUnitUseRescue: @ 0x080313CC
	push {lr}
	ldr r0, _080313E4 @ =0x03004690
	ldr r0, [r0]
	bl MakeRescueTargetList
	bl CountTargets
	cmp r0, #0
	beq _080313E0
	movs r0, #1
_080313E0:
	pop {r1}
	bx r1
	.align 2, 0
_080313E4: .4byte 0x03004690

	thumb_func_start CanActiveUnitUseTrade
CanActiveUnitUseTrade: @ 0x080313E8
	push {lr}
	ldr r0, _08031400 @ =0x03004690
	ldr r0, [r0]
	bl MakeTradeTargetList
	bl CountTargets
	cmp r0, #0
	beq _080313FC
	movs r0, #1
_080313FC:
	pop {r1}
	bx r1
	.align 2, 0
_08031400: .4byte 0x03004690

	thumb_func_start GetUnitCommandUseFlags
GetUnitCommandUseFlags: @ 0x08031404
	push {r4, lr}
	bl GetGameTime
	bl CanUnitUseVisit
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #9
	bl CanUnitUseSeize
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	orrs r4, r0
	bl CanUnitUseAttack
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	orrs r4, r0
	bl CanActiveUnitUseRescue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	orrs r4, r0
	bl CanActiveUnitUseTrade
	lsls r0, r0, #0x18
	asrs r0, r0, #1
	orrs r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08031444
sub_08031444: @ 0x08031444
	push {lr}
	ldr r0, _08031468 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrb r2, [r0, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r2, r1
	ldr r2, _0803146C @ =0x0203A85C
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapFloodUnitMovement
	bl GetUnitCommandUseFlags
	pop {r1}
	bx r1
	.align 2, 0
_08031468: .4byte 0x03004690
_0803146C: .4byte 0x0203A85C

	thumb_func_start sub_08031470
sub_08031470: @ 0x08031470
	push {r4, lr}
	ldr r4, _080314A4 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _080314A8 @ =0x03004690
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl GetUnitCommandUseFlags
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080314A4: .4byte 0x0202E3E4
_080314A8: .4byte 0x03004690

	thumb_func_start sub_080314AC
sub_080314AC: @ 0x080314AC
	push {r4, r5, r6, r7, lr}
	movs r1, #1
	rsbs r1, r1, #0
	bl GetUnitWeaponReach
	adds r7, r0, #0
	ldr r0, _08031560 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r5, #0x81
	ldr r6, _08031564 @ =0x0203A85C
_080314C6:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080314E8
	ldr r0, [r4]
	cmp r0, #0
	beq _080314E8
	adds r0, r4, #0
	adds r1, r7, #0
	bl BuildUnitStandingRangeForReach
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x13]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #0x14]
_080314E8:
	adds r5, #1
	cmp r5, #0xbf
	ble _080314C6
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _08031568 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803155A
_08031502:
	ldr r0, _08031568 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r6, #1
	cmp r4, #0
	blt _08031554
	lsls r5, r6, #2
_08031512:
	ldr r0, _0803156C @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803154E
	ldr r0, _08031570 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803154E
	ldr r0, _08031560 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803154E
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl EnlistTarget
_0803154E:
	subs r4, #1
	cmp r4, #0
	bge _08031512
_08031554:
	adds r6, r7, #0
	cmp r6, #0
	bge _08031502
_0803155A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031560: .4byte 0x0202E3F4
_08031564: .4byte 0x0203A85C
_08031568: .4byte 0x0202E3D8
_0803156C: .4byte 0x0202E3E4
_08031570: .4byte 0x0202E3DC

	thumb_func_start GetChapterInfo
GetChapterInfo: @ 0x08031574
	movs r1, #0x98
	muls r0, r1, r0
	ldr r1, _08031580 @ =0x08C9A200
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08031580: .4byte 0x08C9A200

	thumb_func_start GetChapterMap
GetChapterMap: @ 0x08031584
	push {r4, lr}
	ldr r4, _0803159C @ =0x08C9C9C8
	bl GetChapterInfo
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803159C: .4byte 0x08C9C9C8

	thumb_func_start GetChapterMapChanges
GetChapterMapChanges: @ 0x080315A0
	push {r4, lr}
	ldr r4, _080315B8 @ =0x08C9C9C8
	bl GetChapterInfo
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080315B8: .4byte 0x08C9C9C8

	thumb_func_start GetChapterEventInfo
GetChapterEventInfo: @ 0x080315BC
	push {r4, lr}
	ldr r4, _080315D4 @ =0x08C9C9C8
	bl GetChapterInfo
	adds r0, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080315D4: .4byte 0x08C9C9C8

	thumb_func_start sub_080315D8
sub_080315D8: @ 0x080315D8
	push {lr}
	bl GetChapterInfo
	adds r0, #0x74
	bl GetMsg
	pop {r1}
	bx r1

	thumb_func_start sub_080315E8
sub_080315E8: @ 0x080315E8
	ldr r1, _080315FC @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080315FC: .4byte 0x0202BBF8

	thumb_func_start sub_08031600
sub_08031600: @ 0x08031600
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _0803166C @ =0x081C4060
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, r4, #0
	adds r2, #0x62
	ldrb r2, [r2]
	adds r6, r2, r0
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	adds r0, #1
	lsls r5, r0, #3
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08031674
	bl GetGameTime
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08031682
	adds r1, r6, #0
	adds r1, #9
	adds r2, r5, #7
	ldr r3, _08031670 @ =0x08B905B0
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r4, sp
	adds r4, r4, r0
	adds r4, #4
	movs r0, #0xf
	ldrh r4, [r4]
	ands r0, r4
	lsls r0, r0, #0xc
	adds r0, #3
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b _08031682
	.align 2, 0
_0803166C: .4byte 0x081C4060
_08031670: .4byte 0x08B905B0
_08031674:
	str r2, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_080263A0
_08031682:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewUnitInfoWindow
NewUnitInfoWindow: @ 0x0803168C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080316B4 @ =0x08B96998
	bl SpawnProc
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #6
	bl InitTextDb
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080316B4: .4byte 0x08B96998

	thumb_func_start sub_080316B8
sub_080316B8: @ 0x080316B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	bl GetStringTextLen
	cmp r0, #0x27
	bgt _080316DE
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #4
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x18
	b _080316EC
_080316DE:
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #0
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x10
_080316EC:
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #0x10
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start UnitInfoWindow_DrawBase
UnitInfoWindow_DrawBase: @ 0x08031700
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	str r1, [sp, #4]
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _08031724
	ldr r0, _08031814 @ =0x08B96998
	bl Proc_Find
	adds r5, r0, #0
	bl ClearUi
_08031724:
	ldr r0, [sp, #4]
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x60
	movs r1, #0
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r4, r7, #2
	ldr r3, [sp, #0x30]
	lsls r3, r3, #1
	adds r3, #2
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x2c]
	bl DrawUiFrame2
	lsls r0, r7, #5
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _08031818 @ =0x02023460
	mov sb, r1
	add r0, sb
	ldr r1, _0803181C @ =0x08196084
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	mov r8, r4
	adds r4, r5, #0
	adds r4, #0x30
	movs r2, #0x63
	adds r2, r2, r5
	mov sl, r2
	adds r0, r7, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0x2c]
	cmp r1, #0xa
	ble _080317C0
	adds r3, r6, #0
	adds r3, #0xa
	adds r0, r6, r1
	subs r2, r0, #1
	mov sb, r0
	cmp r3, r2
	bge _080317A0
	ldr r7, _08031820 @ =0x0000100B
	mov ip, r7
	lsls r1, r3, #1
	mov r7, r8
	lsls r0, r7, #6
	ldr r7, _08031818 @ =0x02023460
	adds r0, r0, r7
	adds r1, r1, r0
	subs r3, r2, r3
_08031794:
	mov r0, ip
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08031794
_080317A0:
	mov r2, r8
	lsls r1, r2, #5
	adds r0, r1, #0
	adds r0, #9
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r7, _08031818 @ =0x02023460
	adds r0, r0, r7
	ldr r2, _08031824 @ =0x00001026
	strh r2, [r0]
	subs r1, #1
	add r1, sb
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r0, _08031828 @ =0x0000100C
	strh r0, [r1]
_080317C0:
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	bl sub_080316B8
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r1, [sp, #4]
	ldr r0, [r1]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r2, [sp, #8]
	lsls r1, r2, #5
	adds r1, #3
	adds r1, r1, r6
	lsls r1, r1, #1
	ldr r0, _0803182C @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #3
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08031814: .4byte 0x08B96998
_08031818: .4byte 0x02023460
_0803181C: .4byte 0x08196084
_08031820: .4byte 0x0000100B
_08031824: .4byte 0x00001026
_08031828: .4byte 0x0000100C
_0803182C: .4byte 0x02022C60

	thumb_func_start GetUnitInfoWindowX
GetUnitInfoWindowX: @ 0x08031830
	adds r2, r1, #0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _0803184C @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r0, #0x77
	ble _08031850
	movs r0, #0
	b _08031854
	.align 2, 0
_0803184C: .4byte 0x0202BBB8
_08031850:
	movs r0, #0x1e
	subs r0, r0, r2
_08031854:
	bx lr
	.align 2, 0

	thumb_func_start DrawUnitHpText
DrawUnitHpText: @ 0x08031858
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _080318B0 @ =0x000010F4
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _080318B4 @ =0x000012B0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080318B0: .4byte 0x000010F4
_080318B4: .4byte 0x000012B0

	thumb_func_start DrawUnitConText
DrawUnitConText: @ 0x080318B8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ClearText
	ldr r0, _080318FC @ =0x00001107
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, [r4, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r3, r0
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080318FC: .4byte 0x00001107

	thumb_func_start DrawUnitAidText
DrawUnitAidText: @ 0x08031900
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _08031934 @ =0x00001108
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitAid
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031934: .4byte 0x00001108

	thumb_func_start PutUnitAidIconForTextAt
PutUnitAidIconForTextAt: @ 0x08031938
	push {r4, lr}
	lsls r4, r2, #5
	adds r4, #4
	adds r4, r4, r1
	lsls r4, r4, #1
	ldr r1, _08031968 @ =0x02022C60
	adds r4, r4, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetAidIconFromAttributes
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031968: .4byte 0x02022C60

	thumb_func_start DrawUnitStatusText
DrawUnitStatusText: @ 0x0803196C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _080319A0 @ =0x0000110A
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawString
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080319A0: .4byte 0x0000110A

	thumb_func_start DrawUnitResChangeText
DrawUnitResChangeText: @ 0x080319A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ClearText
	ldr r0, _08031A00 @ =0x000010FF
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _08031A04 @ =0x000012B1
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r3, r3, r6
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031A00: .4byte 0x000010FF
_08031A04: .4byte 0x000012B1

	thumb_func_start DrawUnitResUnkText
DrawUnitResUnkText: @ 0x08031A08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _08031A3C @ =0x000010FF
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031A3C: .4byte 0x000010FF

	thumb_func_start DrawAccuracyText
DrawAccuracyText: @ 0x08031A40
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _08031A70 @ =0x00001104
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	adds r3, r5, #0
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031A70: .4byte 0x00001104

	thumb_func_start StartUnitInventoryInfoWindow
StartUnitInventoryInfoWindow: @ 0x08031A74
	push {r4, r5, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r4, #0x38
	movs r5, #4
_08031A80:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08031A80
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RefreshUnitInventoryInfoWindow
RefreshUnitInventoryInfoWindow: @ 0x08031A98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	bl GetUnitItemCount
	mov sl, r0
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	adds r5, r0, #0
	movs r0, #0xd
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	cmp r0, #0
	bne _08031AC6
	movs r0, #1
	str r0, [sp, #4]
_08031AC6:
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r5, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r4, r0, #0
	mov r0, sl
	cmp r0, #0
	bne _08031B10
	adds r4, #0x38
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08031B08 @ =0x0000126D
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	adds r1, r5, #0
	adds r1, #0x63
	lsls r1, r1, #1
	ldr r0, _08031B0C @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	b _08031B94
	.align 2, 0
_08031B08: .4byte 0x0000126D
_08031B0C: .4byte 0x02022C60
_08031B10:
	movs r0, #0
	mov sb, r0
	cmp sb, sl
	bge _08031B94
	ldr r3, _08031BA4 @ =0x02022C60
	adds r2, r5, #0
	adds r2, #0x61
	adds r1, r5, #0
	adds r1, #0x6b
	adds r0, r5, #0
	adds r0, #0x63
	adds r5, r4, #0
	adds r5, #0x38
	lsls r0, r0, #1
	adds r0, r0, r3
	mov r8, r0
	lsls r1, r1, #1
	adds r7, r1, r3
	lsls r2, r2, #1
	adds r6, r2, r3
_08031B38:
	mov r0, sb
	lsls r1, r0, #1
	ldr r0, [sp, #8]
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	mov r1, r8
	bl PutText
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r4, #0
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #0x80
	adds r7, #0x80
	movs r0, #0x80
	add r8, r0
	adds r5, #8
	movs r0, #1
	add sb, r0
	cmp sb, sl
	blt _08031B38
_08031B94:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031BA4: .4byte 0x02022C60

	thumb_func_start RefreshUnitStealInventoryInfoWindow
RefreshUnitStealInventoryInfoWindow: @ 0x08031BA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	str r0, [sp, #0x10]
	movs r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	movs r1, #0
	mov sl, r1
	ldr r1, [sp, #0xc]
	cmp sl, r1
	bge _08031CA6
	ldr r1, [sp, #0x10]
	adds r1, #0x6b
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x10]
	adds r1, #0x63
	str r1, [sp, #0x18]
	movs r1, #0x60
	str r1, [sp, #0x1c]
	adds r7, r0, #0
	adds r7, #0x38
_08031BF8:
	mov r1, sl
	lsls r0, r1, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemStealable
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	bl ClearText
	movs r1, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
	cmp r4, #0
	bne _08031C24
	movs r1, #1
_08031C24:
	adds r0, r7, #0
	bl Text_SetColor
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r0, _08031CB8 @ =0x02022C60
	mov r8, r0
	add r1, r8
	adds r0, r7, #0
	bl PutText
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	mov r1, r8
	adds r4, r0, r1
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	beq _08031C5A
	movs r5, #2
_08031C5A:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r4, [sp, #0x1c]
	adds r4, #1
	ldr r1, [sp, #0x10]
	adds r4, r4, r1
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r1, #0x40
	str r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	adds r0, #0x40
	str r0, [sp, #0x1c]
	adds r7, #8
	movs r1, #1
	add sl, r1
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _08031BF8
_08031CA6:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031CB8: .4byte 0x02022C60

	thumb_func_start RefreshHammerneUnitInfoWindow
RefreshHammerneUnitInfoWindow: @ 0x08031CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	movs r1, #0x10
	bl GetUnitInfoWindowX
	mov sb, r0
	movs r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	mov r2, sb
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bge _08031DE0
	mov r1, sb
	adds r1, #0x6c
	str r1, [sp, #0x14]
	mov r2, sb
	adds r2, #0x63
	str r2, [sp, #0x18]
	movs r1, #0x60
	mov sl, r1
	adds r7, r0, #0
	adds r7, #0x38
_08031D0C:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemRepairable
	movs r5, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08031D28
	movs r5, #1
_08031D28:
	adds r0, r7, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r2, _08031DF8 @ =0x02022C60
	mov r8, r2
	add r1, r8
	adds r0, r7, #0
	bl PutText
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	add r0, r8
	adds r1, r5, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	bl IsItemRepairable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08031D72
	movs r5, #2
_08031D72:
	mov r4, sl
	adds r4, #0xb
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	mov r4, sl
	adds r4, #0xe
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	mov r4, sl
	adds r4, #1
	add r4, sb
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	ldr r2, [sp, #0x14]
	adds r2, #0x40
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x40
	add sl, r1
	adds r7, #8
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08031D0C
_08031DE0:
	movs r0, #3
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031DF8: .4byte 0x02022C60

	thumb_func_start sub_08031DFC
sub_08031DFC: @ 0x08031DFC
	push {lr}
	bl NewUnitInfoWindow
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RefreshUnitHpInfoWindow
RefreshUnitHpInfoWindow: @ 0x08031E10
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawUnitHpText
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08031E58 @ =0x02022C60
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031E58: .4byte 0x02022C60

	thumb_func_start sub_08031E5C
sub_08031E5C: @ 0x08031E5C
	push {r4, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RefreshUnitHpStatusInfoWindow
RefreshUnitHpStatusInfoWindow: @ 0x08031E7C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x38
	adds r0, r6, #0
	mov r1, r8
	bl DrawUnitHpText
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r0, _08031EEC @ =0x02022C60
	mov sb, r0
	add r1, sb
	adds r0, r6, #0
	bl PutText
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, r8
	bl DrawUnitStatusText
	adds r4, #0xa1
	lsls r4, r4, #1
	add r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031EEC: .4byte 0x02022C60

	thumb_func_start sub_08031EF0
sub_08031EF0: @ 0x08031EF0
	push {lr}
	bl NewUnitInfoWindow
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RefreshUnitResChangeInfoWindow
RefreshUnitResChangeInfoWindow: @ 0x08031F04
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawUnitResChangeText
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08031F58 @ =0x02022C60
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031F58: .4byte 0x02022C60

	thumb_func_start sub_08031F5C
sub_08031F5C: @ 0x08031F5C
	push {r4, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RefreshUnitStaffOffenseInfoWindow
RefreshUnitStaffOffenseInfoWindow: @ 0x08031F7C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	movs r0, #0x38
	adds r0, r0, r5
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	mov r0, r8
	adds r1, r6, #0
	bl DrawUnitResUnkText
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _08031FF8 @ =0x02022C60
	adds r1, r1, r6
	mov r0, r8
	bl PutText
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, sb
	bl DrawAccuracyText
	adds r4, #0xa1
	lsls r4, r4, #1
	adds r4, r4, r6
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031FF8: .4byte 0x02022C60

	thumb_func_start StartUnitRescueInfoWindowsCore
StartUnitRescueInfoWindowsCore: @ 0x08031FFC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NewUnitInfoWindow
	ldr r4, _08032028 @ =0x0203A8E4
	str r0, [r4]
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	adds r0, r5, #0
	bl NewUnitInfoWindow
	str r0, [r4, #4]
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032028: .4byte 0x0203A8E4

	thumb_func_start sub_0803202C
sub_0803202C: @ 0x0803202C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	bl StartUnitRescueInfoWindowsCore
	ldr r0, _08032060 @ =0x08B90640
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartSpriteRefresher
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032060: .4byte 0x08B90640

	thumb_func_start RefreshUnitRescueInfoWindows
RefreshUnitRescueInfoWindows: @ 0x08032064
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	bl ClearUi
	ldr r6, _0803210C @ =0x0203A8E4
	ldr r0, [r6]
	ldr r5, _08032110 @ =0x03004690
	ldr r1, [r5]
	movs r7, #0xa
	str r7, [sp]
	movs r2, #1
	mov sl, r2
	str r2, [sp, #4]
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r5]
	bl DrawUnitAidText
	ldr r0, [r6]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r2, _08032114 @ =0x02022C60
	mov sb, r2
	add r1, sb
	bl PutText
	ldr r0, [r5]
	adds r1, r4, #1
	movs r2, #3
	bl PutUnitAidIconForTextAt
	ldr r0, [r6, #4]
	str r7, [sp]
	mov r1, sl
	str r1, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6, #4]
	adds r0, #0x38
	mov r1, r8
	bl DrawUnitConText
	ldr r0, [r6, #4]
	adds r0, #0x38
	ldr r2, _08032118 @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, sb
	bl PutText
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803210C: .4byte 0x0203A8E4
_08032110: .4byte 0x03004690
_08032114: .4byte 0x02022C60
_08032118: .4byte 0x00000121

	thumb_func_start RefreshUnitTakeInfoWindows
RefreshUnitTakeInfoWindows: @ 0x0803211C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	bl ClearUi
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r7, r0, #0
	ldr r6, _080321D0 @ =0x0203A8E4
	ldr r0, [r6]
	ldr r5, _080321D4 @ =0x03004690
	ldr r1, [r5]
	movs r2, #0xa
	mov sl, r2
	str r2, [sp]
	movs r2, #1
	mov sb, r2
	str r2, [sp, #4]
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r5]
	bl DrawUnitAidText
	ldr r0, [r6]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r2, _080321D8 @ =0x02022C60
	mov r8, r2
	add r1, r8
	bl PutText
	ldr r0, [r5]
	adds r1, r4, #1
	movs r2, #3
	bl PutUnitAidIconForTextAt
	ldr r0, [r6, #4]
	mov r1, sl
	str r1, [sp]
	mov r2, sb
	str r2, [sp, #4]
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6, #4]
	adds r0, #0x38
	adds r1, r7, #0
	bl DrawUnitConText
	ldr r0, [r6, #4]
	adds r0, #0x38
	ldr r2, _080321DC @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, r8
	bl PutText
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080321D0: .4byte 0x0203A8E4
_080321D4: .4byte 0x03004690
_080321D8: .4byte 0x02022C60
_080321DC: .4byte 0x00000121

	thumb_func_start sub_080321E0
sub_080321E0: @ 0x080321E0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	bl StartUnitRescueInfoWindowsCore
	ldr r0, _08032214 @ =0x08B905B8
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartSpriteRefresher
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032214: .4byte 0x08B905B8

	thumb_func_start RefreshUnitGiveInfoWindows
RefreshUnitGiveInfoWindows: @ 0x08032218
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	ldr r0, _080322CC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl ClearUi
	ldr r5, _080322D0 @ =0x0203A8E4
	ldr r0, [r5]
	movs r1, #0xa
	mov sl, r1
	str r1, [sp]
	movs r2, #1
	mov sb, r2
	str r2, [sp, #4]
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r6, #0
	bl DrawUnitConText
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _080322D4 @ =0x02022C60
	adds r1, r1, r6
	bl PutText
	ldr r0, [r5, #4]
	mov r1, sl
	str r1, [sp]
	mov r2, sb
	str r2, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r5, #4]
	adds r0, #0x38
	mov r1, r8
	bl DrawUnitAidText
	ldr r0, [r5, #4]
	adds r0, #0x38
	ldr r2, _080322D8 @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	adds r1, r1, r6
	bl PutText
	adds r1, r4, #1
	mov r0, r8
	movs r2, #9
	bl PutUnitAidIconForTextAt
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080322CC: .4byte 0x03004690
_080322D0: .4byte 0x0203A8E4
_080322D4: .4byte 0x02022C60
_080322D8: .4byte 0x00000121

	thumb_func_start PutSubtitleHelpText
PutSubtitleHelpText: @ 0x080322DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	movs r5, #0
_080322E6:
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #0x20
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #0x5c
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0x5e
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl __modsi3
	ldr r1, _08032334 @ =0x08B969A8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08032338 @ =0x00004240
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r7, #0
	ldr r3, _0803233C @ =0x08B905F8
	bl PutSprite
	adds r5, #1
	cmp r5, #8
	ble _080322E6
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032334: .4byte 0x08B969A8
_08032338: .4byte 0x00004240
_0803233C: .4byte 0x08B905F8

	thumb_func_start InitSubtitleHelpText
InitSubtitleHelpText: @ 0x08032340
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x2c]
	adds r0, #0x30
	ldr r1, _08032404 @ =0x06014800
	movs r2, #0x14
	bl InitSpriteTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _08032408 @ =0x08194694
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #1
_0803236E:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _0803236E
	cmp r5, #0
	beq _080323F2
	movs r0, #0x5e
	adds r0, r0, r7
	mov r8, r0
	adds r6, r7, #0
	adds r6, #0x5c
	ldrb r2, [r5]
	cmp r2, #1
	bls _080323E0
	adds r4, r7, #0
	adds r4, #0x48
_080323A4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawCharacter
	adds r5, r0, #0
	adds r0, r4, #0
	bl Text_GetCursor
	cmp r0, #0xe0
	ble _080323DA
	subs r5, #1
	adds r4, #8
	adds r0, r5, #0
	mov r1, sp
	bl GetCharTextLen
	adds r0, r7, #0
	adds r0, #0x48
	bl Text_GetCursor
	adds r1, r0, #0
	ldr r0, [sp]
	subs r1, r1, r0
	subs r1, #0xc0
	adds r0, r4, #0
	bl Text_SetCursor
_080323DA:
	ldrb r0, [r5]
	cmp r0, #1
	bhi _080323A4
_080323E0:
	ldr r0, [r7, #0x2c]
	bl GetStringTextLen
	adds r0, #0x10
	asrs r0, r0, #5
	adds r1, r0, #1
	mov r2, r8
	strh r1, [r2]
	strh r0, [r6]
_080323F2:
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032404: .4byte 0x06014800
_08032408: .4byte 0x08194694

	thumb_func_start SubtitleHelpDarkenerOnHBlank
SubtitleHelpDarkenerOnHBlank: @ 0x0803240C
	ldr r0, _08032434 @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	subs r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bls _08032440
	ldr r2, _08032438 @ =0x04000050
	ldr r1, _0803243C @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strb r0, [r2]
	b _08032460
	.align 2, 0
_08032434: .4byte 0x04000006
_08032438: .4byte 0x04000050
_0803243C: .4byte 0x030028AC
_08032440:
	ldr r0, _08032464 @ =0x08B969C2
	subs r1, #0x80
	adds r1, r1, r0
	ldr r0, _08032468 @ =0x0202BBB8
	adds r0, #0x38
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r2, r1, r0
	cmp r2, #0
	bge _08032456
	movs r2, #0
_08032456:
	ldr r0, _0803246C @ =0x04000050
	movs r1, #0xec
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
_08032460:
	bx lr
	.align 2, 0
_08032464: .4byte 0x08B969C2
_08032468: .4byte 0x0202BBB8
_0803246C: .4byte 0x04000050

	thumb_func_start SubtitleHelpDarkener_Init
SubtitleHelpDarkener_Init: @ 0x08032470
	push {lr}
	ldr r0, _08032484 @ =0x0202BBB8
	adds r0, #0x38
	movs r1, #8
	strb r1, [r0]
	ldr r0, _08032488 @ =SubtitleHelpDarkenerOnHBlank
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08032484: .4byte 0x0202BBB8
_08032488: .4byte SubtitleHelpDarkenerOnHBlank

	thumb_func_start sub_0803248C
sub_0803248C: @ 0x0803248C
	ldr r0, _080324A0 @ =0x0202BBB8
	adds r1, r0, #0
	adds r1, #0x38
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803249C
	subs r0, #1
	strb r0, [r1]
_0803249C:
	bx lr
	.align 2, 0
_080324A0: .4byte 0x0202BBB8

	thumb_func_start SubtitleHelpDarkener_FadeOut
SubtitleHelpDarkener_FadeOut: @ 0x080324A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080324CC @ =0x0202BBB8
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _080324C6
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_080324C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080324CC: .4byte 0x0202BBB8

	thumb_func_start SubtitleHelp_Init
SubtitleHelp_Init: @ 0x080324D0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0x1f
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _080324EC @ =0x08B969E4
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_080324EC: .4byte 0x08B969E4

	thumb_func_start SubtitleHelp_OnEnd
SubtitleHelp_OnEnd: @ 0x080324F0
	push {lr}
	ldr r0, _0803250C @ =0x0202BBB8
	ldrh r1, [r0, #0x2a]
	subs r1, #0x10
	strh r1, [r0, #0x2a]
	movs r0, #0
	bl CameraMove_801622C
	ldr r0, _08032510 @ =0x08B969E4
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_0803250C: .4byte 0x0202BBB8
_08032510: .4byte 0x08B969E4

	thumb_func_start SubtitleHelp_Loop
SubtitleHelp_Loop: @ 0x08032514
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0803255C @ =0x08B96A0C
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r5, #0
	bl PutSubtitleHelpText
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0803253A
	subs r0, r1, #1
	strh r0, [r4]
_0803253A:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032556
	movs r0, #0x1f
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08032556:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803255C: .4byte 0x08B96A0C

	thumb_func_start StartSubtitleHelp
StartSubtitleHelp: @ 0x08032560
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08032594 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #1
	beq _0803258C
	ldr r0, _08032598 @ =0x08B96A14
	adds r1, r2, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	bl InitSubtitleHelpText
	bl sub_08019B40
	ldr r1, _0803259C @ =0x0202BBB8
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
_0803258C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032594: .4byte 0x0202BBF8
_08032598: .4byte 0x08B96A14
_0803259C: .4byte 0x0202BBB8

	thumb_func_start sub_080325A0
sub_080325A0: @ 0x080325A0
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _08032604 @ =0x08405450
	ldr r1, _08032608 @ =0x06015000
	bl Decompress
	ldr r0, _0803260C @ =0x08405670
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08032610 @ =0x08B969E4
	movs r1, #3
	bl SpawnProc
	ldr r4, _08032614 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080325E0
	ldr r0, _08032618 @ =0x0000038A
	bl m4aSongNumStart
_080325E0:
	adds r3, r4, #0
	adds r3, #0x42
	ldrb r2, [r3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1f
	movs r1, #1
	subs r1, r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032604: .4byte 0x08405450
_08032608: .4byte 0x06015000
_0803260C: .4byte 0x08405670
_08032610: .4byte 0x08B969E4
_08032614: .4byte 0x0202BBF8
_08032618: .4byte 0x0000038A

	thumb_func_start sub_0803261C
sub_0803261C: @ 0x0803261C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0
	ldr r0, _080326C0 @ =0x0202BBF8
	adds r0, #0x42
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1a
	cmp r0, #0
	bge _08032638
	movs r1, #5
_08032638:
	ldr r4, _080326C4 @ =0x08B905F8
	lsls r5, r1, #0xc
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x38
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa1
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x58
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa2
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x78
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	ldr r4, _080326C8 @ =0x08B905B8
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x98
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	ldr r7, _080326CC @ =0x08B905D0
	ldr r0, _080326D0 @ =0x0000028E
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa8
	adds r2, r6, #0
	adds r3, r7, #0
	bl PutSprite
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #0x1a
	cmp r0, #0
	blt _080326D8
	ldr r0, _080326D4 @ =0x0000028F
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	b _080326FE
	.align 2, 0
_080326C0: .4byte 0x0202BBF8
_080326C4: .4byte 0x08B905F8
_080326C8: .4byte 0x08B905B8
_080326CC: .4byte 0x08B905D0
_080326D0: .4byte 0x0000028E
_080326D4: .4byte 0x0000028F
_080326D8:
	ldr r0, _0803270C @ =0x00000292
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa5
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xc0
	adds r2, r6, #0
	adds r3, r7, #0
	bl PutSprite
_080326FE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803270C: .4byte 0x00000292

	thumb_func_start sub_08032710
sub_08032710: @ 0x08032710
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08032768 @ =0x08B96A4C
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0803261C
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08032734
	subs r0, r1, #1
	strh r0, [r4]
_08032734:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1d
	bgt _08032746
	adds r0, r2, #1
	strh r0, [r1]
_08032746:
	ldrh r1, [r1]
	cmp r1, #0x1e
	bne _08032760
	ldr r0, _0803276C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08032760
	adds r0, r5, #0
	bl Proc_Break
_08032760:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032768: .4byte 0x08B96A4C
_0803276C: .4byte 0x08B857F8

	thumb_func_start sub_08032770
sub_08032770: @ 0x08032770
	push {lr}
	adds r1, r0, #0
	ldr r0, _08032794 @ =0x08B96A54
	bl SpawnProcLocking
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitSubtitleHelpText
	bl sub_08019B40
	ldr r1, _08032798 @ =0x0202BBB8
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_08032794: .4byte 0x08B96A54
_08032798: .4byte 0x0202BBB8

	thumb_func_start EndSubtitleHelp
EndSubtitleHelp: @ 0x0803279C
	push {lr}
	ldr r0, _080327A8 @ =0x08B96A14
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080327A8: .4byte 0x08B96A14

	thumb_func_start IsSubtitleHelpActive
IsSubtitleHelpActive: @ 0x080327AC
	push {lr}
	ldr r0, _080327C0 @ =0x08B96A14
	bl Proc_Find
	cmp r0, #0
	beq _080327BA
	movs r0, #1
_080327BA:
	pop {r1}
	bx r1
	.align 2, 0
_080327C0: .4byte 0x08B96A14

	thumb_func_start sub_080327C4
sub_080327C4: @ 0x080327C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _080327F8 @ =0x08B96A14
	adds r0, r5, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _080327E2
	adds r0, r5, #0
	adds r1, r6, #0
	bl SpawnProc
	adds r4, r0, #0
_080327E2:
	str r7, [r4, #0x2c]
	adds r0, r4, #0
	bl InitSubtitleHelpText
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x1f
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080327F8: .4byte 0x08B96A14

	thumb_func_start ApplyHazardHealing
ApplyHazardHealing: @ 0x080327FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	blt _08032810
	adds r0, r4, #0
	bl SetUnitStatus
_08032810:
	adds r0, r4, #0
	adds r1, r5, #0
	bl AddUnitHp
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08032828
	adds r0, r4, #0
	bl KillUnit
_08032828:
	adds r0, r6, #0
	adds r1, r4, #0
	bl DropRescueOnDeath
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RenderMapForFogFadeIfUnitDied
RenderMapForFogFadeIfUnitDied: @ 0x08032838
	push {lr}
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803284E
	ldr r0, _08032854 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0803284E
	bl RenderMapForFade
_0803284E:
	pop {r0}
	bx r0
	.align 2, 0
_08032854: .4byte 0x0202BBF8

	thumb_func_start BeginUnitHealAnim
BeginUnitHealAnim: @ 0x08032858
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r5, _08032898 @ =0x0203A3F0
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0x6b
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	ldr r0, _0803289C @ =0x0203A50C
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r5, [r5, #0x13]
	subs r0, r0, r5
	strb r0, [r1, #3]
	bl BattleHitTerminate
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032898: .4byte 0x0203A3F0
_0803289C: .4byte 0x0203A50C

	thumb_func_start BeginUnitPoisonDamageAnim
BeginUnitPoisonDamageAnim: @ 0x080328A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r5, _080328FC @ =0x0203A3F0
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _080328C6
	movs r0, #0
	strb r0, [r5, #0x13]
_080328C6:
	ldr r2, _08032900 @ =0x0203A50C
	ldr r0, [r2]
	adds r1, r5, #0
	adds r1, #0x72
	ldrb r1, [r1]
	ldrb r3, [r5, #0x13]
	subs r1, r1, r3
	strb r1, [r0, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080328E8
	ldr r1, [r2]
	movs r0, #2
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
_080328E8:
	bl BattleHitTerminate
	bl sub_0806EFC4
	adds r0, r6, #0
	bl RenderMapForFogFadeIfUnitDied
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080328FC: .4byte 0x0203A3F0
_08032900: .4byte 0x0203A50C

	thumb_func_start BeginUnitCritDamageAnim
BeginUnitCritDamageAnim: @ 0x08032904
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r5, _08032968 @ =0x0203A3F0
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _0803292A
	movs r0, #0
	strb r0, [r5, #0x13]
_0803292A:
	ldr r2, _0803296C @ =0x0203A50C
	ldr r0, [r2]
	adds r1, r5, #0
	adds r1, #0x72
	ldrb r1, [r1]
	ldrb r3, [r5, #0x13]
	subs r1, r1, r3
	strb r1, [r0, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08032954
	ldr r1, [r2]
	movs r0, #1
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #2
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
_08032954:
	bl BattleHitTerminate
	bl sub_0806F050
	adds r0, r6, #0
	bl RenderMapForFogFadeIfUnitDied
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032968: .4byte 0x0203A3F0
_0803296C: .4byte 0x0203A50C

	thumb_func_start KillAllRedUnits_Init
KillAllRedUnits_Init: @ 0x08032970
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	movs r4, #0x81
_0803297E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080329AE
	ldr r0, [r2]
	cmp r0, #0
	beq _080329AE
	ldr r0, [r2, #0xc]
	ldr r1, _080329C4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080329AE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0xb]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #0
	bl EnlistTarget
_080329AE:
	adds r4, #1
	cmp r4, #0xbf
	ble _0803297E
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080329C4: .4byte 0x0001000C

	thumb_func_start KillAllRedUnits_Loop
KillAllRedUnits_Loop: @ 0x080329C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r4, [r6, r0]
	bl CountTargets
	cmp r4, r0
	bne _080329E6
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08032A5A
_080329E6:
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl KillUnit
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	ldr r1, _08032A40 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r2, #0xf0
	bhi _08032A2A
	cmp r0, #0
	blt _08032A2A
	cmp r0, #0xa0
	ble _08032A44
_08032A2A:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08032A5A
	.align 2, 0
_08032A40: .4byte 0x0202BBB8
_08032A44:
	adds r0, r4, #0
	bl StartMu
	bl StartMuDeathFade
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r0, r5, #0
	bl Proc_Break
_08032A5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start StatusHealEffect_OverlayBg_Init
StatusHealEffect_OverlayBg_Init: @ 0x08032A60
	push {r4, r5, r6, lr}
	bl ClearUi
	ldr r0, _08032AB4 @ =0x083FE094
	ldr r1, _08032AB8 @ =0x06005000
	bl Decompress
	ldr r0, _08032ABC @ =0x083FE11C
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08032AC0 @ =0x02022C60
	ldr r1, _08032AC4 @ =0x083FE13C
	movs r2, #0xca
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_t
	adds r6, r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r4, #6
_08032A90:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #4
	bl TmCopyRect_t
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _08032A90
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032AB4: .4byte 0x083FE094
_08032AB8: .4byte 0x06005000
_08032ABC: .4byte 0x083FE11C
_08032AC0: .4byte 0x02022C60
_08032AC4: .4byte 0x083FE13C

	thumb_func_start sub_08032AC8
sub_08032AC8: @ 0x08032AC8
	push {r4, lr}
	ldr r1, _08032AF8 @ =0x0202BBB8
	ldr r0, _08032AFC @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #4
	ldrh r1, [r1, #0xc]
	subs r4, r1, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetGameTime
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032AF8: .4byte 0x0202BBB8
_08032AFC: .4byte 0x03004690

	thumb_func_start sub_08032B00
sub_08032B00: @ 0x08032B00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08032B9C @ =0x03004690
	ldr r0, [r0]
	bl HideUnitSprite
	ldr r0, _08032BA0 @ =0x03002870
	mov ip, r0
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r3, ip
	strb r0, [r3, #1]
	mov r7, ip
	adds r7, #0x36
	ldrb r0, [r7]
	ands r1, r0
	movs r2, #0x37
	add r2, ip
	mov r8, r2
	movs r0, #0x20
	ldrb r3, [r2]
	orrs r0, r3
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r1, r5
	movs r4, #5
	rsbs r4, r4, #0
	ands r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r7]
	movs r1, #1
	orrs r0, r1
	ands r0, r5
	ands r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08032BA4 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08032BA8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	adds r6, #0x4c
	movs r0, #0x40
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032B9C: .4byte 0x03004690
_08032BA0: .4byte 0x03002870
_08032BA4: .4byte 0x0000FFE0
_08032BA8: .4byte 0x0000E0FF

	thumb_func_start StatusHealEffect_BlendedSprite_Loop
StatusHealEffect_BlendedSprite_Loop: @ 0x08032BAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08032BFC @ =0x03004690
	ldr r4, [r0]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _08032C00 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	movs r6, #0xe
	ldrsh r0, [r3, r6]
	subs r2, r2, r0
	movs r3, #0xa0
	lsls r3, r3, #6
	str r4, [sp]
	movs r0, #4
	bl PutBlendWindowUnitSprite
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032BF2
	adds r0, r5, #0
	bl Proc_Break
_08032BF2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032BFC: .4byte 0x03004690
_08032C00: .4byte 0x0202BBB8

	thumb_func_start sub_08032C04
sub_08032C04: @ 0x08032C04
	push {lr}
	ldr r0, _08032C14 @ =0x03004690
	ldr r0, [r0]
	bl ShowUnitSprite
	pop {r0}
	bx r0
	.align 2, 0
_08032C14: .4byte 0x03004690

	thumb_func_start StatusHealEffect_BlendSpriteAnim_InitIn
StatusHealEffect_BlendSpriteAnim_InitIn: @ 0x08032C18
	adds r2, r0, #0
	adds r2, #0x4c
	movs r3, #0
	movs r1, #0xf
	strh r1, [r2]
	str r3, [r0, #0x2c]
	movs r1, #1
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start StatusHealEffect_BlendSpriteAnim_InitOut
StatusHealEffect_BlendSpriteAnim_InitOut: @ 0x08032C2C
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	movs r1, #0x10
	str r1, [r0, #0x2c]
	subs r1, #0x11
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_08032C40
sub_08032C40: @ 0x08032C40
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	adds r2, r2, r0
	str r2, [r4, #0x2c]
	ldr r0, _08032C94 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	mov r2, ip
	adds r2, #0x45
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032C8C
	adds r0, r4, #0
	bl Proc_Break
_08032C8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032C94: .4byte 0x03002870

	thumb_func_start sub_08032C98
sub_08032C98: @ 0x08032C98
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _08032CB8 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0x40
	beq _08032CD4
	cmp r1, #0x40
	bgt _08032CBC
	cmp r1, #0
	beq _08032CC2
	b _08032CD6
	.align 2, 0
_08032CB8: .4byte 0x03004690
_08032CBC:
	cmp r1, #0x80
	beq _08032CCC
	b _08032CD6
_08032CC2:
	ldr r2, _08032CC8 @ =0x02022BE0
	b _08032CD6
	.align 2, 0
_08032CC8: .4byte 0x02022BE0
_08032CCC:
	ldr r2, _08032CD0 @ =0x02022C00
	b _08032CD6
	.align 2, 0
_08032CD0: .4byte 0x02022C00
_08032CD4:
	ldr r2, _08032CF0 @ =0x02022C20
_08032CD6:
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032CF0: .4byte 0x02022C20

	thumb_func_start StatusHealEffect_PalSpriteAnim_SetOutlineIntensity
StatusHealEffect_PalSpriteAnim_SetOutlineIntensity: @ 0x08032CF4
	push {lr}
	adds r3, r1, #0
	cmp r3, #0x1f
	ble _08032CFE
	movs r3, #0x1f
_08032CFE:
	cmp r3, #0
	bge _08032D04
	movs r3, #0
_08032D04:
	ldr r0, _08032D1C @ =0x02022860
	lsls r1, r3, #0xa
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r2, _08032D20 @ =0x0000025E
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08032D1C: .4byte 0x02022860
_08032D20: .4byte 0x0000025E

	thumb_func_start StatusHealEffect_PalSpriteAnim_LoopIn
StatusHealEffect_PalSpriteAnim_LoopIn: @ 0x08032D24
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl StatusHealEffect_PalSpriteAnim_SetOutlineIntensity
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _08032D4A
	adds r0, r5, #0
	bl Proc_Break
_08032D4A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start StatusHealEffect_PalSpriteAnim_LoopOut
StatusHealEffect_PalSpriteAnim_LoopOut: @ 0x08032D50
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl StatusHealEffect_PalSpriteAnim_SetOutlineIntensity
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032D74
	adds r0, r5, #0
	bl Proc_Break
_08032D74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08032D7C
sub_08032D7C: @ 0x08032D7C
	push {lr}
	bl ClearUi
	ldr r3, _08032DD0 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x37
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08032DD0: .4byte 0x03002870

	thumb_func_start StartStatusHealEffect
StartStatusHealEffect: @ 0x08032DD4
	push {lr}
	adds r2, r1, #0
	ldr r1, _08032DFC @ =0x03004690
	str r0, [r1]
	cmp r2, #0
	beq _08032E08
	ldr r0, _08032E00 @ =0x08B96B74
	adds r1, r2, #0
	bl SpawnProcLocking
	ldr r0, _08032E04 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08032E10
	movs r0, #0xaa
	bl m4aSongNumStart
	b _08032E10
	.align 2, 0
_08032DFC: .4byte 0x03004690
_08032E00: .4byte 0x08B96B74
_08032E04: .4byte 0x0202BBF8
_08032E08:
	ldr r0, _08032E14 @ =0x08B96B74
	movs r1, #3
	bl SpawnProcLocking
_08032E10:
	pop {r0}
	bx r0
	.align 2, 0
_08032E14: .4byte 0x08B96B74

	thumb_func_start TerrainHealDisplay_Init
TerrainHealDisplay_Init: @ 0x08032E18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08032E34 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl sub_080242E8
	bl CountTargets
	cmp r0, #0
	bne _08032E38
	adds r0, r4, #0
	bl Proc_End
	b _08032E40
	.align 2, 0
_08032E34: .4byte 0x0202BBF8
_08032E38:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08032E40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MassEffectDisplay_Check
MassEffectDisplay_Check: @ 0x08032E48
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08032E80 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r5, r0]
	bl CountTargets
	cmp r4, r0
	bne _08032E84
	adds r0, r7, #0
	bl Proc_End
	b _08032ECA
	.align 2, 0
_08032E80: .4byte 0x0203A85C
_08032E84:
	ldr r0, _08032EB0 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08032EB8
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _08032EB4 @ =0x0202E3EC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08032EB8
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08032ECA
	.align 2, 0
_08032EB0: .4byte 0x0202BBF8
_08032EB4: .4byte 0x0202E3EC
_08032EB8:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08032ECA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_08032ECA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MassEffectDisplay_Watch
MassEffectDisplay_Watch: @ 0x08032ED0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl CameraMoveWatchPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TerrainHealDisplay_Display
TerrainHealDisplay_Display: @ 0x08032EF4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08032F20
	adds r0, r4, #0
	adds r1, r6, #0
	bl StartStatusHealEffect
	b _08032F30
_08032F20:
	adds r0, r4, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl BeginUnitHealAnim
_08032F30:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FinishDamageDisplay
FinishDamageDisplay: @ 0x08032F38
	push {lr}
	bl EndAllMus
	ldr r0, _08032F5C @ =0x0203A3F0
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08032F56
	ldr r0, _08032F60 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl ShowUnitSprite
_08032F56:
	pop {r0}
	bx r0
	.align 2, 0
_08032F5C: .4byte 0x0203A3F0
_08032F60: .4byte 0x0203A85C

	thumb_func_start TerrainHealDisplay_Next
TerrainHealDisplay_Next: @ 0x08032F64
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _08032F92
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl ApplyHazardHealing
	b _08032FA0
_08032F92:
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r5, #0
	bl ApplyHazardHealing
_08032FA0:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start PoisonDamageDisplay_Init
PoisonDamageDisplay_Init: @ 0x08032FB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08032FD4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl MakePoisonDamageTargetList
	movs r0, #4
	bl sub_08024A88
	bl CountTargets
	cmp r0, #0
	bne _08032FD8
	adds r0, r4, #0
	bl Proc_End
	b _08032FE0
	.align 2, 0
_08032FD4: .4byte 0x0202BBF8
_08032FD8:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08032FE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PoisonDamageDisplay_Display
PoisonDamageDisplay_Display: @ 0x08032FE8
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl BeginUnitPoisonDamageAnim
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start PoisonDamageDisplay_Next
PoisonDamageDisplay_Next: @ 0x08033014
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	bl ApplyHazardHealing
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, _08033080 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08033064
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033064
	bl RunWaitEvents
_08033064:
	ldr r0, _08033080 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08033078
	bl RefreshUnitSprites
_08033078:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033080: .4byte 0x0203A85C

	thumb_func_start sub_08033084
sub_08033084: @ 0x08033084
	push {r4, lr}
	adds r4, r0, #0
	bl CountTargets
	cmp r0, #0
	bne _08033098
	adds r0, r4, #0
	bl Proc_End
	b _080330A0
_08033098:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_080330A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080330A8
sub_080330A8: @ 0x080330A8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r7, r0, #0
	ldr r4, _080330F0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1c
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	cmp r5, #4
	bgt _080330EA
	cmp r5, #1
	blt _080330EA
	movs r0, #2
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatusHealEffect
_080330EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080330F0: .4byte 0x0203A85C

	thumb_func_start sub_080330F4
sub_080330F4: @ 0x080330F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08033114 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033114: .4byte 0x0203A85C

	thumb_func_start sub_08033118
sub_08033118: @ 0x08033118
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start TrapDamageDisplay_Check
TrapDamageDisplay_Check: @ 0x08033120
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08033158 @ =0x0203A85C
	ldrb r0, [r5, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r4, r0]
	bl CountTargets
	cmp r4, r0
	bne _0803315C
	adds r0, r7, #0
	bl Proc_End
	b _080331AA
	.align 2, 0
_08033158: .4byte 0x0203A85C
_0803315C:
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080331AA
	ldr r0, _08033190 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08033198
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _08033194 @ =0x0202E3EC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08033198
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _080331AA
	.align 2, 0
_08033190: .4byte 0x0202BBF8
_08033194: .4byte 0x0202E3EC
_08033198:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080331AA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_080331AA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080331B0
sub_080331B0: @ 0x080331B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r2, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	ldrh r1, [r2, #2]
	cmp r1, r0
	beq _080331DA
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl CameraMoveWatchPosition
_080331DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TrapDamageDisplay_Display
TrapDamageDisplay_Display: @ 0x080331E0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080332AE
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x64
	beq _08033238
	cmp r0, #0x64
	bgt _0803321A
	cmp r0, #6
	beq _0803328C
	cmp r0, #6
	bgt _08033214
	cmp r0, #4
	beq _08033228
	b _0803329A
_08033214:
	cmp r0, #7
	beq _08033280
	b _0803329A
_0803321A:
	cmp r0, #0x66
	beq _0803325C
	cmp r0, #0x66
	blt _0803324A
	cmp r0, #0x67
	beq _0803326E
	b _0803329A
_08033228:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl StartFireTrapAnim1
	b _0803329A
_08033238:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #3
	bl StartGasTrapAnim
	b _0803329A
_0803324A:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #2
	bl StartGasTrapAnim
	b _0803329A
_0803325C:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl StartGasTrapAnim
	b _0803329A
_0803326E:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #1
	bl StartGasTrapAnim
	b _0803329A
_08033280:
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl StartArrowTrapAnim
	b _0803329A
_0803328C:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl StartShowMapChangeAnim
_0803329A:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _080332EA
_080332AE:
	ldr r5, _080332D8 @ =0x0203A85C
	strb r1, [r5, #0xc]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl HideUnitSprite
	ldrb r0, [r5, #0x15]
	cmp r0, #5
	bhi _080332DC
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl BeginUnitPoisonDamageAnim
	b _080332EA
	.align 2, 0
_080332D8: .4byte 0x0203A85C
_080332DC:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl BeginUnitCritDamageAnim
_080332EA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start TrapDamageDisplay_Next
TrapDamageDisplay_Next: @ 0x080332F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #5
	bgt _08033322
	adds r2, r0, #0
	rsbs r2, r2, #0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #1
	bl ApplyHazardHealing
	b _08033334
_08033322:
	movs r2, #3
	ldrsb r2, [r4, r2]
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl ApplyHazardHealing
_08033334:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08033342
	bl RefreshUnitSprites
_08033342:
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetBattleForecastPanelSide
GetBattleForecastPanelSide: @ 0x08033354
	ldr r0, _08033370 @ =0x0203A470
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _08033374 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	cmp r0, #0x6f
	bgt _08033378
	movs r0, #1
	b _08033384
	.align 2, 0
_08033370: .4byte 0x0203A470
_08033374: .4byte 0x0202BBB8
_08033378:
	cmp r0, #0x70
	bgt _08033380
	movs r0, #0
	b _08033384
_08033380:
	movs r0, #1
	rsbs r0, r0, #0
_08033384:
	bx lr
	.align 2, 0

	thumb_func_start InitBattleForecastIconPaletteBuffer
InitBattleForecastIconPaletteBuffer: @ 0x08033388
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	movs r1, #3
	bl ApplyIconPalette
	movs r1, #1
	ldr r0, _08033408 @ =0x02022860
	mov sb, r0
	movs r2, #0x1f
	mov ip, r2
	ldr r0, _0803340C @ =0x0200300C
	mov r8, r0
_080333A6:
	adds r0, r1, #0
	adds r0, #0x30
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	adds r4, r0, #0
	mov r2, ip
	ands r4, r2
	asrs r3, r0, #5
	ands r3, r2
	asrs r2, r0, #0xa
	mov r0, ip
	ands r2, r0
	lsls r0, r1, #1
	adds r7, r1, #1
	mov r1, r8
	adds r5, r0, r1
	movs r6, #7
_080333CA:
	lsls r0, r2, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r4
	strh r0, [r5]
	adds r4, #3
	cmp r4, #0x1f
	ble _080333DC
	movs r4, #0x1f
_080333DC:
	adds r3, #3
	cmp r3, #0x1f
	ble _080333E4
	movs r3, #0x1f
_080333E4:
	adds r2, #3
	cmp r2, #0x1f
	ble _080333EC
	movs r2, #0x1f
_080333EC:
	adds r5, #0x20
	subs r6, #1
	cmp r6, #0
	bge _080333CA
	adds r1, r7, #0
	cmp r1, #0xf
	ble _080333A6
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033408: .4byte 0x02022860
_0803340C: .4byte 0x0200300C

	thumb_func_start InitBattleForecastLabels
InitBattleForecastLabels: @ 0x08033410
	push {r4, r5, r6, r7, lr}
	movs r7, #0
_08033414:
	lsls r5, r7, #3
	ldr r0, _08033458 @ =0x02002FDC
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #4
	bl InitText
	ldr r1, _0803345C @ =0x081C4068
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r6, [r0]
	adds r0, r6, #0
	bl GetMsg
	adds r1, r0, #0
	movs r0, #0x20
	bl GetStringTextCenteredPos
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r7, #1
	cmp r7, #5
	ble _08033414
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033458: .4byte 0x02002FDC
_0803345C: .4byte 0x081C4068

	thumb_func_start PutBattleForecastUnitName
PutBattleForecastUnitName: @ 0x08033460
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	ldr r0, [r2]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r0, r6, #0
	bl ClearText
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start PutBattleForecastItemName
PutBattleForecastItemName: @ 0x080334A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	adds r0, r2, #0
	bl GetItemName
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r0, r6, #0
	bl ClearText
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BattleForecastHitCountUpdate
BattleForecastHitCountUpdate: @ 0x080334E8
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	cmp r0, #0
	ble _08033516
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	ldr r0, [r4, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08033516
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
_08033516:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start InitBattleForecastBattleStats
InitBattleForecastBattleStats: @ 0x0803351C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r7, _08033660 @ =0x0203A3F0
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #8]
	ldr r0, _08033664 @ =0x0203A470
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #0xc]
	add r1, sp, #4
	mov r0, sp
	bl BattleGetFollowUpOrder
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
	strb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08033574
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080335D2
_08033574:
	add r5, sp, #8
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl BattleForecastHitCountUpdate
	mov r0, r8
	cmp r0, #0
	beq _08033594
	ldr r0, [sp]
	cmp r0, r7
	bne _08033594
	adds r1, r4, #0
	adds r2, r5, #0
	bl BattleForecastHitCountUpdate
_08033594:
	ldr r4, _08033660 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	ldr r1, _08033664 @ =0x0203A470
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080335B0
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_080335B0:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080335D2
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080335D2
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_080335D2:
	adds r4, r6, #0
	adds r4, #0x51
	movs r0, #0
	strb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x53
	strb r0, [r1]
	ldr r5, _08033664 @ =0x0203A470
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne _080335FC
	adds r0, r5, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033652
_080335FC:
	add r6, sp, #0xc
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl BattleForecastHitCountUpdate
	mov r0, r8
	cmp r0, #0
	beq _0803361C
	ldr r0, [sp]
	cmp r0, r5
	bne _0803361C
	adds r1, r4, #0
	adds r2, r6, #0
	bl BattleForecastHitCountUpdate
_0803361C:
	ldr r4, _08033664 @ =0x0203A470
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	ldr r1, _08033660 @ =0x0203A3F0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033634
	movs r0, #1
	strb r0, [r7]
_08033634:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08033652
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08033652
	movs r0, #1
	strb r0, [r7]
_08033652:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033660: .4byte 0x0203A3F0
_08033664: .4byte 0x0203A470

	thumb_func_start DrawBattleForecastContentsStandard
DrawBattleForecastContentsStandard: @ 0x08033668
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _080336E4 @ =0x0200373C
	ldr r1, _080336E8 @ =0x08195C2C
	movs r2, #0x90
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldr r4, _080336EC @ =0x0200323C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xf
	movs r3, #0
	bl TmFillRect_t
	adds r0, r4, #0
	adds r0, #0x46
	adds r5, r6, #0
	adds r5, #0x38
	ldr r2, _080336F0 @ =0x0203A3F0
	adds r1, r5, #0
	bl PutBattleForecastUnitName
	ldr r1, _080336F4 @ =0x000002C2
	adds r0, r4, r1
	ldr r7, _080336F8 @ =0x0203A470
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutBattleForecastUnitName
	ldr r3, _080336FC @ =0x00000342
	adds r4, r4, r3
	adds r6, #0x48
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutBattleForecastItemName
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08033700
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08033700
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r2, r7, #0
	b _0803371A
	.align 2, 0
_080336E4: .4byte 0x0200373C
_080336E8: .4byte 0x08195C2C
_080336EC: .4byte 0x0200323C
_080336F0: .4byte 0x0203A3F0
_080336F4: .4byte 0x000002C2
_080336F8: .4byte 0x0203A470
_080336FC: .4byte 0x00000342
_08033700:
	ldr r2, _08033730 @ =0x0203A470
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08033734 @ =0x0203A3F0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r1, r0
	cmp r4, #0
	bge _0803371A
	movs r4, #0
_0803371A:
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble _0803373C
	ldr r0, _08033738 @ =0x02003300
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _0803374A
	.align 2, 0
_08033730: .4byte 0x0203A470
_08033734: .4byte 0x0203A3F0
_08033738: .4byte 0x02003300
_0803373C:
	ldr r0, _080337B4 @ =0x02003300
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl PutNumberTwoChr
_0803374A:
	ldr r5, _080337B8 @ =0x02003380
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	ldr r4, _080337BC @ =0x0203A470
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	ldr r2, _080337C0 @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r1, r0
	cmp r4, #0
	bge _08033798
	movs r4, #0
_08033798:
	adds r1, r2, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _080337C4
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _080337D2
	.align 2, 0
_080337B4: .4byte 0x02003300
_080337B8: .4byte 0x02003380
_080337BC: .4byte 0x0203A470
_080337C0: .4byte 0x0203A3F0
_080337C4:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberTwoChr
_080337D2:
	ldr r5, _08033874 @ =0x0200338C
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	ldr r6, _08033878 @ =0x0203A3F0
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, _0803387C @ =0x02002FDC
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl PutText
	adds r4, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	adds r0, r4, #0
	bl PutText
	movs r0, #0xbf
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _08033880 @ =0x0203A470
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r1, _08033884 @ =0xFFFFFEF2
	adds r4, r5, r1
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl PutIcon
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033874: .4byte 0x0200338C
_08033878: .4byte 0x0203A3F0
_0803387C: .4byte 0x02002FDC
_08033880: .4byte 0x0203A470
_08033884: .4byte 0xFFFFFEF2

	thumb_func_start DrawBattleForecastContentsExtended
DrawBattleForecastContentsExtended: @ 0x08033888
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0803390C @ =0x0200373C
	ldr r1, _08033910 @ =0x08195D70
	movs r2, #0x90
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldr r7, _08033914 @ =0x0200323C
	adds r0, r7, #0
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_t
	adds r0, r7, #0
	adds r0, #0x46
	adds r4, r5, #0
	adds r4, #0x38
	ldr r2, _08033918 @ =0x0203A3F0
	adds r1, r4, #0
	bl PutBattleForecastUnitName
	ldr r1, _0803391C @ =0x000003C2
	adds r0, r7, r1
	ldr r6, _08033920 @ =0x0203A470
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutBattleForecastUnitName
	ldr r2, _08033924 @ =0x00000442
	adds r0, r7, r2
	adds r5, #0x48
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r1, r5, #0
	bl PutBattleForecastItemName
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _080338F0
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_080338F0:
	adds r2, r6, #0
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble _08033928
	adds r0, r7, #0
	adds r0, #0xc4
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _08033938
	.align 2, 0
_0803390C: .4byte 0x0200373C
_08033910: .4byte 0x08195D70
_08033914: .4byte 0x0200323C
_08033918: .4byte 0x0203A3F0
_0803391C: .4byte 0x000003C2
_08033920: .4byte 0x0203A470
_08033924: .4byte 0x00000442
_08033928:
	adds r0, r7, #0
	adds r0, #0xc4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl PutNumberTwoChr
_08033938:
	ldr r5, _080339B8 @ =0x02003380
	ldr r4, _080339BC @ =0x0203A470
	adds r0, r4, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	ldr r0, _080339C0 @ =0x0203A3F0
	adds r1, r0, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _080339C4
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _080339D2
	.align 2, 0
_080339B8: .4byte 0x02003380
_080339BC: .4byte 0x0203A470
_080339C0: .4byte 0x0203A3F0
_080339C4:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberTwoChr
_080339D2:
	ldr r5, _08033ABC @ =0x0200338C
	ldr r6, _08033AC0 @ =0x0203A3F0
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r6, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, _08033AC4 @ =0x02002FF4
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl PutText
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	bl PutText
	adds r0, r4, #0
	subs r0, #8
	movs r2, #0xbb
	lsls r2, r2, #1
	adds r1, r5, r2
	bl PutText
	adds r0, r4, #0
	adds r0, #0x10
	movs r3, #0xfb
	lsls r3, r3, #1
	adds r1, r5, r3
	bl PutText
	ldr r0, _08033AC8 @ =0x0000027E
	adds r4, r5, r0
	ldr r0, _08033ACC @ =0x0203A470
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r1, _08033AD0 @ =0xFFFFFEF2
	adds r4, r5, r1
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl PutIcon
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033ABC: .4byte 0x0200338C
_08033AC0: .4byte 0x0203A3F0
_08033AC4: .4byte 0x02002FF4
_08033AC8: .4byte 0x0000027E
_08033ACC: .4byte 0x0203A470
_08033AD0: .4byte 0xFFFFFEF2

	thumb_func_start DrawBattleForecastContents
DrawBattleForecastContents: @ 0x08033AD4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x2c]
	adds r0, #0x34
	strb r1, [r0]
	subs r0, #2
	ldrb r0, [r0]
	cmp r0, #1
	beq _08033AEE
	cmp r0, #2
	beq _08033AFC
	b _08033B08
_08033AEE:
	adds r0, r4, #0
	bl InitBattleForecastBattleStats
	adds r0, r4, #0
	bl DrawBattleForecastContentsStandard
	b _08033B08
_08033AFC:
	adds r0, r4, #0
	bl InitBattleForecastBattleStats
	adds r0, r4, #0
	bl DrawBattleForecastContentsExtended
_08033B08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetFactionBattleForecastFramePalette
GetFactionBattleForecastFramePalette: @ 0x08033B10
	cmp r0, #0x40
	beq _08033B38
	cmp r0, #0x40
	bgt _08033B1E
	cmp r0, #0
	beq _08033B28
	b _08033B42
_08033B1E:
	cmp r0, #0x80
	beq _08033B30
	cmp r0, #0xc0
	beq _08033B40
	b _08033B42
_08033B28:
	ldr r0, _08033B2C @ =0x08195BAC
	b _08033B42
	.align 2, 0
_08033B2C: .4byte 0x08195BAC
_08033B30:
	ldr r0, _08033B34 @ =0x08195BCC
	b _08033B42
	.align 2, 0
_08033B34: .4byte 0x08195BCC
_08033B38:
	ldr r0, _08033B3C @ =0x08195BEC
	b _08033B42
	.align 2, 0
_08033B3C: .4byte 0x08195BEC
_08033B40:
	ldr r0, _08033B44 @ =0x08195C0C
_08033B42:
	bx lr
	.align 2, 0
_08033B44: .4byte 0x08195C0C

	thumb_func_start InitBattleForecastFramePalettes
InitBattleForecastFramePalettes: @ 0x08033B48
	push {r4, lr}
	ldr r0, _08033B7C @ =0x0203A3F0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0xc0
	ands r0, r4
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08033B80 @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08033B84
	ands r0, r4
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08033B92
	.align 2, 0
_08033B7C: .4byte 0x0203A3F0
_08033B80: .4byte 0x0203A470
_08033B84:
	movs r0, #0xc0
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_08033B92:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08033B98
sub_08033B98: @ 0x08033B98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08033C0C @ =0x081958BC
	ldr r1, _08033C10 @ =0x06004000
	bl Decompress
	ldr r0, _08033C14 @ =0x08195F04
	ldr r4, _08033C18 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08033C1C @ =0x06015D00
	adds r0, r4, #0
	movs r2, #4
	movs r3, #2
	bl Copy2dChr
	ldr r0, _08033C20 @ =0x08195FB0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl ResetTextFont
	bl InitIcons
	bl InitBattleForecastIconPaletteBuffer
	bl InitBattleForecastLabels
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #7
	bl InitTextDb
	ldr r2, _08033C24 @ =0x0000FFFF
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	adds r1, r5, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033C0C: .4byte 0x081958BC
_08033C10: .4byte 0x06004000
_08033C14: .4byte 0x08195F04
_08033C18: .4byte 0x02020140
_08033C1C: .4byte 0x06015D00
_08033C20: .4byte 0x08195FB0
_08033C24: .4byte 0x0000FFFF

	thumb_func_start sub_08033C28
sub_08033C28: @ 0x08033C28
	push {lr}
	movs r0, #1
	rsbs r0, r0, #0
	bl UnpackUiWindowFrameGraphics2
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutBattleForecastTilemaps
PutBattleForecastTilemaps: @ 0x08033C38
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0x32
	movs r4, #0x14
	ldrb r1, [r1]
	cmp r1, #1
	bne _08033C48
	movs r4, #0x10
_08033C48:
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08033C80
	ldr r0, _08033C70 @ =0x0200323C
	ldr r1, _08033C74 @ =0x02022C60
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_t
	ldr r0, _08033C78 @ =0x0200373C
	ldr r1, _08033C7C @ =0x02023460
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_t
	b _08033C98
	.align 2, 0
_08033C70: .4byte 0x0200323C
_08033C74: .4byte 0x02022C60
_08033C78: .4byte 0x0200373C
_08033C7C: .4byte 0x02023460
_08033C80:
	ldr r0, _08033CA4 @ =0x0200323C
	ldr r1, _08033CA8 @ =0x02022C88
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_t
	ldr r0, _08033CAC @ =0x0200373C
	ldr r1, _08033CB0 @ =0x02023488
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_t
_08033C98:
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033CA4: .4byte 0x0200323C
_08033CA8: .4byte 0x02022C88
_08033CAC: .4byte 0x0200373C
_08033CB0: .4byte 0x02023488

	thumb_func_start PutBattleForecastWeaponTriangleArrows
PutBattleForecastWeaponTriangleArrows: @ 0x08033CB4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	ldr r0, _08033D50 @ =0x0203A3F0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08033CCC
	movs r6, #1
_08033CCC:
	cmp r0, #0
	bge _08033CD2
	movs r6, #2
_08033CD2:
	ldr r0, _08033D54 @ =0x0203A470
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08033CE2
	movs r5, #1
_08033CE2:
	cmp r0, #0
	bge _08033CE8
	movs r5, #2
_08033CE8:
	cmp r5, #0
	beq _08033D18
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #8
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0xb
	lsls r1, r0, #3
	movs r2, #0
	cmp r5, #2
	bne _08033D12
	movs r2, #1
_08033D12:
	adds r0, r3, #0
	bl PutSysArrow
_08033D18:
	cmp r6, #0
	beq _08033D48
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #2
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	lsls r1, r0, #3
	movs r2, #0
	cmp r6, #2
	bne _08033D42
	movs r2, #1
_08033D42:
	adds r0, r3, #0
	bl PutSysArrow
_08033D48:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033D50: .4byte 0x0203A3F0
_08033D54: .4byte 0x0203A470

	thumb_func_start PutBattleForecastMultipliers
PutBattleForecastMultipliers: @ 0x08033D58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	lsls r1, r1, #2
	movs r0, #0xff
	ldr r2, _08033DE8 @ =0x080C5A48
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r6, r0, #0xa
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r5, r0, #0xb
	subs r1, r6, #3
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r6, r1, r0
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r7, #0
	adds r4, #0x50
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _08033DBE
	adds r1, r6, #0
	adds r1, #0x48
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _08033DEC @ =0x08B905B8
	ldr r4, _08033DF0 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
_08033DBE:
	adds r4, r7, #0
	adds r4, #0x51
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _08033DE0
	adds r1, r6, #0
	adds r1, #0x18
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _08033DEC @ =0x08B905B8
	ldr r4, _08033DF0 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
_08033DE0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033DE8: .4byte 0x080C5A48
_08033DEC: .4byte 0x08B905B8
_08033DF0: .4byte 0x000022E6

	thumb_func_start UpdateBattleForecastEffectivenessPalettes
UpdateBattleForecastEffectivenessPalettes: @ 0x08033DF4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033E18
	ldr r0, _08033E14 @ =0x08B96D34
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08033E1A
	.align 2, 0
_08033E14: .4byte 0x08B96D34
_08033E18:
	movs r0, #0
_08033E1A:
	lsls r0, r0, #5
	ldr r1, _08033E44 @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033E4C
	ldr r0, _08033E48 @ =0x08B96D34
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08033E4E
	.align 2, 0
_08033E44: .4byte 0x0200300C
_08033E48: .4byte 0x08B96D34
_08033E4C:
	movs r0, #0
_08033E4E:
	lsls r0, r0, #5
	ldr r1, _08033E64 @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033E64: .4byte 0x0200300C

	thumb_func_start BattleForecast_LoopDisplay
BattleForecast_LoopDisplay: @ 0x08033E68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033EB0
	bl GetBattleForecastPanelSide
	adds r1, r0, #0
	cmp r1, #0
	beq _08033EA0
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _08033EA0
	adds r0, r4, #0
	bl Proc_Break
	b _08033ECC
_08033EA0:
	adds r0, r4, #0
	bl DrawBattleForecastContents
	adds r0, r4, #0
	bl PutBattleForecastTilemaps
	bl InitBattleForecastFramePalettes
_08033EB0:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	bne _08033ECC
	adds r0, r4, #0
	bl PutBattleForecastWeaponTriangleArrows
	adds r0, r4, #0
	bl PutBattleForecastMultipliers
	adds r0, r4, #0
	bl UpdateBattleForecastEffectivenessPalettes
_08033ECC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BattleForecast_OnNewBattle
BattleForecast_OnNewBattle: @ 0x08033ED4
	push {r4, lr}
	adds r4, r0, #0
	bl DrawBattleForecastContents
	bl GetBattleForecastPanelSide
	adds r1, r4, #0
	adds r1, #0x35
	movs r2, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x36
	strb r2, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08033EFE
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	b _08033F06
_08033EFE:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x14
	strb r0, [r1]
_08033F06:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	bl InitBattleForecastFramePalettes
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08033F18
sub_08033F18: @ 0x08033F18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	movs r1, #0x14
	mov sb, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08033F34
	movs r2, #0x10
	mov sb, r2
_08033F34:
	ldr r0, _08033F98 @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r1, _08033F9C @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08033FA0 @ =0x08B96D54
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge _08033FAC
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08033FA4 @ =0x0200323C
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
	ldr r0, _08033FA8 @ =0x0200373C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
	b _08033FCE
	.align 2, 0
_08033F98: .4byte 0x02022C60
_08033F9C: .4byte 0x02023460
_08033FA0: .4byte 0x08B96D54
_08033FA4: .4byte 0x0200323C
_08033FA8: .4byte 0x0200373C
_08033FAC:
	ldr r0, _08033FF4 @ =0x0200323C
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
	ldr r0, _08033FF8 @ =0x0200373C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
_08033FCE:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08033FE6
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_08033FE6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033FF4: .4byte 0x0200323C
_08033FF8: .4byte 0x0200373C

	thumb_func_start sub_08033FFC
sub_08033FFC: @ 0x08033FFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	movs r1, #0x14
	mov sb, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08034018
	movs r2, #0x10
	mov sb, r2
_08034018:
	ldr r0, _0803407C @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r1, _08034080 @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08034084 @ =0x08B96D58
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge _08034090
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08034088 @ =0x0200323C
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
	ldr r0, _0803408C @ =0x0200373C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
	b _080340B2
	.align 2, 0
_0803407C: .4byte 0x02022C60
_08034080: .4byte 0x02023460
_08034084: .4byte 0x08B96D58
_08034088: .4byte 0x0200323C
_0803408C: .4byte 0x0200373C
_08034090:
	ldr r0, _080340D8 @ =0x0200323C
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
	ldr r0, _080340DC @ =0x0200373C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl TmCopyRect_t
_080340B2:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080340CA
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_080340CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080340D8: .4byte 0x0200323C
_080340DC: .4byte 0x0200373C

	thumb_func_start sub_080340E0
sub_080340E0: @ 0x080340E0
	push {lr}
	ldr r0, _080340F0 @ =0x08B90D88
	bl Proc_Find
	cmp r0, #0
	bne _080340F4
	movs r0, #0
	b _080340F6
	.align 2, 0
_080340F0: .4byte 0x08B90D88
_080340F4:
	movs r0, #1
_080340F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartFightPreview
StartFightPreview: @ 0x080340FC
	push {r4, lr}
	ldr r0, _08034114 @ =0x0202BBF8
	adds r4, r0, #0
	adds r4, #0x42
	ldrb r1, [r4]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _08034118
	bl ResetTextFont
	b _08034158
	.align 2, 0
_08034114: .4byte 0x0202BBF8
_08034118:
	ldr r0, _0803413C @ =0x08B96D5C
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x33
	movs r0, #0
	strb r0, [r2]
	ldrb r4, [r4]
	lsls r0, r4, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08034140
	cmp r0, #1
	beq _08034146
	b _0803414C
	.align 2, 0
_0803413C: .4byte 0x08B96D5C
_08034140:
	adds r1, #0x32
	movs r0, #1
	b _0803414A
_08034146:
	adds r1, #0x32
	movs r0, #2
_0803414A:
	strb r0, [r1]
_0803414C:
	ldr r0, _08034160 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
_08034158:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034160: .4byte 0x0202E3E4

	thumb_func_start UpdateBattleForecastContents
UpdateBattleForecastContents: @ 0x08034164
	push {lr}
	ldr r0, _08034188 @ =0x08B96D5C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08034184
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08034184
	adds r1, #0x34
	movs r0, #1
	strb r0, [r1]
_08034184:
	pop {r0}
	bx r0
	.align 2, 0
_08034188: .4byte 0x08B96D5C

	thumb_func_start CloseBattleForecast
CloseBattleForecast: @ 0x0803418C
	push {r4, lr}
	ldr r0, _080341B4 @ =0x08B96D5C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080341C0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080341B8
	bl ClearUi
	adds r0, r4, #0
	bl Proc_End
	b _080341C0
	.align 2, 0
_080341B4: .4byte 0x08B96D5C
_080341B8:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080341C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartBattleForecastHelpBox
StartBattleForecastHelpBox: @ 0x080341C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08034214 @ =0x08B96D5C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08034238
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08034238
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r5, #0x14
	cmp r0, #0
	bge _080341F8
	movs r5, #0
_080341F8:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	beq _08034218
	cmp r0, #2
	beq _0803422C
	b _08034238
	.align 2, 0
_08034214: .4byte 0x08B96D5C
_08034218:
	ldr r0, _08034228 @ =0x08CC2568
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl StartMovingHelpBoxExt
	b _08034238
	.align 2, 0
_08034228: .4byte 0x08CC2568
_0803422C:
	ldr r0, _08034240 @ =0x08CC2610
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl StartMovingHelpBoxExt
_08034238:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034240: .4byte 0x08CC2610

	thumb_func_start GetBkselHelpBoxMsg
GetBkselHelpBoxMsg: @ 0x08034244
	lsls r1, r1, #0x18
	movs r2, #0
	cmp r1, #0
	beq _0803424E
	movs r2, #3
_0803424E:
	cmp r0, #0
	bge _08034254
	adds r2, #2
_08034254:
	cmp r0, #0
	ble _0803425A
	adds r2, #1
_0803425A:
	ldr r0, _08034264 @ =0x08B96DD4
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_08034264: .4byte 0x08B96DD4

	thumb_func_start HbPopulate_BkselWTriEffA
HbPopulate_BkselWTriEffA: @ 0x08034268
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08034290 @ =0x08B96D5C
	bl Proc_Find
	ldr r1, _08034294 @ =0x0203A3F0
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x52
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl GetBkselHelpBoxMsg
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034290: .4byte 0x08B96D5C
_08034294: .4byte 0x0203A3F0

	thumb_func_start HbPopulate_BkselWTriEffB
HbPopulate_BkselWTriEffB: @ 0x08034298
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080342C0 @ =0x08B96D5C
	bl Proc_Find
	ldr r1, _080342C4 @ =0x0203A470
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x53
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl GetBkselHelpBoxMsg
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080342C0: .4byte 0x08B96D5C
_080342C4: .4byte 0x0203A470

	thumb_func_start RegisterTrapDeathBWL
RegisterTrapDeathBWL: @ 0x080342C8
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0xa
	bgt _080342DE
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl PidStatsRecordLoseData
_080342DE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080342E4
sub_080342E4: @ 0x080342E4
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl StartFireTrapAnim1
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080342FC
sub_080342FC: @ 0x080342FC
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_0801EDC0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ApplyTrapDamageAnim
ApplyTrapDamageAnim: @ 0x08034314
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08034338
	cmp r0, #1
	bgt _0803432C
	cmp r0, #0
	beq _08034332
	b _0803435A
_0803432C:
	cmp r0, #2
	beq _08034350
	b _0803435A
_08034332:
	bl EndAllMus
	b _0803435A
_08034338:
	bl EndAllMus
	ldr r0, _0803434C @ =0x03004690
	ldr r0, [r0]
	bl StartMu
	bl SetAutoMuDefaultFacing
	b _0803435A
	.align 2, 0
_0803434C: .4byte 0x03004690
_08034350:
	adds r0, r4, #0
	bl GetUnitMu
	bl EndMu
_0803435A:
	ldr r1, _08034370 @ =0x0203A85C
	movs r0, #0xa
	strb r0, [r1, #0x15]
	adds r0, r4, #0
	movs r1, #0xa
	bl BeginUnitCritDamageAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034370: .4byte 0x0203A85C

	thumb_func_start ApplyTrapDamageReal
ApplyTrapDamageReal: @ 0x08034374
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x54]
	movs r2, #0xa
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r4, #0
	bl ApplyHazardHealing
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080343B2
	ldr r5, _080343B8 @ =0x03004690
	ldr r6, [r5]
	str r4, [r5]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #3
	bl PidStatsRecordDefeatInfo
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080343B0
	bl RunWaitEvents
_080343B0:
	str r6, [r5]
_080343B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080343B8: .4byte 0x03004690

	thumb_func_start GetPickTrapType
GetPickTrapType: @ 0x080343BC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _08034426
	ldrb r3, [r0, #2]
	cmp r3, #4
	beq _080343E6
	cmp r3, #4
	bgt _080343E0
	cmp r3, #1
	beq _08034426
	b _0803442A
_080343E0:
	cmp r3, #0xb
	beq _080343FC
	b _0803442A
_080343E6:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0803442A
	movs r0, #0xe
	b _0803442C
_080343FC:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0803441E
	adds r0, r4, #0
	bl GetUnitItemCount
	cmp r0, #5
	beq _08034426
	movs r0, #0xf
	b _0803442C
_0803441E:
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _0803442A
_08034426:
	movs r0, #0
	b _0803442C
_0803442A:
	adds r0, r3, #0
_0803442C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ExecTrap
ExecTrap: @ 0x08034434
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl GetPickTrapType
	cmp r0, #0xb
	beq _08034464
	cmp r0, #0xb
	bgt _08034450
	cmp r0, #8
	beq _0803445A
	b _08034510
_08034450:
	cmp r0, #0xe
	beq _0803448C
	cmp r0, #0xf
	beq _080344CC
	b _08034510
_0803445A:
	ldr r0, _08034460 @ =0x08B96DE0
	b _08034478
	.align 2, 0
_08034460: .4byte 0x08B96DE0
_08034464:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	bl sub_0802BA98
	bl RemoveTrap
	ldr r0, _08034488 @ =0x08B96E30
_08034478:
	adds r1, r6, #0
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x50
	strh r4, [r0]
	str r5, [r1, #0x54]
	b _08034510
	.align 2, 0
_08034488: .4byte 0x08B96E30
_0803448C:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _080344C4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080344AE
	movs r0, #0xb1
	bl m4aSongNumStart
_080344AE:
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _080344C8 @ =0x0000071A
	bl GetMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	b _08034510
	.align 2, 0
_080344C4: .4byte 0x0202BBF8
_080344C8: .4byte 0x0000071A
_080344CC:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _08034518 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080344EE
	movs r0, #0xb1
	bl m4aSongNumStart
_080344EE:
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, _0803451C @ =0x0000071B
	bl GetMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	movs r0, #0x79
	bl CreateItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
_08034510:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034518: .4byte 0x0202BBF8
_0803451C: .4byte 0x0000071B

	thumb_func_start HandlePostActionTraps
HandlePostActionTraps: @ 0x08034520
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08034540 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitCurrentHp
	cmp r0, #0
	ble _0803453A
	ldr r0, [r4]
	bl GetPickTrapType
	cmp r0, #0
	bne _08034544
_0803453A:
	movs r0, #1
	b _0803456C
	.align 2, 0
_08034540: .4byte 0x03004690
_08034544:
	ldr r1, _08034574 @ =0x0203A85C
	movs r0, #1
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x11]
	movs r0, #3
	bl WriteSuspendSave
	bl GetBattleAnimKind
	cmp r0, #1
	bne _0803455E
	bl RefreshUnitSprites
_0803455E:
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0803456C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08034574: .4byte 0x0203A85C

	thumb_func_start ExecTrapAfterWarp
ExecTrapAfterWarp: @ 0x08034578
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08034598 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08034598: .4byte 0x0203A85C

	thumb_func_start ExecTrapAfterDropAction
ExecTrapAfterDropAction: @ 0x0803459C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetPickTrapType
	cmp r0, #0
	beq _080345BC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080345D4
_080345BC:
	adds r0, r4, #0
	bl GetUnitMu
	bl EndMu
	bl RenderMap
	bl RefreshEntityMaps
	bl ForceSyncUnitSpriteSheet
	movs r0, #1
_080345D4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ExecTrapAfterDeathDrop
ExecTrapAfterDeathDrop: @ 0x080345DC
	push {lr}
	movs r2, #3
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start LoadChapterTraps
LoadChapterTraps: @ 0x080345EC
	push {r4, r5, lr}
	sub sp, #4
	bl sub_080791F0
	adds r5, r0, #0
	b _0803468A
_080345F8:
	ldrb r0, [r5]
	subs r1, r0, #1
	adds r2, r0, #0
	cmp r1, #0xa
	bhi _08034688
	lsls r0, r1, #2
	ldr r1, _0803460C @ =_08034610
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803460C: .4byte _08034610
_08034610: @ jump table
	.4byte _0803463C @ case 0
	.4byte _08034688 @ case 1
	.4byte _08034688 @ case 2
	.4byte _08034648 @ case 3
	.4byte _08034656 @ case 4
	.4byte _08034688 @ case 5
	.4byte _08034688 @ case 6
	.4byte _08034668 @ case 7
	.4byte _08034672 @ case 8
	.4byte _08034688 @ case 9
	.4byte _0803467E @ case 10
_0803463C:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddBallista
	b _08034688
_08034648:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #4]
	ldrb r3, [r5, #5]
	bl AddFireTile
	b _08034688
_08034656:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGasTrap
	b _08034688
_08034668:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	bl AddTrap8
	b _08034688
_08034672:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddTrap9
	b _08034688
_0803467E:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	movs r3, #0
	bl AddTrap
_08034688:
	adds r5, #6
_0803468A:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080345F8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start GetRiddenBallistaAt
GetRiddenBallistaAt: @ 0x08034698
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _080346AA
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _080346AE
_080346AA:
	movs r0, #0
	b _080346B0
_080346AE:
	movs r0, #1
_080346B0:
	cmp r0, #0
	beq _080346BC
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080346C0
_080346BC:
	movs r0, #0
	b _080346C2
_080346C0:
	adds r0, r1, #0
_080346C2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetBallistaItemAt
GetBallistaItemAt: @ 0x080346C8
	push {lr}
	bl GetTrapAt
	adds r2, r0, #0
	cmp r2, #0
	beq _080346DA
	ldrb r0, [r2, #2]
	cmp r0, #1
	beq _080346DE
_080346DA:
	movs r1, #0
	b _080346E0
_080346DE:
	movs r1, #1
_080346E0:
	cmp r1, #0
	beq _08034700
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08034700
	cmp r2, #0
	beq _080346F6
	ldrb r1, [r2, #2]
	cmp r1, #1
	beq _080346FA
_080346F6:
	movs r1, #0
	b _080346FC
_080346FA:
	movs r1, #1
_080346FC:
	cmp r1, #0
	bne _08034704
_08034700:
	movs r0, #0
	b _0803470A
_08034704:
	lsls r0, r0, #8
	ldrb r2, [r2, #3]
	orrs r0, r2
_0803470A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetSomeBallistaItemAt
GetSomeBallistaItemAt: @ 0x08034710
	push {lr}
	bl GetTrapAt
	cmp r0, #0
	beq _08034720
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _08034724
_08034720:
	movs r1, #0
	b _08034726
_08034724:
	movs r1, #1
_08034726:
	cmp r1, #0
	beq _08034730
	ldrb r1, [r0, #3]
	cmp r1, #0
	bne _08034734
_08034730:
	movs r0, #0
	b _0803473A
_08034734:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r1, r0
_0803473A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AddBallista
AddBallista: @ 0x08034740
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	movs r2, #1
	movs r3, #0
	bl AddTrap
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemIid
	movs r6, #0
	strb r0, [r4, #3]
	adds r0, r5, #0
	bl CreateItem
	bl GetItemUses
	strb r0, [r4, #6]
	strb r6, [r4, #5]
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RideBallista
RideBallista: @ 0x08034770
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	adds r4, r0, #0
	movs r0, #1
	strb r0, [r4, #5]
	bl RefreshUnitSprites
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	bl GetTrap
	subs r4, r4, r0
	asrs r4, r4, #3
	strb r4, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TryRemoveUnitFromBallista
TryRemoveUnitFromBallista: @ 0x080347A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080347D8
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldr r1, [r4, #0xc]
	ldr r2, _080347E0 @ =0xFFFFF7FF
	ands r1, r2
	str r1, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #5]
	strb r1, [r4, #0x1c]
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
	bl RefreshUnitSprites
_080347D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080347E0: .4byte 0xFFFFF7FF

	thumb_func_start sub_080347E4
sub_080347E4: @ 0x080347E4
	cmp r0, #0
	beq _080347F2
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080347F2
	movs r0, #1
	b _080347F4
_080347F2:
	movs r0, #0
_080347F4:
	bx lr
	.align 2, 0

	thumb_func_start sub_080347F8
sub_080347F8: @ 0x080347F8
	adds r1, r0, #0
	cmp r1, #0
	beq _08034804
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08034808
_08034804:
	movs r0, #0
	b _0803480A
_08034808:
	movs r0, #1
_0803480A:
	cmp r0, #0
	beq _0803481A
	movs r0, #6
	ldrsb r0, [r1, r0]
	lsls r0, r0, #8
	ldrb r1, [r1, #3]
	orrs r0, r1
	b _0803481C
_0803481A:
	movs r0, #0
_0803481C:
	bx lr
	.align 2, 0

	thumb_func_start sub_08034820
sub_08034820: @ 0x08034820
	cmp r0, #0
	beq _0803482A
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _0803482E
_0803482A:
	movs r1, #0
	b _08034830
_0803482E:
	movs r1, #1
_08034830:
	cmp r1, #0
	beq _08034838
	ldrb r0, [r0, #3]
	b _0803483A
_08034838:
	movs r0, #0
_0803483A:
	bx lr

	thumb_func_start sub_0803483C
sub_0803483C: @ 0x0803483C
	cmp r0, #0
	beq _08034846
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _0803484A
_08034846:
	movs r1, #0
	b _0803484C
_0803484A:
	movs r1, #1
_0803484C:
	cmp r1, #0
	beq _08034858
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803485A
_08034858:
	movs r0, #0
_0803485A:
	bx lr

	thumb_func_start ClearBallistaOccupied
ClearBallistaOccupied: @ 0x0803485C
	movs r1, #0
	strb r1, [r0, #5]
	bx lr
	.align 2, 0

	thumb_func_start SetBallistaOccupied
SetBallistaOccupied: @ 0x08034864
	movs r1, #1
	strb r1, [r0, #5]
	bx lr
	.align 2, 0

	thumb_func_start GetCurrentPromotedLevelBonus
GetCurrentPromotedLevelBonus: @ 0x0803486C
	ldr r1, _0803487C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08034880
	movs r0, #9
	b _08034882
	.align 2, 0
_0803487C: .4byte 0x0202BBF8
_08034880:
	movs r0, #0x13
_08034882:
	bx lr

	thumb_func_start sub_08034884
sub_08034884: @ 0x08034884
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #2
	beq _080348A2
	cmp r0, #2
	bgt _08034896
	cmp r0, #1
	beq _0803489E
	b _080348A6
_08034896:
	cmp r0, #3
	bne _080348A6
	movs r2, #1
	b _080348A8
_0803489E:
	movs r2, #2
	b _080348A8
_080348A2:
	movs r2, #3
	b _080348A8
_080348A6:
	movs r2, #0
_080348A8:
	ldr r0, _080348BC @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080348CA
	cmp r0, #2
	bgt _080348C0
	cmp r0, #1
	beq _080348C6
	b _080348D2
	.align 2, 0
_080348BC: .4byte 0x0202BBF8
_080348C0:
	cmp r0, #3
	beq _080348CE
	b _080348D2
_080348C6:
	movs r1, #1
	b _080348D4
_080348CA:
	movs r1, #2
	b _080348D4
_080348CE:
	movs r1, #3
	b _080348D4
_080348D2:
	movs r1, #4
_080348D4:
	movs r0, #0
	cmp r2, r1
	bne _080348DC
	movs r0, #1
_080348DC:
	bx lr
	.align 2, 0

	thumb_func_start AiPhase_Begin
AiPhase_Begin: @ 0x080348E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803493C @ =0x0203A8EC
	adds r3, r2, #0
	adds r3, #0x7b
	movs r1, #0
	movs r0, #1
	strb r0, [r3]
	adds r3, #3
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x78
	strb r1, [r0]
	ldr r5, _08034940 @ =0x081D3A60
	ldr r4, _08034944 @ =0x0202BBF8
	movs r3, #0
	movs r1, #7
	adds r0, #0x15
_08034906:
	strb r3, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _08034906
	adds r1, r2, #0
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	bl AiUpdateUnitsSeekHealing
	bl SetupUnitInventoryAIFlags
	ldr r0, _08034948 @ =0x08B96ED4
	adds r1, r6, #0
	bl SpawnProcLocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803493C: .4byte 0x0203A8EC
_08034940: .4byte 0x081D3A60
_08034944: .4byte 0x0202BBF8
_08034948: .4byte 0x08B96ED4

	thumb_func_start AiPhaseBerserkInit
AiPhaseBerserkInit: @ 0x0803494C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0803499C @ =0x0203A8EC
	adds r2, r0, #0
	adds r2, #0x7b
	movs r1, #4
	strb r1, [r2]
	adds r2, #3
	movs r1, #0xff
	strb r1, [r2]
	adds r1, r0, #0
	ldr r5, _080349A0 @ =0x081D3A60
	ldr r4, _080349A4 @ =0x0202BBF8
	movs r0, #0
	movs r3, #7
	adds r2, r1, #0
	adds r2, #0x8d
_0803496E:
	strb r0, [r2]
	subs r2, #1
	subs r3, #1
	cmp r3, #0
	bge _0803496E
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	bl AiUpdateUnitsSeekHealing
	bl SetupUnitInventoryAIFlags
	ldr r0, _080349A8 @ =0x08B96EEC
	adds r1, r6, #0
	bl SpawnProcLocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803499C: .4byte 0x0203A8EC
_080349A0: .4byte 0x081D3A60
_080349A4: .4byte 0x0202BBF8
_080349A8: .4byte 0x08B96EEC

	thumb_func_start AiPhaseCleanup
AiPhaseCleanup: @ 0x080349AC
	ldr r0, _080349B8 @ =0x0203A8EC
	adds r0, #0x7b
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080349B8: .4byte 0x0203A8EC

	thumb_func_start CpOrderMain
CpOrderMain: @ 0x080349BC
	push {r4, lr}
	ldr r4, _080349DC @ =0x08B96F0C
	ldr r2, _080349E0 @ =0x0203A8EC
	adds r2, #0x78
	ldrb r1, [r2]
	adds r3, r1, #1
	strb r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	adds r1, r1, r4
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080349DC: .4byte 0x08B96F0C
_080349E0: .4byte 0x0203A8EC

	thumb_func_start sub_080349E4
sub_080349E4: @ 0x080349E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	movs r5, #0
	ldr r0, _08034A70 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _08034A74 @ =0x081D3658
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08034A48
	adds r7, r1, #0
	adds r4, r2, #1
_08034A10:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08034A3E
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	bne _08034A3E
	ldr r0, [r2, #0xc]
	ldr r1, _08034A78 @ =0x00000427
	ands r0, r1
	cmp r0, #0
	bne _08034A3E
	ldr r0, _08034A7C @ =0x0203A8EC
	adds r0, r5, r0
	strb r4, [r0]
	adds r5, #1
_08034A3E:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _08034A10
_08034A48:
	cmp r5, #0
	beq _08034A64
	ldr r0, _08034A7C @ =0x0203A8EC
	adds r2, r5, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _08034A80 @ =0x030047A0
	ldr r0, _08034A84 @ =AiDecideMain
	str r0, [r1]
	ldr r0, _08034A88 @ =0x08B96F44
	mov r1, r8
	bl SpawnProcLocking
_08034A64:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034A70: .4byte 0x0202BBF8
_08034A74: .4byte 0x081D3658
_08034A78: .4byte 0x00000427
_08034A7C: .4byte 0x0203A8EC
_08034A80: .4byte 0x030047A0
_08034A84: .4byte AiDecideMain
_08034A88: .4byte 0x08B96F44

	thumb_func_start CpOrderFunc_BeginDecide
CpOrderFunc_BeginDecide: @ 0x08034A8C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl BuildAiUnitList
	adds r4, r0, #0
	cmp r4, #0
	beq _08034AB6
	bl SortAiUnitList
	ldr r0, _08034ABC @ =0x0203A8EC
	adds r2, r4, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _08034AC0 @ =0x030047A0
	ldr r0, _08034AC4 @ =AiDecideMain
	str r0, [r1]
	ldr r0, _08034AC8 @ =0x08B96F44
	adds r1, r5, #0
	bl SpawnProcLocking
_08034AB6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034ABC: .4byte 0x0203A8EC
_08034AC0: .4byte 0x030047A0
_08034AC4: .4byte AiDecideMain
_08034AC8: .4byte 0x08B96F44

	thumb_func_start GetUnitBattleAiPriority
GetUnitBattleAiPriority: @ 0x08034ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08034B4A
_08034AE2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034AFE
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034B36
_08034AFE:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08034B5C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08034B36
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _08034B2C
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08034B36
_08034B2C:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_08034B36:
	adds r6, #1
	cmp r6, #4
	bgt _08034B4A
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08034AE2
_08034B4A:
	cmp r7, #0
	beq _08034B52
	movs r0, #0x28
	b _08034B62
_08034B52:
	mov r0, r8
	cmp r0, #0
	bne _08034B60
	movs r0, #0x57
	b _08034B62
_08034B5C:
	movs r0, #0x48
	b _08034B62
_08034B60:
	movs r0, #0x14
_08034B62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08034B6C
sub_08034B6C: @ 0x08034B6C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x1d
	ldrsb r1, [r5, r1]
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, r0
	adds r0, r5, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r6, r2, #0
	ldr r3, [r5]
	ldr r0, [r5, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08034BA2
	adds r0, r4, #0
	subs r0, #0x95
	b _08034BDE
_08034BA2:
	movs r0, #1
	ldrb r7, [r5, #0xa]
	ands r0, r7
	cmp r0, #0
	bne _08034BDC
	lsls r0, r2, #8
	adds r4, r4, r0
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08034BBE
	adds r0, r4, #0
	adds r0, #0x3c
	b _08034BDE
_08034BBE:
	ldrb r0, [r3, #4]
	cmp r0, r6
	beq _08034BCE
	movs r0, #0x80
	lsls r0, r0, #6
	ands r1, r0
	cmp r1, #0
	beq _08034BD4
_08034BCE:
	adds r0, r4, #0
	adds r0, #0x57
	b _08034BDE
_08034BD4:
	adds r0, r5, #0
	bl GetUnitBattleAiPriority
	adds r4, r4, r0
_08034BDC:
	adds r0, r4, #0
_08034BDE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start BuildAiUnitList
BuildAiUnitList: @ 0x08034BE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r5, #0
	ldr r0, _08034C70 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	ldr r0, _08034C74 @ =0x08B96ED0
	ldr r0, [r0]
	mov r8, r0
	mov r1, sp
	ldr r0, _08034C78 @ =0x081D3658
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08034C60
	adds r7, r1, #0
	adds r4, r2, #1
_08034C14:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08034C56
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08034C56
	cmp r1, #4
	beq _08034C56
	ldr r0, [r2, #0xc]
	ldr r1, _08034C7C @ =0x00000427
	ands r0, r1
	cmp r0, #0
	bne _08034C56
	ldr r0, _08034C80 @ =0x0203A8EC
	adds r0, r5, r0
	strb r4, [r0]
	adds r0, r2, #0
	bl sub_08034B6C
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	adds r5, #1
_08034C56:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _08034C14
_08034C60:
	adds r0, r5, #0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08034C70: .4byte 0x0202BBF8
_08034C74: .4byte 0x08B96ED0
_08034C78: .4byte 0x081D3658
_08034C7C: .4byte 0x00000427
_08034C80: .4byte 0x0203A8EC

	thumb_func_start SortAiUnitList
SortAiUnitList: @ 0x08034C84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	cmp r0, #1
	ble _08034CDA
	movs r5, #0
	subs r0, #2
	cmp r5, r0
	bgt _08034CDA
	mov ip, r0
	ldr r1, _08034CE8 @ =0x08B96ED0
	mov sb, r1
	ldr r1, _08034CEC @ =0x0203A8EC
	mov r8, r1
_08034CA2:
	adds r4, r0, #0
	adds r6, r5, #1
	cmp r0, r5
	blt _08034CD2
	mov r7, sb
	mov r1, r8
	adds r3, r0, r1
_08034CB0:
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	bls _08034CCA
	str r1, [r0]
	str r2, [r0, #4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	strb r0, [r3]
	strb r1, [r3, #1]
_08034CCA:
	subs r3, #1
	subs r4, #1
	cmp r4, r5
	bge _08034CB0
_08034CD2:
	adds r5, r6, #0
	mov r0, ip
	cmp r5, r0
	ble _08034CA2
_08034CDA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034CE8: .4byte 0x08B96ED0
_08034CEC: .4byte 0x0203A8EC

	thumb_func_start sub_08034CF0
sub_08034CF0: @ 0x08034CF0
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08034CFC
sub_08034CFC: @ 0x08034CFC
	push {lr}
	ldr r0, _08034D14 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08034D1C
	ldr r1, _08034D18 @ =0x0203A85C
	movs r0, #3
	b _08034D20
	.align 2, 0
_08034D14: .4byte 0x03004690
_08034D18: .4byte 0x0203A85C
_08034D1C:
	ldr r1, _08034D2C @ =0x0203A85C
	movs r0, #2
_08034D20:
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_08034D2C: .4byte 0x0203A85C

	thumb_func_start sub_08034D30
sub_08034D30: @ 0x08034D30
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
_08034D34:
	ldr r4, _08034D78 @ =0x0203A8EC
	adds r0, r4, #0
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r4, #0x74]
	ldrb r0, [r2]
	cmp r0, #0
	beq _08034E24
	adds r0, r4, #0
	adds r0, #0x7c
	strb r1, [r0]
	ldr r1, _08034D7C @ =0x0202BD48
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r1, r0, #0
	ldr r6, _08034D80 @ =0x03004690
	str r1, [r6]
	ldr r5, [r1, #0xc]
	movs r0, #6
	ands r5, r0
	cmp r5, #0
	bne _08034D6E
	ldr r0, [r1]
	cmp r0, #0
	bne _08034D84
_08034D6E:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	b _08034D34
	.align 2, 0
_08034D78: .4byte 0x0203A8EC
_08034D7C: .4byte 0x0202BD48
_08034D80: .4byte 0x03004690
_08034D84:
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	ldr r0, [r6]
	bl sub_0803C0C8
	ldr r1, [r6]
	adds r1, #0x40
	movs r0, #0xf8
	ldrh r1, [r1]
	ands r0, r1
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x7d
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x7a
	strb r5, [r0]
	bl AiRefreshDangerMap
	bl AiClearDecision
	ldr r0, _08034E00 @ =0x030047A0
	ldr r0, [r0]
	bl _call_via_r0
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r1, _08034E04 @ =0x0203A97C
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08034DEE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _08034E08
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r1, #3]
	cmp r0, r2
	bne _08034E08
	ldrb r0, [r1]
	cmp r0, #0
	bne _08034E08
_08034DEE:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	adds r0, r7, #0
	movs r1, #0
	bl Proc_Goto
	b _08034E2A
	.align 2, 0
_08034E00: .4byte 0x030047A0
_08034E04: .4byte 0x0203A97C
_08034E08:
	ldr r0, _08034E1C @ =0x0203A8EC
	ldr r1, [r0, #0x74]
	adds r1, #1
	str r1, [r0, #0x74]
	ldr r0, _08034E20 @ =0x08B96F9C
	adds r1, r7, #0
	bl SpawnProcLocking
	b _08034E2A
	.align 2, 0
_08034E1C: .4byte 0x0203A8EC
_08034E20: .4byte 0x08B96F9C
_08034E24:
	adds r0, r7, #0
	bl Proc_End
_08034E2A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start AiClearDecision
AiClearDecision: @ 0x08034E30
	ldr r1, _08034E4C @ =0x0203A97C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08034E4C: .4byte 0x0203A97C

	thumb_func_start AiSetDecision
AiSetDecision: @ 0x08034E50
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r6, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	mov r8, r4
	ldr r4, [sp, #0x20]
	mov sb, r4
	ldr r4, _08034E8C @ =0x0203A97C
	ldr r5, _08034E90 @ =0x0202BD48
	ldrb r5, [r5]
	strb r5, [r4, #1]
	strb r0, [r4, #2]
	strb r1, [r4, #3]
	strb r2, [r4]
	strb r3, [r4, #6]
	strb r6, [r4, #7]
	mov r0, r8
	strb r0, [r4, #8]
	mov r0, sb
	strb r0, [r4, #9]
	movs r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034E8C: .4byte 0x0203A97C
_08034E90: .4byte 0x0202BD48

	thumb_func_start AiUpdateDecision
AiUpdateDecision: @ 0x08034E94
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08034ED8 @ =0x0203A97C
	cmp r0, #0xff
	beq _08034EB4
	strb r0, [r1]
_08034EB4:
	cmp r5, #0xff
	beq _08034EBA
	strb r5, [r1, #6]
_08034EBA:
	cmp r2, #0xff
	beq _08034EC0
	strb r2, [r1, #7]
_08034EC0:
	cmp r3, #0xff
	beq _08034EC6
	strb r3, [r1, #8]
_08034EC6:
	cmp r4, #0xff
	beq _08034ECC
	strb r4, [r1, #9]
_08034ECC:
	movs r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034ED8: .4byte 0x0203A97C

	thumb_func_start AiDecideMain
AiDecideMain: @ 0x08034EDC
	push {r4, r5, lr}
	ldr r2, _08034F34 @ =0x08B96F14
	ldr r0, _08034F38 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x79
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08034F2C
	ldr r0, _08034F3C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08034F2C
	adds r5, r2, #0
	adds r4, r1, #0
_08034F02:
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08034F2C
	ldr r0, _08034F3C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08034F02
_08034F2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034F34: .4byte 0x08B96F14
_08034F38: .4byte 0x0203A8EC
_08034F3C: .4byte 0x0203A97C

	thumb_func_start sub_08034F40
sub_08034F40: @ 0x08034F40
	push {r4, lr}
	sub sp, #8
	ldr r1, _08034F8C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08034FE8
	ldr r4, _08034F90 @ =0x03004690
	ldr r0, [r4]
	bl AiUpdateGetUnitIsHealing
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08034FCC
	bl sub_080397DC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08034FE8
	ldr r1, [r4]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _08034F94
	bl AiTryMoveTowardsEscape
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08034F94
	bl AiTryDanceOrStealAfterMove
	b _08034FE8
	.align 2, 0
_08034F8C: .4byte 0x0203A8EC
_08034F90: .4byte 0x03004690
_08034F94:
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_08039534
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08034FE8
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl AiTryMoveTowards
	ldr r0, _08034FC8 @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	cmp r0, #1
	bne _08034FE8
	bl AiTryActionAfterMove
	b _08034FE8
	.align 2, 0
_08034FC8: .4byte 0x0203A97C
_08034FCC:
	ldr r1, [r4]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _08034FE8
	bl AiTryMoveTowardsEscape
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08034FE8
	bl AiTryDanceOrStealAfterMove
_08034FE8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08034FF0
sub_08034FF0: @ 0x08034FF0
	push {lr}
	ldr r1, _08035008 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08035004
	bl AiTryDoSpecialItems
_08035004:
	pop {r0}
	bx r0
	.align 2, 0
_08035008: .4byte 0x0203A8EC

	thumb_func_start sub_0803500C
sub_0803500C: @ 0x0803500C
	push {r4, lr}
	movs r4, #0
	ldr r1, _08035024 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08035028
	bl AiDoBerserkAction
	b _0803503E
	.align 2, 0
_08035024: .4byte 0x0203A8EC
_08035028:
	bl sub_080375B8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803503E
	adds r4, #1
	cmp r4, #0xff
	ble _08035028
	bl AiExecFallbackScriptA
_0803503E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08035044
sub_08035044: @ 0x08035044
	push {r4, lr}
	movs r4, #0
	ldr r0, _0803507C @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08035068
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetRiddenBallistaAt
	cmp r0, #0
	bne _0803509A
_08035068:
	ldr r1, _08035080 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08035084
	bl AiDoBerserkMove
	b _0803509A
	.align 2, 0
_0803507C: .4byte 0x03004690
_08035080: .4byte 0x0203A8EC
_08035084:
	bl sub_08037648
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803509A
	adds r4, #1
	cmp r4, #0xff
	ble _08035084
	bl AiExecFallbackScriptB
_0803509A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080350A0
sub_080350A0: @ 0x080350A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl PutMapCursor
	ldr r0, _080350E0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080350CA
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #0x2d
	ble _080350D4
_080350CA:
	adds r0, r4, #0
	bl Proc_Break
	adds r2, r4, #0
	adds r2, #0x64
_080350D4:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080350E0: .4byte 0x08B857F8

	thumb_func_start StartAiTargetCursor
StartAiTargetCursor: @ 0x080350E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08035108 @ =0x08B96F7C
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035108: .4byte 0x08B96F7C

	thumb_func_start CpPerform_UpdateMapMusic
CpPerform_UpdateMapMusic: @ 0x0803510C
	push {lr}
	ldr r0, _08035120 @ =0x08B85854
	bl Proc_Find
	cmp r0, #0
	bne _0803511C
	bl StartMapSongBgm
_0803511C:
	pop {r0}
	bx r0
	.align 2, 0
_08035120: .4byte 0x08B85854

	thumb_func_start sub_08035124
sub_08035124: @ 0x08035124
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	movs r0, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _08035180 @ =0x0202BBF8
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _080351A6
	ldrb r1, [r1, #0xf]
	cmp r1, #0x80
	bne _080351A6
	ldr r0, _08035184 @ =0x03004690
	ldr r1, [r0]
	movs r5, #0x11
	ldrsb r5, [r1, r5]
	ldr r0, _08035188 @ =0x0202E3EC
	ldr r2, [r0]
	lsls r0, r5, #2
	adds r0, r0, r2
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035176
	ldr r3, _0803518C @ =0x0203A97C
	ldrb r6, [r3, #3]
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrb r2, [r3, #2]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035190
_08035176:
	adds r0, r4, #0
	adds r2, r5, #0
	bl CameraMoveWatchPosition
	b _080351B8
	.align 2, 0
_08035180: .4byte 0x0202BBF8
_08035184: .4byte 0x03004690
_08035188: .4byte 0x0202E3EC
_0803518C: .4byte 0x0203A97C
_08035190:
	mov r6, ip
	strb r0, [r6]
	ldrb r0, [r3]
	cmp r0, #4
	bne _080351B8
	ldrb r1, [r3, #2]
	ldrb r2, [r3, #3]
	adds r0, r4, #0
	bl CameraMoveWatchPosition
	b _080351B8
_080351A6:
	ldr r0, _080351C0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl CameraMoveWatchPosition
_080351B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080351C0: .4byte 0x03004690

	thumb_func_start CpPerform_BeginUnitMovement
CpPerform_BeginUnitMovement: @ 0x080351C4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08035228 @ =0x03004690
	ldr r0, [r6]
	bl UnitBeginAction
	ldr r0, [r6]
	bl HideUnitSprite
	ldr r0, [r6]
	bl RevertMapChange
	ldr r0, _0803522C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r4, _08035230 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldr r7, _08035234 @ =0x02033E00
	adds r2, r7, #0
	bl BuildBestMoveScript
	ldr r0, [r6]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl UnitApplyWorkingMovementScript
	ldr r1, _08035238 @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	strb r0, [r4, #2]
	ldrb r0, [r1, #0xf]
	strb r0, [r4, #3]
	adds r5, #0x31
	ldrb r0, [r5]
	cmp r0, #0
	beq _08035222
	ldr r0, [r6]
	bl StartMu
	bl SetAutoMuDefaultFacing
	adds r0, r7, #0
	bl SetAutoMuMoveScript
_08035222:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035228: .4byte 0x03004690
_0803522C: .4byte 0x0202E3E4
_08035230: .4byte 0x0203A97C
_08035234: .4byte 0x02033E00
_08035238: .4byte 0x0203A85C

	thumb_func_start AiEndMuAndRefreshUnits
AiEndMuAndRefreshUnits: @ 0x0803523C
	push {r4, r5, lr}
	ldr r0, _08035288 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r5, _0803528C @ =0x03004690
	str r0, [r5]
	ldr r4, _08035290 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl SetMapCursorPosition
	bl RenderMapForFade
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	bl EndAllMus
	bl RefreshEntityMaps
	ldr r0, [r5]
	bl ShowUnitSprite
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035288: .4byte 0x0203A85C
_0803528C: .4byte 0x03004690
_08035290: .4byte 0x0203A97C

	thumb_func_start sub_08035294
sub_08035294: @ 0x08035294
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r5, _080352EC @ =0x0203A85C
	ldr r0, _080352F0 @ =0x0202BD48
	ldrb r0, [r0]
	strb r0, [r5, #0xc]
	movs r0, #2
	strb r0, [r5, #0x11]
	ldr r4, _080352F4 @ =0x0203A97C
	ldrb r0, [r4, #6]
	strb r0, [r5, #0xd]
	ldr r6, _080352F8 @ =0x03004690
	ldr r1, [r6]
	ldrb r0, [r4, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r6]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _080352D2
	ldrb r0, [r4, #8]
	ldrb r1, [r4, #9]
	bl GetTrapAt
	ldrb r1, [r0]
	strb r1, [r5, #0x13]
	ldrb r1, [r0, #1]
	strb r1, [r5, #0x14]
	ldrb r0, [r0, #3]
	strb r0, [r5, #0x15]
_080352D2:
	movs r1, #7
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080352FC
	ldr r0, [r6]
	ldrb r1, [r4, #7]
	bl UnitEquipItemSlot
	movs r0, #0
	b _080352FE
	.align 2, 0
_080352EC: .4byte 0x0203A85C
_080352F0: .4byte 0x0202BD48
_080352F4: .4byte 0x0203A97C
_080352F8: .4byte 0x03004690
_080352FC:
	movs r0, #8
_080352FE:
	strb r0, [r5, #0x12]
	adds r0, r7, #0
	bl DoAction
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0803530C
sub_0803530C: @ 0x0803530C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _08035344 @ =0x081D3664
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	ldr r1, _08035348 @ =0x0203A97C
	ldrb r0, [r1, #8]
	cmp r0, #5
	beq _0803533A
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803533A
	ldrb r2, [r1, #8]
	lsls r0, r2, #1
	adds r0, r0, r2
	add r0, sp
	bl SetAutoMuMoveScript
_0803533A:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035344: .4byte 0x081D3664
_08035348: .4byte 0x0203A97C

	thumb_func_start sub_0803534C
sub_0803534C: @ 0x0803534C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r4, _08035390 @ =0x0203A97C
	ldrb r0, [r4, #6]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #7]
	lsls r1, r0, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r0, _08035394 @ =0x03004690
	ldr r0, [r0]
	adds r1, r5, #0
	bl UnitAddItem
	ldrb r1, [r4, #7]
	adds r0, r6, #0
	bl UnitRemoveItem
	adds r0, r5, #0
	mov r1, r8
	bl StartStoleItemPopup
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035390: .4byte 0x0203A97C
_08035394: .4byte 0x03004690

	thumb_func_start sub_08035398
sub_08035398: @ 0x08035398
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _080353D4 @ =0x0203A97C
	ldrb r2, [r3, #2]
	ldrb r4, [r3, #3]
	ldr r0, _080353D8 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _080353E4
	ldr r1, _080353DC @ =0x03004690
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r1, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r1, #0x11]
	ldr r1, _080353E0 @ =0x0203A85C
	movs r0, #0x17
	strb r0, [r1, #0x11]
	ldrb r0, [r3, #7]
	strb r0, [r1, #0x12]
	adds r0, r5, #0
	bl DoItemAction
	b _08035410
	.align 2, 0
_080353D4: .4byte 0x0203A97C
_080353D8: .4byte 0x0202E3E0
_080353DC: .4byte 0x03004690
_080353E0: .4byte 0x0203A85C
_080353E4:
	subs r1, r4, #1
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	ldr r0, _08035418 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08035404
	movs r0, #0xab
	bl m4aSongNumStart
_08035404:
	ldr r0, _0803541C @ =0x08B9701C
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopup_Simple
_08035410:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08035418: .4byte 0x0202BBF8
_0803541C: .4byte 0x08B9701C

	thumb_func_start AiStaffAction
AiStaffAction: @ 0x08035420
	push {r4, lr}
	ldr r4, _0803544C @ =0x03004690
	ldr r2, [r4]
	ldr r3, _08035450 @ =0x0203A97C
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	ldr r2, _08035454 @ =0x0203A85C
	movs r1, #3
	strb r1, [r2, #0x11]
	ldrb r1, [r3, #6]
	strb r1, [r2, #0xd]
	ldrb r1, [r3, #7]
	strb r1, [r2, #0x12]
	bl DoItemAction
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803544C: .4byte 0x03004690
_08035450: .4byte 0x0203A97C
_08035454: .4byte 0x0203A85C

	thumb_func_start sub_08035458
sub_08035458: @ 0x08035458
	push {r4, lr}
	ldr r4, _08035480 @ =0x03004690
	ldr r2, [r4]
	ldr r3, _08035484 @ =0x0203A97C
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	ldr r2, _08035488 @ =0x0203A85C
	movs r1, #0x17
	strb r1, [r2, #0x11]
	ldrb r1, [r3, #7]
	strb r1, [r2, #0x12]
	bl DoItemAction
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08035480: .4byte 0x03004690
_08035484: .4byte 0x0203A97C
_08035488: .4byte 0x0203A85C

	thumb_func_start sub_0803548C
sub_0803548C: @ 0x0803548C
	movs r0, #1
	bx lr

	thumb_func_start AiTalkAction
AiTalkAction: @ 0x08035490
	push {r4, r5, lr}
	ldr r2, _080354CC @ =0x03004690
	ldr r1, [r2]
	ldr r5, _080354D0 @ =0x0203A97C
	ldrb r0, [r5, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #0x11]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _080354C2
	ldrb r0, [r5, #7]
	bl GetUnit
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	ldrb r0, [r5, #8]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl StartCharacterEvent
_080354C2:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080354CC: .4byte 0x03004690
_080354D0: .4byte 0x0203A97C

	thumb_func_start sub_080354D4
sub_080354D4: @ 0x080354D4
	push {lr}
	ldr r1, _080354F4 @ =0x03004690
	ldr r2, [r1]
	ldr r3, _080354F8 @ =0x0203A97C
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	bl RideBallista
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080354F4: .4byte 0x03004690
_080354F8: .4byte 0x0203A97C

	thumb_func_start sub_080354FC
sub_080354FC: @ 0x080354FC
	push {lr}
	ldr r1, _0803551C @ =0x03004690
	ldr r2, [r1]
	ldr r3, _08035520 @ =0x0203A97C
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	bl TryRemoveUnitFromBallista
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0803551C: .4byte 0x03004690
_08035520: .4byte 0x0203A97C

	thumb_func_start sub_08035524
sub_08035524: @ 0x08035524
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _08035550 @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	bne _0803553A
	b _08035628
_0803553A:
	ldr r0, _08035554 @ =0x0203A97C
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0xa
	bhi _08035612
	lsls r0, r1, #2
	ldr r1, _08035558 @ =_0803555C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035550: .4byte 0x0203A85C
_08035554: .4byte 0x0203A97C
_08035558: .4byte _0803555C
_0803555C: @ jump table
	.4byte _08035628 @ case 0
	.4byte _08035588 @ case 1
	.4byte _08035628 @ case 2
	.4byte _080355F4 @ case 3
	.4byte _08035628 @ case 4
	.4byte _08035600 @ case 5
	.4byte _08035628 @ case 6
	.4byte _080355F8 @ case 7
	.4byte _080355FC @ case 8
	.4byte _08035628 @ case 9
	.4byte _08035628 @ case 10
_08035588:
	ldr r1, _08035598 @ =0x0203A97C
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0803559C
	ldrb r6, [r1, #8]
	ldrb r5, [r1, #9]
	b _080355AA
	.align 2, 0
_08035598: .4byte 0x0203A97C
_0803559C:
	ldrb r0, [r1, #6]
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_080355AA:
	ldr r7, _080355EC @ =0x0203A97C
	movs r1, #7
	ldrsb r1, [r7, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08035612
	ldr r4, _080355F0 @ =0x03004690
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08035612
	bl EndAllMus
	ldr r1, [r4]
	ldrb r0, [r7, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r7, #3]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl RideBallista
	ldr r0, [r4]
	bl StartMu
	bl SetAutoMuDefaultFacing
	b _08035612
	.align 2, 0
_080355EC: .4byte 0x0203A97C
_080355F0: .4byte 0x03004690
_080355F4:
	ldrb r0, [r2, #6]
	b _08035606
_080355F8:
	ldrb r0, [r2, #6]
	b _08035606
_080355FC:
	ldrb r0, [r2, #9]
	b _08035606
_08035600:
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _08035628
_08035606:
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_08035612:
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	bl CameraMoveWatchPosition
	lsls r0, r6, #4
	lsls r1, r5, #4
	movs r2, #2
	mov r3, r8
	bl StartAiTargetCursor
_08035628:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08035634
sub_08035634: @ 0x08035634
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803564C @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	bne _08035654
	ldr r0, _08035650 @ =sub_08035790
	b _08035706
	.align 2, 0
_0803564C: .4byte 0x0203A85C
_08035650: .4byte sub_08035790
_08035654:
	ldr r0, _08035668 @ =0x0203A97C
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _08035708
	lsls r0, r0, #2
	ldr r1, _0803566C @ =_08035670
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035668: .4byte 0x0203A97C
_0803566C: .4byte _08035670
_08035670: @ jump table
	.4byte _0803569C @ case 0
	.4byte _080356A4 @ case 1
	.4byte _080356B4 @ case 2
	.4byte _080356C4 @ case 3
	.4byte _080356D4 @ case 4
	.4byte _080356DC @ case 5
	.4byte _080356E4 @ case 6
	.4byte _080356EC @ case 7
	.4byte _080356F4 @ case 8
	.4byte _080356FC @ case 9
	.4byte _08035704 @ case 10
_0803569C:
	ldr r0, _080356A0 @ =sub_08035790
	b _08035706
	.align 2, 0
_080356A0: .4byte sub_08035790
_080356A4:
	ldr r0, _080356B0 @ =sub_08035790
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_08035294
	b _08035708
	.align 2, 0
_080356B0: .4byte sub_08035790
_080356B4:
	adds r0, r4, #0
	bl sub_0803530C
	ldr r0, _080356C0 @ =AiEscapeAction
	b _08035706
	.align 2, 0
_080356C0: .4byte AiEscapeAction
_080356C4:
	adds r0, r4, #0
	bl sub_0803534C
	ldr r0, _080356D0 @ =AiWaitAndClearScreenAction
	b _08035706
	.align 2, 0
_080356D0: .4byte AiWaitAndClearScreenAction
_080356D4:
	ldr r0, _080356D8 @ =sub_08035398
	b _08035706
	.align 2, 0
_080356D8: .4byte sub_08035398
_080356DC:
	ldr r0, _080356E0 @ =AiStaffAction
	b _08035706
	.align 2, 0
_080356E0: .4byte AiStaffAction
_080356E4:
	ldr r0, _080356E8 @ =sub_08035458
	b _08035706
	.align 2, 0
_080356E8: .4byte sub_08035458
_080356EC:
	ldr r0, _080356F0 @ =sub_0803548C
	b _08035706
	.align 2, 0
_080356F0: .4byte sub_0803548C
_080356F4:
	ldr r0, _080356F8 @ =AiTalkAction
	b _08035706
	.align 2, 0
_080356F8: .4byte AiTalkAction
_080356FC:
	ldr r0, _08035700 @ =sub_080354D4
	b _08035706
	.align 2, 0
_08035700: .4byte sub_080354D4
_08035704:
	ldr r0, _08035710 @ =sub_080354FC
_08035706:
	str r0, [r4, #0x2c]
_08035708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035710: .4byte sub_080354FC

	thumb_func_start CpPerform_WaitAction
CpPerform_WaitAction: @ 0x08035714
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08035738
	adds r0, r4, #0
	bl Proc_Break
_08035738:
	ldr r3, _08035750 @ =0x03004690
	ldr r1, [r3]
	ldr r2, _08035754 @ =0x0203A97C
	ldrb r0, [r2, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r3]
	ldrb r0, [r2, #3]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035750: .4byte 0x03004690
_08035754: .4byte 0x0203A97C

	thumb_func_start CpPerform_Cleanup
CpPerform_Cleanup: @ 0x08035758
	push {r4, lr}
	adds r4, r0, #0
	bl AiUpdateUnitsSeekHealing
	bl AiEndMuAndRefreshUnits
	ldr r0, _08035788 @ =0x03004690
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	beq _08035778
	ldr r0, [r1, #0xc]
	ldr r1, _0803578C @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _08035780
_08035778:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08035780:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035788: .4byte 0x03004690
_0803578C: .4byte 0x00010005

	thumb_func_start sub_08035790
sub_08035790: @ 0x08035790
	movs r0, #1
	bx lr

	thumb_func_start AiEscapeAction
AiEscapeAction: @ 0x08035794
	push {lr}
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080357A6
	movs r0, #0
	b _080357AE
_080357A6:
	ldr r0, _080357B4 @ =0x03004690
	ldr r0, [r0]
	str r1, [r0]
	movs r0, #1
_080357AE:
	pop {r1}
	bx r1
	.align 2, 0
_080357B4: .4byte 0x03004690

	thumb_func_start AiWaitAndClearScreenAction
AiWaitAndClearScreenAction: @ 0x080357B8
	push {lr}
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080357C6
	movs r0, #0
	b _080357DE
_080357C6:
	ldr r0, _080357E4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080357E8 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	movs r0, #1
_080357DE:
	pop {r1}
	bx r1
	.align 2, 0
_080357E4: .4byte 0x02022C60
_080357E8: .4byte 0x02023460

	thumb_func_start CpPerform_EquipBest
CpPerform_EquipBest: @ 0x080357EC
	push {r4, r5, r6, lr}
	sub sp, #0x18
	bl AiCanEquip
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803582A
	add r0, sp, #4
	bl AiEquipGetFlags
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803582A
	ldr r1, _08035834 @ =0x0203A97C
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	add r4, sp, #0x10
	mov r5, sp
	adds r5, #0x12
	add r6, sp, #0x14
	str r6, [sp]
	adds r2, r4, #0
	adds r3, r5, #0
	bl AiEquipGetDanger
	ldrh r0, [r4]
	ldrh r1, [r5]
	ldrh r2, [r6]
	add r3, sp, #4
	bl AiEquipBestConsideringDanger
_0803582A:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035834: .4byte 0x0203A97C

	thumb_func_start sub_08035838
sub_08035838: @ 0x08035838
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #5
	bhi _08035898
	lsls r0, r0, #2
	ldr r1, _0803584C @ =_08035850
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803584C: .4byte _08035850
_08035850: @ jump table
	.4byte _08035868 @ case 0
	.4byte _08035872 @ case 1
	.4byte _0803587A @ case 2
	.4byte _08035882 @ case 3
	.4byte _0803588A @ case 4
	.4byte _08035892 @ case 5
_08035868:
	ldrb r3, [r3]
	cmp r3, r2
	bls _08035898
_0803586E:
	movs r0, #1
	b _0803589A
_08035872:
	ldrb r3, [r3]
	cmp r3, r2
	blo _08035898
	b _0803586E
_0803587A:
	ldrb r0, [r3]
	cmp r0, r2
	bne _08035898
	b _0803586E
_08035882:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _08035898
	b _0803586E
_0803588A:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _08035898
	b _0803586E
_08035892:
	ldrb r0, [r3]
	cmp r0, r2
	bne _0803586E
_08035898:
	movs r0, #0
_0803589A:
	bx lr

	thumb_func_start AiFindTargetInReachByCharId
AiFindTargetInReachByCharId: @ 0x0803589C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08035938 @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	bl MarkWorkingMapEdges
	ldr r0, _0803593C @ =0x0000FFFF
	strh r0, [r6]
	movs r5, #1
	ldr r0, _08035940 @ =0x0203A972
	mov r8, r0
_080358CE:
	adds r0, r5, #0
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _08035924
	ldr r4, [r3]
	cmp r4, #0
	beq _08035924
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r0, _08035944 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035924
	ldrb r0, [r4, #4]
	cmp r0, r7
	bne _08035924
	ldr r1, [r3, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08035968
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _08035918
	movs r0, #3
	mov r1, r8
	strb r0, [r1]
_08035918:
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	strh r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	strh r0, [r6, #2]
_08035924:
	adds r5, #1
	cmp r5, #0xbf
	ble _080358CE
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	blt _08035948
	movs r0, #1
	b _0803597E
	.align 2, 0
_08035938: .4byte 0x03004690
_0803593C: .4byte 0x0000FFFF
_08035940: .4byte 0x0203A972
_08035944: .4byte 0x0202E3E8
_08035948:
	adds r0, r7, #0
	bl GetUnitByPid
	ldr r0, [r0, #0xc]
	ldr r1, _08035960 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _08035974
	ldr r0, _08035964 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
	b _0803597A
	.align 2, 0
_08035960: .4byte 0x0001000C
_08035964: .4byte 0x0203A8EC
_08035968:
	ldr r0, _08035970 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
	b _0803597A
	.align 2, 0
_08035970: .4byte 0x0203A8EC
_08035974:
	ldr r0, _08035988 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #4
_0803597A:
	strb r1, [r0]
	movs r0, #0
_0803597E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08035988: .4byte 0x0203A8EC

	thumb_func_start AiFindTargetInReachByClassId
AiFindTargetInReachByClassId: @ 0x0803598C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	movs r7, #0xff
	ldr r0, _08035A1C @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	ldr r0, _08035A20 @ =0x0000FFFF
	strh r0, [r6]
	movs r4, #1
_080359B8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08035A08
	ldr r0, [r2]
	cmp r0, #0
	beq _08035A08
	ldr r0, [r2, #0xc]
	ldr r1, _08035A24 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08035A08
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _08035A28 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0x10
	ldrsb r3, [r2, r3]
	ldr r0, [r1]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _08035A08
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _08035A08
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r7, r0
	blt _08035A08
	ldrb r7, [r1]
	strh r3, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r6, #2]
_08035A08:
	adds r4, #1
	cmp r4, #0xbf
	ble _080359B8
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _08035A2C
	movs r0, #0
	b _08035A2E
	.align 2, 0
_08035A1C: .4byte 0x03004690
_08035A20: .4byte 0x0000FFFF
_08035A24: .4byte 0x00010025
_08035A28: .4byte 0x0202E3E8
_08035A2C:
	movs r0, #1
_08035A2E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiFindTargetInReachByFunc
AiFindTargetInReachByFunc: @ 0x08035A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, _08035A78 @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	ldr r2, _08035A7C @ =0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _08035A80 @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08035B0E
	.align 2, 0
_08035A78: .4byte 0x03004690
_08035A7C: .4byte 0x0000FFFF
_08035A80: .4byte 0x0202E3D8
_08035A84:
	ldr r0, _08035B20 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _08035B0A
	mov sl, r8
	ldr r0, _08035B24 @ =0x0202E3E8
	mov sb, r0
	asrs r7, r1, #0xe
_08035AA0:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035AFC
	ldr r0, _08035B28 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _08035AFC
	ldr r0, _08035B2C @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _08035AFC
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035AFC
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r1, [sp, #8]
	cmp r2, r1
	bhi _08035AFC
	ldrb r0, [r0]
	str r0, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r2, sl
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
_08035AFC:
	lsls r0, r6, #0x10
	ldr r1, _08035B30 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _08035AA0
_08035B0A:
	ldr r0, _08035B30 @ =0xFFFF0000
	add r0, r8
_08035B0E:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08035A84
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _08035B34
	movs r0, #0
	b _08035B44
	.align 2, 0
_08035B20: .4byte 0x0202E3D8
_08035B24: .4byte 0x0202E3E8
_08035B28: .4byte 0x0202E3DC
_08035B2C: .4byte 0x0202BD48
_08035B30: .4byte 0xFFFF0000
_08035B34:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_08035B44:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08035B54
sub_08035B54: @ 0x08035B54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, _08035B94 @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRangeNeglectWall
	ldr r2, _08035B98 @ =0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _08035B9C @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08035C2A
	.align 2, 0
_08035B94: .4byte 0x03004690
_08035B98: .4byte 0x0000FFFF
_08035B9C: .4byte 0x0202E3D8
_08035BA0:
	ldr r0, _08035C3C @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _08035C26
	mov sl, r8
	ldr r0, _08035C40 @ =0x0202E3E8
	mov sb, r0
	asrs r7, r1, #0xe
_08035BBC:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035C18
	ldr r0, _08035C44 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _08035C18
	ldr r0, _08035C48 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _08035C18
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035C18
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r1, [sp, #8]
	cmp r2, r1
	bhi _08035C18
	ldrb r0, [r0]
	str r0, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r2, sl
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
_08035C18:
	lsls r0, r6, #0x10
	ldr r1, _08035C4C @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _08035BBC
_08035C26:
	ldr r0, _08035C4C @ =0xFFFF0000
	add r0, r8
_08035C2A:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08035BA0
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _08035C50
	movs r0, #0
	b _08035C60
	.align 2, 0
_08035C3C: .4byte 0x0202E3D8
_08035C40: .4byte 0x0202E3E8
_08035C44: .4byte 0x0202E3DC
_08035C48: .4byte 0x0202BD48
_08035C4C: .4byte 0xFFFF0000
_08035C50:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_08035C60:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiRandomMove
AiRandomMove: @ 0x08035C70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _08035C94 @ =0x03004690
	ldr r0, [r0]
	bl RevertMapChange
	ldr r3, _08035C98 @ =0x0000FFFF
	ldr r0, _08035C9C @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08035D0A
	.align 2, 0
_08035C94: .4byte 0x03004690
_08035C98: .4byte 0x0000FFFF
_08035C9C: .4byte 0x0202E3D8
_08035CA0:
	ldr r0, _08035D40 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	lsls r7, r1, #0x10
	cmp r4, #0
	blt _08035D06
	adds r2, r7, #0
	asrs r6, r7, #0xe
_08035CB6:
	ldr r0, _08035D44 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	asrs r1, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035CF8
	ldr r0, _08035D48 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035CF8
	movs r0, #0x80
	lsls r0, r0, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	cmp r0, r8
	blo _08035CF8
	mov r8, r0
	lsrs r3, r4, #0x10
	lsrs r1, r2, #0x10
	mov sb, r1
_08035CF8:
	lsls r0, r5, #0x10
	ldr r1, _08035D4C @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	cmp r4, #0
	bge _08035CB6
_08035D06:
	ldr r1, _08035D4C @ =0xFFFF0000
	adds r0, r7, r1
_08035D0A:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08035CA0
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08035D30
	mov r0, sb
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl AiSetDecision
_08035D30:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035D40: .4byte 0x0202E3D8
_08035D44: .4byte 0x0202E3E4
_08035D48: .4byte 0x0202E3DC
_08035D4C: .4byte 0xFFFF0000

	thumb_func_start AiReachesByBirdsEyeDistance
AiReachesByBirdsEyeDistance: @ 0x08035D50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r3, r1, r0
	cmp r3, #0
	bge _08035D6A
	subs r3, r0, r1
_08035D6A:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	subs r0, r2, r1
	cmp r0, #0
	bge _08035D7A
	subs r0, r1, r2
_08035D7A:
	adds r5, r3, r0
	adds r0, r6, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r5, r1
	ble _08035D9A
	movs r0, #0
	b _08035D9C
_08035D9A:
	movs r0, #1
_08035D9C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiCouldReachByBirdsEyeDistance
AiCouldReachByBirdsEyeDistance: @ 0x08035DA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r3, #0x10
	ldrsb r3, [r4, r3]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	bge _08035DBE
	subs r1, r0, r3
_08035DBE:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _08035DD0
	adds r6, r1, r3
	b _08035DD4
_08035DD0:
	subs r0, r0, r2
	adds r6, r1, r0
_08035DD4:
	adds r0, r7, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	movs r2, #0x1d
	ldrsb r2, [r5, r2]
	ldr r3, [r5, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r6, r1
	ble _08035E02
	movs r0, #0
	b _08035E04
_08035E02:
	movs r0, #1
_08035E04:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiIsInShortList
AiIsInShortList: @ 0x08035E0C
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _08035E1C
_08035E12:
	cmp r2, r1
	bne _08035E1A
	movs r0, #1
	b _08035E24
_08035E1A:
	adds r0, #2
_08035E1C:
	ldrh r2, [r0]
	cmp r2, #0
	bne _08035E12
	movs r0, #0
_08035E24:
	bx lr
	.align 2, 0

	thumb_func_start AiIsInByteList
AiIsInByteList: @ 0x08035E28
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	b _08035E38
_08035E2E:
	cmp r2, r1
	bne _08035E36
	movs r0, #1
	b _08035E40
_08035E36:
	adds r0, #1
_08035E38:
	ldrb r2, [r0]
	cmp r2, #0
	bne _08035E2E
	movs r0, #0
_08035E40:
	bx lr
	.align 2, 0

	thumb_func_start AiFindClosestTerrainPosition
AiFindClosestTerrainPosition: @ 0x08035E44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov sb, r0
	ldr r0, _08035F20 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08035F16
_08035E66:
	ldr r0, _08035F20 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _08035F10
	lsls r6, r5, #2
_08035E78:
	ldr r0, _08035F24 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035F0A
	ldr r0, _08035F28 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035F0A
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08035ED0
	ldr r0, _08035F2C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08035ED0
	ldr r0, _08035F30 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035F0A
_08035ED0:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08035EEA
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _08035F0A
_08035EEA:
	ldr r0, _08035F24 @ =0x0202E3E8
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	ble _08035F0A
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_08035F0A:
	subs r4, #1
	cmp r4, #0
	bge _08035E78
_08035F10:
	mov r5, sl
	cmp r5, #0
	bge _08035E66
_08035F16:
	mov r0, sb
	cmp r0, #0xff
	bne _08035F34
	movs r0, #0
	b _08035F36
	.align 2, 0
_08035F20: .4byte 0x0202E3D8
_08035F24: .4byte 0x0202E3E8
_08035F28: .4byte 0x0202E3E0
_08035F2C: .4byte 0x0202E3DC
_08035F30: .4byte 0x03004690
_08035F34:
	movs r0, #1
_08035F36:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiGetPositionRange
AiGetPositionRange: @ 0x08035F48
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _08035F80 @ =0x0202E3E8
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08035F7C
	ldr r0, _08035F84 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _08035F8C
	ldr r0, _08035F88 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r2, r0
	beq _08035F8C
_08035F7C:
	movs r0, #0xff
	b _08035F98
	.align 2, 0
_08035F80: .4byte 0x0202E3E8
_08035F84: .4byte 0x0202E3DC
_08035F88: .4byte 0x0202BD48
_08035F8C:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_08035F98:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiFindClosestTerrainAdjacentPosition
AiFindClosestTerrainAdjacentPosition: @ 0x08035FA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	mov sl, r1
	mov sb, r2
	movs r0, #0xff
	str r0, [sp, #8]
	ldr r0, _080360BC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _080360B0
	mov r8, sp
_08035FC4:
	ldr r0, _080360BC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r6, #1
	str r3, [sp, #0xc]
	cmp r5, #0
	blt _080360AA
	lsls r7, r6, #2
	str r7, [sp, #0x10]
_08035FD8:
	ldr r0, _080360C0 @ =0x0202E3E8
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080360A4
	ldr r0, _080360C4 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080360A4
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08036034
	ldr r0, _080360C8 @ =0x0202E3DC
	ldr r0, [r0]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036034
	ldr r0, _080360CC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080360A4
_08036034:
	movs r0, #2
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _0803604E
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080360A4
_0803604E:
	mov r4, sp
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _080360D0 @ =AiGetPositionRange
	mov r3, sp
	bl AiFindBestAdjacentPositionByFunc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080360A4
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _080360C0 @ =0x0202E3E8
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r3, r8
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _080360A4
	ldrh r0, [r3]
	mov r3, sb
	strh r0, [r3]
	ldrh r0, [r4, #2]
	strh r0, [r3, #2]
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
_080360A4:
	subs r5, #1
	cmp r5, #0
	bge _08035FD8
_080360AA:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	bge _08035FC4
_080360B0:
	ldr r7, [sp, #8]
	cmp r7, #0xff
	bne _080360D4
	movs r0, #0
	b _080360D6
	.align 2, 0
_080360BC: .4byte 0x0202E3D8
_080360C0: .4byte 0x0202E3E8
_080360C4: .4byte 0x0202E3E0
_080360C8: .4byte 0x0202E3DC
_080360CC: .4byte 0x03004690
_080360D0: .4byte AiGetPositionRange
_080360D4:
	movs r0, #1
_080360D6:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080360E8
sub_080360E8: @ 0x080360E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	movs r0, #0xff
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0803615C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803610E
	b _080362D0
_0803610E:
	movs r4, #1
	mov r0, sl
	ands r0, r4
	str r0, [sp, #0xc]
_08036116:
	ldr r0, _0803615C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _08036124
	b _080362C8
_08036124:
	lsls r2, r7, #2
	mov sb, r2
	mov r5, sp
	movs r4, #2
	mov r0, sl
	ands r0, r4
	str r0, [sp, #0x10]
_08036132:
	ldr r0, _08036160 @ =0x0202E3E8
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _08036144
	b _080362C0
_08036144:
	ldr r0, _08036164 @ =0x0202E3E0
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _08036168
	cmp r0, #0x21
	beq _08036198
	b _080362C0
	.align 2, 0
_0803615C: .4byte 0x0202E3D8
_08036160: .4byte 0x0202E3E8
_08036164: .4byte 0x0202E3E0
_08036168:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #8
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _0803617E
	b _080362C0
_0803617E:
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, _08036194 @ =AiGetPositionRange
	mov r3, sp
	bl AiFindBestAdjacentPositionByFunc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036192
	b _080362C0
_08036192:
	b _08036234
	.align 2, 0
_08036194: .4byte AiGetPositionRange
_08036198:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #4
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080361AE
	b _080362C0
_080361AE:
	strh r6, [r5]
	mov r4, sp
	strh r7, [r4, #2]
	ldr r0, _08036228 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, sb
	ldr r2, [r0]
	adds r2, r2, r6
	ldr r0, _0803622C @ =0x03004690
	ldr r3, [r0]
	movs r1, #0x1d
	ldrsb r1, [r3, r1]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldrb r2, [r2]
	cmp r2, r1
	bgt _08036234
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _08036206
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _08036230 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036206
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080362C0
_08036206:
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _0803621C
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080362C0
_0803621C:
	ldrh r0, [r5]
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	b _08036308
	.align 2, 0
_08036228: .4byte 0x0202E3E4
_0803622C: .4byte 0x03004690
_08036230: .4byte 0x0202E3DC
_08036234:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0803626A
	movs r1, #2
	ldrsh r0, [r5, r1]
	ldr r1, _080362F8 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803626A
	ldr r0, _080362FC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080362C0
_0803626A:
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _08036280
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080362C0
_08036280:
	mov r2, sp
	movs r4, #2
	ldrsh r0, [r2, r4]
	ldr r1, _08036300 @ =0x0202E3E8
	ldr r3, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _080362C0
	ldrh r0, [r5]
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #4]
_080362C0:
	subs r6, #1
	cmp r6, #0
	blt _080362C8
	b _08036132
_080362C8:
	subs r7, #1
	cmp r7, #0
	blt _080362D0
	b _08036116
_080362D0:
	movs r0, #0
	cmp r0, #0
	bne _080362DE
	ldr r0, _08036304 @ =0x0203A8EC
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
_080362DE:
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _080362EC
	ldr r0, _08036304 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #5
	strb r1, [r0]
_080362EC:
	ldr r0, [sp, #4]
	cmp r0, #0xff
	bne _08036308
	movs r0, #0
	b _0803630A
	.align 2, 0
_080362F8: .4byte 0x0202E3DC
_080362FC: .4byte 0x03004690
_08036300: .4byte 0x0202E3E8
_08036304: .4byte 0x0203A8EC
_08036308:
	movs r0, #1
_0803630A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiCountUnitsInRange
AiCountUnitsInRange: @ 0x0803631C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r1, _08036384 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	cmp r2, #0
	blt _08036378
	movs r3, #0
	ldrsh r7, [r1, r3]
	ldr r0, _08036388 @ =0x0202E3E8
	mov r8, r0
	ldr r3, _0803638C @ =0x0202E3DC
	mov ip, r3
_0803633C:
	subs r1, r7, #1
	subs r5, r2, #1
	cmp r1, #0
	blt _08036372
	mov r3, r8
	ldr r0, [r3]
	lsls r2, r2, #2
	adds r0, r2, r0
	ldr r3, [r0]
	mov r6, ip
_08036350:
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803636C
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803636C
	adds r4, #1
_0803636C:
	subs r1, #1
	cmp r1, #0
	bge _08036350
_08036372:
	adds r2, r5, #0
	cmp r2, #0
	bge _0803633C
_08036378:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036384: .4byte 0x0202E3D8
_08036388: .4byte 0x0202E3E8
_0803638C: .4byte 0x0202E3DC

	thumb_func_start AiCountEnemyUnitsInRange
AiCountEnemyUnitsInRange: @ 0x08036390
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _080363FC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _080363F2
_080363A0:
	ldr r0, _080363FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _080363EC
	lsls r5, r1, #2
_080363B0:
	ldr r0, _08036400 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080363E6
	ldr r0, _08036404 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080363E6
	ldr r0, _08036408 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080363E6
	adds r6, #1
_080363E6:
	subs r4, #1
	cmp r4, #0
	bge _080363B0
_080363EC:
	adds r1, r7, #0
	cmp r1, #0
	bge _080363A0
_080363F2:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080363FC: .4byte 0x0202E3D8
_08036400: .4byte 0x0202E3E8
_08036404: .4byte 0x0202E3DC
_08036408: .4byte 0x0202BD48

	thumb_func_start AiCountAlliedUnitsInRange
AiCountAlliedUnitsInRange: @ 0x0803640C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _08036478 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08036470
_0803641C:
	ldr r0, _08036478 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803646A
	lsls r5, r1, #2
_0803642C:
	ldr r0, _0803647C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08036464
	ldr r0, _08036480 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036464
	ldr r0, _08036484 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08036464
	adds r6, #1
_08036464:
	subs r4, #1
	cmp r4, #0
	bge _0803642C
_0803646A:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803641C
_08036470:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036478: .4byte 0x0202E3D8
_0803647C: .4byte 0x0202E3E8
_08036480: .4byte 0x0202E3DC
_08036484: .4byte 0x0202BD48

	thumb_func_start AiCountNearbyUnits
AiCountNearbyUnits: @ 0x08036488
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _08036504 @ =0x08B97034
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _08036508 @ =0x0000270F
	cmp r0, r2
	beq _080364F6
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	ldr r5, _0803650C @ =0x0202E3D8
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov sb, r2
	ldr r0, _08036510 @ =0x0202E3DC
	mov r8, r0
_080364BA:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, ip
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _080364EE
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _080364EE
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080364EE
	adds r6, #1
_080364EE:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, sb
	bne _080364BA
_080364F6:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08036504: .4byte 0x08B97034
_08036508: .4byte 0x0000270F
_0803650C: .4byte 0x0202E3D8
_08036510: .4byte 0x0202E3DC

	thumb_func_start AiCountNearbyEnemyUnits
AiCountNearbyEnemyUnits: @ 0x08036514
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _0803659C @ =0x08B97034
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _080365A0 @ =0x0000270F
	cmp r0, r2
	beq _0803658E
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _080365A4 @ =0x0202E3D8
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov sb, r2
_08036542:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _08036586
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _08036586
	ldr r0, _080365A8 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036586
	ldr r0, _080365AC @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036586
	adds r6, #1
_08036586:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, sb
	bne _08036542
_0803658E:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803659C: .4byte 0x08B97034
_080365A0: .4byte 0x0000270F
_080365A4: .4byte 0x0202E3D8
_080365A8: .4byte 0x0202E3DC
_080365AC: .4byte 0x0202BD48

	thumb_func_start AiCountNearbyAlliedUnits
AiCountNearbyAlliedUnits: @ 0x080365B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _0803663C @ =0x08B97034
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _08036640 @ =0x0000270F
	cmp r0, r2
	beq _0803662C
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _08036644 @ =0x0202E3D8
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov sb, r2
_080365DE:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _08036624
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _08036624
	ldr r0, _08036648 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036624
	ldr r0, _0803664C @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08036624
	adds r6, #1
_08036624:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, sb
	bne _080365DE
_0803662C:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803663C: .4byte 0x08B97034
_08036640: .4byte 0x0000270F
_08036644: .4byte 0x0202E3D8
_08036648: .4byte 0x0202E3DC
_0803664C: .4byte 0x0202BD48

	thumb_func_start AiMakeMoveRangeMapsForUnitAndWeapon
AiMakeMoveRangeMapsForUnitAndWeapon: @ 0x08036650
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	bl RevertMapChange
	ldr r0, _080366E4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080366E8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _080366D4
_0803667A:
	ldr r0, _080366E8 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _080366CE
	lsls r1, r7, #0x10
	mov r8, r1
_0803668E:
	ldr r0, _080366EC @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080366C8
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_080366C8:
	subs r6, #1
	cmp r6, #0
	bge _0803668E
_080366CE:
	mov r7, sl
	cmp r7, #0
	bge _0803667A
_080366D4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080366E4: .4byte 0x0202E3E8
_080366E8: .4byte 0x0202E3D8
_080366EC: .4byte 0x0202E3E4

	thumb_func_start AiMakeMoveRangeUnitPowerMaps
AiMakeMoveRangeUnitPowerMaps: @ 0x080366F0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitPower
	cmp r0, #0x14
	bgt _08036706
	adds r0, r4, #0
	bl GetUnitPower
	adds r7, r0, #0
	b _08036708
_08036706:
	movs r7, #0x14
_08036708:
	adds r0, r4, #0
	bl RevertMapChange
	ldr r0, _08036764 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08036768 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803675C
_08036724:
	ldr r0, _08036768 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08036756
_08036732:
	ldr r0, _0803676C @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036750
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #1
	bl MapAddInRange
_08036750:
	subs r4, #1
	cmp r4, #0
	bge _08036732
_08036756:
	adds r5, r6, #0
	cmp r5, #0
	bge _08036724
_0803675C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036764: .4byte 0x0202E3E8
_08036768: .4byte 0x0202E3D8
_0803676C: .4byte 0x0202E3E4

	thumb_func_start sub_08036770
sub_08036770: @ 0x08036770
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	bl RevertMapChange
	ldr r0, _08036804 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08036808 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _080367F4
_0803679A:
	ldr r0, _08036808 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _080367EE
	lsls r1, r7, #0x10
	mov r8, r1
_080367AE:
	ldr r0, _0803680C @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080367E8
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_080367E8:
	subs r6, #1
	cmp r6, #0
	bge _080367AE
_080367EE:
	mov r7, sl
	cmp r7, #0
	bge _0803679A
_080367F4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036804: .4byte 0x0202E3E8
_08036808: .4byte 0x0202E3D8
_0803680C: .4byte 0x0202E3E4

	thumb_func_start AiFindBestAdjacentPositionByFunc
AiFindBestAdjacentPositionByFunc: @ 0x08036810
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r3, #0
	mov sb, r2
	movs r0, #0xff
	mov r8, r0
	ldr r1, _08036878 @ =0x081D3670
	mov r0, sp
	movs r2, #8
	bl memcpy
	mov r4, sp
	movs r2, #3
_08036834:
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r7, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r6, r1
	str r2, [sp, #8]
	bl sub_080BFC70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #8]
	cmp r0, #0xff
	beq _08036866
	cmp r8, r0
	bls _08036866
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r7
	strh r0, [r5]
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r0, r6
	strh r0, [r5, #2]
_08036866:
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _08036834
	mov r0, r8
	cmp r0, #0xff
	bne _0803687C
	movs r0, #0
	b _0803687E
	.align 2, 0
_08036878: .4byte 0x081D3670
_0803687C:
	movs r0, #1
_0803687E:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiGetItemStealRank
AiGetItemStealRank: @ 0x0803688C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	ldr r2, _080368B8 @ =0x08B97290
	ldrh r1, [r2]
	ldr r3, _080368BC @ =0x0000FFFF
	cmp r1, r3
	beq _080368AC
_0803689E:
	cmp r1, r4
	beq _080368B0
	adds r2, #2
	adds r0, #1
	ldrh r1, [r2]
	cmp r1, r3
	bne _0803689E
_080368AC:
	movs r0, #1
	rsbs r0, r0, #0
_080368B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080368B8: .4byte 0x08B97290
_080368BC: .4byte 0x0000FFFF

	thumb_func_start AiGetUnitStealItemSlot
AiGetUnitStealItemSlot: @ 0x080368C0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xff
	movs r5, #0xff
	movs r4, #0
_080368CA:
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _080368F6
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	bl AiGetItemStealRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blo _080368F0
	adds r6, r0, #0
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
_080368F0:
	adds r4, #1
	cmp r4, #4
	ble _080368CA
_080368F6:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiFindSafestReachableLocation
AiFindSafestReachableLocation: @ 0x08036900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov sb, r1
	movs r0, #0xff
	mov sl, r0
	ldr r1, _08036944 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803694C
	ldr r4, _08036948 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _08036952
	.align 2, 0
_08036944: .4byte 0x0203A8EC
_08036948: .4byte 0x0202E3E4
_0803694C:
	adds r0, r5, #0
	bl RevertMapChange
_08036952:
	ldr r1, _080369D0 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _080369C6
_0803695E:
	ldr r1, _080369D0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r3, #0
	blt _080369C0
	lsls r4, r5, #2
	ldr r1, _080369D4 @ =0x0202E3E4
	mov ip, r1
	ldr r7, _080369D8 @ =0x0202E3DC
	ldr r6, _080369DC @ =0x0202BD48
	ldr r1, _080369E0 @ =0x0202E3F4
_0803697A:
	mov r2, ip
	ldr r0, [r2]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080369BA
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803699E
	ldrb r2, [r6]
	cmp r0, r2
	bne _080369BA
_0803699E:
	ldr r0, [r1]
	adds r2, r4, r0
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp sl, r0
	blo _080369BA
	mov r0, sb
	strh r3, [r0]
	strh r5, [r0, #2]
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	mov sl, r0
_080369BA:
	subs r3, #1
	cmp r3, #0
	bge _0803697A
_080369C0:
	mov r5, r8
	cmp r5, #0
	bge _0803695E
_080369C6:
	mov r1, sl
	cmp r1, #0xff
	bne _080369E4
	movs r0, #0
	b _080369E6
	.align 2, 0
_080369D0: .4byte 0x0202E3D8
_080369D4: .4byte 0x0202E3E4
_080369D8: .4byte 0x0202E3DC
_080369DC: .4byte 0x0202BD48
_080369E0: .4byte 0x0202E3F4
_080369E4:
	movs r0, #1
_080369E6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiFindPillageLocation
AiFindPillageLocation: @ 0x080369F4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r5, _08036A74 @ =0x03004690
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08036A78 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r2, [r5]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r3, #0xb
	ldrsb r3, [r2, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	adds r0, r4, #0
	bl AiGetChestUnlockItemSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r6, _08036A7C @ =0x08B97098
	cmp r0, #1
	bne _08036A34
	ldr r6, _08036A80 @ =0x08B9709C
_08036A34:
	adds r0, r6, #0
	movs r1, #1
	adds r2, r7, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08036A84
	ldr r0, [r5]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08036A84
	movs r0, #0
	b _08036A86
	.align 2, 0
_08036A74: .4byte 0x03004690
_08036A78: .4byte 0x0202E3E8
_08036A7C: .4byte 0x08B97098
_08036A80: .4byte 0x08B9709C
_08036A84:
	movs r0, #1
_08036A86:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiGetChestUnlockItemSlot
AiGetChestUnlockItemSlot: @ 0x08036A8C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	strb r5, [r6]
	ldr r4, _08036AAC @ =0x03004690
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08036AB4
	ldr r1, [r4]
	movs r0, #8
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
	b _08036AF6
	.align 2, 0
_08036AAC: .4byte 0x03004690
_08036AB0:
	movs r0, #1
	b _08036AF8
_08036AB4:
	movs r5, #0
	adds r7, r4, #0
_08036AB8:
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _08036AF6
	strb r5, [r6]
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x68
	beq _08036AB0
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x6a
	bne _08036AF0
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	bne _08036AB0
_08036AF0:
	adds r5, #1
	cmp r5, #4
	ble _08036AB8
_08036AF6:
	movs r0, #0
_08036AF8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiTryMoveTowards
AiTryMoveTowards: @ 0x08036B00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _08036B5C @ =0x03004690
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _08036B60
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _08036B60
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b _08036CB8
	.align 2, 0
_08036B5C: .4byte 0x03004690
_08036B60:
	cmp r4, #0
	beq _08036B84
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _08036B80 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapFloodRange_Unitless
	b _08036B94
	.align 2, 0
_08036B80: .4byte 0x03004690
_08036B84:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08036BC4 @ =0x03004690
	ldr r2, [r2]
	bl AiMapFloodRangeFrom
_08036B94:
	ldr r4, _08036BC4 @ =0x03004690
	ldr r0, [r4]
	bl RevertMapChange
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08036BC8 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _08036BCC @ =0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _08036BD0 @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08036C90
	.align 2, 0
_08036BC4: .4byte 0x03004690
_08036BC8: .4byte 0x0202E3E8
_08036BCC: .4byte 0x0000FFFF
_08036BD0: .4byte 0x0202E3D8
_08036BD4:
	ldr r0, _08036CC8 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _08036C8C
	asrs r0, r7, #0xe
	mov r8, r0
_08036BEA:
	ldr r0, _08036CCC @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	lsls r2, r4, #0x10
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036C80
	ldr r0, _08036CD0 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _08036C16
	ldr r0, _08036CD4 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08036C80
_08036C16:
	mov r1, sl
	cmp r1, #0
	bne _08036C4A
	ldr r0, _08036CD8 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08036CDC @ =0x0203A8EC
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _08036C4A
	ldr r0, _08036CE0 @ =0x0202E3F4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _08036C80
_08036C4A:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl sub_08039510
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _08036C80
	ldr r0, _08036CE4 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08036C80
	ldrb r0, [r0]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_08036C80:
	ldr r1, _08036CE8 @ =0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _08036BEA
_08036C8C:
	ldr r1, _08036CE8 @ =0xFFFF0000
	adds r0, r7, r1
_08036C90:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08036BD4
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08036CB8
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
_08036CB8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036CC8: .4byte 0x0202E3D8
_08036CCC: .4byte 0x0202E3E4
_08036CD0: .4byte 0x0202E3DC
_08036CD4: .4byte 0x0202BD48
_08036CD8: .4byte 0x03004690
_08036CDC: .4byte 0x0203A8EC
_08036CE0: .4byte 0x0202E3F4
_08036CE4: .4byte 0x0202E3E8
_08036CE8: .4byte 0xFFFF0000

	thumb_func_start sub_08036CEC
sub_08036CEC: @ 0x08036CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _08036D48 @ =0x03004690
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _08036D4C
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _08036D4C
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b _08036EA4
	.align 2, 0
_08036D48: .4byte 0x03004690
_08036D4C:
	cmp r4, #0
	beq _08036D70
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _08036D6C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GenerateExtendedMovementMapOnRangeNeglectWall
	b _08036D80
	.align 2, 0
_08036D6C: .4byte 0x03004690
_08036D70:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08036DB0 @ =0x03004690
	ldr r2, [r2]
	bl sub_0803BF8C
_08036D80:
	ldr r4, _08036DB0 @ =0x03004690
	ldr r0, [r4]
	bl RevertMapChange
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08036DB4 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _08036DB8 @ =0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _08036DBC @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08036E7C
	.align 2, 0
_08036DB0: .4byte 0x03004690
_08036DB4: .4byte 0x0202E3E8
_08036DB8: .4byte 0x0000FFFF
_08036DBC: .4byte 0x0202E3D8
_08036DC0:
	ldr r0, _08036EB4 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _08036E78
	asrs r0, r7, #0xe
	mov r8, r0
_08036DD6:
	ldr r0, _08036EB8 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	lsls r2, r4, #0x10
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036E6C
	ldr r0, _08036EBC @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _08036E02
	ldr r0, _08036EC0 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08036E6C
_08036E02:
	mov r1, sl
	cmp r1, #0
	bne _08036E36
	ldr r0, _08036EC4 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08036EC8 @ =0x0203A8EC
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _08036E36
	ldr r0, _08036ECC @ =0x0202E3F4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _08036E6C
_08036E36:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl sub_08039510
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _08036E6C
	ldr r0, _08036ED0 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08036E6C
	ldrb r0, [r0]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_08036E6C:
	ldr r1, _08036ED4 @ =0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _08036DD6
_08036E78:
	ldr r1, _08036ED4 @ =0xFFFF0000
	adds r0, r7, r1
_08036E7C:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08036DC0
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08036EA4
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
_08036EA4:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036EB4: .4byte 0x0202E3D8
_08036EB8: .4byte 0x0202E3E4
_08036EBC: .4byte 0x0202E3DC
_08036EC0: .4byte 0x0202BD48
_08036EC4: .4byte 0x03004690
_08036EC8: .4byte 0x0203A8EC
_08036ECC: .4byte 0x0202E3F4
_08036ED0: .4byte 0x0202E3E8
_08036ED4: .4byte 0xFFFF0000

	thumb_func_start AiGetUnitClosestValidPosition
AiGetUnitClosestValidPosition: @ 0x08036ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	adds r6, r3, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	asrs r5, r2, #0x10
	ldr r2, _08036F2C @ =0x0202E3DC
	ldr r0, [r2]
	lsls r2, r5, #2
	adds r0, r2, r0
	lsrs r4, r1, #0x10
	mov r8, r4
	asrs r4, r1, #0x10
	ldr r1, [r0]
	adds r1, r1, r4
	ldr r7, _08036F30 @ =0x0202E3F4
	ldr r0, [r7]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	ldr r0, _08036F34 @ =0x0202E3F0
	ldr r0, [r0]
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _08036F38
	mov r1, r8
	strh r1, [r6]
	strh r3, [r6, #2]
	b _08037030
	.align 2, 0
_08036F2C: .4byte 0x0202E3DC
_08036F30: .4byte 0x0202E3F4
_08036F34: .4byte 0x0202E3F0
_08036F38:
	ldr r0, [sp, #8]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	ldr r0, [sp, #8]
	bl MapFloodUnitExtended
	movs r2, #0x7c
	str r2, [sp]
	ldr r0, _08036F60 @ =0x0000FFFF
	strh r0, [r6]
	ldr r1, _08036F64 @ =0x0202E3D8
	ldrh r0, [r1, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08036FFE
	.align 2, 0
_08036F60: .4byte 0x0000FFFF
_08036F64: .4byte 0x0202E3D8
_08036F68:
	ldr r4, _08037014 @ =0x0202E3D8
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r5, #0x10
	str r7, [sp, #8]
	cmp r1, #0
	blt _08036FF8
	asrs r3, r7, #0xe
	ldr r0, _08037018 @ =0x0202E3E4
	str r0, [sp, #4]
	ldr r2, _0803701C @ =0x0202E3DC
	mov sl, r2
	ldr r7, _08037020 @ =0x0202E3F4
	mov sb, r7
	ldr r0, _08037024 @ =0x0202E3F0
	mov r8, r0
	ldr r2, _08037028 @ =0x0202E3E8
	mov ip, r2
_08036F92:
	ldr r7, [sp, #4]
	ldr r0, [r7]
	adds r0, r3, r0
	asrs r2, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036FEA
	mov r1, sl
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, r1, r2
	mov r7, sb
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	mov r7, r8
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _08036FEA
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r7, [sp]
	cmp r2, r7
	bhi _08036FEA
	ldrb r0, [r0]
	str r0, [sp]
	strh r4, [r6]
	strh r5, [r6, #2]
_08036FEA:
	lsls r0, r4, #0x10
	ldr r1, _0803702C @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _08036F92
_08036FF8:
	ldr r2, [sp, #8]
	ldr r4, _0803702C @ =0xFFFF0000
	adds r0, r2, r4
_08036FFE:
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _08036F68
	movs r7, #0
	ldrsh r1, [r6, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08037030
	movs r0, #0
	b _08037032
	.align 2, 0
_08037014: .4byte 0x0202E3D8
_08037018: .4byte 0x0202E3E4
_0803701C: .4byte 0x0202E3DC
_08037020: .4byte 0x0202E3F4
_08037024: .4byte 0x0202E3F0
_08037028: .4byte 0x0202E3E8
_0803702C: .4byte 0xFFFF0000
_08037030:
	movs r0, #1
_08037032:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiGetClassRank
AiGetClassRank: @ 0x08037044
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r2, _08037050 @ =0x08B970C8
	b _0803706C
	.align 2, 0
_08037050: .4byte 0x08B970C8
_08037054:
	ldr r1, [r2]
	b _0803705E
_08037058:
	cmp r0, r4
	beq _08037072
	adds r1, #1
_0803705E:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08037058
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #4
_0803706C:
	ldr r0, [r2]
	cmp r0, #0
	bne _08037054
_08037072:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiUnitWithCharIdExists
AiUnitWithCharIdExists: @ 0x0803707C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_08037084:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080370B8
	ldr r0, [r1]
	cmp r0, #0
	beq _080370B8
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080370B8
	ldr r1, [r1, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080370AA
_080370A6:
	movs r0, #1
	b _080370C0
_080370AA:
	ldr r0, _080370B4 @ =0x00010005
	ands r1, r0
	cmp r1, #0
	bne _080370BE
	b _080370A6
	.align 2, 0
_080370B4: .4byte 0x00010005
_080370B8:
	adds r4, #1
	cmp r4, #0xbf
	ble _08037084
_080370BE:
	movs r0, #0
_080370C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiIsWithinRectDistance
AiIsWithinRectDistance: @ 0x080370C8
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r0, r2
	cmp r1, #0
	bge _080370EA
	subs r1, r2, r0
_080370EA:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	subs r0, r2, r3
	cmp r0, #0
	bge _080370F6
	subs r0, r6, r2
_080370F6:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bls _08037104
	movs r0, #0
	b _08037106
_08037104:
	movs r0, #1
_08037106:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start AiLocationIsPillageTarget
AiLocationIsPillageTarget: @ 0x0803710C
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _08037134 @ =0x0202E3E0
	ldr r2, [r2]
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x21
	beq _08037142
	cmp r0, #0x21
	bgt _08037138
	cmp r0, #3
	beq _08037150
	b _08037154
	.align 2, 0
_08037134: .4byte 0x0202E3E0
_08037138:
	cmp r0, #0x24
	beq _08037150
	cmp r0, #0x37
	bne _08037154
	b _08037150
_08037142:
	mov r0, sp
	bl AiGetChestUnlockItemSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037154
_08037150:
	movs r0, #1
	b _08037156
_08037154:
	movs r0, #0
_08037156:
	add sp, #4
	pop {r1}
	bx r1

	thumb_func_start SetupUnitInventoryAIFlags
SetupUnitInventoryAIFlags: @ 0x0803715C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08037210 @ =0x0203A8EC
	adds r0, #0x85
	movs r1, #0
	strb r1, [r0]
	movs r4, #1
_08037168:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	cmp r5, #0
	beq _08037202
	ldr r0, [r5]
	cmp r0, #0
	beq _08037202
	ldr r0, [r5, #0xc]
	ldr r1, _08037214 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08037202
	ldr r0, [r5, #4]
	ldrb r1, [r5, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08037210 @ =0x0203A8EC
	adds r0, #0x85
	ldrb r2, [r0]
	cmp r1, r2
	bls _0803719E
	strb r1, [r0]
_0803719E:
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _080371FC
_080371A6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080371C2
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080371E8
_080371C2:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080371D8
	movs r0, #1
	ldrb r1, [r5, #0xa]
	orrs r0, r1
	strb r0, [r5, #0xa]
_080371D8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08037218
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetupUnitHealStaffAIFlags
_080371E8:
	adds r6, #1
	cmp r6, #4
	bgt _080371FC
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080371A6
_080371FC:
	adds r0, r5, #0
	bl SaveNumberOfAlliedUnitsIn0To8Range
_08037202:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _08037168
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037210: .4byte 0x0203A8EC
_08037214: .4byte 0x00010005

	thumb_func_start sub_08037218
sub_08037218: @ 0x08037218
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803725A
	movs r4, #2
	adds r0, r5, #0
	bl GetItemIid
	cmp r0, #0x51
	beq _0803724E
	cmp r0, #0x51
	bgt _08037244
	cmp r0, #0x50
	beq _0803724A
	b _08037254
_08037244:
	cmp r0, #0x52
	beq _08037252
	b _08037254
_0803724A:
	movs r4, #8
	b _08037254
_0803724E:
	movs r4, #0x10
	b _08037254
_08037252:
	movs r4, #0x20
_08037254:
	ldrb r0, [r6, #0xa]
	orrs r4, r0
	strb r4, [r6, #0xa]
_0803725A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SetupUnitHealStaffAIFlags
SetupUnitHealStaffAIFlags: @ 0x08037260
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r5, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08037284
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _08037284
	movs r5, #0x40
_08037284:
	adds r0, r4, #0
	bl GetItemEffect
	cmp r0, #1
	blt _0803729E
	cmp r0, #5
	ble _0803729A
	cmp r0, #0x22
	bgt _0803729E
	cmp r0, #0x21
	blt _0803729E
_0803729A:
	movs r0, #4
	orrs r5, r0
_0803729E:
	ldrb r0, [r6, #0xa]
	orrs r5, r0
	strb r5, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

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

	thumb_func_start CharStoreAI
CharStoreAI: @ 0x08037350
	adds r3, r0, #0
	ldrb r0, [r1, #0xc]
	adds r2, r3, #0
	adds r2, #0x42
	strb r0, [r2]
	ldrb r2, [r1, #0xd]
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x40
	ldr r0, _0803737C @ =0x0000FFF8
	ldrh r3, [r2]
	ands r0, r3
	ldrb r3, [r1, #0xe]
	orrs r0, r3
	ldrb r1, [r1, #0xf]
	lsls r1, r1, #8
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0803737C: .4byte 0x0000FFF8

	thumb_func_start sub_08037380
sub_08037380: @ 0x08037380
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	movs r0, #0
	mov sb, r0
	ldr r0, _08037434 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803742A
_0803739C:
	ldr r0, _08037434 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _08037424
	lsls r7, r6, #2
_080373AE:
	ldr r0, _08037438 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803741E
	ldr r0, _0803743C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803741E
	ldr r0, _08037440 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _080373EA
	ldr r0, _08037444 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803741E
_080373EA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _08037448 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r1, _0803744C @ =0x7FFFFFFF
	adds r4, r4, r1
	cmp sb, r4
	bhs _0803741E
	mov r0, r8
	strh r5, [r0]
	strh r6, [r0, #2]
	mov sb, r4
_0803741E:
	subs r5, #1
	cmp r5, #0
	bge _080373AE
_08037424:
	mov r6, sl
	cmp r6, #0
	bge _0803739C
_0803742A:
	mov r1, sb
	cmp r1, #0
	bne _08037450
	movs r0, #0
	b _08037452
	.align 2, 0
_08037434: .4byte 0x0202E3D8
_08037438: .4byte 0x0202E3E4
_0803743C: .4byte 0x0202E3E8
_08037440: .4byte 0x0202E3DC
_08037444: .4byte 0x0202BD48
_08037448: .4byte 0x0202E3F4
_0803744C: .4byte 0x7FFFFFFF
_08037450:
	movs r0, #1
_08037452:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08037460
sub_08037460: @ 0x08037460
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetActiveFactionAlliance
	adds r5, r0, #0
	adds r4, r5, #1
	b _0803749A
_0803746E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08037496
	ldr r0, [r2]
	cmp r0, #0
	beq _08037496
	ldr r0, [r2, #0xc]
	ldr r1, _080374A8 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08037496
	movs r0, #1
	ldrb r2, [r2, #0xa]
	ands r0, r2
	cmp r0, #0
	beq _08037496
	adds r6, #1
_08037496:
	adds r4, #1
	adds r0, r5, #0
_0803749A:
	adds r0, #0x80
	cmp r4, r0
	blt _0803746E
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080374A8: .4byte 0x00010005

	thumb_func_start sub_080374AC
sub_080374AC: @ 0x080374AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, _08037538 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803752C
_080374C0:
	ldr r0, _08037538 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r1, #1
	mov r8, r0
	cmp r4, #0
	blt _08037526
	lsls r5, r1, #2
_080374D2:
	ldr r0, _0803753C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08037520
	ldr r6, _08037540 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08037520
	ldr r0, _08037544 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037520
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	movs r1, #1
	ldrb r0, [r0, #0xa]
	ands r1, r0
	cmp r1, #0
	beq _08037520
	adds r7, #1
_08037520:
	subs r4, #1
	cmp r4, #0
	bge _080374D2
_08037526:
	mov r1, r8
	cmp r1, #0
	bge _080374C0
_0803752C:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08037538: .4byte 0x0202E3D8
_0803753C: .4byte 0x0202E3E8
_08037540: .4byte 0x0202E3DC
_08037544: .4byte 0x0202BD48

	thumb_func_start sub_08037548
sub_08037548: @ 0x08037548
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_0803754E:
	lsls r0, r5, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08037584
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _0803757E
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803757E
	movs r0, #1
	b _08037586
_0803757E:
	adds r5, #1
	cmp r5, #4
	ble _0803754E
_08037584:
	movs r0, #0
_08037586:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0803758C
sub_0803758C: @ 0x0803758C
	push {lr}
	adds r2, r0, #0
	ldr r1, _080375A8 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080375AC
	adds r0, r2, #0
	movs r1, #0
	bl MapFloodUnitMovement
	b _080375B2
	.align 2, 0
_080375A8: .4byte 0x0203A8EC
_080375AC:
	adds r0, r2, #0
	bl RevertMapChange
_080375B2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080375B8
sub_080375B8: @ 0x080375B8
	push {r4, lr}
	ldr r3, _080375F8 @ =0x030013B8
	ldr r1, _080375FC @ =0x08B989F0
	ldr r0, _08037600 @ =0x03004690
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x42
	ldr r2, [r1]
	ldrb r4, [r4]
	lsls r1, r4, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r3]
	adds r0, #0x43
	ldrb r4, [r0]
	lsls r2, r4, #4
	adds r1, r1, r2
	str r1, [r3]
	ldr r4, _08037604 @ =0x030013B0
	movs r1, #1
	strb r1, [r4]
	ldr r2, _08037608 @ =0x030013B4
	movs r1, #0
	str r1, [r2]
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080375F8: .4byte 0x030013B8
_080375FC: .4byte 0x08B989F0
_08037600: .4byte 0x03004690
_08037604: .4byte 0x030013B0
_08037608: .4byte 0x030013B4

	thumb_func_start AiExecFallbackScriptA
AiExecFallbackScriptA: @ 0x0803760C
	push {r4, lr}
	ldr r1, _08037634 @ =0x030013B8
	ldr r0, _08037638 @ =0x08B970A4
	str r0, [r1]
	ldr r4, _0803763C @ =0x030013B0
	movs r0, #1
	strb r0, [r4]
	ldr r1, _08037640 @ =0x030013B4
	movs r0, #0
	str r0, [r1]
	ldr r0, _08037644 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x43
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037634: .4byte 0x030013B8
_08037638: .4byte 0x08B970A4
_0803763C: .4byte 0x030013B0
_08037640: .4byte 0x030013B4
_08037644: .4byte 0x03004690

	thumb_func_start sub_08037648
sub_08037648: @ 0x08037648
	push {r4, lr}
	ldr r3, _08037688 @ =0x030013B8
	ldr r2, _0803768C @ =0x08B989E4
	ldr r0, _08037690 @ =0x03004690
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	ldr r2, [r2]
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r3]
	adds r0, #0x45
	ldrb r4, [r0]
	lsls r2, r4, #4
	adds r1, r1, r2
	str r1, [r3]
	ldr r4, _08037694 @ =0x030013B0
	movs r1, #1
	strb r1, [r4]
	ldr r2, _08037698 @ =0x030013B4
	movs r1, #1
	str r1, [r2]
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037688: .4byte 0x030013B8
_0803768C: .4byte 0x08B989E4
_08037690: .4byte 0x03004690
_08037694: .4byte 0x030013B0
_08037698: .4byte 0x030013B4

	thumb_func_start AiExecFallbackScriptB
AiExecFallbackScriptB: @ 0x0803769C
	push {r4, lr}
	ldr r1, _080376C4 @ =0x030013B8
	ldr r0, _080376C8 @ =0x08B970B4
	str r0, [r1]
	ldr r4, _080376CC @ =0x030013B0
	movs r0, #1
	strb r0, [r4]
	ldr r1, _080376D0 @ =0x030013B4
	movs r0, #1
	str r0, [r1]
	ldr r0, _080376D4 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x45
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080376C4: .4byte 0x030013B8
_080376C8: .4byte 0x08B970B4
_080376CC: .4byte 0x030013B0
_080376D0: .4byte 0x030013B4
_080376D4: .4byte 0x03004690

	thumb_func_start AiScript_Exec
AiScript_Exec: @ 0x080376D8
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, _08037700 @ =0x081D3678
	mov r0, sp
	movs r2, #0x70
	bl memcpy
	ldr r1, _08037704 @ =0x030013B8
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0x1b
	bls _08037714
	ldr r0, _08037708 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037710
	ldr r0, _0803770C @ =0x08B970A4
	b _08037712
	.align 2, 0
_08037700: .4byte 0x081D3678
_08037704: .4byte 0x030013B8
_08037708: .4byte 0x030013B4
_0803770C: .4byte 0x08B970A4
_08037710:
	ldr r0, _08037738 @ =0x08B970B4
_08037712:
	str r0, [r1]
_08037714:
	ldr r1, _0803773C @ =0x0203A8EC
	ldr r0, _08037740 @ =0x030013B8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	adds r1, #0x7e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	add sp, #0x70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037738: .4byte 0x08B970B4
_0803773C: .4byte 0x0203A8EC
_08037740: .4byte 0x030013B8

	thumb_func_start sub_08037744
sub_08037744: @ 0x08037744
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08037774 @ =0x030013B8
	ldr r2, [r0]
	ldrb r5, [r2, #3]
	movs r4, #0
	ldr r0, [r2, #8]
	ldrb r1, [r2, #1]
	ldr r2, [r2, #4]
	bl sub_08035838
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080377D0
	ldr r0, _08037778 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _08037784
	ldr r1, _0803777C @ =0x08B989F0
	ldr r0, _08037780 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x42
	b _0803778C
	.align 2, 0
_08037774: .4byte 0x030013B8
_08037778: .4byte 0x030013B4
_0803777C: .4byte 0x08B989F0
_08037780: .4byte 0x03004690
_08037784:
	ldr r1, _080377A4 @ =0x08B989E4
	ldr r0, _080377A8 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x44
_0803778C:
	ldr r1, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r5, #0
	beq _080377CC
	lsls r0, r4, #4
	adds r0, r0, r1
	ldr r2, _080377AC @ =0x030013B0
	b _080377BA
	.align 2, 0
_080377A4: .4byte 0x08B989E4
_080377A8: .4byte 0x03004690
_080377AC: .4byte 0x030013B0
_080377B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r0, r0, r1
_080377BA:
	ldrb r3, [r0]
	cmp r3, #0x1b
	bne _080377B0
	ldrb r0, [r0, #3]
	cmp r0, r5
	bne _080377B0
	adds r0, r4, #1
	strb r0, [r6]
	b _080377D8
_080377CC:
	strb r5, [r6]
	b _080377D6
_080377D0:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_080377D6:
	ldr r2, _080377E4 @ =0x030013B0
_080377D8:
	movs r0, #0
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080377E4: .4byte 0x030013B0

	thumb_func_start AiScriptCmd_01_FunctionCall
AiScriptCmd_01_FunctionCall: @ 0x080377E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0803780C @ =0x030013BC
	ldr r0, _08037810 @ =0x030013B8
	ldr r0, [r0]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	bl _call_via_r1
	ldr r1, _08037814 @ =0x030013B0
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803780C: .4byte 0x030013BC
_08037810: .4byte 0x030013B8
_08037814: .4byte 0x030013B0

	thumb_func_start AiScriptCmd_02_ChangeAi
AiScriptCmd_02_ChangeAi: @ 0x08037818
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08037878 @ =0x030013B8
	ldr r0, [r0]
	ldrb r3, [r0, #1]
	adds r6, r3, #0
	ldrb r4, [r0, #2]
	adds r7, r4, #0
	cmp r3, #0xff
	beq _0803783C
	ldr r1, _0803787C @ =0x03004690
	ldr r0, [r1]
	adds r0, #0x42
	movs r2, #0
	strb r3, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r2, [r0]
_0803783C:
	cmp r4, #0xff
	beq _08037850
	ldr r1, _0803787C @ =0x03004690
	ldr r0, [r1]
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x45
	strb r2, [r0]
_08037850:
	ldr r0, _08037880 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803785C
	cmp r6, #0xff
	beq _08037864
_0803785C:
	cmp r0, #1
	bne _0803786A
	cmp r7, #0xff
	bne _0803786A
_08037864:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803786A:
	ldr r0, _08037884 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037878: .4byte 0x030013B8
_0803787C: .4byte 0x03004690
_08037880: .4byte 0x030013B4
_08037884: .4byte 0x0203A8EC

	thumb_func_start sub_08037888
sub_08037888: @ 0x08037888
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080378A8 @ =0x030013B8
	ldr r0, [r0]
	ldrb r3, [r0, #3]
	movs r2, #0
	ldr r0, _080378AC @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _080378B8
	ldr r1, _080378B0 @ =0x08B989F0
	ldr r0, _080378B4 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x42
	b _080378C0
	.align 2, 0
_080378A8: .4byte 0x030013B8
_080378AC: .4byte 0x030013B4
_080378B0: .4byte 0x08B989F0
_080378B4: .4byte 0x03004690
_080378B8:
	ldr r1, _080378D8 @ =0x08B989E4
	ldr r0, _080378DC @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x44
_080378C0:
	ldr r1, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r3, #0
	beq _08037900
	lsls r0, r2, #4
	adds r0, r0, r1
	ldr r5, _080378E0 @ =0x030013B0
	b _080378EE
	.align 2, 0
_080378D8: .4byte 0x08B989E4
_080378DC: .4byte 0x03004690
_080378E0: .4byte 0x030013B0
_080378E4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #4
	adds r0, r0, r1
_080378EE:
	ldrb r6, [r0]
	cmp r6, #0x1b
	bne _080378E4
	ldrb r0, [r0, #3]
	cmp r0, r3
	bne _080378E4
	adds r0, r2, #1
	strb r0, [r4]
	b _08037904
_08037900:
	strb r3, [r4]
	ldr r5, _08037910 @ =0x030013B0
_08037904:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037910: .4byte 0x030013B0

	thumb_func_start AiIsUnitEnemy
AiIsUnitEnemy: @ 0x08037914
	push {lr}
	adds r1, r0, #0
	ldr r0, _08037938 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803793C
	movs r0, #1
	b _0803793E
	.align 2, 0
_08037938: .4byte 0x03004690
_0803793C:
	movs r0, #0
_0803793E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiIsUnitNonActive
AiIsUnitNonActive: @ 0x08037944
	ldr r1, _08037950 @ =0x03004690
	ldr r1, [r1]
	cmp r0, r1
	beq _08037954
	movs r0, #1
	b _08037956
	.align 2, 0
_08037950: .4byte 0x03004690
_08037954:
	movs r0, #0
_08037956:
	bx lr

	thumb_func_start AiIsUnitEnemyAndNotInScrList
AiIsUnitEnemyAndNotInScrList: @ 0x08037958
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037990 @ =0x030013B8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08037998
	ldr r0, _08037994 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037998
	movs r0, #1
	b _0803799A
	.align 2, 0
_08037990: .4byte 0x030013B8
_08037994: .4byte 0x03004690
_08037998:
	movs r0, #0
_0803799A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start AiIsUnitEnemyOrInScrList
AiIsUnitEnemyOrInScrList: @ 0x080379A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080379D8 @ =0x030013B8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080379D2
	ldr r0, _080379DC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080379E0
_080379D2:
	movs r0, #1
	b _080379E2
	.align 2, 0
_080379D8: .4byte 0x030013B8
_080379DC: .4byte 0x03004690
_080379E0:
	movs r0, #0
_080379E2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start AiIsUnitEnemyAndScrCharId
AiIsUnitEnemyAndScrCharId: @ 0x080379E8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _08037A18 @ =0x030013B8
	ldr r1, [r1]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _08037A20
	ldr r0, _08037A1C @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037A20
	movs r0, #1
	b _08037A22
	.align 2, 0
_08037A18: .4byte 0x030013B8
_08037A1C: .4byte 0x03004690
_08037A20:
	movs r0, #0
_08037A22:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiIsUnitEnemyAndScrClassId
AiIsUnitEnemyAndScrClassId: @ 0x08037A28
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldr r1, _08037A58 @ =0x030013B8
	ldr r1, [r1]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _08037A60
	ldr r0, _08037A5C @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037A60
	movs r0, #1
	b _08037A62
	.align 2, 0
_08037A58: .4byte 0x030013B8
_08037A5C: .4byte 0x03004690
_08037A60:
	movs r0, #0
_08037A62:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiScriptCmd_04_ActionOnSelectedCharacter
AiScriptCmd_04_ActionOnSelectedCharacter: @ 0x08037A68
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08037AB8 @ =0x030013B8
	ldr r1, [r5]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08037AE8
	ldr r0, _08037ABC @ =AiIsUnitEnemy
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _08037AF0
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	bl AiUnitWithCharIdExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037AD0
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08037AC4
	ldr r0, _08037AC0 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #3
	b _08037AD6
	.align 2, 0
_08037AB8: .4byte 0x030013B8
_08037ABC: .4byte AiIsUnitEnemy
_08037AC0: .4byte 0x0203A8EC
_08037AC4:
	ldr r0, _08037ACC @ =AiIsUnitEnemyAndScrCharId
	bl AiAttemptOffensiveAction
	b _08037AF0
	.align 2, 0
_08037ACC: .4byte AiIsUnitEnemyAndScrCharId
_08037AD0:
	ldr r0, _08037AE0 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
_08037AD6:
	strb r1, [r0]
	ldr r0, _08037AE4 @ =0x030013B0
	strb r4, [r0]
	b _08037AF0
	.align 2, 0
_08037AE0: .4byte 0x0203A8EC
_08037AE4: .4byte 0x030013B0
_08037AE8:
	ldr r0, _08037AFC @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037AF0:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037AFC: .4byte 0x0203A8EC

	thumb_func_start AiScriptCmd_05_DoStandardAction
AiScriptCmd_05_DoStandardAction: @ 0x08037B00
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037B34 @ =0x030013B8
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	cmp r0, r2
	bhi _08037B58
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08037B3C
	ldr r4, _08037B38 @ =AiIsUnitEnemy
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037B60
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _08037B60
	.align 2, 0
_08037B34: .4byte 0x030013B8
_08037B38: .4byte AiIsUnitEnemy
_08037B3C:
	ldr r0, _08037B50 @ =AiIsUnitEnemyOrInScrList
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037B60
	ldr r0, _08037B54 @ =AiIsUnitEnemyAndNotInScrList
	bl AiAttemptOffensiveAction
	b _08037B60
	.align 2, 0
_08037B50: .4byte AiIsUnitEnemyOrInScrList
_08037B54: .4byte AiIsUnitEnemyAndNotInScrList
_08037B58:
	ldr r0, _08037B6C @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037B60:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037B6C: .4byte 0x0203A8EC

	thumb_func_start sub_08037B70
sub_08037B70: @ 0x08037B70
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_08037B78
sub_08037B78: @ 0x08037B78
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037BB4 @ =0x030013B8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08037BC0
	ldr r0, _08037BB8 @ =0x0203A8EC
	adds r0, #0x7b
	movs r1, #2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r4, _08037BBC @ =AiIsUnitEnemy
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037BC8
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _08037BC8
	.align 2, 0
_08037BB4: .4byte 0x030013B8
_08037BB8: .4byte 0x0203A8EC
_08037BBC: .4byte AiIsUnitEnemy
_08037BC0:
	ldr r0, _08037BD4 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037BC8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037BD4: .4byte 0x0203A8EC

	thumb_func_start AiScriptCmd_08_DoStandardActionAgainstClass
AiScriptCmd_08_DoStandardActionAgainstClass: @ 0x08037BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037C08 @ =0x030013B8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08037C10
	ldr r4, _08037C0C @ =AiIsUnitEnemyAndScrClassId
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037C18
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _08037C18
	.align 2, 0
_08037C08: .4byte 0x030013B8
_08037C0C: .4byte AiIsUnitEnemyAndScrClassId
_08037C10:
	ldr r0, _08037C24 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037C18:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037C24: .4byte 0x0203A8EC

	thumb_func_start sub_08037C28
sub_08037C28: @ 0x08037C28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037C40 @ =AiIsUnitEnemy
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037C40: .4byte AiIsUnitEnemy

	thumb_func_start sub_08037C44
sub_08037C44: @ 0x08037C44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037C5C @ =AiIsUnitEnemy
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037C5C: .4byte AiIsUnitEnemy

	thumb_func_start sub_08037C60
sub_08037C60: @ 0x08037C60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037C78 @ =AiIsUnitEnemy
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037C78: .4byte AiIsUnitEnemy

	thumb_func_start sub_08037C7C
sub_08037C7C: @ 0x08037C7C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08037CC0 @ =0x030013B8
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r0, _08037CC4 @ =0x0203A97C
	ldrb r1, [r0, #0xa]
	cmp r1, #1
	bne _08037CB6
	ldr r2, [r4]
	ldrb r3, [r0, #2]
	ldrb r1, [r2, #1]
	cmp r3, r1
	bne _08037CB6
	ldrb r0, [r0, #3]
	ldrb r2, [r2, #3]
	cmp r0, r2
	bne _08037CB6
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_08037CB6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037CC0: .4byte 0x030013B8
_08037CC4: .4byte 0x0203A97C

	thumb_func_start AiScriptCmd_0D_MoveTowardsCharacterUntilInRange
AiScriptCmd_0D_MoveTowardsCharacterUntilInRange: @ 0x08037CC8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _08037D38 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByCharId
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037D6C
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, _08037D3C @ =0x0203A97C
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037D72
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq _08037D44
	ldr r0, _08037D40 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b _08037D72
	.align 2, 0
_08037D38: .4byte 0x030013B8
_08037D3C: .4byte 0x0203A97C
_08037D40: .4byte 0x0203A8EC
_08037D44:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	ldr r0, _08037D64 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, _08037D68 @ =0x030013B0
	strb r4, [r0]
	b _08037D72
	.align 2, 0
_08037D64: .4byte 0x0203A8EC
_08037D68: .4byte 0x030013B0
_08037D6C:
	ldr r1, _08037D80 @ =0x030013B0
	movs r0, #0
	strb r0, [r1]
_08037D72:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037D80: .4byte 0x030013B0

	thumb_func_start sub_08037D84
sub_08037D84: @ 0x08037D84
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start AiScriptCmd_0F_MoveTowardsUnitWithClass
AiScriptCmd_0F_MoveTowardsUnitWithClass: @ 0x08037D8C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, _08037DCC @ =0x030013B8
	ldr r0, [r7]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByClassId
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037DBE
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r7]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
_08037DBE:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037DCC: .4byte 0x030013B8

	thumb_func_start sub_08037DD0
sub_08037DD0: @ 0x08037DD0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037E20
	ldr r3, _08037E14 @ =0x030013B8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _08037EBC
	ldr r2, _08037E18 @ =0x03004690
	ldr r0, [r2]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08037EBC
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08037E1C @ =0x030013B0
	movs r0, #0
	b _08037EBA
	.align 2, 0
_08037E14: .4byte 0x030013B8
_08037E18: .4byte 0x03004690
_08037E1C: .4byte 0x030013B0
_08037E20:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl AiFindPillageLocation
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08037EB0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r4, _08037EA0 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiLocationIsPillageTarget
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037EBC
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AiSetDecision
	ldr r3, _08037EA4 @ =0x030013B8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _08037EBC
	ldr r2, _08037EA8 @ =0x03004690
	ldr r0, [r2]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08037EBC
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08037EAC @ =0x030013B0
	strb r4, [r0]
	b _08037EBC
	.align 2, 0
_08037EA0: .4byte 0x0203A97C
_08037EA4: .4byte 0x030013B8
_08037EA8: .4byte 0x03004690
_08037EAC: .4byte 0x030013B0
_08037EB0:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08037EC4 @ =0x030013B0
	movs r0, #0
_08037EBA:
	strb r0, [r1]
_08037EBC:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037EC4: .4byte 0x030013B0

	thumb_func_start AiScriptCmd_11_MoveTowardsSafety
AiScriptCmd_11_MoveTowardsSafety: @ 0x08037EC8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _08037F08 @ =0x03004690
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl AiFindSafestReachableLocation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037EFA
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0
	bl AiSetDecision
_08037EFA:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037F08: .4byte 0x03004690

	thumb_func_start sub_08037F0C
sub_08037F0C: @ 0x08037F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _08037F48 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08037F50
	ldr r0, _08037F4C @ =AiIsUnitEnemy
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByFunc
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037F78
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b _08037F78
	.align 2, 0
_08037F48: .4byte 0x030013B8
_08037F4C: .4byte AiIsUnitEnemy
_08037F50:
	ldr r0, _08037F88 @ =AiIsUnitEnemyAndNotInScrList
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByFunc
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037F78
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
_08037F78:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037F88: .4byte AiIsUnitEnemyAndNotInScrList

	thumb_func_start sub_08037F8C
sub_08037F8C: @ 0x08037F8C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _08037FC8 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08037FD0
	ldr r0, _08037FCC @ =AiIsUnitEnemy
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_08035B54
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037FF8
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036CEC
	b _08037FF8
	.align 2, 0
_08037FC8: .4byte 0x030013B8
_08037FCC: .4byte AiIsUnitEnemy
_08037FD0:
	ldr r0, _08038008 @ =AiIsUnitEnemyAndNotInScrList
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_08035B54
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037FF8
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_08036CEC
_08037FF8:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038008: .4byte AiIsUnitEnemyAndNotInScrList

	thumb_func_start sub_0803800C
sub_0803800C: @ 0x0803800C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_08038014
sub_08038014: @ 0x08038014
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start AiScriptCmd_16_RandomMovement
AiScriptCmd_16_RandomMovement: @ 0x0803801C
	push {r4, lr}
	adds r4, r0, #0
	bl AiRandomMove
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08038030
sub_08038030: @ 0x08038030
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08038050 @ =0x03004690
	ldr r1, [r0]
	movs r0, #8
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
	bl AiTryMoveTowardsEscape
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038050: .4byte 0x03004690

	thumb_func_start sub_08038054
sub_08038054: @ 0x08038054
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _0803809C @ =0x0202E3E4
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _080380A0 @ =0x0202E3F4
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _080380A4 @ =0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803809C: .4byte 0x0202E3E4
_080380A0: .4byte 0x0202E3F4
_080380A4: .4byte 0x7FFFFFFF

	thumb_func_start sub_080380A8
sub_080380A8: @ 0x080380A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r4, _080381EC @ =0x03004690
	ldr r0, [r4]
	bl RevertMapChange
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	mov r8, r0
	cmp r0, #0
	beq _080381D2
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	lsls r6, r6, #0x10
	str r6, [sp, #0x1c]
_080380E6:
	ldr r0, _080381EC @ =0x03004690
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov sb, r1
	cmp r0, #0
	beq _080381B8
	ldr r0, _080381F0 @ =0x0202E3E8
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
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _080381F4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _080381B8
_08038138:
	ldr r0, _080381F4 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _080381B2
	lsls r7, r6, #2
_0803814A:
	ldr r0, _080381F8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080381AC
	ldr r0, _080381F0 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080381AC
	ldr r0, _080381FC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _08038186
	ldr r0, _08038200 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _080381AC
_08038186:
	mov r0, r8
	bl GetItemMight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08038054
	adds r4, r4, r0
	ldr r1, [sp, #0x14]
	cmp r4, r1
	bls _080381AC
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
_080381AC:
	subs r5, #1
	cmp r5, #0
	bge _0803814A
_080381B2:
	mov r6, sl
	cmp r6, #0
	bge _08038138
_080381B8:
	mov r1, sb
	str r1, [sp, #8]
	cmp r1, #4
	bgt _080381D2
	ldr r0, _080381EC @ =0x03004690
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _080380E6
_080381D2:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _08038204
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
	b _08038206
	.align 2, 0
_080381EC: .4byte 0x03004690
_080381F0: .4byte 0x0202E3E8
_080381F4: .4byte 0x0202E3D8
_080381F8: .4byte 0x0202E3E4
_080381FC: .4byte 0x0202E3DC
_08038200: .4byte 0x0202BD48
_08038204:
	movs r0, #0
_08038206:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08038218
sub_08038218: @ 0x08038218
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov sb, r0
	ldr r0, _080382F4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080382EA
_0803823A:
	ldr r0, _080382F4 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _080382E4
	lsls r6, r5, #2
_0803824C:
	ldr r0, _080382F8 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080382DE
	ldr r0, _080382FC @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080382DE
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080382A4
	ldr r0, _08038300 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080382A4
	ldr r0, _08038304 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080382DE
_080382A4:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080382BE
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080382DE
_080382BE:
	ldr r0, _080382F8 @ =0x0202E3E8
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	ble _080382DE
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_080382DE:
	subs r4, #1
	cmp r4, #0
	bge _0803824C
_080382E4:
	mov r5, sl
	cmp r5, #0
	bge _0803823A
_080382EA:
	mov r0, sb
	cmp r0, #0xff
	bne _08038308
	movs r0, #0
	b _0803830A
	.align 2, 0
_080382F4: .4byte 0x0202E3D8
_080382F8: .4byte 0x0202E3E8
_080382FC: .4byte 0x0202E3E0
_08038300: .4byte 0x0202E3DC
_08038304: .4byte 0x03004690
_08038308:
	movs r0, #1
_0803830A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803831C
sub_0803831C: @ 0x0803831C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _080383A0 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803C058
	ldr r0, _080383A4 @ =0x08B970C4
	add r4, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl sub_08038218
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _080383BC
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	add r5, sp, #0x14
	adds r2, r5, #0
	add r3, sp, #0xc
	bl sub_080380A8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080383A8
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl GetTrapAt
	cmp r0, #0
	bne _0803837A
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r1, #1
	bl GetTrapAt
	cmp r0, #0
	beq _080383D0
_0803837A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	ldrb r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0
	bl AiSetDecision
	b _080383CA
	.align 2, 0
_080383A0: .4byte 0x03004690
_080383A4: .4byte 0x08B970C4
_080383A8:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	b _080383CA
_080383BC:
	ldr r0, _080383D8 @ =0x0203A8EC
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _080383DC @ =0x030013B0
	strb r2, [r0]
_080383CA:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_080383D0:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080383D8: .4byte 0x0203A8EC
_080383DC: .4byte 0x030013B0

	thumb_func_start AiScriptCmd_19_MoveTowardsTerrain
AiScriptCmd_19_MoveTowardsTerrain: @ 0x080383E0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _08038430 @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	ldr r6, _08038434 @ =0x030013B8
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08038438
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b _08038446
	.align 2, 0
_08038430: .4byte 0x03004690
_08038434: .4byte 0x030013B8
_08038438:
	ldr r0, _08038454 @ =0x0203A8EC
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _08038458 @ =0x030013B0
	strb r2, [r0]
_08038446:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038454: .4byte 0x0203A8EC
_08038458: .4byte 0x030013B0

	thumb_func_start AiScriptCmd_1A_MoveTowardsTerrain
AiScriptCmd_1A_MoveTowardsTerrain: @ 0x0803845C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080384AC @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	ldr r6, _080384B0 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _080384B4
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b _080384C2
	.align 2, 0
_080384AC: .4byte 0x03004690
_080384B0: .4byte 0x030013B8
_080384B4:
	ldr r0, _080384D0 @ =0x0203A8EC
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _080384D4 @ =0x030013B0
	strb r2, [r0]
_080384C2:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080384D0: .4byte 0x0203A8EC
_080384D4: .4byte 0x030013B0

	thumb_func_start AiScriptCmd_1B_NoOp
AiScriptCmd_1B_NoOp: @ 0x080384D8
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _080384E8 @ =0x030013B0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080384E8: .4byte 0x030013B0

	thumb_func_start AiDoBerserkAction
AiDoBerserkAction: @ 0x080384EC
	push {lr}
	ldr r0, _08038504 @ =AiIsUnitEnemy
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038500
	ldr r0, _08038508 @ =AiIsUnitNonActive
	bl AiAttemptOffensiveAction
_08038500:
	pop {r0}
	bx r0
	.align 2, 0
_08038504: .4byte AiIsUnitEnemy
_08038508: .4byte AiIsUnitNonActive

	thumb_func_start AiDoBerserkMove
AiDoBerserkMove: @ 0x0803850C
	push {r4, lr}
	sub sp, #8
	ldr r0, _08038540 @ =AiIsUnitNonActive
	add r4, sp, #4
	adds r1, r4, #0
	bl AiFindTargetInReachByFunc
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08038536
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_08038536:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038540: .4byte AiIsUnitNonActive

	thumb_func_start sub_08038544
sub_08038544: @ 0x08038544
	movs r0, #1
	bx lr

	thumb_func_start sub_08038548
sub_08038548: @ 0x08038548
	push {lr}
	ldrb r0, [r0]
	bl AiGetClassRank
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiAttemptOffensiveAction
AiAttemptOffensiveAction: @ 0x08038558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	movs r5, #0
	strb r5, [r0, #2]
	str r5, [r0, #8]
	ldr r6, _080385C0 @ =0x03004690
	ldr r3, [r6]
	ldr r1, [r3, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	cmp r1, #0
	beq _080385C8
	ldr r4, _080385C4 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetRiddenBallistaAt
	cmp r0, #0
	beq _080385B6
	b _0803871E
_080385B6:
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
	b _0803865E
	.align 2, 0
_080385C0: .4byte 0x03004690
_080385C4: .4byte 0x0202E3E4
_080385C8:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080385FE
	adds r0, r3, #0
	bl GetUnitItemCount
	cmp r0, #4
	bgt _080385FE
	ldr r0, [r6]
	bl RevertMapChange
	bl sub_0801A0FC
	bl AiAttemptStealActionWithinMovement
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080385FE
	movs r0, #0
	b _08038792
_080385FE:
	ldr r1, _08038634 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08038640
	ldr r4, _08038638 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _0803863C @ =0x03004690
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _08038648
	.align 2, 0
_08038634: .4byte 0x0203A8EC
_08038638: .4byte 0x0202E3E4
_0803863C: .4byte 0x03004690
_08038640:
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	bl RevertMapChange
_08038648:
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803865E
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
_0803865E:
	ldr r0, _080387A8 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0
	mov r8, r0
	ldr r1, _080387A4 @ =0x03004690
	ldr r0, [r1]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _0803871E
	mov sl, r1
	add r1, sp, #0xc
	mov sb, r1
_0803867A:
	mov r2, sl
	ldr r0, [r2]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	mov r7, r8
	adds r7, #1
	cmp r0, #0
	beq _08038708
	mov r4, r8
	mov r3, sb
	strh r4, [r3, #4]
	movs r6, #1
_08038696:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08038702
	ldr r0, [r4]
	cmp r0, #0
	beq _08038702
	ldr r0, [r4, #0xc]
	ldr r1, _080387AC @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08038702
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038702
	mov r2, sl
	ldr r0, [r2]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038702
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillReversedAttackRangeMap
	ldrb r0, [r4, #0xb]
	mov r3, sb
	strb r0, [r3, #2]
	add r0, sp, #0xc
	bl AiSimulateBestBattleAgainstTarget
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038702
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blo _08038702
	add r1, sp, #0x18
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, r8
	mov r4, sp
	strh r0, [r4, #0x1c]
_08038702:
	adds r6, #1
	cmp r6, #0xbf
	ble _08038696
_08038708:
	mov r8, r7
	cmp r7, #4
	bgt _0803871E
	mov r1, sl
	ldr r0, [r1]
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	bne _0803867A
_0803871E:
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08038754
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl AiAttemptBallistaCombat
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08038754
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blo _08038754
	add r1, sp, #0x18
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
_08038754:
	add r1, sp, #0x18
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08038762
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08038792
_08038762:
	mov r1, sp
	ldrb r0, [r1, #0x18]
	ldrb r1, [r1, #0x19]
	mov r2, sp
	ldrb r3, [r2, #0x1a]
	ldrb r2, [r2, #0x1c]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	mov r3, sp
	movs r1, #0x1c
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08038792
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_08038792:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080387A4: .4byte 0x03004690
_080387A8: .4byte 0x0202E3E8
_080387AC: .4byte 0x00010025

	thumb_func_start sub_080387B0
sub_080387B0: @ 0x080387B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #0x24]
	add r2, sp, #0x18
	movs r5, #0
	strb r5, [r2, #2]
	str r5, [r2, #8]
	ldr r6, _08038954 @ =0x03004690
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08038814
	ldr r4, _08038958 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetRiddenBallistaAt
	cmp r0, #0
	bne _080388D2
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
_08038814:
	ldr r0, _0803895C @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0
	mov sb, r0
	ldr r0, [r6]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _080388D2
	add r1, sp, #0xc
	mov sl, r1
_0803882C:
	ldr r2, _08038954 @ =0x03004690
	ldr r0, [r2]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	mov r7, sb
	adds r7, #1
	cmp r0, #0
	beq _080388BC
	mov r4, sb
	mov r3, sl
	strh r4, [r3, #4]
	movs r6, #1
_08038848:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080388B6
	ldr r0, [r4]
	cmp r0, #0
	beq _080388B6
	ldr r0, [r4, #0xc]
	ldr r1, _08038960 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _080388B6
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080388B6
	ldr r2, _08038954 @ =0x03004690
	ldr r0, [r2]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080388B6
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillReversedAttackRangeMap
	ldrb r0, [r4, #0xb]
	mov r3, sl
	strb r0, [r3, #2]
	add r0, sp, #0xc
	bl AiSimulateBestBattleAgainstTarget
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080388B6
	ldr r1, [sp, #0x14]
	mov r4, r8
	ldr r0, [r4, #8]
	cmp r1, r0
	blo _080388B6
	mov r1, r8
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	mov r0, r8
	strh r1, [r0, #4]
_080388B6:
	adds r6, #1
	cmp r6, #0xbf
	ble _08038848
_080388BC:
	mov sb, r7
	cmp r7, #4
	bgt _080388D2
	ldr r2, _08038954 @ =0x03004690
	ldr r0, [r2]
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	bne _0803882C
_080388D2:
	ldr r0, _08038954 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803890A
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl AiAttemptBallistaCombat
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803890A
	ldr r1, [sp, #0x14]
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r1, r0
	blo _0803890A
	mov r1, r8
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
_0803890A:
	mov r1, r8
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08038918
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08038944
_08038918:
	mov r4, r8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r1, #4
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08038944
	ldr r0, _08038954 @ =0x03004690
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_08038944:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038954: .4byte 0x03004690
_08038958: .4byte 0x0202E3E4
_0803895C: .4byte 0x0202E3E8
_08038960: .4byte 0x00010025

	thumb_func_start AiFillReversedAttackRangeMap
AiFillReversedAttackRangeMap: @ 0x08038964
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080389B4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r6, #0x10
	ldrsb r6, [r4, r6]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl MapAddInBoundedRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080389B4: .4byte 0x0202E3E8

	thumb_func_start AiFloodMovementAndRange
AiFloodMovementAndRange: @ 0x080389B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08038A70 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl BeginMapFlood
	ldr r0, _08038A74 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08038A78 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08038A62
_08038A08:
	ldr r0, _08038A78 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sb, r0
	cmp r6, #0
	blt _08038A5C
	lsls r1, r7, #0x10
	mov r8, r1
_08038A1C:
	ldr r0, _08038A70 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038A56
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_08038A56:
	subs r6, #1
	cmp r6, #0
	bge _08038A1C
_08038A5C:
	mov r7, sb
	cmp r7, #0
	bge _08038A08
_08038A62:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038A70: .4byte 0x0202E3E4
_08038A74: .4byte 0x0202E3E8
_08038A78: .4byte 0x0202E3D8

	thumb_func_start AiAttemptBallistaCombat
AiAttemptBallistaCombat: @ 0x08038A7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	mov r8, r1
	movs r0, #0
	mov sl, r0
	add r4, sp, #0xc
	ldr r1, _08038AF0 @ =0x081D3B64
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	ldr r0, _08038AF4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08038B18
_08038AA8:
	ldr r0, _08038AF4 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r3, r7, #1
	mov sb, r3
	cmp r4, #0
	blt _08038B12
	ldr r2, _08038AF8 @ =0x0202E3E4
	lsls r6, r7, #2
_08038ABC:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038B0C
	adds r0, r4, #0
	adds r1, r7, #0
	str r2, [sp, #0x14]
	bl GetBallistaItemAt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x14]
	cmp r5, #0
	beq _08038AFC
	movs r0, #1
	add sl, r0
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	b _08038B0C
	.align 2, 0
_08038AF0: .4byte 0x081D3B64
_08038AF4: .4byte 0x0202E3D8
_08038AF8: .4byte 0x0202E3E4
_08038AFC:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
_08038B0C:
	subs r4, #1
	cmp r4, #0
	bge _08038ABC
_08038B12:
	mov r7, sb
	cmp r7, #0
	bge _08038AA8
_08038B18:
	mov r0, sl
	cmp r0, #0
	beq _08038BD8
	movs r0, #0
	mov r1, r8
	strb r0, [r1, #2]
	str r0, [r1, #8]
	movs r1, #0
	mov r6, sp
_08038B2A:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r5, [r0]
	ldr r0, _08038BCC @ =0x0000FFFF
	mov r2, r8
	strh r0, [r2, #4]
	movs r7, #1
	adds r1, #1
	mov sb, r1
_08038B3E:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08038BAC
	ldr r0, [r4]
	cmp r0, #0
	beq _08038BAC
	ldr r0, [r4, #0xc]
	ldr r1, _08038BD0 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08038BAC
	adds r0, r4, #0
	ldr r3, [sp, #0x10]
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAC
	ldr r0, _08038BD4 @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAC
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillReversedAttackRangeMap
	ldrb r0, [r4, #0xb]
	strb r0, [r6, #2]
	mov r0, sp
	adds r1, r5, #0
	bl AiSimulateBestBallistaBattleAgainstTarget
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAC
	ldr r1, [sp, #8]
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r1, r0
	blo _08038BAC
	ldrb r0, [r6]
	strb r0, [r2]
	ldrb r0, [r6, #1]
	strb r0, [r2, #1]
	ldrb r0, [r6, #2]
	strb r0, [r2, #2]
	str r1, [r2, #8]
_08038BAC:
	adds r7, #1
	cmp r7, #0xbf
	ble _08038B3E
	mov r1, sb
	cmp r1, #2
	ble _08038B2A
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _08038BC6
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _08038BD8
_08038BC6:
	movs r0, #1
	b _08038BDA
	.align 2, 0
_08038BCC: .4byte 0x0000FFFF
_08038BD0: .4byte 0x00010025
_08038BD4: .4byte 0x03004690
_08038BD8:
	movs r0, #0
_08038BDA:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08038BEC
sub_08038BEC: @ 0x08038BEC
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _08038C24 @ =0x0202E3E4
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08038C20
	ldr r0, _08038C28 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _08038C30
	ldr r0, _08038C2C @ =0x0202BD48
	ldrb r0, [r0]
	cmp r2, r0
	beq _08038C30
_08038C20:
	movs r0, #0xff
	b _08038C3C
	.align 2, 0
_08038C24: .4byte 0x0202E3E4
_08038C28: .4byte 0x0202E3DC
_08038C2C: .4byte 0x0202BD48
_08038C30:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_08038C3C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiAttemptStealActionWithinMovement
AiAttemptStealActionWithinMovement: @ 0x08038C44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0xff
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	ldr r0, _08038C68 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r0, #1
	b _08038D40
	.align 2, 0
_08038C68: .4byte 0x0202E3D8
_08038C6C:
	ldr r0, _08038D50 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	mov r2, r8
	subs r2, #1
	str r2, [sp, #0x20]
	cmp r5, #0
	blt _08038D3E
	mov r3, r8
	lsls r7, r3, #2
_08038C82:
	ldr r0, _08038D54 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038D38
	ldr r0, _08038D58 @ =0x0202E3DC
	mov sl, r0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08038D38
	ldr r0, _08038D5C @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08038D38
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, r8
	ldr r2, _08038D60 @ =sub_08038BEC
	add r3, sp, #0xc
	bl AiFindBestAdjacentPositionByFunc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D38
	mov r2, sl
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _08038D64 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _08038D38
	adds r0, r4, #0
	bl AiGetUnitStealItemSlot
	lsls r6, r0, #0x18
	asrs r1, r6, #0x18
	cmp r1, #0
	blt _08038D38
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl AiGetItemStealRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r3, r0
	blo _08038D38
	str r0, [sp, #0x14]
	add r1, sp, #0xc
	ldr r2, [sp, #0x1c]
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	ldrh r1, [r1]
	orrs r1, r0
	mov sb, r1
	mov r3, sl
	ldr r0, [r3]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
_08038D38:
	subs r5, #1
	cmp r5, #0
	bge _08038C82
_08038D3E:
	ldr r0, [sp, #0x20]
_08038D40:
	mov r8, r0
	cmp r0, #0
	bge _08038C6C
	ldr r1, [sp, #0x14]
	cmp r1, #0xff
	bne _08038D68
	movs r0, #0
	b _08038D90
	.align 2, 0
_08038D50: .4byte 0x0202E3D8
_08038D54: .4byte 0x0202E3E4
_08038D58: .4byte 0x0202E3DC
_08038D5C: .4byte 0x0202BD48
_08038D60: .4byte sub_08038BEC
_08038D64: .4byte 0x03004690
_08038D68:
	ldr r0, _08038DA0 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	asrs r1, r3, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #3
	ldr r3, [sp, #0x18]
	bl AiSetDecision
	movs r0, #1
_08038D90:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038DA0: .4byte 0x03004690

	thumb_func_start AiSimulateBestBattleAgainstTarget
AiSimulateBestBattleAgainstTarget: @ 0x08038DA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r3, #0
	ldr r0, _08038E40 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08038E2E
_08038DBC:
	ldr r0, _08038E40 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _08038E28
	lsls r6, r5, #2
_08038DCE:
	ldr r0, _08038E44 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038E22
	ldr r0, _08038E48 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08038E22
	ldr r0, _08038E4C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _08038E0A
	ldr r0, _08038E50 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08038E22
_08038E0A:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl AiGetCombatPositionScore
	ldr r3, [sp]
	cmp r0, r3
	bls _08038E22
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_08038E22:
	subs r4, #1
	cmp r4, #0
	bge _08038DCE
_08038E28:
	mov r5, r8
	cmp r5, #0
	bge _08038DBC
_08038E2E:
	cmp r3, #0
	beq _08038E54
	adds r0, r7, #0
	bl AiSimulateBattleAgainstTargetAtPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08038E56
	.align 2, 0
_08038E40: .4byte 0x0202E3D8
_08038E44: .4byte 0x0202E3E4
_08038E48: .4byte 0x0202E3E8
_08038E4C: .4byte 0x0202E3DC
_08038E50: .4byte 0x0202BD48
_08038E54:
	movs r0, #0
_08038E56:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiSimulateBestBallistaBattleAgainstTarget
AiSimulateBestBallistaBattleAgainstTarget: @ 0x08038E64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r3, #0
	ldr r0, _08038F14 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08038F04
_08038E84:
	ldr r0, _08038F14 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _08038EFE
	lsls r6, r5, #2
_08038E96:
	ldr r0, _08038F18 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0x78
	bhi _08038EF8
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _08038EF8
	ldr r0, _08038F1C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08038EF8
	ldr r0, _08038F20 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _08038EE0
	ldr r0, _08038F24 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08038EF8
_08038EE0:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl AiGetCombatPositionScore
	ldr r3, [sp]
	cmp r0, r3
	bls _08038EF8
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_08038EF8:
	subs r4, #1
	cmp r4, #0
	bge _08038E96
_08038EFE:
	mov r5, r8
	cmp r5, #0
	bge _08038E84
_08038F04:
	cmp r3, #0
	beq _08038F28
	adds r0, r7, #0
	bl AiSimulateBattleAgainstTargetAtPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08038F2A
	.align 2, 0
_08038F14: .4byte 0x0202E3D8
_08038F18: .4byte 0x0202E3E4
_08038F1C: .4byte 0x0202E3E8
_08038F20: .4byte 0x0202E3DC
_08038F24: .4byte 0x0202BD48
_08038F28:
	movs r0, #0
_08038F2A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiGetCombatPositionScore
AiGetCombatPositionScore: @ 0x08038F38
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldrb r0, [r2, #2]
	bl GetUnit
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetInRangeCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _08038F94 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _08038F98 @ =0x0202E3F4
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _08038F9C @ =0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08038F94: .4byte 0x0202E3E4
_08038F98: .4byte 0x0202E3F4
_08038F9C: .4byte 0x7FFFFFFF

	thumb_func_start sub_08038FA0
sub_08038FA0: @ 0x08038FA0
	movs r0, #0
	bx lr

	thumb_func_start AiSimulateBattleAgainstTargetAtPosition
AiSimulateBattleAgainstTargetAtPosition: @ 0x08038FA4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08038FCC @ =0x0000FFFF
	ldrh r1, [r5, #4]
	cmp r1, r0
	beq _08038FD4
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, _08038FD0 @ =0x03004690
	ldr r0, [r0]
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl BattleGenerateSimulation
	b _08038FEA
	.align 2, 0
_08038FCC: .4byte 0x0000FFFF
_08038FD0: .4byte 0x03004690
_08038FD4:
	ldr r0, _08038FFC @ =0x03004690
	ldr r4, [r0]
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	adds r0, r4, #0
	bl BattleGenerateBallistaSimulation
_08038FEA:
	adds r0, r5, #0
	bl sub_08038FA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039000
	movs r0, #0
	b _08039008
	.align 2, 0
_08038FFC: .4byte 0x03004690
_08039000:
	adds r0, r5, #0
	bl sub_08039240
	movs r0, #1
_08039008:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start AiGetDamageDealtCombatScoreComponent
AiGetDamageDealtCombatScoreComponent: @ 0x08039010
	push {r4, lr}
	ldr r3, _08039020 @ =0x0203A470
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08039024
	movs r0, #0x32
	b _08039062
	.align 2, 0
_08039020: .4byte 0x0203A470
_08039024:
	ldr r1, _08039068 @ =0x0203A3F0
	adds r0, r1, #0
	adds r0, #0x5a
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r2, r2, r0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r2, #0
	muls r1, r0, r1
	cmp r1, #0
	bge _08039048
	movs r1, #0
_08039048:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _0803906C @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _08039060
	movs r1, #0x28
_08039060:
	adds r0, r1, #0
_08039062:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08039068: .4byte 0x0203A3F0
_0803906C: .4byte 0x030013C0

	thumb_func_start sub_08039070
sub_08039070: @ 0x08039070
	ldr r0, _0803908C @ =0x0203A470
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _08039090 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	muls r1, r0, r1
	cmp r1, #0
	bge _08039088
	movs r1, #0
_08039088:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0803908C: .4byte 0x0203A470
_08039090: .4byte 0x030013C0

	thumb_func_start sub_08039094
sub_08039094: @ 0x08039094
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r4, _08039124 @ =0x08B989FC
	ldrb r2, [r4]
	cmp r2, #0x7f
	beq _08039108
	ldr r0, _08039128 @ =0x0203A3F0
	mov sb, r0
	ldr r1, _0803912C @ =0x0202E3D8
	mov r8, r1
_080390AE:
	mov r3, sb
	ldrb r3, [r3, #0x10]
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r6, sb
	ldrb r6, [r6, #0x11]
	ldrb r7, [r4, #1]
	adds r0, r6, r7
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08039130 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r6, r8
	movs r7, #0
	ldrsh r0, [r6, r7]
	cmp r2, r0
	bge _08039100
	movs r2, #2
	ldrsh r0, [r6, r2]
	cmp r3, r0
	bge _08039100
	cmp r1, #0
	beq _08039100
	mov r3, sb
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039100
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
_08039100:
	adds r4, #4
	ldrb r2, [r4]
	cmp r2, #0x7f
	bne _080390AE
_08039108:
	ldr r0, _08039134 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	muls r5, r0, r5
	cmp r5, #0xa
	ble _08039116
	movs r5, #0xa
_08039116:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039124: .4byte 0x08B989FC
_08039128: .4byte 0x0203A3F0
_0803912C: .4byte 0x0202E3D8
_08039130: .4byte 0x0202E3DC
_08039134: .4byte 0x030013C0

	thumb_func_start sub_08039138
sub_08039138: @ 0x08039138
	push {lr}
	ldr r0, _08039164 @ =0x0203A470
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	bl AiGetClassRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08039168 @ =0x030013C0
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r1, r1, r0
	ldrb r2, [r2, #3]
	ldrb r1, [r1]
	adds r0, r2, #0
	muls r0, r1, r0
	cmp r0, #0x14
	ble _08039160
	movs r0, #0x14
_08039160:
	pop {r1}
	bx r1
	.align 2, 0
_08039164: .4byte 0x0203A470
_08039168: .4byte 0x030013C0

	thumb_func_start sub_0803916C
sub_0803916C: @ 0x0803916C
	ldr r1, _0803917C @ =0x0202BBF8
	ldr r0, _08039180 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrh r1, [r1, #0x10]
	muls r0, r1, r0
	bx lr
	.align 2, 0
_0803917C: .4byte 0x0202BBF8
_08039180: .4byte 0x030013C0

	thumb_func_start AiGetDamageTakenScoreComponent
AiGetDamageTakenScoreComponent: @ 0x08039184
	push {lr}
	ldr r2, _08039198 @ =0x0203A470
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803919C
	movs r0, #0xa
	rsbs r0, r0, #0
	b _080391D8
	.align 2, 0
_08039198: .4byte 0x0203A470
_0803919C:
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080391DC @ =0x0203A3F0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	cmp r1, #0
	bge _080391BE
	movs r1, #0
_080391BE:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _080391E0 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _080391D6
	movs r1, #0x28
_080391D6:
	adds r0, r1, #0
_080391D8:
	pop {r1}
	bx r1
	.align 2, 0
_080391DC: .4byte 0x0203A3F0
_080391E0: .4byte 0x030013C0

	thumb_func_start sub_080391E4
sub_080391E4: @ 0x080391E4
	ldr r2, _08039210 @ =0x0203A3F0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08039214 @ =0x0202E3F4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, #3
	ldr r0, _08039218 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	muls r1, r0, r1
	cmp r1, #0x14
	ble _0803920C
	movs r1, #0x14
_0803920C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08039210: .4byte 0x0203A3F0
_08039214: .4byte 0x0202E3F4
_08039218: .4byte 0x030013C0

	thumb_func_start sub_0803921C
sub_0803921C: @ 0x0803921C
	ldr r0, _08039238 @ =0x0203A3F0
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _0803923C @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	muls r1, r0, r1
	cmp r1, #0
	bge _08039234
	movs r1, #0
_08039234:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08039238: .4byte 0x0203A3F0
_0803923C: .4byte 0x030013C0

	thumb_func_start sub_08039240
sub_08039240: @ 0x08039240
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803929C @ =0x030013C0
	ldr r1, _080392A0 @ =0x0203A8EC
	adds r1, #0x7d
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, _080392A4 @ =0x081D36F4
	adds r0, r0, r1
	str r0, [r2]
	bl AiGetDamageDealtCombatScoreComponent
	adds r4, r0, #0
	adds r5, r4, #0
	bl sub_08039070
	adds r4, r4, r0
	bl sub_08039094
	adds r4, r4, r0
	bl sub_08039138
	adds r4, r4, r0
	bl sub_0803916C
	adds r4, r4, r0
	bl AiGetDamageTakenScoreComponent
	subs r4, r4, r0
	bl sub_080391E4
	subs r4, r4, r0
	bl sub_0803921C
	subs r4, r4, r0
	cmp r4, #0
	bge _08039290
	movs r4, #0
_08039290:
	cmp r4, #0
	beq _080392A8
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #3
	b _080392AA
	.align 2, 0
_0803929C: .4byte 0x030013C0
_080392A0: .4byte 0x0203A8EC
_080392A4: .4byte 0x081D36F4
_080392A8:
	adds r4, r5, #0
_080392AA:
	str r4, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AiGetInRangeCombatPositionScoreComponent
AiGetInRangeCombatPositionScoreComponent: @ 0x080392B4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	subs r3, r4, r0
	cmp r3, #0
	bge _080392C2
	subs r3, r0, r4
_080392C2:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	subs r4, r0, r1
	cmp r4, #0
	blt _080392D0
	adds r5, r3, r4
	b _080392D4
_080392D0:
	subs r0, r1, r0
	adds r5, r3, r0
_080392D4:
	adds r0, r2, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080392FA
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r5, r0
	bgt _080392F6
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r5, r0
	bge _080392FA
_080392F6:
	movs r0, #0x32
	b _080392FC
_080392FA:
	movs r0, #0
_080392FC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiGetTerrainCombatPositionScoreComponent
AiGetTerrainCombatPositionScoreComponent: @ 0x08039304
	ldr r2, _0803933C @ =0x0202E3E0
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r3, [r1]
	ldr r0, _08039340 @ =0x03004690
	ldr r0, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r2, #0x44]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x48]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldr r1, [r2, #0x4c]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803933C: .4byte 0x0202E3E0
_08039340: .4byte 0x03004690

	thumb_func_start AiGetFriendZoneCombatPositionScoreComponent
AiGetFriendZoneCombatPositionScoreComponent: @ 0x08039344
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r4, _08039394 @ =0x08B98A60
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _08039398 @ =0x0000270F
	cmp r0, r1
	beq _080393B0
	mov r8, r1
_0803935E:
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, r6, r0
	ldr r1, _0803939C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r7, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _080393A6
	ldr r0, _080393A0 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080393A4
	adds r5, #5
	b _080393A6
	.align 2, 0
_08039394: .4byte 0x08B98A60
_08039398: .4byte 0x0000270F
_0803939C: .4byte 0x0202E3DC
_080393A0: .4byte 0x0202BD48
_080393A4:
	subs r5, #5
_080393A6:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	bne _0803935E
_080393B0:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiRefreshDangerMap
AiRefreshDangerMap: @ 0x080393BC
	push {lr}
	ldr r0, _080393E0 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne _080393DC
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080393E4 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	bl AiFillDangerMap
_080393DC:
	pop {r0}
	bx r0
	.align 2, 0
_080393E0: .4byte 0x0203A8EC
_080393E4: .4byte 0x0202E3F4

	thumb_func_start AiFillDangerMap
AiFillDangerMap: @ 0x080393E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	mov sb, r0
	movs r4, #1
_080393FA:
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r4, #1
	mov sl, r4
	cmp r6, #0
	beq _080394E4
	ldr r0, [r6]
	cmp r0, #0
	beq _080394E4
	ldr r0, [r6, #0xc]
	ldr r1, _080394F8 @ =0x0001000D
	ands r0, r1
	cmp r0, #0
	bne _080394E4
	ldr r0, _080394FC @ =0x0202BD48
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080394E4
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0803946E
_08039434:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803945A
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, sb
	ble _0803945A
	mov r8, r4
	mov r0, r8
	bl GetItemMight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0803945A:
	adds r5, #1
	cmp r5, #4
	bgt _0803946E
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08039434
_0803946E:
	mov r1, r8
	cmp r1, #0
	beq _080394E4
	ldr r0, _08039500 @ =0x03004690
	ldr r0, [r0]
	adds r1, r6, #0
	mov r2, r8
	bl AiCouldReachByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080394E4
	adds r0, r6, #0
	mov r1, r8
	bl AiMakeMoveRangeMapsForUnitAndWeapon
	ldr r0, _08039504 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r1, r0, #1
	cmp r1, #0
	blt _080394E4
_0803949A:
	ldr r0, _08039504 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _080394DE
	lsls r5, r1, #2
_080394AA:
	ldr r0, _08039508 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080394D8
	adds r0, r6, #0
	bl GetUnitPower
	ldr r1, _0803950C @ =0x0202E3F4
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	add r0, sb
	asrs r0, r0, #1
	ldrb r2, [r1]
	adds r0, r2, r0
	strb r0, [r1]
_080394D8:
	subs r4, #1
	cmp r4, #0
	bge _080394AA
_080394DE:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803949A
_080394E4:
	mov r4, sl
	cmp r4, #0xbf
	ble _080393FA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080394F8: .4byte 0x0001000D
_080394FC: .4byte 0x0202BD48
_08039500: .4byte 0x03004690
_08039504: .4byte 0x0202E3D8
_08039508: .4byte 0x0202E3E8
_0803950C: .4byte 0x0202E3F4

	thumb_func_start sub_08039510
sub_08039510: @ 0x08039510
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0803952C @ =0x0202E3F4
	ldr r3, [r3]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, r2
	bhi _08039530
	movs r0, #1
	b _08039532
	.align 2, 0
_0803952C: .4byte 0x0202E3F4
_08039530:
	movs r0, #0
_08039532:
	bx lr

	thumb_func_start sub_08039534
sub_08039534: @ 0x08039534
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _080395F8 @ =0x00002710
	str r0, [sp]
	movs r1, #0xff
	mov sb, r1
	ldr r0, _080395FC @ =0x03004690
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08039562
	b _080396F0
_08039562:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08039574
	b _080396F0
_08039574:
	adds r0, r2, #0
	movs r1, #0x7c
	bl MapFloodUnitMovement
	ldr r0, _08039600 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803958A
	b _080396A6
_0803958A:
	ldr r0, _08039600 @ =0x0202E3D8
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r4, #0
	bge _0803959C
	b _0803969E
_0803959C:
	lsls r5, r7, #2
_0803959E:
	ldr r0, _08039604 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08039696
	ldr r0, _08039608 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, _0803960C @ =0x08B98AC4
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039618
	ldr r6, _08039610 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039696
	ldr r0, _08039614 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039696
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	b _0803965A
	.align 2, 0
_080395F8: .4byte 0x00002710
_080395FC: .4byte 0x03004690
_08039600: .4byte 0x0202E3D8
_08039604: .4byte 0x0202E3E4
_08039608: .4byte 0x0202E3E0
_0803960C: .4byte 0x08B98AC4
_08039610: .4byte 0x0202E3DC
_08039614: .4byte 0x0202BD48
_08039618:
	ldr r6, _080396E4 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039664
	ldr r0, _080396E8 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039696
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08039664
_0803965A:
	movs r0, #4
	ldrb r2, [r2, #0xa]
	ands r0, r2
	cmp r0, #0
	beq _08039696
_08039664:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	adds r2, r0, #0
	ldr r0, [sp]
	cmp r2, r0
	bgt _08039696
	ldr r0, _080396EC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, sb
	bgt _08039696
	str r2, [sp]
	ldrb r1, [r1]
	mov sb, r1
	mov r1, r8
	strh r4, [r1]
	strh r7, [r1, #2]
_08039696:
	subs r4, #1
	cmp r4, #0
	blt _0803969E
	b _0803959E
_0803969E:
	mov r7, sl
	cmp r7, #0
	blt _080396A6
	b _0803958A
_080396A6:
	mov r2, sb
	cmp r2, #0xff
	beq _080396F0
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _080396E4 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _080396E0
	ldr r0, _080396E8 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _080396E0
	adds r0, r1, #0
	bl GetUnit
	adds r2, r0, #0
	movs r0, #2
	ldrb r3, [r2, #0xa]
	orrs r0, r3
	strb r0, [r2, #0xa]
_080396E0:
	movs r0, #1
	b _080396F2
	.align 2, 0
_080396E4: .4byte 0x0202E3DC
_080396E8: .4byte 0x0202BD48
_080396EC: .4byte 0x0202E3E4
_080396F0:
	movs r0, #0
_080396F2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiUpdateUnitsSeekHealing
AiUpdateUnitsSeekHealing: @ 0x08039704
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _08039754 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _08039758 @ =0x081D3B68
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _0803974A
	adds r6, r1, #0
	adds r4, r2, #1
_08039728:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08039740
	ldr r0, [r1]
	cmp r0, #0
	beq _08039740
	adds r0, r1, #0
	bl AiUpdateGetUnitIsHealing
_08039740:
	adds r4, #1
	adds r5, #1
	ldr r0, [r6]
	cmp r5, r0
	blt _08039728
_0803974A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039754: .4byte 0x0202BBF8
_08039758: .4byte 0x081D3B68

	thumb_func_start AiUpdateGetUnitIsHealing
AiUpdateGetUnitIsHealing: @ 0x0803975C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r3, [r5, #0xa]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080397AC
	ldr r2, _080397A8 @ =0x08B9727C
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #7
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r4
	bhi _080397D2
	movs r0, #0xfe
	ands r0, r3
	strb r0, [r5, #0xa]
	movs r0, #0
	b _080397D4
	.align 2, 0
_080397A8: .4byte 0x08B9727C
_080397AC:
	ldr r2, _080397C8 @ =0x08B9727C
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #7
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, r4
	bhi _080397CC
	movs r0, #0
	b _080397D4
	.align 2, 0
_080397C8: .4byte 0x08B9727C
_080397CC:
	movs r0, #1
	orrs r0, r3
	strb r0, [r5, #0xa]
_080397D2:
	movs r0, #1
_080397D4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080397DC
sub_080397DC: @ 0x080397DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	ldr r7, _08039858 @ =0x03004690
_080397E4:
	ldr r0, [r7]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803988A
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x6b
	beq _08039808
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x6c
	bne _08039884
_08039808:
	ldr r1, _0803985C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08039860
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08039860
	add r5, sp, #0xc
	adds r0, r2, #0
	adds r1, r5, #0
	bl AiFindSafestReachableLocation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039884
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	b _08039878
	.align 2, 0
_08039858: .4byte 0x03004690
_0803985C: .4byte 0x0203A8EC
_08039860:
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_08039878:
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b _0803988C
_08039884:
	adds r6, #1
	cmp r6, #4
	ble _080397E4
_0803988A:
	movs r0, #0
_0803988C:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start AiTryMoveTowardsEscape
AiTryMoveTowardsEscape: @ 0x08039894
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _08039904 @ =0x03004690
	ldr r0, [r6]
	movs r1, #0x7c
	bl MapFloodUnitMovement
	bl GetEscapePointStructThingMaybe
	adds r4, r0, #0
	cmp r4, #0
	beq _08039930
	ldrb r5, [r4, #1]
	ldr r0, _08039908 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r3, [r4]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r6]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r2, r0
	bgt _08039910
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r1, _0803990C @ =0x0203A97C
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldrb r3, [r4]
	ldrb r2, [r4, #1]
	str r2, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #2
	bl AiSetDecision
	movs r0, #1
	b _08039932
	.align 2, 0
_08039904: .4byte 0x03004690
_08039908: .4byte 0x0202E3E4
_0803990C: .4byte 0x0203A97C
_08039910:
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r0, _0803992C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08039932
	.align 2, 0
_0803992C: .4byte 0x0203A97C
_08039930:
	movs r0, #0
_08039932:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetEscapePointStructThingMaybe
GetEscapePointStructThingMaybe: @ 0x0803993C
	push {r4, r5, r6, lr}
	movs r1, #0
	movs r5, #0
	ldr r0, _0803995C @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	movs r4, #0xff
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _08039974
	cmp r0, #0x40
	bgt _08039960
	cmp r0, #0
	beq _08039966
	b _0803997C
	.align 2, 0
_0803995C: .4byte 0x0202BBF8
_08039960:
	cmp r0, #0x80
	beq _0803996A
	b _0803997C
_08039966:
	movs r0, #0
	b _080399B6
_0803996A:
	ldr r1, _08039970 @ =0x08B97100
	b _08039976
	.align 2, 0
_08039970: .4byte 0x08B97100
_08039974:
	ldr r1, _080399BC @ =0x08B971C0
_08039976:
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
_0803997C:
	movs r0, #0
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080399B4
	ldr r0, _080399C0 @ =0x0202E3E4
	ldr r3, [r0]
	adds r2, r1, #0
_0803998E:
	ldrb r1, [r2, #1]
	lsls r0, r1, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrb r6, [r2]
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _080399AC
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble _080399AC
	ldrb r4, [r1]
	adds r5, r2, #0
_080399AC:
	adds r2, #4
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0803998E
_080399B4:
	adds r0, r5, #0
_080399B6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080399BC: .4byte 0x08B971C0
_080399C0: .4byte 0x0202E3E4

	thumb_func_start AiCanEquip
AiCanEquip: @ 0x080399C4
	ldr r0, _080399EC @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080399F4
	ldr r0, _080399F0 @ =0x0203A97C
	ldrb r0, [r0]
	cmp r0, #1
	beq _080399F4
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _080399F4
	movs r0, #1
	b _080399F6
	.align 2, 0
_080399EC: .4byte 0x03004690
_080399F0: .4byte 0x0203A97C
_080399F4:
	movs r0, #0
_080399F6:
	bx lr

	thumb_func_start AiEquipGetFlags
AiEquipGetFlags: @ 0x080399F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _08039A10 @ =0x03004690
	ldr r0, [r5]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08039A14
	movs r0, #0
	b _08039AF6
	.align 2, 0
_08039A10: .4byte 0x03004690
_08039A14:
	movs r7, #0
	strh r7, [r4]
	ldr r0, [r5]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08039AF6
	adds r6, r4, #0
	movs r0, #0
	mov r8, r0
_08039A26:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08039AD8
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08039AD8
	ldr r4, _08039AB8 @ =0x03004690
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039A62
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039AD8
_08039A62:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08039ABC
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _08039A82
	movs r0, #2
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039A82:
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _08039A94
	movs r0, #1
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039A94:
	adds r0, r5, #0
	bl GetItemUses
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetItemMaxUses
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	cmp r4, #0xa
	bhi _08039ACA
	movs r0, #4
	b _08039AC4
	.align 2, 0
_08039AB8: .4byte 0x03004690
_08039ABC:
	adds r0, r5, #0
	bl sub_08039CCC
	movs r0, #8
_08039AC4:
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039ACA:
	adds r0, r5, #0
	bl GetItemMight
	lsls r0, r0, #8
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r6]
_08039AD8:
	adds r6, #2
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #4
	bgt _08039AF6
	movs r0, #0
	strh r0, [r6]
	ldr r0, _08039B00 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x1e
	add r0, r8
	ldrh r5, [r0]
	cmp r5, #0
	bne _08039A26
_08039AF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039B00: .4byte 0x03004690

	thumb_func_start AiEquipGetDanger
AiEquipGetDanger: @ 0x08039B04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r0, _08039C48 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #1
_08039B32:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x14]
	cmp r5, #0
	beq _08039C22
	ldr r0, [r5]
	cmp r0, #0
	beq _08039C22
	ldr r0, [r5, #0xc]
	movs r1, #0x21
	ands r0, r1
	cmp r0, #0
	bne _08039C22
	ldr r0, _08039C4C @ =0x0202BD48
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039C22
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl AiIsWithinFlyingDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039C22
	adds r0, r5, #0
	bl RevertMapChange
	ldr r4, _08039C50 @ =0x0202E3E4
	ldr r1, [r4]
	ldr r7, [sp, #8]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08039C22
	adds r0, r5, #0
	mov r1, sp
	bl StoreItemAndGetUnitAttack
	adds r6, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMinRange
	cmp r0, #1
	ble _08039BB0
	ldr r2, [sp, #0xc]
	ldrh r2, [r2]
	adds r0, r2, r6
	ldr r3, [sp, #0xc]
	strh r0, [r3]
_08039BB0:
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMaxRange
	cmp r0, #1
	bne _08039BC6
	ldr r7, [sp, #0x10]
	ldrh r7, [r7]
	adds r0, r7, r6
	ldr r1, [sp, #0x10]
	strh r0, [r1]
_08039BC6:
	ldr r1, _08039C54 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	mov sl, r1
	cmp r2, #0
	blt _08039C22
	mov sb, r4
	ldr r3, _08039C48 @ =0x0202E3F4
	mov r8, r3
_08039BDA:
	mov r7, sl
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r3, r0, #1
	subs r7, r2, #1
	str r7, [sp, #0x18]
	cmp r3, #0
	blt _08039C1C
	lsls r4, r2, #2
	mov r1, sb
	mov r5, r8
	movs r0, #0xff
	mov ip, r0
_08039BF4:
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08039C16
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r7, [r0]
	adds r2, r7, r6
	cmp r2, #0xff
	ble _08039C14
	mov r2, ip
_08039C14:
	strb r2, [r0]
_08039C16:
	subs r3, #1
	cmp r3, #0
	bge _08039BF4
_08039C1C:
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bge _08039BDA
_08039C22:
	ldr r4, [sp, #0x14]
	cmp r4, #0xbf
	ble _08039B32
	ldr r3, [sp, #0xc]
	ldrh r7, [r3]
	ldr r3, [sp, #0x10]
	ldrh r3, [r3]
	adds r0, r7, r3
	ldr r7, [sp, #0x3c]
	strh r0, [r7]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039C48: .4byte 0x0202E3F4
_08039C4C: .4byte 0x0202BD48
_08039C50: .4byte 0x0202E3E4
_08039C54: .4byte 0x0202E3D8

	thumb_func_start AiEquipBestMatch
AiEquipBestMatch: @ 0x08039C58
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #1
	rsbs r5, r5, #0
	movs r4, #0
	movs r3, #0
	movs r7, #0xff
	lsls r7, r7, #8
_08039C68:
	ldrh r0, [r1]
	cmp r0, #0
	beq _08039C82
	adds r2, r0, #0
	ands r0, r6
	cmp r0, #0
	beq _08039C82
	adds r0, r7, #0
	ands r0, r2
	cmp r0, r4
	bls _08039C82
	adds r4, r0, #0
	adds r5, r3, #0
_08039C82:
	adds r1, #2
	adds r3, #1
	cmp r3, #4
	ble _08039C68
	cmp r5, #0
	ble _08039C98
	ldr r0, _08039CA0 @ =0x03004690
	ldr r0, [r0]
	adds r1, r5, #0
	bl UnitEquipItemSlot
_08039C98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039CA0: .4byte 0x03004690

	thumb_func_start AiEquipBestConsideringDanger
AiEquipBestConsideringDanger: @ 0x08039CA4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmn r1, r0
	beq _08039CC8
	cmp r1, r0
	blo _08039CC0
	movs r0, #1
	adds r1, r3, #0
	bl AiEquipBestMatch
	b _08039CC8
_08039CC0:
	movs r0, #2
	adds r1, r3, #0
	bl AiEquipBestMatch
_08039CC8:
	pop {r0}
	bx r0

	thumb_func_start sub_08039CCC
sub_08039CCC: @ 0x08039CCC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	cmp r0, #0x4a
	blt _08039CFC
	cmp r0, #0x4e
	ble _08039CE4
	cmp r0, #0x56
	beq _08039CF0
	b _08039CFC
_08039CE4:
	ldr r0, _08039CEC @ =0x03004690
	ldr r1, [r0]
	movs r0, #4
	b _08039CF6
	.align 2, 0
_08039CEC: .4byte 0x03004690
_08039CF0:
	ldr r0, _08039D00 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
_08039CF6:
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
_08039CFC:
	pop {r0}
	bx r0
	.align 2, 0
_08039D00: .4byte 0x03004690

	thumb_func_start AiIsWithinFlyingDistance
AiIsWithinFlyingDistance: @ 0x08039D04
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x1d
	ldrsb r0, [r3, r0]
	ldr r1, [r3, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, r1
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	subs r1, r4, r0
	cmp r1, #0
	bge _08039D24
	subs r1, r0, r4
_08039D24:
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _08039D32
	adds r0, r1, r3
	b _08039D36
_08039D32:
	subs r0, r0, r2
	adds r0, r1, r0
_08039D36:
	cmp r5, r0
	bge _08039D3E
	movs r0, #0
	b _08039D40
_08039D3E:
	movs r0, #1
_08039D40:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StoreItemAndGetUnitAttack
StoreItemAndGetUnitAttack: @ 0x08039D48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r4, [r6]
	adds r0, r5, #0
	bl GetUnitPower
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetItemMight
	adds r5, r5, r0
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiTryDanceOrStealAfterMove
AiTryDanceOrStealAfterMove: @ 0x08039D74
	push {r4, lr}
	ldr r4, _08039D9C @ =0x0203A97C
	ldrb r0, [r4]
	cmp r0, #2
	beq _08039D96
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoDanceAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039D96
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoStealAdjacent
_08039D96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039D9C: .4byte 0x0203A97C

	thumb_func_start AiTryActionAfterMove
AiTryActionAfterMove: @ 0x08039DA0
	push {r4, lr}
	ldr r4, _08039DD4 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoDanceAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039DCC
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoStealAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039DCC
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_08039F60
_08039DCC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039DD4: .4byte 0x0203A97C

	thumb_func_start AiTryDoDanceAdjacent
AiTryDoDanceAdjacent: @ 0x08039DD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	str r1, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _08039EB8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08039EB4
	ldr r0, _08039EBC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	ldr r0, _08039EC0 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08039EAE
_08039E28:
	ldr r0, _08039EC0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _08039EA8
	lsls r5, r1, #2
_08039E38:
	ldr r0, _08039EBC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08039EA2
	ldr r6, _08039EC4 @ =0x0202E3DC
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039EA2
	ldr r0, _08039EC8 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039EA2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08039EA2
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r8, r0
	bge _08039EA2
	ldrb r2, [r2, #8]
	mov r8, r2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_08039EA2:
	subs r4, #1
	cmp r4, #0
	bge _08039E38
_08039EA8:
	adds r1, r7, #0
	cmp r1, #0
	bge _08039E28
_08039EAE:
	mov r0, r8
	cmp r0, #0
	bne _08039ECC
_08039EB4:
	movs r0, #0
	b _08039EEA
	.align 2, 0
_08039EB8: .4byte 0x03004690
_08039EBC: .4byte 0x0202E3E4
_08039EC0: .4byte 0x0202E3D8
_08039EC4: .4byte 0x0202E3DC
_08039EC8: .4byte 0x0202BD48
_08039ECC:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #7
	mov r3, sb
	bl AiSetDecision
	movs r0, #1
_08039EEA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AiTryDoStealAdjacent
AiTryDoStealAdjacent: @ 0x08039EFC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08039F50 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08039F4C
	ldr r4, _08039F54 @ =0x0202E3E4
	ldr r0, [r4]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl BmMapFillg
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x78
	bl MapAddInRange
	bl AiAttemptStealActionWithinMovement
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _08039F58
_08039F4C:
	movs r0, #0
	b _08039F5A
	.align 2, 0
_08039F50: .4byte 0x03004690
_08039F54: .4byte 0x0202E3E4
_08039F58:
	movs r0, #1
_08039F5A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

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

	thumb_func_start sub_0803A090
sub_0803A090: @ 0x0803A090
	ldr r2, _0803A0B4 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq _0803A0B0
	ldr r0, _0803A0B8 @ =0x0202BD48
	ldrb r0, [r0]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803A0BC
_0803A0B0:
	movs r0, #0
	b _0803A0BE
	.align 2, 0
_0803A0B4: .4byte 0x0202E3DC
_0803A0B8: .4byte 0x0202BD48
_0803A0BC:
	movs r0, #1
_0803A0BE:
	bx lr

	thumb_func_start sub_0803A0C0
sub_0803A0C0: @ 0x0803A0C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r4, _0803A158 @ =0x03004690
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r2, [r0, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	mov r2, r8
	ldrb r2, [r2]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x14
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r3, r8
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _0803A164
	cmp r2, #0
	beq _0803A164
	ldr r0, [r4]
	adds r1, r5, #0
	bl AiFloodMovementAndRange
	ldr r0, _0803A15C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A1DA
_0803A10E:
	ldr r0, _0803A15C @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803A14E
_0803A11C:
	ldr r0, _0803A160 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803A148
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803A090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803A148
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803A148:
	subs r4, #1
	cmp r4, #0
	bge _0803A11C
_0803A14E:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803A10E
	b _0803A1DA
	.align 2, 0
_0803A158: .4byte 0x03004690
_0803A15C: .4byte 0x0202E3D8
_0803A160: .4byte 0x0202E3E8
_0803A164:
	ldr r4, _0803A1F4 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803A1F8 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl BeginMapFlood
	ldr r0, _0803A1FC @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A1DA
_0803A198:
	ldr r0, _0803A1FC @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803A1D4
_0803A1A6:
	ldr r0, _0803A1F8 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A1CE
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803A090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803A1CE
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803A1CE:
	subs r4, #1
	cmp r4, #0
	bge _0803A1A6
_0803A1D4:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803A198
_0803A1DA:
	ldr r0, _0803A200 @ =0x0203A8EC
	adds r0, #0x86
	mov r2, r8
	ldrb r2, [r2, #2]
	adds r0, r2, r0
	strb r7, [r0]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A1F4: .4byte 0x03004690
_0803A1F8: .4byte 0x0202E3E8
_0803A1FC: .4byte 0x0202E3D8
_0803A200: .4byte 0x0203A8EC

	thumb_func_start sub_0803A204
sub_0803A204: @ 0x0803A204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0803A2A0 @ =0x03004690
	ldr r0, [r5]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r2, [r0, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	ldrb r2, [r4, #4]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x14
	str r1, [sp, #4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xfe
	lsls r0, r0, #5
	ldrh r1, [r1]
	ands r0, r1
	lsrs r0, r0, #8
	ldr r1, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r8, r1
	ldrb r0, [r0, #1]
	mov sb, r0
	movs r6, #0x10
	ldrsb r6, [r2, r6]
	movs r7, #0x11
	ldrsb r7, [r2, r7]
	strb r1, [r2, #0x10]
	ldr r0, [r5]
	mov r2, sb
	strb r2, [r0, #0x11]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0803A2A8
	mov r0, sl
	cmp r0, #0
	beq _0803A2A8
	ldr r0, [r5]
	ldr r1, [sp, #4]
	mov r2, sl
	bl AiFloodMovementAndRange
	ldr r0, _0803A2A4 @ =0x0202E3E8
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803A2E2
_0803A294:
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldr r0, [r5]
	strb r7, [r0, #0x11]
	b _0803A3A8
	.align 2, 0
_0803A2A0: .4byte 0x03004690
_0803A2A4: .4byte 0x0202E3E8
_0803A2A8:
	ldr r5, _0803A358 @ =0x03004690
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r4, _0803A35C @ =0x0202E3E8
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #4]
	movs r3, #0
	bl BeginMapFlood
	ldr r1, [r4]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A294
_0803A2E2:
	ldr r4, _0803A358 @ =0x03004690
	ldr r0, [r4]
	strb r6, [r0, #0x10]
	ldr r0, [r4]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	bl RevertMapChange
	ldr r0, [r4]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A306
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
_0803A306:
	ldr r1, _0803A360 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A39A
_0803A312:
	ldr r1, _0803A360 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov ip, r0
	cmp r3, #0
	blt _0803A394
	ldr r7, _0803A364 @ =0x0202E3E4
	ldr r6, _0803A35C @ =0x0202E3E8
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
_0803A32C:
	mov r0, sl
	cmp r0, #0
	beq _0803A368
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803A38C
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803A38E
	b _0803A38C
	.align 2, 0
_0803A358: .4byte 0x03004690
_0803A35C: .4byte 0x0202E3E8
_0803A360: .4byte 0x0202E3D8
_0803A364: .4byte 0x0202E3E4
_0803A368:
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803A38C
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	ble _0803A38E
_0803A38C:
	strb r1, [r4]
_0803A38E:
	subs r3, #1
	cmp r3, #0
	bge _0803A32C
_0803A394:
	mov r5, ip
	cmp r5, #0
	bge _0803A312
_0803A39A:
	ldr r0, _0803A3CC @ =AiIsUnitEnemy
	bl sub_080387B0
	ldr r0, _0803A3D0 @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	cmp r0, #1
	beq _0803A3B8
_0803A3A8:
	mov r0, r8
	mov r1, sb
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803A3B8:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A3CC: .4byte AiIsUnitEnemy
_0803A3D0: .4byte 0x0203A97C

	thumb_func_start sub_0803A3D4
sub_0803A3D4: @ 0x0803A3D4
	ldr r1, _0803A3E8 @ =0x0203A8EC
	ldr r0, _0803A3EC @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r0, [r0]
	adds r1, #0x86
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0803A3E8: .4byte 0x0203A8EC
_0803A3EC: .4byte 0x03004690

	thumb_func_start sub_0803A3F0
sub_0803A3F0: @ 0x0803A3F0
	push {r4, r5, lr}
	bl GetActiveFactionAlliance
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803A40C
	adds r5, r0, #0
_0803A400:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803A400
_0803A40C:
	ldr r0, _0803A41C @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A41C: .4byte 0x0203A8EC

	thumb_func_start sub_0803A420
sub_0803A420: @ 0x0803A420
	push {r4, r5, lr}
	bl GetActiveFactionAlliance
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803A43C
	adds r5, r0, #0
_0803A430:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803A430
_0803A43C:
	ldr r0, _0803A44C @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A44C: .4byte 0x0203A8EC

	thumb_func_start AiTryMoveToSpecificPosition
AiTryMoveToSpecificPosition: @ 0x0803A450
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0803A484 @ =0x03004690
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xfe
	lsls r0, r0, #5
	ldrh r1, [r1]
	ands r0, r1
	lsrs r3, r0, #8
	adds r5, r2, #0
	adds r5, #0x46
	ldrb r4, [r5]
	ldr r0, _0803A488 @ =0x08B972E8
	ldr r1, [r0]
	cmp r1, #0
	beq _0803A47E
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	bne _0803A48C
_0803A47E:
	movs r0, #0
	b _0803A4CE
	.align 2, 0
_0803A484: .4byte 0x03004690
_0803A488: .4byte 0x08B972E8
_0803A48C:
	lsls r0, r4, #2
	adds r3, r2, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0803A4A2
	movs r4, #0
	strb r4, [r5]
	adds r3, r2, #0
_0803A4A2:
	ldrh r0, [r3]
	strh r0, [r6]
	ldrh r0, [r3, #2]
	strh r0, [r6, #2]
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _0803A4D4 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803A4CC
	adds r4, #1
	ldr r0, [r7]
	adds r0, #0x46
	strb r4, [r0]
_0803A4CC:
	movs r0, #1
_0803A4CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A4D4: .4byte 0x0202E3E4

	thumb_func_start AiCountEnemyInRangeOrTryMoveToSpecificPosition
AiCountEnemyInRangeOrTryMoveToSpecificPosition: @ 0x0803A4D8
	push {r4, lr}
	sub sp, #8
	ldr r4, _0803A508 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803A510
	ldr r0, [r4]
	bl AiMakeMoveRangeMapsForUnitAndWeapon
	bl AiCountEnemyUnitsInRange
	adds r1, r0, #0
	cmp r1, #0
	beq _0803A516
	ldr r0, _0803A50C @ =0x0203A8EC
	adds r0, #0x86
	strb r1, [r0]
	movs r0, #0
	b _0803A540
	.align 2, 0
_0803A508: .4byte 0x03004690
_0803A50C: .4byte 0x0203A8EC
_0803A510:
	ldr r0, [r4]
	bl RevertMapChange
_0803A516:
	add r4, sp, #4
	adds r0, r4, #0
	bl AiTryMoveToSpecificPosition
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	beq _0803A52A
	movs r0, #0
	b _0803A540
_0803A52A:
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
_0803A540:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803A548
sub_0803A548: @ 0x0803A548
	adds r1, r0, #0
	ldr r0, _0803A574 @ =0x03004690
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	ldrb r0, [r0, #0x11]
	ldrb r3, [r1]
	cmp r3, r2
	bhi _0803A57C
	ldrb r3, [r1, #2]
	cmp r3, r2
	blo _0803A57C
	ldrb r2, [r1, #1]
	cmp r2, r0
	bhi _0803A57C
	ldrb r1, [r1, #3]
	cmp r1, r0
	blo _0803A57C
	ldr r0, _0803A578 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
	b _0803A582
	.align 2, 0
_0803A574: .4byte 0x03004690
_0803A578: .4byte 0x0203A8EC
_0803A57C:
	ldr r0, _0803A588 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #0
_0803A582:
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0803A588: .4byte 0x0203A8EC

	thumb_func_start sub_0803A58C
sub_0803A58C: @ 0x0803A58C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	bl GetUnitByPid
	ldrb r5, [r0, #0xb]
	ldrb r0, [r4, #1]
	bl GetUnitByPid
	ldrb r3, [r0, #0xb]
	movs r0, #0xff
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	adds r2, r5, #0
	bl AiUpdateDecision
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803A5BC
sub_0803A5BC: @ 0x0803A5BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, _0803A5F4 @ =0x0202BD48
	ldrb r0, [r7]
	mov r8, r0
	ldr r4, _0803A5F8 @ =0x03004690
	ldr r6, [r4]
	adds r0, r6, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803A666
	bl GetUnitByPid
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne _0803A600
	str r6, [r4]
	ldr r0, _0803A5FC @ =0x0203A8EC
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803A666
	.align 2, 0
_0803A5F4: .4byte 0x0202BD48
_0803A5F8: .4byte 0x03004690
_0803A5FC: .4byte 0x0203A8EC
_0803A600:
	ldrb r0, [r1, #0xb]
	strb r0, [r7]
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, #1
	ldrb r7, [r0]
_0803A60E:
	bl sub_080375B8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A624
	adds r5, #1
	cmp r5, #0xff
	ble _0803A60E
	bl AiExecFallbackScriptA
_0803A624:
	ldr r1, _0803A63C @ =0x0203A97C
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bne _0803A644
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803A644
	ldr r0, _0803A640 @ =0x0203A8EC
	ldrb r1, [r1, #6]
	adds r0, #0x86
	b _0803A64A
	.align 2, 0
_0803A63C: .4byte 0x0203A97C
_0803A640: .4byte 0x0203A8EC
_0803A644:
	ldr r0, _0803A674 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #0
_0803A64A:
	strb r1, [r0]
	bl AiClearDecision
	ldr r1, _0803A678 @ =0x03004690
	ldr r0, [r1]
	adds r0, #0x42
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r7, [r0]
	ldr r0, _0803A67C @ =0x0202BD48
	mov r2, r8
	strb r2, [r0]
	str r6, [r1]
_0803A666:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A674: .4byte 0x0203A8EC
_0803A678: .4byte 0x03004690
_0803A67C: .4byte 0x0202BD48

	thumb_func_start sub_0803A680
sub_0803A680: @ 0x0803A680
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2]
	ldr r0, _0803A6AC @ =0x0203A988
	ldrb r1, [r1, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803A6B4
	ldr r0, _0803A6B0 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A6B4
	movs r0, #1
	b _0803A6B6
	.align 2, 0
_0803A6AC: .4byte 0x0203A988
_0803A6B0: .4byte 0x03004690
_0803A6B4:
	movs r0, #0
_0803A6B6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803A6BC
sub_0803A6BC: @ 0x0803A6BC
	push {lr}
	ldr r2, _0803A6DC @ =0x0203A988
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	bl AiUnitWithCharIdExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A6E4
	ldr r0, _0803A6E0 @ =0x0203A8EC
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803A70A
	.align 2, 0
_0803A6DC: .4byte 0x0203A988
_0803A6E0: .4byte 0x0203A8EC
_0803A6E4:
	ldr r0, _0803A710 @ =sub_0803A680
	bl AiAttemptOffensiveAction
	ldr r0, _0803A714 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x86
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803A718 @ =0x0203A97C
	ldrb r2, [r0, #0xa]
	cmp r2, #1
	bne _0803A706
	ldrb r2, [r0]
	cmp r2, #1
	bne _0803A706
	ldrb r0, [r0, #6]
	strb r0, [r1]
_0803A706:
	bl AiClearDecision
_0803A70A:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803A710: .4byte sub_0803A680
_0803A714: .4byte 0x0203A8EC
_0803A718: .4byte 0x0203A97C

	thumb_func_start sub_0803A71C
sub_0803A71C: @ 0x0803A71C
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	ldr r0, _0803A744 @ =0x0203A8EC
	adds r0, #0x86
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803A74C
	ldr r0, _0803A748 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A74C
	movs r0, #1
	b _0803A74E
	.align 2, 0
_0803A744: .4byte 0x0203A8EC
_0803A748: .4byte 0x03004690
_0803A74C:
	movs r0, #0
_0803A74E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803A754
sub_0803A754: @ 0x0803A754
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0803A7B4 @ =0x0203A8EC
	adds r0, #0x86
	ldrb r0, [r0]
	bl GetUnit
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r1, _0803A7B8 @ =0x03004690
	ldr r1, [r1]
	movs r3, #0x10
	ldrsb r3, [r1, r3]
	subs r7, r2, r3
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	subs r0, r0, r2
	mov r8, r0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r5, r0, r3
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r6, r0, r2
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A7BC
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r0, #0
	blt _0803A7BC
	mov r0, r8
	muls r0, r6, r0
	cmp r0, #0
	blt _0803A7BC
	movs r0, #1
	b _0803A7BE
	.align 2, 0
_0803A7B4: .4byte 0x0203A8EC
_0803A7B8: .4byte 0x03004690
_0803A7BC:
	movs r0, #0
_0803A7BE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0803A7C8
sub_0803A7C8: @ 0x0803A7C8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803A818 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x86
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803A80E
	ldrb r0, [r1]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0803A81C @ =sub_0803A71C
	bl AiAttemptOffensiveAction
	ldr r5, _0803A820 @ =0x0203A97C
	ldrb r0, [r5, #0xa]
	cmp r0, #1
	beq _0803A80E
	ldr r0, _0803A824 @ =sub_0803A754
	bl AiAttemptOffensiveAction
	ldrb r5, [r5, #0xa]
	cmp r5, #1
	beq _0803A80E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803A80E:
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A818: .4byte 0x0203A8EC
_0803A81C: .4byte sub_0803A71C
_0803A820: .4byte 0x0203A97C
_0803A824: .4byte sub_0803A754

	thumb_func_start sub_0803A828
sub_0803A828: @ 0x0803A828
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803A85C @ =0x0203A8EC
	ldrb r2, [r4, #1]
	adds r1, r3, #0
	adds r1, #0x7c
	strb r2, [r1]
	ldrb r4, [r4]
	cmp r0, r4
	bhi _0803A864
	ldr r4, _0803A860 @ =AiIsUnitEnemy
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A86C
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _0803A86C
	.align 2, 0
_0803A85C: .4byte 0x0203A8EC
_0803A860: .4byte AiIsUnitEnemy
_0803A864:
	adds r1, r3, #0
	adds r1, #0x79
	movs r0, #4
	strb r0, [r1]
_0803A86C:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803A874
sub_0803A874: @ 0x0803A874
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	bhi _0803A8B0
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A8B8
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r4, [r4, #1]
	cmp r0, r4
	bhi _0803A8B8
	ldr r0, _0803A8AC @ =AiIsUnitEnemy
	bl AiAttemptOffensiveAction
	b _0803A8B8
	.align 2, 0
_0803A8AC: .4byte AiIsUnitEnemy
_0803A8B0:
	ldr r0, _0803A8C0 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803A8B8:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803A8C0: .4byte 0x0203A8EC

	thumb_func_start sub_0803A8C4
sub_0803A8C4: @ 0x0803A8C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0803A920 @ =0x0000FFFF
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	movs r2, #0xff
	mov sl, r2
	ldr r4, _0803A924 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803A928
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetRiddenBallistaAt
	cmp r0, #0
	beq _0803A900
	b _0803AA28
_0803A900:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r8
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xa
	movs r3, #0
	bl AiSetDecision
	b _0803AA28
	.align 2, 0
_0803A920: .4byte 0x0000FFFF
_0803A924: .4byte 0x03004690
_0803A928:
	adds r0, r2, #0
	bl sub_0803BEA0
	ldr r0, _0803A9FC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A9B0
_0803A93A:
	ldr r0, _0803A9FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sb, r0
	cmp r4, #0
	blt _0803A9AA
	ldr r7, _0803AA00 @ =0x0202E3E4
	lsls r6, r5, #2
_0803A94E:
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A9A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetRiddenBallistaAt
	cmp r0, #0
	beq _0803A9A4
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803AA04 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A9A4
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, sl
	bhi _0803A9A4
	ldrb r0, [r0]
	mov sl, r0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0803A9A4:
	subs r4, #1
	cmp r4, #0
	bge _0803A94E
_0803A9AA:
	mov r5, sb
	cmp r5, #0
	bge _0803A93A
_0803A9B0:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0803A9CE
	ldr r0, [sp, #0x10]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803A9CE:
	ldr r1, _0803AA08 @ =0x0203A97C
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bne _0803AA0C
	ldrb r0, [r1, #2]
	cmp r0, r4
	bne _0803AA28
	ldrb r1, [r1, #3]
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0803AA28
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	b _0803AA28
	.align 2, 0
_0803A9FC: .4byte 0x0202E3D8
_0803AA00: .4byte 0x0202E3E4
_0803AA04: .4byte 0x0202E3DC
_0803AA08: .4byte 0x0203A97C
_0803AA0C:
	mov r0, r8
	cmp r0, #0
	beq _0803AA20
	ldr r0, _0803AA1C @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #7
	b _0803AA26
	.align 2, 0
_0803AA1C: .4byte 0x0203A8EC
_0803AA20:
	ldr r0, _0803AA3C @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #6
_0803AA26:
	strb r1, [r0]
_0803AA28:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803AA3C: .4byte 0x0203A8EC

	thumb_func_start sub_0803AA40
sub_0803AA40: @ 0x0803AA40
	push {lr}
	sub sp, #4
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	movs r0, #1
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803AA60
sub_0803AA60: @ 0x0803AA60
	ldr r0, _0803AA6C @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
_0803AA6C: .4byte 0x0203A8EC

	thumb_func_start GetAiStaffFuncIndex
GetAiStaffFuncIndex: @ 0x0803AA70
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, _0803AA8C @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803AA94
	b _0803AAC8
	.align 2, 0
_0803AA8C: .4byte 0x03004690
_0803AA90:
	adds r0, r5, #0
	b _0803AACC
_0803AA94:
	adds r0, r4, #0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _0803AAD4 @ =0x081D3B74
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803AAC8
	movs r3, #0
	adds r2, r4, #4
	adds r1, r4, #0
_0803AAAC:
	ldrh r0, [r1]
	cmp r6, r0
	bne _0803AAB8
	ldr r0, [r2]
	cmp r0, #0
	bne _0803AA90
_0803AAB8:
	adds r3, #8
	adds r2, #8
	adds r1, #8
	adds r5, #1
	adds r0, r3, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803AAAC
_0803AAC8:
	movs r0, #1
	rsbs r0, r0, #0
_0803AACC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803AAD4: .4byte 0x081D3B74

	thumb_func_start AiTryDoStaff
AiTryDoStaff: @ 0x0803AAD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0803AB74 @ =0x03004690
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0803AB62
	movs r5, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _0803AB62
	ldr r0, _0803AB78 @ =0x081D3B78
	mov r8, r0
_0803AB00:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803AB4C
	adds r0, r4, #0
	bl GetItemRequiredExp
	cmp r0, r6
	blt _0803AB4C
	adds r0, r4, #0
	bl GetAiStaffFuncIndex
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803AB4C
	lsls r0, r1, #3
	add r0, r8
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	bl _call_via_r2
	ldr r0, _0803AB7C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803AB4C
	adds r0, r4, #0
	bl GetItemRequiredExp
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803AB4C:
	adds r5, #1
	cmp r5, #4
	bgt _0803AB62
	ldr r0, _0803AB74 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803AB00
_0803AB62:
	ldr r0, _0803AB7C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803AB74: .4byte 0x03004690
_0803AB78: .4byte 0x081D3B78
_0803AB7C: .4byte 0x0203A97C

	thumb_func_start GetAiSafestAccessibleAdjacentPosition
GetAiSafestAccessibleAdjacentPosition: @ 0x0803AB80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r8, r2
	movs r0, #0
	mov sl, r0
	ldr r2, _0803AC24 @ =0x08B98AC8
	movs r1, #3
	mov sb, r1
_0803AB9C:
	ldr r0, [r2]
	ldr r1, [sp]
	adds r5, r1, r0
	ldr r0, [r2, #4]
	ldr r1, [sp, #4]
	adds r7, r1, r0
	ldr r0, _0803AC28 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0803AC0A
	ldr r0, _0803AC2C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803ABD2
	ldr r0, _0803AC30 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803AC0A
_0803ABD2:
	adds r0, r5, #0
	adds r1, r7, #0
	str r2, [sp, #8]
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _0803AC34 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803AC38 @ =0x7FFFFFFF
	adds r4, r4, r0
	ldr r2, [sp, #8]
	cmp sl, r4
	bhs _0803AC0A
	mov r1, r8
	strh r5, [r1]
	strh r7, [r1, #2]
	mov sl, r4
_0803AC0A:
	adds r2, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	bge _0803AB9C
	mov r0, sl
	cmp r0, #0
	bne _0803AC3C
	movs r0, #0
	b _0803AC3E
	.align 2, 0
_0803AC24: .4byte 0x08B98AC8
_0803AC28: .4byte 0x0202E3E4
_0803AC2C: .4byte 0x0202E3DC
_0803AC30: .4byte 0x0202BD48
_0803AC34: .4byte 0x0202E3F4
_0803AC38: .4byte 0x7FFFFFFF
_0803AC3C:
	movs r0, #1
_0803AC3E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803AC50
sub_0803AC50: @ 0x0803AC50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r0, _0803ADA8 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	ldr r0, [sp, #0x18]
	bl GenerateMagicSealMap
	bl sub_0801A0FC
	ldr r0, _0803ADAC @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803AC92
	adds r1, r0, #0
	mov sl, r1
_0803AC92:
	ldr r0, _0803ADB0 @ =0x0202E3D8
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803AD72
_0803AC9E:
	ldr r0, _0803ADB0 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x20]
	cmp r6, #0
	blt _0803AD6C
	lsls r4, r7, #2
	mov r8, r4
_0803ACB2:
	ldr r0, _0803ADB4 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AD66
	ldr r0, _0803ADB8 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803AD66
	ldr r0, _0803ADBC @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803AD66
	adds r0, r1, #0
	bl GetUnit
	adds r5, r0, #0
	movs r0, #4
	ldr r1, _0803ADC0 @ =0x0203A967
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803AD02
	mov r2, sb
	cmp r2, #0
	beq _0803AD02
	adds r0, r5, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803AD66
_0803AD02:
	ldr r4, _0803ADC4 @ =0x0203A968
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803AD14
	movs r0, #1
	ldrb r1, [r5, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _0803AD66
_0803AD14:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sl
	bhi _0803AD66
	add r5, sp, #0xc
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AD66
	mov sl, r4
	add r0, sp, #0xc
	movs r4, #0
	ldrsh r2, [r0, r4]
	str r2, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r5, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803ADB8 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803AD66:
	subs r6, #1
	cmp r6, #0
	bge _0803ACB2
_0803AD6C:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803AC9E
_0803AD72:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x14]
	cmp r2, r0
	beq _0803AD96
	adds r0, r2, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803AD96:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ADA8: .4byte 0x03004690
_0803ADAC: .4byte 0x0203A8EC
_0803ADB0: .4byte 0x0202E3D8
_0803ADB4: .4byte 0x0202E3E4
_0803ADB8: .4byte 0x0202E3DC
_0803ADBC: .4byte 0x0202BD48
_0803ADC0: .4byte 0x0203A967
_0803ADC4: .4byte 0x0203A968

	thumb_func_start sub_0803ADC8
sub_0803ADC8: @ 0x0803ADC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r4, _0803AF78 @ =0x0203A8EC
	adds r5, r4, #0
	adds r5, #0x7b
	movs r0, #4
	ldrb r3, [r5]
	ands r0, r3
	cmp r0, #0
	beq _0803ADFA
	b _0803AF68
_0803ADFA:
	ldr r0, _0803AF7C @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	ldr r0, [sp, #0x18]
	bl GenerateMagicSealMap
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803AE16
	adds r4, r0, #0
	mov sl, r4
_0803AE16:
	movs r0, #1
	mov r8, r0
_0803AE1A:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	bne _0803AE28
	b _0803AF38
_0803AE28:
	ldr r0, [r6]
	cmp r0, #0
	bne _0803AE30
	b _0803AF38
_0803AE30:
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803AF80 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, _0803AF84 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0803AF38
	ldr r0, [r6, #0xc]
	ldr r1, _0803AF88 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803AF38
	movs r0, #4
	ldr r1, _0803AF8C @ =0x0203A967
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803AE78
	mov r2, sb
	cmp r2, #0
	beq _0803AE78
	adds r0, r6, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803AF38
_0803AE78:
	ldr r3, _0803AF90 @ =0x0203A968
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803AE8A
	movs r0, #1
	ldrb r4, [r6, #0xa]
	ands r0, r4
	cmp r0, #0
	beq _0803AF38
_0803AE8A:
	ldr r7, _0803AF7C @ =0x03004690
	ldr r0, [r7]
	bl GetUnitMagRange
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r3, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF38
	ldr r0, _0803AF94 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r5, sp, #0xc
	adds r0, r5, #0
	bl sub_08037380
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF38
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	bhi _0803AF38
	mov sl, r0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r3, #2
	ldrsh r2, [r5, r3]
	str r2, [sp, #0x18]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803AF80 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803AF38:
	movs r4, #1
	add r8, r4
	mov r0, r8
	cmp r0, #0xbf
	bgt _0803AF44
	b _0803AE1A
_0803AF44:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0803AF68
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803AF68:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AF78: .4byte 0x0203A8EC
_0803AF7C: .4byte 0x03004690
_0803AF80: .4byte 0x0202E3DC
_0803AF84: .4byte 0x0202BD48
_0803AF88: .4byte 0x00010005
_0803AF8C: .4byte 0x0203A967
_0803AF90: .4byte 0x0203A968
_0803AF94: .4byte 0x0202E3E8

	thumb_func_start sub_0803AF98
sub_0803AF98: @ 0x0803AF98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov sb, r0
	mov sl, r0
	ldr r1, _0803B088 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B078
	bl sub_08037460
	cmp r0, #2
	ble _0803B078
	ldr r0, _0803B08C @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	ldr r0, _0803B090 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B050
_0803AFE0:
	ldr r0, _0803B090 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r5, #1
	cmp r4, #0
	blt _0803B04A
	lsls r6, r5, #2
_0803AFF0:
	ldr r0, _0803B094 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B044
	ldr r0, _0803B098 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803B018
	ldr r0, _0803B09C @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803B044
_0803B018:
	ldr r0, _0803B0A0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0803B08C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	bl sub_080374AC
	cmp r0, r8
	ble _0803B044
	mov r8, r0
	mov sb, r4
	mov sl, r5
_0803B044:
	subs r4, #1
	cmp r4, #0
	bge _0803AFF0
_0803B04A:
	adds r5, r7, #0
	cmp r5, #0
	bge _0803AFE0
_0803B050:
	mov r3, r8
	cmp r3, #1
	ble _0803B078
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl AiSetDecision
_0803B078:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B088: .4byte 0x0203A8EC
_0803B08C: .4byte 0x03004690
_0803B090: .4byte 0x0202E3D8
_0803B094: .4byte 0x0202E3E4
_0803B098: .4byte 0x0202E3DC
_0803B09C: .4byte 0x0202BD48
_0803B0A0: .4byte 0x0202E3E8

	thumb_func_start sub_0803B0A4
sub_0803B0A4: @ 0x0803B0A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r5, #0
	str r5, [sp, #0x1c]
	ldr r1, _0803B1E8 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B0D4
	b _0803B1D6
_0803B0D4:
	ldr r0, _0803B1EC @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	bl sub_0801A0FC
	ldr r0, _0803B1F0 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B1A0
_0803B0F4:
	ldr r0, _0803B1F0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r5, r7, #1
	str r5, [sp, #0x20]
	cmp r4, #0
	blt _0803B19A
	lsls r0, r7, #2
	mov r8, r0
_0803B108:
	ldr r0, _0803B1F4 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B194
	ldr r0, _0803B1F8 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B194
	bl GetUnit
	adds r5, r0, #0
	ldr r1, _0803B1E8 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B150
	mov r1, sb
	cmp r1, #0
	beq _0803B150
	adds r0, r5, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B194
_0803B150:
	movs r0, #9
	ldrb r2, [r5, #0xa]
	ands r0, r2
	cmp r0, #0
	bne _0803B194
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _0803B194
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B194
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r5, [r0, r1]
	str r5, [sp, #0x14]
	movs r5, #2
	ldrsh r2, [r6, r5]
	str r2, [sp, #0x18]
	ldr r0, _0803B1F8 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B194:
	subs r4, #1
	cmp r4, #0
	bge _0803B108
_0803B19A:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803B0F4
_0803B1A0:
	mov r0, sl
	cmp r0, #0
	beq _0803B1D6
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_0803B83C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B1D6
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r5, [sp, #0x10]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803B1D6:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B1E8: .4byte 0x0203A8EC
_0803B1EC: .4byte 0x03004690
_0803B1F0: .4byte 0x0202E3D8
_0803B1F4: .4byte 0x0202E3E4
_0803B1F8: .4byte 0x0202E3DC

	thumb_func_start sub_0803B1FC
sub_0803B1FC: @ 0x0803B1FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r1, _0803B32C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B31A
	ldr r0, _0803B330 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	bl sub_0801A0FC
	ldr r0, _0803B334 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B2FA
_0803B24A:
	ldr r0, _0803B334 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt _0803B2F4
	lsls r1, r7, #2
	mov r8, r1
_0803B25E:
	ldr r0, _0803B338 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B2EE
	ldr r0, _0803B33C @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B2EE
	bl GetUnit
	adds r5, r0, #0
	ldr r1, _0803B32C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B2A6
	mov r2, sb
	cmp r2, #0
	beq _0803B2A6
	adds r0, r5, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B2EE
_0803B2A6:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B2EE
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _0803B2EE
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B2EE
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803B33C @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B2EE:
	subs r4, #1
	cmp r4, #0
	bge _0803B25E
_0803B2F4:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803B24A
_0803B2FA:
	mov r2, sl
	cmp r2, #0
	beq _0803B31A
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803B31A:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B32C: .4byte 0x0203A8EC
_0803B330: .4byte 0x03004690
_0803B334: .4byte 0x0202E3D8
_0803B338: .4byte 0x0202E3E4
_0803B33C: .4byte 0x0202E3DC

	thumb_func_start sub_0803B340
sub_0803B340: @ 0x0803B340
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
_0803B346:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803B38E
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _0803B384 @ =0x00000405
	ands r1, r0
	cmp r1, #0
	beq _0803B388
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B380
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B388
_0803B380:
	movs r0, #1
	b _0803B390
	.align 2, 0
_0803B384: .4byte 0x00000405
_0803B388:
	adds r6, #1
	cmp r6, #4
	ble _0803B346
_0803B38E:
	movs r0, #0
_0803B390:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetAiSilenceEffectivenessScore
GetAiSilenceEffectivenessScore: @ 0x0803B398
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0803B3B4 @ =0x03004690
	ldr r0, [r0]
	adds r1, r5, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B3B8
	movs r0, #0
	b _0803B3E4
	.align 2, 0
_0803B3B4: .4byte 0x03004690
_0803B3B8:
	adds r0, r5, #0
	bl GetUnitPower
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803B3E2
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0803B3E2
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_0803B3E2:
	adds r0, r4, #0
_0803B3E4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803B3EC
sub_0803B3EC: @ 0x0803B3EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sl, r1
	movs r0, #0
	str r0, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	movs r3, #0
	str r3, [sp, #0x20]
	ldr r1, _0803B568 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B41C
	b _0803B558
_0803B41C:
	ldr r0, _0803B56C @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	movs r4, #1
	mov sb, r4
_0803B430:
	mov r0, sb
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0803B528
	ldr r0, [r6]
	cmp r0, #0
	beq _0803B528
	ldr r0, [r6, #0xc]
	ldr r1, _0803B570 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803B528
	ldr r1, _0803B568 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B46C
	mov r0, sl
	cmp r0, #0
	beq _0803B46C
	adds r0, r6, #0
	bl sub_080BFC74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
_0803B46C:
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0803B528
	adds r0, r6, #0
	bl sub_08037548
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
	ldr r1, _0803B56C @ =0x03004690
	mov r8, r1
	ldr r0, [r1]
	bl GetUnitMagRange
	mov r3, r8
	ldr r2, [r3]
	ldr r1, [r2, #4]
	ldrb r4, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r4, r1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
	adds r0, r6, #0
	bl sub_0803B340
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
	adds r0, r6, #0
	bl GetAiSilenceEffectivenessScore
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0803B528
	ldr r0, [sp, #0x14]
	cmp r7, r0
	blo _0803B528
	ldr r0, _0803B574 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	mov r1, r8
	ldr r0, [r1]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_08037380
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
	str r7, [sp, #0x14]
	add r0, sp, #0xc
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x18]
	movs r1, #2
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x1c]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x20]
_0803B528:
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #0xbf
	bgt _0803B534
	b _0803B430
_0803B534:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq _0803B558
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803B558:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B568: .4byte 0x0203A8EC
_0803B56C: .4byte 0x03004690
_0803B570: .4byte 0x00010005
_0803B574: .4byte 0x0202E3E8

	thumb_func_start sub_0803B578
sub_0803B578: @ 0x0803B578
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r3, #0
	str r3, [sp, #0x1c]
	ldr r1, _0803B6EC @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B5A8
	b _0803B6DA
_0803B5A8:
	ldr r0, _0803B6F0 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	movs r4, #1
	mov r8, r4
_0803B5BC:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0803B6AA
	ldr r0, [r6]
	cmp r0, #0
	beq _0803B6AA
	ldr r0, [r6, #0xc]
	ldr r1, _0803B6F4 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803B6AA
	ldr r1, _0803B6EC @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B5F8
	mov r0, sb
	cmp r0, #0
	beq _0803B5F8
	adds r0, r6, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B6AA
_0803B5F8:
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B6AA
	ldr r7, _0803B6F0 @ =0x03004690
	ldr r0, [r7]
	bl GetUnitMagRange
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r3, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B6AA
	adds r0, r6, #0
	bl sub_0803B340
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B6AA
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0803B6AA
	movs r0, #8
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	cmp r0, sl
	blt _0803B6AA
	ldr r0, _0803B6F8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_08037380
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B6AA
	ldrb r0, [r6, #8]
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r0, #2
	ldrsh r3, [r4, r0]
	str r3, [sp, #0x18]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x1c]
_0803B6AA:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #0xbf
	bgt _0803B6B6
	b _0803B5BC
_0803B6B6:
	mov r3, sl
	cmp r3, #0
	beq _0803B6DA
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803B6DA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B6EC: .4byte 0x0203A8EC
_0803B6F0: .4byte 0x03004690
_0803B6F4: .4byte 0x00010005
_0803B6F8: .4byte 0x0202E3E8

	thumb_func_start sub_0803B6FC
sub_0803B6FC: @ 0x0803B6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0xff
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r1, _0803B828 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B816
	ldr r0, _0803B82C @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	bl sub_0801A0FC
	ldr r0, _0803B830 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B7F6
_0803B74A:
	ldr r0, _0803B830 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt _0803B7F0
	lsls r1, r7, #2
	mov r8, r1
_0803B75E:
	ldr r0, _0803B834 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B7EA
	ldr r0, _0803B838 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B7EA
	bl GetUnit
	adds r5, r0, #0
	ldr r1, _0803B828 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B7A6
	mov r2, sb
	cmp r2, #0
	beq _0803B7A6
	adds r0, r5, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B7EA
_0803B7A6:
	adds r0, r5, #0
	bl GetUnitResistance
	cmp r0, sl
	bgt _0803B7EA
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B7EA
	adds r0, r5, #0
	bl GetUnitResistance
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803B838 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803B7EA:
	subs r4, #1
	cmp r4, #0
	bge _0803B75E
_0803B7F0:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803B74A
_0803B7F6:
	mov r2, sl
	cmp r2, #0xff
	beq _0803B816
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803B816:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B828: .4byte 0x0203A8EC
_0803B82C: .4byte 0x03004690
_0803B830: .4byte 0x0202E3D8
_0803B834: .4byte 0x0202E3E4
_0803B838: .4byte 0x0202E3DC

	thumb_func_start sub_0803B83C
sub_0803B83C: @ 0x0803B83C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	mov r8, r0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0803B910 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	str r0, [sp, #0x10]
	bl GetActiveFactionAlliance
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #0x80
	cmp r4, r0
	blt _0803B876
	b _0803B99E
_0803B876:
	adds r0, r4, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x18]
	cmp r7, #0
	bne _0803B88E
	b _0803B994
_0803B88E:
	ldr r0, [r7]
	cmp r0, #0
	bne _0803B896
	b _0803B994
_0803B896:
	ldr r0, [r7, #0xc]
	ldr r1, _0803B914 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803B994
	adds r0, r7, #0
	bl sub_0803C08C
	ldr r0, _0803B918 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803B96E
_0803B8B2:
	ldr r0, _0803B918 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r6, #1
	mov sb, r0
	cmp r4, #0
	blt _0803B968
	ldr r3, _0803B91C @ =0x0202E3E8
	lsls r5, r6, #2
_0803B8C6:
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r1, [r2]
	cmp r1, #0x78
	bhi _0803B962
	ldr r0, _0803B920 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B924
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	str r3, [sp, #0x20]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne _0803B962
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	ble _0803B962
	ldrb r1, [r1]
	mov r8, r1
	b _0803B962
	.align 2, 0
_0803B910: .4byte 0x03004690
_0803B914: .4byte 0x00010025
_0803B918: .4byte 0x0202E3D8
_0803B91C: .4byte 0x0202E3E8
_0803B920: .4byte 0x0202E3DC
_0803B924:
	ldr r0, _0803B9A8 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0803B962
	ldr r0, _0803B9AC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x78
	ble _0803B962
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp sl, r0
	ble _0803B962
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r2, [r2]
	mov sl, r2
_0803B962:
	subs r4, #1
	cmp r4, #0
	bge _0803B8C6
_0803B968:
	mov r6, sb
	cmp r6, #0
	bge _0803B8B2
_0803B96E:
	mov r0, r8
	cmp r0, #0xff
	beq _0803B994
	ldr r1, [sp, #4]
	cmp r1, r8
	blo _0803B994
	mov r0, sl
	cmp r0, #0xff
	beq _0803B994
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldr r1, [sp]
	strh r0, [r1, #2]
	mov r1, r8
	str r1, [sp, #4]
_0803B994:
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	cmp r4, r0
	bge _0803B99E
	b _0803B876
_0803B99E:
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _0803B9B0
	movs r0, #0
	b _0803B9B2
	.align 2, 0
_0803B9A8: .4byte 0x0202E3E0
_0803B9AC: .4byte 0x0202E3E4
_0803B9B0:
	movs r0, #1
_0803B9B2:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetSpecialItemFuncIndex
GetSpecialItemFuncIndex: @ 0x0803B9C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _0803B9F4 @ =0x081D3BDC
	ldrh r0, [r3]
	cmp r0, #0
	beq _0803BA08
	movs r1, #0
	adds r2, r3, #0
	adds r6, r2, #4
_0803B9E2:
	ldrh r0, [r2]
	cmp r5, r0
	bne _0803B9F8
	adds r0, r1, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _0803B9F8
	adds r0, r4, #0
	b _0803BA0C
	.align 2, 0
_0803B9F4: .4byte 0x081D3BDC
_0803B9F8:
	adds r1, #8
	adds r2, #8
	adds r4, #1
	ldr r3, _0803BA14 @ =0x081D3BDC
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803B9E2
_0803BA08:
	movs r0, #1
	rsbs r0, r0, #0
_0803BA0C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803BA14: .4byte 0x081D3BDC

	thumb_func_start AiTryDoSpecialItems
AiTryDoSpecialItems: @ 0x0803BA18
	push {r4, r5, r6, lr}
	ldr r1, _0803BA2C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803BA30
	movs r0, #0
	b _0803BAA2
	.align 2, 0
_0803BA2C: .4byte 0x0203A8EC
_0803BA30:
	movs r5, #0
	ldr r0, _0803BA90 @ =0x03004690
	ldr r0, [r0]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _0803BA7A
	ldr r6, _0803BA94 @ =0x081D3BE0
_0803BA3E:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0
	beq _0803BA64
	adds r0, r4, #0
	bl GetSpecialItemFuncIndex
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803BA64
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_0803BA64:
	adds r5, #1
	cmp r5, #4
	bgt _0803BA7A
	ldr r0, _0803BA90 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803BA3E
_0803BA7A:
	ldr r0, _0803BA98 @ =0x0203A8EC
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BAA0
	ldr r0, _0803BA9C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803BAA2
	.align 2, 0
_0803BA90: .4byte 0x03004690
_0803BA94: .4byte 0x081D3BE0
_0803BA98: .4byte 0x0203A8EC
_0803BA9C: .4byte 0x0203A97C
_0803BAA0:
	movs r0, #1
_0803BAA2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0803BAA8
sub_0803BAA8: @ 0x0803BAA8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, _0803BB30 @ =0x0203A8EC
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, _0803BB34 @ =0x80000001
	ands r0, r1
	cmp r0, #0
	beq _0803BB26
	ldr r0, _0803BB38 @ =0x03004690
	ldr r0, [r0]
	add r5, sp, #0xc
	adds r1, r5, #0
	bl sub_0803BCE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BB26
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _0803BB3C @ =0x0203A97C
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	bne _0803BB26
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	movs r5, #0
	str r5, [sp]
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BB26
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_0803BB26:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803BB30: .4byte 0x0203A8EC
_0803BB34: .4byte 0x80000001
_0803BB38: .4byte 0x03004690
_0803BB3C: .4byte 0x0203A97C

	thumb_func_start sub_0803BB40
sub_0803BB40: @ 0x0803BB40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r5, #0
	ldr r6, _0803BB80 @ =0x0203A8EC
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BC12
	ldr r4, _0803BB84 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble _0803BB88
	ldr r2, [r4]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0803BB88
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	adds r0, r6, #0
	adds r0, #0x79
	strb r5, [r0]
	b _0803BC12
	.align 2, 0
_0803BB80: .4byte 0x0203A8EC
_0803BB84: .4byte 0x03004690
_0803BB88:
	ldr r6, _0803BC1C @ =0x03004690
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r4, #4
	ands r0, r4
	cmp r0, #0
	beq _0803BC12
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #4
	ble _0803BBAA
	orrs r5, r4
_0803BBAA:
	ldr r0, [r6]
	add r6, sp, #0xc
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0803BD64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BC12
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, _0803BC20 @ =0x0203A8EC
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _0803BC24 @ =0x0203A97C
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	bne _0803BC12
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BC12
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_0803BC12:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BC1C: .4byte 0x03004690
_0803BC20: .4byte 0x0203A8EC
_0803BC24: .4byte 0x0203A97C

	thumb_func_start sub_0803BC28
sub_0803BC28: @ 0x0803BC28
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0803BC88 @ =0x0203A8EC
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803BC7E
	ldr r0, _0803BC8C @ =0x03004690
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _0803BC7E
	add r4, sp, #0xc
	adds r0, r2, #0
	adds r1, r4, #0
	bl AiFindSafestReachableLocation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BC7E
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_0803BC7E:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803BC88: .4byte 0x0203A8EC
_0803BC8C: .4byte 0x03004690

	thumb_func_start sub_0803BC90
sub_0803BC90: @ 0x0803BC90
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803BCC8 @ =0x0202E3E8
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BCC4
	ldr r0, _0803BCCC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803BCD4
	ldr r0, _0803BCD0 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803BCD4
_0803BCC4:
	movs r0, #0xff
	b _0803BCE0
	.align 2, 0
_0803BCC8: .4byte 0x0202E3E8
_0803BCCC: .4byte 0x0202E3DC
_0803BCD0: .4byte 0x0202BD48
_0803BCD4:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803BCE0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803BCE8
sub_0803BCE8: @ 0x0803BCE8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_0803BFF4
	ldr r0, _0803BD2C @ =0x08B98AE8
	movs r1, #0
	adds r2, r4, #0
	bl AiFindClosestTerrainAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BD34
	adds r0, r5, #0
	bl sub_0803BED0
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803BD30 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BD34
	movs r0, #1
	b _0803BD36
	.align 2, 0
_0803BD2C: .4byte 0x08B98AE8
_0803BD30: .4byte 0x0202E3E8
_0803BD34:
	movs r0, #0
_0803BD36:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0803BD3C
sub_0803BD3C: @ 0x0803BD3C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0803BED0
	ldr r0, _0803BD58 @ =0x08B98AEA
	movs r1, #0
	adds r2, r4, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BD5C
	movs r0, #1
	b _0803BD5E
	.align 2, 0
_0803BD58: .4byte 0x08B98AEA
_0803BD5C:
	movs r0, #0
_0803BD5E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803BD64
sub_0803BD64: @ 0x0803BD64
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl sub_0803BEA0
	adds r0, r5, #0
	bl sub_0803BFC0
	movs r0, #1
	orrs r0, r6
	adds r1, r4, #0
	bl sub_080360E8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BDB0
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803BDAC @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BDB0
_0803BDA6:
	movs r0, #1
	b _0803BDF6
	.align 2, 0
_0803BDAC: .4byte 0x0202E3E4
_0803BDB0:
	adds r0, r5, #0
	bl sub_0803BFF4
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080360E8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BDF4
	movs r3, #2
	ldrsh r1, [r4, r3]
	ldr r0, _0803BDFC @ =0x0202E3E4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BDA6
	ldr r0, _0803BE00 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803BDA6
_0803BDF4:
	movs r0, #0
_0803BDF6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803BDFC: .4byte 0x0202E3E4
_0803BE00: .4byte 0x0202E3DC

	thumb_func_start AiSetMovCostTableWithPassableWalls
AiSetMovCostTableWithPassableWalls: @ 0x0803BE04
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #1
	ldr r3, _0803BE24 @ =0x030043F0
	movs r5, #1
_0803BE0E:
	adds r0, r4, r2
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0803BE28
	adds r0, r2, r3
	strb r1, [r0]
	b _0803BE2C
	.align 2, 0
_0803BE24: .4byte 0x030043F0
_0803BE28:
	adds r0, r2, r3
	strb r5, [r0]
_0803BE2C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _0803BE0E
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0803BE3C
sub_0803BE3C: @ 0x0803BE3C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r2, #1
	ldr r6, _0803BE68 @ =0x030043F0
	adds r4, r6, #0
_0803BE48:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _0803BE48
	adds r1, r5, r6
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803BE68: .4byte 0x030043F0

	thumb_func_start sub_0803BE6C
sub_0803BE6C: @ 0x0803BE6C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r3, #1
	ldr r2, _0803BE9C @ =0x030043F0
	adds r5, r2, #0
_0803BE7A:
	adds r1, r3, r5
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x40
	bls _0803BE7A
	adds r0, r6, r2
	movs r1, #1
	strb r1, [r0]
	adds r0, r7, r2
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BE9C: .4byte 0x030043F0

	thumb_func_start sub_0803BEA0
sub_0803BEA0: @ 0x0803BEA0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803BECC @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BECC: .4byte 0x0202E3E4

	thumb_func_start sub_0803BED0
sub_0803BED0: @ 0x0803BED0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803BEFC @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BEFC: .4byte 0x0202E3E8

	thumb_func_start sub_0803BF00
sub_0803BF00: @ 0x0803BF00
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _0803BF2C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BF2C: .4byte 0x0202E3E4

	thumb_func_start sub_0803BF30
sub_0803BF30: @ 0x0803BF30
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _0803BF5C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BF5C: .4byte 0x0202E3E4

