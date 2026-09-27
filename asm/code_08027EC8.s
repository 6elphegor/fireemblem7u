	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027EC8
sub_08027EC8: @ 0x08027EC8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08027F14 @ =0x0202BBB8
	movs r0, #1
	ldrb r2, [r1, #4]
	orrs r0, r2
	strb r0, [r1, #4]
	ldr r0, _08027F18 @ =0x00000735
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl StartSubtitleHelp
	ldr r4, _08027F1C @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl IsCameraNotWatchingPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027F0C
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
_08027F0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027F14: .4byte 0x0202BBB8
_08027F18: .4byte 0x00000735
_08027F1C: .4byte 0x03004690

	thumb_func_start sub_08027F20
sub_08027F20: @ 0x08027F20
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08027F80 @ =0x0202BBB8
	movs r0, #0x14
	ldrsh r2, [r5, r0]
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	ldr r1, _08027F84 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r4, [r0]
	bl HandlePlayerMapCursor
	ldr r0, _08027F88 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027FB0
	cmp r4, #0
	beq _08027F9C
	ldr r0, _08027F8C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027F64
	ldr r0, _08027F90 @ =0x0000038A
	bl m4aSongNumStart
_08027F64:
	adds r0, r6, #0
	bl Proc_Break
	ldr r1, _08027F94 @ =0x0203A85C
	ldrh r0, [r5, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r5, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08027F98 @ =0x03004690
	ldr r0, [r0]
	bl SetStaffUseAction
	b _08027FF6
	.align 2, 0
_08027F80: .4byte 0x0202BBB8
_08027F84: .4byte 0x0202E3E8
_08027F88: .4byte 0x08B857F8
_08027F8C: .4byte 0x0202BBF8
_08027F90: .4byte 0x0000038A
_08027F94: .4byte 0x0203A85C
_08027F98: .4byte 0x03004690
_08027F9C:
	ldr r0, _08027FFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027FB0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08027FB0:
	ldr r0, _08028000 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027FE6
	ldr r0, _08028004 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08027FFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027FE6
	ldr r0, _08028008 @ =0x0000038B
	bl m4aSongNumStart
_08027FE6:
	ldr r1, _0802800C @ =0x0202BBB8
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl PutMapCursor
_08027FF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027FFC: .4byte 0x0202BBF8
_08028000: .4byte 0x08B857F8
_08028004: .4byte 0x02023C60
_08028008: .4byte 0x0000038B
_0802800C: .4byte 0x0202BBB8

	thumb_func_start sub_08028010
sub_08028010: @ 0x08028010
	push {lr}
	ldr r0, _08028030 @ =0x08B94214
	movs r1, #3
	bl Proc_Start
	ldr r0, _08028034 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802802C
	ldr r0, _08028038 @ =0x0000038A
	bl m4aSongNumStart
_0802802C:
	pop {r0}
	bx r0
	.align 2, 0
_08028030: .4byte 0x08B94214
_08028034: .4byte 0x0202BBF8
_08028038: .4byte 0x0000038A

	thumb_func_start CanUnitUseItemPrepScreen
CanUnitUseItemPrepScreen: @ 0x0802803C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08028052
	b _0802818C
_08028052:
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x5a
	cmp r0, #0x3c
	bls _08028060
	b _0802818C
_08028060:
	lsls r0, r0, #2
	ldr r1, _0802806C @ =_08028070
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802806C: .4byte _08028070
_08028070: @ jump table
	.4byte _08028164 @ case 0
	.4byte _08028164 @ case 1
	.4byte _08028164 @ case 2
	.4byte _08028164 @ case 3
	.4byte _08028164 @ case 4
	.4byte _08028164 @ case 5
	.4byte _08028164 @ case 6
	.4byte _08028164 @ case 7
	.4byte _08028164 @ case 8
	.4byte _0802816E @ case 9
	.4byte _0802816E @ case 10
	.4byte _0802816E @ case 11
	.4byte _0802816E @ case 12
	.4byte _0802816E @ case 13
	.4byte _0802818C @ case 14
	.4byte _0802818C @ case 15
	.4byte _0802818C @ case 16
	.4byte _0802818C @ case 17
	.4byte _0802818C @ case 18
	.4byte _0802818C @ case 19
	.4byte _0802818C @ case 20
	.4byte _0802818C @ case 21
	.4byte _0802818C @ case 22
	.4byte _0802818C @ case 23
	.4byte _0802818C @ case 24
	.4byte _0802818C @ case 25
	.4byte _0802818C @ case 26
	.4byte _0802818C @ case 27
	.4byte _0802818C @ case 28
	.4byte _0802818C @ case 29
	.4byte _0802818C @ case 30
	.4byte _0802818C @ case 31
	.4byte _0802818C @ case 32
	.4byte _0802818C @ case 33
	.4byte _0802818C @ case 34
	.4byte _0802818C @ case 35
	.4byte _0802818C @ case 36
	.4byte _0802818C @ case 37
	.4byte _0802818C @ case 38
	.4byte _0802818C @ case 39
	.4byte _0802818C @ case 40
	.4byte _0802818C @ case 41
	.4byte _0802818C @ case 42
	.4byte _0802818C @ case 43
	.4byte _0802818C @ case 44
	.4byte _0802816E @ case 45
	.4byte _0802817C @ case 46
	.4byte _0802816E @ case 47
	.4byte _0802818C @ case 48
	.4byte _0802816E @ case 49
	.4byte _0802818C @ case 50
	.4byte _0802818C @ case 51
	.4byte _0802818C @ case 52
	.4byte _0802818C @ case 53
	.4byte _0802818C @ case 54
	.4byte _0802818C @ case 55
	.4byte _0802818C @ case 56
	.4byte _0802818C @ case 57
	.4byte _0802818C @ case 58
	.4byte _0802818C @ case 59
	.4byte _0802816E @ case 60
_08028164:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStatGainItem
	b _08028176
_0802816E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08027400
_08028176:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802818E
_0802817C:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _0802818C
	movs r0, #1
	b _0802818E
_0802818C:
	movs r0, #0
_0802818E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08028194
sub_08028194: @ 0x08028194
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _080281C0
_080281A4:
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8a
	bne _080281BA
	movs r0, #1
	b _080281C2
_080281BA:
	adds r4, #1
	cmp r4, r5
	blt _080281A4
_080281C0:
	movs r0, #0
_080281C2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start BattleGenerateSimulationInternal
BattleGenerateSimulationInternal: @ 0x080281C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, _08028214 @ =0x0203A3F0
	adds r0, r6, #0
	mov r1, r8
	bl InitBattleUnit
	ldr r7, _08028218 @ =0x0203A470
	adds r0, r7, #0
	mov r1, sb
	bl InitBattleUnit
	strb r4, [r6, #0x10]
	strb r5, [r6, #0x11]
	ldr r4, _0802821C @ =0x0203A3D8
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08028202
	subs r1, r0, r2
_08028202:
	movs r3, #0x11
	ldrsb r3, [r6, r3]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08028220
	adds r0, r1, r2
	b _08028224
	.align 2, 0
_08028214: .4byte 0x0203A3F0
_08028218: .4byte 0x0203A470
_0802821C: .4byte 0x0203A3D8
_08028220:
	subs r0, r0, r3
	adds r0, r1, r0
_08028224:
	strb r0, [r4, #2]
	ldr r1, _0802823C @ =0x0203A3D8
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028244
	ldr r0, _08028240 @ =0x0203A3F0
	bl SetBattleUnitWeaponBallista
	b _0802824C
	.align 2, 0
_0802823C: .4byte 0x0203A3D8
_08028240: .4byte 0x0203A3F0
_08028244:
	ldr r0, _08028290 @ =0x0203A3F0
	ldr r1, [sp, #0x1c]
	bl SetBattleUnitWeapon
_0802824C:
	ldr r4, _08028294 @ =0x0203A470
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl SetBattleUnitWeapon
	bl BattleInitTargetCanCounter
	ldr r5, _08028290 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	bl DisableAllLightRunes
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r8
	mov r1, sb
	bl BattleGenerate
	bl EnableAllLightRunes
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028290: .4byte 0x0203A3F0
_08028294: .4byte 0x0203A470

	thumb_func_start BattleGenerateRealInternal
BattleGenerateRealInternal: @ 0x08028298
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _080282D8 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	ldr r4, _080282DC @ =0x0203A470
	adds r0, r4, #0
	adds r1, r7, #0
	bl InitBattleUnit
	ldr r0, _080282E0 @ =0x0203A3D8
	mov ip, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _080282C6
	subs r1, r0, r2
_080282C6:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _080282E4
	adds r0, r1, r2
	b _080282E8
	.align 2, 0
_080282D8: .4byte 0x0203A3F0
_080282DC: .4byte 0x0203A470
_080282E0: .4byte 0x0203A3D8
_080282E4:
	subs r0, r0, r3
	adds r0, r1, r0
_080282E8:
	mov r1, ip
	strb r0, [r1, #2]
	ldr r1, _08028300 @ =0x0203A3D8
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028308
	ldr r0, _08028304 @ =0x0203A3F0
	bl SetBattleUnitWeaponBallista
	b _08028312
	.align 2, 0
_08028300: .4byte 0x0203A3D8
_08028304: .4byte 0x0203A3F0
_08028308:
	ldr r0, _08028378 @ =0x0203A3F0
	movs r1, #1
	rsbs r1, r1, #0
	bl SetBattleUnitWeapon
_08028312:
	ldr r4, _0802837C @ =0x0203A470
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl SetBattleUnitWeapon
	bl BattleInitTargetCanCounter
	ldr r5, _08028378 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	bl DisableAllLightRunes
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r6, #0
	adds r1, r7, #0
	bl BattleGenerate
	bl EnableAllLightRunes
	adds r0, r4, #0
	bl BattleUnitTargetCheckCanCounter
	adds r0, r4, #0
	bl BattleUnitTargetSetEquippedWeapon
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08028370
	bl BattleApplyExpGains
	bl PidStatsRecordBattleRes
	adds r0, r6, #0
	bl PidStatsAddBattleAmt
	adds r0, r7, #0
	bl PidStatsAddBattleAmt
_08028370:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028378: .4byte 0x0203A3F0
_0802837C: .4byte 0x0203A470

	thumb_func_start BattleApplyGameStateUpdates
BattleApplyGameStateUpdates: @ 0x08028380
	push {lr}
	bl BattleApplyUnitUpdates
	bl BattleApplyBallistaUpdates
	ldr r0, _0802839C @ =0x0203A3F0
	ldr r1, _080283A0 @ =0x0203A470
	bl BattlePrintDebugUnitInfo
	bl BattlePrintDebugHitInfo
	pop {r0}
	bx r0
	.align 2, 0
_0802839C: .4byte 0x0203A3F0
_080283A0: .4byte 0x0203A470

	thumb_func_start BattleGenerateSimulation
BattleGenerateSimulation: @ 0x080283A4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r2, #0
	bge _080283BC
	cmp r3, #0
	bge _080283BC
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
_080283BC:
	ldr r0, _080283D8 @ =0x0203A3D8
	movs r1, #2
	strh r1, [r0]
	ldr r0, [sp, #0x10]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleGenerateSimulationInternal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080283D8: .4byte 0x0203A3D8

	thumb_func_start BattleGenerateReal
BattleGenerateReal: @ 0x080283DC
	push {lr}
	ldr r3, _080283EC @ =0x0203A3D8
	movs r2, #1
	strh r2, [r3]
	bl BattleGenerateRealInternal
	pop {r0}
	bx r0
	.align 2, 0
_080283EC: .4byte 0x0203A3D8

	thumb_func_start BattleGenerateBallistaSimulation
BattleGenerateBallistaSimulation: @ 0x080283F0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _0802840C @ =0x0203A3D8
	movs r6, #0
	movs r4, #0xa
	strh r4, [r5]
	str r6, [sp]
	bl BattleGenerateSimulationInternal
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802840C: .4byte 0x0203A3D8

	thumb_func_start BattleGenerateBallistaReal
BattleGenerateBallistaReal: @ 0x08028410
	push {lr}
	ldr r3, _08028420 @ =0x0203A3D8
	movs r2, #9
	strh r2, [r3]
	bl BattleGenerateRealInternal
	pop {r0}
	bx r0
	.align 2, 0
_08028420: .4byte 0x0203A3D8

	thumb_func_start BattleGenerate
BattleGenerate: @ 0x08028424
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _08028470 @ =0x0203A3F0
	ldr r4, _08028474 @ =0x0203A470
	adds r0, r5, #0
	adds r1, r4, #0
	bl ComputeBattleUnitStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitStats
	adds r0, r5, #0
	adds r1, r4, #0
	bl ComputeBattleUnitEffectiveStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitEffectiveStats
	cmp r6, #0
	bne _08028454
	bl ComputeBattleObstacleStats
_08028454:
	ldr r1, _08028478 @ =0x0203A3D8
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028480
	ldr r0, _0802847C @ =0x0203A85C
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _08028480
	bl BattleUnwindScripted
	b _08028484
	.align 2, 0
_08028470: .4byte 0x0203A3F0
_08028474: .4byte 0x0203A470
_08028478: .4byte 0x0203A3D8
_0802847C: .4byte 0x0203A85C
_08028480:
	bl BattleUnwind
_08028484:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BattleGenerateUiStats
BattleGenerateUiStats: @ 0x0802848C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _080284E8 @ =0x0203A3D8
	movs r3, #0
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	ldr r0, _080284EC @ =0x0203A470
	mov ip, r0
	adds r0, #0x48
	strh r2, [r0]
	mov r1, ip
	str r2, [r1, #0x4c]
	adds r1, #0x50
	movs r0, #0xff
	strb r0, [r1]
	mov r0, ip
	str r2, [r0, #4]
	ldr r5, _080284F0 @ =0x0203A3F0
	adds r0, r5, #0
	adds r0, #0x53
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	lsls r4, r6, #0x18
	lsrs r0, r4, #0x18
	cmp r0, #4
	bhi _080284F4
	mov r0, sp
	adds r1, r7, #0
	movs r2, #0x48
	bl memcpy
	asrs r1, r4, #0x18
	mov r0, sp
	bl EquipUnitItemSlot
	movs r6, #0
	adds r0, r5, #0
	mov r1, sp
	bl InitBattleUnit
	b _080284FC
	.align 2, 0
_080284E8: .4byte 0x0203A3D8
_080284EC: .4byte 0x0203A470
_080284F0: .4byte 0x0203A3F0
_080284F4:
	adds r0, r5, #0
	adds r1, r7, #0
	bl InitBattleUnit
_080284FC:
	ldr r4, _08028574 @ =0x0203A3F0
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetBattleUnitWeapon
	ldr r1, _08028578 @ =0x0203A470
	adds r0, r4, #0
	bl ComputeBattleUnitStats
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x11
	bne _08028544
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_08028544:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0802855A
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_0802855A:
	ldrh r0, [r5]
	bl GetItemWeaponEffect
	cmp r0, #3
	bne _0802856C
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #0xff
	strh r0, [r1]
_0802856C:
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028574: .4byte 0x0203A3F0
_08028578: .4byte 0x0203A470

	thumb_func_start BattleRoll1RN
BattleRoll1RN: @ 0x0802857C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _0802859C @ =0x0203A3D8
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080285A0
	adds r0, r3, #0
	bl RandRoll
	lsls r0, r0, #0x18
	b _080285A2
	.align 2, 0
_0802859C: .4byte 0x0203A3D8
_080285A0:
	lsls r0, r2, #0x18
_080285A2:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start BattleRoll2RN
BattleRoll2RN: @ 0x080285A8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _080285C8 @ =0x0203A3D8
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080285CC
	adds r0, r3, #0
	bl RandRoll2Rn
	lsls r0, r0, #0x18
	b _080285CE
	.align 2, 0
_080285C8: .4byte 0x0203A3D8
_080285CC:
	lsls r0, r2, #0x18
_080285CE:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start InitBattleUnit
InitBattleUnit: @ 0x080285D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	beq _080286AA
	movs r2, #0x48
	bl memcpy
	adds r0, r6, #0
	bl GetUnitMaxHp
	movs r4, #0
	strb r0, [r5, #0x12]
	adds r0, r6, #0
	bl GetUnitPower
	strb r0, [r5, #0x14]
	adds r0, r6, #0
	bl GetUnitSkill
	strb r0, [r5, #0x15]
	adds r0, r6, #0
	bl GetUnitSpeed
	strb r0, [r5, #0x16]
	adds r0, r6, #0
	bl GetUnitDefense
	strb r0, [r5, #0x17]
	adds r0, r6, #0
	bl GetUnitLuck
	strb r0, [r5, #0x19]
	adds r0, r6, #0
	bl GetUnitResistance
	strb r0, [r5, #0x18]
	ldr r1, [r6, #4]
	ldr r0, [r6]
	ldrb r2, [r1, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r2, [r6, #0x1a]
	adds r0, r2, r0
	strb r0, [r5, #0x1a]
	ldrb r6, [r6, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r0, r6, r1
	strb r0, [r5, #0x1d]
	ldrb r1, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x70
	strb r1, [r0]
	ldrb r0, [r5, #9]
	adds r1, r5, #0
	adds r1, #0x71
	strb r0, [r1]
	ldrb r0, [r5, #0x13]
	adds r1, #1
	strb r0, [r1]
	subs r1, #3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x73
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080286B0 @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x7b
	strb r4, [r0]
	ldr r1, _080286B4 @ =0x0203A470
	adds r0, r1, #0
	adds r0, #0x7b
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #0x28
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x6e
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x6e
	strb r4, [r0]
_080286AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080286B0: .4byte 0x0203A3F0
_080286B4: .4byte 0x0203A470

	thumb_func_start InitBattleUnitWithoutBonuses
InitBattleUnitWithoutBonuses: @ 0x080286B8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl InitBattleUnit
	ldrb r0, [r4, #0x12]
	strb r0, [r5, #0x12]
	ldrb r0, [r4, #0x14]
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #0x15]
	strb r0, [r5, #0x15]
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x16]
	ldrb r0, [r4, #0x17]
	strb r0, [r5, #0x17]
	ldrb r0, [r4, #0x19]
	strb r0, [r5, #0x19]
	ldrb r0, [r4, #0x18]
	strb r0, [r5, #0x18]
	ldr r1, [r4, #4]
	ldr r0, [r4]
	ldrb r1, [r1, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r1, r0
	strb r0, [r5, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SetBattleUnitTerrainBonuses
SetBattleUnitTerrainBonuses: @ 0x080286F0
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x55
	strb r1, [r3]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x44]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x48]
	ldrb r1, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x4c]
	ldrb r3, [r3]
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr

	thumb_func_start SetBattleUnitTerrainBonusesAuto
SetBattleUnitTerrainBonusesAuto: @ 0x08028728
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08028778 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r3, r2, #0
	adds r3, #0x55
	strb r0, [r3]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x44]
	ldrb r1, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x48]
	ldrb r1, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x4c]
	ldrb r3, [r3]
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr
	.align 2, 0
_08028778: .4byte 0x0202E3E0

	thumb_func_start SetBattleUnitWeapon
SetBattleUnitWeapon: @ 0x0802877C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08028798
	adds r0, r5, #0
	bl GetUnitEquippedWeaponSlot
	adds r4, r0, #0
_08028798:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080287B6
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetBallistaItemAt
	cmp r0, #0
	beq _080287B6
	movs r4, #8
_080287B6:
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	mov sb, r1
	cmp r4, #8
	bhi _08028894
	lsls r0, r4, #2
	ldr r1, _080287D0 @ =_080287D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080287D0: .4byte _080287D4
_080287D4: @ jump table
	.4byte _080287F8 @ case 0
	.4byte _080287F8 @ case 1
	.4byte _080287F8 @ case 2
	.4byte _080287F8 @ case 3
	.4byte _080287F8 @ case 4
	.4byte _08028812 @ case 5
	.4byte _08028830 @ case 6
	.4byte _08028850 @ case 7
	.4byte _08028870 @ case 8
_080287F8:
	adds r1, r5, #0
	adds r1, #0x51
	strb r4, [r1]
	lsls r2, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r2, r5, #0
	adds r2, #0x48
	strh r0, [r2]
	mov r8, r1
	b _080288AC
_08028812:
	adds r2, r5, #0
	adds r2, #0x51
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0802882C @ =0x0202BBB8
	ldrh r0, [r0, #0x2c]
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	mov r8, r2
	adds r4, r1, #0
	b _080288AE
	.align 2, 0
_0802882C: .4byte 0x0202BBB8
_08028830:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802884C @ =0x0203A7F4
	ldrh r1, [r0, #0x1a]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _080288AA
	.align 2, 0
_0802884C: .4byte 0x0203A7F4
_08028850:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802886C @ =0x0203A7F4
	ldrh r1, [r0, #0x1c]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _080288AA
	.align 2, 0
_0802886C: .4byte 0x0203A7F4
_08028870:
	adds r4, r5, #0
	adds r4, #0x51
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetBallistaItemAt
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
	mov r8, r4
	b _080288AC
_08028894:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0xff
	strb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	movs r0, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
_080288AA:
	mov r8, r3
_080288AC:
	adds r4, r2, #0
_080288AE:
	ldrh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r6, r5, #0
	adds r6, #0x50
	strb r0, [r6]
	ldr r7, _080288F4 @ =0x0203A3D8
	movs r0, #4
	ldrh r1, [r7]
	ands r0, r1
	cmp r0, #0
	bne _0802895A
	ldr r0, [r5, #0x4c]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08028920
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x11
	beq _0802891C
	cmp r0, #0x11
	bgt _080288F8
	cmp r0, #0x10
	beq _08028906
	b _08028920
	.align 2, 0
_080288F4: .4byte 0x0203A3D8
_080288F8:
	cmp r0, #0x99
	bne _08028920
	ldrb r7, [r7, #2]
	cmp r7, #2
	bne _08028910
	movs r0, #5
	b _0802891E
_08028906:
	ldrb r7, [r7, #2]
	cmp r7, #2
	bne _08028910
	movs r0, #6
	b _0802891E
_08028910:
	ldr r0, [r5, #0x4c]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x4c]
	b _08028920
_0802891C:
	movs r0, #7
_0802891E:
	strb r0, [r6]
_08028920:
	ldrh r0, [r4]
	ldr r1, _08028968 @ =0x0203A3D8
	ldrb r1, [r1, #2]
	bl IsItemCoveringRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028938
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08028942
_08028938:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_08028942:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	bne _0802895A
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_0802895A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028968: .4byte 0x0203A3D8

	thumb_func_start SetBattleUnitWeaponBallista
SetBattleUnitWeaponBallista: @ 0x0802896C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	bl GetBallistaItemAt
	adds r4, r6, #0
	adds r4, #0x48
	movs r5, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r6, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r1, r6, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x52
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080289AC
sub_080289AC: @ 0x080289AC
	bx lr
	.align 2, 0

	thumb_func_start ComputeBattleUnitStats
ComputeBattleUnitStats: @ 0x080289B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ComputeBattleUnitDefense
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitAttack
	adds r0, r4, #0
	bl ComputeBattleUnitSpeed
	adds r0, r4, #0
	bl ComputeBattleUnitHitRate
	adds r0, r4, #0
	bl ComputeBattleUnitAvoidRate
	adds r0, r4, #0
	bl ComputeBattleUnitCritRate
	adds r0, r4, #0
	bl ComputeBattleUnitDodgeRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitSupportBonuses
	adds r0, r4, #0
	bl ComputeBattleUnitWeaponRankBonuses
	adds r0, r4, #0
	bl ComputeBattleUnitStatusBonuses
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ComputeBattleUnitEffectiveStats
ComputeBattleUnitEffectiveStats: @ 0x080289FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ComputeBattleUnitEffectiveHitRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitEffectiveCritRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitSilencerRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitSpecialWeaponStats
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ComputeBattleUnitSupportBonuses
ComputeBattleUnitSupportBonuses: @ 0x08028A24
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _08028A90 @ =0x0203A3D8
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028A3E
	ldr r0, _08028A94 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _08028A86
_08028A3E:
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	bl GetUnitSupportBonuses
	adds r1, r5, #0
	adds r1, #0x5a
	ldrb r0, [r4, #1]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	adds r1, #2
	ldrb r0, [r4, #2]
	ldrh r3, [r1]
	adds r0, r3, r0
	strh r0, [r1]
	adds r1, #4
	ldrb r0, [r4, #3]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	adds r1, #2
	ldrh r3, [r1]
	ldrb r2, [r4, #4]
	adds r0, r3, r2
	strh r0, [r1]
	adds r1, #4
	ldrh r3, [r1]
	ldrb r2, [r4, #5]
	adds r0, r3, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r3, [r1]
	ldrb r4, [r4, #6]
	adds r0, r3, r4
	strh r0, [r1]
_08028A86:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028A90: .4byte 0x0203A3D8
_08028A94: .4byte 0x0202BBF8

	thumb_func_start ComputeBattleUnitDefense
ComputeBattleUnitDefense: @ 0x08028A98
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08028ABE
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _08028AEA
_08028ABE:
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08028ADC
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _08028AEA
_08028ADC:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	ldrsb r1, [r4, r1]
_08028AEA:
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5c
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ComputeBattleUnitBaseDefense
ComputeBattleUnitBaseDefense: @ 0x08028AF8
	adds r1, r0, #0
	adds r1, #0x56
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0x17
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #0x5c
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start ComputeBattleUnitAttack
ComputeBattleUnitAttack: @ 0x08028B10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r5, #0
	adds r6, #0x48
	ldrh r0, [r6]
	bl GetItemMight
	adds r1, r5, #0
	adds r1, #0x54
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldrh r0, [r6]
	adds r1, r4, #0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08028B52
	ldrh r0, [r6]
	bl GetItemIndex
	adds r1, r5, #0
	adds r1, #0x5a
	ldrh r2, [r1]
	lsls r0, r2, #1
	strh r0, [r1]
_08028B52:
	adds r1, r5, #0
	adds r1, #0x5a
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ComputeBattleUnitSpeed
ComputeBattleUnitSpeed: @ 0x08028B68
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeight
	adds r1, r0, #0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	cmp r1, #0
	bge _08028B82
	movs r1, #0
_08028B82:
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08028B98
	movs r0, #0
	strh r0, [r1]
_08028B98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ComputeBattleUnitHitRate
ComputeBattleUnitHitRate: @ 0x08028BA0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemHit
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r1, r0
	adds r6, r4, #0
	adds r6, #0x60
	strh r5, [r6]
	ldr r3, _08028C44 @ =0x0202BBF8
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r2, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08028C3C
	ldrb r0, [r3, #0x1b]
	cmp r0, #1
	beq _08028C3C
	ldr r1, _08028C48 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028C3C
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08028C3C
	ldr r1, _08028C4C @ =0x081C3AC0
	lsrs r0, r2, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r4]
	ldr r0, [r0]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bne _08028C26
	ldrh r3, [r3, #0x2c]
	lsls r0, r3, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _08028C22
	movs r0, #0xa
_08028C22:
	adds r0, r5, r0
	strh r0, [r6]
_08028C26:
	adds r0, r4, #0
	bl sub_08028194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C3C
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_08028C3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028C44: .4byte 0x0202BBF8
_08028C48: .4byte 0x0202BBB8
_08028C4C: .4byte 0x081C3AC0

	thumb_func_start ComputeBattleUnitAvoidRate
ComputeBattleUnitAvoidRate: @ 0x08028C50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #1
	subs r0, #7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r5, r1, r0
	adds r6, r4, #0
	adds r6, #0x62
	strh r5, [r6]
	ldr r3, _08028CF4 @ =0x0202BBF8
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r2, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08028CDC
	ldrb r0, [r3, #0x1b]
	cmp r0, #1
	beq _08028CDC
	ldr r1, _08028CF8 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028CDC
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08028CDC
	ldr r1, _08028CFC @ =0x081C3AC0
	lsrs r0, r2, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r4]
	ldr r0, [r0]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bne _08028CC6
	ldrh r3, [r3, #0x2c]
	lsls r0, r3, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _08028CC2
	movs r0, #0xa
_08028CC2:
	adds r0, r5, r0
	strh r0, [r6]
_08028CC6:
	adds r0, r4, #0
	bl sub_08028194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028CDC
	adds r1, r4, #0
	adds r1, #0x62
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_08028CDC:
	adds r1, r4, #0
	adds r1, #0x62
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08028CEC
	movs r0, #0
	strh r0, [r1]
_08028CEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028CF4: .4byte 0x0202BBF8
_08028CF8: .4byte 0x0202BBB8
_08028CFC: .4byte 0x081C3AC0

	thumb_func_start ComputeBattleUnitCritRate
ComputeBattleUnitCritRate: @ 0x08028D00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemCrit
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	adds r2, r1, r0
	adds r3, r4, #0
	adds r3, #0x66
	strh r2, [r3]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08028D36
	adds r0, r2, #0
	adds r0, #0xf
	strh r0, [r3]
_08028D36:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ComputeBattleUnitDodgeRate
ComputeBattleUnitDodgeRate: @ 0x08028D3C
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, #0x68
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start ComputeBattleUnitEffectiveHitRate
ComputeBattleUnitEffectiveHitRate: @ 0x08028D48
	adds r2, r0, #0
	adds r2, #0x60
	adds r1, #0x62
	ldrh r2, [r2]
	ldrh r1, [r1]
	subs r1, r2, r1
	adds r2, r0, #0
	adds r2, #0x64
	strh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x64
	ble _08028D66
	movs r0, #0x64
	strh r0, [r2]
_08028D66:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08028D72
	movs r0, #0
	strh r0, [r2]
_08028D72:
	bx lr

	thumb_func_start ComputeBattleUnitEffectiveCritRate
ComputeBattleUnitEffectiveCritRate: @ 0x08028D74
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r4, #0
	adds r1, #0x66
	adds r0, r6, #0
	adds r0, #0x68
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r5, r1, r0
	adds r7, r4, #0
	adds r7, #0x6a
	strh r5, [r7]
	ldr r2, _08028DE8 @ =0x0202BBF8
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028DD0
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	beq _08028DD0
	ldr r1, _08028DEC @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028DD0
	movs r0, #0xc0
	ldrb r1, [r6, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08028DD0
	ldrh r2, [r2, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _08028DCC
	movs r0, #0xa
_08028DCC:
	subs r0, r5, r0
	strh r0, [r7]
_08028DD0:
	adds r0, r4, #0
	adds r0, #0x6a
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028DE2
	movs r0, #0
	strh r0, [r5]
_08028DE2:
	movs r4, #0
	b _08028DF2
	.align 2, 0
_08028DE8: .4byte 0x0202BBF8
_08028DEC: .4byte 0x0202BBB8
_08028DF0:
	adds r4, #1
_08028DF2:
	cmp r4, #4
	bgt _08028E16
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _08028E16
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	beq _08028DF0
	movs r0, #0
	strh r0, [r5]
_08028E16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ComputeBattleUnitSilencerRate
ComputeBattleUnitSilencerRate: @ 0x08028E1C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r2, r0
	cmp r2, #0
	bne _08028E3E
	adds r0, r3, #0
	adds r0, #0x6c
	strh r2, [r0]
	b _08028E72
_08028E3E:
	adds r2, r3, #0
	adds r2, #0x6c
	movs r0, #0x32
	strh r0, [r2]
	ldr r3, [r4]
	ldr r4, [r4, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08028E5E
	movs r0, #0x19
	strh r0, [r2]
_08028E5E:
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08028E72
	movs r0, #0
	strh r0, [r2]
_08028E72:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ComputeBattleUnitWeaponRankBonuses
ComputeBattleUnitWeaponRankBonuses: @ 0x08028E78
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _08028EAE
	bl GetItemType
	adds r1, r0, #0
	cmp r1, #7
	bgt _08028EAE
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _08028EAE
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
_08028EAE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ComputeBattleUnitStatusBonuses
ComputeBattleUnitStatusBonuses: @ 0x08028EB4
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _08028EDA
	cmp r0, #6
	bgt _08028ECC
	cmp r0, #5
	beq _08028ED6
	b _08028EEA
_08028ECC:
	cmp r0, #7
	beq _08028EDE
	cmp r0, #8
	beq _08028EE2
	b _08028EEA
_08028ED6:
	adds r1, #0x5a
	b _08028EE4
_08028EDA:
	adds r1, #0x5c
	b _08028EE4
_08028EDE:
	adds r1, #0x66
	b _08028EE4
_08028EE2:
	adds r1, #0x62
_08028EE4:
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_08028EEA:
	bx lr

	thumb_func_start ComputeBattleUnitSpecialWeaponStats
ComputeBattleUnitSpecialWeaponStats: @ 0x08028EEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, [r4, #0x4c]
	movs r0, #0x40
	ands r5, r0
	cmp r5, #0
	beq _08028F34
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x10
	blt _08028F7C
	cmp r0, #0x11
	ble _08028F12
	cmp r0, #0x99
	bne _08028F7C
_08028F12:
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	b _08028F7C
_08028F34:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #3
	bne _08028F68
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	adds r0, #1
	asrs r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	cmp r0, #0
	bne _08028F58
	movs r0, #1
	strh r0, [r1]
_08028F58:
	adds r0, r6, #0
	adds r0, #0x5c
	strh r5, [r0]
	adds r0, r4, #0
	adds r0, #0x66
	strh r5, [r0]
	adds r0, #4
	strh r5, [r0]
_08028F68:
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08028F7C
	adds r1, r6, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
_08028F7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ClearBattleHits
ClearBattleHits: @ 0x08028F84
	push {r4, r5, lr}
	ldr r4, _08028FA8 @ =0x0203A4F0
	ldr r5, _08028FAC @ =0x0203A50C
	movs r2, #0
	movs r3, #0
	adds r0, r4, #0
	movs r1, #6
_08028F92:
	strh r3, [r0]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _08028F92
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028FA8: .4byte 0x0203A4F0
_08028FAC: .4byte 0x0203A50C

	thumb_func_start BattleUnwind
BattleUnwind: @ 0x08028FB0
	push {r4, r5, lr}
	sub sp, #8
	bl ClearBattleHits
	add r4, sp, #4
	mov r0, sp
	adds r1, r4, #0
	bl BattleGetBattleUnitOrder
	ldr r5, _08029024 @ =0x0203A50C
	ldr r1, [r5]
	movs r0, #1
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl BattleGenerateRoundHits
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029010
	ldr r1, [r5]
	movs r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl BattleGenerateRoundHits
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029010
	mov r0, sp
	adds r1, r4, #0
	bl BattleGetFollowUpOrder
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029010
	ldr r1, [r5]
	movs r0, #4
	strh r0, [r1]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl BattleGenerateRoundHits
_08029010:
	ldr r0, _08029024 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #0x80
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029024: .4byte 0x0203A50C

	thumb_func_start BattleGetBattleUnitOrder
BattleGetBattleUnitOrder: @ 0x08029028
	ldr r2, _08029034 @ =0x0203A3F0
	str r2, [r0]
	ldr r0, _08029038 @ =0x0203A470
	str r0, [r1]
	bx lr
	.align 2, 0
_08029034: .4byte 0x0203A3F0
_08029038: .4byte 0x0203A470

	thumb_func_start BattleGetFollowUpOrder
BattleGetFollowUpOrder: @ 0x0802903C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _08029070 @ =0x0203A470
	adds r2, r0, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r6, r0, #0
	cmp r1, #0xfa
	bgt _080290AE
	ldr r0, _08029074 @ =0x0203A3F0
	adds r1, r0, #0
	adds r1, #0x5e
	movs r5, #0
	ldrsh r3, [r1, r5]
	movs r1, #0
	ldrsh r2, [r2, r1]
	subs r1, r3, r2
	adds r5, r0, #0
	cmp r1, #0
	blt _08029078
	cmp r1, #3
	ble _080290AE
	b _0802907E
	.align 2, 0
_08029070: .4byte 0x0203A470
_08029074: .4byte 0x0203A3F0
_08029078:
	subs r0, r2, r3
	cmp r0, #3
	ble _080290AE
_0802907E:
	adds r0, r5, #0
	adds r0, #0x5e
	adds r2, r6, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08029098
	str r5, [r4]
	str r6, [r7]
	b _0802909C
_08029098:
	str r6, [r4]
	str r5, [r7]
_0802909C:
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #3
	beq _080290AE
	movs r0, #1
	b _080290B0
_080290AE:
	movs r0, #0
_080290B0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BattleGenerateRoundHits
BattleGenerateRoundHits: @ 0x080290B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _080290D0
	b _08029104
_080290CC:
	movs r0, #1
	b _08029106
_080290D0:
	ldr r0, _08029110 @ =0x0203A50C
	ldr r0, [r0]
	ldrh r7, [r0]
	adds r0, r6, #0
	bl GetBattleUnitHitCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _08029104
_080290E4:
	ldr r0, _08029110 @ =0x0203A50C
	ldr r1, [r0]
	adds r0, r7, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateHit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080290CC
	adds r4, #1
	cmp r4, r5
	blt _080290E4
_08029104:
	movs r0, #0
_08029106:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08029110: .4byte 0x0203A50C

	thumb_func_start GetBattleUnitHitCount
GetBattleUnitHitCount: @ 0x08029114
	push {r4, lr}
	movs r4, #1
	bl BattleCheckBraveEffect
	lsls r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BattleCheckBraveEffect
BattleCheckBraveEffect: @ 0x08029128
	ldr r0, [r0, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08029148
	ldr r0, _08029144 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	b _0802914A
	.align 2, 0
_08029144: .4byte 0x0203A50C
_08029148:
	movs r0, #0
_0802914A:
	bx lr

	thumb_func_start BattleCheckTriangleAttack
BattleCheckTriangleAttack: @ 0x0802914C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080291F8 @ =0x081C3CE4
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r3, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r6, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r6, r0
	movs r0, #0xc0
	lsls r0, r0, #0xf
	ands r6, r0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	mov sl, r0
	ldrb r5, [r5, #0x11]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	mov sb, r5
	movs r7, #0xc0
	ldrb r4, [r4, #0xb]
	ands r7, r4
	ldr r0, _080291FC @ =0x0203A3D8
	str r3, [r0, #0x10]
	str r3, [r0, #0x14]
	mov r5, sp
	movs r0, #3
	mov r8, r0
_08029198:
	movs r0, #1
	ldrsb r0, [r5, r0]
	add r0, sb
	ldr r1, _08029200 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	add r1, sl
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _0802920C
	adds r0, r4, #0
	str r3, [sp, #8]
	bl GetUnit
	adds r2, r0, #0
	movs r0, #0xc0
	ands r4, r0
	ldr r3, [sp, #8]
	cmp r4, r7
	bne _0802920C
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	beq _0802920C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r6
	cmp r0, #0
	beq _0802920C
	adds r3, #1
	ldr r1, _080291FC @ =0x0203A3D8
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _08029204
	str r2, [r1, #0x10]
	b _0802920C
	.align 2, 0
_080291F8: .4byte 0x081C3CE4
_080291FC: .4byte 0x0203A3D8
_08029200: .4byte 0x0202E3DC
_08029204:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0802920C
	str r2, [r1, #0x14]
_0802920C:
	adds r5, #2
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r0, r8
	cmp r0, #0
	bge _08029198
	movs r0, #0
	cmp r3, #1
	ble _08029222
	movs r0, #1
_08029222:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BattleUpdateBattleStats
BattleUpdateBattleStats: @ 0x08029234
	adds r3, r0, #0
	ldr r2, _08029260 @ =0x0203A3D8
	adds r0, #0x5a
	ldrh r0, [r0]
	strh r0, [r2, #6]
	adds r1, #0x5c
	ldrh r0, [r1]
	strh r0, [r2, #8]
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	adds r0, r3, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
	bx lr
	.align 2, 0
_08029260: .4byte 0x0203A3D8

	thumb_func_start BattleGenerateHitAttributes
BattleGenerateHitAttributes: @ 0x08029264
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802928C @ =0x0203A3D8
	movs r5, #0
	movs r0, #0
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	movs r1, #1
	bl BattleRoll2RN
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029294
	ldr r0, _08029290 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #2
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	b _08029314
	.align 2, 0
_0802928C: .4byte 0x0203A3D8
_08029290: .4byte 0x0203A50C
_08029294:
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #8]
	subs r0, r1, r2
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xc]
	movs r1, #0
	bl BattleRoll1RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080292EA
	ldrh r0, [r4, #0xe]
	movs r1, #0
	bl BattleRoll1RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080292D4
	ldr r0, _080292D0 @ =0x0203A50C
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x7f
	b _080292E8
	.align 2, 0
_080292D0: .4byte 0x0203A50C
_080292D4:
	ldr r0, _0802931C @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #1
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
_080292E8:
	strh r0, [r4, #4]
_080292EA:
	ldr r1, _08029320 @ =0x0203A3D8
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0x7f
	ble _080292F8
	movs r0, #0x7f
	strh r0, [r1, #4]
_080292F8:
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08029304
	movs r0, #0
	strh r0, [r1, #4]
_08029304:
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08029314
	adds r1, r6, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_08029314:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802931C: .4byte 0x0203A50C
_08029320: .4byte 0x0203A3D8

	thumb_func_start BattleGenerateHitTriangleAttack
BattleGenerateHitTriangleAttack: @ 0x08029324
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802938C
	ldr r4, _08029394 @ =0x0203A3D8
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _0802938C
	ldr r5, _08029398 @ =0x0203A50C
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	ands r1, r0
	cmp r1, #0
	beq _0802938C
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _0802938C
	movs r0, #0x20
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _0802938C
	adds r0, r2, #0
	adds r1, r3, #0
	bl BattleCheckTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802938C
	ldr r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x64
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xa]
_0802938C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029394: .4byte 0x0203A3D8
_08029398: .4byte 0x0203A50C

	thumb_func_start BattleGenerateHitEffects
BattleGenerateHitEffects: @ 0x0802939C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r1, r5, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r6, _080293D0 @ =0x0203A50C
	ldr r1, [r6]
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802948E
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _080293D4
	cmp r0, #3
	beq _080293E0
	b _080293EE
	.align 2, 0
_080293D0: .4byte 0x0203A50C
_080293D4:
	adds r1, r7, #0
	adds r1, #0x6f
	strb r0, [r1]
	ldr r0, [r6]
	movs r1, #0x40
	b _080293E8
_080293E0:
	ldr r0, [r6]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
_080293E8:
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_080293EE:
	ldrh r0, [r4]
	bl GetItemWeaponEffect
	cmp r0, #4
	bne _0802943C
	movs r1, #0x19
	ldrsb r1, [r5, r1]
	movs r0, #0x1f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl BattleRoll1RN
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802943C
	ldr r0, _08029434 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #0x80
	movs r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, _08029438 @ =0x0203A3D8
	ldrb r1, [r5, #0x13]
	ldrb r0, [r0, #4]
	subs r0, r1, r0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802945E
	strb r2, [r5, #0x13]
	b _0802945E
	.align 2, 0
_08029434: .4byte 0x0203A50C
_08029438: .4byte 0x0203A3D8
_0802943C:
	ldr r1, _080294D0 @ =0x0203A3D8
	movs r2, #0x13
	ldrsb r2, [r7, r2]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _0802944C
	strh r2, [r1, #4]
_0802944C:
	ldrb r2, [r7, #0x13]
	ldrb r1, [r1, #4]
	subs r0, r2, r1
	strb r0, [r7, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802945E
	movs r0, #0
	strb r0, [r7, #0x13]
_0802945E:
	ldrh r0, [r4]
	bl GetItemWeaponEffect
	cmp r0, #2
	bne _0802948E
	ldr r0, _080294D0 @ =0x0203A3D8
	ldrb r3, [r5, #0x13]
	ldrb r0, [r0, #4]
	adds r0, r3, r0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	ldrb r2, [r5, #0x12]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802947E
	strb r2, [r5, #0x13]
_0802947E:
	ldr r0, _080294D4 @ =0x0203A50C
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
_0802948E:
	ldr r2, _080294D4 @ =0x0203A50C
	ldr r1, [r2]
	ldr r0, _080294D0 @ =0x0203A3D8
	ldrh r0, [r0, #4]
	strb r0, [r1, #3]
	ldr r1, [r2]
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080294AE
	ldr r0, [r5, #0x4c]
	movs r1, #0x82
	ands r0, r1
	cmp r0, #0
	beq _080294C8
_080294AE:
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl GetItemAfterUse
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080294C8
	adds r1, r5, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_080294C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080294D0: .4byte 0x0203A3D8
_080294D4: .4byte 0x0203A50C

	thumb_func_start BattleGenerateHit
BattleGenerateHit: @ 0x080294D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08029550 @ =0x0203A470
	cmp r4, r6
	bne _080294F0
	ldr r0, _08029554 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #8
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
_080294F0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleUpdateBattleStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleGenerateHitTriangleAttack
	adds r0, r4, #0
	bl BattleGenerateHitAttributes
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleGenerateHitEffects
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802951E
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08029558
_0802951E:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, _08029554 @ =0x0203A50C
	ldr r1, [r2]
	movs r0, #2
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _08029546
	ldr r1, [r2]
	movs r0, #4
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
_08029546:
	ldr r0, [r2]
	adds r0, #4
	str r0, [r2]
	movs r0, #1
	b _08029562
	.align 2, 0
_08029550: .4byte 0x0203A470
_08029554: .4byte 0x0203A50C
_08029558:
	ldr r1, _08029568 @ =0x0203A50C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r0, #0
_08029562:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08029568: .4byte 0x0203A50C

	thumb_func_start BattleApplyExpGains
BattleApplyExpGains: @ 0x0802956C
	push {r4, r5, r6, lr}
	ldr r5, _080295D4 @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802958A
	ldr r0, _080295D8 @ =0x0203A470
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _080295CE
_0802958A:
	ldr r1, _080295DC @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080295CE
	ldr r4, _080295D8 @ =0x0203A470
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetBattleUnitExpGain
	adds r6, r5, #0
	adds r6, #0x6e
	strb r0, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetBattleUnitExpGain
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r2, [r5, #9]
	ldrb r6, [r6]
	adds r1, r2, r6
	strb r1, [r5, #9]
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	strb r0, [r4, #9]
	adds r0, r5, #0
	bl CheckBattleUnitLevelUp
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
_080295CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080295D4: .4byte 0x0203A3F0
_080295D8: .4byte 0x0203A470
_080295DC: .4byte 0x0202BBF8

	thumb_func_start GetStatIncrease
GetStatIncrease: @ 0x080295E0
	push {r4, lr}
	movs r4, #0
	cmp r0, #0x64
	ble _080295F0
_080295E8:
	adds r4, #1
	subs r0, #0x64
	cmp r0, #0x64
	bgt _080295E8
_080295F0:
	bl RandRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080295FC
	adds r4, #1
_080295FC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetAutoleveledStatIncrease
GetAutoleveledStatIncrease: @ 0x08029604
	push {r4, lr}
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r4, #0
	cmp r4, #0
	bge _08029612
	adds r0, r4, #3
_08029612:
	asrs r0, r0, #2
	bl RandNext
	adds r1, r0, #0
	adds r0, r4, #0
	cmp r4, #0
	bge _08029622
	adds r0, r4, #7
_08029622:
	asrs r0, r0, #3
	subs r0, r1, r0
	adds r0, r4, r0
	bl GetStatIncrease
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CanBattleUnitGainLevels
CanBattleUnitGainLevels: @ 0x08029634
	adds r2, r0, #0
	ldr r1, _08029658 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08029652
	ldrb r0, [r2, #9]
	cmp r0, #0xff
	beq _0802965C
	movs r0, #0xc0
	ldrb r2, [r2, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0802965C
_08029652:
	movs r0, #1
	b _0802965E
	.align 2, 0
_08029658: .4byte 0x0202BBB8
_0802965C:
	movs r0, #0
_0802965E:
	bx lr

	thumb_func_start CheckBattleUnitLevelUp
CheckBattleUnitLevelUp: @ 0x08029660
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802967A
	b _08029808
_0802967A:
	ldrb r0, [r7, #9]
	cmp r0, #0x63
	bhi _08029682
	b _08029808
_08029682:
	adds r2, r0, #0
	subs r2, #0x64
	strb r2, [r7, #9]
	ldrb r0, [r7, #8]
	adds r0, #1
	strb r0, [r7, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bne _080296A4
	adds r1, r7, #0
	adds r1, #0x6e
	ldrb r3, [r1]
	subs r0, r3, r2
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r7, #9]
_080296A4:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r1, #0
	mov sl, r1
	cmp r0, #0
	beq _080296B8
	movs r3, #5
	mov sl, r3
_080296B8:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x73
	str r1, [sp]
	strb r0, [r1]
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	add r0, sl
	bl GetStatIncrease
	adds r3, r7, #0
	adds r3, #0x74
	str r3, [sp, #4]
	strb r0, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	add r0, sl
	bl GetStatIncrease
	movs r1, #0x75
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	add r0, sl
	bl GetStatIncrease
	movs r3, #0x76
	adds r3, r3, r7
	mov sb, r3
	strb r0, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r5, r7, #0
	adds r5, #0x77
	strb r0, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r4, r7, #0
	adds r4, #0x78
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x79
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [sp]
	str r0, [sp, #0xc]
	ldr r3, [sp, #4]
	str r3, [sp, #8]
	mov sl, r8
	mov r8, r5
	adds r5, r4, #0
	adds r4, r1, #0
	cmp r6, #0
	bne _080297FA
	b _080297E4
_08029774:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	ldr r1, [sp, #8]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	mov r3, sl
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov r1, sb
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov r3, r8
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080297FA
	adds r6, #1
_080297E4:
	cmp r6, #1
	bgt _080297FA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029774
_080297FA:
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r7, #0
	bl CheckBattleUnitStatCaps
_08029808:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UnitPromote
UnitPromote: @ 0x08029818
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #5]
	bl GetClassData
	adds r3, r0, #0
	adds r0, #0x22
	ldrb r1, [r4, #0x12]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x13]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802983C
	strb r2, [r4, #0x12]
_0802983C:
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r4, #0x14]
	ldrb r0, [r0]
	adds r0, r5, r0
	strb r0, [r4, #0x14]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x14]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029854
	strb r2, [r4, #0x14]
_08029854:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r7, [r4, #0x15]
	ldrb r0, [r0]
	adds r0, r7, r0
	strb r0, [r4, #0x15]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x15]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802986C
	strb r2, [r4, #0x15]
_0802986C:
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r1, [r4, #0x16]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x16]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029884
	strb r2, [r4, #0x16]
_08029884:
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r5, [r4, #0x17]
	ldrb r0, [r0]
	adds r0, r5, r0
	strb r0, [r4, #0x17]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x17]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802989C
	strb r2, [r4, #0x17]
_0802989C:
	adds r0, r3, #0
	adds r0, #0x27
	ldrb r7, [r4, #0x18]
	ldrb r0, [r0]
	adds r0, r7, r0
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x18]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _080298B4
	strb r2, [r4, #0x18]
_080298B4:
	movs r2, #0
	adds r6, r4, #0
	adds r6, #0x28
	adds r5, r6, #0
_080298BC:
	adds r0, r5, r2
	ldr r1, [r4, #4]
	adds r1, #0x2c
	adds r1, r1, r2
	ldrb r7, [r0]
	ldrb r1, [r1]
	subs r1, r7, r1
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080298BC
	str r3, [r4, #4]
	movs r2, #0
	adds r3, r6, #0
_080298D8:
	adds r1, r3, r2
	ldr r0, [r4, #4]
	adds r0, #0x2c
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r5, [r1]
	adds r0, r0, r5
	cmp r0, #0xfb
	ble _080298EC
	movs r0, #0xfb
_080298EC:
	strb r0, [r1]
	adds r2, #1
	cmp r2, #7
	ble _080298D8
	movs r1, #0
	movs r0, #1
	strb r0, [r4, #8]
	strb r1, [r4, #9]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenerateBattleUnitStatGainsComparatively
GenerateBattleUnitStatGainsComparatively: @ 0x08029904
	push {r4, lr}
	adds r3, r0, #0
	ldrb r2, [r3, #0x12]
	ldrb r4, [r1, #0x12]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x73
	strb r0, [r2]
	ldrb r0, [r3, #0x14]
	ldrb r4, [r1, #0x14]
	subs r2, r0, r4
	adds r0, r3, #0
	adds r0, #0x74
	strb r2, [r0]
	ldrb r2, [r3, #0x15]
	ldrb r4, [r1, #0x15]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x75
	strb r0, [r2]
	ldrb r2, [r3, #0x16]
	ldrb r4, [r1, #0x16]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x76
	strb r0, [r2]
	ldrb r2, [r3, #0x17]
	ldrb r4, [r1, #0x17]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x77
	strb r0, [r2]
	ldrb r0, [r3, #0x18]
	ldrb r4, [r1, #0x18]
	subs r2, r0, r4
	adds r0, r3, #0
	adds r0, #0x78
	strb r2, [r0]
	ldrb r2, [r3, #0x19]
	ldrb r4, [r1, #0x19]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x79
	strb r0, [r2]
	ldrb r0, [r3, #0x1a]
	ldrb r1, [r1, #0x1a]
	subs r1, r0, r1
	adds r0, r3, #0
	adds r0, #0x7a
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CheckBattleUnitStatCaps
CheckBattleUnitStatCaps: @ 0x08029970
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	mov ip, r1
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	mov r0, ip
	adds r0, #0x73
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0xc0
	ldrb r3, [r2, #0xb]
	ands r0, r3
	cmp r0, #0x80
	bne _08029996
	cmp r1, #0x78
	bgt _0802999A
	b _080299B6
_08029996:
	cmp r1, #0x3c
	ble _080299B6
_0802999A:
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ldrb r6, [r2, #0xb]
	ands r0, r6
	cmp r0, #0x80
	bne _080299AC
	movs r0, #0x78
	b _080299AE
_080299AC:
	movs r0, #0x3c
_080299AE:
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x73
	strb r0, [r1]
_080299B6:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x74
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r5, [r2, #4]
	movs r1, #0x14
	ldrsb r1, [r5, r1]
	adds r3, r5, #0
	cmp r0, r1
	ble _080299D8
	ldrb r1, [r3, #0x14]
	ldrb r6, [r2, #0x14]
	subs r0, r1, r6
	strb r0, [r4]
_080299D8:
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x75
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _080299F6
	ldrb r1, [r3, #0x15]
	ldrb r6, [r2, #0x15]
	subs r0, r1, r6
	strb r0, [r4]
_080299F6:
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x76
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _08029A14
	ldrb r1, [r3, #0x16]
	ldrb r6, [r2, #0x16]
	subs r0, r1, r6
	strb r0, [r4]
_08029A14:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x77
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _08029A32
	ldrb r3, [r3, #0x17]
	ldrb r1, [r2, #0x17]
	subs r0, r3, r1
	strb r0, [r4]
_08029A32:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x78
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x18
	ldrsb r1, [r5, r1]
	cmp r0, r1
	ble _08029A50
	ldrb r5, [r5, #0x18]
	ldrb r6, [r2, #0x18]
	subs r0, r5, r6
	strb r0, [r3]
_08029A50:
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x79
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	cmp r0, #0x1e
	ble _08029A6A
	movs r0, #0x1e
	ldrb r2, [r2, #0x19]
	subs r0, r0, r2
	strb r0, [r3]
_08029A6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start BattleApplyUnitUpdates
BattleApplyUnitUpdates: @ 0x08029A70
	push {r4, r5, r6, r7, lr}
	ldr r5, _08029AE4 @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r4, _08029AE8 @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029AAC
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r1, r1, r0
	adds r0, #0x2a
	ldrh r0, [r0]
	strh r0, [r1]
_08029AAC:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029ACE
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r1, r1, r0
	adds r0, #0x2a
	ldrh r0, [r0]
	strh r0, [r1]
_08029ACE:
	adds r0, r7, #0
	adds r1, r5, #0
	bl UpdateUnitFromBattle
	cmp r6, #0
	beq _08029AEC
	adds r0, r6, #0
	adds r1, r4, #0
	bl UpdateUnitFromBattle
	b _08029AF2
	.align 2, 0
_08029AE4: .4byte 0x0203A3F0
_08029AE8: .4byte 0x0203A470
_08029AEC:
	adds r0, r4, #0
	bl UpdateObstacleFromBattle
_08029AF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08029AF8
sub_08029AF8: @ 0x08029AF8
	movs r0, #1
	bx lr

	thumb_func_start GetBattleUnitUpdatedWeaponExp
GetBattleUnitUpdatedWeaponExp: @ 0x08029AFC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xc0
	ldrb r1, [r7, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08029B58
	movs r0, #0x13
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08029B58
	ldr r1, _08029B60 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08029B58
	ldr r1, _08029B64 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08029B58
	ldr r1, _08029B68 @ =0x0203A3D8
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08029B6C
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029B58
	ldr r1, [r7, #0x4c]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _08029B58
	movs r0, #0x88
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _08029B6C
_08029B58:
	movs r0, #1
	rsbs r0, r0, #0
	b _08029BE0
	.align 2, 0
_08029B60: .4byte 0x0202BBF8
_08029B64: .4byte 0x0202BBB8
_08029B68: .4byte 0x0203A3D8
_08029B6C:
	adds r4, r7, #0
	adds r4, #0x50
	adds r5, r7, #0
	adds r5, #0x28
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r6, [r0]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemAwardedExp
	adds r1, r7, #0
	adds r1, #0x7b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	muls r0, r1, r0
	adds r6, r6, r0
	movs r1, #0
	ldrb r3, [r4]
_08029B96:
	ldr r2, [r7, #4]
	cmp r1, r3
	beq _08029BB8
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfb
	beq _08029BB8
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _08029BB8
	cmp r6, #0xfa
	ble _08029BBE
	movs r6, #0xfa
	b _08029BBE
_08029BB8:
	adds r1, #1
	cmp r1, #7
	ble _08029B96
_08029BBE:
	ldr r0, [r7]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029BD8
	cmp r6, #0xfb
	ble _08029BDE
	movs r6, #0xfb
	b _08029BDE
_08029BD8:
	cmp r6, #0xb5
	ble _08029BDE
	movs r6, #0xb5
_08029BDE:
	adds r0, r6, #0
_08029BE0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HasBattleUnitGainedWeaponLevel
HasBattleUnitGainedWeaponLevel: @ 0x08029BE8
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r2, #0x50
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r2, [r2]
	adds r1, r2, r1
	ldrb r4, [r1]
	bl GetBattleUnitUpdatedWeaponExp
	adds r5, r0, #0
	cmp r5, #0
	blt _08029C1C
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetWeaponLevelFromExp
	adds r1, r0, #0
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _08029C1E
_08029C1C:
	movs r0, #0
_08029C1E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start UpdateUnitFromBattle
UpdateUnitFromBattle: @ 0x08029C24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r5, #8]
	strb r0, [r4, #8]
	ldrb r0, [r5, #9]
	strb r0, [r4, #9]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #0x13]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r2, _08029D08 @ =0x03002850
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x6f
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _08029C58
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitStatus
_08029C58:
	adds r0, r5, #0
	adds r0, #0x73
	ldrb r1, [r4, #0x12]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	adds r0, r5, #0
	adds r0, #0x74
	ldrb r1, [r4, #0x14]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	adds r0, #0x75
	ldrb r1, [r4, #0x15]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	adds r0, r5, #0
	adds r0, #0x76
	ldrb r1, [r4, #0x16]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0x77
	ldrb r1, [r4, #0x17]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	adds r0, r5, #0
	adds r0, #0x78
	ldrb r1, [r4, #0x18]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x79
	ldrb r1, [r4, #0x19]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r5, #0
	bl GetBattleUnitUpdatedWeaponExp
	adds r2, r0, #0
	cmp r2, #0
	ble _08029CCC
	adds r1, r5, #0
	adds r1, #0x50
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r2, [r0]
_08029CCC:
	adds r6, r5, #0
	adds r6, #0x6e
	adds r1, r5, #0
	adds r1, #0x1e
	adds r3, r4, #0
	adds r3, #0x1e
	movs r2, #4
_08029CDA:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _08029CDA
	adds r0, r4, #0
	bl UnitRemoveInvalidItems
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08029D02
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	bl PidStatsAddExpGained
_08029D02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029D08: .4byte 0x03002850

	thumb_func_start UpdateUnitDuringBattle
UpdateUnitDuringBattle: @ 0x08029D0C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #0x13]
	adds r0, r4, #0
	bl GetBattleUnitUpdatedWeaponExp
	adds r2, r0, #0
	cmp r2, #0
	ble _08029D30
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r2, [r0]
_08029D30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BattleApplyBallistaUpdates
BattleApplyBallistaUpdates: @ 0x08029D38
	push {r4, r5, lr}
	ldr r1, _08029D64 @ =0x0203A3D8
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08029D5C
	ldr r4, _08029D68 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemUses
	adds r5, r0, #0
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	strb r5, [r0, #6]
_08029D5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029D64: .4byte 0x0203A3D8
_08029D68: .4byte 0x0203A3F0

	thumb_func_start sub_08029D6C
sub_08029D6C: @ 0x08029D6C
	ldr r1, _08029D78 @ =0x0203A510
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_08029D78: .4byte 0x0203A510

	thumb_func_start GetUnitExpLevel
GetUnitExpLevel: @ 0x08029D7C
	movs r3, #8
	ldrsb r3, [r0, r3]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029D96
	adds r3, #0x14
_08029D96:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start GetUnitRoundExp
GetUnitRoundExp: @ 0x08029D9C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl GetUnitExpLevel
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitExpLevel
	subs r5, r5, r0
	movs r0, #0x1f
	subs r5, r0, r5
	cmp r5, #0
	bge _08029DBA
	movs r5, #0
_08029DBA:
	ldr r0, [r6, #4]
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	adds r0, r5, #0
	bl __divsi3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetUnitPowerLevel
GetUnitPowerLevel: @ 0x08029DCC
	push {r4, lr}
	movs r2, #8
	ldrsb r2, [r0, r2]
	ldr r3, [r0, #4]
	movs r1, #0x1a
	ldrsb r1, [r3, r1]
	adds r4, r2, #0
	muls r4, r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029E00
	ldrb r0, [r3, #5]
	bl GetClassData
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
_08029E00:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetUnitClassKillExpBonus
GetUnitClassKillExpBonus: @ 0x08029E08
	movs r3, #0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08029E1E
	movs r3, #0x14
_08029E1E:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _08029E2A
	adds r3, #0x28
_08029E2A:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start GetUnitExpMultiplier
GetUnitExpMultiplier: @ 0x08029E30
	push {r4, lr}
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	bne _08029E4C
	b _08029E66
_08029E48:
	movs r0, #2
	b _08029E68
_08029E4C:
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #4
	ldr r1, _08029E70 @ =0x0203A4F0
_08029E54:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _08029E48
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	ble _08029E54
_08029E66:
	movs r0, #1
_08029E68:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029E70: .4byte 0x0203A4F0

	thumb_func_start GetUnitKillExpBonus
GetUnitKillExpBonus: @ 0x08029E74
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08029E86
	movs r0, #0
	b _08029F0A
_08029E86:
	movs r6, #0x14
	ldr r1, _08029EB0 @ =0x0202BBF8
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	beq _08029E9A
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08029EB4
_08029E9A:
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r6, r0, #0
	adds r6, #0x14
	adds r0, r7, #0
	bl GetUnitPowerLevel
	subs r6, r6, r0
	b _08029EEE
	.align 2, 0
_08029EB0: .4byte 0x0202BBF8
_08029EB4:
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnitPowerLevel
	cmp r4, r0
	bgt _08029EDC
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnitPowerLevel
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	b _08029EEA
_08029EDC:
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnitPowerLevel
_08029EEA:
	subs r4, r4, r0
	adds r6, r6, r4
_08029EEE:
	adds r0, r7, #0
	adds r1, r5, #0
	bl GetUnitClassKillExpBonus
	adds r6, r6, r0
	adds r0, r7, #0
	adds r1, r5, #0
	bl GetUnitExpMultiplier
	muls r6, r0, r6
	cmp r6, #0
	bge _08029F08
	movs r6, #0
_08029F08:
	adds r0, r6, #0
_08029F0A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetBattleUnitExpGain
GetBattleUnitExpGain: @ 0x08029F10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029F3C
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08029F3C
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08029F40
_08029F3C:
	movs r0, #0
	b _08029F74
_08029F40:
	adds r0, r5, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08029F52
	movs r0, #1
	b _08029F74
_08029F52:
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitRoundExp
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitKillExpBonus
	adds r4, r4, r0
	cmp r4, #0x64
	ble _08029F6C
	movs r4, #0x64
_08029F6C:
	cmp r4, #0
	bge _08029F72
	movs r4, #0
_08029F72:
	adds r0, r4, #0
_08029F74:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BattleApplyItemExpGains
BattleApplyItemExpGains: @ 0x08029F7C
	push {r4, lr}
	ldr r1, _08029FC4 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08029FF2
	ldr r4, _08029FC8 @ =0x0203A3F0
	ldr r0, [r4, #0x4c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08029FCC
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08029FAA
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08029FAA:
	adds r0, r4, #0
	bl GetBattleUnitStaffExp
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
	b _08029FF2
	.align 2, 0
_08029FC4: .4byte 0x0202BBF8
_08029FC8: .4byte 0x0203A3F0
_08029FCC:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08029FF2
	ldrb r1, [r4, #9]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08029FF2
	adds r2, r4, #0
	adds r2, #0x6e
	movs r0, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x14
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
_08029FF2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GetBattleUnitStaffExp
GetBattleUnitStaffExp: @ 0x08029FF8
	push {r4, lr}
	adds r4, r0, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A00A
	movs r0, #0
	b _0802A056
_0802A00A:
	ldr r1, _0802A01C @ =0x0203A4F0
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802A020
	movs r0, #1
	b _0802A056
	.align 2, 0
_0802A01C: .4byte 0x0203A4F0
_0802A020:
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemCostPerUse
	movs r1, #0x14
	bl __divsi3
	adds r2, r0, #0
	adds r2, #0xa
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A04E
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
_0802A04E:
	cmp r2, #0x64
	ble _0802A054
	movs r2, #0x64
_0802A054:
	adds r0, r2, #0
_0802A056:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start BattleApplyMiscActionExpGains
BattleApplyMiscActionExpGains: @ 0x0802A05C
	push {r4, lr}
	ldr r4, _0802A09C @ =0x0203A3F0
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802A096
	adds r0, r4, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A096
	ldr r1, _0802A0A0 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0802A096
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0xa
	strb r0, [r1]
	ldrb r0, [r4, #9]
	adds r0, #0xa
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckBattleUnitLevelUp
_0802A096:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A09C: .4byte 0x0203A3F0
_0802A0A0: .4byte 0x0202BBF8

	thumb_func_start BattleUnitTargetSetEquippedWeapon
BattleUnitTargetSetEquippedWeapon: @ 0x0802A0A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	cmp r0, #0
	bne _0802A0F2
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802A0F2
	adds r0, r5, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A0F2
	movs r6, #0
	subs r4, #0x2c
_0802A0D0:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802A0EA
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x4a
	strh r1, [r0]
	b _0802A0F2
_0802A0EA:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _0802A0D0
_0802A0F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start BattleUnitTargetCheckCanCounter
BattleUnitTargetCheckCanCounter: @ 0x0802A0F8
	adds r2, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802A11E
	adds r0, r2, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_0802A11E:
	bx lr

	thumb_func_start BattleApplyReaverEffect
BattleApplyReaverEffect: @ 0x0802A120
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A138
	ldr r0, [r3, #0x4c]
	ands r0, r1
	cmp r0, #0
	bne _0802A16C
_0802A138:
	adds r1, r2, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_0802A16C:
	bx lr
	.align 2, 0

	thumb_func_start BattleApplyWeaponTriangleEffect
BattleApplyWeaponTriangleEffect: @ 0x0802A170
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0802A17C @ =0x08B9426C
	b _0802A1C0
	.align 2, 0
_0802A17C: .4byte 0x08B9426C
_0802A180:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0802A1BE
	adds r0, r5, #0
	adds r0, #0x50
	ldrb r0, [r0]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _0802A1BE
	ldrb r0, [r2, #2]
	adds r1, r4, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r1, [r2, #3]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldrb r1, [r2, #2]
	rsbs r0, r1, #0
	adds r1, r5, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r2, [r2, #3]
	rsbs r1, r2, #0
	adds r0, r5, #0
	adds r0, #0x54
	strb r1, [r0]
	b _0802A1C8
_0802A1BE:
	adds r2, #4
_0802A1C0:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0802A180
_0802A1C8:
	ldr r0, [r4, #0x4c]
	movs r6, #0x80
	lsls r6, r6, #1
	ands r0, r6
	cmp r0, #0
	beq _0802A1DC
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleApplyReaverEffect
_0802A1DC:
	ldr r0, [r5, #0x4c]
	ands r0, r6
	cmp r0, #0
	beq _0802A1EC
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleApplyReaverEffect
_0802A1EC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BattleInitTargetCanCounter
BattleInitTargetCanCounter: @ 0x0802A1F4
	push {r4, lr}
	ldr r4, _0802A24C @ =0x0203A3F0
	ldr r3, _0802A250 @ =0x0203A470
	ldr r0, [r4, #0x4c]
	ldr r1, [r3, #0x4c]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802A216
	adds r0, r3, #0
	adds r0, #0x48
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #0xa
	strb r2, [r0]
_0802A216:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	bne _0802A246
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802A246
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	ands r2, r1
	cmp r2, #0
	bne _0802A246
	adds r0, r3, #0
	adds r0, #0x48
	movs r1, #0
	strh r2, [r0]
	adds r0, #0xa
	strb r1, [r0]
_0802A246:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A24C: .4byte 0x0203A3F0
_0802A250: .4byte 0x0203A470

	thumb_func_start InitObstacleBattleUnit
InitObstacleBattleUnit: @ 0x0802A254
	push {r4, lr}
	ldr r4, _0802A2AC @ =0x0203A470
	adds r0, r4, #0
	bl ClearUnit
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	bl GetClassData
	str r0, [r4, #4]
	ldr r0, _0802A2B0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4, #0x12]
	ldr r1, _0802A2B4 @ =0x0203A85C
	ldrb r0, [r1, #0x15]
	strb r0, [r4, #0x13]
	ldrb r0, [r1, #0x13]
	strb r0, [r4, #0x10]
	ldrb r0, [r1, #0x14]
	strb r0, [r4, #0x11]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802A2B8 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802A2BC
	cmp r0, #0x33
	beq _0802A2C6
	b _0802A2D2
	.align 2, 0
_0802A2AC: .4byte 0x0203A470
_0802A2B0: .4byte 0x0202BBF8
_0802A2B4: .4byte 0x0203A85C
_0802A2B8: .4byte 0x0202E3E0
_0802A2BC:
	movs r0, #0xfc
	bl GetCharacterData
	str r0, [r4]
	b _0802A2D2
_0802A2C6:
	movs r0, #0xfd
	bl GetCharacterData
	str r0, [r4]
	movs r0, #0x14
	strb r0, [r4, #0x12]
_0802A2D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ComputeBattleObstacleStats
ComputeBattleObstacleStats: @ 0x0802A2D8
	push {r4, lr}
	ldr r1, _0802A30C @ =0x0203A3F0
	adds r2, r1, #0
	adds r2, #0x64
	movs r4, #0
	movs r3, #0
	movs r0, #0x64
	strh r0, [r2]
	adds r1, #0x6a
	strh r3, [r1]
	ldr r1, _0802A310 @ =0x0203A470
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #0xff
	strh r0, [r2]
	ldrb r0, [r1, #0x13]
	adds r2, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A30C: .4byte 0x0203A3F0
_0802A310: .4byte 0x0203A470

	thumb_func_start UpdateObstacleFromBattle
UpdateObstacleFromBattle: @ 0x0802A314
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	adds r5, r0, #0
	cmp r5, #0
	bne _0802A33A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	subs r1, #1
	bl GetTrapAt
	adds r5, r0, #0
_0802A33A:
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A39C
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	bl GetMapChangeIdAt
	adds r6, r0, #0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802A3A4 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _0802A37A
	ldr r0, _0802A3A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802A37A
	ldr r0, _0802A3AC @ =0x000002D7
	bl m4aSongNumStart
_0802A37A:
	bl RenderMapForFade
	adds r0, r6, #0
	bl ApplyMapChange
	movs r0, #0
	strb r0, [r5, #2]
	adds r0, r6, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl RenderMap
	movs r0, #0
	bl StartMapFade
_0802A39C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3A4: .4byte 0x0202E3E0
_0802A3A8: .4byte 0x0202BBF8
_0802A3AC: .4byte 0x000002D7

	thumb_func_start BeginBattleAnimations
BeginBattleAnimations: @ 0x0802A3B0
	push {lr}
	ldr r0, _0802A3E4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r1, _0802A3E8 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	bl RenderMap
	bl SetupBanim
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A3EC
	movs r0, #0
	bl SetBanimLinkArenaFlag
	bl BeginAnimsOnBattleAnimations
	b _0802A402
	.align 2, 0
_0802A3E4: .4byte 0x02023C60
_0802A3E8: .4byte 0x02022860
_0802A3EC:
	bl EndAllMus
	bl RenderMap
	bl StartBattleManim
	ldr r1, _0802A408 @ =0x0203A3D8
	movs r0, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
_0802A402:
	pop {r0}
	bx r0
	.align 2, 0
_0802A408: .4byte 0x0203A3D8

	thumb_func_start GetUnitSoloBattleAnimType
GetUnitSoloBattleAnimType: @ 0x0802A40C
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0802A41C
	movs r0, #0
	b _0802A42C
_0802A41C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802A42A
	movs r0, #1
	b _0802A42C
_0802A42A:
	movs r0, #3
_0802A42C:
	bx lr
	.align 2, 0

	thumb_func_start GetBattleAnimType
GetBattleAnimType: @ 0x0802A430
	push {lr}
	ldr r0, _0802A464 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _0802A48A
	ldr r2, _0802A468 @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	bne _0802A470
	ldr r0, _0802A46C @ =0x0203A470
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _0802A484
	adds r0, r3, #0
	b _0802A486
	.align 2, 0
_0802A464: .4byte 0x0202BBF8
_0802A468: .4byte 0x0203A3F0
_0802A46C: .4byte 0x0203A470
_0802A470:
	ldr r2, _0802A480 @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	ands r0, r1
	cmp r0, #0
	beq _0802A484
	movs r0, #1
	b _0802A48A
	.align 2, 0
_0802A480: .4byte 0x0203A470
_0802A484:
	adds r0, r2, #0
_0802A486:
	bl GetUnitSoloBattleAnimType
_0802A48A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BattlePrintDebugUnitInfo
BattlePrintDebugUnitInfo: @ 0x0802A490
	bx lr
	.align 2, 0

	thumb_func_start BattlePrintDebugHitInfo
BattlePrintDebugHitInfo: @ 0x0802A494
	ldr r1, _0802A4B0 @ =0x0203A4F0
	movs r0, #0x80
	ldrb r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0802A4AE
	movs r2, #0x80
_0802A4A2:
	adds r1, #4
	adds r0, r2, #0
	ldrb r3, [r1, #2]
	ands r0, r3
	cmp r0, #0
	beq _0802A4A2
_0802A4AE:
	bx lr
	.align 2, 0
_0802A4B0: .4byte 0x0203A4F0

	thumb_func_start BattleInitItemEffect
BattleInitItemEffect: @ 0x0802A4B4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r7, r1, #0
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r7, #0
	bge _0802A4C8
	movs r6, #0
_0802A4C8:
	ldr r1, _0802A554 @ =0x0203A3D8
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	ldr r5, _0802A558 @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r2, #0
	bl InitBattleUnit
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl ComputeBattleUnitBaseDefense
	adds r0, r5, #0
	movs r1, #0
	bl ComputeBattleUnitSupportBonuses
	adds r0, r5, #0
	adds r0, #0x5a
	movs r2, #0xff
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	subs r0, #0x22
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #7
	strb r7, [r0]
	adds r0, r6, #0
	bl GetItemType
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strb r4, [r0]
	adds r2, r5, #0
	adds r2, #0x6f
	movs r1, #0xff
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0802A55C @ =0x0203A470
	adds r0, #0x6f
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	bl ClearBattleHits
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A554: .4byte 0x0203A3D8
_0802A558: .4byte 0x0203A3F0
_0802A55C: .4byte 0x0203A470

	thumb_func_start BattleInitItemEffectTarget
BattleInitItemEffectTarget: @ 0x0802A560
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _0802A5AC @ =0x0203A470
	adds r0, r4, #0
	bl InitBattleUnit
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl ComputeBattleUnitBaseDefense
	adds r0, r4, #0
	movs r1, #0
	bl ComputeBattleUnitSupportBonuses
	adds r0, r4, #0
	adds r0, #0x5a
	movs r2, #0
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	subs r0, #0x20
	strh r2, [r0]
	adds r0, r4, #0
	bl BattleUnitTargetSetEquippedWeapon
	ldr r0, _0802A5B0 @ =0x0203A3F0
	adds r0, #0x7e
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5AC: .4byte 0x0203A470
_0802A5B0: .4byte 0x0203A3F0

	thumb_func_start UpdateActorFromBattle
UpdateActorFromBattle: @ 0x0802A5B4
	push {r4, lr}
	ldr r4, _0802A5CC @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r4, #0
	bl UpdateUnitFromBattle
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5CC: .4byte 0x0203A3F0

	thumb_func_start BattleApplyMiscAction
BattleApplyMiscAction: @ 0x0802A5D0
	push {r4, lr}
	adds r4, r0, #0
	bl BattleApplyMiscActionExpGains
	ldr r0, _0802A5E8 @ =0x08B942A0
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5E8: .4byte 0x08B942A0

	thumb_func_start BattleApplyItemEffect
BattleApplyItemEffect: @ 0x0802A5EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0802A660 @ =0x0203A50C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r1, #0x80
	strb r1, [r0, #2]
	bl BattleApplyItemExpGains
	ldr r4, _0802A664 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802A650
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0802A62A
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_0802A62A:
	ldrh r0, [r5]
	bl GetItemAfterUse
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x1e
	adds r1, r1, r2
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #0
	beq _0802A650
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #0
	strb r0, [r1]
_0802A650:
	ldr r0, _0802A668 @ =0x08B942A0
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A660: .4byte 0x0203A50C
_0802A664: .4byte 0x0203A3F0
_0802A668: .4byte 0x08B942A0

	thumb_func_start GetOffensiveStaffAccuracy
GetOffensiveStaffAccuracy: @ 0x0802A66C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitPower
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitResistance
	subs r4, r4, r0
	lsls r0, r4, #2
	adds r7, r0, r4
	adds r0, r5, #0
	bl GetUnitSkill
	adds r4, r0, #0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802A69C
	subs r1, r0, r2
_0802A69C:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _0802A6AE
	adds r1, r1, r2
	b _0802A6B2
_0802A6AE:
	subs r0, r0, r3
	adds r1, r1, r0
_0802A6B2:
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r7, r0
	lsls r1, r1, #1
	subs r1, r0, r1
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	beq _0802A6C8
	cmp r0, #0x45
	bne _0802A6CC
_0802A6C8:
	movs r0, #0
	b _0802A6DA
_0802A6CC:
	cmp r1, #0
	bge _0802A6D2
	movs r1, #0
_0802A6D2:
	cmp r1, #0x64
	ble _0802A6D8
	movs r1, #0x64
_0802A6D8:
	adds r0, r1, #0
_0802A6DA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start BattleGenerateArena
BattleGenerateArena: @ 0x0802A6E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0802A7B0 @ =0x0203A7F4
	mov sb, r0
	ldr r1, [r0, #4]
	mov r8, r1
	ldr r0, _0802A7B4 @ =0x0202BBB8
	adds r0, #0x3c
	ldrb r0, [r0]
	str r0, [sp]
	ldr r7, _0802A7B8 @ =0x0203A3D8
	movs r0, #0x21
	strh r0, [r7]
	ldr r5, _0802A7BC @ =0x0203A3F0
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	ldr r4, _0802A7C0 @ =0x0203A470
	adds r0, r4, #0
	mov r1, r8
	bl InitBattleUnit
	ldr r0, _0802A7C4 @ =0x0203A85C
	mov sl, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0802A72A
	strb r0, [r4, #0x13]
	adds r1, r4, #0
	adds r1, #0x72
	strb r0, [r1]
_0802A72A:
	mov r1, sb
	ldrb r0, [r1, #0xc]
	strb r0, [r7, #2]
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #0x11]
	adds r0, r5, #0
	movs r1, #6
	bl SetBattleUnitWeapon
	adds r0, r4, #0
	movs r1, #7
	bl SetBattleUnitWeapon
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	movs r0, #4
	mov r1, sl
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	movs r1, #8
	bl SetBattleUnitTerrainBonuses
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerate
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802A780
	bl BattleApplyExpGains
_0802A780:
	adds r0, r6, #0
	adds r1, r5, #0
	bl UpdateUnitDuringBattle
	ldr r0, [sp]
	cmp r0, #0
	beq _0802A796
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802A7DE
_0802A796:
	bl PidStatsRecordBattleRes
	ldr r0, [r6, #0xc]
	ldr r2, _0802A7C8 @ =0xFFF1FFFF
	ands r2, r0
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	adds r0, #1
	cmp r0, #7
	bhi _0802A7CC
	lsls r0, r0, #0x11
	b _0802A7D0
	.align 2, 0
_0802A7B0: .4byte 0x0203A7F4
_0802A7B4: .4byte 0x0202BBB8
_0802A7B8: .4byte 0x0203A3D8
_0802A7BC: .4byte 0x0203A3F0
_0802A7C0: .4byte 0x0203A470
_0802A7C4: .4byte 0x0203A85C
_0802A7C8: .4byte 0xFFF1FFFF
_0802A7CC:
	movs r0, #0xe0
	lsls r0, r0, #0xc
_0802A7D0:
	adds r1, r2, r0
	str r1, [r6, #0xc]
	ldr r0, _0802A7F8 @ =0x03002850
	lsrs r1, r1, #0x11
	movs r2, #7
	ands r1, r2
	strb r1, [r0]
_0802A7DE:
	ldr r0, _0802A7FC @ =0x0203A3F0
	ldr r1, _0802A800 @ =0x0203A470
	bl BattlePrintDebugUnitInfo
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A7F8: .4byte 0x03002850
_0802A7FC: .4byte 0x0203A3F0
_0802A800: .4byte 0x0203A470

	thumb_func_start BattleIsTriangleAttack
BattleIsTriangleAttack: @ 0x0802A804
	ldr r0, _0802A810 @ =0x0203A4F0
	ldrh r0, [r0]
	lsrs r0, r0, #0xa
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0802A810: .4byte 0x0203A4F0

	thumb_func_start DidBattleUnitBreakWeapon
DidBattleUnitBreakWeapon: @ 0x0802A814
	adds r1, r0, #0
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802A82A
	adds r0, r1, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802A82C
_0802A82A:
	movs r0, #0
_0802A82C:
	bx lr
	.align 2, 0

	thumb_func_start SetScriptedBattle
SetScriptedBattle: @ 0x0802A830
	ldr r1, _0802A838 @ =0x0203A85C
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0802A838: .4byte 0x0203A85C

	thumb_func_start BattleGenerateHitScriptedDamage
BattleGenerateHitScriptedDamage: @ 0x0802A83C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0802A8A0 @ =0x0203A3D8
	movs r0, #0
	strh r0, [r2, #4]
	ldr r0, _0802A8A4 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #2
	ldrh r3, [r1]
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0802A89A
	ldrh r5, [r2, #6]
	ldrh r6, [r2, #8]
	subs r0, r5, r6
	strh r0, [r2, #4]
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802A874
	movs r0, #4
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	strh r0, [r2, #4]
_0802A874:
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r0, #0x7f
	ble _0802A880
	movs r0, #0x7f
	strh r0, [r2, #4]
_0802A880:
	movs r5, #4
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _0802A88A
	strh r3, [r2, #4]
_0802A88A:
	movs r6, #4
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _0802A89A
	adds r1, r4, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_0802A89A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A8A0: .4byte 0x0203A3D8
_0802A8A4: .4byte 0x0203A50C

	thumb_func_start BattleUnwindScripted
BattleUnwindScripted: @ 0x0802A8A8
	push {r4, r5, r6, lr}
	ldr r0, _0802A8F4 @ =0x0203A85C
	ldr r2, [r0, #0x18]
	ldr r3, _0802A8F8 @ =0x0203A4F0
	movs r0, #0x80
	ldrb r1, [r2, #2]
	ands r0, r1
	adds r5, r3, #0
	ldr r1, _0802A8FC @ =0x0203A50C
	cmp r0, #0
	bne _0802A8CE
	movs r4, #0x80
_0802A8C0:
	ldm r2!, {r0}
	stm r3!, {r0}
	adds r0, r4, #0
	ldrb r6, [r2, #2]
	ands r0, r6
	cmp r0, #0
	beq _0802A8C0
_0802A8CE:
	ldr r0, [r2]
	str r0, [r3]
	str r5, [r1]
	movs r0, #0x80
	ldrb r5, [r5, #2]
	ands r0, r5
	cmp r0, #0
	bne _0802A984
	adds r6, r1, #0
_0802A8E0:
	ldr r1, [r6]
	movs r0, #8
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802A908
	ldr r5, _0802A900 @ =0x0203A470
	ldr r4, _0802A904 @ =0x0203A3F0
	b _0802A90C
	.align 2, 0
_0802A8F4: .4byte 0x0203A85C
_0802A8F8: .4byte 0x0203A4F0
_0802A8FC: .4byte 0x0203A50C
_0802A900: .4byte 0x0203A470
_0802A904: .4byte 0x0203A3F0
_0802A908:
	ldr r5, _0802A968 @ =0x0203A3F0
	ldr r4, _0802A96C @ =0x0203A470
_0802A90C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleUpdateBattleStats
	adds r0, r5, #0
	bl BattleGenerateHitScriptedDamage
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleGenerateHitEffects
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802A932
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802A974
_0802A932:
	adds r0, r5, #0
	adds r0, #0x7b
	ldrb r1, [r0]
	adds r1, #1
	movs r3, #0
	strb r1, [r0]
	ldr r2, _0802A970 @ =0x0203A50C
	ldr r1, [r2]
	movs r0, #2
	ldrb r4, [r1, #2]
	orrs r0, r4
	strb r0, [r1, #2]
	ldr r0, _0802A96C @ =0x0203A470
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802A960
	ldr r1, [r2]
	movs r0, #4
	ldrb r6, [r1, #2]
	orrs r0, r6
	strb r0, [r1, #2]
_0802A960:
	ldr r1, [r2]
	movs r0, #0x80
	strb r0, [r1, #6]
	b _0802A984
	.align 2, 0
_0802A968: .4byte 0x0203A3F0
_0802A96C: .4byte 0x0203A470
_0802A970: .4byte 0x0203A50C
_0802A974:
	ldr r1, [r6]
	adds r1, #4
	str r1, [r6]
	movs r0, #0x80
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802A8E0
_0802A984:
	ldr r1, _0802A990 @ =0x0203A85C
	movs r0, #0
	str r0, [r1, #0x18]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A990: .4byte 0x0203A85C

	thumb_func_start UnitLevelUp
UnitLevelUp: @ 0x0802A994
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0x14
	bne _0802A9AA
	b _0802AB7E
_0802A9AA:
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r1, #1
	strb r0, [r4, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [r4]
	cmp r0, #0x14
	beq _0802A9C2
	ldrb r0, [r2, #4]
	cmp r0, #0x28
	bne _0802A9C6
_0802A9C2:
	movs r0, #0xff
	strb r0, [r4, #9]
_0802A9C6:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	beq _0802A9D6
	movs r6, #5
_0802A9D6:
	ldrb r2, [r2, #0x1c]
	adds r0, r2, r6
	bl GetStatIncrease
	mov r8, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	adds r0, r0, r6
	bl GetStatIncrease
	str r0, [sp]
	adds r5, r0, #0
	add r5, r8
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	adds r0, r0, r6
	bl GetStatIncrease
	str r0, [sp, #4]
	adds r5, r5, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	adds r0, r0, r6
	bl GetStatIncrease
	mov sl, r0
	add r5, sl
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	mov sb, r0
	add r5, sb
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	adds r7, r0, #0
	adds r5, r5, r7
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	adds r6, r0, #0
	adds r5, r5, r6
	cmp r5, #0
	bne _0802AAB0
	b _0802AA82
_0802AA42:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov sl, r0
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov sb, r0
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r7, r0, #0
	cmp r7, #0
	bne _0802AAB0
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r6, r0, #0
	cmp r6, #0
	bne _0802AAB0
	adds r5, #1
_0802AA82:
	cmp r5, #1
	bgt _0802AAB0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	mov r8, r0
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	str r0, [sp]
	cmp r0, #0
	bne _0802AAB0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	str r0, [sp, #4]
	cmp r0, #0
	beq _0802AA42
_0802AAB0:
	movs r2, #0x12
	ldrsb r2, [r4, r2]
	mov r1, r8
	adds r3, r2, r1
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802AACA
	cmp r3, #0x78
	bgt _0802AACE
	b _0802AAE0
_0802AACA:
	cmp r3, #0x3c
	ble _0802AAE0
_0802AACE:
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802AADA
	movs r0, #0x78
	b _0802AADC
_0802AADA:
	movs r0, #0x3c
_0802AADC:
	subs r0, r0, r2
	mov r8, r0
_0802AAE0:
	movs r2, #0x14
	ldrsb r2, [r4, r2]
	ldr r1, [sp]
	adds r0, r2, r1
	ldr r3, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AAF6
	subs r1, r1, r2
	str r1, [sp]
_0802AAF6:
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB0A
	subs r1, r1, r2
	str r1, [sp, #4]
_0802AB0A:
	movs r2, #0x16
	ldrsb r2, [r4, r2]
	mov r1, sl
	adds r0, r2, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB1E
	subs r1, r1, r2
	mov sl, r1
_0802AB1E:
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	mov r1, sb
	adds r0, r2, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB32
	subs r1, r1, r2
	mov sb, r1
_0802AB32:
	movs r2, #0x18
	ldrsb r2, [r4, r2]
	adds r0, r2, r7
	movs r1, #0x18
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AB42
	subs r7, r1, r2
_0802AB42:
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r0, r1, r6
	cmp r0, #0x1e
	ble _0802AB50
	movs r0, #0x1e
	subs r6, r0, r1
_0802AB50:
	ldrb r0, [r4, #0x12]
	add r0, r8
	strb r0, [r4, #0x12]
	ldrb r2, [r4, #0x14]
	ldr r1, [sp]
	adds r0, r2, r1
	strb r0, [r4, #0x14]
	ldrb r2, [r4, #0x15]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	strb r0, [r4, #0x15]
	ldrb r0, [r4, #0x16]
	add r0, sl
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x17]
	add r0, sb
	strb r0, [r4, #0x17]
	ldrb r2, [r4, #0x18]
	adds r0, r2, r7
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x19]
	adds r0, r1, r6
	strb r0, [r4, #0x19]
_0802AB7E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BattleHitAdvance
BattleHitAdvance: @ 0x0802AB90
	ldr r1, _0802AB9C @ =0x0203A50C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	bx lr
	.align 2, 0
_0802AB9C: .4byte 0x0203A50C

	thumb_func_start BattleHitTerminate
BattleHitTerminate: @ 0x0802ABA0
	ldr r0, _0802ABB0 @ =0x0203A50C
	ldr r1, [r0]
	adds r1, #4
	str r1, [r0]
	movs r0, #0x80
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0802ABB0: .4byte 0x0203A50C

	thumb_func_start sub_0802ABB4
sub_0802ABB4: @ 0x0802ABB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0x90
	lsls r1, r1, #7
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl EnableSysBrownBox
	ldr r3, _0802AC9C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	movs r6, #6
	strb r6, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0802ACA0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0802ACA4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	mov r1, r8
	ldr r0, [r1, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	movs r4, #0x30
	subs r0, r4, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r3, r0, #1
	ldr r5, _0802ACA8 @ =0x02022C60
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl PutDrawText
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r3, r4, #1
	adds r5, #0x30
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AC9C: .4byte 0x03002870
_0802ACA0: .4byte 0x0000FFE0
_0802ACA4: .4byte 0x0000E0FF
_0802ACA8: .4byte 0x02022C60

	thumb_func_start TradeMenu_HighlightUpdater_OnInit
TradeMenu_HighlightUpdater_OnInit: @ 0x0802ACAC
	adds r0, #0x41
	movs r1, #0xff
	strb r1, [r0]
	bx lr

	thumb_func_start sub_0802ACB4
sub_0802ACB4: @ 0x0802ACB4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x14]
	ldr r0, [r3, #0x40]
	ldr r2, _0802AD28 @ =0x00FFFF00
	ands r0, r2
	ldr r1, [r4, #0x40]
	ands r1, r2
	cmp r0, r1
	beq _0802AD20
	adds r5, r3, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r7, r3, #0
	adds r7, #0x42
	cmp r0, #0xff
	beq _0802ACF4
	ldr r0, _0802AD2C @ =0x08B942B8
	ldrb r2, [r5]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r2, [r7]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl ClearUiItemHover
_0802ACF4:
	ldr r0, _0802AD2C @ =0x08B942B8
	adds r6, r4, #0
	adds r6, #0x42
	adds r4, #0x41
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r2, [r6]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl DrawUiItemHover
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r6]
	strb r0, [r7]
_0802AD20:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AD28: .4byte 0x00FFFF00
_0802AD2C: .4byte 0x08B942B8

	thumb_func_start TradeMenu_GetAdjustedRow
TradeMenu_GetAdjustedRow: @ 0x0802AD30
	push {r4, lr}
	adds r3, r2, #0
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r4, r2, #1
	adds r1, r3, r4
	adds r2, r0, #0
	adds r2, #0x34
	adds r1, r2, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802AD62
	cmp r3, #0
	blt _0802AD62
	adds r0, r4, r2
	adds r1, r3, r0
_0802AD52:
	subs r1, #1
	subs r3, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802AD62
	cmp r3, #0
	bge _0802AD52
_0802AD62:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start TradeMenu_InitItemText
TradeMenu_InitItemText: @ 0x0802AD6C
	push {r4, r5, r6, r7, lr}
	movs r1, #0
	ldr r7, _0802AD9C @ =0x0200278C
_0802AD72:
	movs r5, #0
	lsls r0, r1, #2
	adds r6, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r7, r0
_0802AD7E:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	adds r5, #1
	cmp r5, #4
	ble _0802AD7E
	adds r1, r6, #0
	cmp r1, #1
	ble _0802AD72
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AD9C: .4byte 0x0200278C

	thumb_func_start TradeMenu_RefreshItemText
TradeMenu_RefreshItemText: @ 0x0802ADA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _0802AE6C @ =0x081C3CEC
	mov r0, sp
	movs r2, #2
	bl memcpy
	add r4, sp, #4
	ldr r1, _0802AE70 @ =0x081C3CEE
	adds r0, r4, #0
	movs r2, #2
	bl memcpy
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, _0802AE74 @ =0x02022EA0
	ldr r2, _0802AE78 @ =0x010000B0
	bl CpuFastSet
	movs r0, #0
	mov r8, r0
	adds r5, #0x2c
	str r5, [sp, #0xc]
_0802ADDA:
	movs r7, #0
	mov r1, r8
	lsls r0, r1, #2
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	mov sb, r1
	add r0, r8
	lsls r0, r0, #3
	mov sl, r0
_0802ADF0:
	mov r1, sb
	ldr r0, [r1]
	lsls r4, r7, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r0, r7, #3
	ldr r1, _0802AE7C @ =0x0200278C
	adds r0, r0, r1
	mov r1, sl
	adds r6, r1, r0
	adds r0, r6, #0
	bl ClearText
	cmp r5, #0
	beq _0802AE46
	mov r1, sb
	ldr r0, [r1]
	adds r1, r5, #0
	bl IsItemDisplayUsable
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r0, sp
	add r0, r8
	adds r0, #4
	ldrb r0, [r0]
	adds r3, r0, r4
	adds r3, #1
	lsls r3, r3, #5
	adds r3, #1
	mov r0, sp
	add r0, r8
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #1
	ldr r0, _0802AE80 @ =0x02022C60
	adds r3, r3, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl DrawItemMenuLine
_0802AE46:
	adds r7, #1
	cmp r7, #4
	ble _0802ADF0
	ldr r0, [sp, #0x10]
	mov r8, r0
	cmp r0, #1
	ble _0802ADDA
	movs r0, #1
	bl EnableBgSync
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AE6C: .4byte 0x081C3CEC
_0802AE70: .4byte 0x081C3CEE
_0802AE74: .4byte 0x02022EA0
_0802AE78: .4byte 0x010000B0
_0802AE7C: .4byte 0x0200278C
_0802AE80: .4byte 0x02022C60

	thumb_func_start TradeMenu_RefreshSelectableCells
TradeMenu_RefreshSelectableCells: @ 0x0802AE84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #0
	adds r7, r0, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r6, #0x34
	movs r1, #0x39
	adds r1, r1, r0
	mov r8, r1
	adds r0, #0x3f
	mov ip, r0
_0802AE9E:
	movs r3, #0
	lsls r1, r2, #2
	lsls r0, r2, #1
	adds r5, r2, #1
	adds r4, r7, r1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r2, r0, r6
_0802AEAE:
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	adds r2, #1
	adds r3, #1
	cmp r3, #4
	ble _0802AEAE
	adds r2, r5, #0
	cmp r2, #1
	ble _0802AE9E
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0802AEE0
sub_0802AEE0: @ 0x0802AEE0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0802AF2C
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #1
	bne _0802AF2C
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl TradeMenu_GetAdjustedRow
	adds r1, r0, #0
	cmp r1, #0
	bge _0802AF14
	b _0802B014
_0802AF14:
	strb r7, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802AF2C
	ldr r0, _0802B024 @ =0x00000387
	bl m4aSongNumStart
_0802AF2C:
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0802AF72
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #0
	bne _0802AF72
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl TradeMenu_GetAdjustedRow
	adds r1, r0, #0
	cmp r1, #0
	blt _0802B014
	movs r0, #1
	strb r0, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802AF72
	ldr r0, _0802B024 @ =0x00000387
	bl m4aSongNumStart
_0802AF72:
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802AFBC
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802AFA2
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0802B014
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl TradeMenu_GetAdjustedRow
	adds r0, #1
	strb r0, [r4]
_0802AFA2:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802AFBC
	ldr r0, _0802B028 @ =0x00000386
	bl m4aSongNumStart
_0802AFBC:
	ldr r0, _0802B01C @ =0x08B857F8
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	mov ip, r1
	movs r0, #0x80
	mov r6, ip
	ands r0, r6
	cmp r0, #0
	beq _0802B014
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r3, [r2]
	adds r1, r5, #0
	adds r1, #0x41
	ldrb r6, [r1]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r3, r0
	subs r1, #0xd
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802AFFA
	ldrh r4, [r4, #8]
	cmp ip, r4
	bne _0802B014
	movs r0, #0xff
	strb r0, [r2]
_0802AFFA:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r7, #1
	ldr r0, _0802B020 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B014
	ldr r0, _0802B028 @ =0x00000386
	bl m4aSongNumStart
_0802B014:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B01C: .4byte 0x08B857F8
_0802B020: .4byte 0x0202BBF8
_0802B024: .4byte 0x00000387
_0802B028: .4byte 0x00000386

	thumb_func_start sub_0802B02C
sub_0802B02C: @ 0x0802B02C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r3, r4, #0
	adds r3, #0x2c
	adds r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r2, [r1]
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r3, r3, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r1, [r3]
	adds r1, r1, r0
	ldrh r3, [r2]
	ldrh r0, [r1]
	strh r0, [r2]
	strh r3, [r1]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802B090 @ =0x0203A85C
	movs r0, #0x18
	strb r0, [r1, #0x11]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, [r4, #0x30]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl TradeMenu_RefreshItemText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B090: .4byte 0x0203A85C

	thumb_func_start TradeMenu_InitItemDisplay
TradeMenu_InitItemDisplay: @ 0x0802B094
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r4, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	bl ResetTextFont
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl TradeMenu_InitItemText
	adds r0, r5, #0
	bl TradeMenu_RefreshItemText
	ldr r0, [r5, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	subs r4, #4
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartFace
	ldr r0, [r5, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb0
	adds r3, r4, #0
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #1
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TradeMenu_OnInitUnselected
TradeMenu_OnInitUnselected: @ 0x0802B120
	push {r4, lr}
	adds r4, r0, #0
	bl TradeMenu_RefreshSelectableCells
	adds r4, #0x45
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802B134
sub_0802B134: @ 0x0802B134
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0802B8AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B170
	ldr r2, _0802B16C @ =0x08B942B8
	adds r3, r4, #0
	adds r3, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r4, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r5, #0
	ldrsh r0, [r1, r5]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl PutUiHand
	b _0802B216
	.align 2, 0
_0802B16C: .4byte 0x08B942B8
_0802B170:
	adds r0, r4, #0
	bl sub_0802AEE0
	ldr r0, _0802B1C8 @ =0x08B942B8
	adds r3, r4, #0
	adds r3, #0x42
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r5, [r2]
	lsls r1, r5, #2
	adds r1, r1, r5
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r5, #2
	ldrsh r1, [r1, r5]
	lsls r1, r1, #3
	bl PutUiHand
	ldr r0, _0802B1CC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B1D8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0802B1D0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B216
	ldr r0, _0802B1D4 @ =0x0000038A
	bl m4aSongNumStart
	b _0802B216
	.align 2, 0
_0802B1C8: .4byte 0x08B942B8
_0802B1CC: .4byte 0x08B857F8
_0802B1D0: .4byte 0x0202BBF8
_0802B1D4: .4byte 0x0000038A
_0802B1D8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B204
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0802B1FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B216
	ldr r0, _0802B200 @ =0x0000038B
	bl m4aSongNumStart
	b _0802B216
	.align 2, 0
_0802B1FC: .4byte 0x0202BBF8
_0802B200: .4byte 0x0000038B
_0802B204:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B216
	ldr r0, _0802B21C @ =0x08B943B0
	adds r1, r4, #0
	bl Proc_StartBlocking
_0802B216:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B21C: .4byte 0x08B943B0

	thumb_func_start sub_0802B220
sub_0802B220: @ 0x0802B220
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x42
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #1
	ldrb r1, [r5]
	eors r0, r1
	strb r0, [r5]
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #4
	bl TradeMenu_GetAdjustedRow
	cmp r0, #4
	beq _0802B280
	adds r0, #1
	strb r0, [r6]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r1, [r6]
	adds r0, r1, r0
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x45
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, #1
	strb r0, [r1]
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x47
	strb r1, [r0]
_0802B280:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802B288
sub_0802B288: @ 0x0802B288
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0802B8AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B2EC
	ldr r4, _0802B2E8 @ =0x08B942B8
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl PutUiHand
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	b _0802B3B2
	.align 2, 0
_0802B2E8: .4byte 0x08B942B8
_0802B2EC:
	adds r0, r5, #0
	bl sub_0802AEE0
	ldr r4, _0802B364 @ =0x08B942B8
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl PutUiHand
	adds r0, r5, #0
	adds r0, #0x44
	adds r2, r5, #0
	adds r2, #0x43
	ldrb r3, [r2]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	ldr r0, _0802B368 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B374
	adds r0, r5, #0
	bl sub_0802B02C
	ldr r0, _0802B36C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B38E
	ldr r0, _0802B370 @ =0x0000038A
	b _0802B38A
	.align 2, 0
_0802B364: .4byte 0x08B942B8
_0802B368: .4byte 0x08B857F8
_0802B36C: .4byte 0x0202BBF8
_0802B370: .4byte 0x0000038A
_0802B374:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B3A0
	ldr r0, _0802B398 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B38E
	ldr r0, _0802B39C @ =0x0000038B
_0802B38A:
	bl m4aSongNumStart
_0802B38E:
	adds r0, r5, #0
	bl Proc_Break
	b _0802B3B2
	.align 2, 0
_0802B398: .4byte 0x0202BBF8
_0802B39C: .4byte 0x0000038B
_0802B3A0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B3B2
	ldr r0, _0802B3B8 @ =0x08B943B0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0802B3B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B3B8: .4byte 0x08B943B0

	thumb_func_start TradeMenu_OnEndSelected
TradeMenu_OnEndSelected: @ 0x0802B3BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x43
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	adds r6, r4, #0
	adds r6, #0x42
	strb r0, [r6]
	adds r0, r4, #0
	bl TradeMenu_RefreshSelectableCells
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802B3FA
	movs r0, #1
	eors r2, r0
	strb r2, [r5]
_0802B3FA:
	ldrb r1, [r5]
	ldrb r2, [r6]
	adds r0, r4, #0
	bl TradeMenu_GetAdjustedRow
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start TradeMenu_LoadForcedInitialHover
TradeMenu_LoadForcedInitialHover: @ 0x0802B40C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802B44C @ =0x0202BBB8
	adds r5, r0, #0
	adds r5, #0x3f
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	blt _0802B450
	movs r1, #5
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x41
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #5
	bl __modsi3
	adds r1, r4, #0
	adds r1, #0x42
	strb r0, [r1]
	adds r0, r4, #0
	bl TradeMenu_RefreshSelectableCells
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0802B452
	.align 2, 0
_0802B44C: .4byte 0x0202BBB8
_0802B450:
	movs r0, #1
_0802B452:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start TradeMenu_ClearDisplay
TradeMenu_ClearDisplay: @ 0x0802B458
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802B46C
sub_0802B46C: @ 0x0802B46C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x14]
	adds r4, r3, #0
	adds r4, #0x41
	ldrb r0, [r4]
	lsls r1, r0, #2
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r5, r3, #0
	adds r5, #0x42
	ldrb r6, [r5]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r6, #0
	bne _0802B49C
	adds r0, r2, #0
	bl Proc_End
	b _0802B502
_0802B49C:
	adds r0, r3, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802B4CA
	adds r2, r3, #0
	adds r2, #0x47
	adds r1, r3, #0
	adds r1, #0x46
	ldrb r7, [r1]
	lsls r0, r7, #1
	adds r1, r7, #0
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r1, r3, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0802B4CA:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r0, _0802B508 @ =0x08B942B8
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r5, [r5]
	adds r1, r5, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r7, #0
	ldrsh r0, [r1, r7]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	adds r2, r6, #0
	bl StartItemHelpBox
	ldr r0, _0802B50C @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _0802B510 @ =0x0000FEFD
	ldrh r6, [r1, #8]
	ands r0, r6
	strh r0, [r1, #8]
_0802B502:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B508: .4byte 0x08B942B8
_0802B50C: .4byte 0x08B857F8
_0802B510: .4byte 0x0000FEFD

	thumb_func_start sub_0802B514
sub_0802B514: @ 0x0802B514
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_0802AEE0
	adds r6, r4, #0
	adds r6, #0x41
	ldrb r7, [r6]
	lsls r5, r7, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r5
	ldr r1, [r1]
	movs r2, #0x42
	adds r2, r2, r4
	mov r8, r2
	ldrb r3, [r2]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B566
	ldr r0, _0802B5E0 @ =0x08B942B8
	adds r1, r5, r7
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl StartItemHelpBox
_0802B566:
	ldr r0, _0802B5E4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802B57C
	mov r0, sb
	bl Proc_Break
_0802B57C:
	ldr r5, _0802B5E0 @ =0x08B942B8
	ldrb r0, [r6]
	lsls r1, r0, #2
	adds r1, r1, r0
	mov r2, r8
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl PutUiHand
	adds r0, r4, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802B5D2
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
_0802B5D2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B5E0: .4byte 0x08B942B8
_0802B5E4: .4byte 0x08B857F8

	thumb_func_start sub_0802B5E8
sub_0802B5E8: @ 0x0802B5E8
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x14]
	adds r5, r4, #0
	adds r5, #0x45
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802B614
	adds r2, r4, #0
	adds r2, #0x47
	adds r1, r4, #0
	adds r1, #0x46
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r2, r0
	subs r1, #0x12
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_0802B614:
	bl CloseHelpBox
	ldr r6, _0802B674 @ =0x08B942B8
	adds r2, r4, #0
	adds r2, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl PutUiHand
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802B66E
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
_0802B66E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B674: .4byte 0x08B942B8

	thumb_func_start sub_0802B678
sub_0802B678: @ 0x0802B678
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0802B6D0 @ =0x08B942F8
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r4, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r5, r2, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r1, #2
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x48
	strb r0, [r4]
	ldr r0, _0802B6D4 @ =0x0203A514
	str r2, [r0]
	bl sub_08079A5C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B6BC
	movs r0, #0xc9
	bl SetkeyStIgnoredMask
	movs r0, #1
	strb r0, [r4]
_0802B6BC:
	adds r0, r6, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _0802B6CA
	movs r0, #1
	strb r0, [r5]
_0802B6CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802B6D0: .4byte 0x08B942F8
_0802B6D4: .4byte 0x0203A514

	thumb_func_start SetTradeMenuTutStatus2
SetTradeMenuTutStatus2: @ 0x0802B6D8
	ldr r0, _0802B6E4 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B6E4: .4byte 0x0203A514

	thumb_func_start SetTradeMenuTutStatus3
SetTradeMenuTutStatus3: @ 0x0802B6E8
	ldr r0, _0802B6F4 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B6F4: .4byte 0x0203A514

	thumb_func_start SetTradeMenuTutStatus4
SetTradeMenuTutStatus4: @ 0x0802B6F8
	ldr r0, _0802B704 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B704: .4byte 0x0203A514

	thumb_func_start SetTradeMenuTutStatus5
SetTradeMenuTutStatus5: @ 0x0802B708
	ldr r0, _0802B714 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #5
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B714: .4byte 0x0203A514

	thumb_func_start SetTradeMenuTutStatus7
SetTradeMenuTutStatus7: @ 0x0802B718
	ldr r0, _0802B724 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #7
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B724: .4byte 0x0203A514

	thumb_func_start SetTradeMenuTutStatus8
SetTradeMenuTutStatus8: @ 0x0802B728
	ldr r0, _0802B734 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #8
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B734: .4byte 0x0203A514

	thumb_func_start sub_0802B738
sub_0802B738: @ 0x0802B738
	push {r4, lr}
	ldr r0, _0802B76C @ =0x0203A514
	ldr r0, [r0]
	ldr r2, _0802B770 @ =0x08B942B8
	adds r3, r0, #0
	adds r3, #0x42
	adds r0, #0x41
	ldrb r4, [r0]
	lsls r1, r4, #2
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r4, #2
	ldrsh r1, [r1, r4]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B76C: .4byte 0x0203A514
_0802B770: .4byte 0x08B942B8

	thumb_func_start sub_0802B774
sub_0802B774: @ 0x0802B774
	push {r4, r5, lr}
	ldr r0, _0802B7D0 @ =0x0203A514
	ldr r5, [r0]
	ldr r4, _0802B7D4 @ =0x08B942B8
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r3, [r0]
	lsls r1, r3, #2
	adds r1, r1, r3
	ldrb r2, [r2]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl DisplayFrozenUiHand
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B7D0: .4byte 0x0203A514
_0802B7D4: .4byte 0x08B942B8

	thumb_func_start sub_0802B7D8
sub_0802B7D8: @ 0x0802B7D8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B7E8 @ =0x08B943D0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802B7E8: .4byte 0x08B943D0

	thumb_func_start sub_0802B7EC
sub_0802B7EC: @ 0x0802B7EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B7FC @ =0x08B943E8
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802B7FC: .4byte 0x08B943E8

	thumb_func_start TradeMenu_TutorialWait_OnInit
TradeMenu_TutorialWait_OnInit: @ 0x0802B800
	adds r0, #0x4c
	movs r1, #0x14
	strh r1, [r0]
	bx lr

	thumb_func_start TradeMenu_TutorialWait_OnLoop
TradeMenu_TutorialWait_OnLoop: @ 0x0802B808
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802B822
	adds r0, r2, #0
	bl Proc_Break
_0802B822:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TradeMenuHandSTAL
TradeMenuHandSTAL: @ 0x0802B828
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B84C @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #3
	beq _0802B846
	cmp r0, #5
	beq _0802B846
	cmp r0, #8
	beq _0802B846
	ldr r0, _0802B850 @ =0x08B94400
	bl Proc_StartBlocking
_0802B846:
	pop {r0}
	bx r0
	.align 2, 0
_0802B84C: .4byte 0x0203A514
_0802B850: .4byte 0x08B94400

	thumb_func_start sub_0802B854
sub_0802B854: @ 0x0802B854
	push {lr}
	adds r1, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802B866
	ldr r0, _0802B86C @ =0x08B94418
	bl StartEventInternal
_0802B866:
	pop {r0}
	bx r0
	.align 2, 0
_0802B86C: .4byte 0x08B94418

	thumb_func_start sub_0802B870
sub_0802B870: @ 0x0802B870
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B880 @ =0x08B9446C
	bl StartEventInternal
	pop {r0}
	bx r0
	.align 2, 0
_0802B880: .4byte 0x08B9446C

	thumb_func_start sub_0802B884
sub_0802B884: @ 0x0802B884
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B894 @ =0x08B944C8
	bl StartEventInternal
	pop {r0}
	bx r0
	.align 2, 0
_0802B894: .4byte 0x08B944C8

	thumb_func_start sub_0802B898
sub_0802B898: @ 0x0802B898
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802B8A8 @ =0x08B9451C
	bl StartEventInternal
	pop {r0}
	bx r0
	.align 2, 0
_0802B8A8: .4byte 0x08B9451C

	thumb_func_start sub_0802B8AC
sub_0802B8AC: @ 0x0802B8AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #4
	beq _0802B8C4
	ldr r0, _0802B8E0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	bne _0802B8C4
	b _0802BA40
_0802B8C4:
	ldr r0, _0802B8E4 @ =0x0203A514
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #6
	bls _0802B8D4
	b _0802BA40
_0802B8D4:
	lsls r0, r0, #2
	ldr r1, _0802B8E8 @ =_0802B8EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B8E0: .4byte 0x08B857F8
_0802B8E4: .4byte 0x0203A514
_0802B8E8: .4byte _0802B8EC
_0802B8EC: @ jump table
	.4byte _0802B908 @ case 0
	.4byte _0802B94C @ case 1
	.4byte _0802B9F0 @ case 2
	.4byte _0802B9C0 @ case 3
	.4byte _0802BA40 @ case 4
	.4byte _0802BA40 @ case 5
	.4byte _0802BA00 @ case 6
_0802B908:
	ldr r0, _0802B924 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802B928
	movs r0, #0xc8
	bl SetkeyStIgnoredMask
	adds r0, r4, #0
	bl sub_0802B870
	b _0802BA40
	.align 2, 0
_0802B924: .4byte 0x08B857F8
_0802B928:
	ldr r0, _0802B948 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B93C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802B93C:
	adds r0, r4, #0
	movs r1, #0x65
	bl Proc_Goto
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802B948: .4byte 0x0202BBF8
_0802B94C:
	ldr r0, _0802B998 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x91
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B99C
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802BA40
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x6b
	bne _0802B99C
	movs r0, #0xc8
	bl SetkeyStIgnoredMask
	adds r0, r4, #0
	bl SetTradeMenuTutStatus4
	b _0802BA40
	.align 2, 0
_0802B998: .4byte 0x08B857F8
_0802B99C:
	ldr r0, _0802B9BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B9B0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802B9B0:
	adds r0, r4, #0
	bl sub_0802B870
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802B9BC: .4byte 0x0202BBF8
_0802B9C0:
	ldr r0, _0802B9D8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802B9DC
	adds r0, r4, #0
	bl sub_0802B898
	b _0802BA40
	.align 2, 0
_0802B9D8: .4byte 0x08B857F8
_0802B9DC:
	ldr r0, _0802B9FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802B9F0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802B9F0:
	adds r0, r4, #0
	bl sub_0802B884
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802B9FC: .4byte 0x0202BBF8
_0802BA00:
	ldr r0, _0802BA18 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802BA1C
	movs r0, #0
	bl SetkeyStIgnoredMask
	b _0802BA40
	.align 2, 0
_0802BA18: .4byte 0x08B857F8
_0802BA1C:
	ldr r0, _0802BA3C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802BA30
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802BA30:
	adds r0, r4, #0
	bl sub_0802B898
	movs r0, #1
	b _0802BA42
	.align 2, 0
_0802BA3C: .4byte 0x0202BBF8
_0802BA40:
	movs r0, #0
_0802BA42:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start InitTraps
InitTraps: @ 0x0802BA48
	push {r4, lr}
	ldr r3, _0802BA68 @ =0x0203A718
	ldr r1, _0802BA6C @ =0x0203A518
	movs r2, #0
	movs r4, #0xfc
	lsls r4, r4, #1
	adds r0, r1, r4
_0802BA56:
	strb r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0802BA56
	movs r0, #0
	strb r0, [r3, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BA68: .4byte 0x0203A718
_0802BA6C: .4byte 0x0203A518

	thumb_func_start GetTrapAt
GetTrapAt: @ 0x0802BA70
	adds r3, r0, #0
	ldr r2, _0802BA78 @ =0x0203A518
	b _0802BA8E
	.align 2, 0
_0802BA78: .4byte 0x0203A518
_0802BA7C:
	ldrb r0, [r2]
	cmp r3, r0
	bne _0802BA8C
	ldrb r0, [r2, #1]
	cmp r1, r0
	bne _0802BA8C
	adds r0, r2, #0
	b _0802BA96
_0802BA8C:
	adds r2, #8
_0802BA8E:
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BA7C
	movs r0, #0
_0802BA96:
	bx lr

	thumb_func_start sub_0802BA98
sub_0802BA98: @ 0x0802BA98
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _0802BAA0 @ =0x0203A518
	b _0802BABC
	.align 2, 0
_0802BAA0: .4byte 0x0203A518
_0802BAA4:
	ldrb r0, [r3]
	cmp r0, r4
	bne _0802BABA
	ldrb r0, [r3, #1]
	cmp r0, r1
	bne _0802BABA
	ldrb r0, [r3, #2]
	cmp r0, r2
	bne _0802BABA
	adds r0, r3, #0
	b _0802BAC4
_0802BABA:
	adds r3, #8
_0802BABC:
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0802BAA4
	movs r0, #0
_0802BAC4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AddTrap
AddTrap: @ 0x0802BACC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0802BAD8 @ =0x0203A518
	b _0802BADE
	.align 2, 0
_0802BAD8: .4byte 0x0203A518
_0802BADC:
	adds r1, #8
_0802BADE:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802BADC
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start AddDamagingTrap
AddDamagingTrap: @ 0x0802BAF4
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	ldr r5, [sp, #0x14]
	ldr r6, [sp, #0x18]
	bl AddTrap
	strb r4, [r0, #4]
	strb r5, [r0, #5]
	strb r4, [r0, #6]
	strb r6, [r0, #7]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RemoveTrap
RemoveTrap: @ 0x0802BB10
	adds r2, r0, #0
	b _0802BB1A
_0802BB14:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0xc]
	stm r2!, {r0, r1}
_0802BB1A:
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BB14
	bx lr
	.align 2, 0

	thumb_func_start AddFireTile
AddFireTile: @ 0x0802BB24
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0xa
	str r2, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AddGasTrap
AddGasTrap: @ 0x0802BB40
	push {r4, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r2, [sp, #0x14]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	movs r2, #5
	adds r3, r4, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start AddArrowTrap
AddArrowTrap: @ 0x0802BB60
	push {lr}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r0}
	bx r0

	thumb_func_start sub_0802BB7C
sub_0802BB7C: @ 0x0802BB7C
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AddTrap8
AddTrap8: @ 0x0802BB98
	push {lr}
	movs r2, #8
	movs r3, #0
	bl AddTrap
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AddTrap9
AddTrap9: @ 0x0802BBA8
	push {lr}
	adds r3, r2, #0
	movs r2, #9
	bl AddTrap
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start InitMapObstacles
InitMapObstacles: @ 0x0802BBB8
	push {r4, r5, r6, lr}
	ldr r0, _0802BBEC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802BC38
_0802BBC6:
	ldr r0, _0802BBEC @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0802BC32
_0802BBD4:
	ldr r0, _0802BBF0 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802BBF4
	cmp r0, #0x33
	beq _0802BC20
	b _0802BC2C
	.align 2, 0
_0802BBEC: .4byte 0x0202E3D8
_0802BBF0: .4byte 0x0202E3E0
_0802BBF4:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802BC2C
	ldr r0, _0802BC1C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl AddTrap
	b _0802BC2C
	.align 2, 0
_0802BC1C: .4byte 0x0202BBF8
_0802BC20:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0x14
	bl AddTrap
_0802BC2C:
	subs r4, #1
	cmp r4, #0
	bge _0802BBD4
_0802BC32:
	adds r5, r6, #0
	cmp r5, #0
	bge _0802BBC6
_0802BC38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ApplyEnabledMapChanges
ApplyEnabledMapChanges: @ 0x0802BC40
	push {r4, lr}
	ldr r4, _0802BC48 @ =0x0203A518
	b _0802BC72
	.align 2, 0
_0802BC48: .4byte 0x0203A518
_0802BC4C:
	ldrb r0, [r4, #2]
	cmp r0, #3
	beq _0802BC58
	cmp r0, #6
	beq _0802BC60
	b _0802BC70
_0802BC58:
	ldrb r0, [r4, #3]
	bl ApplyMapChange
	b _0802BC70
_0802BC60:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802BC6A
	ldrb r0, [r4, #1]
	b _0802BC6C
_0802BC6A:
	ldrb r0, [r4]
_0802BC6C:
	bl ApplyMapChange
_0802BC70:
	adds r4, #8
_0802BC72:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802BC4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802BC80
sub_0802BC80: @ 0x0802BC80
	push {r4, r5, lr}
	ldr r2, _0802BCB4 @ =0x0203A518
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802BCAC
	ldr r4, _0802BCB8 @ =0x0202E3E0
	movs r3, #0
_0802BC8E:
	ldrb r0, [r2, #2]
	cmp r0, #0xc
	bne _0802BCA4
	ldr r0, [r4]
	ldrb r5, [r2, #1]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldrb r1, [r2]
	adds r0, r1, r0
	strb r3, [r0]
_0802BCA4:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BC8E
_0802BCAC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BCB4: .4byte 0x0203A518
_0802BCB8: .4byte 0x0202E3E0

	thumb_func_start sub_0802BCBC
sub_0802BCBC: @ 0x0802BCBC
	push {lr}
	bl GetTrapAt
	cmp r0, #0
	beq _0802BCCA
	ldrb r0, [r0, #3]
	b _0802BCCC
_0802BCCA:
	movs r0, #0
_0802BCCC:
	pop {r1}
	bx r1

	thumb_func_start GetMapChange
GetMapChange: @ 0x0802BCD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802BCE8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChanges
	adds r1, r0, #0
	cmp r1, #0
	bne _0802BCFA
	b _0802BD02
	.align 2, 0
_0802BCE8: .4byte 0x0202BBF8
_0802BCEC:
	adds r0, r1, #0
	b _0802BD04
_0802BCF0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	beq _0802BCEC
	adds r1, #0xc
_0802BCFA:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802BCF0
_0802BD02:
	movs r0, #0
_0802BD04:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetMapChangeIdAt
GetMapChangeIdAt: @ 0x0802BD0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _0802BD2C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChanges
	adds r1, r0, #0
	cmp r1, #0
	beq _0802BD5E
	b _0802BD56
	.align 2, 0
_0802BD2C: .4byte 0x0202BBF8
_0802BD30:
	ldrb r0, [r1, #1]
	cmp r5, r0
	blt _0802BD54
	ldrb r2, [r1, #2]
	cmp r4, r2
	blt _0802BD54
	ldrb r3, [r1, #3]
	adds r0, r3, r0
	subs r0, #1
	cmp r0, r5
	blt _0802BD54
	ldrb r3, [r1, #4]
	adds r0, r3, r2
	subs r0, #1
	cmp r0, r4
	blt _0802BD54
	movs r6, #0
	ldrsb r6, [r1, r6]
_0802BD54:
	adds r1, #0xc
_0802BD56:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802BD30
_0802BD5E:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ApplyMapChange
ApplyMapChange: @ 0x0802BD68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	bl GetMapChange
	adds r3, r0, #0
	ldr r4, [r3, #8]
	ldrb r0, [r3, #4]
	cmp r6, r0
	bge _0802BDC2
	ldr r7, _0802BDD0 @ =0x08B932B4
	mov r8, r7
_0802BD84:
	movs r5, #0
	adds r0, r6, #1
	mov sb, r0
	ldrb r7, [r3, #3]
	cmp r5, r7
	bge _0802BDBA
	mov ip, r8
_0802BD92:
	ldrh r2, [r4]
	cmp r2, #0
	beq _0802BDB0
	ldrb r0, [r3, #2]
	adds r1, r0, r6
	mov r7, ip
	ldr r0, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r7, [r3, #1]
	adds r0, r7, r5
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r2, [r0]
_0802BDB0:
	adds r4, #2
	adds r5, #1
	ldrb r0, [r3, #3]
	cmp r5, r0
	blt _0802BD92
_0802BDBA:
	mov r6, sb
	ldrb r7, [r3, #4]
	cmp r6, r7
	blt _0802BD84
_0802BDC2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BDD0: .4byte 0x08B932B4

	thumb_func_start AddMapChangeTrap
AddMapChangeTrap: @ 0x0802BDD4
	push {lr}
	adds r3, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #3
	bl AddTrap
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RemoveMapChangeTrap
RemoveMapChangeTrap: @ 0x0802BDE8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802BDF0 @ =0x0203A518
	b _0802BE06
	.align 2, 0
_0802BDF0: .4byte 0x0203A518
_0802BDF4:
	cmp r0, #3
	bne _0802BE04
	ldrb r0, [r4, #3]
	cmp r0, r5
	bne _0802BE04
	adds r0, r4, #0
	bl RemoveTrap
_0802BE04:
	adds r4, #8
_0802BE06:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802BDF4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitHideIfUnderRoof
UnitHideIfUnderRoof: @ 0x0802BE14
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802BE3C @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0802BE38
	ldr r0, [r2, #0xc]
	movs r1, #0x81
	orrs r0, r1
	str r0, [r2, #0xc]
_0802BE38:
	bx lr
	.align 2, 0
_0802BE3C: .4byte 0x0202E3E0

	thumb_func_start UpdateRoofedUnits
UpdateRoofedUnits: @ 0x0802BE40
	push {r4, r5, lr}
	movs r5, #1
_0802BE44:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802BE88
	ldr r0, [r4]
	cmp r0, #0
	beq _0802BE88
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0802BE88
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0802BE9C @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _0802BE88
	movs r0, #0x82
	rsbs r0, r0, #0
	ands r3, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r3, r0
	str r3, [r4, #0xc]
_0802BE88:
	adds r5, #1
	cmp r5, #0xbf
	ble _0802BE44
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE9C: .4byte 0x0202E3E0

	thumb_func_start GenerateFireTileTrapTargets
GenerateFireTileTrapTargets: @ 0x0802BEA0
	push {r4, lr}
	adds r3, r2, #0
	ldr r2, _0802BEBC @ =0x0202E3DC
	ldr r4, [r2]
	lsls r2, r1, #2
	adds r2, r2, r4
	ldr r2, [r2]
	adds r2, r2, r0
	ldrb r2, [r2]
	bl EnlistTarget
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BEBC: .4byte 0x0202E3DC

	thumb_func_start GenerateArrowTrapTargets
GenerateArrowTrapTargets: @ 0x0802BEC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	movs r4, #0
	b _0802BEEA
_0802BECA:
	ldr r0, _0802BEFC @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802BEE8
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl EnlistTarget
_0802BEE8:
	adds r4, #1
_0802BEEA:
	ldr r0, _0802BF00 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r4, r0
	blt _0802BECA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802BEFC: .4byte 0x0202E3DC
_0802BF00: .4byte 0x0202E3D8

	thumb_func_start GenerateGasTrapTargets
GenerateGasTrapTargets: @ 0x0802BF04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	movs r0, #0
	mov sb, r0
	movs r7, #0
	cmp r3, #1
	beq _0802BF46
	cmp r3, #1
	bgt _0802BF26
	cmp r3, #0
	beq _0802BF40
	b _0802BF4A
_0802BF26:
	cmp r3, #2
	beq _0802BF38
	cmp r3, #3
	bne _0802BF4A
	movs r0, #0
	mov sb, r0
	movs r7, #1
	rsbs r7, r7, #0
	b _0802BF4A
_0802BF38:
	movs r0, #0
	mov sb, r0
	movs r7, #1
	b _0802BF4A
_0802BF40:
	movs r0, #1
	rsbs r0, r0, #0
	b _0802BF48
_0802BF46:
	movs r0, #1
_0802BF48:
	mov sb, r0
_0802BF4A:
	movs r6, #2
_0802BF4C:
	add r5, sb
	adds r4, r4, r7
	ldr r0, _0802BF80 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802BF6E
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	mov r3, r8
	bl EnlistTarget
_0802BF6E:
	subs r6, #1
	cmp r6, #0
	bge _0802BF4C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BF80: .4byte 0x0202E3DC

	thumb_func_start ShouldSkipGasTrapDisplay
ShouldSkipGasTrapDisplay: @ 0x0802BF84
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r4, #0
	movs r5, #1
	cmp r2, #1
	beq _0802BFBA
	cmp r2, #1
	bgt _0802BF9E
	cmp r2, #0
	beq _0802BFB4
	b _0802BFBC
_0802BF9E:
	cmp r2, #2
	beq _0802BFAE
	cmp r2, #3
	bne _0802BFBC
	movs r7, #0
	movs r4, #1
	rsbs r4, r4, #0
	b _0802BFBC
_0802BFAE:
	movs r7, #0
	movs r4, #1
	b _0802BFBC
_0802BFB4:
	movs r7, #1
	rsbs r7, r7, #0
	b _0802BFBC
_0802BFBA:
	movs r7, #1
_0802BFBC:
	ldr r0, _0802BFE8 @ =0x0202E3DC
	ldr r1, [r0]
	movs r2, #2
	lsls r0, r6, #2
	adds r1, r0, r1
	lsls r4, r4, #2
_0802BFC8:
	adds r3, r3, r7
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802BFD8
	movs r5, #0
_0802BFD8:
	subs r2, #1
	cmp r2, #0
	bge _0802BFC8
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802BFE8: .4byte 0x0202E3DC

	thumb_func_start GenerateTrapDamageTargets
GenerateTrapDamageTargets: @ 0x0802BFEC
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r4, _0802BFFC @ =0x0203A518
	b _0802C04A
	.align 2, 0
_0802BFFC: .4byte 0x0203A518
_0802C000:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802C048
	ldrb r0, [r4, #2]
	cmp r0, #5
	beq _0802C03A
	cmp r0, #5
	bgt _0802C018
	cmp r0, #4
	beq _0802C01E
	b _0802C048
_0802C018:
	cmp r0, #7
	beq _0802C02C
	b _0802C048
_0802C01E:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateFireTileTrapTargets
	b _0802C048
_0802C02C:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateArrowTrapTargets
	b _0802C048
_0802C03A:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl GenerateGasTrapTargets
_0802C048:
	adds r4, #8
_0802C04A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C000
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenerateDisplayedTrapDamageTargets
GenerateDisplayedTrapDamageTargets: @ 0x0802C058
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r4, _0802C068 @ =0x0203A518
	b _0802C148
	.align 2, 0
_0802C068: .4byte 0x0203A518
_0802C06C:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802C146
	ldrb r3, [r4, #2]
	cmp r3, #5
	beq _0802C0C4
	cmp r3, #5
	bgt _0802C084
	cmp r3, #4
	beq _0802C08E
	b _0802C146
_0802C084:
	cmp r3, #6
	beq _0802C12E
	cmp r3, #7
	beq _0802C114
	b _0802C146
_0802C08E:
	ldrb r2, [r4, #1]
	ldr r0, _0802C0C0 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C146
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	movs r3, #4
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateFireTileTrapTargets
	b _0802C146
	.align 2, 0
_0802C0C0: .4byte 0x0202E3DC
_0802C0C4:
	ldrb r2, [r4, #3]
	cmp r2, #1
	beq _0802C0E8
	cmp r2, #1
	bgt _0802C0D4
	cmp r2, #0
	beq _0802C0E4
	b _0802C0EA
_0802C0D4:
	cmp r2, #2
	beq _0802C0E0
	cmp r2, #3
	bne _0802C0EA
	movs r5, #0x64
	b _0802C0EA
_0802C0E0:
	movs r5, #0x65
	b _0802C0EA
_0802C0E4:
	movs r5, #0x66
	b _0802C0EA
_0802C0E8:
	movs r5, #0x67
_0802C0EA:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl ShouldSkipGasTrapDisplay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C146
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	adds r3, r5, #0
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl GenerateGasTrapTargets
	b _0802C146
_0802C114:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	movs r3, #7
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateArrowTrapTargets
	b _0802C146
_0802C12E:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802C138
	ldrb r0, [r4]
	b _0802C13A
_0802C138:
	ldrb r0, [r4, #1]
_0802C13A:
	ldr r1, _0802C154 @ =0x0203A518
	subs r1, r4, r1
	asrs r1, r1, #3
	movs r2, #0
	bl EnlistTarget
_0802C146:
	adds r4, #8
_0802C148:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C06C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C154: .4byte 0x0203A518

	thumb_func_start sub_0802C158
sub_0802C158: @ 0x0802C158
	ldr r1, _0802C15C @ =0x0203A518
	b _0802C172
	.align 2, 0
_0802C15C: .4byte 0x0203A518
_0802C160:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802C170
	cmp r0, #4
	blt _0802C170
	ldrb r0, [r1, #6]
	subs r0, #1
	strb r0, [r1, #6]
_0802C170:
	adds r1, #8
_0802C172:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802C160
	bx lr
	.align 2, 0

	thumb_func_start sub_0802C17C
sub_0802C17C: @ 0x0802C17C
	ldr r1, _0802C180 @ =0x0203A518
	b _0802C19C
	.align 2, 0
_0802C180: .4byte 0x0203A518
_0802C184:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802C19A
	cmp r0, #4
	blt _0802C19A
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802C19A
	ldrb r0, [r1, #5]
	strb r0, [r1, #6]
_0802C19A:
	adds r1, #8
_0802C19C:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802C184
	bx lr

	thumb_func_start sub_0802C1A4
sub_0802C1A4: @ 0x0802C1A4
	push {r4, r5, lr}
	ldr r4, _0802C1BC @ =0x0202BBF8
	ldrb r5, [r4, #0xf]
	movs r0, #0x80
	strb r0, [r4, #0xf]
	bl RefreshEntityMaps
	strb r5, [r4, #0xf]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C1BC: .4byte 0x0202BBF8

	thumb_func_start sub_0802C1C0
sub_0802C1C0: @ 0x0802C1C0
	push {lr}
	movs r0, #3
	bl sub_08024A88
	pop {r0}
	bx r0

	thumb_func_start sub_0802C1CC
sub_0802C1CC: @ 0x0802C1CC
	push {lr}
	movs r0, #0x65
	bl CheckChapterFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C1E0
	ldr r0, _0802C1E4 @ =0x08CA749C
	bl sub_0800AF5C
_0802C1E0:
	pop {r0}
	bx r0
	.align 2, 0
_0802C1E4: .4byte 0x08CA749C

	thumb_func_start AddLightRune
AddLightRune: @ 0x0802C1E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0802C218 @ =0x0202E3E0
	ldr r0, [r6]
	lsls r4, r1, #2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc
	bl AddTrap
	movs r2, #0
	movs r1, #3
	strb r1, [r0, #6]
	ldr r0, [r6]
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	strb r2, [r0]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802C218: .4byte 0x0202E3E0

	thumb_func_start sub_0802C21C
sub_0802C21C: @ 0x0802C21C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_080193BC
	ldr r1, _0802C248 @ =0x0202E3E0
	ldr r2, [r1]
	ldrb r3, [r4, #1]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldrb r2, [r4]
	adds r1, r2, r1
	strb r0, [r1]
	adds r0, r4, #0
	bl RemoveTrap
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802C248: .4byte 0x0202E3E0

	thumb_func_start DecayTraps
DecayTraps: @ 0x0802C24C
	push {r4, lr}
	ldr r4, _0802C254 @ =0x0203A518
	b _0802C28E
	.align 2, 0
_0802C254: .4byte 0x0203A518
_0802C258:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	beq _0802C264
	cmp r0, #0xc
	beq _0802C278
	b _0802C28C
_0802C264:
	ldrb r0, [r4, #3]
	subs r0, #1
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C28C
	adds r0, r4, #0
	bl RemoveTrap
	b _0802C28A
_0802C278:
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C28C
	adds r0, r4, #0
	bl sub_0802C21C
_0802C28A:
	subs r4, #8
_0802C28C:
	adds r4, #8
_0802C28E:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C258
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DisableAllLightRunes
DisableAllLightRunes: @ 0x0802C29C
	push {r4, lr}
	ldr r4, _0802C2A4 @ =0x0203A518
	b _0802C2CA
	.align 2, 0
_0802C2A4: .4byte 0x0203A518
_0802C2A8:
	ldrb r0, [r4, #2]
	cmp r0, #0xc
	bne _0802C2C8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_080193BC
	ldr r1, _0802C2D8 @ =0x0202E3E0
	ldr r2, [r1]
	ldrb r3, [r4, #1]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldrb r2, [r4]
	adds r1, r2, r1
	strb r0, [r1]
_0802C2C8:
	adds r4, #8
_0802C2CA:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C2A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C2D8: .4byte 0x0202E3E0

	thumb_func_start EnableAllLightRunes
EnableAllLightRunes: @ 0x0802C2DC
	push {r4, r5, lr}
	ldr r2, _0802C310 @ =0x0203A518
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802C308
	ldr r4, _0802C314 @ =0x0202E3E0
	movs r3, #0
_0802C2EA:
	ldrb r0, [r2, #2]
	cmp r0, #0xc
	bne _0802C300
	ldr r0, [r4]
	ldrb r5, [r2, #1]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldrb r1, [r2]
	adds r0, r1, r0
	strb r3, [r0]
_0802C300:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802C2EA
_0802C308:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C310: .4byte 0x0203A518
_0802C314: .4byte 0x0202E3E0

	thumb_func_start GetTrap
GetTrap: @ 0x0802C318
	lsls r0, r0, #3
	ldr r1, _0802C320 @ =0x0203A518
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802C320: .4byte 0x0203A518

	thumb_func_start DoItemHealStaffAction
DoItemHealStaffAction: @ 0x0802C324
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802C3A0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetUnitItemHealAmount
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r5, #0
	bl AddUnitHp
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802C3A4 @ =0x0203A50C
	ldr r1, [r1]
	ldr r5, _0802C3A8 @ =0x0203A470
	ldrb r2, [r5, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C3A0: .4byte 0x0203A85C
_0802C3A4: .4byte 0x0203A50C
_0802C3A8: .4byte 0x0203A470

	thumb_func_start DoItemRestoreStaffAction
DoItemRestoreStaffAction: @ 0x0802C3AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C3E4 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C3E4: .4byte 0x0203A85C

	thumb_func_start sub_0802C3E8
sub_0802C3E8: @ 0x0802C3E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C428 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r0, #0x31
	movs r1, #0xf
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C428: .4byte 0x0203A85C

	thumb_func_start GetRescueStaffTargetPosition
GetRescueStaffTargetPosition: @ 0x0802C42C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	str r1, [sp]
	mov sb, r2
	mov sl, r3
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2]
	str r0, [r3]
	ldr r0, _0802C4F0 @ =0x0000270F
	str r0, [sp, #4]
	adds r0, r7, #0
	bl MapFloodUnitExtended
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802C4F4 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802C4F8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802C528
_0802C476:
	ldr r0, _0802C4F8 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802C522
	lsls r6, r5, #2
_0802C488:
	ldr r0, _0802C4FC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802C51C
	ldr r0, _0802C4F4 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C51C
	ldr r0, _0802C500 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802C51C
	ldr r0, _0802C504 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C51C
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802C4E0
	subs r2, r0, r4
_0802C4E0:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r1, r5, r0
	cmp r1, #0
	blt _0802C508
	adds r0, r2, r1
	b _0802C50C
	.align 2, 0
_0802C4F0: .4byte 0x0000270F
_0802C4F4: .4byte 0x0202E3DC
_0802C4F8: .4byte 0x0202E3D8
_0802C4FC: .4byte 0x0202E3E4
_0802C500: .4byte 0x0202E3F0
_0802C504: .4byte 0x0202E3E0
_0802C508:
	subs r0, r0, r5
	adds r0, r2, r0
_0802C50C:
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802C51C
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802C51C:
	subs r4, #1
	cmp r4, #0
	bge _0802C488
_0802C522:
	mov r5, r8
	cmp r5, #0
	bge _0802C476
_0802C528:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802C538
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802C626
_0802C538:
	ldr r0, _0802C638 @ =0x0000270F
	str r0, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	ldr r2, _0802C63C @ =0x08BE3C16
	bl GenerateExtendedMovementMap
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802C640 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802C644 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802C602
_0802C56E:
	ldr r0, _0802C644 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802C5FC
	lsls r6, r5, #2
_0802C580:
	ldr r0, _0802C648 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802C5F6
	ldr r0, _0802C640 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C5F6
	ldr r0, _0802C64C @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802C5F6
	ldr r0, _0802C650 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C5F6
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802C5D8
	subs r2, r0, r4
_0802C5D8:
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	subs r0, r5, r1
	cmp r0, #0
	bge _0802C5E4
	subs r0, r1, r5
_0802C5E4:
	adds r0, r2, r0
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802C5F6
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802C5F6:
	subs r4, #1
	cmp r4, #0
	bge _0802C580
_0802C5FC:
	mov r5, r8
	cmp r5, #0
	bge _0802C56E
_0802C602:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802C612
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802C626
_0802C612:
	ldr r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	mov r1, sb
	str r0, [r1]
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	mov r1, sl
	str r0, [r1]
_0802C626:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C638: .4byte 0x0000270F
_0802C63C: .4byte 0x08BE3C16
_0802C640: .4byte 0x0202E3DC
_0802C644: .4byte 0x0202E3D8
_0802C648: .4byte 0x0202E3E4
_0802C64C: .4byte 0x0202E3F0
_0802C650: .4byte 0x0202E3E0

	thumb_func_start DoItemRescueStaffAction
DoItemRescueStaffAction: @ 0x0802C654
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _0802C6C4 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	add r3, sp, #4
	adds r0, r5, #0
	mov r2, sp
	bl GetRescueStaffTargetPosition
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp, #4]
	strb r1, [r0, #0x11]
	ldr r0, _0802C6C8 @ =0x0203A470
	ldr r1, [sp]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldr r1, [sp, #4]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6C4: .4byte 0x0203A85C
_0802C6C8: .4byte 0x0203A470

	thumb_func_start sub_0802C6CC
sub_0802C6CC: @ 0x0802C6CC
	push {lr}
	bl ExecTrapAfterWarp
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802C6DC
sub_0802C6DC: @ 0x0802C6DC
	push {lr}
	ldr r0, _0802C704 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	bl GetUnitMu
	bl EndMu
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	pop {r1}
	bx r1
	.align 2, 0
_0802C704: .4byte 0x0203A85C

	thumb_func_start ExecWarpStaff
ExecWarpStaff: @ 0x0802C708
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C760 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x14]
	strb r1, [r0, #0x11]
	ldr r0, _0802C764 @ =0x0203A470
	ldrb r1, [r4, #0x13]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldrb r1, [r4, #0x14]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	ldr r0, _0802C768 @ =0x08B945C8
	adds r1, r5, #0
	bl Proc_StartBlocking
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C760: .4byte 0x0203A85C
_0802C764: .4byte 0x0203A470
_0802C768: .4byte 0x08B945C8

	thumb_func_start DoItemAttackStaffAction
DoItemAttackStaffAction: @ 0x0802C76C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802C7C0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	ldr r4, _0802C7C4 @ =0x0203A3F0
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	bl RandRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C7CC
	ldr r0, _0802C7C8 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #2
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	b _0802C808
	.align 2, 0
_0802C7C0: .4byte 0x0203A85C
_0802C7C4: .4byte 0x0203A3F0
_0802C7C8: .4byte 0x0203A50C
_0802C7CC:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x51
	beq _0802C800
	cmp r0, #0x51
	bgt _0802C7E4
	cmp r0, #0x50
	beq _0802C7F4
	b _0802C808
_0802C7E4:
	cmp r0, #0x52
	bne _0802C808
	ldr r0, _0802C7F0 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #4
	b _0802C806
	.align 2, 0
_0802C7F0: .4byte 0x0203A470
_0802C7F4:
	ldr r0, _0802C7FC @ =0x0203A470
	adds r0, #0x6f
	movs r1, #3
	b _0802C806
	.align 2, 0
_0802C7FC: .4byte 0x0203A470
_0802C800:
	ldr r0, _0802C818 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #2
_0802C806:
	strb r1, [r0]
_0802C808:
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C818: .4byte 0x0203A470

	thumb_func_start DoItemFortifyStaffAction
DoItemFortifyStaffAction: @ 0x0802C81C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802C890 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl MakeTargetListForRangedHeal
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetUnitItemHealAmount
	adds r6, r0, #0
	bl CountTargets
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802C880
_0802C864:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r1, r6, #0
	bl AddUnitHp
	adds r4, #1
	cmp r4, r5
	blt _0802C864
_0802C880:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C890: .4byte 0x0203A85C

	thumb_func_start ExecUnlockStaff
ExecUnlockStaff: @ 0x0802C894
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C8CC @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldr r0, _0802C8D0 @ =0x0203A470
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r2, [r4, #0x14]
	strb r2, [r0, #0x11]
	adds r3, r0, #0
	adds r3, #0x73
	strb r1, [r3]
	adds r0, #0x74
	strb r2, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C8CC: .4byte 0x0203A85C
_0802C8D0: .4byte 0x0203A470

	thumb_func_start sub_0802C8D4
sub_0802C8D4: @ 0x0802C8D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802C928 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r2, [r4, #0x15]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl MakeNewItem
	ldrb r4, [r4, #0x15]
	lsls r1, r4, #1
	adds r5, #0x1e
	adds r5, r5, r1
	strh r0, [r5]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C928: .4byte 0x0203A85C

	thumb_func_start sub_0802C92C
sub_0802C92C: @ 0x0802C92C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802C990 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_080249FC
	bl CountTargets
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0802C980
_0802C954:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r5, #1
	cmp r5, r6
	blt _0802C954
_0802C980:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C990: .4byte 0x0203A85C

	thumb_func_start sub_0802C994
sub_0802C994: @ 0x0802C994
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0802C9EC @ =0x0203A85C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl AddUnitHp
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802C9F0 @ =0x0203A50C
	ldr r1, [r1]
	ldr r4, _0802C9F4 @ =0x0203A3F0
	ldrb r2, [r4, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r4, #0x13]
	adds r4, #0x4a
	movs r0, #0x6b
	strh r0, [r4]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C9EC: .4byte 0x0203A85C
_0802C9F0: .4byte 0x0203A50C
_0802C9F4: .4byte 0x0203A3F0

	thumb_func_start sub_0802C9F8
sub_0802C9F8: @ 0x0802C9F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802CA58 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl SetUnitHp
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802CA5C @ =0x0203A50C
	ldr r1, [r1]
	ldr r5, _0802CA60 @ =0x0203A3F0
	ldrb r2, [r5, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CA58: .4byte 0x0203A85C
_0802CA5C: .4byte 0x0203A50C
_0802CA60: .4byte 0x0203A3F0

	thumb_func_start sub_0802CA64
sub_0802CA64: @ 0x0802CA64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CA9C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x31
	movs r1, #0xf
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CA9C: .4byte 0x0203A85C

	thumb_func_start sub_0802CAA0
sub_0802CAA0: @ 0x0802CAA0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CAE0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x31
	movs r1, #0x10
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0xf]
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CAE0: .4byte 0x0203A85C

	thumb_func_start ExecAntitoxinItem
ExecAntitoxinItem: @ 0x0802CAE4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CB1C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldr r0, _0802CB20 @ =0x0203A3F0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB1C: .4byte 0x0203A85C
_0802CB20: .4byte 0x0203A3F0

	thumb_func_start ExecKeyItem
ExecKeyItem: @ 0x0802CB24
	push {r4, r5, lr}
	ldr r4, _0802CBA0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl UnitUpdateUsedItem
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl StartAvailableDoorTileEvent
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl StartAvailableDoorTileEvent
	subs r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartAvailableDoorTileEvent
	adds r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartAvailableDoorTileEvent
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableChestTileEvent
	ldr r0, _0802CBA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802CB92
	movs r0, #0xb1
	bl m4aSongNumStart
_0802CB92:
	ldr r0, _0802CBA8 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CBA0: .4byte 0x0203A85C
_0802CBA4: .4byte 0x0202BBF8
_0802CBA8: .4byte 0x0203A470

	thumb_func_start sub_0802CBAC
sub_0802CBAC: @ 0x0802CBAC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	cmp r7, sb
	beq _0802CBDE
	ldr r3, _0802CC58 @ =0x0203A3F0
	ldr r1, _0802CC5C @ =0x0203A470
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
_0802CBDE:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, _0802CC58 @ =0x0203A3F0
	ldr r5, _0802CC5C @ =0x0203A470
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r6, #0
	bl UnitPromote
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r8
	cmp r0, #0
	beq _0802CC2C
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
_0802CC2C:
	cmp r7, sb
	beq _0802CC38
	adds r0, r6, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
_0802CC38:
	ldr r1, _0802CC60 @ =0x0203A4F0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x80
	strb r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #3]
	ldr r1, _0802CC64 @ =0x0203A3D8
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC58: .4byte 0x0203A3F0
_0802CC5C: .4byte 0x0203A470
_0802CC60: .4byte 0x0203A4F0
_0802CC64: .4byte 0x0203A3D8

	thumb_func_start DoItemPromoteAction
DoItemPromoteAction: @ 0x0802CC68
	push {r4, lr}
	ldr r4, _0802CC84 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	movs r2, #1
	bl sub_0802CBAC
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC84: .4byte 0x0203A85C

	thumb_func_start sub_0802CC88
sub_0802CC88: @ 0x0802CC88
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	ldr r4, _0802CD14 @ =0x0203A3F0
	ldr r5, _0802CD18 @ =0x0203A470
	adds r0, r5, #0
	adds r0, #0x4a
	movs r2, #0
	mov sb, r2
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	ldr r2, _0802CD1C @ =0x0000FFFF
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r0, r4, #0
	adds r0, #0x4a
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r6, #0
	bl UnitPromote
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	ldr r0, _0802CD20 @ =0x0203A4F0
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x80
	strb r1, [r0, #2]
	mov r2, sb
	strb r2, [r0, #3]
	ldr r1, _0802CD24 @ =0x0203A3D8
	movs r0, #0x10
	strh r0, [r1]
	bl BeginBattleAnimations
	ldr r0, [r6, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r6, #0xc]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD14: .4byte 0x0203A3F0
_0802CD18: .4byte 0x0203A470
_0802CD1C: .4byte 0x0000FFFF
_0802CD20: .4byte 0x0203A4F0
_0802CD24: .4byte 0x0203A3D8

	thumb_func_start ApplyItemStatBoost
ApplyItemStatBoost: @ 0x0802CD28
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	lsls r0, r7, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl GetItemIndex
	cmp r0, #0x88
	bne _0802CD60
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	ldr r0, _0802CD5C @ =0x00000719
	b _0802CE56
	.align 2, 0
_0802CD5C: .4byte 0x00000719
_0802CD60:
	adds r0, r6, #0
	bl GetItemBonuses
	ldrb r2, [r4, #0x12]
	ldrb r3, [r0]
	adds r1, r2, r3
	strb r1, [r4, #0x12]
	ldrb r2, [r4, #0x13]
	ldrb r3, [r0]
	adds r1, r2, r3
	strb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	ldrb r3, [r0, #1]
	adds r1, r2, r3
	strb r1, [r4, #0x14]
	ldrb r2, [r4, #0x15]
	ldrb r3, [r0, #2]
	adds r1, r2, r3
	strb r1, [r4, #0x15]
	ldrb r2, [r4, #0x16]
	ldrb r3, [r0, #3]
	adds r1, r2, r3
	strb r1, [r4, #0x16]
	ldrb r2, [r4, #0x17]
	ldrb r3, [r0, #4]
	adds r1, r2, r3
	strb r1, [r4, #0x17]
	ldrb r2, [r4, #0x18]
	ldrb r3, [r0, #5]
	adds r1, r2, r3
	strb r1, [r4, #0x18]
	ldrb r2, [r4, #0x19]
	ldrb r3, [r0, #6]
	adds r1, r2, r3
	strb r1, [r4, #0x19]
	ldrb r2, [r4, #0x1d]
	ldrb r3, [r0, #7]
	adds r1, r2, r3
	strb r1, [r4, #0x1d]
	ldrb r1, [r4, #0x1a]
	ldrb r0, [r0, #8]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x5a
	cmp r0, #8
	bhi _0802CE54
	lsls r0, r0, #2
	ldr r1, _0802CDDC @ =_0802CDE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CDDC: .4byte _0802CDE0
_0802CDE0: @ jump table
	.4byte _0802CE14 @ case 0
	.4byte _0802CE44 @ case 1
	.4byte _0802CE04 @ case 2
	.4byte _0802CE24 @ case 3
	.4byte _0802CE0C @ case 4
	.4byte _0802CE1A @ case 5
	.4byte _0802CE2C @ case 6
	.4byte _0802CE34 @ case 7
	.4byte _0802CE3C @ case 8
_0802CE04:
	ldr r5, _0802CE08 @ =0x00000711
	b _0802CE54
	.align 2, 0
_0802CE08: .4byte 0x00000711
_0802CE0C:
	ldr r5, _0802CE10 @ =0x00000713
	b _0802CE54
	.align 2, 0
_0802CE10: .4byte 0x00000713
_0802CE14:
	movs r5, #0xe3
	lsls r5, r5, #3
	b _0802CE54
_0802CE1A:
	ldr r5, _0802CE20 @ =0x00000714
	b _0802CE54
	.align 2, 0
_0802CE20: .4byte 0x00000714
_0802CE24:
	ldr r5, _0802CE28 @ =0x00000712
	b _0802CE54
	.align 2, 0
_0802CE28: .4byte 0x00000712
_0802CE2C:
	ldr r5, _0802CE30 @ =0x00000715
	b _0802CE54
	.align 2, 0
_0802CE30: .4byte 0x00000715
_0802CE34:
	ldr r5, _0802CE38 @ =0x00000716
	b _0802CE54
	.align 2, 0
_0802CE38: .4byte 0x00000716
_0802CE3C:
	ldr r5, _0802CE40 @ =0x00000717
	b _0802CE54
	.align 2, 0
_0802CE40: .4byte 0x00000717
_0802CE44:
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	ldr r5, _0802CE5C @ =0x0000070F
	cmp r0, #0
	beq _0802CE54
	adds r5, #1
_0802CE54:
	adds r0, r5, #0
_0802CE56:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802CE5C: .4byte 0x0000070F

	thumb_func_start DoItemStatBoostAction
DoItemStatBoostAction: @ 0x0802CE60
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802CEB8 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, _0802CEBC @ =0x0203A470
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl ApplyItemStatBoost
	adds r5, r0, #0
	ldr r0, _0802CEC0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802CE9A
	ldr r0, _0802CEC4 @ =0x0000037A
	bl m4aSongNumStart
_0802CE9A:
	adds r0, r6, #0
	bl GetItemIconId
	adds r4, r0, #0
	adds r0, r5, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CEB8: .4byte 0x0203A85C
_0802CEBC: .4byte 0x0203A470
_0802CEC0: .4byte 0x0202BBF8
_0802CEC4: .4byte 0x0000037A

	thumb_func_start ExecMine
ExecMine: @ 0x0802CEC8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CF04 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xb
	movs r3, #0
	bl AddTrap
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldr r0, _0802CF08 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl StartMineAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF04: .4byte 0x0203A85C
_0802CF08: .4byte 0x0203A470

	thumb_func_start ExecLightRune
ExecLightRune: @ 0x0802CF0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CF44 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	bl AddLightRune
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl StartLightRuneAnim3
	ldr r0, _0802CF48 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF44: .4byte 0x0203A85C
_0802CF48: .4byte 0x0203A470

	thumb_func_start ExecTorchStaff
ExecTorchStaff: @ 0x0802CF4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CF7C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xa
	movs r3, #8
	bl AddTrap
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF7C: .4byte 0x0203A85C

	thumb_func_start sub_0802CF80
sub_0802CF80: @ 0x0802CF80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _0802CFC0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x7d
	beq _0802CFD2
	cmp r0, #0x7d
	bgt _0802CFC4
	cmp r0, #0x7c
	beq _0802CFCE
	b _0802CFDC
	.align 2, 0
_0802CFC0: .4byte 0x0203A85C
_0802CFC4:
	cmp r0, #0x7e
	beq _0802CFD6
	cmp r0, #0x7f
	beq _0802CFDA
	b _0802CFDC
_0802CFCE:
	movs r5, #5
	b _0802CFDC
_0802CFD2:
	movs r5, #6
	b _0802CFDC
_0802CFD6:
	movs r5, #7
	b _0802CFDC
_0802CFDA:
	movs r5, #8
_0802CFDC:
	ldr r0, _0802D004 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	movs r2, #1
	bl SetUnitStatusExt
	ldr r1, _0802D008 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D004: .4byte 0x0203A85C
_0802D008: .4byte 0x0203A3D8

	thumb_func_start DoItemAction
DoItemAction: @ 0x0802D00C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802D040 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	ldr r1, _0802D044 @ =0x0203A3F0
	adds r1, #0x7e
	movs r2, #0
	strb r2, [r1]
	subs r0, #0x4a
	cmp r0, #0x50
	bls _0802D036
	b _0802D234
_0802D036:
	lsls r0, r0, #2
	ldr r1, _0802D048 @ =_0802D04C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D040: .4byte 0x0203A85C
_0802D044: .4byte 0x0203A3F0
_0802D048: .4byte _0802D04C
_0802D04C: @ jump table
	.4byte _0802D190 @ case 0
	.4byte _0802D190 @ case 1
	.4byte _0802D190 @ case 2
	.4byte _0802D190 @ case 3
	.4byte _0802D1A0 @ case 4
	.4byte _0802D1A8 @ case 5
	.4byte _0802D198 @ case 6
	.4byte _0802D198 @ case 7
	.4byte _0802D198 @ case 8
	.4byte _0802D1C0 @ case 9
	.4byte _0802D1B0 @ case 10
	.4byte _0802D226 @ case 11
	.4byte _0802D1D0 @ case 12
	.4byte _0802D1C8 @ case 13
	.4byte _0802D1B8 @ case 14
	.4byte _0802D234 @ case 15
	.4byte _0802D20E @ case 16
	.4byte _0802D20E @ case 17
	.4byte _0802D20E @ case 18
	.4byte _0802D20E @ case 19
	.4byte _0802D20E @ case 20
	.4byte _0802D20E @ case 21
	.4byte _0802D20E @ case 22
	.4byte _0802D20E @ case 23
	.4byte _0802D20E @ case 24
	.4byte _0802D208 @ case 25
	.4byte _0802D208 @ case 26
	.4byte _0802D208 @ case 27
	.4byte _0802D208 @ case 28
	.4byte _0802D208 @ case 29
	.4byte _0802D202 @ case 30
	.4byte _0802D202 @ case 31
	.4byte _0802D202 @ case 32
	.4byte _0802D1E0 @ case 33
	.4byte _0802D1EA @ case 34
	.4byte _0802D1F2 @ case 35
	.4byte _0802D1FA @ case 36
	.4byte _0802D1D8 @ case 37
	.4byte _0802D234 @ case 38
	.4byte _0802D234 @ case 39
	.4byte _0802D234 @ case 40
	.4byte _0802D234 @ case 41
	.4byte _0802D234 @ case 42
	.4byte _0802D234 @ case 43
	.4byte _0802D234 @ case 44
	.4byte _0802D234 @ case 45
	.4byte _0802D202 @ case 46
	.4byte _0802D216 @ case 47
	.4byte _0802D21E @ case 48
	.4byte _0802D234 @ case 49
	.4byte _0802D22E @ case 50
	.4byte _0802D22E @ case 51
	.4byte _0802D22E @ case 52
	.4byte _0802D22E @ case 53
	.4byte _0802D234 @ case 54
	.4byte _0802D234 @ case 55
	.4byte _0802D234 @ case 56
	.4byte _0802D234 @ case 57
	.4byte _0802D234 @ case 58
	.4byte _0802D234 @ case 59
	.4byte _0802D234 @ case 60
	.4byte _0802D208 @ case 61
	.4byte _0802D20E @ case 62
	.4byte _0802D208 @ case 63
	.4byte _0802D234 @ case 64
	.4byte _0802D208 @ case 65
	.4byte _0802D234 @ case 66
	.4byte _0802D234 @ case 67
	.4byte _0802D234 @ case 68
	.4byte _0802D234 @ case 69
	.4byte _0802D234 @ case 70
	.4byte _0802D234 @ case 71
	.4byte _0802D234 @ case 72
	.4byte _0802D234 @ case 73
	.4byte _0802D234 @ case 74
	.4byte _0802D234 @ case 75
	.4byte _0802D208 @ case 76
	.4byte _0802D234 @ case 77
	.4byte _0802D234 @ case 78
	.4byte _0802D234 @ case 79
	.4byte _0802D1E0 @ case 80
_0802D190:
	adds r0, r5, #0
	bl DoItemHealStaffAction
	b _0802D234
_0802D198:
	adds r0, r5, #0
	bl DoItemAttackStaffAction
	b _0802D234
_0802D1A0:
	adds r0, r5, #0
	bl DoItemFortifyStaffAction
	b _0802D234
_0802D1A8:
	adds r0, r5, #0
	bl DoItemRestoreStaffAction
	b _0802D234
_0802D1B0:
	adds r0, r5, #0
	bl DoItemRescueStaffAction
	b _0802D234
_0802D1B8:
	adds r0, r5, #0
	bl sub_0802C3E8
	b _0802D234
_0802D1C0:
	adds r0, r5, #0
	bl ExecWarpStaff
	b _0802D234
_0802D1C8:
	adds r0, r5, #0
	bl ExecUnlockStaff
	b _0802D234
_0802D1D0:
	adds r0, r5, #0
	bl sub_0802C8D4
	b _0802D234
_0802D1D8:
	adds r0, r5, #0
	bl sub_0802CAA0
	b _0802D234
_0802D1E0:
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0802C994
	b _0802D234
_0802D1EA:
	adds r0, r5, #0
	bl sub_0802C9F8
	b _0802D234
_0802D1F2:
	adds r0, r5, #0
	bl sub_0802CA64
	b _0802D234
_0802D1FA:
	adds r0, r5, #0
	bl ExecAntitoxinItem
	b _0802D234
_0802D202:
	bl ExecKeyItem
	b _0802D234
_0802D208:
	bl DoItemPromoteAction
	b _0802D234
_0802D20E:
	adds r0, r5, #0
	bl DoItemStatBoostAction
	b _0802D234
_0802D216:
	adds r0, r5, #0
	bl ExecMine
	b _0802D234
_0802D21E:
	adds r0, r5, #0
	bl ExecLightRune
	b _0802D234
_0802D226:
	adds r0, r5, #0
	bl ExecTorchStaff
	b _0802D234
_0802D22E:
	adds r0, r5, #0
	bl sub_0802CF80
_0802D234:
	ldr r0, _0802D250 @ =0x0203A470
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0802D24A
	ldr r0, _0802D254 @ =0x08B945E8
	adds r1, r5, #0
	bl Proc_StartBlocking
_0802D24A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D250: .4byte 0x0203A470
_0802D254: .4byte 0x08B945E8

	thumb_func_start ApplyStatusChange
ApplyStatusChange: @ 0x0802D258
	push {r4, lr}
	ldr r0, _0802D284 @ =0x0203A470
	adds r4, r0, #0
	adds r4, #0x6f
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0802D27C
	ldr r0, _0802D288 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl SetUnitStatus
	movs r0, #0xff
	strb r0, [r4]
_0802D27C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D284: .4byte 0x0203A470
_0802D288: .4byte 0x0203A85C

	thumb_func_start BmVSync_TsImgAnim
BmVSync_TsImgAnim: @ 0x0802D28C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0802D2CA
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802D2A6
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	b _0802D2CA
_0802D2A6:
	ldr r2, [r4, #0x30]
	ldrh r0, [r2]
	strh r0, [r4, #0x34]
	ldr r0, [r2, #4]
	ldr r1, _0802D2D0 @ =0x0600A000
	ldrh r2, [r2, #2]
	lsrs r2, r2, #2
	bl CpuFastSet
	ldr r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _0802D2CA
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x30]
_0802D2CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D2D0: .4byte 0x0600A000

	thumb_func_start BmVSync_TsPalAnim
BmVSync_TsPalAnim: @ 0x0802D2D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0802D318
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0802D2EE
	subs r0, r1, #1
	strh r0, [r4, #0x36]
	b _0802D318
_0802D2EE:
	ldr r3, [r4, #0x3c]
	ldrb r0, [r3, #4]
	strh r0, [r4, #0x36]
	ldr r0, [r3]
	ldrb r2, [r3, #6]
	lsls r1, r2, #1
	ldr r2, _0802D320 @ =0x02022920
	adds r1, r1, r2
	ldrb r2, [r3, #5]
	bl CpuSet
	bl EnablePalSync
	ldr r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x3c]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0802D318
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x3c]
_0802D318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D320: .4byte 0x02022920

	thumb_func_start BmVSync_AnimInit
BmVSync_AnimInit: @ 0x0802D324
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	ldr r5, _0802D360 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldr r6, _0802D364 @ =0x08C9C9C8
	ldrb r0, [r0, #9]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x30]
	str r0, [r4, #0x2c]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D360: .4byte 0x0202BBF8
_0802D364: .4byte 0x08C9C9C8

	thumb_func_start sub_0802D368
sub_0802D368: @ 0x0802D368
	push {lr}
	movs r0, #0
	bl SetOnHBlankB
	pop {r0}
	bx r0

	thumb_func_start sub_0802D374
sub_0802D374: @ 0x0802D374
	push {lr}
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start StartBmVSync
StartBmVSync: @ 0x0802D380
	push {lr}
	ldr r0, _0802D39C @ =0x08B96158
	movs r1, #0
	bl Proc_Start
	bl BmVSync_AnimInit
	bl WeatherInit
	ldr r1, _0802D3A0 @ =0x0202BBB8
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_0802D39C: .4byte 0x08B96158
_0802D3A0: .4byte 0x0202BBB8

	thumb_func_start BMapVSync_End
BMapVSync_End: @ 0x0802D3A4
	push {lr}
	ldr r0, _0802D3B0 @ =0x08B96158
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0802D3B0: .4byte 0x08B96158

	thumb_func_start LockBmDisplay
LockBmDisplay: @ 0x0802D3B4
	push {lr}
	ldr r1, _0802D3E0 @ =0x0202BBB8
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _0802D3DC
	movs r0, #0
	bl SetOnHBlankB
	ldr r1, _0802D3E4 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	movs r0, #1
	bl Proc_BlockEachMarked
_0802D3DC:
	pop {r0}
	bx r0
	.align 2, 0
_0802D3E0: .4byte 0x0202BBB8
_0802D3E4: .4byte 0x02022860

	thumb_func_start UnlockBmDisplay
UnlockBmDisplay: @ 0x0802D3E8
	push {lr}
	ldr r1, _0802D41C @ =0x0202BBB8
	ldrb r2, [r1, #2]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802D418
	subs r0, r2, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D418
	movs r0, #1
	bl Proc_UnblockEachMarked
	ldr r0, _0802D420 @ =0x08B96158
	bl Proc_Find
	cmp r0, #0
	beq _0802D418
	bl Proc_End
	bl StartBmVSync
_0802D418:
	pop {r0}
	bx r0
	.align 2, 0
_0802D41C: .4byte 0x0202BBB8
_0802D420: .4byte 0x08B96158

	thumb_func_start AllocWeatherParticles
AllocWeatherParticles: @ 0x0802D424
	push {lr}
	subs r0, #1
	cmp r0, #5
	bhi _0802D464
	lsls r0, r0, #2
	ldr r1, _0802D438 @ =_0802D43C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D438: .4byte _0802D43C
_0802D43C: @ jump table
	.4byte _0802D454 @ case 0
	.4byte _0802D454 @ case 1
	.4byte _0802D464 @ case 2
	.4byte _0802D454 @ case 3
	.4byte _0802D45C @ case 4
	.4byte _0802D454 @ case 5
_0802D454:
	movs r0, #0x20
	bl InitOam
	b _0802D46A
_0802D45C:
	movs r0, #0x10
	bl InitOam
	b _0802D46A
_0802D464:
	movs r0, #0
	bl InitOam
_0802D46A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start WeatherInit_None
WeatherInit_None: @ 0x0802D470
	push {lr}
	ldr r0, _0802D484 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r0, #0
	bl SetOnHBlankB
	pop {r0}
	bx r0
	.align 2, 0
_0802D484: .4byte 0x0202BBF8

	thumb_func_start WeatherInit_Snow
WeatherInit_Snow: @ 0x0802D488
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, sp
	ldr r0, _0802D4F0 @ =0x081C402C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, _0802D4F4 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r6, #0
	ldr r7, _0802D4F8 @ =0x081C3FCC
	ldr r5, _0802D4FC @ =0x020027DC
_0802D4A2:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #9]
	adds r4, r0, #0
	lsls r0, r4, #2
	add r0, sp
	ldr r0, [r0]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802D4A2
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4F0: .4byte 0x081C402C
_0802D4F4: .4byte 0x0202BBF8
_0802D4F8: .4byte 0x081C3FCC
_0802D4FC: .4byte 0x020027DC

	thumb_func_start WfxSnow_VSync
WfxSnow_VSync: @ 0x0802D500
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl GetOamSplice
	cmp r0, #0
	beq _0802D5AA
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D5B4 @ =0x020027DC
	adds r4, r1, r0
	mov r2, sp
	ldr r3, _0802D5B8 @ =0x0202BBB8
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _0802D532
	adds r0, #0xf
_0802D532:
	asrs r0, r0, #4
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r3, #0xe]
	strh r2, [r0, #2]
	mov r1, sp
	ldrh r0, [r3, #0xc]
	strh r0, [r1, #4]
	mov r0, sp
	strh r2, [r0, #6]
	mov r5, sp
	movs r7, #0xc
	ldrsh r1, [r3, r7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _0802D558
	adds r0, #0xf
_0802D558:
	asrs r0, r0, #4
	strh r0, [r5, #8]
	mov r0, sp
	strh r2, [r0, #0xa]
	movs r6, #0xff
	movs r5, #0x1f
_0802D564:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r7, [r4, #6]
	adds r1, r3, r7
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrb r3, [r4, #9]
	lsls r2, r3, #2
	mov r7, sp
	adds r3, r7, r2
	movs r7, #0
	ldrsh r2, [r3, r7]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r7, #2
	ldrsh r2, [r3, r7]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r3, r3, r2
	ldr r2, _0802D5BC @ =0x08B905B0
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D564
_0802D5AA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D5B4: .4byte 0x020027DC
_0802D5B8: .4byte 0x0202BBB8
_0802D5BC: .4byte 0x08B905B0

	thumb_func_start WeatherInit_Rain
WeatherInit_Rain: @ 0x0802D5C0
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802D618 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r6, #0
	ldr r7, _0802D61C @ =0x081C3FCC
	ldr r5, _0802D620 @ =0x020027DC
_0802D5D0:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	lsls r1, r4, #1
	adds r1, r1, r7
	ldrh r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802D5D0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D618: .4byte 0x0202BBF8
_0802D61C: .4byte 0x081C3FCC
_0802D620: .4byte 0x020027DC

	thumb_func_start WfxRain_VSync
WfxRain_VSync: @ 0x0802D624
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetOamSplice
	cmp r0, #0
	beq _0802D68C
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D698 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _0802D69C @ =0x0202BBB8
	movs r6, #0xff
	movs r5, #0x1f
	ldr r0, _0802D6A0 @ =0x08B96208
	mov r8, r0
_0802D64E:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r2, [r4, #6]
	adds r1, r3, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	lsls r2, r3, #2
	add r2, r8
	ldr r2, [r2]
	movs r3, #0
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D64E
_0802D68C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D698: .4byte 0x020027DC
_0802D69C: .4byte 0x0202BBB8
_0802D6A0: .4byte 0x08B96208

	thumb_func_start WeatherInit_Sandstorm
WeatherInit_Sandstorm: @ 0x0802D6A4
	push {r4, r5, r6, lr}
	ldr r0, _0802D700 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _0802D704 @ =0x08199458
	ldr r4, _0802D708 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _0802D70C @ =0x06010380
	adds r0, r4, #0
	movs r2, #4
	movs r3, #4
	bl Copy2dChr
	movs r6, #0
	ldr r4, _0802D710 @ =0x020027DC
	movs r5, #0x3f
_0802D6CA:
	bl RandNextB
	strh r0, [r4]
	bl RandNextB
	movs r1, #0xa0
	bl __umodsi3
	adds r0, #0xf0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #2]
	bl RandNextB
	movs r1, #7
	ands r0, r1
	subs r0, #0x20
	strh r0, [r4, #4]
	strh r6, [r4, #6]
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D6CA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D700: .4byte 0x0202BBF8
_0802D704: .4byte 0x08199458
_0802D708: .4byte 0x02020140
_0802D70C: .4byte 0x06010380
_0802D710: .4byte 0x020027DC

	thumb_func_start WfxSandStorm_VSync
WfxSandStorm_VSync: @ 0x0802D714
	push {r4, r5, lr}
	bl GetOamSplice
	cmp r0, #0
	beq _0802D758
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D760 @ =0x020027DC
	adds r4, r1, r0
	movs r5, #0x1f
_0802D732:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	movs r1, #0xff
	ands r0, r1
	subs r0, #0x10
	ldr r1, _0802D764 @ =0x000001FF
	ands r0, r1
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _0802D768 @ =0x08B905C0
	ldr r3, _0802D76C @ =0x0000101C
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D732
_0802D758:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D760: .4byte 0x020027DC
_0802D764: .4byte 0x000001FF
_0802D768: .4byte 0x08B905C0
_0802D76C: .4byte 0x0000101C

	thumb_func_start WeatherInit_Snowstorm
WeatherInit_Snowstorm: @ 0x0802D770
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, _0802D7DC @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _0802D7E0 @ =0x081994E0
	ldr r4, _0802D7E4 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _0802D7E8 @ =0x06010300
	adds r0, r4, #0
	movs r2, #8
	movs r3, #4
	bl Copy2dChr
	movs r6, #0
	ldr r5, _0802D7EC @ =0x020027DC
	ldr r0, _0802D7F0 @ =0x000001FF
	adds r7, r0, #0
_0802D7AC:
	movs r0, #7
	ands r0, r6
	add r0, sp
	ldrb r4, [r0]
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	bl RandNextB
	ldr r2, _0802D7F4 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _0802D7F8 @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r5, #6]
	strb r4, [r5, #8]
	cmp r4, #0
	beq _0802D7FC
	cmp r4, #1
	beq _0802D80A
	b _0802D81A
	.align 2, 0
_0802D7DC: .4byte 0x0202BBF8
_0802D7E0: .4byte 0x081994E0
_0802D7E4: .4byte 0x02020140
_0802D7E8: .4byte 0x06010300
_0802D7EC: .4byte 0x020027DC
_0802D7F0: .4byte 0x000001FF
_0802D7F4: .4byte 0x000003FF
_0802D7F8: .4byte 0xFFFFFF00
_0802D7FC:
	bl RandNextB
	ands r0, r7
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r0, r2
	b _0802D818
_0802D80A:
	bl RandNextB
	ands r0, r7
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
	adds r0, r0, r1
_0802D818:
	strh r0, [r5, #4]
_0802D81A:
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802D7AC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start WfxSnowStorm_VSync
WfxSnowStorm_VSync: @ 0x0802D82C
	push {r4, r5, r6, r7, lr}
	bl GetOamSplice
	cmp r0, #0
	beq _0802D88C
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D894 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _0802D898 @ =0x0202BBB8
	movs r6, #0xff
	movs r5, #0x1f
_0802D84E:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r2, [r4, #6]
	adds r1, r3, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r2, [r4, #8]
	lsls r3, r2, #2
	ldr r2, _0802D89C @ =0x00001018
	adds r3, r3, r2
	ldr r2, _0802D8A0 @ =0x08B905C0
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D84E
_0802D88C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D894: .4byte 0x020027DC
_0802D898: .4byte 0x0202BBB8
_0802D89C: .4byte 0x00001018
_0802D8A0: .4byte 0x08B905C0

	thumb_func_start WfxBlueHSync
WfxBlueHSync: @ 0x0802D8A4
	ldr r0, _0802D8D8 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _0802D8B4
	movs r3, #0
_0802D8B4:
	ldr r0, _0802D8DC @ =0x0202BBB8
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0802D8E0 @ =0x0000013F
	cmp r3, r0
	bls _0802D8E4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	b _0802D8F2
	.align 2, 0
_0802D8D8: .4byte 0x04000006
_0802D8DC: .4byte 0x0202BBB8
_0802D8E0: .4byte 0x0000013F
_0802D8E4:
	movs r2, #0xa0
	lsls r2, r2, #0x13
	lsls r0, r3, #1
	ldr r1, _0802D8F4 @ =0x02002ADC
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0802D8F2:
	bx lr
	.align 2, 0
_0802D8F4: .4byte 0x02002ADC

	thumb_func_start WeatherInit_Blue
WeatherInit_Blue: @ 0x0802D8F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0802D930 @ =0x02002ADC
	movs r4, #0
	ldr r0, _0802D934 @ =WfxBlueHSync
	mov r8, r0
	movs r7, #0x1f
	ldr r6, _0802D938 @ =0x0000013F
_0802D90A:
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	subs r0, r7, r0
	lsls r0, r0, #0xa
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r6
	ble _0802D90A
	mov r0, r8
	bl SetOnHBlankB
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D930: .4byte 0x02002ADC
_0802D934: .4byte WfxBlueHSync
_0802D938: .4byte 0x0000013F

	thumb_func_start nullsub_9
nullsub_9: @ 0x0802D93C
	bx lr
	.align 2, 0

	thumb_func_start FlamesWeatherHBlank
FlamesWeatherHBlank: @ 0x0802D940
	push {lr}
	ldr r0, _0802D978 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5f
	bls _0802D972
	cmp r0, #0x9f
	bhi _0802D972
	adds r2, r0, #0
	subs r2, #0x60
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _0802D97C @ =0x02002ADC
	lsls r1, r2, #4
	adds r0, r1, r0
	movs r1, #7
	ands r1, r2
	lsls r1, r1, #4
	ldr r2, _0802D980 @ =0x050000E0
	adds r1, r1, r2
	movs r2, #2
	bl CpuFastSet
_0802D972:
	pop {r0}
	bx r0
	.align 2, 0
_0802D978: .4byte 0x04000006
_0802D97C: .4byte 0x02002ADC
_0802D980: .4byte 0x050000E0

	thumb_func_start ApplyFlamesWeatherGradient
ApplyFlamesWeatherGradient: @ 0x0802D984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _0802D9FC @ =0x02022860
	mov sl, r0
	movs r6, #0x1f
	ldr r3, _0802DA00 @ =0x02002ADC
	mov sb, r3
_0802D99A:
	movs r2, #0
	adds r0, r1, #7
	adds r3, r1, #1
	mov r8, r3
	lsls r0, r0, #4
	mov ip, r0
	lsls r7, r1, #4
_0802D9A8:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r5, r2, #1
	adds r2, r7, r2
	lsls r2, r2, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r4, r0, r1
	add r2, sb
	movs r1, #7
_0802D9CE:
	adds r3, #2
	cmp r3, #0x1f
	ble _0802D9D6
	movs r3, #0x1f
_0802D9D6:
	adds r0, r4, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0802D9CE
	adds r2, r5, #0
	cmp r2, #0xf
	ble _0802D9A8
	mov r1, r8
	cmp r1, #3
	ble _0802D99A
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D9FC: .4byte 0x02022860
_0802DA00: .4byte 0x02002ADC

	thumb_func_start FlamesWeatherInitGradient
FlamesWeatherInitGradient: @ 0x0802DA04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl UnpackChapterMapPalette
	movs r1, #0
	ldr r0, _0802DA88 @ =0x02022860
	mov sl, r0
	movs r6, #0x1f
	ldr r3, _0802DA8C @ =0x02002ADC
	mov sb, r3
_0802DA1E:
	movs r2, #0
	adds r0, r1, #7
	adds r3, r1, #1
	mov r8, r3
	lsls r0, r0, #4
	mov ip, r0
	lsls r7, r1, #4
_0802DA2C:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r5, r2, #1
	adds r2, r7, r2
	lsls r2, r2, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r4, r0, r1
	add r2, sb
	movs r1, #7
_0802DA52:
	adds r3, #2
	cmp r3, #0x1f
	ble _0802DA5A
	movs r3, #0x1f
_0802DA5A:
	adds r0, r4, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0802DA52
	adds r2, r5, #0
	cmp r2, #0xf
	ble _0802DA2C
	mov r1, r8
	cmp r1, #3
	ble _0802DA1E
	ldr r0, _0802DA90 @ =FlamesWeatherHBlank
	bl SetOnHBlankB
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA88: .4byte 0x02022860
_0802DA8C: .4byte 0x02002ADC
_0802DA90: .4byte FlamesWeatherHBlank

	thumb_func_start FlamesWeatherInitParticles
FlamesWeatherInitParticles: @ 0x0802DA94
	push {r4, r5, r6, lr}
	ldr r0, _0802DAE0 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _0802DAE4 @ =0x08199578
	ldr r1, _0802DAE8 @ =0x06010300
	bl Decompress
	ldr r0, _0802DAEC @ =0x081995B8
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _0802DAF0 @ =0x081C3FCC
	ldr r4, _0802DAF4 @ =0x020027DC
	movs r6, #0xf
_0802DAB8:
	bl RandNextB
	strh r0, [r4]
	bl RandNextB
	strh r0, [r4, #2]
	ldrh r1, [r5]
	rsbs r0, r1, #0
	strh r0, [r4, #4]
	ldrh r1, [r5, #2]
	rsbs r0, r1, #0
	strh r0, [r4, #6]
	adds r5, #6
	adds r4, #0xc
	subs r6, #1
	cmp r6, #0
	bge _0802DAB8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DAE0: .4byte 0x0202BBF8
_0802DAE4: .4byte 0x08199578
_0802DAE8: .4byte 0x06010300
_0802DAEC: .4byte 0x081995B8
_0802DAF0: .4byte 0x081C3FCC
_0802DAF4: .4byte 0x020027DC

	thumb_func_start WeatherInit_Flames
WeatherInit_Flames: @ 0x0802DAF8
	push {lr}
	bl FlamesWeatherInitGradient
	bl FlamesWeatherInitParticles
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start WfxFlamesUpdateGradient
WfxFlamesUpdateGradient: @ 0x0802DB08
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802DB68 @ =0x02022940
	ldr r1, _0802DB6C @ =0x050000E0
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r5, #0xc
	subs r4, #0xe0
	mov ip, r4
	movs r6, #0x1f
	ldr r7, _0802DB70 @ =0x02002ADC
_0802DB20:
	adds r0, r5, #0
	adds r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r2, r5, #0
	adds r2, #0x20
	adds r4, r5, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r5, r0, r1
	lsls r2, r2, #1
	adds r2, r2, r7
	movs r1, #7
_0802DB48:
	adds r3, #2
	cmp r3, #0x1f
	ble _0802DB50
	movs r3, #0x1f
_0802DB50:
	adds r0, r5, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0802DB48
	adds r5, r4, #0
	cmp r5, #0xf
	ble _0802DB20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB68: .4byte 0x02022940
_0802DB6C: .4byte 0x050000E0
_0802DB70: .4byte 0x02002ADC

	thumb_func_start WfxFlamesUpdateParticles
WfxFlamesUpdateParticles: @ 0x0802DB74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0802DC00 @ =0x020027DC
	bl GetOamSplice
	cmp r0, #0
	beq _0802DBF4
	ldr r0, _0802DC04 @ =0x0202BBB8
	mov r8, r0
	movs r1, #0xff
	mov sb, r1
	movs r6, #0xf
_0802DB90:
	ldrh r2, [r4]
	ldrh r3, [r4, #4]
	adds r5, r2, r3
	strh r5, [r4]
	ldrh r7, [r4, #2]
	ldrh r1, [r4, #6]
	adds r0, r7, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	mov r2, r8
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r2, r0, r1
	mov r7, sb
	ands r2, r7
	cmp r2, #0x3f
	ble _0802DBEC
	cmp r2, #0xa0
	bgt _0802DBEC
	adds r1, r2, #0
	subs r1, #0x40
	cmp r1, #0
	bge _0802DBC2
	adds r1, #7
_0802DBC2:
	asrs r1, r1, #3
	movs r0, #0x1f
	subs r3, r0, r1
	cmp r3, #0x17
	bgt _0802DBCE
	movs r3, #0x18
_0802DBCE:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x18
	mov r5, r8
	movs r7, #0xc
	ldrsh r1, [r5, r7]
	subs r0, r0, r1
	mov r1, sb
	ands r0, r1
	movs r5, #0xa0
	lsls r5, r5, #8
	adds r3, r3, r5
	adds r1, r2, #0
	ldr r2, _0802DC08 @ =0x08B905B0
	bl PutOamLoRam
_0802DBEC:
	subs r6, #1
	adds r4, #0xc
	cmp r6, #0
	bge _0802DB90
_0802DBF4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DC00: .4byte 0x020027DC
_0802DC04: .4byte 0x0202BBB8
_0802DC08: .4byte 0x08B905B0

	thumb_func_start WfxFlames_VSync
WfxFlames_VSync: @ 0x0802DC0C
	push {lr}
	bl WfxFlamesUpdateGradient
	bl WfxFlamesUpdateParticles
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start WfxCloudsOffsetGraphicsEffect
WfxCloudsOffsetGraphicsEffect: @ 0x0802DC1C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0xd0
	lsls r0, r0, #1
	adds r2, r5, r0
	mov r1, sp
	movs r3, #7
_0802DC2C:
	ldm r2!, {r0}
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _0802DC2C
	movs r0, #0xd
	adds r6, r5, #0
	subs r6, #0x20
_0802DC3C:
	subs r4, r0, #1
	lsls r0, r0, #5
	adds r2, r0, r6
	movs r3, #7
_0802DC44:
	ldr r1, [r2, #0x20]
	lsls r1, r1, #4
	ldr r0, [r2]
	lsrs r0, r0, #0x1c
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _0802DC44
	adds r0, r4, #0
	cmp r0, #0
	bge _0802DC3C
	movs r6, #0x10
	rsbs r6, r6, #0
	adds r2, r5, #0
	mov r4, sp
	movs r3, #7
_0802DC68:
	ldr r1, [r2]
	ands r1, r6
	str r1, [r2]
	ldm r4!, {r0}
	lsrs r0, r0, #0x1c
	orrs r1, r0
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bge _0802DC68
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start WeatherInit_Clouds
WeatherInit_Clouds: @ 0x0802DC84
	push {lr}
	movs r0, #0
	bl AllocWeatherParticles
	ldr r0, _0802DCA4 @ =0x081995F8
	ldr r1, _0802DCA8 @ =0x020027DC
	bl Decompress
	ldr r0, _0802DCAC @ =0x08199B14
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0802DCA4: .4byte 0x081995F8
_0802DCA8: .4byte 0x020027DC
_0802DCAC: .4byte 0x08199B14

	thumb_func_start WfxClouds_VSync
WfxClouds_VSync: @ 0x0802DCB0
	push {r4, lr}
	ldr r4, _0802DCCC @ =0x020027DC
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #7
	ands r1, r0
	cmp r1, #7
	bhi _0802DD20
	lsls r0, r1, #2
	ldr r1, _0802DCD0 @ =_0802DCD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DCCC: .4byte 0x020027DC
_0802DCD0: .4byte _0802DCD4
_0802DCD4: @ jump table
	.4byte _0802DCF4 @ case 0
	.4byte _0802DD20 @ case 1
	.4byte _0802DCFC @ case 2
	.4byte _0802DD20 @ case 3
	.4byte _0802DD02 @ case 4
	.4byte _0802DD20 @ case 5
	.4byte _0802DD08 @ case 6
	.4byte _0802DD14 @ case 7
_0802DCF4:
	adds r0, r4, #0
	bl WfxCloudsOffsetGraphicsEffect
	b _0802DD20
_0802DCFC:
	movs r1, #0xe0
	lsls r1, r1, #1
	b _0802DD0C
_0802DD02:
	movs r1, #0xe0
	lsls r1, r1, #2
	b _0802DD0C
_0802DD08:
	movs r1, #0xa8
	lsls r1, r1, #3
_0802DD0C:
	adds r0, r4, r1
	bl WfxCloudsOffsetGraphicsEffect
	b _0802DD20
_0802DD14:
	ldr r1, _0802DD28 @ =0x06010240
	adds r0, r4, #0
	movs r2, #0xe
	movs r3, #4
	bl Copy2dChr
_0802DD20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD28: .4byte 0x06010240

	thumb_func_start WfxClouds_Update
WfxClouds_Update: @ 0x0802DD2C
	push {lr}
	sub sp, #4
	ldr r0, _0802DD54 @ =0x0202BBB8
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	movs r1, #5
	bl __divsi3
	adds r2, r0, #0
	rsbs r2, r2, #0
	ldr r3, _0802DD58 @ =0x08B96214
	ldr r0, _0802DD5C @ =0x0000AC12
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802DD54: .4byte 0x0202BBB8
_0802DD58: .4byte 0x08B96214
_0802DD5C: .4byte 0x0000AC12

	thumb_func_start WeatherInit
WeatherInit: @ 0x0802DD60
	push {lr}
	ldr r0, _0802DD74 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bhi _0802DDCA
	lsls r0, r0, #2
	ldr r1, _0802DD78 @ =_0802DD7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DD74: .4byte 0x0202BBF8
_0802DD78: .4byte _0802DD7C
_0802DD7C: @ jump table
	.4byte _0802DD9C @ case 0
	.4byte _0802DDA2 @ case 1
	.4byte _0802DDAE @ case 2
	.4byte _0802DDBA @ case 3
	.4byte _0802DDB4 @ case 4
	.4byte _0802DDC0 @ case 5
	.4byte _0802DDA8 @ case 6
	.4byte _0802DDC6 @ case 7
_0802DD9C:
	bl WeatherInit_None
	b _0802DDCA
_0802DDA2:
	bl WeatherInit_Snow
	b _0802DDCA
_0802DDA8:
	bl WeatherInit_Sandstorm
	b _0802DDCA
_0802DDAE:
	bl WeatherInit_Snowstorm
	b _0802DDCA
_0802DDB4:
	bl WeatherInit_Rain
	b _0802DDCA
_0802DDBA:
	bl WeatherInit_Blue
	b _0802DDCA
_0802DDC0:
	bl WeatherInit_Flames
	b _0802DDCA
_0802DDC6:
	bl WeatherInit_Clouds
_0802DDCA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start WfxVSync
WfxVSync: @ 0x0802DDD0
	push {lr}
	ldr r0, _0802DDE8 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	subs r0, #1
	cmp r0, #6
	bhi _0802DE34
	lsls r0, r0, #2
	ldr r1, _0802DDEC @ =_0802DDF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DDE8: .4byte 0x0202BBF8
_0802DDEC: .4byte _0802DDF0
_0802DDF0: @ jump table
	.4byte _0802DE0C @ case 0
	.4byte _0802DE18 @ case 1
	.4byte _0802DE24 @ case 2
	.4byte _0802DE1E @ case 3
	.4byte _0802DE2A @ case 4
	.4byte _0802DE12 @ case 5
	.4byte _0802DE30 @ case 6
_0802DE0C:
	bl WfxSnow_VSync
	b _0802DE34
_0802DE12:
	bl WfxSandStorm_VSync
	b _0802DE34
_0802DE18:
	bl WfxSnowStorm_VSync
	b _0802DE34
_0802DE1E:
	bl WfxRain_VSync
	b _0802DE34
_0802DE24:
	bl nullsub_9
	b _0802DE34
_0802DE2A:
	bl WfxFlames_VSync
	b _0802DE34
_0802DE30:
	bl WfxClouds_VSync
_0802DE34:
	pop {r0}
	bx r0

	thumb_func_start WfxUpdate
WfxUpdate: @ 0x0802DE38
	push {lr}
	ldr r0, _0802DE4C @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _0802DE46
	bl WfxClouds_Update
_0802DE46:
	pop {r0}
	bx r0
	.align 2, 0
_0802DE4C: .4byte 0x0202BBF8

	thumb_func_start DisableTilesetPalAnim
DisableTilesetPalAnim: @ 0x0802DE50
	push {lr}
	ldr r0, _0802DE68 @ =0x08B96158
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _0802DE62
	movs r0, #0
	str r0, [r1, #0x38]
_0802DE62:
	pop {r0}
	bx r0
	.align 2, 0
_0802DE68: .4byte 0x08B96158

	thumb_func_start EnableTilesetPalAnim
EnableTilesetPalAnim: @ 0x0802DE6C
	push {r4, lr}
	ldr r0, _0802DE9C @ =0x08B96158
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0802DE94
	ldr r0, _0802DEA0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldr r1, _0802DEA4 @ =0x08C9C9C8
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_0802DE94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE9C: .4byte 0x08B96158
_0802DEA0: .4byte 0x0202BBF8
_0802DEA4: .4byte 0x08C9C9C8

	thumb_func_start SetWeather
SetWeather: @ 0x0802DEA8
	push {lr}
	ldr r1, _0802DEBC @ =0x0202BBF8
	strb r0, [r1, #0x15]
	bl AllocWeatherParticles
	bl WeatherInit
	pop {r0}
	bx r0
	.align 2, 0
_0802DEBC: .4byte 0x0202BBF8

	thumb_func_start GetTextPrintDelay
GetTextPrintDelay: @ 0x0802DEC0
	push {lr}
	sub sp, #4
	ldr r1, _0802DEE4 @ =0x081C4038
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _0802DEE8 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r0, [r0]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0802DEE4: .4byte 0x081C4038
_0802DEE8: .4byte 0x0202BBF8

	thumb_func_start IsFirstPlaythrough
IsFirstPlaythrough: @ 0x0802DEEC
	push {lr}
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802DEFC
	movs r0, #1
	b _0802DF1A
_0802DEFC:
	ldr r1, _0802DF14 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0802DF18
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	b _0802DF1A
	.align 2, 0
_0802DF14: .4byte 0x0202BBF8
_0802DF18:
	movs r0, #0
_0802DF1A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start InitPlayConfig
InitPlayConfig: @ 0x0802DF20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r7, _0802DFEC @ =0x0202BBF8
	ldr r2, _0802DFF0 @ =0x01000024
	adds r1, r7, #0
	bl CpuSet
	strb r4, [r7, #0xe]
	cmp r5, #0
	beq _0802DF4C
	movs r0, #0x40
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
_0802DF4C:
	movs r3, #0x42
	adds r3, r3, r7
	mov ip, r3
	movs r4, #7
	rsbs r4, r4, #0
	adds r3, r4, #0
	mov r5, ip
	ldrb r5, [r5]
	ands r3, r5
	movs r6, #3
	rsbs r6, r6, #0
	mov r8, r6
	mov r2, r8
	ldr r0, _0802DFF4 @ =0x0202BC38
	ldrb r0, [r0]
	ands r2, r0
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r2, r1
	movs r5, #0x11
	rsbs r5, r5, #0
	ands r2, r5
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r5, #0x7f
	ands r2, r5
	movs r6, #0x41
	adds r6, r6, r7
	mov sl, r6
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
	mov r1, sb
	ldrb r6, [r6]
	ands r1, r6
	mov r0, r8
	ands r1, r0
	movs r6, #0xd
	rsbs r6, r6, #0
	ands r1, r6
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	ands r1, r5
	adds r0, #0x28
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	ldr r0, _0802DFF8 @ =0xFFFFFE7F
	mov r3, ip
	ldrh r3, [r3]
	ands r0, r3
	mov r5, ip
	strh r0, [r5]
	adds r0, r7, #0
	adds r0, #0x43
	ldrb r6, [r0]
	ands r4, r6
	strb r4, [r0]
	mov r0, sb
	ands r2, r0
	ldr r3, _0802DFF4 @ =0x0202BC38
	strb r2, [r3]
	movs r5, #0x11
	rsbs r5, r5, #0
	ands r1, r5
	mov r6, sl
	strb r1, [r6]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DFEC: .4byte 0x0202BBF8
_0802DFF0: .4byte 0x01000024
_0802DFF4: .4byte 0x0202BC38
_0802DFF8: .4byte 0xFFFFFE7F

	thumb_func_start ResetBmSt
ResetBmSt: @ 0x0802DFFC
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _0802E020 @ =0x0202BBB8
	movs r5, #1
	ldrsb r5, [r4, r5]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0802E024 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E020: .4byte 0x0202BBB8
_0802E024: .4byte 0x01000020

	thumb_func_start StartBattleMap
StartBattleMap: @ 0x0802E028
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl InitBgs
	ldr r0, _0802E0DC @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E0E0 @ =OnVBlank
	bl SetOnVBlank
	bl ResetBmSt
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetChapterFlags
	bl ResetUnitSprites
	bl InitTraps
	ldr r4, _0802E0E4 @ =0x0202BBF8
	movs r5, #0
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r6, #0
	strh r5, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	bl InitBmBgLayers
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl InitMapObstacles
	bl GetGameTime
	str r0, [r4, #4]
	strh r5, [r4, #0x16]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl LoadChapterTraps
	mov r0, r8
	bl StartMapMain
	ldr r0, _0802E0E8 @ =0x02022860
	strh r5, [r0]
	bl EnablePalSync
	ldr r2, _0802E0EC @ =0x030028AC
	ldr r0, _0802E0F0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	strb r6, [r2, #8]
	strb r6, [r2, #9]
	movs r0, #0x10
	strb r0, [r2, #0xa]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E0DC: .4byte OnMain
_0802E0E0: .4byte OnVBlank
_0802E0E4: .4byte 0x0202BBF8
_0802E0E8: .4byte 0x02022860
_0802E0EC: .4byte 0x030028AC
_0802E0F0: .4byte 0x0000FFE0

	thumb_func_start RestartBattleMap
RestartBattleMap: @ 0x0802E0F4
	push {r4, r5, lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _0802E178 @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E17C @ =OnVBlank
	bl SetOnVBlank
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl InitTraps
	ldr r4, _0802E180 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	movs r5, #0
	strb r0, [r4, #0x15]
	bl InitBmBgLayers
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl InitMapObstacles
	bl LoadChapterTraps
	bl BMapVSync_End
	bl StartBmVSync
	ldr r0, _0802E184 @ =0x08B961A8
	movs r1, #4
	bl Proc_Start
	ldr r0, _0802E188 @ =0x02022860
	strh r5, [r0]
	bl EnablePalSync
	ldr r2, _0802E18C @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E178: .4byte OnMain
_0802E17C: .4byte OnVBlank
_0802E180: .4byte 0x0202BBF8
_0802E184: .4byte 0x08B961A8
_0802E188: .4byte 0x02022860
_0802E18C: .4byte 0x03002870

	thumb_func_start sub_0802E190
sub_0802E190: @ 0x0802E190
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r0, _0802E204 @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E208 @ =OnVBlank
	bl SetOnVBlank
	bl ResetBmSt
	ldr r4, _0802E20C @ =0x0202BBF8
	ldrb r0, [r4, #0x12]
	ldrb r1, [r4, #0x13]
	bl SetMapCursorPosition
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	ldr r4, _0802E210 @ =0x0202BBB8
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl StartMapMain
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	ldr r0, _0802E214 @ =0x0203A85C
	ldrb r0, [r0, #0x16]
	cmp r0, #9
	bhi _0802E26A
	lsls r0, r0, #2
	ldr r1, _0802E218 @ =_0802E21C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E204: .4byte OnMain
_0802E208: .4byte OnVBlank
_0802E20C: .4byte 0x0202BBF8
_0802E210: .4byte 0x0202BBB8
_0802E214: .4byte 0x0203A85C
_0802E218: .4byte _0802E21C
_0802E21C: @ jump table
	.4byte _0802E24C @ case 0
	.4byte _0802E244 @ case 1
	.4byte _0802E24C @ case 2
	.4byte _0802E254 @ case 3
	.4byte _0802E25C @ case 4
	.4byte _0802E26A @ case 5
	.4byte _0802E26A @ case 6
	.4byte _0802E26A @ case 7
	.4byte _0802E26A @ case 8
	.4byte _0802E264 @ case 9
_0802E244:
	adds r0, r5, #0
	bl ResumeMapMainDuringAction
	b _0802E26A
_0802E24C:
	adds r0, r5, #0
	bl ResumeMapMainDuringPhase
	b _0802E26A
_0802E254:
	adds r0, r5, #0
	bl ResumeMapMainDuringBerserk
	b _0802E26A
_0802E25C:
	adds r0, r5, #0
	bl ResumeMapMainDuringArena
	b _0802E26A
_0802E264:
	adds r0, r5, #0
	bl ResumeMapMainDuringPhaseChange
_0802E26A:
	ldr r2, _0802E294 @ =0x030028AC
	ldr r0, _0802E298 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	movs r0, #0x10
	strb r0, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E294: .4byte 0x030028AC
_0802E298: .4byte 0x0000FFE0

	thumb_func_start RefreshBMapDisplay_FromBattle
RefreshBMapDisplay_FromBattle: @ 0x0802E29C
	push {lr}
	ldr r0, _0802E304 @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E308 @ =OnVBlank
	bl SetOnVBlank
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ClearUi
	ldr r3, _0802E30C @ =0x03002870
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
	movs r0, #0
	bl SetBlankChr
	ldr r0, _0802E310 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0802E304: .4byte OnMain
_0802E308: .4byte OnVBlank
_0802E30C: .4byte 0x03002870
_0802E310: .4byte 0x02023C60

	thumb_func_start BMapDispResume_FromBattleDelayed
BMapDispResume_FromBattleDelayed: @ 0x0802E314
	push {lr}
	bl ApplySystemObjectsGraphics
	ldr r0, _0802E330 @ =0x0203A3F0
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	ldr r0, _0802E334 @ =0x08B96284
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802E330: .4byte 0x0203A3F0
_0802E334: .4byte 0x08B96284

	thumb_func_start InitMoreBMapGraphics
InitMoreBMapGraphics: @ 0x0802E338
	push {r4, lr}
	ldr r4, _0802E364 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl RenderMap
	bl RefreshUnitSprites
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	bl InitSystemTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E364: .4byte 0x0202BBF8

	thumb_func_start RefreshBMapGraphics
RefreshBMapGraphics: @ 0x0802E368
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	bl InitMoreBMapGraphics
	pop {r0}
	bx r0

	thumb_func_start StartMapMain
StartMapMain: @ 0x0802E37C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802E3A8 @ =0x08B92AF8
	movs r1, #2
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x54]
	adds r4, #0x28
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl StartBmVSync
	ldr r0, _0802E3AC @ =0x08B961A8
	movs r1, #4
	bl Proc_Start
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802E3A8: .4byte 0x08B92AF8
_0802E3AC: .4byte 0x08B961A8

	thumb_func_start EndMapMain
EndMapMain: @ 0x0802E3B0
	push {lr}
	movs r0, #1
	bl Proc_EndEachMarked
	ldr r0, _0802E3D0 @ =0x08B92AF8
	bl Proc_Find
	ldr r1, [r0, #0x54]
	adds r1, #0x28
	ldrb r2, [r1]
	subs r2, #1
	strb r2, [r1]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0802E3D0: .4byte 0x08B92AF8

	thumb_func_start CleanupUnitsBeforeChapter
CleanupUnitsBeforeChapter: @ 0x0802E3D4
	push {r4, r5, r6, r7, lr}
	movs r4, #0x41
_0802E3D8:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0802E3F0
	ldr r0, [r1]
	cmp r0, #0
	beq _0802E3F0
	adds r0, r1, #0
	bl ClearUnit
_0802E3F0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0802E3D8
	ldr r0, _0802E46C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	beq _0802E474
	movs r6, #1
_0802E400:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E464
	ldr r0, [r4]
	cmp r0, #0
	beq _0802E464
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	movs r5, #0
	strb r5, [r0]
	ldr r3, [r4, #0xc]
	ldr r0, _0802E470 @ =0x0631E004
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E454
	movs r0, #5
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
_0802E454:
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	strb r5, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
_0802E464:
	adds r6, #1
	cmp r6, #0x3f
	ble _0802E400
	b _0802E4E6
	.align 2, 0
_0802E46C: .4byte 0x0202BBF8
_0802E470: .4byte 0x0631E004
_0802E474:
	movs r6, #1
_0802E476:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E4E0
	ldr r0, [r4]
	cmp r0, #0
	beq _0802E4E0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r5, #0
	movs r7, #1
	strb r7, [r4, #0x11]
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r5, [r0]
	ldr r3, [r4, #0xc]
	ldr r0, _0802E4F8 @ =0x0631E00C
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E4D2
	movs r0, #5
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
_0802E4D2:
	ldr r0, [r4, #0xc]
	orrs r0, r7
	str r0, [r4, #0xc]
	strb r5, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
_0802E4E0:
	adds r6, #1
	cmp r6, #0x3f
	ble _0802E476
_0802E4E6:
	ldr r1, _0802E4FC @ =0x0202BBF8
	movs r0, #0xef
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E4F8: .4byte 0x0631E00C
_0802E4FC: .4byte 0x0202BBF8

	thumb_func_start ResumeMapMainDuringPhase
ResumeMapMainDuringPhase: @ 0x0802E500
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802E538 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E538: .4byte 0x03002870

	thumb_func_start ResumeMapMainDuringAction
ResumeMapMainDuringAction: @ 0x0802E53C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802E5AC @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	ldr r4, _0802E5B0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r5, _0802E5B4 @ =0x03004690
	str r0, [r5]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r2, _0802E5B8 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl HideUnitSprite
	ldr r0, [r5]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E5AC: .4byte 0x03002870
_0802E5B0: .4byte 0x0203A85C
_0802E5B4: .4byte 0x03004690
_0802E5B8: .4byte 0x0202E3DC

	thumb_func_start ResumeMapMainDuringBerserk
ResumeMapMainDuringBerserk: @ 0x0802E5BC
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802E5F4 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E5F4: .4byte 0x03002870

	thumb_func_start ResumeMapMainDuringArena
ResumeMapMainDuringArena: @ 0x0802E5F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0802E664 @ =0x0203A85C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldr r4, _0802E668 @ =0x03004690
	str r0, [r4]
	bl ArenaResume
	ldr r0, [r4]
	bl BattleGenerateArena
	bl BeginBattleAnimations
	ldr r2, _0802E66C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl RefreshEntityMaps
	ldr r0, _0802E670 @ =0x0202E3DC
	ldr r1, [r0]
	ldrb r2, [r5, #0xf]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r5, [r5, #0xe]
	adds r0, r5, r0
	movs r1, #0
	strb r1, [r0]
	bl RefreshUnitSprites
	adds r0, r6, #0
	movs r1, #8
	bl Proc_Goto
	bl sub_080B26A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E664: .4byte 0x0203A85C
_0802E668: .4byte 0x03004690
_0802E66C: .4byte 0x03002870
_0802E670: .4byte 0x0202E3DC

	thumb_func_start ResumeMapMainDuringPhaseChange
ResumeMapMainDuringPhaseChange: @ 0x0802E674
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802E6AC @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E6AC: .4byte 0x03002870

	thumb_func_start sub_0802E6B0
sub_0802E6B0: @ 0x0802E6B0
	push {r4, lr}
	ldr r4, _0802E6D0 @ =0x0202BBF8
	adds r0, r4, #0
	bl RegisterChapterStats
	bl ComputeChapterRankings
	bl SaveEndgameRankings
	movs r0, #0x20
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E6D0: .4byte 0x0202BBF8

	thumb_func_start sub_0802E6D4
sub_0802E6D4: @ 0x0802E6D4
	push {lr}
	movs r0, #2
	bl SetNextGameAction
	bl WriteCompletedPlaythroughSaveData
	pop {r0}
	bx r0

	thumb_func_start GetTacticianName
GetTacticianName: @ 0x0802E6E4
	ldr r0, _0802E6E8 @ =0x0202BC18
	bx lr
	.align 2, 0
_0802E6E8: .4byte 0x0202BC18

	thumb_func_start SetTacticianName
SetTacticianName: @ 0x0802E6EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802E6FC @ =0x0202BC18
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_0802E6FC: .4byte 0x0202BC18

	thumb_func_start GetConvoyItemArray
GetConvoyItemArray: @ 0x0802E700
	ldr r0, _0802E704 @ =0x0203A720
	bx lr
	.align 2, 0
_0802E704: .4byte 0x0203A720

	thumb_func_start ClearSupplyItems
ClearSupplyItems: @ 0x0802E708
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0802E724 @ =0x0203A720
	ldr r2, _0802E728 @ =0x01000064
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802E724: .4byte 0x0203A720
_0802E728: .4byte 0x01000064

	thumb_func_start ShrinkConvoyItemList
ShrinkConvoyItemList: @ 0x0802E72C
	push {r4, r5, r6, lr}
	ldr r6, _0802E76C @ =0x02020140
	adds r4, r6, #0
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r5, #0
_0802E73A:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0802E744
	strh r0, [r4]
	adds r4, #2
_0802E744:
	adds r1, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x63
	bls _0802E73A
	movs r0, #0
	strh r0, [r4]
	bl ClearSupplyItems
	bl GetConvoyItemArray
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E76C: .4byte 0x02020140

	thumb_func_start GetConvoyItemCount
GetConvoyItemCount: @ 0x0802E770
	movs r3, #0
	ldr r2, _0802E78C @ =0x0203A720
	movs r1, #0x63
_0802E776:
	ldrh r0, [r2]
	cmp r0, #0
	beq _0802E77E
	adds r3, #1
_0802E77E:
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0802E776
	adds r0, r3, #0
	bx lr
	.align 2, 0
_0802E78C: .4byte 0x0203A720

	thumb_func_start AddItemToConvoy
AddItemToConvoy: @ 0x0802E790
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0802E7AC @ =0x0202BBB8
	movs r0, #0
	strh r0, [r1, #0x2e]
	movs r3, #0
	ldr r2, _0802E7B0 @ =0x0203A720
_0802E79E:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0802E7B4
	strh r4, [r2]
	adds r0, r3, #0
	b _0802E7C2
	.align 2, 0
_0802E7AC: .4byte 0x0202BBB8
_0802E7B0: .4byte 0x0203A720
_0802E7B4:
	adds r2, #2
	adds r3, #1
	cmp r3, #0x63
	ble _0802E79E
	strh r4, [r1, #0x2e]
	movs r0, #1
	rsbs r0, r0, #0
_0802E7C2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start RemoveItemFromConvoy
RemoveItemFromConvoy: @ 0x0802E7C8
	push {lr}
	ldr r1, _0802E7DC @ =0x0203A720
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	bl ShrinkConvoyItemList
	pop {r0}
	bx r0
	.align 2, 0
_0802E7DC: .4byte 0x0203A720

	thumb_func_start GetConvoyItemSlot
GetConvoyItemSlot: @ 0x0802E7E0
	push {r4, r5, lr}
	adds r2, r0, #0
	bl GetItemIndex
	adds r2, r0, #0
	movs r1, #0
	movs r4, #0xff
	ldr r3, _0802E800 @ =0x0203A720
_0802E7F0:
	adds r0, r4, #0
	ldrh r5, [r3]
	ands r0, r5
	cmp r2, r0
	bne _0802E804
	adds r0, r1, #0
	b _0802E810
	.align 2, 0
_0802E800: .4byte 0x0203A720
_0802E804:
	adds r3, #2
	adds r1, #1
	cmp r1, #0x63
	ble _0802E7F0
	movs r0, #1
	rsbs r0, r0, #0
_0802E810:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HasConvoyAccess
HasConvoyAccess: @ 0x0802E818
	push {r4, lr}
	movs r4, #1
_0802E81C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802E854
	ldr r3, [r2]
	cmp r3, #0
	beq _0802E854
	ldr r0, [r2, #0xc]
	ldr r1, _0802E850 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0802E854
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E854
	movs r0, #1
	b _0802E85C
	.align 2, 0
_0802E850: .4byte 0x0001000C
_0802E854:
	adds r4, #1
	cmp r4, #0x3f
	ble _0802E81C
	movs r0, #0
_0802E85C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802E864
sub_0802E864: @ 0x0802E864
	push {r4, lr}
	ldr r4, _0802E888 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0802E87A
	movs r1, #1
_0802E87A:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0802E88C
	movs r0, #1
	b _0802E88E
	.align 2, 0
_0802E888: .4byte 0x0202BBF8
_0802E88C:
	movs r0, #0
_0802E88E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetSupplyUnit
GetSupplyUnit: @ 0x0802E894
	push {r4, lr}
	movs r4, #1
_0802E898:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802E8C0
	ldr r1, [r2]
	cmp r1, #0
	beq _0802E8C0
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E8C0
	adds r0, r2, #0
	b _0802E8C8
_0802E8C0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0802E898
	movs r0, #0
_0802E8C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start InitUnitStack
InitUnitStack: @ 0x0802E8D0
	ldr r2, _0802E8E0 @ =0x0203A7E8
	ldr r1, _0802E8E4 @ =0x0203A7EC
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0802E8E8 @ =0x0203A7F0
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E8E0: .4byte 0x0203A7E8
_0802E8E4: .4byte 0x0203A7EC
_0802E8E8: .4byte 0x0203A7F0

	thumb_func_start PushUnit
PushUnit: @ 0x0802E8EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802E918 @ =0x0203A7EC
	ldr r1, [r4]
	movs r5, #0
	str r5, [r1]
	bl CopyUnit
	ldr r2, [r4]
	ldr r1, _0802E91C @ =0x0203A7F0
	ldrb r0, [r1]
	strb r0, [r2, #0xb]
	strb r5, [r6, #0x12]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x48
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E918: .4byte 0x0203A7EC
_0802E91C: .4byte 0x0203A7F0

	thumb_func_start LoadPlayerUnitsFromUnitStack
LoadPlayerUnitsFromUnitStack: @ 0x0802E920
	push {r4, r5, lr}
	ldr r5, _0802E954 @ =0x0202BD50
	movs r4, #0x3d
_0802E926:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge _0802E926
	ldr r0, _0802E958 @ =0x0203A7E8
	ldr r0, [r0]
	ldr r1, _0802E954 @ =0x0202BD50
	ldr r2, _0802E95C @ =0x0203A7EC
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E954: .4byte 0x0202BD50
_0802E958: .4byte 0x0203A7E8
_0802E95C: .4byte 0x0203A7EC

	thumb_func_start LoadPlayerUnitsFromUnitStack2
LoadPlayerUnitsFromUnitStack2: @ 0x0802E960
	push {r4, r5, lr}
	ldr r5, _0802E994 @ =0x0202BD50
	movs r4, #0x3d
_0802E966:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge _0802E966
	ldr r0, _0802E998 @ =0x0203A7E8
	ldr r0, [r0]
	ldr r1, _0802E994 @ =0x0202BD50
	ldr r2, _0802E99C @ =0x0203A7EC
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E994: .4byte 0x0202BD50
_0802E998: .4byte 0x0203A7E8
_0802E99C: .4byte 0x0203A7EC

	thumb_func_start ArenaBeginInternal
ArenaBeginInternal: @ 0x0802E9A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0802EA04 @ =0x0203A7F4
	str r4, [r5]
	ldr r0, _0802EA08 @ =0x0203A814
	str r0, [r5, #4]
	ldr r2, _0802EA0C @ =0x03002850
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	bl GetUnitBestWRankType
	strb r0, [r5, #0xd]
	ldrb r0, [r5, #0xd]
	bl ArenaGenerateOpposingClassId
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x10]
	bl GetClassData
	bl GetClassBestWRankType
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #0xd]
	bl IsWeaponMagic
	strb r0, [r5, #0x13]
	ldrb r0, [r5, #0xe]
	bl IsWeaponMagic
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #8]
	strb r0, [r5, #0x11]
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _0802EA10
	ldrb r0, [r5, #0x11]
	bl ArenaGetOpposingLevel
	b _0802EA18
	.align 2, 0
_0802EA04: .4byte 0x0203A7F4
_0802EA08: .4byte 0x0203A814
_0802EA0C: .4byte 0x03002850
_0802EA10:
	ldrb r0, [r5, #0x11]
	bl ArenaGetOpposingLevel
	adds r0, #7
_0802EA18:
	strb r0, [r5, #0x12]
	bl ArenaGenerateOpponentUnit
	bl ArenaGenerateBaseWeapons
	movs r4, #0
	b _0802EA28
_0802EA26:
	adds r4, #1
_0802EA28:
	cmp r4, #9
	bgt _0802EA36
	bl ArenaAdjustOpponentPowerRanking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EA26
_0802EA36:
	movs r4, #0
	b _0802EA3C
_0802EA3A:
	adds r4, #1
_0802EA3C:
	cmp r4, #4
	bgt _0802EA4A
	bl ArenaAdjustOpponentDamage
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EA3A
_0802EA4A:
	ldr r4, _0802EA7C @ =0x0203A7F4
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl ArenaGetPowerRanking
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl ArenaGetPowerRanking
	strh r0, [r4, #0x18]
	bl ArenaGenerateMatchupGoldValue
	movs r0, #1
	strb r0, [r4, #0xb]
	movs r0, #0
	bl ArenaSetResult
	bl ArenaSetFallbackWeaponsMaybe
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA7C: .4byte 0x0203A7F4

	thumb_func_start ArenaBegin
ArenaBegin: @ 0x0802EA80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802EA98 @ =0x0203A862
	bl RandGetSt
	adds r0, r4, #0
	bl ArenaBeginInternal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA98: .4byte 0x0203A862

	thumb_func_start ArenaResume
ArenaResume: @ 0x0802EA9C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802EABC @ =0x0203A862
	adds r0, r4, #0
	bl RandSetSt
	adds r0, r5, #0
	bl ArenaBeginInternal
	subs r4, #6
	adds r0, r4, #0
	bl RandSetSt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EABC: .4byte 0x0203A862

	thumb_func_start GetUnitBestWRankType
GetUnitBestWRankType: @ 0x0802EAC0
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x28
_0802EACE:
	cmp r1, #4
	beq _0802EADE
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802EADE
	adds r2, r0, #0
	adds r3, r1, #0
_0802EADE:
	adds r1, #1
	cmp r1, #7
	ble _0802EACE
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetClassBestWRankType
GetClassBestWRankType: @ 0x0802EAEC
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x2c
_0802EAFA:
	cmp r1, #4
	beq _0802EB0A
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802EB0A
	adds r2, r0, #0
	adds r3, r1, #0
_0802EB0A:
	adds r1, #1
	cmp r1, #7
	ble _0802EAFA
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ArenaGenerateOpposingClassId
ArenaGenerateOpposingClassId: @ 0x0802EB18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	mov r8, r6
	cmp r0, #7
	bhi _0802EB6C
	lsls r0, r0, #2
	ldr r1, _0802EB30 @ =_0802EB34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EB30: .4byte _0802EB34
_0802EB34: @ jump table
	.4byte _0802EB54 @ case 0
	.4byte _0802EB54 @ case 1
	.4byte _0802EB54 @ case 2
	.4byte _0802EB5C @ case 3
	.4byte _0802EB6C @ case 4
	.4byte _0802EB68 @ case 5
	.4byte _0802EB68 @ case 6
	.4byte _0802EB68 @ case 7
_0802EB54:
	ldr r0, _0802EB58 @ =0x08B9629C
	b _0802EB6A
	.align 2, 0
_0802EB58: .4byte 0x08B9629C
_0802EB5C:
	ldr r1, _0802EB64 @ =0x08B962ED
	mov r8, r1
	b _0802EB6C
	.align 2, 0
_0802EB64: .4byte 0x08B962ED
_0802EB68:
	ldr r0, _0802EBB4 @ =0x08B962C2
_0802EB6A:
	mov r8, r0
_0802EB6C:
	ldr r0, _0802EBB8 @ =0x0203A7F4
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r5, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r5, r0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r5, r0
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802EBA6
	mov r4, r8
_0802EB8A:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _0802EB9E
	adds r6, #1
_0802EB9E:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802EB8A
_0802EBA6:
	adds r0, r6, #0
	bl RandNext
	adds r7, r0, #0
	movs r6, #0
	mov r4, r8
	b _0802EBC0
	.align 2, 0
_0802EBB4: .4byte 0x08B962C2
_0802EBB8: .4byte 0x0203A7F4
_0802EBBC:
	adds r6, #1
_0802EBBE:
	adds r4, #1
_0802EBC0:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _0802EBBE
	cmp r6, r7
	bne _0802EBBC
	ldrb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start IsWeaponMagic
IsWeaponMagic: @ 0x0802EBE4
	cmp r0, #0
	blt _0802EBFA
	cmp r0, #3
	bgt _0802EBF0
	movs r0, #0
	b _0802EBFA
_0802EBF0:
	cmp r0, #7
	bgt _0802EBFA
	cmp r0, #5
	blt _0802EBFA
	movs r0, #1
_0802EBFA:
	bx lr

	thumb_func_start ArenaGetOpposingLevel
ArenaGetOpposingLevel: @ 0x0802EBFC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #9
	bl RandNext
	adds r4, r4, r0
	subs r0, r4, #4
	cmp r0, #0
	bgt _0802EC10
	movs r0, #1
_0802EC10:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ArenaGetPowerRanking
ArenaGetPowerRanking: @ 0x0802EC18
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0x12
	ldrsb r5, [r4, r5]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r5
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	adds r2, r2, r0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	adds r0, r0, r2
	lsls r5, r0, #1
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [r4]
	ldrb r2, [r2, #0x13]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r0, r2
	adds r5, r5, r0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0802EC5C
	adds r0, r4, #0
	bl GetUnitResistance
	b _0802EC62
_0802EC5C:
	adds r0, r4, #0
	bl GetUnitDefense
_0802EC62:
	lsls r0, r0, #1
	adds r5, r5, r0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802EC80
	adds r0, r4, #0
	bl GetUnitPower
	adds r5, r5, r0
_0802EC80:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start ArenaGenerateOpponentUnit
ArenaGenerateOpponentUnit: @ 0x0802EC88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0802ED04 @ =0x0203A814
	mov r1, sp
	movs r2, #0
	movs r0, #0xfb
	strb r0, [r1]
	ldr r5, _0802ED08 @ =0x0203A7F4
	ldrb r0, [r5, #0x10]
	strb r0, [r1, #1]
	mov r3, sp
	ldrb r0, [r3, #3]
	movs r1, #7
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #3]
	mov r4, sp
	ldrb r5, [r5, #0x12]
	lsls r3, r5, #3
	movs r0, #7
	ands r0, r1
	orrs r0, r3
	strb r0, [r4, #3]
	mov r3, sp
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #3]
	mov r0, sp
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	adds r0, r6, #0
	bl ClearUnit
	movs r0, #0x80
	strb r0, [r6, #0xb]
	adds r0, r6, #0
	mov r1, sp
	bl UnitInitFromDefinition
	ldr r1, [r6]
	adds r0, r6, #0
	bl UnitLoadStatsFromChracter
	movs r4, #8
	ldrsb r4, [r6, r4]
	ldr r1, _0802ED0C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0802ED10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	b _0802ED16
	.align 2, 0
_0802ED04: .4byte 0x0203A814
_0802ED08: .4byte 0x0203A7F4
_0802ED0C: .4byte 0x0202BBF8
_0802ED10:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
_0802ED16:
	movs r1, #0xa
	bl __divsi3
	strb r0, [r6, #8]
	adds r0, r6, #0
	bl UnitAutolevel
	strb r4, [r6, #8]
	movs r2, #0
	adds r3, r6, #0
	adds r3, #0x28
	movs r4, #0xb5
_0802ED2E:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802ED38
	strb r4, [r1]
_0802ED38:
	adds r2, #1
	cmp r2, #7
	ble _0802ED2E
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bgt _0802ED4A
	movs r0, #1
	strb r0, [r6, #8]
_0802ED4A:
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0x14
	ble _0802ED56
	movs r0, #0x14
	strb r0, [r6, #8]
_0802ED56:
	adds r0, r6, #0
	bl UnitCheckStatCaps
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r6, #0
	bl SetUnitHp
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArenaGenerateBaseWeapons
ArenaGenerateBaseWeapons: @ 0x0802ED74
	push {r4, lr}
	sub sp, #8
	ldr r1, _0802EDBC @ =0x081C403C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r4, _0802EDC0 @ =0x0203A7F4
	ldrb r0, [r4, #0xd]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1a]
	ldrb r0, [r4, #0xe]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bne _0802EDAA
	movs r0, #2
	strb r0, [r4, #0xc]
_0802EDAA:
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	bne _0802EDB4
	movs r0, #2
	strb r0, [r4, #0xc]
_0802EDB4:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EDBC: .4byte 0x081C403C
_0802EDC0: .4byte 0x0203A7F4

	thumb_func_start ArenaGetUpgradedWeapon
ArenaGetUpgradedWeapon: @ 0x0802EDC4
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _0802EDDC @ =0x081C4044
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	mov r4, sp
	b _0802EE04
	.align 2, 0
_0802EDDC: .4byte 0x081C4044
_0802EDE0:
	adds r0, r5, #0
	bl GetItemIndex
	ldrb r1, [r4]
	cmp r0, r1
	bne _0802EE02
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802EDFE
	bl MakeNewItem
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0802EE0A
_0802EDFE:
	adds r0, r5, #0
	b _0802EE0A
_0802EE02:
	adds r4, #1
_0802EE04:
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _0802EDE0
_0802EE0A:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ArenaAdjustOpponentDamage
ArenaAdjustOpponentDamage: @ 0x0802EE14
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0802EE3C @ =0x0203A7F4
	ldr r0, [r4]
	bl GetUnitPower
	ldr r5, _0802EE40 @ =0x0203A3F0
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802EE44
	ldr r0, [r4]
	bl GetUnitResistance
	b _0802EE4A
	.align 2, 0
_0802EE3C: .4byte 0x0203A7F4
_0802EE40: .4byte 0x0203A3F0
_0802EE44:
	ldr r0, [r4]
	bl GetUnitDefense
_0802EE4A:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r4, _0802EE74 @ =0x0203A7F4
	ldr r0, [r4, #4]
	bl GetUnitPower
	ldr r5, _0802EE78 @ =0x0203A470
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802EE7C
	ldr r0, [r4, #4]
	bl GetUnitResistance
	b _0802EE82
	.align 2, 0
_0802EE74: .4byte 0x0203A7F4
_0802EE78: .4byte 0x0203A470
_0802EE7C:
	ldr r0, [r4, #4]
	bl GetUnitDefense
_0802EE82:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r0, _0802EED0 @ =0x0203A3F0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _0802EED4 @ =0x0203A470
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _0802EED8 @ =0x0203A7F4
	ldr r0, [r5, #4]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _0802EF02
	movs r6, #1
	movs r2, #0x13
	ldrsb r2, [r5, r2]
	cmp r2, #0
	beq _0802EEDC
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x18]
	subs r1, #4
	strb r1, [r0, #0x18]
	ldr r1, [r5, #4]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802EEF0
	movs r0, #0
	strb r0, [r1, #0x18]
	b _0802EEF0
	.align 2, 0
_0802EED0: .4byte 0x0203A3F0
_0802EED4: .4byte 0x0203A470
_0802EED8: .4byte 0x0203A7F4
_0802EEDC:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x17]
	subs r1, #4
	strb r1, [r0, #0x17]
	ldr r1, [r5, #4]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802EEF0
	strb r2, [r1, #0x17]
_0802EEF0:
	ldr r2, _0802EF50 @ =0x0203A7F4
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #1
	strb r0, [r1, #0x15]
_0802EF02:
	ldr r0, _0802EF54 @ =0x0203A470
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _0802EF58 @ =0x0203A3F0
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _0802EF50 @ =0x0203A7F4
	ldr r0, [r5]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _0802EF48
	movs r6, #1
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x14]
	adds r0, #3
	strb r0, [r1, #0x14]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #2
	strb r0, [r1, #0x16]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #2
	strb r0, [r1, #0x15]
	ldrh r0, [r5, #0x1c]
	bl ArenaGetUpgradedWeapon
	strh r0, [r5, #0x1c]
_0802EF48:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802EF50: .4byte 0x0203A7F4
_0802EF54: .4byte 0x0203A470
_0802EF58: .4byte 0x0203A3F0

	thumb_func_start ArenaAdjustOpponentPowerRanking
ArenaAdjustOpponentPowerRanking: @ 0x0802EF5C
	push {r4, r5, r6, lr}
	ldr r4, _0802EF88 @ =0x0203A7F4
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl ArenaGetPowerRanking
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl ArenaGetPowerRanking
	strh r0, [r4, #0x18]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	cmp r1, r0
	bls _0802EF8C
	ldrh r1, [r4, #0x16]
	b _0802EF8E
	.align 2, 0
_0802EF88: .4byte 0x0203A7F4
_0802EF8C:
	ldrh r1, [r4, #0x18]
_0802EF8E:
	ldr r6, _0802EFAC @ =0x0203A7F4
	ldrh r4, [r6, #0x16]
	ldrh r5, [r6, #0x18]
	subs r2, r4, r5
	cmp r2, #0
	bge _0802EF9C
	subs r2, r5, r4
_0802EF9C:
	movs r0, #0x64
	muls r0, r2, r0
	bl __divsi3
	cmp r0, #0x14
	bgt _0802EFB0
	movs r0, #0
	b _0802F0A6
	.align 2, 0
_0802EFAC: .4byte 0x0203A7F4
_0802EFB0:
	cmp r4, r5
	bhs _0802F02C
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFCC
	subs r0, r2, #1
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	subs r0, #1
	strb r0, [r1, #0x13]
_0802EFCC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFDC
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_0802EFDC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFEC
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_0802EFEC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFFC
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_0802EFFC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F00C
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_0802F00C:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F01C
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_0802F01C:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F0A4
	subs r0, r2, #1
	b _0802F0A2
_0802F02C:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0x4f
	bgt _0802F044
	adds r0, r2, #2
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	adds r0, #2
	strb r0, [r1, #0x13]
_0802F044:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F054
	adds r0, r2, #1
	strb r0, [r1, #0x14]
_0802F054:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F064
	adds r0, r2, #1
	strb r0, [r1, #0x15]
_0802F064:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F074
	adds r0, r2, #1
	strb r0, [r1, #0x16]
_0802F074:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F084
	adds r0, r2, #1
	strb r0, [r1, #0x17]
_0802F084:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F094
	adds r0, r2, #1
	strb r0, [r1, #0x18]
_0802F094:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F0A4
	adds r0, r2, #1
_0802F0A2:
	strb r0, [r1, #0x19]
_0802F0A4:
	movs r0, #1
_0802F0A6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start ArenaGenerateMatchupGoldValue
ArenaGenerateMatchupGoldValue: @ 0x0802F0AC
	ldr r2, _0802F0D0 @ =0x0203A7F4
	ldrh r1, [r2, #0x18]
	ldrh r3, [r2, #0x16]
	subs r0, r1, r3
	lsrs r1, r0, #0x1f
	adds r1, r0, r1
	asrs r1, r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bgt _0802F0CC
	movs r0, #1
_0802F0CC:
	strh r0, [r2, #8]
	bx lr
	.align 2, 0
_0802F0D0: .4byte 0x0203A7F4

	thumb_func_start ArenaGetMatchupGoldValue
ArenaGetMatchupGoldValue: @ 0x0802F0D4
	ldr r0, _0802F0DC @ =0x0203A7F4
	movs r1, #8
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0802F0DC: .4byte 0x0203A7F4

	thumb_func_start ArenaGetResult
ArenaGetResult: @ 0x0802F0E0
	ldr r0, _0802F0E8 @ =0x0203A7F4
	ldrb r0, [r0, #0xa]
	bx lr
	.align 2, 0
_0802F0E8: .4byte 0x0203A7F4

	thumb_func_start ArenaSetResult
ArenaSetResult: @ 0x0802F0EC
	ldr r1, _0802F0F4 @ =0x0203A7F4
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_0802F0F4: .4byte 0x0203A7F4

	thumb_func_start ArenaContinueBattle
ArenaContinueBattle: @ 0x0802F0F8
	push {r4, r5, lr}
	ldr r0, _0802F144 @ =0x0202BBB8
	adds r0, #0x3c
	ldrb r5, [r0]
	ldr r1, _0802F148 @ =0x0203A85C
	ldr r4, _0802F14C @ =0x0203A470
	ldrb r0, [r4, #0x13]
	strb r0, [r1, #0x15]
	movs r0, #4
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	bl BattleUnwind
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802F122
	bl BattleApplyExpGains
_0802F122:
	ldr r0, _0802F150 @ =0x0203A7F4
	ldr r0, [r0]
	ldr r1, _0802F154 @ =0x0203A3F0
	bl UpdateUnitDuringBattle
	cmp r5, #0
	beq _0802F138
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802F13C
_0802F138:
	bl PidStatsRecordBattleRes
_0802F13C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F144: .4byte 0x0202BBB8
_0802F148: .4byte 0x0203A85C
_0802F14C: .4byte 0x0203A470
_0802F150: .4byte 0x0203A7F4
_0802F154: .4byte 0x0203A3F0

	thumb_func_start ArenaIsUnitAllowed
ArenaIsUnitAllowed: @ 0x0802F158
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0802F178
	adds r0, r2, #0
	bl GetUnitBestWRankType
	cmp r0, #0
	blt _0802F178
	movs r0, #1
	b _0802F17A
_0802F178:
	movs r0, #0
_0802F17A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ArenaSetFallbackWeaponForUnit
ArenaSetFallbackWeaponForUnit: @ 0x0802F180
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0802F1C0 @ =0x081C403C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802F1CA
	movs r1, #0
	ldr r2, [r5, #4]
_0802F1A4:
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F1C4
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4]
	b _0802F1CA
	.align 2, 0
_0802F1C0: .4byte 0x081C403C
_0802F1C4:
	adds r1, #1
	cmp r1, #7
	ble _0802F1A4
_0802F1CA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArenaSetFallbackWeaponsMaybe
ArenaSetFallbackWeaponsMaybe: @ 0x0802F1D4
	push {r4, lr}
	ldr r4, _0802F1F4 @ =0x0203A7F4
	ldr r0, [r4]
	adds r1, r4, #0
	adds r1, #0x1a
	bl ArenaSetFallbackWeaponForUnit
	ldr r0, [r4, #4]
	adds r4, #0x1c
	adds r1, r4, #0
	bl ArenaSetFallbackWeaponForUnit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F1F4: .4byte 0x0203A7F4

	thumb_func_start sub_0802F1F8
sub_0802F1F8: @ 0x0802F1F8
	push {lr}
	ldr r0, _0802F204 @ =0x0203A85C
	bl RandGetSt
	pop {r0}
	bx r0
	.align 2, 0
_0802F204: .4byte 0x0203A85C

	thumb_func_start sub_0802F208
sub_0802F208: @ 0x0802F208
	push {lr}
	ldr r0, _0802F214 @ =0x0203A85C
	bl RandSetSt
	pop {r0}
	bx r0
	.align 2, 0
_0802F214: .4byte 0x0203A85C

	thumb_func_start DoAction
DoAction: @ 0x0802F218
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F23C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, _0802F240 @ =0x03004690
	str r0, [r1]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	cmp r0, #0x1a
	bhi _0802F31E
	lsls r0, r0, #2
	ldr r1, _0802F244 @ =_0802F248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802F23C: .4byte 0x0203A85C
_0802F240: .4byte 0x03004690
_0802F244: .4byte _0802F248
_0802F248: @ jump table
	.4byte _0802F2B4 @ case 0
	.4byte _0802F2E0 @ case 1
	.4byte _0802F314 @ case 2
	.4byte _0802F2E8 @ case 3
	.4byte _0802F31E @ case 4
	.4byte _0802F300 @ case 5
	.4byte _0802F2C8 @ case 6
	.4byte _0802F2D0 @ case 7
	.4byte _0802F31E @ case 8
	.4byte _0802F31E @ case 9
	.4byte _0802F31E @ case 10
	.4byte _0802F2F0 @ case 11
	.4byte _0802F2F8 @ case 12
	.4byte _0802F2D8 @ case 13
	.4byte _0802F2D8 @ case 14
	.4byte _0802F314 @ case 15
	.4byte _0802F31E @ case 16
	.4byte _0802F314 @ case 17
	.4byte _0802F31E @ case 18
	.4byte _0802F31E @ case 19
	.4byte _0802F31E @ case 20
	.4byte _0802F308 @ case 21
	.4byte _0802F314 @ case 22
	.4byte _0802F31E @ case 23
	.4byte _0802F31E @ case 24
	.4byte _0802F31E @ case 25
	.4byte _0802F2B4 @ case 26
_0802F2B4:
	ldr r0, _0802F2C4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	b _0802F31E
	.align 2, 0
_0802F2C4: .4byte 0x03004690
_0802F2C8:
	adds r0, r5, #0
	bl DoRescueAction
	b _0802F30E
_0802F2D0:
	adds r0, r5, #0
	bl DoRescueDropAction
	b _0802F30E
_0802F2D8:
	adds r0, r5, #0
	bl ActionVisitAndSeize
	b _0802F30E
_0802F2E0:
	adds r0, r5, #0
	bl sub_0802F460
	b _0802F30E
_0802F2E8:
	adds r0, r5, #0
	bl ActionDance
	b _0802F30E
_0802F2F0:
	adds r0, r5, #0
	bl ActionTalk
	b _0802F30E
_0802F2F8:
	adds r0, r5, #0
	bl ActionSupport
	b _0802F30E
_0802F300:
	adds r0, r5, #0
	bl sub_0802F5E8
	b _0802F30E
_0802F308:
	adds r0, r5, #0
	bl ActionArena
_0802F30E:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802F320
_0802F314:
	adds r0, r5, #0
	bl DoItemAction
	movs r0, #0
	b _0802F320
_0802F31E:
	movs r0, #1
_0802F320:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DoRescueAction
DoRescueAction: @ 0x0802F328
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F378 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r4, r0, #0
	bl TryRemoveUnitFromBallista
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Make6CKOIDO
	adds r0, r5, #0
	adds r1, r4, #0
	bl UnitRescue
	adds r0, r4, #0
	bl HideUnitSprite
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F378: .4byte 0x0203A85C

	thumb_func_start AfterDrop_CheckTrapAfterDropMaybe
AfterDrop_CheckTrapAfterDropMaybe: @ 0x0802F37C
	push {lr}
	ldr r1, [r0, #0x54]
	bl ExecTrapAfterDropAction
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0802F38C
sub_0802F38C: @ 0x0802F38C
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DoRescueDropAction
DoRescueDropAction: @ 0x0802F3A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F40C @ =0x0203A85C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _0802F410 @ =0x0202E3F0
	ldr r1, [r0]
	ldrb r2, [r4, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x13]
	adds r1, r0, r1
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802F418
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	adds r3, r6, #0
	bl Make6CKOIDO
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	bl UnitDrop
	ldr r0, _0802F414 @ =0x08B96310
	adds r1, r6, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x54]
	b _0802F426
	.align 2, 0
_0802F40C: .4byte 0x0203A85C
_0802F410: .4byte 0x0202E3F0
_0802F414: .4byte 0x08B96310
_0802F418:
	ldr r0, _0802F430 @ =0x02033E00
	movs r1, #0xa
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	bl SetAutoMuMoveScript
_0802F426:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F430: .4byte 0x02033E00

	thumb_func_start ActionVisitAndSeize
ActionVisitAndSeize: @ 0x0802F434
	push {r4, r5, lr}
	ldr r5, _0802F45C @ =0x0203A85C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl StartAvailableTileEvent
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F45C: .4byte 0x0203A85C

	thumb_func_start sub_0802F460
sub_0802F460: @ 0x0802F460
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0802F48C @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _0802F476
	bl InitObstacleBattleUnit
_0802F476:
	ldrb r0, [r5, #0x12]
	cmp r0, #8
	bne _0802F490
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl BattleGenerateBallistaReal
	b _0802F49C
	.align 2, 0
_0802F48C: .4byte 0x0203A85C
_0802F490:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl BattleGenerateReal
_0802F49C:
	ldr r0, _0802F4AC @ =0x08B96360
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F4AC: .4byte 0x08B96360

	thumb_func_start ActionArena
ActionArena: @ 0x0802F4B0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802F4C0 @ =0x08B963C8
	bl Proc_StartBlocking
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802F4C0: .4byte 0x08B963C8

	thumb_func_start ActionDance
ActionDance: @ 0x0802F4C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F508 @ =0x0203A85C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, _0802F50C @ =0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldr r1, _0802F510 @ =0x0203A3D8
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	bl BattleApplyMiscAction
	bl BeginBattleAnimations
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F508: .4byte 0x0203A85C
_0802F50C: .4byte 0xFFFFFBBD
_0802F510: .4byte 0x0203A3D8

	thumb_func_start ActionTalk
ActionTalk: @ 0x0802F514
	push {r4, r5, lr}
	ldr r4, _0802F53C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r0, [r0]
	ldrb r5, [r0, #4]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl StartCharacterEvent
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F53C: .4byte 0x0203A85C

	thumb_func_start ActionSupport
ActionSupport: @ 0x0802F540
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802F5E0 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0802F5E4 @ =0x03004690
	mov sb, r0
	ldr r0, [r0]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl GetUnitSupportNumByPid
	adds r7, r0, #0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetUnitSupportNumByPid
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl CanUnitSupportNow
	mov r2, sb
	ldr r0, [r2]
	adds r1, r7, #0
	bl UnitGainSupportLevel
	adds r0, r4, #0
	mov r1, r8
	bl UnitGainSupportLevel
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r6, [r1, #4]
	ldr r1, [r4]
	ldrb r5, [r1, #4]
	adds r1, r7, #0
	bl GetUnitSupportLevel
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl StartSupportTalk
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r4, #0x32
	add r4, r8
	ldrb r1, [r4]
	cmp r0, r1
	beq _0802F5D0
	cmp r0, r1
	ble _0802F5C2
	strb r0, [r4]
_0802F5C2:
	cmp r0, r1
	bge _0802F5D0
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	strb r1, [r0]
_0802F5D0:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F5E0: .4byte 0x0203A85C
_0802F5E4: .4byte 0x03004690

	thumb_func_start sub_0802F5E8
sub_0802F5E8: @ 0x0802F5E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F684 @ =0x0203A85C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0802F618
	ldrb r4, [r4, #0x12]
	adds r0, r5, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _0802F618
	ldr r0, [r5, #0xc]
	ldr r1, _0802F688 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r5, #0xc]
_0802F618:
	ldr r5, _0802F684 @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	ldrb r2, [r5, #0x12]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl UnitAddItem
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleInitItemEffect
	ldr r4, _0802F68C @ =0x0203A470
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl InitBattleUnit
	adds r4, #0x48
	strh r6, [r4]
	adds r0, r7, #0
	bl BattleApplyMiscAction
	bl EndAllMus
	bl sub_0806F0DC
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F684: .4byte 0x0203A85C
_0802F688: .4byte 0xFFFFEFFF
_0802F68C: .4byte 0x0203A470

	thumb_func_start sub_0802F690
sub_0802F690: @ 0x0802F690
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r7, r6, #0
	adds r7, #0x46
	movs r4, #0
	ldrsh r3, [r7, r4]
	adds r5, r6, #0
	adds r5, #0x48
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	mov r8, r0
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r4, #0
	ldrsh r3, [r7, r4]
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r2, r0, #0
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r2, r2, r0
	adds r3, r6, #0
	adds r3, #0x42
	ldrh r4, [r1]
	ldrh r0, [r3]
	adds r4, r4, r0
	strh r4, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r1, [r3]
	ldrh r0, [r0]
	adds r0, r1, r0
	strh r0, [r3]
	ldr r1, _0802F734 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	mov r3, r8
	subs r4, r3, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r3, [r6, #0x2c]
	movs r0, #7
	adds r1, r4, #0
	bl PutUnitSprite
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	ldrh r5, [r5]
	lsls r1, r5, #0x10
	cmp r0, r1
	bne _0802F728
	adds r0, r6, #0
	bl Proc_Break
_0802F728:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F734: .4byte 0x0202BBB8

	thumb_func_start DeathDropSpriteAnim_ExecAnyTrap
DeathDropSpriteAnim_ExecAnyTrap: @ 0x0802F738
	push {lr}
	ldr r1, [r0, #0x2c]
	bl ExecTrapAfterDeathDrop
	pop {r0}
	bx r0

	thumb_func_start sub_0802F744
sub_0802F744: @ 0x0802F744
	push {lr}
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DropRescueOnDeath
DropRescueOnDeath: @ 0x0802F754
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r6, r0, #0
	cmp r6, #0
	bne _0802F7F6
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802F7F6
	ldr r0, _0802F7FC @ =0x08B96338
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, r5, #0
	bl UnitGetDeathDropLocation
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r0, r5, #0
	bl UnitDrop
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	adds r0, r4, #0
	adds r0, #0x40
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldr r0, _0802F800 @ =0x0000FFFB
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r1, #4
	movs r0, #0xb
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSMSId
	bl UseUnitSprite
	bl ForceSyncUnitSpriteSheet
	ldr r0, _0802F804 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802F7F6
	movs r0, #0xac
	bl m4aSongNumStart
_0802F7F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F7FC: .4byte 0x08B96338
_0802F800: .4byte 0x0000FFFB
_0802F804: .4byte 0x0202BBF8

	thumb_func_start KillUnitOnCombatDeath
KillUnitOnCombatDeath: @ 0x0802F808
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802F830
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	cmp r1, #0x86
	beq _0802F830
	ldrb r0, [r0, #4]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	movs r2, #2
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl UnitKill
_0802F830:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KillUnitOnArenaDeathMaybe
KillUnitOnArenaDeathMaybe: @ 0x0802F838
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802F856
	adds r0, r4, #0
	bl UnitKill
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #6
	bl PidStatsRecordDefeatInfo
_0802F856:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802F85C
sub_0802F85C: @ 0x0802F85C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802F890 @ =0x0203A3D8
	movs r0, #0x80
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802F884
	ldr r0, _0802F894 @ =0x0203A3F0
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802F88C
	ldr r0, _0802F898 @ =0x0203A470
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802F88C
_0802F884:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_0802F88C:
	pop {r0}
	bx r0
	.align 2, 0
_0802F890: .4byte 0x0203A3D8
_0802F894: .4byte 0x0203A3F0
_0802F898: .4byte 0x0203A470

	thumb_func_start DidUnitDie
DidUnitDie: @ 0x0802F89C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802F8B4
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x86
	beq _0802F8B4
	movs r0, #1
	b _0802F8B6
_0802F8B4:
	movs r0, #0
_0802F8B6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start BATTLE_PostCombatDeathFades
BATTLE_PostCombatDeathFades: @ 0x0802F8BC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x54]
	ldr r7, _0802F944 @ =0x0203A3F0
	adds r0, r7, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802F8E6
	ldr r0, _0802F948 @ =0x08C9D00C
	bl Proc_Find
	adds r4, r0, #0
	bl StartMuDeathFade
	str r4, [r6, #0x54]
	adds r0, r7, #0
	bl TryRemoveUnitFromBallista
_0802F8E6:
	ldr r5, _0802F94C @ =0x0203A470
	adds r0, r5, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802F93E
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl TryRemoveUnitFromBallista
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl StartMu
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingFromTo
	ldr r1, _0802F950 @ =0x02033E00
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartMuDeathFade
	str r4, [r6, #0x54]
_0802F93E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F944: .4byte 0x0203A3F0
_0802F948: .4byte 0x08C9D00C
_0802F94C: .4byte 0x0203A470
_0802F950: .4byte 0x02033E00

	thumb_func_start sub_0802F954
sub_0802F954: @ 0x0802F954
	push {lr}
	ldr r0, [r0, #0x54]
	bl EndMu
	pop {r0}
	bx r0

	thumb_func_start BATTLE_HandleCombatDeaths
BATTLE_HandleCombatDeaths: @ 0x0802F960
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DropRescueOnDeath
	adds r0, r5, #0
	adds r1, r4, #0
	bl DropRescueOnDeath
	adds r0, r6, #0
	adds r1, r4, #0
	bl KillUnitOnCombatDeath
	adds r0, r4, #0
	adds r1, r6, #0
	bl KillUnitOnCombatDeath
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0802F9A4
sub_0802F9A4: @ 0x0802F9A4
	push {r4, lr}
	bl GetActiveMapSong
	adds r4, r0, #0
	bl GetCurrentBgmSong
	cmp r0, r4
	beq _0802F9BE
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl StartBgmExt
_0802F9BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802F9C4
sub_0802F9C4: @ 0x0802F9C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r6, #0
	movs r2, #0
	ldr r5, _0802FA58 @ =0x0203A3F0
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, _0802FA5C @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	adds r1, r7, #0
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802FA00
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r2, r0, #0
_0802FA00:
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802FA1C
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r2, r0, #0
_0802FA1C:
	cmp r6, #0
	beq _0802FA60
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0802FA60
	ldrh r0, [r6, #0x1e]
	cmp r0, #0
	beq _0802FA60
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802FA60
	adds r0, r6, #0
	str r2, [sp]
	bl GetUnitLastItem
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp]
	adds r0, r2, #0
	adds r2, r7, #0
	bl StartGiveItem
	movs r0, #0
	b _0802FA62
	.align 2, 0
_0802FA58: .4byte 0x0203A3F0
_0802FA5C: .4byte 0x0203A470
_0802FA60:
	movs r0, #1
_0802FA62:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802FA6C
sub_0802FA6C: @ 0x0802FA6C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802FA90 @ =0x0203A470
	movs r0, #1
	strb r0, [r1, #0x12]
	strb r0, [r1, #0x13]
	ldr r0, _0802FA94 @ =0x0203A3F0
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802FA8C
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_0802FA8C:
	pop {r0}
	bx r0
	.align 2, 0
_0802FA90: .4byte 0x0203A470
_0802FA94: .4byte 0x0203A3F0

	thumb_func_start BATTLE_HandleArenaDeathsMaybe
BATTLE_HandleArenaDeathsMaybe: @ 0x0802FA98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FAB4 @ =0x03004690
	ldr r0, [r4]
	bl KillUnitOnArenaDeathMaybe
	ldr r1, [r4]
	adds r0, r5, #0
	bl DropRescueOnDeath
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FAB4: .4byte 0x03004690

	thumb_func_start SetLastCoords
SetLastCoords: @ 0x0802FAB8
	ldr r3, _0802FAC8 @ =0x08B96444
	ldr r2, [r3]
	adds r2, #0x29
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802FAC8: .4byte 0x08B96444

	thumb_func_start CutOffPathLength
CutOffPathLength: @ 0x0802FACC
	push {r4, r5, r6, r7, lr}
	ldr r3, _0802FB68 @ =0x08B96444
	ldr r1, [r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _0802FB60
	subs r0, #1
	strb r0, [r2]
	ldr r2, [r3]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #0x29
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	strb r1, [r0]
	movs r5, #1
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bgt _0802FB60
	adds r7, r3, #0
_0802FB0E:
	bl GetWorkingMoveCosts
	ldr r3, [r7]
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	adds r5, r3, #0
	adds r5, #0x55
	adds r6, r5, r4
	subs r1, r4, #1
	adds r5, r5, r1
	adds r1, r3, #0
	adds r1, #0x41
	adds r1, r1, r4
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldr r1, _0802FB6C @ =0x0202E3E0
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r3, #0x2d
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r1, [r2]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r5, [r5]
	ldrb r0, [r0]
	subs r0, r5, r0
	strb r0, [r6]
	adds r4, #1
	lsls r4, r4, #0x18
	ldr r0, [r7]
	adds r0, #0x2c
	lsrs r5, r4, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	cmp r4, r0
	ble _0802FB0E
_0802FB60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FB68: .4byte 0x08B96444
_0802FB6C: .4byte 0x0202E3E0

	thumb_func_start AddPointToPathArrowProc
AddPointToPathArrowProc: @ 0x0802FB70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _0802FBEC @ =0x08B96444
	ldr r0, [r6]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2d
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x41
	adds r0, r0, r1
	strb r4, [r0]
	bl GetWorkingMoveCosts
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, #0x55
	adds r3, r2, r1
	subs r1, #1
	adds r2, r2, r1
	lsls r4, r4, #0x18
	ldr r1, _0802FBF0 @ =0x0202E3E0
	ldr r1, [r1]
	asrs r4, r4, #0x16
	adds r4, r4, r1
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r2, [r2]
	ldrb r0, [r0]
	subs r0, r2, r0
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FBEC: .4byte 0x08B96444
_0802FBF0: .4byte 0x0202E3E0

	thumb_func_start GetPointAlongPath
GetPointAlongPath: @ 0x0802FBF4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0
	ldr r0, _0802FC48 @ =0x08B96444
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r1, r3
	bgt _0802FC5A
	mov ip, r2
	lsls r0, r4, #0x18
	asrs r7, r0, #0x18
	mov r6, ip
	adds r6, #0x41
	lsls r0, r5, #0x18
	asrs r5, r0, #0x18
	adds r4, r3, #0
_0802FC20:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	mov r1, ip
	adds r1, #0x2d
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, #0
	cmp r1, r7
	bne _0802FC4C
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _0802FC4C
	adds r0, r2, #0
	b _0802FC5E
	.align 2, 0
_0802FC48: .4byte 0x08B96444
_0802FC4C:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	ble _0802FC20
_0802FC5A:
	movs r0, #1
	rsbs r0, r0, #0
_0802FC5E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetPathFromMovementScript
GetPathFromMovementScript: @ 0x0802FC64
	push {r4, lr}
	movs r4, #0
_0802FC68:
	ldr r2, _0802FC90 @ =0x02033E00
	adds r1, r4, #0
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xa
	bhi _0802FC68
	lsls r0, r0, #2
	ldr r1, _0802FC94 @ =_0802FC98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802FC90: .4byte 0x02033E00
_0802FC94: .4byte _0802FC98
_0802FC98: @ jump table
	.4byte _0802FD5C @ case 0
	.4byte _0802FCC4 @ case 1
	.4byte _0802FCE0 @ case 2
	.4byte _0802FD30 @ case 3
	.4byte _0802FD0C @ case 4
	.4byte _0802FD5C @ case 5
	.4byte _0802FC68 @ case 6
	.4byte _0802FC68 @ case 7
	.4byte _0802FC68 @ case 8
	.4byte _0802FC68 @ case 9
	.4byte _0802FC68 @ case 10
_0802FCC4:
	ldr r0, _0802FCDC @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	b _0802FCF4
	.align 2, 0
_0802FCDC: .4byte 0x08B96444
_0802FCE0:
	ldr r0, _0802FD08 @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #1
_0802FCF4:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	b _0802FC68
	.align 2, 0
_0802FD08: .4byte 0x08B96444
_0802FD0C:
	ldr r0, _0802FD2C @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r1, #1
	b _0802FD4E
	.align 2, 0
_0802FD2C: .4byte 0x08B96444
_0802FD30:
	ldr r0, _0802FD58 @ =0x08B96444
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #1
_0802FD4E:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	b _0802FC68
	.align 2, 0
_0802FD58: .4byte 0x08B96444
_0802FD5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetMovementScriptFromPath
GetMovementScriptFromPath: @ 0x0802FD64
	push {r4, r5, r6, r7, lr}
	movs r6, #1
	ldr r2, _0802FDA8 @ =0x08B96444
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r2, #0
	ldr r1, _0802FDAC @ =0x02033E00
	mov ip, r1
	cmp r6, r0
	bgt _0802FDF6
	mov r5, ip
_0802FD80:
	ldr r4, [r2]
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x2d
	adds r1, r0, r3
	subs r2, r3, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0802FDB0
	adds r1, r2, r5
	movs r0, #0
	b _0802FDDC
	.align 2, 0
_0802FDA8: .4byte 0x08B96444
_0802FDAC: .4byte 0x02033E00
_0802FDB0:
	cmp r1, r0
	ble _0802FDBA
	adds r1, r2, r5
	movs r0, #1
	b _0802FDDC
_0802FDBA:
	adds r0, r4, #0
	adds r0, #0x41
	adds r1, r0, r3
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0802FDD8
	adds r1, r2, r5
	movs r0, #3
	b _0802FDDC
_0802FDD8:
	adds r1, r2, r5
	movs r0, #2
_0802FDDC:
	strb r0, [r1]
	lsls r0, r6, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	adds r2, r7, #0
	ldr r1, [r2]
	adds r1, #0x2c
	lsrs r6, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	cmp r0, r1
	ble _0802FD80
_0802FDF6:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	add r0, ip
	movs r1, #4
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GenerateMovementMapForActiveUnit
GenerateMovementMapForActiveUnit: @ 0x0802FE08
	push {r4, lr}
	ldr r0, _0802FE44 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _0802FE48 @ =0x08B96444
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, #1
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r3, #0
	adds r2, #0x41
	adds r2, r2, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x55
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	bl MapFloodOnWorkingMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FE44: .4byte 0x03004690
_0802FE48: .4byte 0x08B96444

	thumb_func_start ResetPathArrow
ResetPathArrow: @ 0x0802FE4C
	push {lr}
	movs r0, #1
	bl CutOffPathLength
	bl GenerateMovementMapForActiveUnit
	ldr r1, _0802FE70 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	ldr r2, _0802FE74 @ =0x02033E00
	bl BuildBestMoveScript
	bl GetPathFromMovementScript
	pop {r0}
	bx r0
	.align 2, 0
_0802FE70: .4byte 0x0202BBB8
_0802FE74: .4byte 0x02033E00

	thumb_func_start sub_0802FE78
sub_0802FE78: @ 0x0802FE78
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802FE84 @ =0x08B96444
	ldr r0, [r0]
	adds r0, #0x2c
	ldrb r1, [r0]
	b _0802FEE4
	.align 2, 0
_0802FE84: .4byte 0x08B96444
_0802FE88:
	asrs r4, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	lsls r7, r1, #0x18
	cmp r2, #0
	blt _0802FEDC
	ldr r0, _0802FEC8 @ =0x08B96444
	ldr r1, [r0]
	adds r5, r1, #0
	adds r5, #0x2d
	adds r0, r5, r4
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, #0x41
	adds r4, r1, r4
_0802FEAC:
	asrs r2, r2, #0x18
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bne _0802FECC
	adds r0, r1, r2
	ldrb r2, [r4]
	ldrb r0, [r0]
	cmp r2, r0
	bne _0802FECC
	movs r0, #0
	b _0802FEEC
	.align 2, 0
_0802FEC8: .4byte 0x08B96444
_0802FECC:
	lsls r0, r3, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	cmp r2, #0
	bge _0802FEAC
_0802FEDC:
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r7, r1
	lsrs r1, r0, #0x18
_0802FEE4:
	lsls r0, r1, #0x18
	cmp r0, #0
	bgt _0802FE88
	movs r0, #1
_0802FEEC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802FEF4
sub_0802FEF4: @ 0x0802FEF4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0802FF64 @ =0x083FDE3C
	ldr r1, _0802FF68 @ =0x06015E00
	bl Decompress
	ldr r0, _0802FF6C @ =0x083FE074
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r4, #0
	bne _0802FF5C
	ldr r5, _0802FF70 @ =0x08B96444
	ldr r2, [r5]
	ldr r4, _0802FF74 @ =0x03004690
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r0, r1, r0
	ldr r1, _0802FF78 @ =0x0203A85C
	ldrb r1, [r1, #0x10]
	subs r0, r0, r1
	adds r2, #0x2b
	strb r0, [r2]
	movs r0, #0
	bl CutOffPathLength
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, #0x55
	strb r1, [r0]
	ldr r1, _0802FF7C @ =0x0000FFFF
	adds r0, r1, #0
	bl SetLastCoords
	bl sub_0802FF80
_0802FF5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF64: .4byte 0x083FDE3C
_0802FF68: .4byte 0x06015E00
_0802FF6C: .4byte 0x083FE074
_0802FF70: .4byte 0x08B96444
_0802FF74: .4byte 0x03004690
_0802FF78: .4byte 0x0203A85C
_0802FF7C: .4byte 0x0000FFFF

	thumb_func_start sub_0802FF80
sub_0802FF80: @ 0x0802FF80
	push {r4, r5, r6, r7, lr}
	ldr r7, _08030004 @ =0x08B96444
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x29
	ldr r5, _08030008 @ =0x0202BBB8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0802FFAA
	adds r0, r2, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0802FFAA
	b _0803012C
_0802FFAA:
	ldrh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	bl SetLastCoords
	ldr r0, _0803000C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _08030010 @ =0x030041E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _0802FFDE
	b _0803012C
_0802FFDE:
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	bl GetPointAlongPath
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08030014
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	asrs r0, r0, #0x18
	bl CutOffPathLength
	b _0803012C
	.align 2, 0
_08030004: .4byte 0x08B96444
_08030008: .4byte 0x0202BBB8
_0803000C: .4byte 0x0202E3E4
_08030010: .4byte 0x030041E0
_08030014:
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, #0x55
	adds r4, r4, r0
	bl GetWorkingMoveCosts
	movs r1, #0x16
	ldrsh r6, [r5, r1]
	ldr r1, _08030084 @ =0x0202E3E0
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	movs r2, #0x14
	ldrsh r3, [r5, r2]
	ldr r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _080300A8
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r3
	cmp r2, #0
	bge _0803006A
	subs r2, r3, r0
_0803006A:
	adds r0, r4, #0
	adds r0, #0x41
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, r1, r6
	cmp r0, #0
	blt _08030088
	adds r0, r2, r0
	cmp r0, #1
	beq _08030090
	b _080300A8
	.align 2, 0
_08030084: .4byte 0x0202E3E0
_08030088:
	subs r0, r6, r1
	adds r0, r2, r0
	cmp r0, #1
	bne _080300A8
_08030090:
	ldr r1, _080300A4 @ =0x0202BBB8
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	b _0803012C
	.align 2, 0
_080300A4: .4byte 0x0202BBB8
_080300A8:
	ldr r0, _08030100 @ =0x08B96444
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x55
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080300CA
	movs r0, #1
	bl CutOffPathLength
_080300CA:
	ldr r0, _08030104 @ =0x0202E3F4
	ldr r0, [r0]
	bl SetWorkingBmMap
	bl GenerateMovementMapForActiveUnit
	ldr r2, _08030108 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r4, [r2, r3]
	ldr r0, _0803010C @ =0x030041E0
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r1, #0x14
	ldrsh r3, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08030110
	bl ResetPathArrow
	b _0803012C
	.align 2, 0
_08030100: .4byte 0x08B96444
_08030104: .4byte 0x0202E3F4
_08030108: .4byte 0x0202BBB8
_0803010C: .4byte 0x030041E0
_08030110:
	ldr r2, _08030134 @ =0x02033E00
	adds r0, r3, #0
	adds r1, r4, #0
	bl BuildBestMoveScript
	bl GetPathFromMovementScript
	bl sub_0802FE78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803012C
	bl ResetPathArrow
_0803012C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030134: .4byte 0x02033E00

	thumb_func_start sub_08030138
sub_08030138: @ 0x08030138
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08030146
	movs r0, #0
	b _08030196
_08030146:
	ldr r0, _08030168 @ =0x08B96444
	ldr r3, [r0]
	subs r4, r2, #1
	adds r0, r3, #0
	adds r0, #0x2d
	adds r1, r0, r4
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0803016C
	movs r0, #3
	b _08030196
	.align 2, 0
_08030168: .4byte 0x08B96444
_0803016C:
	cmp r1, r0
	ble _08030174
	movs r0, #1
	b _08030196
_08030174:
	adds r0, r3, #0
	adds r0, #0x41
	adds r1, r0, r4
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08030190
	movs r0, #4
	b _08030196
_08030190:
	cmp r1, r0
	ble _08030196
	movs r0, #2
_08030196:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803019C
sub_0803019C: @ 0x0803019C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080301B8 @ =0x08B96444
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r2, r0
	bne _080301BC
	movs r0, #0
	b _08030204
	.align 2, 0
_080301B8: .4byte 0x08B96444
_080301BC:
	adds r0, r3, #0
	adds r0, #0x2d
	adds r1, r0, r2
	adds r4, r2, #1
	adds r0, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080301DA
	movs r0, #1
	b _08030204
_080301DA:
	cmp r1, r0
	ble _080301E2
	movs r0, #3
	b _08030204
_080301E2:
	adds r0, r3, #0
	adds r0, #0x41
	adds r1, r0, r2
	adds r0, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080301FE
	movs r0, #2
	b _08030204
_080301FE:
	cmp r1, r0
	ble _08030204
	movs r0, #4
_08030204:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PointInCameraBounds
PointInCameraBounds: @ 0x0803020C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08030244 @ =0x0202BBB8
	movs r6, #0xe
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble _08030248
	cmp r1, #0x9f
	bgt _08030248
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmn r0, r5
	ble _08030248
	cmp r0, #0xef
	bgt _08030248
	movs r0, #1
	b _0803024A
	.align 2, 0
_08030244: .4byte 0x0202BBB8
_08030248:
	movs r0, #0
_0803024A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08030250
sub_08030250: @ 0x08030250
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _080302FC @ =0x08B96444
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x2c
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080302EC
	ldrb r5, [r5]
	lsls r5, r5, #0x18
	cmp r5, #0
	blt _080302EC
	ldr r0, _08030300 @ =0x08B96410
	mov sb, r0
_08030276:
	ldr r0, _080302FC @ =0x08B96444
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl PointInCameraBounds
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080302E4
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_08030138
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_0803019C
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, sb
	ldrh r3, [r4]
	ldr r0, _08030304 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r1, r7, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	mov r0, r8
	subs r2, r0, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, _08030308 @ =0x08B905B8
	bl PutSprite
_080302E4:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge _08030276
_080302EC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080302FC: .4byte 0x08B96444
_08030300: .4byte 0x08B96410
_08030304: .4byte 0x0202BBB8
_08030308: .4byte 0x08B905B8

	thumb_func_start sub_0803030C
sub_0803030C: @ 0x0803030C
	push {lr}
	bl sub_0802FF80
	bl sub_08030250
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetPlayerLeaderUnitId
GetPlayerLeaderUnitId: @ 0x0803031C
	ldr r0, _08030330 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _0803033E
	cmp r0, #2
	bgt _08030334
	cmp r0, #1
	beq _0803033A
	b _08030346
	.align 2, 0
_08030330: .4byte 0x0202BBF8
_08030334:
	cmp r0, #3
	beq _08030342
	b _08030346
_0803033A:
	movs r0, #3
	b _08030348
_0803033E:
	movs r0, #1
	b _08030348
_08030342:
	movs r0, #2
	b _08030348
_08030346:
	movs r0, #0
_08030348:
	bx lr
	.align 2, 0

	thumb_func_start Prep_ShowDeployableTiles
Prep_ShowDeployableTiles: @ 0x0803034C
	push {r4, r5, lr}
	bl sub_08079280
	adds r4, r0, #0
	ldr r5, _080303A0 @ =0x0202E3E8
	ldr r0, [r5]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080303A4 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	bl CalcForceDeployedUnitCounts
	lsls r0, r0, #4
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08030394
	adds r3, r5, #0
	movs r2, #1
_0803037C:
	ldr r1, [r3]
	ldrb r5, [r4, #7]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r1, [r4, #6]
	adds r0, r1, r0
	strb r2, [r0]
	adds r4, #0x10
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803037C
_08030394:
	movs r0, #0x10
	bl DisplayMoveRangeGraphics
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080303A0: .4byte 0x0202E3E8
_080303A4: .4byte 0x0202E3E4

	thumb_func_start EndPrepScreenMenu_
EndPrepScreenMenu_: @ 0x080303A8
	push {lr}
	bl EndPrepScreenMenu
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepMapMenu_OnViewMap
PrepMapMenu_OnViewMap: @ 0x080303B4
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl Proc_Break
	bl EndPrepScreenMenu_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepMapMenu_OnFormation
PrepMapMenu_OnFormation: @ 0x080303C8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	str r0, [r5, #0x58]
	ldr r4, _080303FC @ =0x0202BBB8
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl TrySwitchViewedUnit
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl PutMapCursor
	adds r0, r5, #0
	bl Proc_Break
	bl EndPrepScreenMenu_
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080303FC: .4byte 0x0202BBB8

	thumb_func_start PrepMapMenu_OnStartPress
PrepMapMenu_OnStartPress: @ 0x08030400
	push {lr}
	movs r1, #0x37
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PrepMapMenu_OnBPress
PrepMapMenu_OnBPress: @ 0x08030410
	push {lr}
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08030420
sub_08030420: @ 0x08030420
	push {r4, r5, lr}
	bl GetSupplyUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08030474
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	ldr r5, _0803047C @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0803044A
	movs r1, #1
_0803044A:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _08030464
	movs r1, #1
_08030464:
	adds r0, #0x88
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_08030474:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803047C: .4byte 0x0202BBF8

	thumb_func_start PrepMapMenu_OnOptions
PrepMapMenu_OnOptions: @ 0x08030480
	push {lr}
	movs r1, #8
	str r1, [r0, #0x58]
	movs r1, #0x39
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_08030490
sub_08030490: @ 0x08030490
	push {lr}
	bl GetSupplyUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080304BA
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xff
	ldrb r1, [r2, #0x10]
	orrs r1, r0
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x11]
	orrs r0, r1
	strb r0, [r2, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_080304BA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepMapMenu_OnSave
PrepMapMenu_OnSave: @ 0x080304C0
	push {lr}
	movs r1, #9
	str r1, [r0, #0x58]
	movs r1, #0x3b
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_080304D0
sub_080304D0: @ 0x080304D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08030514 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _080304E8
	movs r1, #1
_080304E8:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _08030500
	movs r1, #1
_08030500:
	adds r0, #0x88
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl EnsureCameraOntoPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030514: .4byte 0x0202BBF8

	thumb_func_start PrepScreenProc_InitMapMenu
PrepScreenProc_InitMapMenu: @ 0x08030518
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl PrepScreenProc_StartMapMenu
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepScreenProc_DimMapImmediate
PrepScreenProc_DimMapImmediate: @ 0x08030528
	push {lr}
	bl ArchiveCurrentPalettes
	ldr r3, _08030540 @ =0xFF00FFF0
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
	pop {r0}
	bx r0
	.align 2, 0
_08030540: .4byte 0xFF00FFF0

	thumb_func_start PrepScreenProc_StartBrightenMap
PrepScreenProc_StartBrightenMap: @ 0x08030544
	push {lr}
	sub sp, #0x14
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _0803056C @ =0xFF00FFF0
	str r1, [sp, #8]
	movs r1, #0x40
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_080139D8
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_0803056C: .4byte 0xFF00FFF0

	thumb_func_start sub_08030570
sub_08030570: @ 0x08030570
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _080305A0 @ =0xFF00FFF0
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0xc0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080305A0: .4byte 0xFF00FFF0

	thumb_func_start sub_080305A4
sub_080305A4: @ 0x080305A4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb0
	movs r1, #0x8c
	adds r2, r4, #0
	bl StartHelpPromptSprite
	ldr r0, _080305C4 @ =0x08405170
	ldr r1, _080305C8 @ =0x06017000
	bl Decompress
	movs r0, #0
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080305C4: .4byte 0x08405170
_080305C8: .4byte 0x06017000

	thumb_func_start sub_080305CC
sub_080305CC: @ 0x080305CC
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08030650 @ =0x08B905F8
	ldr r0, _08030654 @ =0x0000038D
	str r0, [sp]
	movs r0, #4
	movs r1, #0x68
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _08030658 @ =0x00000391
	str r0, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, _0803065C @ =0x08B905B8
	ldr r0, _08030660 @ =0x00000395
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x8c
	bl PutSprite
	ldr r5, _08030664 @ =0x08B905D0
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0x8c
	adds r3, r5, #0
	bl PutSprite
	ldr r0, _08030668 @ =0x00000397
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _0803066C @ =0x0000039B
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _08030670 @ =0x0000039F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x58
	movs r2, #0x8c
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030650: .4byte 0x08B905F8
_08030654: .4byte 0x0000038D
_08030658: .4byte 0x00000391
_0803065C: .4byte 0x08B905B8
_08030660: .4byte 0x00000395
_08030664: .4byte 0x08B905D0
_08030668: .4byte 0x00000397
_0803066C: .4byte 0x0000039B
_08030670: .4byte 0x0000039F

	thumb_func_start sub_08030674
sub_08030674: @ 0x08030674
	push {lr}
	adds r1, r0, #0
	ldr r0, _08030684 @ =0x08B96448
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08030684: .4byte 0x08B96448

	thumb_func_start sub_08030688
sub_08030688: @ 0x08030688
	push {lr}
	bl EndHelpPromptSprite
	ldr r0, _08030698 @ =0x08B96448
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08030698: .4byte 0x08B96448

	thumb_func_start PrepScreenProc_StartMapMenu
PrepScreenProc_StartMapMenu: @ 0x0803069C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl ResetText
	bl EndPlayerPhaseSideWindows
	bl HideMoveRangeGraphics
	adds r0, r4, #0
	bl sub_0808FE48
	ldr r1, _08030744 @ =PrepMapMenu_OnViewMap
	ldr r3, _08030748 @ =0x0000114F
	ldr r0, _0803074C @ =0x00000383
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08030750 @ =PrepMapMenu_OnFormation
	ldr r3, _08030754 @ =0x0000114E
	movs r0, #0xe1
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08030758 @ =PrepMapMenu_OnOptions
	ldr r3, _0803075C @ =0x0000114C
	ldr r0, _08030760 @ =0x00000382
	str r0, [sp]
	movs r0, #8
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, _08030764 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0803070E
	ldr r1, _08030768 @ =PrepMapMenu_OnSave
	movs r3, #0x8a
	lsls r3, r3, #5
	ldr r0, _0803076C @ =0x0000037E
	str r0, [sp]
	movs r0, #9
	movs r2, #0
	bl SetPrepScreenMenuItem
_0803070E:
	adds r0, r4, #0
	bl sub_08030674
	ldr r0, _08030770 @ =PrepMapMenu_OnBPress
	bl SetPrepScreenMenuOnBPress
	ldr r0, _08030774 @ =PrepMapMenu_OnStartPress
	bl SetPrepScreenMenuOnStartPress
	ldr r0, _08030778 @ =sub_08030688
	bl SetPrepScreenMenuOnEnd
	movs r0, #0xa
	movs r1, #2
	bl DrawPrepScreenMenuFrameAt
	ldr r0, [r4, #0x58]
	bl SetPrepScreenMenuSelectedItem
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030744: .4byte PrepMapMenu_OnViewMap
_08030748: .4byte 0x0000114F
_0803074C: .4byte 0x00000383
_08030750: .4byte PrepMapMenu_OnFormation
_08030754: .4byte 0x0000114E
_08030758: .4byte PrepMapMenu_OnOptions
_0803075C: .4byte 0x0000114C
_08030760: .4byte 0x00000382
_08030764: .4byte 0x0202BBF8
_08030768: .4byte PrepMapMenu_OnSave
_0803076C: .4byte 0x0000037E
_08030770: .4byte PrepMapMenu_OnBPress
_08030774: .4byte PrepMapMenu_OnStartPress
_08030778: .4byte sub_08030688

	thumb_func_start sub_0803077C
sub_0803077C: @ 0x0803077C
	push {r4, lr}
	adds r4, r0, #0
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030792
	cmp r4, #0x28
	beq _08030792
	movs r0, #1
	b _08030794
_08030792:
	movs r0, #0
_08030794:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803079C
sub_0803079C: @ 0x0803079C
	adds r1, r0, #0
	adds r1, #0x4a
	movs r2, #0
	strh r2, [r1]
	str r2, [r0, #0x2c]
	str r2, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	ldr r1, _080307C0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080307C0: .4byte 0x0202E3D8

	thumb_func_start sub_080307C4
sub_080307C4: @ 0x080307C4
	movs r1, #0
	str r1, [r0, #0x34]
	movs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _080307DC @ =0x0202E3D8
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080307DC: .4byte 0x0202E3D8

	thumb_func_start sub_080307E0
sub_080307E0: @ 0x080307E0
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x38]
	ldr r1, _080307FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080307FC: .4byte 0x0202E3D8

	thumb_func_start sub_08030800
sub_08030800: @ 0x08030800
	movs r1, #0
	str r1, [r0, #0x34]
	subs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _08030818 @ =0x0202E3D8
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08030818: .4byte 0x0202E3D8

	thumb_func_start sub_0803081C
sub_0803081C: @ 0x0803081C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08030864 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08030836
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_08030836:
	adds r0, r3, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, [r3, #0x2c]
	ldr r5, [r3, #0x30]
	cmp r0, #0
	beq _08030868
	movs r1, #0xf
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08030868
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08030868
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08030890
	.align 2, 0
_08030864: .4byte 0x08B857F8
_08030868:
	ldr r2, [r3, #0x34]
	adds r2, r4, r2
	str r2, [r3, #0x2c]
	ldr r0, [r3, #0x38]
	adds r0, r5, r0
	str r0, [r3, #0x30]
	ldr r1, _08030898 @ =0x0202BBB8
	strh r2, [r1, #0xc]
	strh r0, [r1, #0xe]
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08030890
	adds r0, r3, #0
	bl Proc_Break
_08030890:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030898: .4byte 0x0202BBB8

	thumb_func_start sub_0803089C
sub_0803089C: @ 0x0803089C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _080308B8 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _080308BC
	adds r0, r4, #0
	bl Proc_End
	b _08030906
	.align 2, 0
_080308B8: .4byte 0x0202BBF8
_080308BC:
	bl sub_08018980
	movs r6, #0x10
	movs r0, #0x10
	ldrb r1, [r5, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080308DA
	bl SortPlayerUnitsForPrepScreen
	bl sub_0800F0C8
	ldrb r0, [r5, #0x14]
	orrs r0, r6
	strb r0, [r5, #0x14]
_080308DA:
	movs r0, #0
	bl GetCameraCenteredX
	ldr r4, _0803090C @ =0x0202BBB8
	strh r0, [r4, #0xc]
	movs r0, #0
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	orrs r0, r6
	strb r0, [r4, #4]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r5, #0xd]
	bl RefreshEntityMaps
	bl RenderMap
_08030906:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803090C: .4byte 0x0202BBB8

	thumb_func_start sub_08030910
sub_08030910: @ 0x08030910
	push {r4, lr}
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _08030930
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	b _08030938
_08030930:
	movs r0, #0
	movs r1, #0
	bl SetMapCursorPosition
_08030938:
	ldr r4, _08030958 @ =0x0202BBB8
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030958: .4byte 0x0202BBB8

	thumb_func_start PrepScreenProc_SetupMapIdle
PrepScreenProc_SetupMapIdle: @ 0x0803095C
	push {r4, lr}
	adds r4, r0, #0
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803097A
	ldr r0, [r4, #0x58]
	cmp r0, #2
	bne _08030974
	bl Prep_ShowDeployableTiles
_08030974:
	adds r0, r4, #0
	bl Proc_Break
_0803097A:
	ldr r1, _08030990 @ =0x0202BBB8
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl PutMapCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030990: .4byte 0x0202BBB8

	thumb_func_start sub_08030994
sub_08030994: @ 0x08030994
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl HandlePlayerMapCursor
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080309A8
	b _08030BF4
_080309A8:
	ldr r1, _080309E0 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _080309F0
	ldr r1, _080309E4 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl TrySwitchViewedUnit
	ldr r0, _080309E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080309D6
	b _08030BF4
_080309D6:
	ldr r0, _080309EC @ =0x0000038B
	bl m4aSongNumStart
	b _08030BF4
	.align 2, 0
_080309E0: .4byte 0x08B857F8
_080309E4: .4byte 0x0202BBB8
_080309E8: .4byte 0x0202BBF8
_080309EC: .4byte 0x0000038B
_080309F0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08030A54
	ldr r4, _08030A4C @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r6, _08030A50 @ =0x0202E3DC
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08030A54
	bl EndAllMus
	bl EndPlayerPhaseSideWindows
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _08030C04
	.align 2, 0
_08030A4C: .4byte 0x0202BBB8
_08030A50: .4byte 0x0202E3DC
_08030A54:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08030A88
	bl EndPlayerPhaseSideWindows
	ldr r4, _08030A80 @ =0x0202BBF8
	ldr r1, _08030A84 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	strb r0, [r4, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	adds r4, #0x41
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	b _08030B50
	.align 2, 0
_08030A80: .4byte 0x0202BBF8
_08030A84: .4byte 0x0202BBB8
_08030A88:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08030A92
	b _08030BD0
_08030A92:
	ldr r2, _08030AC4 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _08030AC8 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl GetPlayerSelectKind
	cmp r0, #4
	bls _08030ABA
	b _08030BD0
_08030ABA:
	lsls r0, r0, #2
	ldr r1, _08030ACC @ =_08030AD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030AC4: .4byte 0x0202BBB8
_08030AC8: .4byte 0x0202E3DC
_08030ACC: .4byte _08030AD0
_08030AD0: @ jump table
	.4byte _08030AE4 @ case 0
	.4byte _08030AE4 @ case 1
	.4byte _08030B64 @ case 2
	.4byte _08030BAC @ case 3
	.4byte _08030B8C @ case 4
_08030AE4:
	bl EndPlayerPhaseSideWindows
	ldr r3, _08030B30 @ =0x0202BBF8
	ldr r2, _08030B34 @ =0x0202BBB8
	ldrh r0, [r2, #0x14]
	strb r0, [r3, #0x12]
	ldrh r0, [r2, #0x16]
	strb r0, [r3, #0x13]
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08030B38 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	bgt _08030B40
	cmp r0, #6
	blt _08030B40
	adds r0, r3, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030B24
	ldr r0, _08030B3C @ =0x0000038A
	bl m4aSongNumStart
_08030B24:
	adds r0, r5, #0
	movs r1, #0x3c
	bl Proc_Goto
	b _08030C04
	.align 2, 0
_08030B30: .4byte 0x0202BBF8
_08030B34: .4byte 0x0202BBB8
_08030B38: .4byte 0x0202E3E0
_08030B3C: .4byte 0x0000038A
_08030B40:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08030B5C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
_08030B50:
	cmp r0, #0
	blt _08030C04
	ldr r0, _08030B60 @ =0x00000389
	bl m4aSongNumStart
	b _08030C04
	.align 2, 0
_08030B5C: .4byte 0x0202BBF8
_08030B60: .4byte 0x00000389
_08030B64:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _08030B88 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _08030BC0
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08030C04
	.align 2, 0
_08030B88: .4byte 0x03004690
_08030B8C:
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _08030BAC
	ldr r0, _08030BA8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030C04
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08030C04
	.align 2, 0
_08030BA8: .4byte 0x0202BBF8
_08030BAC:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _08030BCC @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
_08030BC0:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08030C04
	.align 2, 0
_08030BCC: .4byte 0x03004690
_08030BD0:
	ldr r0, _08030BF0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08030BF4
	bl EndPlayerPhaseSideWindows
	bl sub_080A3284
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _08030C04
	.align 2, 0
_08030BF0: .4byte 0x08B857F8
_08030BF4:
	ldr r1, _08030C0C @ =0x0202BBB8
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r3, #0x22
	ldrsh r1, [r1, r3]
	movs r2, #0
	bl PutMapCursor
_08030C04:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030C0C: .4byte 0x0202BBB8

	thumb_func_start sub_08030C10
sub_08030C10: @ 0x08030C10
	push {lr}
	ldr r0, _08030C24 @ =0x08B96460
	bl Proc_Find
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08030C24: .4byte 0x08B96460

	thumb_func_start sub_08030C28
sub_08030C28: @ 0x08030C28
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08030C94 @ =0x08196228
	movs r1, #0
	bl StartSpriteAnim
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl SetSpriteAnimId
	str r4, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x4a
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08030C98 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x3c]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x40]
	ldr r0, _08030C9C @ =0x00000726
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl StartSubtitleHelp
	ldr r0, _08030CA0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	ldr r0, _08030CA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030C8C
	ldr r0, _08030CA8 @ =0x00000389
	bl m4aSongNumStart
_08030C8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030C94: .4byte 0x08196228
_08030C98: .4byte 0x0202BBB8
_08030C9C: .4byte 0x00000726
_08030CA0: .4byte 0x03004690
_08030CA4: .4byte 0x0202BBF8
_08030CA8: .4byte 0x00000389

	thumb_func_start sub_08030CAC
sub_08030CAC: @ 0x08030CAC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, _08030D44 @ =0x0202BBB8
	movs r0, #0x16
	ldrsh r1, [r6, r0]
	ldr r0, _08030D48 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r7, [r0]
	ldr r0, _08030D4C @ =0x0202E3DC
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetUnit
	bl GetPlayerSelectKind
	cmp r0, #4
	bne _08030CE4
	movs r7, #0
_08030CE4:
	bl HandlePlayerMapCursor
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	movs r5, #0xc
	ldrsh r1, [r6, r5]
	subs r5, r0, r1
	ldr r0, [r4, #0x40]
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08030D20
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08030D20
	subs r2, #0xc
	ldr r3, _08030D50 @ =0x08B905B8
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl PutSprite
_08030D20:
	ldr r0, _08030D54 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08030D74
	cmp r7, #0
	beq _08030D58
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	adds r0, r4, #0
	bl Proc_Break
	bl EndSubtitleHelp
	b _08030DEE
	.align 2, 0
_08030D44: .4byte 0x0202BBB8
_08030D48: .4byte 0x0202E3E8
_08030D4C: .4byte 0x0202E3DC
_08030D50: .4byte 0x08B905B8
_08030D54: .4byte 0x08B857F8
_08030D58:
	ldr r0, _08030D70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030DEE
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08030DEE
	.align 2, 0
_08030D70: .4byte 0x0202BBF8
_08030D74:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08030DAC
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	bl EndSubtitleHelp
	ldr r0, _08030DA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030DEE
	ldr r0, _08030DA8 @ =0x0000038B
	bl m4aSongNumStart
	b _08030DEE
	.align 2, 0
_08030DA4: .4byte 0x0202BBF8
_08030DA8: .4byte 0x0000038B
_08030DAC:
	lsls r0, r7, #0x18
	asrs r3, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4a
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r3, r2
	beq _08030DCE
	ldr r0, [r4, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _08030DCA
	movs r1, #1
_08030DCA:
	bl SetSpriteAnimId
_08030DCE:
	ldr r0, [r4, #0x54]
	ldr r3, _08030DF8 @ =0x0202BBB8
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	movs r4, #0xc
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	movs r4, #0x22
	ldrsh r2, [r3, r4]
	movs r4, #0xe
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	bl DisplaySpriteAnim
	asrs r0, r6, #0x18
	strh r0, [r5]
_08030DEE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030DF8: .4byte 0x0202BBB8

	thumb_func_start sub_08030DFC
sub_08030DFC: @ 0x08030DFC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08030E28 @ =0x03004690
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
	bl EnsureCameraOntoPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030E28: .4byte 0x03004690

	thumb_func_start sub_08030E2C
sub_08030E2C: @ 0x08030E2C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08030E68 @ =0x03004690
	ldr r5, [r0]
	ldr r6, _08030E6C @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08030E70 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08030E74
	movs r0, #0x14
	ldrsh r2, [r6, r0]
	movs r1, #0x16
	ldrsh r3, [r6, r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartPrepUnitSwap
	b _08030E94
	.align 2, 0
_08030E68: .4byte 0x03004690
_08030E6C: .4byte 0x0202BBB8
_08030E70: .4byte 0x0202E3DC
_08030E74:
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartPrepUnitSwap
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	adds r0, r7, #0
	adds r1, r4, #0
	bl StartPrepUnitSwap
_08030E94:
	ldr r0, _08030EAC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030EA6
	ldr r0, _08030EB0 @ =0x00000381
	bl m4aSongNumStart
_08030EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030EAC: .4byte 0x0202BBF8
_08030EB0: .4byte 0x00000381

	thumb_func_start InitMapChangeGraphicsIfFog
InitMapChangeGraphicsIfFog: @ 0x08030EB4
	push {lr}
	ldr r0, _08030EC8 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08030EC2
	bl RenderMapForFade
_08030EC2:
	pop {r0}
	bx r0
	.align 2, 0
_08030EC8: .4byte 0x0202BBF8

	thumb_func_start DisplayMapChangeIfFog
DisplayMapChangeIfFog: @ 0x08030ECC
	push {lr}
	ldr r0, _08030EE4 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08030EE0
	bl RenderMap
	movs r0, #0
	bl StartMapFade
_08030EE0:
	pop {r0}
	bx r0
	.align 2, 0
_08030EE4: .4byte 0x0202BBF8

	thumb_func_start sub_08030EE8
sub_08030EE8: @ 0x08030EE8
	push {lr}
	ldr r0, _08030EF8 @ =0x08CE5CA0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08030EF8: .4byte 0x08CE5CA0

	thumb_func_start sub_08030EFC
sub_08030EFC: @ 0x08030EFC
	push {lr}
	sub sp, #0x1c
	ldr r0, _08030F34 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r1, sp
	ldr r2, _08030F38 @ =0x0202BBB8
	ldrh r0, [r2, #0x14]
	strb r0, [r1, #0x18]
	ldrh r0, [r2, #0x16]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _08030F4E
	ldr r0, [sp, #0xc]
	cmp r0, #0x13
	beq _08030F3C
	cmp r0, #0x14
	beq _08030F46
	b _08030F4E
	.align 2, 0
_08030F34: .4byte 0x0202BBF8
_08030F38: .4byte 0x0202BBB8
_08030F3C:
	ldr r1, [sp, #4]
	movs r0, #0
	bl sub_080B03D4
	b _08030F4E
_08030F46:
	ldr r1, [sp, #4]
	movs r0, #0
	bl sub_080B03F4
_08030F4E:
	add sp, #0x1c
	pop {r0}
	bx r0

