	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021540
sub_08021540: @ 0x08021540
	movs r0, #0x17
	bx lr

	thumb_func_start MapMenu_Suspend_Available
MapMenu_Suspend_Available: @ 0x08021544
	ldr r1, _08021554 @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08021558
	movs r0, #1
	b _0802155A
	.align 2, 0
_08021554: .4byte 0x0202BBF8
_08021558:
	movs r0, #2
_0802155A:
	bx lr

	thumb_func_start sub_0802155C
sub_0802155C: @ 0x0802155C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _0802156E
	bl sub_080B2F28
	movs r0, #0x17
	b _08021576
_0802156E:
	ldr r1, _0802157C @ =0x0000074D
	bl MenuFrozenHelpBox
	movs r0, #8
_08021576:
	pop {r1}
	bx r1
	.align 2, 0
_0802157C: .4byte 0x0000074D

	thumb_func_start sub_08021580
sub_08021580: @ 0x08021580
	push {lr}
	ldr r0, _08021590 @ =0x08B93374
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021590: .4byte 0x08B93374

	thumb_func_start MapMenu_UnitCommand
MapMenu_UnitCommand: @ 0x08021594
	push {lr}
	ldr r0, _080215AC @ =0x08B93374
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	bl StartUnitListScreenField
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215AC: .4byte 0x08B93374

	thumb_func_start sub_080215B0
sub_080215B0: @ 0x080215B0
	push {lr}
	ldr r0, _080215C0 @ =0x08CE5BF0
	movs r1, #3
	bl Proc_Start
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215C0: .4byte 0x08CE5BF0

	thumb_func_start MapMenu_StatusCommand
MapMenu_StatusCommand: @ 0x080215C4
	push {lr}
	movs r0, #0
	bl NewChapterStatusScreen
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MapMenu_DangerZone_UnusedEffect
MapMenu_DangerZone_UnusedEffect: @ 0x080215D4
	push {lr}
	ldr r0, _080215F4 @ =0x03004690
	movs r1, #0
	str r1, [r0]
	ldr r0, _080215F8 @ =0x0202BBB8
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, _080215FC @ =0x08B93374
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215F4: .4byte 0x03004690
_080215F8: .4byte 0x0202BBB8
_080215FC: .4byte 0x08B93374

	thumb_func_start sub_08021600
sub_08021600: @ 0x08021600
	push {lr}
	movs r0, #3
	bl sub_080A4E0C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08021610
sub_08021610: @ 0x08021610
	movs r0, #0x17
	bx lr

	thumb_func_start sub_08021614
sub_08021614: @ 0x08021614
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _08021628
	adds r0, r4, #0
	movs r1, #0x63
	bl EventGotoLabel
_08021628:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08021630
sub_08021630: @ 0x08021630
	push {lr}
	ldr r0, _08021640 @ =0x08B93DA4
	bl sub_0800AF5C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021640: .4byte 0x08B93DA4

	thumb_func_start EffectWait
EffectWait: @ 0x08021644
	ldr r1, _08021650 @ =0x0203A85C
	movs r0, #1
	strb r0, [r1, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021650: .4byte 0x0203A85C

	thumb_func_start GenericSelection_BackToUM
GenericSelection_BackToUM: @ 0x08021654
	push {lr}
	bl EndTargetSelection
	ldr r0, _080216A0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	bl HideMoveRangeGraphics
	ldr r0, _080216A4 @ =0x08B95AAC
	ldr r2, _080216A8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	ldr r1, _080216AC @ =0x03004690
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_080216A0: .4byte 0x02023C60
_080216A4: .4byte 0x08B95AAC
_080216A8: .4byte 0x0202BBB8
_080216AC: .4byte 0x03004690

	thumb_func_start sub_080216B0
sub_080216B0: @ 0x080216B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08021708 @ =0x03004690
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl IsCameraNotWatchingPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021702
	ldr r0, [r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r0, _0802170C @ =0x08B92E38
	bl Proc_EndEach
	lsls r0, r4, #4
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08021710 @ =0x0202BBB8
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080216F4
	ldrh r2, [r2, #0x2a]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	adds r4, r0, #2
_080216F4:
	ldr r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl EnsureCameraOntoPosition
_08021702:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021708: .4byte 0x03004690
_0802170C: .4byte 0x08B92E38
_08021710: .4byte 0x0202BBB8

	thumb_func_start BackToUnitMenu_RestartMenu
BackToUnitMenu_RestartMenu: @ 0x08021714
	push {lr}
	ldr r0, _08021730 @ =0x08B95AAC
	ldr r2, _08021734 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	pop {r0}
	bx r0
	.align 2, 0
_08021730: .4byte 0x08B95AAC
_08021734: .4byte 0x0202BBB8

	thumb_func_start GenericSelection_BackToUM_CamWait
GenericSelection_BackToUM_CamWait: @ 0x08021738
	push {lr}
	bl EndTargetSelection
	ldr r0, _08021764 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl ResetTextFont
	ldr r0, _08021768 @ =0x08B93DDC
	movs r1, #3
	bl Proc_Start
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_08021764: .4byte 0x02023C60
_08021768: .4byte 0x08B93DDC

	thumb_func_start ItemMenu_ButtonBPressed
ItemMenu_ButtonBPressed: @ 0x0802176C
	push {lr}
	ldr r0, _080217A0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	ldr r0, _080217A4 @ =0x08B95AAC
	ldr r2, _080217A8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	bl HideMoveRangeGraphics
	movs r0, #0x3b
	pop {r1}
	bx r1
	.align 2, 0
_080217A0: .4byte 0x02023C60
_080217A4: .4byte 0x08B95AAC
_080217A8: .4byte 0x0202BBB8

	thumb_func_start sub_080217AC
sub_080217AC: @ 0x080217AC
	movs r0, #0
	bx lr

	thumb_func_start RescueUsability
RescueUsability: @ 0x080217B0
	push {lr}
	ldr r0, _080217DC @ =0x03004690
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080217E0
	movs r0, #0x81
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	bne _080217E0
	adds r0, r2, #0
	bl MakeRescueTargetList
	bl CountTargets
	cmp r0, #0
	beq _080217E0
	movs r0, #1
	b _080217E2
	.align 2, 0
_080217DC: .4byte 0x03004690
_080217E0:
	movs r0, #3
_080217E2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080217E8
sub_080217E8: @ 0x080217E8
	push {lr}
	ldr r0, _08021800 @ =0x03004690
	ldr r0, [r0]
	bl MakeRescueTargetList
	ldr r0, _08021804 @ =0x08B95D18
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021800: .4byte 0x03004690
_08021804: .4byte 0x08B95D18

	thumb_func_start sub_08021808
sub_08021808: @ 0x08021808
	ldr r2, _08021818 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #7
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021818: .4byte 0x0203A85C

	thumb_func_start DropUsability
DropUsability: @ 0x0802181C
	push {lr}
	ldr r0, _08021848 @ =0x03004690
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802184C
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0802184C
	adds r0, r2, #0
	bl MakeDropTargetList
	bl CountTargets
	cmp r0, #0
	beq _0802184C
	movs r0, #1
	b _0802184E
	.align 2, 0
_08021848: .4byte 0x03004690
_0802184C:
	movs r0, #3
_0802184E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DropEffect
DropEffect: @ 0x08021854
	push {lr}
	ldr r0, _0802186C @ =0x03004690
	ldr r0, [r0]
	bl MakeDropTargetList
	ldr r0, _08021870 @ =0x08B95CF8
	bl StartMapSelect
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0802186C: .4byte 0x03004690
_08021870: .4byte 0x08B95CF8

	thumb_func_start sub_08021874
sub_08021874: @ 0x08021874
	ldr r2, _08021890 @ =0x0203A85C
	movs r0, #8
	strb r0, [r2, #0x11]
	ldr r0, _08021894 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	strb r0, [r2, #0xd]
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021890: .4byte 0x0203A85C
_08021894: .4byte 0x03004690

	thumb_func_start sub_08021898
sub_08021898: @ 0x08021898
	push {lr}
	ldr r0, _080218D0 @ =0x03004690
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080218D8
	ldr r1, _080218D4 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080218D8
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _080218D8
	adds r0, r3, #0
	bl sub_08023F64
	bl CountTargets
	cmp r0, #0
	beq _080218D8
	movs r0, #1
	b _080218DA
	.align 2, 0
_080218D0: .4byte 0x03004690
_080218D4: .4byte 0x0202BBB8
_080218D8:
	movs r0, #3
_080218DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080218E0
sub_080218E0: @ 0x080218E0
	push {lr}
	ldr r0, _080218F8 @ =0x03004690
	ldr r0, [r0]
	bl sub_08023F64
	ldr r0, _080218FC @ =0x08B95CD8
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080218F8: .4byte 0x03004690
_080218FC: .4byte 0x08B95CD8

	thumb_func_start sub_08021900
sub_08021900: @ 0x08021900
	push {lr}
	ldr r0, _08021938 @ =0x03004690
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08021940
	ldr r1, _0802193C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021940
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _08021940
	adds r0, r3, #0
	bl sub_08024018
	bl CountTargets
	cmp r0, #0
	beq _08021940
	movs r0, #1
	b _08021942
	.align 2, 0
_08021938: .4byte 0x03004690
_0802193C: .4byte 0x0202BBB8
_08021940:
	movs r0, #3
_08021942:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08021948
sub_08021948: @ 0x08021948
	push {lr}
	ldr r0, _08021960 @ =0x03004690
	ldr r0, [r0]
	bl sub_08024018
	ldr r0, _08021964 @ =0x08B95CB8
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021960: .4byte 0x03004690
_08021964: .4byte 0x08B95CB8

	thumb_func_start MakeUnitRescueTransferGraphics
MakeUnitRescueTransferGraphics: @ 0x08021968
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl EndSubtitleHelp
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
	adds r0, r6, #0
	bl Make6CKOIDOAMM
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0802199C
sub_0802199C: @ 0x0802199C
	push {r4, r5, lr}
	ldr r4, _080219E8 @ =0x0203A85C
	movs r0, #9
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080219E8: .4byte 0x0203A85C

	thumb_func_start sub_080219EC
sub_080219EC: @ 0x080219EC
	push {r4, r5, lr}
	ldr r4, _08021A38 @ =0x0203A85C
	movs r0, #0xa
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021A38: .4byte 0x0203A85C

	thumb_func_start UnitAttackCommandEffect
UnitAttackCommandEffect: @ 0x08021A3C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08021A5C
	ldr r1, _08021A58 @ =0x00000742
	adds r0, r5, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _08021A90
	.align 2, 0
_08021A58: .4byte 0x00000742
_08021A5C:
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _08021A80 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08021A84
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartFightItemReview
	b _08021A8C
	.align 2, 0
_08021A80: .4byte 0x03004690
_08021A84:
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartFightBallistaReview
_08021A8C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08021A90:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartFightBallistaReview
StartFightBallistaReview: @ 0x08021A98
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021ADC @ =0x08B95A64
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021AE0 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021ADC: .4byte 0x08B95A64
_08021AE0: .4byte 0x03004690

	thumb_func_start StartFightItemReview
StartFightItemReview: @ 0x08021AE4
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021B2C @ =0x08B95A88
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021B30 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	bl sub_080790B8
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021B2C: .4byte 0x08B95A88
_08021B30: .4byte 0x03004690

	thumb_func_start DisplayUnitStandingAttackRange
DisplayUnitStandingAttackRange: @ 0x08021B34
	push {r4, r5, lr}
	ldr r0, _08021B70 @ =0x0202E3E4
	ldr r0, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl BmMapFillg
	ldr r0, _08021B74 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08021B78 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08021B7C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #1
	movs r3, #0xa
	bl MapAddInBoundedRange
	b _08021B8C
	.align 2, 0
_08021B70: .4byte 0x0202E3E4
_08021B74: .4byte 0x0202E3E8
_08021B78: .4byte 0x03004690
_08021B7C:
	adds r0, r2, #0
	adds r1, r5, #0
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
_08021B8C:
	movs r0, #3
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08021B9C
sub_08021B9C: @ 0x08021B9C
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start WeaponSelectMenu_IsAvailable
WeaponSelectMenu_IsAvailable: @ 0x08021BA8
	push {r4, r5, lr}
	ldr r5, _08021BE8 @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08021BEC
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021BEC
	ldr r0, [r5]
	adds r1, r4, #0
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	beq _08021BEC
	movs r0, #1
	b _08021BEE
	.align 2, 0
_08021BE8: .4byte 0x03004690
_08021BEC:
	movs r0, #3
_08021BEE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start WeaponSelectMenu_Selected
WeaponSelectMenu_Selected: @ 0x08021BF4
	push {r4, lr}
	ldr r4, _08021C2C @ =0x03004690
	ldr r0, [r4]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r1, _08021C30 @ =0x0203A85C
	movs r0, #0
	strb r0, [r1, #0x12]
	bl ClearUi
	ldr r0, [r4]
	ldrh r1, [r0, #0x1e]
	bl ListAttackTargetsForWeapon
	ldr r0, _08021C34 @ =0x08B95C98
	bl StartMapSelect
	bl sub_080790BC
	movs r0, #0x27
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08021C2C: .4byte 0x03004690
_08021C30: .4byte 0x0203A85C
_08021C34: .4byte 0x08B95C98

	thumb_func_start WeaponSelectMenu_Draw
WeaponSelectMenu_Draw: @ 0x08021C38
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08021C80 @ =0x03004690
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	adds r1, r4, #0
	bl CanUnitUseWeapon
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
	ldr r1, _08021C84 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08021C80: .4byte 0x03004690
_08021C84: .4byte 0x02022C60

	thumb_func_start WeaponSelectMenu_SwitchIn
WeaponSelectMenu_SwitchIn: @ 0x08021C88
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl UpdateMenuItemPanel
	ldr r0, _08021CD0 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08021CD4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08021CD8 @ =0x03004690
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021CD0: .4byte 0x0202E3E4
_08021CD4: .4byte 0x0202E3E8
_08021CD8: .4byte 0x03004690

	thumb_func_start sub_08021CDC
sub_08021CDC: @ 0x08021CDC
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08021CEE
	bl HideMoveRangeGraphics
_08021CEE:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_08021CF4
sub_08021CF4: @ 0x08021CF4
	push {lr}
	ldr r2, _08021D20 @ =0x0203A85C
	movs r0, #2
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08021D14
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	ldrb r0, [r1, #3]
	strb r0, [r2, #0x15]
_08021D14:
	ldr r0, _08021D24 @ =0x08B96D5C
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021D20: .4byte 0x0203A85C
_08021D24: .4byte 0x08B96D5C

	thumb_func_start sub_08021D28
sub_08021D28: @ 0x08021D28
	push {lr}
	ldr r0, _08021D40 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl EnsureCameraOntoPosition
	pop {r0}
	bx r0
	.align 2, 0
_08021D40: .4byte 0x03004690

	thumb_func_start GoToFightItemReview
GoToFightItemReview: @ 0x08021D44
	push {lr}
	movs r0, #0
	movs r1, #0
	bl UnitAttackCommandEffect
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08021D54
sub_08021D54: @ 0x08021D54
	push {lr}
	ldr r0, _08021D64 @ =0x08B93E0C
	movs r1, #3
	bl Proc_Start
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_08021D64: .4byte 0x08B93E0C

	thumb_func_start AttackMapSelect_SwitchIn
AttackMapSelect_SwitchIn: @ 0x08021D68
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08021D9E
	ldr r1, _08021DBC @ =0x0203A85C
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
	bl InitObstacleBattleUnit
_08021D9E:
	ldr r1, _08021DBC @ =0x0203A85C
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _08021DC4
	ldr r0, _08021DC0 @ =0x03004690
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	adds r1, r5, #0
	bl BattleGenerateBallistaSimulation
	b _08021DD8
	.align 2, 0
_08021DBC: .4byte 0x0203A85C
_08021DC0: .4byte 0x03004690
_08021DC4:
	ldr r0, _08021DE8 @ =0x03004690
	ldr r0, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	ldrb r1, [r1, #0x12]
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r3, #0
	bl BattleGenerateSimulation
_08021DD8:
	bl UpdateBattleForecastContents
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021DE8: .4byte 0x03004690

	thumb_func_start AttackMapSelect_End
AttackMapSelect_End: @ 0x08021DEC
	push {lr}
	ldr r0, _08021E0C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl CloseBattleForecast
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08021E0C: .4byte 0x02023C60

	thumb_func_start sub_08021E10
sub_08021E10: @ 0x08021E10
	push {lr}
	ldr r0, _08021E54 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	ldr r1, _08021E58 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	adds r0, r2, #0
	bl MakeTradeTargetList
	bl CountTargets
	cmp r0, #0
	beq _08021E5C
	movs r0, #1
	b _08021E5E
	.align 2, 0
_08021E54: .4byte 0x03004690
_08021E58: .4byte 0x0202BBB8
_08021E5C:
	movs r0, #3
_08021E5E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start TradeCommandEffect
TradeCommandEffect: @ 0x08021E64
	push {lr}
	bl ClearUi
	ldr r0, _08021E80 @ =0x03004690
	ldr r0, [r0]
	bl MakeTradeTargetList
	ldr r0, _08021E84 @ =0x08B95C78
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021E80: .4byte 0x03004690
_08021E84: .4byte 0x08B95C78

	thumb_func_start sub_08021E88
sub_08021E88: @ 0x08021E88
	push {r4, lr}
	ldr r2, _08021EB0 @ =0x0203A85C
	movs r0, #0x1a
	strb r0, [r2, #0x11]
	ldr r0, _08021EB4 @ =0x03004690
	ldr r4, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_0802B678
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08021EB0: .4byte 0x0203A85C
_08021EB4: .4byte 0x03004690

	thumb_func_start UnitActionMenu_Seize_Available
UnitActionMenu_Seize_Available: @ 0x08021EB8
	push {r4, lr}
	ldr r4, _08021ED8 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021ED4
	adds r0, r2, #0
	bl sub_08034884
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021EDC
_08021ED4:
	movs r0, #3
	b _08021EF6
	.align 2, 0
_08021ED8: .4byte 0x03004690
_08021EDC:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0xf
	bne _08021EF4
	movs r1, #1
_08021EF4:
	adds r0, r1, #0
_08021EF6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08021EFC
sub_08021EFC: @ 0x08021EFC
	ldr r1, _08021F14 @ =0x0203A85C
	movs r0, #0xf
	strb r0, [r1, #0x11]
	ldr r0, _08021F18 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021F14: .4byte 0x0203A85C
_08021F18: .4byte 0x03004690

	thumb_func_start sub_08021F1C
sub_08021F1C: @ 0x08021F1C
	push {r4, lr}
	ldr r0, _08021F6C @ =0x03004690
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	movs r2, #0x40
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	bne _08021F68
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	ldr r1, _08021F70 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _08021F54
	cmp r0, #5
	beq _08021F54
	cmp r0, #0x38
	beq _08021F54
	cmp r0, #0x37
	bne _08021F68
_08021F54:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xe
	beq _08021F74
_08021F68:
	movs r0, #3
	b _08021F86
	.align 2, 0
_08021F6C: .4byte 0x03004690
_08021F70: .4byte 0x0202E3E0
_08021F74:
	ldr r0, [r4]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021F84
	movs r0, #1
	b _08021F86
_08021F84:
	movs r0, #2
_08021F86:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08021F8C
sub_08021F8C: @ 0x08021F8C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08021FA4
	ldr r1, _08021FA0 @ =0x0203A85C
	movs r0, #0xe
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _08021FAC
	.align 2, 0
_08021FA0: .4byte 0x0203A85C
_08021FA4:
	ldr r1, _08021FB0 @ =0x00000736
	bl MenuFrozenHelpBox
	movs r0, #8
_08021FAC:
	pop {r1}
	bx r1
	.align 2, 0
_08021FB0: .4byte 0x00000736

	thumb_func_start sub_08021FB4
sub_08021FB4: @ 0x08021FB4
	push {r4, r5, r6, lr}
	ldr r6, _08021FD8 @ =0x03004690
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022012
	adds r0, r2, #0
	bl MakeTargetListForRefresh
	bl CountTargets
	cmp r0, #0
	beq _08021FDC
_08021FD2:
	movs r0, #1
	b _08022014
	.align 2, 0
_08021FD8: .4byte 0x03004690
_08021FDC:
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _08022012
_08021FE6:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08021FFE
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021FD2
_08021FFE:
	adds r5, #1
	cmp r5, #4
	bgt _08022012
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08021FE6
_08022012:
	movs r0, #3
_08022014:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802201C
sub_0802201C: @ 0x0802201C
	push {lr}
	adds r3, r0, #0
	ldr r0, _08022048 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08022050
	ldr r1, _0802204C @ =0x0202BBB8
	movs r0, #0x9e
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_08021FB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022052
	.align 2, 0
_08022048: .4byte 0x03004690
_0802204C: .4byte 0x0202BBB8
_08022050:
	movs r0, #3
_08022052:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022058
sub_08022058: @ 0x08022058
	push {lr}
	adds r3, r0, #0
	ldr r0, _08022084 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802208C
	ldr r1, _08022088 @ =0x0202BBB8
	movs r0, #0x9d
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_08021FB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0802208E
	.align 2, 0
_08022084: .4byte 0x03004690
_08022088: .4byte 0x0202BBB8
_0802208C:
	movs r0, #3
_0802208E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PlayCommandEffect
PlayCommandEffect: @ 0x08022094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	mov sl, r1
	movs r7, #0
	ldr r6, _0802210C @ =0x03004690
	ldr r0, [r6]
	bl MakeTargetListForRefresh
	bl CountTargets
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _080220F2
_080220C4:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _080220DE
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080220DE
	movs r7, #1
_080220DE:
	adds r5, #1
	cmp r5, #4
	bgt _080220F2
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080220C4
_080220F2:
	mov r0, r8
	cmp r0, #0
	beq _08022110
	cmp r7, #0
	bne _08022110
	mov r0, sb
	mov r1, sl
	bl ItemMenu_Select1stCommand
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022150
	.align 2, 0
_0802210C: .4byte 0x03004690
_08022110:
	ldr r0, _08022160 @ =0x08B959F8
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08022164 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0x17
_08022150:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022160: .4byte 0x08B959F8
_08022164: .4byte 0x03004690

	thumb_func_start RefreshMapSelect_Select
RefreshMapSelect_Select: @ 0x08022168
	ldr r2, _08022178 @ =0x0203A85C
	movs r0, #4
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022178: .4byte 0x0203A85C

	thumb_func_start sub_0802217C
sub_0802217C: @ 0x0802217C
	ldr r0, _08022194 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022198
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	beq _08022198
	movs r0, #1
	b _0802219A
	.align 2, 0
_08022194: .4byte 0x03004690
_08022198:
	movs r0, #3
_0802219A:
	bx lr

	thumb_func_start sub_0802219C
sub_0802219C: @ 0x0802219C
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _080221F8
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ResetTextFont
	ldr r0, _080221F0 @ =0x08B95A40
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080221F4 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #0x17
	b _080221FA
	.align 2, 0
_080221F0: .4byte 0x08B95A40
_080221F4: .4byte 0x03004690
_080221F8:
	movs r0, #0
_080221FA:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemSelectMenu_TextDraw
ItemSelectMenu_TextDraw: @ 0x08022204
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r7, _0802223C @ =0x03004690
	ldr r1, [r7]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022240
	adds r0, r6, #0
	adds r1, r4, #0
	bl WeaponSelectMenu_Draw
	movs r0, #0
	b _08022280
	.align 2, 0
_0802223C: .4byte 0x03004690
_08022240:
	adds r0, r5, #0
	bl GetItemType
	cmp r0, #0xc
	bne _0802224E
	movs r2, #0
	b _0802225A
_0802224E:
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0802225A:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r4, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08022288 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r5, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl EnableBgSync
_08022280:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022288: .4byte 0x02022C60

	thumb_func_start ItemSelectMenu_Usability
ItemSelectMenu_Usability: @ 0x0802228C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r7, _080222A8 @ =0x03004690
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080222AC
	movs r0, #3
	b _080222D6
	.align 2, 0
_080222A8: .4byte 0x03004690
_080222AC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080222C2
	adds r0, r6, #0
	adds r1, r5, #0
	bl WeaponSelectMenu_IsAvailable
_080222C2:
	ldr r0, [r7]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080222D4
	movs r1, #1
_080222D4:
	adds r0, r1, #0
_080222D6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080222DC
sub_080222DC: @ 0x080222DC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08022334 @ =0x0203A85C
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x2a]
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08022338 @ =0xFFFFFF00
	ands r5, r2
	orrs r5, r0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _0802233C @ =0xFFFF00FF
	ands r5, r1
	orrs r5, r0
	ldr r0, _08022340 @ =0xFF00FFFF
	ands r5, r0
	movs r0, #0xc0
	lsls r0, r0, #0xb
	orrs r5, r0
	ldr r0, _08022344 @ =0x00FFFFFF
	ands r5, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	bl sub_08022360
	ldr r0, _08022348 @ =0x08B959D4
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	movs r0, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022334: .4byte 0x0203A85C
_08022338: .4byte 0xFFFFFF00
_0802233C: .4byte 0xFFFF00FF
_08022340: .4byte 0xFF00FFFF
_08022344: .4byte 0x00FFFFFF
_08022348: .4byte 0x08B959D4

	thumb_func_start sub_0802234C
sub_0802234C: @ 0x0802234C
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl UpdateMenuItemPanel
	pop {r1}
	bx r1

	thumb_func_start sub_0802235C
sub_0802235C: @ 0x0802235C
	bx lr
	.align 2, 0

	thumb_func_start sub_08022360
sub_08022360: @ 0x08022360
	push {lr}
	ldr r0, _0802238C @ =0x02002774
	ldr r1, _08022390 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl InitTextFont
	ldr r0, _08022394 @ =0x02022CB6
	ldr r1, _08022398 @ =0x0200323C
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _0802239C @ =0x020234B6
	ldr r1, _080223A0 @ =0x0200373C
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	pop {r0}
	bx r0
	.align 2, 0
_0802238C: .4byte 0x02002774
_08022390: .4byte 0x06004000
_08022394: .4byte 0x02022CB6
_08022398: .4byte 0x0200323C
_0802239C: .4byte 0x020234B6
_080223A0: .4byte 0x0200373C

	thumb_func_start sub_080223A4
sub_080223A4: @ 0x080223A4
	push {lr}
	movs r0, #0
	bl SetTextFont
	pop {r0}
	bx r0

	thumb_func_start MenuCommand_SelectNo
MenuCommand_SelectNo: @ 0x080223B0
	push {lr}
	movs r0, #0
	bl SetTextFont
	ldr r0, _080223DC @ =0x0200323C
	ldr r1, _080223E0 @ =0x02022CB6
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _080223E4 @ =0x0200373C
	ldr r1, _080223E8 @ =0x020234B6
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_080223DC: .4byte 0x0200323C
_080223E0: .4byte 0x02022CB6
_080223E4: .4byte 0x0200373C
_080223E8: .4byte 0x020234B6

	thumb_func_start sub_080223EC
sub_080223EC: @ 0x080223EC
	push {lr}
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x31
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022404
sub_08022404: @ 0x08022404
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_080223EC
	adds r0, r4, #0
	bl MenuCommand_SelectNo
	ldr r0, _08022454 @ =0x08B95A40
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08022458 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022454: .4byte 0x08B95A40
_08022458: .4byte 0x03004690

	thumb_func_start sub_0802245C
sub_0802245C: @ 0x0802245C
	push {r4, r5, r6, lr}
	sub sp, #4
	bl sub_080223EC
	ldr r6, _080224E4 @ =0x03004690
	ldr r0, [r6]
	bl GetUnitItemCount
	cmp r0, #0
	beq _080224FC
	ldr r0, _080224E8 @ =0x0200323C
	ldr r5, _080224EC @ =0x02022CB6
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _080224F0 @ =0x0200373C
	ldr r4, _080224F4 @ =0x020234B6
	adds r1, r4, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	subs r5, #0x14
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	subs r4, #0x14
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	ldr r0, _080224F8 @ =0x08B95A40
	bl StartMenu
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r6]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #1
	b _0802251E
	.align 2, 0
_080224E4: .4byte 0x03004690
_080224E8: .4byte 0x0200323C
_080224EC: .4byte 0x02022CB6
_080224F0: .4byte 0x0200373C
_080224F4: .4byte 0x020234B6
_080224F8: .4byte 0x08B95A40
_080224FC:
	bl ClearUi
	movs r0, #0
	bl EndFaceById
	ldr r0, _08022528 @ =0x08B95AAC
	ldr r2, _0802252C @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	movs r0, #0x1b
_0802251E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022528: .4byte 0x08B95AAC
_0802252C: .4byte 0x0202BBB8

	thumb_func_start sub_08022530
sub_08022530: @ 0x08022530
	push {r4, r5, lr}
	ldr r5, _08022580 @ =0x03004690
	ldr r0, [r5]
	ldr r1, _08022584 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemEffect
	cmp r0, #0
	beq _0802257C
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	beq _0802257C
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	beq _0802257C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022588
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022588
_0802257C:
	movs r0, #3
	b _0802259E
	.align 2, 0
_08022580: .4byte 0x03004690
_08022584: .4byte 0x0203A85C
_08022588:
	ldr r0, _080225A4 @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0802259C
	movs r1, #1
_0802259C:
	adds r0, r1, #0
_0802259E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080225A4: .4byte 0x03004690

	thumb_func_start sub_080225A8
sub_080225A8: @ 0x080225A8
	push {r4, r5, lr}
	ldr r5, _080225CC @ =0x03004690
	ldr r0, [r5]
	ldr r1, _080225D0 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080225D4
	movs r0, #3
	b _080225E8
	.align 2, 0
_080225CC: .4byte 0x03004690
_080225D0: .4byte 0x0203A85C
_080225D4:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080225E6
	movs r1, #1
_080225E6:
	adds r0, r1, #0
_080225E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080225F0
sub_080225F0: @ 0x080225F0
	push {lr}
	ldr r0, _08022614 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _08022618 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0802261C
	movs r0, #1
	b _0802261E
	.align 2, 0
_08022614: .4byte 0x03004690
_08022618: .4byte 0x0203A85C
_0802261C:
	movs r0, #2
_0802261E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022624
sub_08022624: @ 0x08022624
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _0802265C
	ldr r0, _08022654 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _08022658 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetItemCantUseMsgid
	adds r1, r0, #0
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _08022698
	.align 2, 0
_08022654: .4byte 0x03004690
_08022658: .4byte 0x0203A85C
_0802265C:
	bl ClearUi
	ldr r0, _080226A0 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _080226A4 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	ldr r0, _080226A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08022688
	ldr r0, _080226AC @ =0x0000038A
	bl m4aSongNumStart
_08022688:
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x21
_08022698:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080226A0: .4byte 0x03004690
_080226A4: .4byte 0x0203A85C
_080226A8: .4byte 0x0202BBF8
_080226AC: .4byte 0x0000038A

	thumb_func_start sub_080226B0
sub_080226B0: @ 0x080226B0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080226DC
	ldr r0, _080226D4 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _080226D8 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	bl EquipUnitItemSlot
	adds r0, r4, #0
	bl sub_08022404
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080226E6
	.align 2, 0
_080226D4: .4byte 0x03004690
_080226D8: .4byte 0x0203A85C
_080226DC:
	ldr r1, _080226EC @ =0x00000737
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080226E6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080226EC: .4byte 0x00000737

	thumb_func_start ItemSubMenu_TradeItem
ItemSubMenu_TradeItem: @ 0x080226F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0802271C @ =0x0202BBB8
	ldr r1, _08022720 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	adds r0, #0x3f
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_080223EC
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	adds r1, r5, #0
	bl TradeCommandEffect
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802271C: .4byte 0x0202BBB8
_08022720: .4byte 0x0203A85C

	thumb_func_start sub_08022724
sub_08022724: @ 0x08022724
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _08022784
	ldrh r0, [r2, #0x2a]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08022770 @ =0xFFFFFF00
	ands r3, r1
	orrs r3, r0
	ldrh r2, [r2, #0x2c]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08022774 @ =0xFFFF00FF
	ands r3, r1
	orrs r3, r0
	ldr r0, _08022778 @ =0xFF00FFFF
	ands r3, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r3, r0
	ldr r0, _0802277C @ =0x00FFFFFF
	ands r3, r0
	ldr r0, _08022780 @ =0x08B959B0
	adds r1, r3, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	adds r0, #0x61
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x84
	b _0802278E
	.align 2, 0
_08022770: .4byte 0xFFFFFF00
_08022774: .4byte 0xFFFF00FF
_08022778: .4byte 0xFF00FFFF
_0802277C: .4byte 0x00FFFFFF
_08022780: .4byte 0x08B959B0
_08022784:
	ldr r1, _08022794 @ =0x00000739
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_0802278E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022794: .4byte 0x00000739

	thumb_func_start MenuCommand_SelectYes
MenuCommand_SelectYes: @ 0x08022798
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080227C4 @ =0x03004690
	ldr r0, [r0]
	ldr r4, _080227C8 @ =0x0203A85C
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080227B6
	ldr r0, _080227CC @ =0x02022C60
	movs r1, #0
	bl TmFill
_080227B6:
	adds r0, r5, #0
	bl sub_0802245C
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080227C4: .4byte 0x03004690
_080227C8: .4byte 0x0203A85C
_080227CC: .4byte 0x02022C60

	thumb_func_start BallistaRangeMenu_BallistaUsability
BallistaRangeMenu_BallistaUsability: @ 0x080227D0
	push {lr}
	ldr r0, _080227E4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080227E8
	movs r0, #3
	b _08022804
	.align 2, 0
_080227E4: .4byte 0x03004690
_080227E8:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetBallistaItemAt
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08022802
	movs r0, #2
	b _08022804
_08022802:
	movs r0, #1
_08022804:
	pop {r1}
	bx r1

	thumb_func_start BallistaRangeMenu_Draw
BallistaRangeMenu_Draw: @ 0x08022808
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802281A
	movs r5, #1
_0802281A:
	ldr r0, _08022850 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	adds r2, r5, #0
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r4, [r4, r5]
	adds r3, r3, r4
	lsls r3, r3, #1
	ldr r4, _08022854 @ =0x02022C60
	adds r3, r3, r4
	bl DrawItemMenuLine
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022850: .4byte 0x03004690
_08022854: .4byte 0x02022C60

	thumb_func_start BallistaRangeMenu_Select
BallistaRangeMenu_Select: @ 0x08022858
	push {lr}
	bl ClearUi
	ldr r1, _08022878 @ =0x0203A85C
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, _0802287C @ =0x03004690
	ldr r0, [r0]
	bl FillBallistaRangeMaybe
	ldr r0, _08022880 @ =0x08B95C98
	bl StartMapSelect
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
_08022878: .4byte 0x0203A85C
_0802287C: .4byte 0x03004690
_08022880: .4byte 0x08B95C98

	thumb_func_start FillBallistaRange
FillBallistaRange: @ 0x08022884
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08022900 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r4, _08022904 @ =0x0202E3E8
	ldr r0, [r4]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r4, _08022908 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r5, r0, #0
	bl UpdateMenuItemPanel
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
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
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022900: .4byte 0x0202E3E4
_08022904: .4byte 0x0202E3E8
_08022908: .4byte 0x03004690

	thumb_func_start StaffCommandUsability
StaffCommandUsability: @ 0x0802290C
	push {r4, r5, r6, lr}
	ldr r0, _08022920 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022928
	b _08022976
	.align 2, 0
_08022920: .4byte 0x03004690
_08022924:
	movs r0, #2
	b _08022978
_08022928:
	movs r6, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _08022976
_08022930:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08022960
	ldr r5, _0802295C @ =0x03004690
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022960
	ldr r0, [r5]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022924
	movs r0, #1
	b _08022978
	.align 2, 0
_0802295C: .4byte 0x03004690
_08022960:
	adds r6, #1
	cmp r6, #4
	bgt _08022976
	ldr r0, _08022980 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08022930
_08022976:
	movs r0, #3
_08022978:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022980: .4byte 0x03004690

	thumb_func_start sub_08022984
sub_08022984: @ 0x08022984
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080229DC
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080229D4 @ =0x08B95A1C
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080229D8 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #0x17
	b _080229E4
	.align 2, 0
_080229D4: .4byte 0x08B95A1C
_080229D8: .4byte 0x03004690
_080229DC:
	ldr r1, _080229EC @ =0x0000073B
	bl MenuFrozenHelpBox
	movs r0, #8
_080229E4:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080229EC: .4byte 0x0000073B

	thumb_func_start StaffCommandRange
StaffCommandRange: @ 0x080229F0
	push {r4, r5, r6, lr}
	ldr r5, _08022A2C @ =0x03004690
	ldr r0, [r5]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	ldr r0, _08022A30 @ =0x0202E3E4
	ldr r0, [r0]
	adds r1, r4, #0
	bl BmMapFillg
	ldr r0, _08022A34 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #5
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022A2C: .4byte 0x03004690
_08022A30: .4byte 0x0202E3E4
_08022A34: .4byte 0x0202E3E8

	thumb_func_start sub_08022A38
sub_08022A38: @ 0x08022A38
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start StaffItemSelect_Usability
StaffItemSelect_Usability: @ 0x08022A44
	push {r4, r5, lr}
	ldr r5, _08022A70 @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08022A74
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022A74
	movs r0, #1
	b _08022A76
	.align 2, 0
_08022A70: .4byte 0x03004690
_08022A74:
	movs r0, #3
_08022A76:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08022A7C
sub_08022A7C: @ 0x08022A7C
	push {r4, r5, lr}
	ldr r5, _08022AB4 @ =0x03004690
	ldr r0, [r5]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r4, _08022AB8 @ =0x0203A85C
	movs r0, #0
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, [r5]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022AB4: .4byte 0x03004690
_08022AB8: .4byte 0x0203A85C

	thumb_func_start sub_08022ABC
sub_08022ABC: @ 0x08022ABC
	push {lr}
	bl ItemSelectMenu_TextDraw
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StaffItemSelect_OnHover
StaffItemSelect_OnHover: @ 0x08022AC8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, _08022B10 @ =0x03004690
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl UpdateMenuItemPanel
	ldr r0, _08022B14 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08022B18 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #4
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022B10: .4byte 0x03004690
_08022B14: .4byte 0x0202E3E4
_08022B18: .4byte 0x0202E3E8

	thumb_func_start sub_08022B1C
sub_08022B1C: @ 0x08022B1C
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08022B2E
	bl HideMoveRangeGraphics
_08022B2E:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_08022B34
sub_08022B34: @ 0x08022B34
	push {r4, lr}
	ldr r4, _08022B58 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022B52
	adds r0, r2, #0
	bl sub_08024094
	bl CountTargets
	cmp r0, #0
	bne _08022B5C
_08022B52:
	movs r0, #3
	b _08022B70
	.align 2, 0
_08022B58: .4byte 0x03004690
_08022B5C:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08022B6E
	movs r0, #1
	b _08022B70
_08022B6E:
	movs r0, #2
_08022B70:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022B78
sub_08022B78: @ 0x08022B78
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022B9C
	ldr r0, _08022B94 @ =0x03004690
	ldr r0, [r0]
	bl sub_08024094
	ldr r0, _08022B98 @ =0x08B95C38
	bl StartMapSelect
	movs r0, #7
	b _08022BA4
	.align 2, 0
_08022B94: .4byte 0x03004690
_08022B98: .4byte 0x08B95C38
_08022B9C:
	ldr r1, _08022BA8 @ =0x0000073C
	bl MenuFrozenHelpBox
	movs r0, #8
_08022BA4:
	pop {r1}
	bx r1
	.align 2, 0
_08022BA8: .4byte 0x0000073C

	thumb_func_start sub_08022BAC
sub_08022BAC: @ 0x08022BAC
	ldr r2, _08022BBC @ =0x0203A85C
	movs r0, #0xc
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022BBC: .4byte 0x0203A85C

	thumb_func_start sub_08022BC0
sub_08022BC0: @ 0x08022BC0
	push {r4, lr}
	ldr r4, _08022BF0 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022BEC
	adds r0, r2, #0
	bl sub_080240C8
	bl CountTargets
	cmp r0, #0
	beq _08022BEC
	ldr r0, [r4]
	bl sub_08024094
	bl CountTargets
	cmp r0, #0
	beq _08022BF4
_08022BEC:
	movs r0, #3
	b _08022C08
	.align 2, 0
_08022BF0: .4byte 0x03004690
_08022BF4:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08022C06
	movs r0, #1
	b _08022C08
_08022C06:
	movs r0, #2
_08022C08:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022C10
sub_08022C10: @ 0x08022C10
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022C34
	ldr r0, _08022C2C @ =0x03004690
	ldr r0, [r0]
	bl sub_080240C8
	ldr r0, _08022C30 @ =0x08B95C18
	bl StartMapSelect
	movs r0, #7
	b _08022C3C
	.align 2, 0
_08022C2C: .4byte 0x03004690
_08022C30: .4byte 0x08B95C18
_08022C34:
	ldr r1, _08022C40 @ =0x0000073C
	bl MenuFrozenHelpBox
	movs r0, #8
_08022C3C:
	pop {r1}
	bx r1
	.align 2, 0
_08022C40: .4byte 0x0000073C

	thumb_func_start sub_08022C44
sub_08022C44: @ 0x08022C44
	ldr r2, _08022C54 @ =0x0203A85C
	movs r0, #0xd
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022C54: .4byte 0x0203A85C

	thumb_func_start DoorCommandUsability
DoorCommandUsability: @ 0x08022C58
	push {r4, lr}
	ldr r4, _08022C78 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022C74
	adds r0, r2, #0
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08022C7C
_08022C74:
	movs r0, #3
	b _08022C92
	.align 2, 0
_08022C78: .4byte 0x03004690
_08022C7C:
	ldr r0, [r4]
	movs r1, #0x1e
	bl MakeTargetListForDoorAndBridges
	bl CountTargets
	movs r1, #3
	cmp r0, #0
	beq _08022C90
	movs r1, #1
_08022C90:
	adds r0, r1, #0
_08022C92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022C98
sub_08022C98: @ 0x08022C98
	push {r4, lr}
	ldr r4, _08022CB8 @ =0x0203A85C
	movs r0, #0x10
	strb r0, [r4, #0x11]
	ldr r0, _08022CBC @ =0x03004690
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	strb r1, [r4, #0xc]
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022CB8: .4byte 0x0203A85C
_08022CBC: .4byte 0x03004690

	thumb_func_start ChestCommandUsability
ChestCommandUsability: @ 0x08022CC0
	push {r4, lr}
	ldr r4, _08022CE0 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022CDC
	adds r0, r2, #0
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08022CE4
_08022CDC:
	movs r0, #3
	b _08022CF6
	.align 2, 0
_08022CE0: .4byte 0x03004690
_08022CE4:
	ldr r0, [r4]
	bl CanUnitUseChestKeyItem
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _08022CF4
	movs r1, #1
_08022CF4:
	adds r0, r1, #0
_08022CF6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022CFC
sub_08022CFC: @ 0x08022CFC
	push {r4, lr}
	ldr r4, _08022D18 @ =0x0203A85C
	movs r0, #0x12
	strb r0, [r4, #0x11]
	ldr r0, _08022D1C @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022D18: .4byte 0x0203A85C
_08022D1C: .4byte 0x03004690

	thumb_func_start sub_08022D20
sub_08022D20: @ 0x08022D20
	push {r4, lr}
	ldr r0, _08022D98 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	ldr r1, _08022D9C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _08022D50
	bl GetConvoyItemCount
	cmp r0, #0
	beq _08022DAC
_08022D50:
	bl sub_08079D9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022DAC
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	ldr r0, _08022D98 @ =0x03004690
	ldr r4, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	subs r1, r0, r2
	cmp r1, #0
	bge _08022D80
	subs r1, r2, r0
_08022D80:
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	subs r0, r4, r2
	cmp r0, #0
	blt _08022DA0
	adds r0, r1, r0
	cmp r0, #1
	beq _08022DA8
	b _08022DAC
	.align 2, 0
_08022D98: .4byte 0x03004690
_08022D9C: .4byte 0x0202BBB8
_08022DA0:
	subs r0, r2, r4
	adds r0, r1, r0
	cmp r0, #1
	bne _08022DAC
_08022DA8:
	movs r0, #1
	b _08022DAE
_08022DAC:
	movs r0, #3
_08022DAE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022DB4
sub_08022DB4: @ 0x08022DB4
	push {lr}
	ldr r1, _08022DCC @ =0x0203A85C
	movs r0, #0x1a
	strb r0, [r1, #0x11]
	ldr r0, _08022DD0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0
	bl StartBmSupply
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022DCC: .4byte 0x0203A85C
_08022DD0: .4byte 0x03004690

	thumb_func_start sub_08022DD4
sub_08022DD4: @ 0x08022DD4
	push {lr}
	ldr r0, _08022DE8 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022DEC
	movs r0, #3
	b _08022E02
	.align 2, 0
_08022DE8: .4byte 0x03004690
_08022DEC:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x13
	bne _08022E00
	movs r1, #1
_08022E00:
	adds r0, r1, #0
_08022E02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022E08
sub_08022E08: @ 0x08022E08
	push {lr}
	ldr r0, _08022E24 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022E24: .4byte 0x03004690

	thumb_func_start sub_08022E28
sub_08022E28: @ 0x08022E28
	push {lr}
	ldr r0, _08022E3C @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022E40
	movs r0, #3
	b _08022E56
	.align 2, 0
_08022E3C: .4byte 0x03004690
_08022E40:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x14
	bne _08022E54
	movs r1, #1
_08022E54:
	adds r0, r1, #0
_08022E56:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022E5C
sub_08022E5C: @ 0x08022E5C
	push {lr}
	ldr r0, _08022E78 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022E78: .4byte 0x03004690

	thumb_func_start sub_08022E7C
sub_08022E7C: @ 0x08022E7C
	push {lr}
	ldr r0, _08022E90 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022E94
	movs r0, #3
	b _08022EAA
	.align 2, 0
_08022E90: .4byte 0x03004690
_08022E94:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x15
	bne _08022EA8
	movs r1, #1
_08022EA8:
	adds r0, r1, #0
_08022EAA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022EB0
sub_08022EB0: @ 0x08022EB0
	push {lr}
	ldr r0, _08022ECC @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022ECC: .4byte 0x03004690

	thumb_func_start sub_08022ED0
sub_08022ED0: @ 0x08022ED0
	push {lr}
	ldr r0, _08022F00 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022EFA
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08022F04 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	beq _08022F08
_08022EFA:
	movs r0, #3
	b _08022F1A
	.align 2, 0
_08022F00: .4byte 0x03004690
_08022F04: .4byte 0x0202E3E0
_08022F08:
	adds r0, r2, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08022F18
	movs r1, #1
_08022F18:
	adds r0, r1, #0
_08022F1A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022F20
sub_08022F20: @ 0x08022F20
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _08022F5C
	ldr r0, _08022F44 @ =0x03004690
	ldr r0, [r0]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022F4C
	ldr r1, _08022F48 @ =0x0000073D
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	b _08022F54
	.align 2, 0
_08022F44: .4byte 0x03004690
_08022F48: .4byte 0x0000073D
_08022F4C:
	ldr r1, _08022F58 @ =0x0000073E
	adds r0, r4, #0
	bl MenuFrozenHelpBox
_08022F54:
	movs r0, #8
	b _08022F62
	.align 2, 0
_08022F58: .4byte 0x0000073E
_08022F5C:
	bl sub_080B267C
	movs r0, #0x17
_08022F62:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022F68
sub_08022F68: @ 0x08022F68
	movs r0, #3
	bx lr

	thumb_func_start sub_08022F6C
sub_08022F6C: @ 0x08022F6C
	ldr r1, _08022F74 @ =0x0203A85C
	movs r0, #0x20
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08022F74: .4byte 0x0203A85C

	thumb_func_start StealCommandUsability
StealCommandUsability: @ 0x08022F78
	push {r4, lr}
	ldr r4, _08022FAC @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08022FA8
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022FA8
	adds r0, r2, #0
	bl MakeTargetListForSteal
	bl CountTargets
	cmp r0, #0
	bne _08022FB0
_08022FA8:
	movs r0, #3
	b _08022FC0
	.align 2, 0
_08022FAC: .4byte 0x03004690
_08022FB0:
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	beq _08022FBE
	movs r0, #1
	b _08022FC0
_08022FBE:
	movs r0, #2
_08022FC0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022FC8
sub_08022FC8: @ 0x08022FC8
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022FF0
	bl ClearUi
	ldr r0, _08022FE8 @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForSteal
	ldr r0, _08022FEC @ =0x08B95BF8
	bl StartMapSelect
	movs r0, #7
	b _08022FF8
	.align 2, 0
_08022FE8: .4byte 0x03004690
_08022FEC: .4byte 0x08B95BF8
_08022FF0:
	ldr r1, _08022FFC @ =0x0000074B
	bl MenuFrozenHelpBox
	movs r0, #8
_08022FF8:
	pop {r1}
	bx r1
	.align 2, 0
_08022FFC: .4byte 0x0000074B

	thumb_func_start sub_08023000
sub_08023000: @ 0x08023000
	push {r4, lr}
	adds r4, r0, #0
	bl StartUnitInventoryInfoWindow
	ldr r0, _0802301C @ =0x00000721
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802301C: .4byte 0x00000721

	thumb_func_start sub_08023020
sub_08023020: @ 0x08023020
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
	bl RefreshUnitStealInventoryInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StealMapSelect_Select
StealMapSelect_Select: @ 0x08023044
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080230D4 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r6, #0xd]
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080230D8 @ =0x08B95920
	bl StartMenu
	adds r0, r4, #0
	bl EndTargetSelection
	ldr r0, _080230DC @ =0x020234E4
	ldr r1, _080230E0 @ =0x081960D4
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	movs r4, #0x38
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	ldr r5, _080230E4 @ =0x02022D26
	movs r1, #7
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl PutFace80x72_Core
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080230D4: .4byte 0x0203A85C
_080230D8: .4byte 0x08B95920
_080230DC: .4byte 0x020234E4
_080230E0: .4byte 0x081960D4
_080230E4: .4byte 0x02022D26

	thumb_func_start StealItemMenuCommand_Usability
StealItemMenuCommand_Usability: @ 0x080230E8
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _08023104 @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08023108
	movs r0, #3
	b _08023124
	.align 2, 0
_08023104: .4byte 0x0203A85C
_08023108:
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023122
	movs r0, #1
	b _08023124
_08023122:
	movs r0, #2
_08023124:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StealItemMenuCommand_Draw
StealItemMenuCommand_Draw: @ 0x0802312C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08023178 @ =0x0203A85C
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
	bl IsItemStealable
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
	ldr r1, _0802317C @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLine
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023178: .4byte 0x0203A85C
_0802317C: .4byte 0x02022C60

	thumb_func_start sub_08023180
sub_08023180: @ 0x08023180
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080231A4
	ldr r1, _080231A0 @ =0x0203A85C
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r0, #6
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _080231AE
	.align 2, 0
_080231A0: .4byte 0x0203A85C
_080231A4:
	ldr r1, _080231B4 @ =0x0000073F
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080231AE:
	pop {r1}
	bx r1
	.align 2, 0
_080231B4: .4byte 0x0000073F

	thumb_func_start ConvoyMenu_HelpBox
ConvoyMenu_HelpBox: @ 0x080231B8
	push {r4, lr}
	adds r4, r1, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _080231E4
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _080231E0 @ =0x0202BBB8
	ldrh r2, [r2, #0x2c]
	bl StartItemHelpBox
	movs r0, #0
	b _08023204
	.align 2, 0
_080231E0: .4byte 0x0202BBB8
_080231E4:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _0802320C @ =0x03004690
	ldr r3, [r2]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r3, #0x1e
	adds r3, r3, r2
	ldrh r2, [r3]
	bl StartItemHelpBox
_08023204:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802320C: .4byte 0x03004690

	thumb_func_start ItemMenu_HelpBox
ItemMenu_HelpBox: @ 0x08023210
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _08023244 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0x2a
	ldrsh r3, [r4, r1]
	lsls r3, r3, #3
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #3
	adds r4, #0x3c
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r0, r3, #0
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023244: .4byte 0x0203A85C

	thumb_func_start BallistaRangeMenuHelpBox
BallistaRangeMenuHelpBox: @ 0x08023248
	push {r4, r5, lr}
	movs r0, #0x2a
	ldrsh r5, [r1, r0]
	lsls r5, r5, #3
	movs r0, #0x2c
	ldrsh r4, [r1, r0]
	lsls r4, r4, #3
	ldr r0, _08023278 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartItemHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023278: .4byte 0x03004690

	thumb_func_start sub_0802327C
sub_0802327C: @ 0x0802327C
	push {lr}
	bl sub_08031DFC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08023288
sub_08023288: @ 0x08023288
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
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080232AC
sub_080232AC: @ 0x080232AC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803202C
	ldr r0, _080232C8 @ =0x0000071C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080232C8: .4byte 0x0000071C

	thumb_func_start sub_080232CC
sub_080232CC: @ 0x080232CC
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
	bl RefreshUnitRescueInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080232F0
sub_080232F0: @ 0x080232F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08023308 @ =0x0000071D
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023308: .4byte 0x0000071D

	thumb_func_start sub_0802330C
sub_0802330C: @ 0x0802330C
	bx lr
	.align 2, 0

	thumb_func_start sub_08023310
sub_08023310: @ 0x08023310
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080321E0
	ldr r0, _0802332C @ =0x0000071F
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802332C: .4byte 0x0000071F

	thumb_func_start sub_08023330
sub_08023330: @ 0x08023330
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
	bl RefreshUnitGiveInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023354
sub_08023354: @ 0x08023354
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803202C
	ldr r0, _08023370 @ =0x0000071E
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023370: .4byte 0x0000071E

	thumb_func_start sub_08023374
sub_08023374: @ 0x08023374
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
	bl RefreshUnitTakeInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023398
sub_08023398: @ 0x08023398
	push {r4, lr}
	adds r4, r0, #0
	bl StartUnitInventoryInfoWindow
	movs r0, #0xe4
	lsls r0, r0, #3
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TradeSelection_OnChange
TradeSelection_OnChange: @ 0x080233B8
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	bl ClearIcons
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitInventoryInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080233E0
sub_080233E0: @ 0x080233E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08031DFC
	ldr r0, _080233FC @ =0x00000723
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080233FC: .4byte 0x00000723

	thumb_func_start sub_08023400
sub_08023400: @ 0x08023400
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
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023424
sub_08023424: @ 0x08023424
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08031DFC
	ldr r0, _08023440 @ =0x00000724
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023440: .4byte 0x00000724

	thumb_func_start sub_08023444
sub_08023444: @ 0x08023444
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
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023468
sub_08023468: @ 0x08023468
	push {lr}
	bl sub_08031DFC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08023474
sub_08023474: @ 0x08023474
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
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023498
sub_08023498: @ 0x08023498
	push {lr}
	ldr r0, _080234E4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080234EC
	ldr r0, [r2, #0xc]
	movs r1, #0x83
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080234EC
	ldr r1, _080234E8 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080234EC
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _080234EC
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080234EC
	movs r0, #1
	b _080234EE
	.align 2, 0
_080234E4: .4byte 0x03004690
_080234E8: .4byte 0x0202BBB8
_080234EC:
	movs r0, #3
_080234EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080234F4
sub_080234F4: @ 0x080234F4
	push {r4, lr}
	ldr r1, _08023518 @ =0x0203A85C
	movs r0, #0x1e
	strb r0, [r1, #0x11]
	ldr r4, _0802351C @ =0x03004690
	ldr r0, [r4]
	bl RideBallista
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023518: .4byte 0x0203A85C
_0802351C: .4byte 0x03004690

	thumb_func_start sub_08023520
sub_08023520: @ 0x08023520
	ldr r0, _08023544 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802354C
	ldr r1, _08023548 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802354C
	movs r0, #1
	b _0802354E
	.align 2, 0
_08023544: .4byte 0x03004690
_08023548: .4byte 0x0202BBB8
_0802354C:
	movs r0, #3
_0802354E:
	bx lr

	thumb_func_start sub_08023550
sub_08023550: @ 0x08023550
	push {r4, lr}
	ldr r1, _08023574 @ =0x0203A85C
	movs r0, #0x1f
	strb r0, [r1, #0x11]
	ldr r4, _08023578 @ =0x03004690
	ldr r0, [r4]
	bl TryRemoveUnitFromBallista
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023574: .4byte 0x0203A85C
_08023578: .4byte 0x03004690

	thumb_func_start GetUnitAttackCommandAvailability
GetUnitAttackCommandAvailability: @ 0x0802357C
	push {r4, r5, r6, lr}
	ldr r0, _08023598 @ =0x03004690
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080235EC
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _080235A0
	b _080235EC
	.align 2, 0
_08023598: .4byte 0x03004690
_0802359C:
	movs r0, #1
	b _080235EE
_080235A0:
	movs r6, #0
	ldrh r4, [r1, #0x1e]
	cmp r4, #0
	beq _080235EC
_080235A8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080235D6
	ldr r5, _080235F4 @ =0x03004690
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080235D6
	ldr r0, [r5]
	adds r1, r4, #0
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	bne _0802359C
_080235D6:
	adds r6, #1
	cmp r6, #4
	bgt _080235EC
	ldr r0, _080235F4 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080235A8
_080235EC:
	movs r0, #3
_080235EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080235F4: .4byte 0x03004690

	thumb_func_start GetUnitAttackBallistaCommandAvailability
GetUnitAttackBallistaCommandAvailability: @ 0x080235F8
	push {r4, r5, lr}
	ldr r5, _0802363C @ =0x03004690
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08023638
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	adds r4, r0, #0
	bl sub_080347E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023638
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	orrs r1, r2
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	bne _08023640
_08023638:
	movs r0, #3
	b _08023650
	.align 2, 0
_0802363C: .4byte 0x03004690
_08023640:
	adds r0, r4, #0
	bl sub_0803483C
	cmp r0, #0
	beq _0802364E
	movs r0, #1
	b _08023650
_0802364E:
	movs r0, #2
_08023650:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemMenu_Is1stCommandAvailable
ItemMenu_Is1stCommandAvailable: @ 0x08023658
	push {lr}
	ldr r0, _08023670 @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForRefresh
	bl CountTargets
	cmp r0, #0
	beq _08023674
	movs r0, #1
	b _08023676
	.align 2, 0
_08023670: .4byte 0x03004690
_08023674:
	movs r0, #3
_08023676:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemMenu_Draw1stCommand
ItemMenu_Draw1stCommand: @ 0x0802367C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	ldr r0, _080236B8 @ =0x0202BBB8
	ldrh r0, [r0, #0x2c]
	bl GetItemName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080236BC @ =0x02022C60
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080236B8: .4byte 0x0202BBB8
_080236BC: .4byte 0x02022C60

	thumb_func_start ItemMenu_Select1stCommand
ItemMenu_Select1stCommand: @ 0x080236C0
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080236E4
	ldr r0, _080236DC @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForRefresh
	ldr r0, _080236E0 @ =0x08B95B98
	bl StartMapSelect
	movs r0, #0x27
	b _080236E6
	.align 2, 0
_080236DC: .4byte 0x03004690
_080236E0: .4byte 0x08B95B98
_080236E4:
	movs r0, #8
_080236E6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemMenu_AreOtherCommandsAvailable
ItemMenu_AreOtherCommandsAvailable: @ 0x080236EC
	push {r4, r5, lr}
	ldr r5, _08023718 @ =0x03004690
	ldr r0, [r5]
	subs r1, #1
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _0802371C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802371C
	movs r0, #1
	b _0802371E
	.align 2, 0
_08023718: .4byte 0x03004690
_0802371C:
	movs r0, #3
_0802371E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start ItemMenu_DrawOtherCommands
ItemMenu_DrawOtherCommands: @ 0x08023724
	push {r4, lr}
	adds r2, r1, #0
	ldr r0, _08023764 @ =0x03004690
	ldr r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x34
	movs r4, #0x2c
	ldrsh r3, [r2, r4]
	lsls r3, r3, #5
	movs r4, #0x2a
	ldrsh r2, [r2, r4]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, _08023768 @ =0x02022C60
	adds r3, r3, r2
	movs r2, #1
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023764: .4byte 0x03004690
_08023768: .4byte 0x02022C60

	thumb_func_start sub_0802376C
sub_0802376C: @ 0x0802376C
	push {r4, lr}
	ldr r4, _08023798 @ =0x0203A85C
	adds r1, #0x3c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, _0802379C @ =0x03004690
	ldr r0, [r0]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023798: .4byte 0x0203A85C
_0802379C: .4byte 0x03004690

	thumb_func_start ItemMenu_SwitchIn
ItemMenu_SwitchIn: @ 0x080237A0
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080237B4
	movs r0, #5
	bl UpdateMenuItemPanel
	b _080237BE
_080237B4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl UpdateMenuItemPanel
_080237BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080237C4
sub_080237C4: @ 0x080237C4
	bx lr
	.align 2, 0

	thumb_func_start ItemMenuHelpBox
ItemMenuHelpBox: @ 0x080237C8
	push {r4, lr}
	adds r3, r1, #0
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080237E4
	ldr r0, _080237E0 @ =0x0202BBB8
	ldrh r2, [r0, #0x2c]
	b _080237F6
	.align 2, 0
_080237E0: .4byte 0x0202BBB8
_080237E4:
	ldr r0, _0802380C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r2, [r1]
_080237F6:
	movs r1, #0x2a
	ldrsh r0, [r3, r1]
	lsls r0, r0, #3
	movs r4, #0x2c
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802380C: .4byte 0x03004690
