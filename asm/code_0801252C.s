	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTitleClassReelSet
GetTitleClassReelSet: @ 0x0801252C
	push {r4, r5, r6, lr}
	sub sp, #0x48
	bl GetGlobalCompletionCount
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r4, r1, r0
	movs r5, #0
	mov r6, sp
_08012540:
	adds r0, r5, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801256E
	adds r0, r5, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	movs r2, #0xe
	ldrsb r2, [r6, r2]
	ldrh r0, [r6, #0x2e]
	lsls r1, r0, #0x14
	lsrs r1, r1, #0x1b
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	adds r2, r2, r0
	cmp r4, r2
	bge _0801256E
	adds r4, r2, #0
_0801256E:
	adds r5, #1
	cmp r5, #2
	ble _08012540
	cmp r4, #4
	bgt _0801257C
	movs r0, #0
	b _080125C6
_0801257C:
	cmp r4, #0xa
	bgt _08012584
	movs r0, #1
	b _080125C6
_08012584:
	cmp r4, #0x12
	bgt _0801258C
	movs r0, #2
	b _080125C6
_0801258C:
	cmp r4, #0x1a
	bgt _08012594
	movs r0, #3
	b _080125C6
_08012594:
	cmp r4, #0x42
	bgt _0801259C
	movs r0, #4
	b _080125C6
_0801259C:
	cmp r4, #0x47
	bgt _080125A4
	movs r0, #5
	b _080125C6
_080125A4:
	cmp r4, #0x4d
	bgt _080125AC
	movs r0, #6
	b _080125C6
_080125AC:
	cmp r4, #0x55
	bgt _080125B4
	movs r0, #7
	b _080125C6
_080125B4:
	cmp r4, #0x5d
	bgt _080125BC
	movs r0, #8
	b _080125C6
_080125BC:
	cmp r4, #0x85
	ble _080125C4
	movs r0, #0xa
	b _080125C6
_080125C4:
	movs r0, #9
_080125C6:
	add sp, #0x48
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GC_StartClassReel
GC_StartClassReel: @ 0x080125D0
	push {r4, lr}
	adds r4, r0, #0
	bl GetTitleClassReelSet
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl StartLordSelect
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GC_CheckSramResetKeyCombo
GC_CheckSramResetKeyCombo: @ 0x080125EC
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801260C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	cmp r1, r0
	bne _08012606
	adds r0, r2, #0
	movs r1, #0xf
	bl Proc_Goto
_08012606:
	pop {r0}
	bx r0
	.align 2, 0
_0801260C: .4byte 0x08B857F8

	thumb_func_start GC_InitSramResetScreen
GC_InitSramResetScreen: @ 0x08012610
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	ldr r2, _08012640 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #3
	movs r1, #0
	bl StartMuralBackgroundAlt
	pop {r0}
	bx r0
	.align 2, 0
_08012640: .4byte 0x0202BBF8

	thumb_func_start GC_InitFastStartCheck
GC_InitFastStartCheck: @ 0x08012644
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

	thumb_func_start sub_0801264C
sub_0801264C: @ 0x0801264C
	push {lr}
	bl sub_08002C74
	bl sub_08002C8C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801265C
sub_0801265C: @ 0x0801265C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08002CA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012678
	ldr r0, _08012680 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08012684
_08012678:
	adds r0, r4, #0
	bl Proc_Break
	b _080126C8
	.align 2, 0
_08012680: .4byte 0x08B857F8
_08012684:
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080126C8
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080126AC
	movs r0, #3
	bl ReadSuspendSave
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080126C8
_080126AC:
	movs r0, #0x5a
	movs r1, #0
	bl StartBgmCore
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080126C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndProcIfNotMarkedB
EndProcIfNotMarkedB: @ 0x080126D0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x26
	ldrb r1, [r1]
	cmp r1, #0xb
	beq _080126E0
	bl Proc_End
_080126E0:
	pop {r0}
	bx r0

	thumb_func_start sub_080126E4
sub_080126E4: @ 0x080126E4
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0801270C @ =0x02022860
	ldr r2, _08012710 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _08012714 @ =EndProcIfNotMarkedB
	bl Proc_ForAll
	ldr r0, _08012718 @ =OnMain
	bl SetMainFunc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801270C: .4byte 0x02022860
_08012710: .4byte 0x01000100
_08012714: .4byte EndProcIfNotMarkedB
_08012718: .4byte OnMain

	thumb_func_start GC_RestoreMainBGM
GC_RestoreMainBGM: @ 0x0801271C
	push {lr}
	movs r0, #0x5a
	movs r1, #0
	bl StartBgmCore
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08012738
sub_08012738: @ 0x08012738
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start GC_PostIntro
GC_PostIntro: @ 0x0801274C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	cmp r1, #1
	beq _08012786
	cmp r1, #1
	bgt _08012762
	cmp r1, #0
	beq _08012776
	b _080127BC
_08012762:
	cmp r1, #2
	beq _0801276C
	cmp r1, #3
	beq _080127B4
	b _080127BC
_0801276C:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080127BC
_08012776:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	bl sub_08012738
	b _080127BC
_08012786:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r2, [r0]
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0801279A
	cmp r1, #1
	beq _080127A4
	b _080127AC
_0801279A:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080127AC
_080127A4:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080127AC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _080127BC
_080127B4:
	adds r0, r4, #0
	movs r1, #0x15
	bl Proc_Goto
_080127BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080127C4
sub_080127C4: @ 0x080127C4
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _080127D6
	cmp r1, #1
	beq _080127DE
	b _080127E4
_080127D6:
	movs r1, #3
	bl Proc_Goto
	b _080127E4
_080127DE:
	movs r1, #0
	bl Proc_Goto
_080127E4:
	pop {r0}
	bx r0

	thumb_func_start GC_PostMainMenu
GC_PostMainMenu: @ 0x080127E8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080128A8
	lsls r0, r0, #2
	ldr r1, _08012800 @ =_08012804
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012800: .4byte _08012804
_08012804: @ jump table
	.4byte _08012828 @ case 0
	.4byte _08012828 @ case 1
	.4byte _08012828 @ case 2
	.4byte _08012828 @ case 3
	.4byte _08012878 @ case 4
	.4byte _08012882 @ case 5
	.4byte _0801288C @ case 6
	.4byte _08012896 @ case 7
	.4byte _080128A0 @ case 8
_08012828:
	bl GetNextChapterStatsEntry
	cmp r0, #0xb
	bne _0801283A
	adds r0, r4, #0
	movs r1, #0x14
	bl Proc_Goto
	b _080128A8
_0801283A:
	bl GetTacticianName
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801286A
	ldr r1, _0801285C @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08012860
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080128A8
	.align 2, 0
_0801285C: .4byte 0x0202BBF8
_08012860:
	ldr r0, _08012874 @ =0x0000055B
	bl DecodeMsg
	bl SetTacticianName
_0801286A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080128A8
	.align 2, 0
_08012874: .4byte 0x0000055B
_08012878:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080128A8
_08012882:
	adds r0, r4, #0
	movs r1, #0x16
	bl Proc_Goto
	b _080128A8
_0801288C:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080128A8
_08012896:
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080128A8
_080128A0:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
_080128A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080128B0
sub_080128B0: @ 0x080128B0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #5
	bne _080128C2
	movs r1, #3
	bl Proc_Goto
_080128C2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080128C8
sub_080128C8: @ 0x080128C8
	push {lr}
	movs r1, #3
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_080128D4
sub_080128D4: @ 0x080128D4
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _080128EA
	cmp r1, #1
	bne _080128EA
	movs r1, #0x10
	bl Proc_Goto
_080128EA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080128F0
sub_080128F0: @ 0x080128F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne _08012906
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0801292A
_08012906:
	movs r0, #0
	bl InitPlayConfig
	ldr r4, _08012930 @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl ResetPermanentFlags
	bl ResetChapterFlags
	bl InitUnits
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
_0801292A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012930: .4byte 0x0202BBF8

	thumb_func_start sub_08012934
sub_08012934: @ 0x08012934
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllMus
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08012992
	lsls r0, r0, #2
	ldr r1, _08012950 @ =_08012954
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012950: .4byte _08012954
_08012954: @ jump table
	.4byte _0801296C @ case 0
	.4byte _08012992 @ case 1
	.4byte _08012976 @ case 2
	.4byte _08012980 @ case 3
	.4byte _0801298A @ case 4
	.4byte _0801298A @ case 5
_0801296C:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08012992
_08012976:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _08012992
_08012980:
	adds r0, r4, #0
	movs r1, #0x13
	bl Proc_Goto
	b _08012992
_0801298A:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_08012992:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GC_CheckForGameEnded
GC_CheckForGameEnded: @ 0x08012998
	push {lr}
	adds r2, r0, #0
	ldr r1, _080129B4 @ =0x0202BBF8
	movs r0, #0x20
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080129B0
	adds r0, r2, #0
	movs r1, #0xe
	bl Proc_Goto
_080129B0:
	pop {r0}
	bx r0
	.align 2, 0
_080129B4: .4byte 0x0202BBF8

	thumb_func_start GC_PostLoadSuspend
GC_PostLoadSuspend: @ 0x080129B8
	push {lr}
	adds r2, r0, #0
	ldr r1, _080129D4 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080129D8
	adds r0, r2, #0
	movs r1, #8
	bl Proc_Goto
	b _080129E0
	.align 2, 0
_080129D4: .4byte 0x0202BBF8
_080129D8:
	adds r0, r2, #0
	movs r1, #7
	bl Proc_Goto
_080129E0:
	pop {r0}
	bx r0

	thumb_func_start GC_InitNextChapter
GC_InitNextChapter: @ 0x080129E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08012A04 @ =0x0202BBF8
	adds r0, r5, #0
	bl RegisterChapterStats
	bl ComputeChapterRankings
	adds r4, #0x2a
	ldrb r0, [r4]
	strb r0, [r5, #0xe]
	bl CleanupUnitsBeforeChapter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012A04: .4byte 0x0202BBF8

	thumb_func_start GC_CallPostChapterSaveMenu
GC_CallPostChapterSaveMenu: @ 0x08012A08
	push {lr}
	adds r1, r0, #0
	ldr r0, _08012A20 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	beq _08012A1A
	adds r0, r1, #0
	bl sub_080A4E0C
_08012A1A:
	pop {r0}
	bx r0
	.align 2, 0
_08012A20: .4byte 0x0202BBF8

	thumb_func_start GC_SetEliwoodMode
GC_SetEliwoodMode: @ 0x08012A24
	ldr r1, _08012A2C @ =0x0202BBF8
	movs r0, #2
	strb r0, [r1, #0x1b]
	bx lr
	.align 2, 0
_08012A2C: .4byte 0x0202BBF8

	thumb_func_start GC_DarkenScreen
GC_DarkenScreen: @ 0x08012A30
	ldr r3, _08012A68 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08012A6C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08012A68: .4byte 0x03002870
_08012A6C: .4byte 0x0000FFE0

	thumb_func_start sub_08012A70
sub_08012A70: @ 0x08012A70
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _08012A88 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08012A8C
	cmp r0, #3
	beq _08012A98
	b _08012A9E
	.align 2, 0
_08012A88: .4byte 0x0202BBF8
_08012A8C:
	ldr r0, _08012A94 @ =0x08CC1B1C
	bl sub_0800AF5C
	b _08012A9E
	.align 2, 0
_08012A94: .4byte 0x08CC1B1C
_08012A98:
	ldr r0, _08012AA4 @ =0x08CC1B50
	bl sub_0800AF5C
_08012A9E:
	pop {r0}
	bx r0
	.align 2, 0
_08012AA4: .4byte 0x08CC1B50

	thumb_func_start sub_08012AA8
sub_08012AA8: @ 0x08012AA8
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _08012AC0 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08012AC4
	cmp r0, #3
	beq _08012AD0
	b _08012AD6
	.align 2, 0
_08012AC0: .4byte 0x0202BBF8
_08012AC4:
	ldr r0, _08012ACC @ =0x08CC1B84
	bl sub_0800AF5C
	b _08012AD6
	.align 2, 0
_08012ACC: .4byte 0x08CC1B84
_08012AD0:
	ldr r0, _08012ADC @ =0x08CC1BF0
	bl sub_0800AF5C
_08012AD6:
	pop {r0}
	bx r0
	.align 2, 0
_08012ADC: .4byte 0x08CC1BF0

	thumb_func_start GC_RememberChapterId
GC_RememberChapterId: @ 0x08012AE0
	ldr r1, _08012AEC @ =0x0202BBF8
	ldrb r1, [r1, #0xe]
	adds r0, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_08012AEC: .4byte 0x0202BBF8

	thumb_func_start GC_RestoreChapterId
GC_RestoreChapterId: @ 0x08012AF0
	ldr r1, _08012AFC @ =0x0202BBF8
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
_08012AFC: .4byte 0x0202BBF8

	thumb_func_start StartGame
StartGame: @ 0x08012B00
	push {lr}
	ldr r0, _08012B2C @ =OnMain
	bl SetMainFunc
	ldr r0, _08012B30 @ =OnVBlank
	bl SetOnVBlank
	ldr r0, _08012B34 @ =0x08B924BC
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08012B2C: .4byte OnMain
_08012B30: .4byte OnVBlank
_08012B34: .4byte 0x08B924BC

	thumb_func_start GetGameControl
GetGameControl: @ 0x08012B38
	push {lr}
	ldr r0, _08012B44 @ =0x08B924BC
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_08012B44: .4byte 0x08B924BC

	thumb_func_start SetNextGameAction
SetNextGameAction: @ 0x08012B48
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameControl
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetNextChapterId
SetNextChapterId: @ 0x08012B5C
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameControl
	adds r0, #0x2a
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HasNextChapter
HasNextChapter: @ 0x08012B70
	push {lr}
	bl GetGameControl
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r2, [r1]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08012B88
sub_08012B88: @ 0x08012B88
	push {r4, lr}
	ldr r4, _08012BA8 @ =0x08B924BC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012BA8: .4byte 0x08B924BC

	thumb_func_start sub_08012BAC
sub_08012BAC: @ 0x08012BAC
	push {r4, lr}
	ldr r4, _08012BCC @ =0x08B924BC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #6
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012BCC: .4byte 0x08B924BC

	thumb_func_start sub_08012BD0
sub_08012BD0: @ 0x08012BD0
	push {r4, lr}
	ldr r4, _08012BF0 @ =0x08B924BC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #0xf
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012BF0: .4byte 0x08B924BC

	thumb_func_start ForceEnableSounds
ForceEnableSounds: @ 0x08012BF4
	ldr r0, _08012C0C @ =0x0202BBF8
	adds r0, #0x41
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08012C0C: .4byte 0x0202BBF8

	thumb_func_start sub_08012C10
sub_08012C10: @ 0x08012C10
	push {r4, r5, lr}
	ldr r1, _08012C5C @ =0x0202BBF8
	adds r2, r1, #0
	adds r2, #0x42
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r5, r1, #0
	adds r5, #0x40
	movs r2, #0x61
	rsbs r2, r2, #0
	ldrb r0, [r5]
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r3, r1, #0
	adds r3, #0x41
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r3]
	ands r2, r4
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012C5C: .4byte 0x0202BBF8

	thumb_func_start DecodeMsg
DecodeMsg: @ 0x08012C60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08012C84 @ =0x0202B5B4
	ldr r0, [r6]
	cmp r5, r0
	beq _08012C90
	ldr r1, _08012C88 @ =0x08B808AC
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _08012C8C @ =0x0202A5B4
	adds r1, r4, #0
	bl DecodeStringRam
	str r5, [r6]
	adds r0, r4, #0
	b _08012C92
	.align 2, 0
_08012C84: .4byte 0x0202B5B4
_08012C88: .4byte 0x08B808AC
_08012C8C: .4byte 0x0202A5B4
_08012C90:
	ldr r0, _08012C98 @ =0x0202A5B4
_08012C92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08012C98: .4byte 0x0202A5B4

	thumb_func_start DecodeMsgInBuffer
DecodeMsgInBuffer: @ 0x08012C9C
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08012CB8 @ =0x08B808AC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	bl DecodeStringRam
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08012CB8: .4byte 0x08B808AC

	thumb_func_start MsgExpand
MsgExpand: @ 0x08012CBC
	push {r4, r5, lr}
	ldr r5, _08012CD4 @ =0x0202A9B4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r5, r0
	ldr r0, _08012CD8 @ =0xFFFFFC00
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _08012DB8
	.align 2, 0
_08012CD4: .4byte 0x0202A9B4
_08012CD8: .4byte 0xFFFFFC00
_08012CDC:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _08012CE6
	strb r1, [r4]
	b _08012D86
_08012CE6:
	cmp r0, #0x80
	beq _08012CEE
	strb r1, [r4]
	b _08012D86
_08012CEE:
	adds r5, #1
	ldrb r0, [r5]
	subs r0, #0x12
	cmp r0, #0x10
	bhi _08012D7C
	lsls r0, r0, #2
	ldr r1, _08012D04 @ =_08012D08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012D04: .4byte _08012D08
_08012D08: @ jump table
	.4byte _08012D4C @ case 0
	.4byte _08012D50 @ case 1
	.4byte _08012D54 @ case 2
	.4byte _08012D58 @ case 3
	.4byte _08012D7C @ case 4
	.4byte _08012D7C @ case 5
	.4byte _08012D7C @ case 6
	.4byte _08012D7C @ case 7
	.4byte _08012D7C @ case 8
	.4byte _08012D7C @ case 9
	.4byte _08012D7C @ case 10
	.4byte _08012D7C @ case 11
	.4byte _08012D7C @ case 12
	.4byte _08012D7C @ case 13
	.4byte _08012D5C @ case 14
	.4byte _08012D7C @ case 15
	.4byte _08012D62 @ case 16
_08012D4C:
	movs r1, #0
	b _08012D8C
_08012D50:
	movs r1, #1
	b _08012D8C
_08012D54:
	movs r1, #2
	b _08012D8C
_08012D58:
	movs r1, #3
	b _08012D8C
_08012D5C:
	bl GetTacticianName
	b _08012D6C
_08012D62:
	ldr r0, _08012D78 @ =0x0203A85C
	ldrh r0, [r0, #6]
	movs r1, #0
	bl GetItemNameWithArticle
_08012D6C:
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	b _08012DA6
	.align 2, 0
_08012D78: .4byte 0x0203A85C
_08012D7C:
	movs r0, #0x80
	strb r0, [r4]
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_08012D86:
	adds r5, #1
	adds r4, #1
	b _08012DB8
_08012D8C:
	ldr r0, _08012DCC @ =0x0202BBF8
	adds r0, #0x1c
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
_08012DA6:
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _08012DB6
_08012DAE:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08012DAE
_08012DB6:
	adds r5, r1, #0
_08012DB8:
	ldrb r1, [r5]
	cmp r1, #0
	bne _08012CDC
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08012DD0 @ =0x0202ADB4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08012DCC: .4byte 0x0202BBF8
_08012DD0: .4byte 0x0202ADB4

	thumb_func_start GetArticle
GetArticle: @ 0x08012DD4
	adds r3, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r2, r0, #0x1f
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _08012DF4
	ldr r0, _08012DF0 @ =0x08B928A4
	lsls r1, r2, #2
	adds r0, #0x10
	b _08012EF0
	.align 2, 0
_08012DF0: .4byte 0x08B928A4
_08012DF4:
	ldrb r0, [r3]
	subs r0, #0x41
	cmp r0, #0x34
	bhi _08012EEC
	lsls r0, r0, #2
	ldr r1, _08012E08 @ =_08012E0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012E08: .4byte _08012E0C
_08012E0C: @ jump table
	.4byte _08012EE0 @ case 0
	.4byte _08012EEC @ case 1
	.4byte _08012EEC @ case 2
	.4byte _08012EEC @ case 3
	.4byte _08012EE0 @ case 4
	.4byte _08012EEC @ case 5
	.4byte _08012EEC @ case 6
	.4byte _08012EEC @ case 7
	.4byte _08012EE0 @ case 8
	.4byte _08012EEC @ case 9
	.4byte _08012EEC @ case 10
	.4byte _08012EEC @ case 11
	.4byte _08012EEC @ case 12
	.4byte _08012EEC @ case 13
	.4byte _08012EE0 @ case 14
	.4byte _08012EEC @ case 15
	.4byte _08012EEC @ case 16
	.4byte _08012EEC @ case 17
	.4byte _08012EEC @ case 18
	.4byte _08012EEC @ case 19
	.4byte _08012EE0 @ case 20
	.4byte _08012EEC @ case 21
	.4byte _08012EEC @ case 22
	.4byte _08012EEC @ case 23
	.4byte _08012EEC @ case 24
	.4byte _08012EEC @ case 25
	.4byte _08012EEC @ case 26
	.4byte _08012EEC @ case 27
	.4byte _08012EEC @ case 28
	.4byte _08012EEC @ case 29
	.4byte _08012EEC @ case 30
	.4byte _08012EEC @ case 31
	.4byte _08012EE0 @ case 32
	.4byte _08012EEC @ case 33
	.4byte _08012EEC @ case 34
	.4byte _08012EEC @ case 35
	.4byte _08012EE0 @ case 36
	.4byte _08012EEC @ case 37
	.4byte _08012EEC @ case 38
	.4byte _08012EEC @ case 39
	.4byte _08012EE0 @ case 40
	.4byte _08012EEC @ case 41
	.4byte _08012EEC @ case 42
	.4byte _08012EEC @ case 43
	.4byte _08012EEC @ case 44
	.4byte _08012EEC @ case 45
	.4byte _08012EE0 @ case 46
	.4byte _08012EEC @ case 47
	.4byte _08012EEC @ case 48
	.4byte _08012EEC @ case 49
	.4byte _08012EEC @ case 50
	.4byte _08012EEC @ case 51
	.4byte _08012EE0 @ case 52
_08012EE0:
	ldr r0, _08012EE8 @ =0x08B928A4
	lsls r1, r2, #2
	adds r0, #8
	b _08012EF0
	.align 2, 0
_08012EE8: .4byte 0x08B928A4
_08012EEC:
	ldr r0, _08012EF8 @ =0x08B928A4
	lsls r1, r2, #2
_08012EF0:
	adds r1, r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08012EF8: .4byte 0x08B928A4

	thumb_func_start sub_08012EFC
sub_08012EFC: @ 0x08012EFC
	b _08012F04
_08012EFE:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
_08012F04:
	ldrb r2, [r0]
	cmp r2, #0
	bne _08012EFE
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_08012F14
sub_08012F14: @ 0x08012F14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r5, _08012F4C @ =0x0202B3B4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r5, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r6, r5, r1
	mov sl, r4
	ldr r0, _08012F50 @ =0xFFFFF200
	adds r1, r5, r0
	adds r0, r5, #0
	bl StringCopy
	b _08012F9A
	.align 2, 0
_08012F4C: .4byte 0x0202B3B4
_08012F50: .4byte 0xFFFFF200
_08012F54:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _08012F5E
	strb r1, [r4]
	b _08012F76
_08012F5E:
	cmp r0, #0x80
	beq _08012F66
	strb r1, [r4]
	b _08012F76
_08012F66:
	adds r5, #1
	ldrb r1, [r5]
	cmp r1, #0x20
	beq _08012F7C
	strb r0, [r4]
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_08012F76:
	adds r5, #1
	adds r4, #1
	b _08012F9A
_08012F7C:
	bl GetTacticianName
	adds r1, r0, #0
	adds r0, r4, #0
	bl StringCopy
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _08012F98
_08012F90:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08012F90
_08012F98:
	adds r5, r1, #0
_08012F9A:
	ldrb r1, [r5]
	cmp r1, #0
	bne _08012F54
	movs r0, #0
	strb r0, [r4]
	cmp r7, #0
	bne _08012FB0
	ldr r0, _08012FAC @ =0x0202B4B4
	b _08012FD4
	.align 2, 0
_08012FAC: .4byte 0x0202B4B4
_08012FB0:
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sb
	lsls r2, r0, #0x18
	asrs r2, r2, #0x18
	mov r0, sl
	bl GetArticle
	adds r1, r6, #0
	bl sub_08012EFC
	adds r6, r0, #0
	mov r0, sl
	adds r1, r6, #0
	bl sub_08012EFC
	ldr r0, _08012FE4 @ =0x0202B5B4
_08012FD4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012FE4: .4byte 0x0202B5B4

	thumb_func_start Interpolate
Interpolate: @ 0x08012FE8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, [sp, #0x10]
	cmp r5, #0
	bne _08012FF6
	adds r0, r2, #0
	b _080130AA
_08012FF6:
	cmp r0, #5
	bhi _080130A8
	lsls r0, r0, #2
	ldr r1, _08013004 @ =_08013008
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013004: .4byte _08013008
_08013008: @ jump table
	.4byte _08013020 @ case 0
	.4byte _0801302C @ case 1
	.4byte _0801303C @ case 2
	.4byte _08013050 @ case 3
	.4byte _08013074 @ case 4
	.4byte _08013086 @ case 5
_08013020:
	subs r0, r2, r6
	adds r2, r0, #0
	muls r2, r3, r2
	adds r0, r2, #0
	adds r1, r5, #0
	b _0801306C
_0801302C:
	adds r0, r3, #0
	muls r0, r3, r0
	subs r1, r2, r6
	adds r2, r0, #0
	muls r2, r1, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _0801306A
_0801303C:
	adds r0, r3, #0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	b _08013066
_08013050:
	adds r0, r3, #0
	muls r0, r3, r0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	muls r0, r5, r0
_08013066:
	adds r1, r0, #0
	muls r1, r5, r1
_0801306A:
	adds r0, r2, #0
_0801306C:
	bl Div
	adds r0, r6, r0
	b _080130AA
_08013074:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _0801309C
_08013086:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r0, #0
	muls r1, r5, r1
_0801309C:
	adds r0, r2, #0
	bl Div
	adds r4, r6, r4
	subs r0, r4, r0
	b _080130AA
_080130A8:
	movs r0, #0
_080130AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080130B0
sub_080130B0: @ 0x080130B0
	bx lr
	.align 2, 0

	thumb_func_start StringEquals
StringEquals: @ 0x080130B4
	push {r4, lr}
	adds r4, r0, #0
	b _080130C6
_080130BA:
	adds r1, #1
	adds r4, #1
	cmp r2, r3
	beq _080130C6
	movs r0, #0
	b _080130D4
_080130C6:
	ldrb r2, [r4]
	ldrb r3, [r1]
	adds r0, r3, #0
	orrs r0, r2
	cmp r0, #0
	bne _080130BA
	movs r0, #1
_080130D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StringCopy
StringCopy: @ 0x080130DC
	adds r3, r0, #0
	b _080130E6
_080130E0:
	strb r2, [r3]
	adds r1, #1
	adds r3, #1
_080130E6:
	ldrb r2, [r1]
	cmp r2, #0
	bne _080130E0
	ldrb r0, [r1]
	strb r0, [r3]
	bx lr
	.align 2, 0

	thumb_func_start UnpackRaw
UnpackRaw: @ 0x080130F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetDataSize
	adds r2, r0, #0
	subs r1, r2, #4
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _0801311C
	adds r0, r4, #4
	lsrs r2, r1, #0x1f
	adds r2, r1, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r1, r5, #0
	bl CpuSet
	b _08013132
_0801311C:
	adds r3, r4, #4
	adds r0, r1, #0
	cmp r0, #0
	bge _08013126
	subs r0, r2, #1
_08013126:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r3, #0
	adds r1, r5, #0
	bl CpuFastSet
_08013132:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start DecompressViaGenericBuf
DecompressViaGenericBuf: @ 0x08013138
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08013164 @ =0x02020140
	adds r1, r6, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetDataSize
	cmp r0, #0
	bge _08013152
	adds r0, #3
_08013152:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013164: .4byte 0x02020140

	thumb_func_start Decompress
Decompress: @ 0x08013168
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0xfa
	lsls r0, r0, #0x18
	adds r1, r4, r0
	ldr r0, _080131A0 @ =0x00017FFF
	movs r2, #1
	cmp r1, r0
	bhi _0801317E
	movs r2, #0
_0801317E:
	ldr r0, _080131A4 @ =0x08B928BC
	movs r1, #0xf0
	ldrb r5, [r3]
	ands r1, r5
	lsrs r1, r1, #3
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080131A0: .4byte 0x00017FFF
_080131A4: .4byte 0x08B928BC

	thumb_func_start GetDataSize
GetDataSize: @ 0x080131A8
	ldr r0, [r0]
	lsrs r0, r0, #8
	bx lr
	.align 2, 0

	thumb_func_start sub_080131B0
sub_080131B0: @ 0x080131B0
	adds r3, r2, #0
	str r3, [r0]
	ldr r2, _080131C4 @ =0x0000FFE0
	ands r1, r2
	asrs r1, r1, #5
	ands r2, r3
	asrs r3, r2, #5
	subs r1, r3, r1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_080131C4: .4byte 0x0000FFE0

	thumb_func_start sub_080131C8
sub_080131C8: @ 0x080131C8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5]
	adds r0, r4, #0
	bl Decompress
	adds r0, r4, #0
	bl GetDataSize
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	ldr r1, [r5, #4]
	cmp r0, #0
	bge _080131EA
	adds r0, #0x1f
_080131EA:
	asrs r0, r0, #5
	adds r0, r1, r0
	str r0, [r5, #4]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080131F8
sub_080131F8: @ 0x080131F8
	lsls r3, r1, #5
	ldr r2, [r0]
	adds r2, r2, r3
	str r2, [r0]
	ldr r2, [r0, #4]
	adds r1, r2, r1
	str r1, [r0, #4]
	adds r0, r2, #0
	bx lr
	.align 2, 0

	thumb_func_start Register2dChrMove
Register2dChrMove: @ 0x0801320C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _08013232
	adds r4, r3, #0
_0801321A:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl RegisterDataMove
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _0801321A
_08013232:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Copy2dChr
Copy2dChr: @ 0x08013238
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #5
	cmp r3, #0
	ble _08013268
	adds r5, r3, #0
_08013246:
	adds r2, r4, #0
	cmp r4, #0
	bge _0801324E
	adds r2, r4, #3
_0801324E:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r7, #0
	adds r1, r6, #0
	bl CpuFastSet
	adds r7, r7, r4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	subs r5, #1
	cmp r5, #0
	bne _08013246
_08013268:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ApplyBitmap
ApplyBitmap: @ 0x08013270
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	ble _080132A0
	lsls r0, r7, #6
	mov sb, r0
	adds r4, r3, #0
	lsls r0, r7, #5
	mov r8, r0
_0801328C:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ApplyBitmapLine
	add r6, sb
	add r5, r8
	subs r4, #1
	cmp r4, #0
	bne _0801328C
_080132A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ApplyBitmapLine
ApplyBitmapLine: @ 0x080132AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r7, #0
	ble _080132CE
	adds r4, r7, #0
_080132BA:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ApplyBitmapTile
	adds r6, #8
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bne _080132BA
_080132CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ApplyBitmapTile
ApplyBitmapTile: @ 0x080132D4
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r1, #7
_080132DC:
	ldrb r5, [r3, #7]
	lsls r0, r5, #4
	ldrb r5, [r3, #6]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #5]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #4]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #3]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #2]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #1]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3]
	orrs r0, r5
	stm r4!, {r0}
	lsls r0, r2, #3
	adds r3, r3, r0
	subs r1, #1
	cmp r1, #0
	bge _080132DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutAppliedBitmap
PutAppliedBitmap: @ 0x0801331C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	cmp r0, r3
	bge _08013348
_0801332A:
	adds r2, r0, #1
	cmp r5, #0
	ble _08013342
	lsls r0, r0, #6
	adds r0, r0, r6
	adds r1, r5, #0
_08013336:
	strh r4, [r0]
	adds r4, #1
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _08013336
_08013342:
	adds r0, r2, #0
	cmp r0, r3
	blt _0801332A
_08013348:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutDigits
PutDigits: @ 0x08013350
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #0
	ble _08013374
	movs r2, #0
_0801335C:
	strh r2, [r0]
	subs r0, #2
	subs r3, #1
	cmp r3, #0
	bne _0801335C
	b _08013374
_08013368:
	ldrb r2, [r1]
	adds r0, r2, r5
	subs r0, #0x30
	strh r0, [r4]
	subs r4, #2
	subs r1, #1
_08013374:
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _08013368
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08013380
sub_08013380: @ 0x08013380
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08013388
sub_08013388: @ 0x08013388
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _08013398 @ =0x00007FFF
	ands r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013398: .4byte 0x00007FFF

	thumb_func_start sub_0801339C
sub_0801339C: @ 0x0801339C
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_080133A8
sub_080133A8: @ 0x080133A8
	push {r4, lr}
	movs r1, #0x9f
	movs r3, #0xf0
	movs r4, #1
	rsbs r4, r4, #0
	adds r2, r4, #0
_080133B4:
	strh r3, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080133B4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080133C8
sub_080133C8: @ 0x080133C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r6, [sp, #0x18]
	cmp r4, r6
	ble _080133E6
	adds r1, r3, #0
	adds r3, r5, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r6, r4, #0
	adds r4, r1, #0
_080133E6:
	subs r0, r3, r5
	lsls r0, r0, #0x10
	subs r1, r6, r4
	bl __divsi3
	mov ip, r0
	lsls r5, r5, #0x10
	cmp r6, #0xa0
	ble _080133FA
	movs r6, #0xa0
_080133FA:
	cmp r4, #0
	bge _0801340A
	rsbs r0, r4, #0
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	adds r5, r5, r0
	movs r4, #0
_0801340A:
	cmp r4, r6
	bge _08013444
	lsls r0, r4, #2
	mov r2, r8
	adds r1, r0, r2
	adds r2, r1, #0
_08013416:
	asrs r3, r5, #0x10
	cmp r3, #0xf0
	ble _0801341E
	movs r3, #0xf0
_0801341E:
	cmp r3, #0
	bge _08013424
	movs r3, #0
_08013424:
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, r3
	ble _0801342E
	strh r3, [r1]
_0801342E:
	movs r7, #2
	ldrsh r0, [r2, r7]
	cmp r0, r3
	bge _08013438
	strh r3, [r2, #2]
_08013438:
	add r5, ip
	adds r1, #4
	adds r2, #4
	adds r4, #1
	cmp r4, r6
	blt _08013416
_08013444:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08013450
sub_08013450: @ 0x08013450
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	str r6, [sp]
	cmp r6, #0x50
	ble _08013468
	movs r0, #0x50
	str r0, [sp]
_08013468:
	adds r2, r6, #0
	movs r1, #0
	mov sb, r1
	cmp r2, #0
	blt _08013560
	movs r3, #0
	str r3, [sp, #4]
	ldr r4, [sp]
	lsls r0, r4, #2
	ldr r7, _08013574 @ =0x02020140
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp, #8]
	rsbs r1, r2, #0
	str r1, [sp, #0xc]
	lsls r0, r2, #2
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	str r0, [sp, #0x14]
_08013494:
	ldr r0, [sp]
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi _080134A6
	mov r7, sl
	strh r2, [r7, #2]
_080134A6:
	ldr r0, [sp]
	mov r1, sb
	subs r0, r0, r1
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bhi _080134BA
	ldr r3, [sp, #8]
	strh r2, [r3, #2]
_080134BA:
	ldr r7, [sp]
	adds r7, r7, r2
	mov ip, r7
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bhi _080134CE
	mov r1, sb
	ldr r0, [sp, #0x14]
	strh r1, [r0, #2]
_080134CE:
	ldr r7, [sp]
	subs r5, r7, r2
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bhi _080134E0
	mov r7, sb
	ldr r0, [sp, #0x10]
	strh r7, [r0, #2]
_080134E0:
	ldr r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi _080134EE
	mov r7, sp
	ldrh r0, [r7, #0xc]
	mov r7, sl
	strh r0, [r7]
_080134EE:
	cmp r4, #0x9f
	bhi _08013500
	mov r4, r8
	lsls r0, r4, #2
	ldr r7, _08013574 @ =0x02020140
	adds r0, r0, r7
	mov r4, sp
	ldrh r4, [r4, #0xc]
	strh r4, [r0]
_08013500:
	cmp r3, #0x9f
	bhi _08013512
	mov r7, ip
	lsls r0, r7, #2
	ldr r3, _08013574 @ =0x02020140
	adds r0, r0, r3
	mov r4, sp
	ldrh r4, [r4, #4]
	strh r4, [r0]
_08013512:
	cmp r1, #0x9f
	bhi _08013522
	lsls r0, r5, #2
	ldr r7, _08013574 @ =0x02020140
	adds r0, r0, r7
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0]
_08013522:
	adds r1, r6, #1
	mov r3, sb
	lsls r0, r3, #1
	subs r6, r1, r0
	cmp r6, #0
	bge _08013548
	subs r1, r2, #1
	lsls r0, r1, #1
	adds r6, r6, r0
	ldr r4, [sp, #0xc]
	adds r4, #1
	str r4, [sp, #0xc]
	ldr r7, [sp, #0x10]
	adds r7, #4
	str r7, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r0, #4
	str r0, [sp, #0x14]
	adds r2, r1, #0
_08013548:
	ldr r1, [sp, #4]
	subs r1, #1
	str r1, [sp, #4]
	movs r3, #4
	add sl, r3
	ldr r4, [sp, #8]
	subs r4, #4
	str r4, [sp, #8]
	movs r7, #1
	add sb, r7
	cmp r2, sb
	bge _08013494
_08013560:
	ldr r0, _08013574 @ =0x02020140
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08013574: .4byte 0x02020140

	thumb_func_start DarkenPals
DarkenPals: @ 0x08013578
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r7, _08013594 @ =0x02020140
	movs r6, #0
	adds r5, r7, #0
	ldr r4, _08013598 @ =0x02022860
_08013584:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, r3
	blt _0801359C
	subs r1, r1, r3
	b _080135A0
	.align 2, 0
_08013594: .4byte 0x02020140
_08013598: .4byte 0x02022860
_0801359C:
	ldr r0, _080135B0 @ =0x0000FFE0
	ands r1, r0
_080135A0:
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsls r2, r3, #5
	cmp r0, r2
	blt _080135B4
	subs r1, r1, r2
	b _080135B8
	.align 2, 0
_080135B0: .4byte 0x0000FFE0
_080135B4:
	ldr r0, _080135C8 @ =0x0000FC1F
	ands r1, r0
_080135B8:
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsls r2, r3, #0xa
	cmp r0, r2
	blt _080135CC
	subs r1, r1, r2
	b _080135D0
	.align 2, 0
_080135C8: .4byte 0x0000FC1F
_080135CC:
	ldr r0, _080135F8 @ =0x000003FF
	ands r1, r0
_080135D0:
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	adds r6, #1
	ldr r0, _080135FC @ =0x000001FF
	cmp r6, r0
	ble _08013584
	bl DisablePalSync
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, #0
	bl RegisterDataMove
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080135F8: .4byte 0x000003FF
_080135FC: .4byte 0x000001FF

	thumb_func_start sub_08013600
sub_08013600: @ 0x08013600
	bx lr
	.align 2, 0

	thumb_func_start sub_08013604
sub_08013604: @ 0x08013604
	push {lr}
	sub sp, #0x10
	ldr r1, _08013620 @ =0x08193E20
	mov r0, sp
	movs r2, #0xd
	bl memcpy
	mov r0, sp
	bl sub_08013604
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08013620: .4byte 0x08193E20

	thumb_func_start GetPalFadeSt
GetPalFadeSt: @ 0x08013624
	ldr r0, _08013628 @ =0x0202B5B8
	bx lr
	.align 2, 0
_08013628: .4byte 0x0202B5B8

	thumb_func_start SetPalFadeStClkEnd1
SetPalFadeStClkEnd1: @ 0x0801362C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	strh r4, [r0, #0x2a]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SetPalFadeStClkEnd2
SetPalFadeStClkEnd2: @ 0x0801363C
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	adds r0, #0x5a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetPalFadeStClkEnd3
SetPalFadeStClkEnd3: @ 0x08013650
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	adds r0, #0x8a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetPalFadeStClkEnd1
GetPalFadeStClkEnd1: @ 0x08013664
	push {lr}
	bl GetPalFadeSt
	ldrh r0, [r0, #0x2a]
	pop {r1}
	bx r1

	thumb_func_start GetPalFadeStClkEnd2
GetPalFadeStClkEnd2: @ 0x08013670
	push {lr}
	bl GetPalFadeSt
	adds r0, #0x5a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetPalFadeStClkEnd3
GetPalFadeStClkEnd3: @ 0x08013680
	push {lr}
	bl GetPalFadeSt
	adds r0, #0x8a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetPalFadeStClkEnd
SetPalFadeStClkEnd: @ 0x08013690
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	bl SetPalFadeStClkEnd1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd2
	adds r0, r5, #0
	bl SetPalFadeStClkEnd3
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ArchiveCurrentPalettes
ArchiveCurrentPalettes: @ 0x080136AC
	push {r4, r5, lr}
	bl GetPalFadeSt
	ldr r3, _080136F4 @ =0x02022860
	movs r1, #0
_080136B6:
	adds r5, r0, #0
	adds r5, #0x30
	adds r4, r1, #1
	adds r1, r0, #0
	movs r2, #0xf
_080136C0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080136C0
	adds r0, r5, #0
	adds r1, r4, #0
	cmp r1, #0x1f
	ble _080136B6
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd1
	adds r0, r4, #0
	bl SetPalFadeStClkEnd2
	adds r0, r4, #0
	bl SetPalFadeStClkEnd3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080136F4: .4byte 0x02022860

	thumb_func_start ArchivePalette
ArchivePalette: @ 0x080136F8
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	lsls r2, r4, #5
	ldr r1, _08013724 @ =0x02022860
	adds r2, r2, r1
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, r1, r0
	movs r3, #0xf
_08013710:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08013710
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013724: .4byte 0x02022860

	thumb_func_start WriteFadedPaletteFromArchive
WriteFadedPaletteFromArchive: @ 0x08013728
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	str r2, [sp]
	mov sl, r3
	bl SetPalFadeStClkEnd1
	mov r0, r8
	bl SetPalFadeStClkEnd2
	ldr r0, [sp]
	bl SetPalFadeStClkEnd3
	bl GetPalFadeSt
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r7, r0
	ble _080137AC
	ldr r0, _080137A4 @ =0xFFFFFF00
	adds r7, r7, r0
	movs r5, #0
	mov ip, r5
_08013762:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08013798
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r1, _080137A8 @ =0x02022860
	adds r2, r0, r1
_0801377C:
	adds r1, r6, #0
	ldrh r0, [r3]
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	ands r1, r6
	strh r1, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _0801377C
_08013798:
	movs r1, #0x30
	add ip, r1
	adds r5, #1
	cmp r5, #0x1f
	ble _08013762
	b _080137EC
	.align 2, 0
_080137A4: .4byte 0xFFFFFF00
_080137A8: .4byte 0x02022860
_080137AC:
	movs r5, #0
	mov ip, r5
_080137B0:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	cmp r0, #0
	beq _080137E2
	movs r4, #0
	movs r3, #0x1f
	mov r2, ip
	add r2, sb
	lsls r0, r5, #5
	ldr r6, _08013848 @ =0x02022860
	adds r1, r0, r6
_080137CA:
	adds r0, r3, #0
	ldrh r6, [r2]
	ands r0, r6
	muls r0, r7, r0
	asrs r0, r0, #8
	ands r0, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080137CA
_080137E2:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _080137B0
_080137EC:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble _08013850
	ldr r1, _0801384C @ =0xFFFFFF00
	add r8, r1
	movs r5, #0
	mov ip, r5
_080137FC:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	cmp r0, #0
	beq _0801383C
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r3, ip
	add r3, sb
	lsls r0, r5, #5
	ldr r7, _08013848 @ =0x02022860
	adds r2, r0, r7
_08013818:
	adds r0, r6, #0
	ldrh r1, [r3]
	ands r0, r1
	subs r1, r6, r0
	mov r7, r8
	muls r7, r1, r7
	adds r1, r7, #0
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013818
_0801383C:
	movs r6, #0x30
	add ip, r6
	adds r5, #1
	cmp r5, #0x1f
	ble _080137FC
	b _08013898
	.align 2, 0
_08013848: .4byte 0x02022860
_0801384C: .4byte 0xFFFFFF00
_08013850:
	movs r5, #0
	movs r6, #0
_08013854:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _08013890
	movs r4, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	mov r0, sb
	adds r2, r6, r0
	lsls r0, r5, #5
	ldr r7, _080138F8 @ =0x02022860
	adds r1, r0, r7
_08013870:
	adds r0, r3, #0
	ldrh r7, [r2]
	ands r0, r7
	mov r7, r8
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	ands r0, r3
	ldrh r7, [r1]
	orrs r0, r7
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013870
_08013890:
	adds r6, #0x30
	adds r5, #1
	cmp r5, #0x1f
	ble _08013854
_08013898:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp]
	cmp r1, r0
	ble _08013900
	ldr r5, _080138FC @ =0xFFFFFF00
	adds r1, r1, r5
	str r1, [sp]
	movs r5, #0
_080138AA:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	adds r7, r5, #1
	cmp r0, #0
	beq _080138F0
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, sb
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, _080138F8 @ =0x02022860
	adds r2, r0, r5
_080138CE:
	adds r0, r6, #0
	ldrh r1, [r3]
	ands r0, r1
	subs r1, r6, r0
	ldr r5, [sp]
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080138CE
_080138F0:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _080138AA
	b _0801394A
	.align 2, 0
_080138F8: .4byte 0x02022860
_080138FC: .4byte 0xFFFFFF00
_08013900:
	movs r5, #0
_08013902:
	movs r0, #1
	lsls r0, r5
	mov r6, sl
	ands r0, r6
	adds r7, r5, #1
	cmp r0, #0
	beq _08013944
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r1, sb
	adds r2, r0, r1
	lsls r0, r5, #5
	ldr r5, _08013960 @ =0x02022860
	adds r1, r0, r5
_08013926:
	adds r0, r3, #0
	ldrh r6, [r2]
	ands r0, r6
	ldr r5, [sp]
	muls r0, r5, r0
	asrs r0, r0, #8
	ands r0, r3
	ldrh r6, [r1]
	orrs r0, r6
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013926
_08013944:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _08013902
_0801394A:
	bl EnablePalSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013960: .4byte 0x02022860

	thumb_func_start sub_08013964
sub_08013964: @ 0x08013964
	movs r1, #0
	str r1, [r0, #0x44]
	bx lr
	.align 2, 0

	thumb_func_start sub_0801396C
sub_0801396C: @ 0x0801396C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r3, r7, r2
	ldr r0, [r4, #0x2c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x38]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08013990
	adds r0, #0xff
_08013990:
	asrs r6, r0, #8
	ldr r0, [r4, #0x30]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x3c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _080139A4
	adds r1, #0xff
_080139A4:
	asrs r5, r1, #8
	ldr r0, [r4, #0x34]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _080139B8
	adds r1, #0xff
_080139B8:
	asrs r2, r1, #8
	ldr r3, [r4, #0x4c]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x44]
	cmp r0, r7
	bne _080139D0
	adds r0, r4, #0
	bl Proc_Break
_080139D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080139D8
sub_080139D8: @ 0x080139D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r0, _08013A18 @ =0x08B928DC
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	mov r1, sb
	str r1, [r0, #0x38]
	str r7, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x40]
	str r4, [r0, #0x48]
	ldr r1, [sp, #0x24]
	str r1, [r0, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013A18: .4byte 0x08B928DC

	thumb_func_start sub_08013A1C
sub_08013A1C: @ 0x08013A1C
	push {lr}
	ldr r0, _08013A2C @ =0x08B928DC
	bl Proc_Find
	cmp r0, #0
	bne _08013A30
	movs r0, #0
	b _08013A32
	.align 2, 0
_08013A2C: .4byte 0x08B928DC
_08013A30:
	movs r0, #1
_08013A32:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpacialSeTest_OnInit
SpacialSeTest_OnInit: @ 0x08013A38
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x66
	movs r1, #0x5a
	strh r1, [r0]
	bx lr

	thumb_func_start SpacialSeTest_OnLoop
SpacialSeTest_OnLoop: @ 0x08013A48
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r5, _08013AAC @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08013A66
	adds r1, r3, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08013A66:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _08013AA6
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08013A8E
	adds r0, r3, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r4, r0, #0
_08013A8E:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013A9E
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r4, [r0, r1]
_08013A9E:
	movs r0, #0x9a
	adds r1, r4, #0
	bl PlaySeSpacial
_08013AA6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013AAC: .4byte 0x08B857F8

	thumb_func_start sub_08013AB0
sub_08013AB0: @ 0x08013AB0
	push {lr}
	ldr r0, _08013AC0 @ =0x08B928FC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08013AC0: .4byte 0x08B928FC

	thumb_func_start sub_08013AC4
sub_08013AC4: @ 0x08013AC4
	bx lr
	.align 2, 0

	thumb_func_start StartPalFadeToBlack
StartPalFadeToBlack: @ 0x08013AC8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08013AE0 @ =0x08B92A28
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013AE0: .4byte 0x08B92A28

	thumb_func_start sub_08013AE4
sub_08013AE4: @ 0x08013AE4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08013AFC @ =0x08B92A48
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013AFC: .4byte 0x08B92A48

	thumb_func_start StartPalFade
StartPalFade: @ 0x08013B00
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	ldr r0, _08013B54 @ =0x0202B5B8
	adds r4, r4, r0
	ldr r0, _08013B58 @ =0x08B92914
	bl Proc_Start
	mov r8, r0
	lsls r5, r5, #5
	ldr r0, _08013B5C @ =0x02022860
	adds r5, r5, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	str r5, [r4, #0x24]
	mov r0, sb
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x28]
	strh r6, [r4, #0x2a]
	adds r6, #1
	strh r6, [r4, #0x2c]
	mov r0, r8
	str r4, [r0, #0x2c]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08013B54: .4byte 0x0202B5B8
_08013B58: .4byte 0x08B92914
_08013B5C: .4byte 0x02022860

	thumb_func_start sub_08013B60
sub_08013B60: @ 0x08013B60
	push {lr}
	ldr r0, _08013B6C @ =0x08B92914
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08013B6C: .4byte 0x08B92914

	thumb_func_start SetPalFadeStop
SetPalFadeStop: @ 0x08013B70
	strh r1, [r0, #0x2c]
	bx lr

	thumb_func_start PalFade_OnLoop
PalFade_OnLoop: @ 0x08013B74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sl, r0
	ldr r1, [r0, #0x20]
	str r1, [sp, #8]
	ldr r1, [r0, #0x24]
	ldrh r0, [r0, #0x28]
	mov r2, sl
	ldrh r2, [r2, #0x2c]
	cmp r0, r2
	beq _08013B9E
	mov r3, sl
	ldrh r3, [r3, #0x2a]
	cmp r0, r3
	bls _08013BA6
_08013B9E:
	adds r0, r7, #0
	bl Proc_End
	b _08013C4C
_08013BA6:
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #0xc]
_08013BAC:
	ldr r1, [sp, #4]
	lsls r2, r1, #1
	mov r3, sl
	adds r0, r2, r3
	ldrh r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov sb, r3
	ands r3, r0
	mov sb, r3
	ldr r0, [sp, #8]
	adds r2, r2, r0
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	bl Interpolate
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #4]
	cmp r2, #0xf
	ble _08013BAC
	bl EnablePalSync
	ldr r1, [r7, #0x2c]
	ldrh r0, [r1, #0x28]
	adds r0, #1
	strh r0, [r1, #0x28]
_08013C4C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SetBlackPal
SetBlackPal: @ 0x08013C5C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013C74 @ =0x08B92A28
	lsls r1, r1, #5
	ldr r2, _08013C78 @ =0x02022860
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08013C74: .4byte 0x08B92A28
_08013C78: .4byte 0x02022860

	thumb_func_start sub_08013C7C
sub_08013C7C: @ 0x08013C7C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013C94 @ =0x08B92A48
	lsls r1, r1, #5
	ldr r2, _08013C98 @ =0x02022860
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08013C94: .4byte 0x08B92A48
_08013C98: .4byte 0x02022860

	thumb_func_start sub_08013C9C
sub_08013C9C: @ 0x08013C9C
	push {r4, lr}
	movs r4, #0
_08013CA0:
	adds r0, r4, #0
	bl SetBlackPal
	adds r4, #1
	cmp r4, #0x1f
	ble _08013CA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08013CB4
sub_08013CB4: @ 0x08013CB4
	push {r4, lr}
	movs r4, #0
_08013CB8:
	adds r0, r4, #0
	bl SetBlackPal
	adds r4, #1
	cmp r4, #0x1f
	ble _08013CB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08013CCC
sub_08013CCC: @ 0x08013CCC
	push {r4, r5, r6, lr}
	ldr r1, _08013D3C @ =0x03002870
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r5, #0
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	ldr r1, _08013D40 @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x66
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013D3C: .4byte 0x03002870
_08013D40: .4byte 0x0000FFE0

	thumb_func_start sub_08013D44
sub_08013D44: @ 0x08013D44
	push {lr}
	adds r2, r0, #0
	ldr r0, _08013D5C @ =0x03002870
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _08013D60
	adds r0, r2, #0
	bl Proc_End
	b _08013D84
	.align 2, 0
_08013D5C: .4byte 0x03002870
_08013D60:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08013D7E
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_08013D7E:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_08013D84:
	pop {r0}
	bx r0

	thumb_func_start sub_08013D88
sub_08013D88: @ 0x08013D88
	push {r4, r5, r6, lr}
	ldr r1, _08013E08 @ =0x03002870
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	movs r5, #0x10
	strb r5, [r1]
	ldr r1, _08013E0C @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	ldr r2, _08013E10 @ =0x0000E0FF
	ands r1, r2
	movs r6, #0xf8
	lsls r6, r6, #5
	adds r2, r6, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r1, r0, #0
	adds r1, #0x64
	strh r5, [r1]
	adds r0, #0x66
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013E08: .4byte 0x03002870
_08013E0C: .4byte 0x0000FFE0
_08013E10: .4byte 0x0000E0FF

	thumb_func_start sub_08013E14
sub_08013E14: @ 0x08013E14
	push {lr}
	adds r2, r0, #0
	ldr r0, _08013E2C @ =0x03002870
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0
	bne _08013E30
	adds r0, r2, #0
	bl Proc_End
	b _08013E50
	.align 2, 0
_08013E2C: .4byte 0x03002870
_08013E30:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08013E4A
	movs r0, #0
	strh r0, [r1]
_08013E4A:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_08013E50:
	pop {r0}
	bx r0

	thumb_func_start sub_08013E54
sub_08013E54: @ 0x08013E54
	push {lr}
	bl sub_08013CCC
	ldr r3, _08013E80 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08013E80: .4byte 0x03002870

	thumb_func_start sub_08013E84
sub_08013E84: @ 0x08013E84
	push {lr}
	bl sub_08013D88
	ldr r3, _08013EB4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013EB4: .4byte 0x03002870

	thumb_func_start FadeExists
FadeExists: @ 0x08013EB8
	push {lr}
	ldr r0, _08013EE8 @ =0x08B9294C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	ldr r0, _08013EEC @ =0x08B9292C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	ldr r0, _08013EF0 @ =0x08B9298C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	ldr r0, _08013EF4 @ =0x08B9296C
	bl Proc_Find
	cmp r0, #0
	bne _08013EF8
	movs r0, #0
	b _08013EFA
	.align 2, 0
_08013EE8: .4byte 0x08B9294C
_08013EEC: .4byte 0x08B9292C
_08013EF0: .4byte 0x08B9298C
_08013EF4: .4byte 0x08B9296C
_08013EF8:
	movs r0, #1
_08013EFA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartFadeToBlack
StartFadeToBlack: @ 0x08013F00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F18 @ =0x08B9292C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F18: .4byte 0x08B9292C

	thumb_func_start StartFadeFromBlack
StartFadeFromBlack: @ 0x08013F1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F34 @ =0x08B9294C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F34: .4byte 0x08B9294C

	thumb_func_start StartLockingFadeToBlack
StartLockingFadeToBlack: @ 0x08013F38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F4C @ =0x08B9292C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F4C: .4byte 0x08B9292C

	thumb_func_start StartLockingFadeFromBlack
StartLockingFadeFromBlack: @ 0x08013F50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F64 @ =0x08B9294C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F64: .4byte 0x08B9294C

	thumb_func_start StartLockingFadeToWhite
StartLockingFadeToWhite: @ 0x08013F68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F7C @ =0x08B9296C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F7C: .4byte 0x08B9296C

	thumb_func_start StartLockingFadeFromWhite
StartLockingFadeFromWhite: @ 0x08013F80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013F94 @ =0x08B9298C
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F94: .4byte 0x08B9298C

	thumb_func_start StartMidFadeToBlack
StartMidFadeToBlack: @ 0x08013F98
	push {lr}
	movs r0, #0x10
	bl StartFadeToBlack
	pop {r0}
	bx r0

	thumb_func_start sub_08013FA4
sub_08013FA4: @ 0x08013FA4
	push {lr}
	movs r0, #4
	bl StartFadeToBlack
	pop {r0}
	bx r0

	thumb_func_start StartFastFadeToBlack
StartFastFadeToBlack: @ 0x08013FB0
	push {lr}
	movs r0, #0x40
	bl StartFadeToBlack
	pop {r0}
	bx r0

	thumb_func_start sub_08013FBC
sub_08013FBC: @ 0x08013FBC
	push {lr}
	movs r0, #0x10
	bl StartFadeFromBlack
	pop {r0}
	bx r0

	thumb_func_start sub_08013FC8
sub_08013FC8: @ 0x08013FC8
	push {lr}
	movs r0, #4
	bl StartFadeFromBlack
	pop {r0}
	bx r0

	thumb_func_start sub_08013FD4
sub_08013FD4: @ 0x08013FD4
	push {lr}
	movs r0, #0x40
	bl StartFadeFromBlack
	pop {r0}
	bx r0

	thumb_func_start StartMidLockingFadeToBlack
StartMidLockingFadeToBlack: @ 0x08013FE0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSlowLockingFadeFromBlack
StartSlowLockingFadeFromBlack: @ 0x08013FF0
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014000
sub_08014000: @ 0x08014000
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl StartLockingFadeToBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartMidLockingFadeFromBlack
StartMidLockingFadeFromBlack: @ 0x08014010
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014020
sub_08014020: @ 0x08014020
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014030
sub_08014030: @ 0x08014030
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl StartLockingFadeFromBlack
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014040
sub_08014040: @ 0x08014040
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeToWhite
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014050
sub_08014050: @ 0x08014050
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartLockingFadeFromWhite
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014060
sub_08014060: @ 0x08014060
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014074 @ =sub_080143E0
	movs r0, #1
	movs r1, #4
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014074: .4byte sub_080143E0

	thumb_func_start sub_08014078
sub_08014078: @ 0x08014078
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801408C @ =sub_080143E0
	movs r0, #1
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801408C: .4byte sub_080143E0

	thumb_func_start sub_08014090
sub_08014090: @ 0x08014090
	push {lr}
	adds r2, r0, #0
	ldr r3, _080140A4 @ =sub_080143E0
	movs r0, #1
	movs r1, #0x10
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080140A4: .4byte sub_080143E0

	thumb_func_start sub_080140A8
sub_080140A8: @ 0x080140A8
	push {lr}
	adds r2, r0, #0
	ldr r3, _080140BC @ =sub_080143E0
	movs r0, #1
	movs r1, #0x20
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080140BC: .4byte sub_080143E0

	thumb_func_start sub_080140C0
sub_080140C0: @ 0x080140C0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080140D4 @ =sub_080143E0
	movs r0, #1
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_080140D4: .4byte sub_080143E0

	thumb_func_start sub_080140D8
sub_080140D8: @ 0x080140D8
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080140EC
sub_080140EC: @ 0x080140EC
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014100
sub_08014100: @ 0x08014100
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x20
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014114
sub_08014114: @ 0x08014114
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x40
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014128
sub_08014128: @ 0x08014128
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801413C @ =sub_080143E0
	movs r0, #3
	movs r1, #4
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801413C: .4byte sub_080143E0

	thumb_func_start sub_08014140
sub_08014140: @ 0x08014140
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014154 @ =sub_080143E0
	movs r0, #3
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014154: .4byte sub_080143E0

	thumb_func_start sub_08014158
sub_08014158: @ 0x08014158
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801416C @ =sub_080143E0
	movs r0, #3
	movs r1, #0x10
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801416C: .4byte sub_080143E0

	thumb_func_start sub_08014170
sub_08014170: @ 0x08014170
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014184 @ =sub_080143E0
	movs r0, #3
	movs r1, #0x20
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014184: .4byte sub_080143E0

	thumb_func_start sub_08014188
sub_08014188: @ 0x08014188
	push {lr}
	adds r2, r0, #0
	ldr r3, _0801419C @ =sub_080143E0
	movs r0, #3
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_0801419C: .4byte sub_080143E0

	thumb_func_start FadeInBlackSpeed04
FadeInBlackSpeed04: @ 0x080141A0
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #4
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FadeInBlackSpeed08
FadeInBlackSpeed08: @ 0x080141B4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FadeInBlackSpeed08Unk
FadeInBlackSpeed08Unk: @ 0x080141C8
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	bl sub_080143A0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FadeInBlackSpeed10
FadeInBlackSpeed10: @ 0x080141E0
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FadeInBlackSpeed20
FadeInBlackSpeed20: @ 0x080141F4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x20
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FadeInBlackSpeed40
FadeInBlackSpeed40: @ 0x08014208
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x40
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801421C
sub_0801421C: @ 0x0801421C
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014230
sub_08014230: @ 0x08014230
	push {lr}
	adds r2, r0, #0
	movs r0, #7
	movs r1, #0x10
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014244
sub_08014244: @ 0x08014244
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014258
sub_08014258: @ 0x08014258
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #4
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801426C
sub_0801426C: @ 0x0801426C
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #8
	movs r3, #0
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014280
sub_08014280: @ 0x08014280
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014294 @ =sub_08014450
	movs r0, #7
	movs r1, #8
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0
_08014294: .4byte sub_08014450

	thumb_func_start WaitForFade
WaitForFade: @ 0x08014298
	push {r4, lr}
	adds r4, r0, #0
	bl FadeExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080142AC
	adds r0, r4, #0
	bl Proc_Break
_080142AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080142B4
sub_080142B4: @ 0x080142B4
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #3
	movs r1, #0x40
	bl StartFadeCore
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartFadeCore
StartFadeCore: @ 0x080142C8
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	adds r5, r3, #0
	ldr r7, _0801430C @ =0x08193E30
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r6, r2, #2
	adds r0, r6, r7
	ldr r2, [r0]
	ldr r0, _08014310 @ =0x08B929AC
	bl _call_via_r2
	str r4, [r0, #0x54]
	str r5, [r0, #0x4c]
	asrs r4, r4, #4
	cmp r4, #0
	bne _080142EE
	movs r4, #1
_080142EE:
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl _call_via_r1
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801430C: .4byte 0x08193E30
_08014310: .4byte 0x08B929AC

	thumb_func_start sub_08014314
sub_08014314: @ 0x08014314
	push {lr}
	ldr r0, _08014320 @ =0x08B929AC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08014320: .4byte 0x08B929AC

	thumb_func_start FadeCore_Init
FadeCore_Init: @ 0x08014324
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	str r1, [r0, #0x4c]
	bx lr
	.align 2, 0

	thumb_func_start FadeCore_Loop
FadeCore_Loop: @ 0x08014330
	push {r4, lr}
	adds r4, r0, #0
	bl FadeCore_Tick
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801434E
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08014348
	bl _call_via_r0
_08014348:
	adds r0, r4, #0
	bl Proc_Break
_0801434E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FadeCore_Tick
FadeCore_Tick: @ 0x08014354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	ldr r2, [r4, #0x54]
	adds r1, r0, r2
	str r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r0, r0, r2
	str r0, [r4, #0x5c]
	cmp r1, #0xf
	bgt _08014372
	cmp r0, r2
	beq _08014378
_0801436E:
	movs r0, #1
	b _08014390
_08014372:
	adds r0, r1, #0
	subs r0, #0x10
	str r0, [r4, #0x58]
_08014378:
	bl ColorFadeTick_thm
	ldr r1, _08014398 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	ldr r1, [r4, #0x5c]
	ldr r0, _0801439C @ =0x000001FF
	cmp r1, r0
	ble _0801436E
	movs r0, #0
_08014390:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08014398: .4byte 0x02022860
_0801439C: .4byte 0x000001FF

	thumb_func_start sub_080143A0
sub_080143A0: @ 0x080143A0
	push {lr}
	movs r0, #0x10
	movs r1, #0x10
	movs r2, #0
	bl sub_08002338
	bl sub_080143C4
	pop {r0}
	bx r0

	thumb_func_start sub_080143B4
sub_080143B4: @ 0x080143B4
	push {lr}
	movs r2, #0
	bl sub_08002338
	bl sub_080143C4
	pop {r0}
	bx r0

	thumb_func_start sub_080143C4
sub_080143C4: @ 0x080143C4
	push {lr}
	ldr r0, _080143DC @ =0x08B929AC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080143D6
	movs r0, #0
	str r0, [r1, #0x4c]
_080143D6:
	pop {r0}
	bx r0
	.align 2, 0
_080143DC: .4byte 0x08B929AC

	thumb_func_start sub_080143E0
sub_080143E0: @ 0x080143E0
	push {r4, lr}
	ldr r4, _08014444 @ =0x03002870
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	movs r3, #0
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08014448 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801444C @ =0x02022860
	strh r3, [r0]
	bl EnablePalSync
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014444: .4byte 0x03002870
_08014448: .4byte 0x0000FFE0
_0801444C: .4byte 0x02022860

	thumb_func_start sub_08014450
sub_08014450: @ 0x08014450
	ldr r3, _0801448C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08014490 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0801448C: .4byte 0x03002870
_08014490: .4byte 0x0000FFE0

	thumb_func_start StartTemporaryLock
StartTemporaryLock: @ 0x08014494
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080144AC @ =0x08B929DC
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080144AC: .4byte 0x08B929DC

	thumb_func_start TemporaryLock_OnLoop
TemporaryLock_OnLoop: @ 0x080144B0
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne _080144C2
	adds r0, r1, #0
	bl Proc_Break
	b _080144C6
_080144C2:
	subs r0, #1
	str r0, [r1, #0x58]
_080144C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080144CC
sub_080144CC: @ 0x080144CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r4, #0
	bne _080144F4
	ldr r0, _080144F0 @ =0x08B929F4
	ldrb r1, [r0]
	strb r1, [r6]
	adds r6, #1
	ldrb r0, [r0, #1]
	strb r0, [r6]
	strb r4, [r6, #1]
	movs r0, #1
	b _08014580
	.align 2, 0
_080144F0: .4byte 0x08B929F4
_080144F4:
	cmp r4, #0
	bge _08014506
	ldr r0, _08014510 @ =0x08B929F8
	ldrb r1, [r0]
	strb r1, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #1]
	rsbs r4, r4, #0
	movs r5, #2
_08014506:
	ldr r0, _08014514 @ =0x0001869F
	cmp r4, r0
	ble _08014518
	adds r5, #0xa
	b _08014546
	.align 2, 0
_08014510: .4byte 0x08B929F8
_08014514: .4byte 0x0001869F
_08014518:
	ldr r0, _08014524 @ =0x0000270F
	cmp r4, r0
	ble _08014528
	adds r5, #8
	b _08014546
	.align 2, 0
_08014524: .4byte 0x0000270F
_08014528:
	ldr r0, _08014534 @ =0x000003E7
	cmp r4, r0
	ble _08014538
	adds r5, #6
	b _08014546
	.align 2, 0
_08014534: .4byte 0x000003E7
_08014538:
	cmp r4, #0x63
	ble _08014540
	adds r5, #4
	b _08014546
_08014540:
	cmp r4, #9
	ble _08014546
	adds r5, #2
_08014546:
	mov r8, r5
	cmp r4, #0
	ble _08014572
	ldr r7, _0801458C @ =0x08B929F4
_0801454E:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r6, r5
	ldrb r1, [r7]
	strb r1, [r2]
	ldrb r1, [r7, #1]
	adds r0, r1, r0
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bgt _0801454E
_08014572:
	mov r0, r8
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #2]
	mov r1, r8
	asrs r0, r1, #1
	adds r0, #1
_08014580:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801458C: .4byte 0x08B929F4

	thumb_func_start NumberToStringAscii
NumberToStringAscii: @ 0x08014590
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	cmp r4, #0
	bne _080145AC
	ldr r0, _080145A8 @ =0x08B929FB
	ldrb r0, [r0]
	strb r0, [r5]
	strb r4, [r5, #1]
	movs r0, #1
	b _0801462A
	.align 2, 0
_080145A8: .4byte 0x08B929FB
_080145AC:
	cmp r4, #0
	bge _080145BA
	ldr r0, _080145C4 @ =0x08B929FC
	ldrb r0, [r0]
	strb r0, [r5]
	adds r5, #1
	rsbs r4, r4, #0
_080145BA:
	ldr r0, _080145C8 @ =0x0001869F
	cmp r4, r0
	ble _080145CC
	movs r6, #5
	b _080145FA
	.align 2, 0
_080145C4: .4byte 0x08B929FC
_080145C8: .4byte 0x0001869F
_080145CC:
	ldr r0, _080145D8 @ =0x0000270F
	cmp r4, r0
	ble _080145DC
	movs r6, #4
	b _080145FA
	.align 2, 0
_080145D8: .4byte 0x0000270F
_080145DC:
	ldr r0, _080145E8 @ =0x000003E7
	cmp r4, r0
	ble _080145EC
	movs r6, #3
	b _080145FA
	.align 2, 0
_080145E8: .4byte 0x000003E7
_080145EC:
	cmp r4, #0x63
	ble _080145F4
	movs r6, #2
	b _080145FA
_080145F4:
	cmp r4, #9
	ble _080145FA
	movs r6, #1
_080145FA:
	adds r7, r6, #0
	cmp r4, #0
	ble _08014622
_08014600:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r5, r6
	ldr r1, _08014630 @ =0x08B929FB
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r6, #1
	cmp r4, #0
	bgt _08014600
_08014622:
	adds r0, r5, r7
	movs r1, #0
	strb r1, [r0, #1]
	adds r0, r7, #1
_0801462A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014630: .4byte 0x08B929FB

	thumb_func_start PutStringCentered
PutStringCentered: @ 0x08014634
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, _08014694 @ =0x03000430
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitText
	adds r0, r6, #0
	bl GetStringTextLen
	lsls r4, r4, #3
	subs r4, r4, r0
	subs r4, #1
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, r8
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_DrawString
	adds r0, r5, #0
	mov r1, sb
	bl PutText
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014694: .4byte 0x03000430

	thumb_func_start PutString
PutString: @ 0x08014698
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, _080146D8 @ =0x03000430
	adds r0, r5, #0
	bl GetStringTextLen
	adds r1, r0, #7
	cmp r1, #0
	bge _080146B0
	adds r1, #7
_080146B0:
	asrs r1, r1, #3
	adds r0, r4, #0
	bl InitText
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080146D8: .4byte 0x03000430

	thumb_func_start sub_080146DC
sub_080146DC: @ 0x080146DC
	push {lr}
	ldr r0, _080146E8 @ =0x08B92A00
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080146E8: .4byte 0x08B92A00

	thumb_func_start StartPaletteAnimatorExt
StartPaletteAnimatorExt: @ 0x080146EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r1, [sp, #0x14]
	ldr r0, _08014724 @ =0x08B92A00
	bl Proc_Start
	str r5, [r0, #0x2c]
	movs r2, #0
	mov r1, r8
	strh r1, [r0, #0x30]
	lsrs r1, r4, #0x1f
	adds r4, r4, r1
	asrs r4, r4, #1
	strh r4, [r0, #0x32]
	strh r6, [r0, #0x36]
	strh r6, [r0, #0x34]
	strh r2, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014724: .4byte 0x08B92A00

	thumb_func_start StartPaletteAnimatorReverse
StartPaletteAnimatorReverse: @ 0x08014728
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl StartPaletteAnimatorExt
	movs r1, #0
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartPaletteAnimatorNormal
StartPaletteAnimatorNormal: @ 0x08014740
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl StartPaletteAnimatorExt
	movs r1, #1
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08014758
sub_08014758: @ 0x08014758
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	blo _080147B4
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x32]
	bl DivRem
	adds r5, r0, #0
	ldrh r0, [r4, #0x3a]
	cmp r0, #0
	beq _08014786
	ldrh r2, [r4, #0x32]
	subs r0, r2, r5
	subs r5, r0, #1
_08014786:
	lsls r6, r5, #1
	ldr r0, [r4, #0x2c]
	adds r0, r0, r6
	ldrh r1, [r4, #0x30]
	ldrh r3, [r4, #0x32]
	subs r2, r3, r5
	lsls r2, r2, #1
	bl ApplyPaletteExt
	cmp r5, #0
	ble _080147AE
	ldr r0, [r4, #0x2c]
	ldrh r2, [r4, #0x32]
	lsls r1, r2, #1
	ldrh r3, [r4, #0x30]
	adds r1, r3, r1
	subs r1, r1, r6
	adds r2, r6, #0
	bl ApplyPaletteExt
_080147AE:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_080147B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080147BC
sub_080147BC: @ 0x080147BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	ldr r0, [sp, #0x24]
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r3, r2, #0
	adds r0, r3, r0
	cmp r3, r0
	bge _08014814
	mov r8, r0
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_080147E0:
	mov r1, sl
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	adds r6, r3, #1
	cmp r1, r0
	bge _0801480E
	adds r5, r0, #0
	lsls r0, r3, #6
	add r0, sb
	mov r7, ip
	adds r2, r7, r0
_080147F6:
	cmp r1, #0x1f
	bhi _08014800
	cmp r3, #0x1f
	bhi _08014800
	strh r4, [r2]
_08014800:
	adds r2, #2
	adds r1, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, r5
	blt _080147F6
_0801480E:
	adds r3, r6, #0
	cmp r3, r8
	blt _080147E0
_08014814:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014824
sub_08014824: @ 0x08014824
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080148A4
	movs r5, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	bge _080148EC
_08014854:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _0801489A
	lsls r3, r5, #6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08014864:
	adds r0, r7, r2
	adds r4, r2, #1
	cmp r0, #0x1f
	bhi _08014894
	mov r2, sl
	adds r1, r2, r5
	cmp r1, #0x1f
	bhi _08014894
	lsls r1, r1, #6
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	adds r1, r1, r0
	mov r2, ip
	subs r0, r2, r4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	add r0, sb
	mov r2, r8
	eors r0, r2
	strh r0, [r1]
_08014894:
	adds r2, r4, #0
	cmp r2, ip
	blt _08014864
_0801489A:
	adds r5, r6, #0
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _08014854
	b _080148EC
_080148A4:
	movs r5, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	bge _080148EC
	lsls r2, r7, #1
	mov r8, r2
_080148B0:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _080148E4
	lsls r0, r5, #6
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r3, [sp]
	add r3, r8
_080148C2:
	adds r0, r7, r2
	cmp r0, #0x1f
	bhi _080148DA
	mov r1, sl
	adds r0, r1, r5
	cmp r0, #0x1f
	bhi _080148DA
	lsls r0, r0, #6
	adds r0, r0, r3
	ldrh r1, [r4]
	add r1, sb
	strh r1, [r0]
_080148DA:
	adds r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, ip
	blt _080148C2
_080148E4:
	adds r5, r6, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	blt _080148B0
_080148EC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080148FC
sub_080148FC: @ 0x080148FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sb, r1
	str r2, [sp, #4]
	ldr r7, [sp, #0x28]
	ldr r5, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldr r0, [sp, #0x30]
	mov r8, r0
	movs r0, #0x20
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivRem
	adds r1, r7, #0
	muls r1, r0, r1
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [sp, #0x2c]
	adds r0, r6, #0
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	cmp r5, r2
	bge _08014996
	mov r0, sb
	lsls r0, r0, #1
	mov ip, r0
_08014958:
	movs r4, #0
	adds r6, r5, #1
	cmp r4, r7
	bge _0801498E
	lsls r0, r5, #6
	mov r1, r8
	adds r3, r1, r0
	ldr r2, [sp]
	add r2, ip
_0801496A:
	mov r1, sb
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi _08014984
	ldr r1, [sp, #4]
	adds r0, r1, r5
	cmp r0, #0x1f
	bhi _08014984
	lsls r0, r0, #6
	adds r0, r0, r2
	ldrh r1, [r3]
	add r1, sl
	strh r1, [r0]
_08014984:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r7
	blt _0801496A
_0801498E:
	adds r5, r6, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	blt _08014958
_08014996:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080149A8
sub_080149A8: @ 0x080149A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	ldr r0, [sp, #0x34]
	mov r8, r0
	ldr r4, [sp, #0x40]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	ldr r1, [sp, #0x3c]
	ldrb r2, [r1]
	adds r2, #1
	mov sb, r2
	adds r1, #2
	str r1, [sp, #0xc]
	mov r0, sb
	mov r1, r8
	bl Div
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl Div
	adds r1, r5, #0
	muls r1, r0, r1
	subs r4, r4, r1
	mov r1, r8
	muls r1, r4, r1
	lsls r1, r1, #1
	ldr r6, [sp, #0xc]
	adds r1, r6, r1
	ldr r7, [sp, #0x38]
	muls r0, r7, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	str r1, [sp, #0xc]
	movs r5, #0
	cmp r5, r7
	bge _08014A58
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_08014A0A:
	movs r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x10]
	cmp r4, r8
	bge _08014A50
	ldr r2, [sp, #0x38]
	subs r0, r2, r5
	subs r0, #1
	mov r6, sb
	muls r6, r0, r6
	adds r0, r6, #0
	lsls r0, r0, #1
	ldr r7, [sp, #0xc]
	adds r3, r7, r0
	ldr r2, [sp]
	add r2, ip
_08014A2A:
	mov r1, sl
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi _08014A46
	ldr r6, [sp, #4]
	adds r0, r6, r5
	cmp r0, #0x1f
	bhi _08014A46
	lsls r0, r0, #6
	adds r0, r0, r2
	ldrh r7, [r3]
	ldr r6, [sp, #8]
	adds r1, r7, r6
	strh r1, [r0]
_08014A46:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r8
	blt _08014A2A
_08014A50:
	ldr r5, [sp, #0x10]
	ldr r7, [sp, #0x38]
	cmp r5, r7
	blt _08014A0A
_08014A58:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08014A68
sub_08014A68: @ 0x08014A68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r5, r1, #0
	mov ip, r2
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, r3, #2
	movs r1, #0xff
	ldr r0, [r3]
	ldrb r3, [r3]
	mov sb, r3
	lsrs r3, r0, #8
	ands r3, r1
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	blt _08014AD6
_08014A92:
	asrs r0, r1, #0x10
	add r0, ip
	lsls r4, r3, #0x10
	cmp r0, #0x1f
	bhi _08014ACA
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	mov r3, r8
	adds r1, r3, r0
	mov r7, sb
	lsls r3, r7, #0x10
	asrs r0, r3, #0x10
	cmp r0, #0
	blt _08014ACA
_08014AB0:
	asrs r3, r3, #0x10
	adds r0, r5, r3
	cmp r0, #0x1f
	bhi _08014ABE
	ldrh r7, [r2]
	adds r0, r7, r6
	strh r0, [r1]
_08014ABE:
	subs r0, r3, #1
	adds r2, #2
	adds r1, #2
	lsls r3, r0, #0x10
	cmp r3, #0
	bge _08014AB0
_08014ACA:
	ldr r1, _08014AE4 @ =0xFFFF0000
	adds r0, r4, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	cmp r1, #0
	bge _08014A92
_08014AD6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014AE4: .4byte 0xFFFF0000

	thumb_func_start CallDelayed_OnLoop
CallDelayed_OnLoop: @ 0x08014AE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08014B06
	ldr r0, [r4, #0x2c]
	bl _call_via_r0
	adds r0, r4, #0
	bl Proc_Break
_08014B06:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CallDelayedArg_OnLoop
CallDelayedArg_OnLoop: @ 0x08014B0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08014B2C
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_08014B2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CallDelayed
CallDelayed: @ 0x08014B34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08014B4C @ =0x08B92A08
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014B4C: .4byte 0x08B92A08

	thumb_func_start CallDelayedArg
CallDelayedArg: @ 0x08014B50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08014B6C @ =0x08B92A18
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014B6C: .4byte 0x08B92A18

	thumb_func_start sub_08014B70
sub_08014B70: @ 0x08014B70
	cmp r1, #0
	ble _08014B80
	movs r2, #0
_08014B76:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _08014B76
_08014B80:
	bx lr
	.align 2, 0

	thumb_func_start sub_08014B84
sub_08014B84: @ 0x08014B84
	cmp r1, #0
	ble _08014B92
_08014B88:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _08014B88
_08014B92:
	bx lr

	thumb_func_start sub_08014B94
sub_08014B94: @ 0x08014B94
	cmp r1, #0
	ble _08014BA2
_08014B98:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bgt _08014B98
_08014BA2:
	bx lr

	thumb_func_start StartPartialGameLock
StartPartialGameLock: @ 0x08014BA4
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08014BC4 @ =0x08B92AE8
	bl Proc_StartBlocking
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014BC4: .4byte 0x08B92AE8

	thumb_func_start PartialGameLock_OnLoop
PartialGameLock_OnLoop: @ 0x08014BC8
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _08014BE6
	adds r0, r4, #0
	bl Proc_Break
_08014BE6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start VramCopy
VramCopy: @ 0x08014BEC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _08014C0A
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuSet
	b _08014C1C
_08014C0A:
	adds r2, r3, #0
	cmp r2, #0
	bge _08014C12
	adds r2, #3
_08014C12:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
_08014C1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014C24
sub_08014C24: @ 0x08014C24
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _08014C4A
	adds r4, r3, #0
_08014C32:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl VramCopy
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _08014C32
_08014C4A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08014C50
sub_08014C50: @ 0x08014C50
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r2, #0
	ble _08014C6C
_08014C5C:
	ldrh r5, [r4]
	adds r0, r5, r3
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r2, #2
	cmp r2, #0
	bgt _08014C5C
_08014C6C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014C74
sub_08014C74: @ 0x08014C74
	cmp r0, #1
	beq _08014C9C
	cmp r0, #1
	bgt _08014C82
	cmp r0, #0
	beq _08014C8C
	b _08014CCC
_08014C82:
	cmp r0, #2
	beq _08014CAC
	cmp r0, #3
	beq _08014CBC
	b _08014CCC
_08014C8C:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014C98 @ =0x02022C60
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014C98: .4byte 0x02022C60
_08014C9C:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014CA8 @ =0x02023460
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014CA8: .4byte 0x02023460
_08014CAC:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014CB8 @ =0x02023C60
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014CB8: .4byte 0x02023C60
_08014CBC:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014CC8 @ =0x02024460
	adds r0, r0, r1
	b _08014CCE
	.align 2, 0
_08014CC8: .4byte 0x02024460
_08014CCC:
	movs r0, #0
_08014CCE:
	bx lr

	thumb_func_start sub_08014CD0
sub_08014CD0: @ 0x08014CD0
	push {r4, r5, lr}
	ldr r4, _08014D54 @ =0x03002870
	movs r5, #0x80
	adds r0, r5, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08014CF4
	movs r0, #0
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014CF4:
	adds r0, r5, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	cmp r0, #0
	bne _08014D12
	movs r0, #1
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014D12:
	adds r0, r5, #0
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08014D30
	movs r0, #2
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014D30:
	adds r0, r5, #0
	ldrb r4, [r4, #0x18]
	ands r0, r4
	cmp r0, #0
	bne _08014D4E
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_08014B94
_08014D4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014D54: .4byte 0x03002870

	thumb_func_start Screen2Pan
Screen2Pan: @ 0x08014D58
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _08014D66
	movs r0, #0x60
	rsbs r0, r0, #0
	b _08014D7C
_08014D66:
	cmp r1, #0xef
	bgt _08014D7A
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0xf0
	bl Div
	subs r0, #0x60
	b _08014D7C
_08014D7A:
	movs r0, #0x5f
_08014D7C:
	pop {r1}
	bx r1

	thumb_func_start PlaySeSpacial
PlaySeSpacial: @ 0x08014D80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08014DD0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014D9A
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014D9A:
	ldr r2, _08014DD4 @ =0x0869D668
	ldr r0, _08014DD8 @ =0x0869D6E0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08014DDC @ =0x0000FFFF
	adds r0, r6, #0
	bl Screen2Pan
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayPanpotControl
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014DD0: .4byte 0x0202BBF8
_08014DD4: .4byte 0x0869D668
_08014DD8: .4byte 0x0869D6E0
_08014DDC: .4byte 0x0000FFFF

	thumb_func_start PlaySeDelayed
PlaySeDelayed: @ 0x08014DE0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08014DF4 @ =PlaySeFunc
	adds r1, r3, #0
	bl CallDelayedArg
	pop {r0}
	bx r0
	.align 2, 0
_08014DF4: .4byte PlaySeFunc

	thumb_func_start PlaySeFunc
PlaySeFunc: @ 0x08014DF8
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014E14 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014E10
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014E10:
	pop {r0}
	bx r0
	.align 2, 0
_08014E14: .4byte 0x0202BBF8

	thumb_func_start sub_08014E18
sub_08014E18: @ 0x08014E18
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0

	thumb_func_start sub_08014E28
sub_08014E28: @ 0x08014E28
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08014E38
sub_08014E38: @ 0x08014E38
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #5
	ldr r1, _08014E8C @ =0x02022860
	movs r2, #0x1f
	mov ip, r2
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r4, r0, r1
	movs r5, #0xf
_08014E4E:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	lsrs r0, r0, #2
	lsls r2, r0, #1
	adds r2, r2, r0
	adds r0, r7, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r3, r0, #1
	adds r3, r3, r0
	adds r0, r6, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r1, r0, #1
	adds r1, r1, r0
	mov r0, ip
	ands r2, r0
	ands r3, r7
	orrs r2, r3
	ands r1, r6
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _08014E4E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014E8C: .4byte 0x02022860

	thumb_func_start MemCpy
MemCpy: @ 0x08014E90
	adds r3, r0, #0
	cmp r2, #0
	beq _08014EA4
_08014E96:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bne _08014E96
_08014EA4:
	bx lr
	.align 2, 0

	thumb_func_start PutDrawTextCentered
PutDrawTextCentered: @ 0x08014EA8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov sb, r1
	adds r5, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x18]
	mov r0, r8
	bl GetStringTextLen
	adds r1, r0, #0
	lsls r4, r4, #3
	subs r4, r4, r1
	asrs r1, r4, #1
	adds r0, r6, #0
	bl Text_SetCursor
	adds r0, r6, #0
	mov r1, r8
	bl Text_DrawString
	lsls r5, r5, #5
	add r5, sb
	lsls r5, r5, #1
	ldr r0, _08014EF4 @ =0x02022C60
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014EF4: .4byte 0x02022C60

	thumb_func_start VecMulMat
VecMulMat: @ 0x08014EF8
	push {r4, r5, r6, lr}
	ldr r6, [r0]
	ldr r3, [r1]
	muls r3, r6, r3
	ldr r5, [r0, #4]
	ldr r4, [r1, #0xc]
	muls r4, r5, r4
	adds r3, r3, r4
	ldr r4, [r0, #8]
	ldr r0, [r1, #0x18]
	muls r0, r4, r0
	adds r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r0, [r1, #4]
	muls r0, r6, r0
	ldr r3, [r1, #0x10]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r3, [r1, #0x1c]
	muls r3, r4, r3
	adds r0, r0, r3
	asrs r0, r0, #0xc
	str r0, [r2, #4]
	ldr r0, [r1, #8]
	muls r0, r6, r0
	ldr r3, [r1, #0x14]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r1, [r1, #0x20]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MatMulMat
MatMulMat: @ 0x08014F44
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r3, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r3, r6
	beq _08014F56
	cmp r4, r6
	bne _08014F5A
_08014F56:
	mov r5, sp
	b _08014F5C
_08014F5A:
	adds r5, r6, #0
_08014F5C:
	ldr r1, [r3]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5]
	ldr r1, [r3]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #4]
	ldr r1, [r3]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #8]
	ldr r1, [r3, #0xc]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0xc]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x10]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x14]
	ldr r1, [r3, #0x18]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x18]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x1c]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x20]
	ldr r1, [r3]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0xc]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x18]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x24]
	adds r0, r0, r1
	str r0, [r5, #0x24]
	ldr r1, [r3, #4]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0x28]
	ldr r1, [r3, #8]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x2c]
	adds r0, r0, r1
	str r0, [r5, #0x2c]
	cmp r5, sp
	bne _080150AC
	mov r0, sp
	adds r1, r6, #0
	bl MatCopy
_080150AC:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start MatIdent
MatIdent: @ 0x080150B4
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [r0]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	bx lr

	thumb_func_start MatCopy
MatCopy: @ 0x080150D4
	ldr r2, [r0]
	str r2, [r1]
	ldr r2, [r0, #4]
	str r2, [r1, #4]
	ldr r2, [r0, #8]
	str r2, [r1, #8]
	ldr r2, [r0, #0xc]
	str r2, [r1, #0xc]
	ldr r2, [r0, #0x10]
	str r2, [r1, #0x10]
	ldr r2, [r0, #0x14]
	str r2, [r1, #0x14]
	ldr r2, [r0, #0x18]
	str r2, [r1, #0x18]
	ldr r2, [r0, #0x1c]
	str r2, [r1, #0x1c]
	ldr r2, [r0, #0x20]
	str r2, [r1, #0x20]
	ldr r2, [r0, #0x24]
	str r2, [r1, #0x24]
	ldr r2, [r0, #0x28]
	str r2, [r1, #0x28]
	ldr r0, [r0, #0x2c]
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start MatRotA
MatRotA: @ 0x08015108
	push {r4, lr}
	ldr r3, _08015150 @ =0x080C5A48
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r4, [r1]
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0]
	movs r3, #0
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x10]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r1, r2, #0
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015150: .4byte 0x080C5A48

	thumb_func_start MatRotB
MatRotB: @ 0x08015154
	push {r4, lr}
	ldr r3, _08015198 @ =0x080C5A48
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r3, #0
	ldrsh r4, [r1, r3]
	str r4, [r0]
	movs r3, #0
	str r3, [r0, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r1, r2, #0
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r3, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015198: .4byte 0x080C5A48

	thumb_func_start MatRotC
MatRotC: @ 0x0801519C
	push {r4, lr}
	ldr r3, _080151E0 @ =0x080C5A48
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r4, #0
	ldrsh r3, [r1, r4]
	str r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r1, r2, #0
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080151E0: .4byte 0x080C5A48

	thumb_func_start sub_080151E4
sub_080151E4: @ 0x080151E4
	bx lr
	.align 2, 0

	thumb_func_start VecDotVec
VecDotVec: @ 0x080151E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r1]
	muls r0, r2, r0
	ldr r3, [r4, #4]
	ldr r2, [r1, #4]
	muls r2, r3, r2
	adds r0, r0, r2
	ldr r2, [r4, #8]
	ldr r1, [r1, #8]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start VecCrossVec
VecCrossVec: @ 0x0801520C
	push {r4, r5, r6, lr}
	ldr r6, [r0, #4]
	ldr r3, [r1, #8]
	muls r3, r6, r3
	ldr r5, [r0, #8]
	ldr r4, [r1, #4]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r3, [r1]
	muls r3, r5, r3
	ldr r4, [r0]
	ldr r0, [r1, #8]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2, #4]
	ldr r0, [r1, #4]
	muls r0, r4, r0
	ldr r1, [r1]
	muls r1, r6, r1
	subs r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08015244
sub_08015244: @ 0x08015244
	muls r0, r3, r0
	muls r1, r2, r1
	subs r0, r0, r1
	bx lr

	thumb_func_start OnVBlank
OnVBlank: @ 0x0801524C
	push {lr}
	ldr r1, _08015290 @ =0x03007FF8
	movs r0, #1
	strh r0, [r1]
	bl IncGameTime
	bl m4aSoundVSync
	ldr r0, _08015294 @ =0x02026A30
	ldr r0, [r0]
	bl Proc_Run
	bl SyncLoOam
	ldr r1, _08015298 @ =0x0202BBB8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08015286
	movs r0, #0
	strb r0, [r1]
	bl SyncDispIo
	bl SyncBgsAndPal
	bl ApplyDataMoves
	bl SyncHiOam
_08015286:
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_08015290: .4byte 0x03007FF8
_08015294: .4byte 0x02026A30
_08015298: .4byte 0x0202BBB8

	thumb_func_start OnMain
OnMain: @ 0x0801529C
	push {r4, lr}
	ldr r0, _080152F8 @ =0x08B857F8
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, _080152FC @ =0x02026A30
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetGameLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080152C2
	ldr r0, [r4, #8]
	bl Proc_Run
_080152C2:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #0x10]
	bl Proc_Run
	movs r0, #0xd
	bl PutSpriteLayerOam
	ldr r1, _08015300 @ =0x0202BBB8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08015304 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080152F8: .4byte 0x08B857F8
_080152FC: .4byte 0x02026A30
_08015300: .4byte 0x0202BBB8
_08015304: .4byte 0x04000006

	thumb_func_start LockGame
LockGame: @ 0x08015308
	ldr r1, _08015314 @ =0x0202BBB8
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08015314: .4byte 0x0202BBB8

	thumb_func_start UnlockGame
UnlockGame: @ 0x08015318
	ldr r1, _08015324 @ =0x0202BBB8
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08015324: .4byte 0x0202BBB8

	thumb_func_start GetGameLock
GetGameLock: @ 0x08015328
	ldr r0, _08015330 @ =0x0202BBB8
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_08015330: .4byte 0x0202BBB8

	thumb_func_start HandleChangePhase
HandleChangePhase: @ 0x08015334
	push {lr}
	ldr r2, _08015348 @ =0x0202BBF8
	ldrb r0, [r2, #0xf]
	cmp r0, #0x40
	beq _0801535E
	cmp r0, #0x40
	bgt _0801534C
	cmp r0, #0
	beq _08015352
	b _08015372
	.align 2, 0
_08015348: .4byte 0x0202BBF8
_0801534C:
	cmp r0, #0x80
	beq _08015358
	b _08015372
_08015352:
	movs r0, #0x80
	strb r0, [r2, #0xf]
	b _08015372
_08015358:
	movs r0, #0x40
	strb r0, [r2, #0xf]
	b _08015372
_0801535E:
	movs r0, #0
	strb r0, [r2, #0xf]
	ldrh r1, [r2, #0x10]
	ldr r0, _08015378 @ =0x000003E6
	cmp r1, r0
	bhi _0801536E
	adds r0, r1, #1
	strh r0, [r2, #0x10]
_0801536E:
	bl DoTurnSupportExp
_08015372:
	pop {r0}
	bx r0
	.align 2, 0
_08015378: .4byte 0x000003E6

	thumb_func_start CallChapterStartEventMaybe
CallChapterStartEventMaybe: @ 0x0801537C
	push {lr}
	ldr r0, _08015398 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x38]
	bl sub_0800AF5C
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08015398: .4byte 0x0202BBF8

	thumb_func_start BmMain_ChangePhase
BmMain_ChangePhase: @ 0x0801539C
	push {lr}
	bl ClearActiveFactionGrayedStates
	bl RefreshUnitSprites
	bl HandleChangePhase
	bl CheckAvailableTurnEvent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080153BA
	movs r0, #1
	b _080153C0
_080153BA:
	bl StartAvailableTurnEvents
	movs r0, #0
_080153C0:
	pop {r1}
	bx r1

	thumb_func_start sub_080153C4
sub_080153C4: @ 0x080153C4
	push {lr}
	bl sub_08079104
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080153D6
	movs r0, #1
	b _080153DC
_080153D6:
	bl sub_080790C4
	movs r0, #0
_080153DC:
	pop {r1}
	bx r1

	thumb_func_start BmMain_StartPhase
BmMain_StartPhase: @ 0x080153E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080153F8 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0801541C
	cmp r0, #0x40
	bgt _080153FC
	cmp r0, #0
	beq _08015402
	b _08015424
	.align 2, 0
_080153F8: .4byte 0x0202BBF8
_080153FC:
	cmp r0, #0x80
	beq _0801540C
	b _08015424
_08015402:
	ldr r0, _08015408 @ =0x08B93374
	b _0801540E
	.align 2, 0
_08015408: .4byte 0x08B93374
_0801540C:
	ldr r0, _08015418 @ =0x08B96E80
_0801540E:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08015424
	.align 2, 0
_08015418: .4byte 0x08B96E80
_0801541C:
	ldr r0, _08015430 @ =0x08B96E80
	adds r1, r4, #0
	bl Proc_StartBlocking
_08015424:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015430: .4byte 0x08B96E80

	thumb_func_start BmMain_ResumePlayerPhase
BmMain_ResumePlayerPhase: @ 0x08015434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08015454 @ =0x08B93374
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r1, #7
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015454: .4byte 0x08B93374

	thumb_func_start BmMain_UpdateTraps
BmMain_UpdateTraps: @ 0x08015458
	push {lr}
	adds r1, r0, #0
	ldr r0, _08015474 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	bne _0801547C
	ldr r0, _08015478 @ =0x08B94578
	bl Proc_StartBlocking
	bl DecayTraps
	movs r0, #0
	b _0801547E
	.align 2, 0
_08015474: .4byte 0x0202BBF8
_08015478: .4byte 0x08B94578
_0801547C:
	movs r0, #1
_0801547E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BmMain_SuspendBeforePhase
BmMain_SuspendBeforePhase: @ 0x08015484
	push {lr}
	ldr r1, _08015498 @ =0x0203A85C
	movs r0, #9
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_08015498: .4byte 0x0203A85C

	thumb_func_start sub_0801549C
sub_0801549C: @ 0x0801549C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080154C0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _080154BA
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_080154BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080154C0: .4byte 0x0202BBF8

	thumb_func_start BmMain_StartIntroFx
BmMain_StartIntroFx: @ 0x080154C4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080154F4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	bne _080154FC
	ldr r2, _080154F8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	b _08015502
	.align 2, 0
_080154F4: .4byte 0x0202BBF8
_080154F8: .4byte 0x03002870
_080154FC:
	ldr r0, _08015508 @ =0x08B93934
	bl Proc_StartBlocking
_08015502:
	pop {r0}
	bx r0
	.align 2, 0
_08015508: .4byte 0x08B93934

	thumb_func_start sub_0801550C
sub_0801550C: @ 0x0801550C
	push {lr}
	bl HideAllUnits
	movs r0, #0x91
	bl ClearFlag
	pop {r0}
	bx r0

	thumb_func_start InitBmBgLayers
InitBmBgLayers: @ 0x0801551C
	ldr r0, _08015554 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _0801555C
	ldr r3, _08015558 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	orrs r2, r1
	strb r2, [r3, #0x18]
	b _08015588
	.align 2, 0
_08015554: .4byte 0x0202BBF8
_08015558: .4byte 0x03002870
_0801555C:
	ldr r3, _0801558C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
_08015588:
	bx lr
	.align 2, 0
_0801558C: .4byte 0x03002870

	thumb_func_start ApplySystemObjectsGraphics
ApplySystemObjectsGraphics: @ 0x08015590
	push {r4, lr}
	ldr r0, _080155BC @ =0x08193E90
	ldr r4, _080155C0 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _080155C4 @ =0x06010000
	adds r0, r4, #0
	movs r2, #0x12
	movs r3, #4
	bl Copy2dChr
	ldr r0, _080155C8 @ =0x0819431C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080155BC: .4byte 0x08193E90
_080155C0: .4byte 0x02020140
_080155C4: .4byte 0x06010000
_080155C8: .4byte 0x0819431C

	thumb_func_start ApplySystemGraphics
ApplySystemGraphics: @ 0x080155CC
	push {lr}
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitFaces
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ApplySystemObjectsGraphics
	pop {r0}
	bx r0

	thumb_func_start HandleMapCursorInput
HandleMapCursorInput: @ 0x080155EC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov ip, r1
	lsrs r7, r0, #0x14
	movs r0, #0xf
	ands r7, r0
	ldr r3, _080156EC @ =0x0202BBB8
	ldr r4, _080156F0 @ =0x08B92D28
	lsls r2, r7, #1
	adds r0, r2, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r3, #0x14]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	adds r0, r4, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldrh r2, [r3, #0x16]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r6, r1, #0x10
	orrs r6, r0
	movs r0, #2
	ldrb r1, [r3, #4]
	ands r0, r1
	adds r5, r3, #0
	cmp r0, #0
	beq _0801566A
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	ldr r1, _080156F4 @ =0x0202E3E4
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x14
	ldrsh r1, [r5, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0801566A
	asrs r0, r6, #0x10
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bls _0801566A
	movs r0, #0xf0
	ldr r1, _080156F8 @ =0x08B857F8
	ldr r2, [r1]
	mov r1, ip
	ands r1, r0
	ldrh r2, [r2, #8]
	ands r0, r2
	cmp r1, r0
	bne _0801570E
_0801566A:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08015694
	ldr r0, _080156FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _08015694
	lsls r0, r7, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r3, [r5, #0x1c]
	adds r0, r3, r0
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	strh r0, [r5, #0x18]
	strh r6, [r5, #0x14]
_08015694:
	asrs r2, r6, #0x10
	adds r1, r2, #0
	cmp r1, #0
	blt _080156C0
	ldr r0, _080156FC @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _080156C0
	lsls r0, r7, #1
	adds r1, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r1, [r5, #0x1e]
	adds r0, r1, r0
	strh r0, [r5, #0x1e]
	ldrh r0, [r5, #0x16]
	strh r0, [r5, #0x1a]
	strh r2, [r5, #0x16]
_080156C0:
	ldrb r1, [r5, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08015708
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #0x18]
	cmp r1, r0
	beq _0801570E
	ldr r0, _08015700 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080156E4
	ldr r0, _08015704 @ =0x00000385
	bl m4aSongNumStart
_080156E4:
	movs r0, #4
	ldrb r2, [r5, #4]
	orrs r0, r2
	b _0801570C
	.align 2, 0
_080156EC: .4byte 0x0202BBB8
_080156F0: .4byte 0x08B92D28
_080156F4: .4byte 0x0202E3E4
_080156F8: .4byte 0x08B857F8
_080156FC: .4byte 0x0202E3D8
_08015700: .4byte 0x0202BBF8
_08015704: .4byte 0x00000385
_08015708:
	movs r0, #0xfb
	ands r0, r1
_0801570C:
	strb r0, [r5, #4]
_0801570E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HandleMoveMapCursor
HandleMoveMapCursor: @ 0x08015714
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08015764 @ =0x0202BBB8
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bge _0801572C
	adds r0, r3, r4
	strh r0, [r2, #0x20]
_0801572C:
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	ble _0801573E
	subs r0, r3, r4
	strh r0, [r2, #0x20]
_0801573E:
	ldrh r3, [r2, #0x22]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r5, #0x1e
	ldrsh r1, [r2, r5]
	cmp r0, r1
	bge _08015750
	adds r0, r3, r4
	strh r0, [r2, #0x22]
_08015750:
	ldrh r3, [r2, #0x22]
	movs r5, #0x22
	ldrsh r0, [r2, r5]
	cmp r0, r1
	ble _0801575E
	subs r0, r3, r4
	strh r0, [r2, #0x22]
_0801575E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015764: .4byte 0x0202BBB8

	thumb_func_start HandleMoveCameraWithMapCursor
HandleMoveCameraWithMapCursor: @ 0x08015768
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r2, _08015790 @ =0x0202BBB8
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r3, #0x22
	ldrsh r5, [r2, r3]
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	adds r0, #0x30
	cmp r0, r1
	ble _080157AC
	adds r0, r1, #0
	subs r0, #0x30
	cmp r0, #0
	bge _08015794
	strh r6, [r2, #0xc]
	b _080157AC
	.align 2, 0
_08015790: .4byte 0x0202BBB8
_08015794:
	movs r6, #1
	ldrh r3, [r2, #0xc]
	subs r0, r3, r4
	strh r0, [r2, #0xc]
	rsbs r0, r4, #0
	adds r3, r2, #0
	adds r3, #0x36
	strb r0, [r3]
	movs r0, #0xf
	ldrh r3, [r2, #0xc]
	ands r0, r3
	strh r0, [r2, #0x32]
_080157AC:
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	adds r0, #0xb0
	cmp r0, r1
	bge _080157DC
	subs r1, #0xb0
	movs r3, #0x28
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _080157C6
	ldrh r0, [r2, #0x28]
	strh r0, [r2, #0xc]
	b _080157DC
_080157C6:
	movs r6, #1
	ldrh r1, [r2, #0xc]
	adds r0, r1, r4
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x36
	strb r4, [r0]
	movs r0, #0xf
	ldrh r3, [r2, #0xc]
	ands r0, r3
	strh r0, [r2, #0x32]
_080157DC:
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	adds r0, #0x20
	cmp r0, r5
	ble _0801580C
	adds r0, r5, #0
	subs r0, #0x20
	cmp r0, #0
	bge _080157F4
	movs r0, #0
	strh r0, [r2, #0xe]
	b _0801580C
_080157F4:
	movs r6, #1
	ldrh r3, [r2, #0xe]
	subs r0, r3, r4
	strh r0, [r2, #0xe]
	rsbs r0, r4, #0
	adds r1, r2, #0
	adds r1, #0x37
	strb r0, [r1]
	movs r0, #0xf
	ldrh r1, [r2, #0xe]
	ands r0, r1
	strh r0, [r2, #0x34]
_0801580C:
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	adds r0, #0x70
	cmp r0, r5
	bge _0801583E
	adds r1, r5, #0
	subs r1, #0x70
	movs r3, #0x2a
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08015828
	ldrh r0, [r2, #0x2a]
	strh r0, [r2, #0xe]
	b _0801583E
_08015828:
	movs r6, #1
	ldrh r1, [r2, #0xe]
	adds r0, r1, r4
	strh r0, [r2, #0xe]
	adds r0, r2, #0
	adds r0, #0x37
	strb r4, [r0]
	movs r0, #0xf
	ldrh r3, [r2, #0xe]
	ands r0, r3
	strh r0, [r2, #0x34]
_0801583E:
	cmp r6, #0
	bne _0801588C
	adds r3, r2, #0
	ldrh r1, [r3, #0x32]
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _08015868
	adds r4, r3, #0
	adds r4, #0x36
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r3, #0x32]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrh r1, [r3, #0xc]
	adds r0, r1, r0
	strh r0, [r3, #0xc]
_08015868:
	ldrh r1, [r2, #0x34]
	movs r3, #0x34
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0801588C
	adds r3, r2, #0
	adds r3, #0x37
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrh r4, [r2, #0xe]
	adds r0, r4, r0
	strh r0, [r2, #0xe]
_0801588C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetCameraAdjustedX
GetCameraAdjustedX: @ 0x08015894
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _080158D4 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x30
	adds r4, r0, #0
	cmp r1, r3
	ble _080158B2
	adds r2, r3, #0
	subs r2, #0x30
	cmp r2, #0
	bge _080158B2
	movs r2, #0
_080158B2:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	adds r0, #0xb0
	cmp r0, r3
	bge _080158CA
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0xb0
	cmp r2, r0
	ble _080158CA
	adds r2, r0, #0
_080158CA:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080158D4: .4byte 0x0202BBB8

	thumb_func_start GetCameraAdjustedY
GetCameraAdjustedY: @ 0x080158D8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08015918 @ =0x0202BBB8
	movs r1, #0xe
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x20
	adds r4, r0, #0
	cmp r1, r3
	ble _080158F6
	adds r2, r3, #0
	subs r2, #0x20
	cmp r2, #0
	bge _080158F6
	movs r2, #0
_080158F6:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	adds r0, #0x70
	cmp r0, r3
	bge _0801590E
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0x70
	cmp r2, r0
	ble _0801590E
	adds r2, r0, #0
_0801590E:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015918: .4byte 0x0202BBB8

	thumb_func_start GetCameraCenteredX
GetCameraCenteredX: @ 0x0801591C
	adds r1, r0, #0
	subs r1, #0x78
	cmp r1, #0
	bge _08015926
	movs r1, #0
_08015926:
	ldr r0, _08015940 @ =0x0202BBB8
	movs r2, #0x28
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015932
	adds r1, r0, #0
_08015932:
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08015940: .4byte 0x0202BBB8

	thumb_func_start GetCameraCenteredY
GetCameraCenteredY: @ 0x08015944
	adds r1, r0, #0
	subs r1, #0x50
	cmp r1, #0
	bge _0801594E
	movs r1, #0
_0801594E:
	ldr r0, _08015968 @ =0x0202BBB8
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0801595A
	adds r1, r0, #0
_0801595A:
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08015968: .4byte 0x0202BBB8

	thumb_func_start PutMapCursor
PutMapCursor: @ 0x0801596C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	mov r8, r0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	cmp r5, #4
	bhi _08015A26
	lsls r0, r5, #2
	ldr r1, _0801599C @ =_080159A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801599C: .4byte _080159A0
_080159A0: @ jump table
	.4byte _080159B4 @ case 0
	.4byte _080159B4 @ case 1
	.4byte _080159C4 @ case 2
	.4byte _08015A0C @ case 3
	.4byte _08015A1C @ case 4
_080159B4:
	movs r1, #2
	mov sb, r1
	ldr r1, _080159C0 @ =0x08B92DB0
	lsls r0, r4, #2
	adds r0, r0, r1
	b _08015A22
	.align 2, 0
_080159C0: .4byte 0x08B92DB0
_080159C4:
	bl GetGameTime
	subs r0, #1
	ldr r5, _08015A00 @ =0x0202BC44
	ldr r1, [r5]
	cmp r0, r1
	bne _080159E4
	ldr r0, _08015A04 @ =0x0202BC40
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r6, r1
	asrs r6, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r7, r0
	asrs r7, r0, #1
_080159E4:
	movs r2, #0x24
	mov sb, r2
	ldr r1, _08015A08 @ =0x08B92DB0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _08015A04 @ =0x0202BC40
	strh r6, [r0]
	strh r7, [r0, #2]
	bl GetGameTime
	str r0, [r5]
	b _08015A26
	.align 2, 0
_08015A00: .4byte 0x0202BC44
_08015A04: .4byte 0x0202BC40
_08015A08: .4byte 0x08B92DB0
_08015A0C:
	movs r0, #2
	mov sb, r0
	ldr r1, _08015A18 @ =0x08B92D96
	mov r8, r1
	b _08015A26
	.align 2, 0
_08015A18: .4byte 0x08B92D96
_08015A1C:
	movs r2, #0x24
	mov sb, r2
	ldr r0, _08015A54 @ =0x08B92DB0
_08015A22:
	ldr r0, [r0]
	mov r8, r0
_08015A26:
	ldr r0, _08015A58 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r6, r6, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	subs r7, r7, r0
	mov r2, sb
	str r2, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015A54: .4byte 0x08B92DB0
_08015A58: .4byte 0x0202BBB8

	thumb_func_start DisplayBmTextShadow
DisplayBmTextShadow: @ 0x08015A5C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	movs r2, #2
	ldr r1, _08015A8C @ =0x08B92DB0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015A8C: .4byte 0x08B92DB0

	thumb_func_start SetMapCursorPosition
SetMapCursorPosition: @ 0x08015A90
	ldr r2, _08015AA4 @ =0x0202BBB8
	strh r0, [r2, #0x14]
	strh r1, [r2, #0x16]
	lsls r0, r0, #4
	strh r0, [r2, #0x1c]
	lsls r1, r1, #4
	strh r1, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r1, [r2, #0x22]
	bx lr
	.align 2, 0
_08015AA4: .4byte 0x0202BBB8

	thumb_func_start PutSysArrow
PutSysArrow: @ 0x08015AA8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	cmp r4, #0
	beq _08015ACC
	ldr r1, _08015AC8 @ =0x08B92E2C
	b _08015ACE
	.align 2, 0
_08015AC8: .4byte 0x08B92E2C
_08015ACC:
	ldr r1, _08015AEC @ =0x08B92E20
_08015ACE:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015AEC: .4byte 0x08B92E20

	thumb_func_start CamMove_Init
CamMove_Init: @ 0x08015AF0
	push {r4, r5, r6, lr}
	mov ip, r0
	movs r5, #1
	movs r1, #0x2c
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r0, [r0, r3]
	subs r1, r2, r0
	cmp r1, #0
	bge _08015B06
	subs r1, r0, r2
_08015B06:
	mov r4, ip
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge _08015B18
	subs r2, r0, r3
_08015B18:
	cmp r1, r2
	ble _08015B28
	mov r0, ip
	adds r0, #0x40
	strb r5, [r0]
	mov r3, ip
	strh r1, [r3, #0x38]
	b _08015B34
_08015B28:
	mov r1, ip
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	mov r4, ip
	strh r2, [r4, #0x38]
_08015B34:
	mov r0, ip
	movs r1, #0x38
	ldrsh r3, [r0, r1]
	movs r4, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	ldr r6, _08015B4C @ =0x0202BC48
	cmp r0, #0
	bge _08015B50
	strb r3, [r6]
	b _08015B76
	.align 2, 0
_08015B4C: .4byte 0x0202BC48
_08015B50:
	lsls r1, r5, #0x18
	asrs r2, r1, #0x18
	asrs r1, r1, #0x19
	subs r3, r3, r1
	adds r0, r4, r6
	strb r1, [r0]
	cmp r2, #0xf
	bgt _08015B66
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08015B66:
	adds r4, #1
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	cmp r0, #0
	bge _08015B50
	adds r0, r4, r6
	strb r3, [r0]
_08015B76:
	mov r2, ip
	str r4, [r2, #0x3c]
	ldrh r0, [r2, #0x38]
	strh r0, [r2, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CamMove_OnLoop
CamMove_OnLoop: @ 0x08015B84
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x3c]
	cmp r1, #0
	bne _08015BA4
	ldr r0, _08015BA0 @ =0x0202BBB8
	ldrh r1, [r0, #0xc]
	strh r1, [r5, #0x2c]
	ldrh r0, [r0, #0xe]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_End
	b _08015BF6
	.align 2, 0
_08015BA0: .4byte 0x0202BBB8
_08015BA4:
	ldr r0, _08015BFC @ =0x0202BC48
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r5, #0x3a]
	subs r0, r2, r0
	strh r0, [r5, #0x3a]
	subs r0, r1, #1
	str r0, [r5, #0x3c]
	ldr r4, _08015C00 @ =0x0202BBB8
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2c]
	adds r0, r1, r0
	strh r0, [r4, #0xc]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r5, [r5, #0x2e]
	adds r0, r5, r0
	strh r0, [r4, #0xe]
_08015BF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015BFC: .4byte 0x0202BC48
_08015C00: .4byte 0x0202BBB8

	thumb_func_start StoreAdjustedCameraPositions
StoreAdjustedCameraPositions: @ 0x08015C04
	push {r4, r5, lr}
	adds r4, r2, #0
	subs r0, #7
	str r0, [r4]
	subs r1, #5
	str r1, [r3]
	ldr r0, [r4]
	cmp r0, #0
	bge _08015C1A
	movs r0, #0
	str r0, [r4]
_08015C1A:
	ldr r0, [r3]
	cmp r0, #0
	bge _08015C24
	movs r0, #0
	str r0, [r3]
_08015C24:
	ldr r1, [r4]
	adds r1, #8
	ldr r5, _08015C54 @ =0x0202E3D8
	movs r0, #0
	ldrsh r2, [r5, r0]
	subs r0, r2, #1
	cmp r1, r0
	ble _08015C38
	subs r0, #0xe
	str r0, [r4]
_08015C38:
	ldr r0, [r3]
	adds r0, #4
	movs r1, #2
	ldrsh r2, [r5, r1]
	subs r1, r2, #1
	cmp r0, r1
	ble _08015C4C
	adds r0, r2, #0
	subs r0, #0xa
	str r0, [r3]
_08015C4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015C54: .4byte 0x0202E3D8

	thumb_func_start EnsureCameraOntoCenteredPosition
EnsureCameraOntoCenteredPosition: @ 0x08015C58
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	add r3, sp, #4
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sp
	bl StoreAdjustedCameraPositions
	ldr r1, [sp]
	lsls r1, r1, #4
	str r1, [sp]
	ldr r0, [sp, #4]
	lsls r2, r0, #4
	str r2, [sp, #4]
	ldr r3, _08015C9C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _08015C8C
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r2, r0
	beq _08015C98
_08015C8C:
	ldr r4, _08015CA0 @ =0x08B92E38
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015CA4
_08015C98:
	movs r0, #0
	b _08015CD4
	.align 2, 0
_08015C9C: .4byte 0x0202BBB8
_08015CA0: .4byte 0x08B92E38
_08015CA4:
	cmp r5, #0
	beq _08015CB2
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015CBA
_08015CB2:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015CBA:
	adds r2, r0, #0
	ldr r1, _08015CDC @ =0x0202BBB8
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldr r0, [sp]
	strh r0, [r2, #0x2c]
	ldr r0, [sp, #4]
	strh r0, [r2, #0x2e]
	strh r6, [r2, #0x34]
	strh r7, [r2, #0x36]
	movs r0, #1
_08015CD4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015CDC: .4byte 0x0202BBB8

	thumb_func_start EnsureCameraOntoPosition
EnsureCameraOntoPosition: @ 0x08015CE0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	lsls r0, r1, #4
	bl GetCameraAdjustedX
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, sb
	lsls r0, r1, #4
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08015D28 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r7, r0
	bne _08015D16
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r6, r0
	beq _08015D22
_08015D16:
	ldr r4, _08015D2C @ =0x08B92E38
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015D30
_08015D22:
	movs r0, #0
	b _08015D60
	.align 2, 0
_08015D28: .4byte 0x0202BBB8
_08015D2C: .4byte 0x08B92E38
_08015D30:
	cmp r5, #0
	beq _08015D3E
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015D46
_08015D3E:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015D46:
	adds r2, r0, #0
	ldr r0, _08015D6C @ =0x0202BBB8
	ldrh r1, [r0, #0xc]
	strh r1, [r2, #0x30]
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #0x32]
	strh r7, [r2, #0x2c]
	strh r6, [r2, #0x2e]
	mov r0, r8
	strh r0, [r2, #0x34]
	mov r1, sb
	strh r1, [r2, #0x36]
	movs r0, #1
_08015D60:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015D6C: .4byte 0x0202BBB8

	thumb_func_start IsCameraNotWatchingPosition
IsCameraNotWatchingPosition: @ 0x08015D70
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #4
	bl GetCameraAdjustedX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #4
	adds r0, r5, #0
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08015DA4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _08015DA8
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r2, r0
	bne _08015DA8
	movs r0, #0
	b _08015DAA
	.align 2, 0
_08015DA4: .4byte 0x0202BBB8
_08015DA8:
	movs r0, #1
_08015DAA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CameraMove_801622C
CameraMove_801622C: @ 0x08015DB0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08015DD4 @ =0x0202BBB8
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015DCE
	ldr r4, _08015DD8 @ =0x08B92E38
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015DDC
_08015DCE:
	movs r0, #0
	b _08015E08
	.align 2, 0
_08015DD4: .4byte 0x0202BBB8
_08015DD8: .4byte 0x08B92E38
_08015DDC:
	cmp r5, #0
	beq _08015DEA
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015DF2
_08015DEA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015DF2:
	adds r2, r0, #0
	ldr r1, _08015E10 @ =0x0202BBB8
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x2c]
	ldrh r0, [r1, #0x2a]
	strh r0, [r2, #0x2e]
	movs r0, #1
_08015E08:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08015E10: .4byte 0x0202BBB8

	thumb_func_start UnkMapCursor_OnLoop
UnkMapCursor_OnLoop: @ 0x08015E14
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	ldr r4, [r7, #0x34]
	muls r0, r4, r0
	ldr r5, [r7, #0x38]
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	bl PutMapCursor
	ldr r0, [r7, #0x34]
	subs r0, #1
	str r0, [r7, #0x34]
	cmp r0, #0
	bge _08015E5C
	adds r0, r7, #0
	bl Proc_Break
_08015E5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08015E64
sub_08015E64: @ 0x08015E64
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08015E94 @ =0x08B92E60
	movs r1, #3
	bl Proc_Start
	ldr r2, _08015E98 @ =0x0202BBB8
	ldrh r3, [r2, #0x14]
	lsls r1, r3, #4
	strh r1, [r0, #0x2c]
	ldrh r2, [r2, #0x16]
	lsls r1, r2, #4
	strh r1, [r0, #0x2e]
	lsls r4, r4, #4
	strh r4, [r0, #0x30]
	lsls r5, r5, #4
	strh r5, [r0, #0x32]
	str r6, [r0, #0x38]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015E94: .4byte 0x08B92E60
_08015E98: .4byte 0x0202BBB8

	thumb_func_start GetActiveMapSong
GetActiveMapSong: @ 0x08015E9C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08015ED0 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08015EAA
	movs r1, #3
_08015EAA:
	adds r4, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r1, #6
	cmp r0, #0
	bne _08015EBC
	adds r1, r4, #0
_08015EBC:
	adds r7, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015ED4
	adds r1, r4, #1
	b _08015ED6
	.align 2, 0
_08015ED0: .4byte 0x0202BBF8
_08015ED4:
	movs r1, #7
_08015ED6:
	adds r6, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015EE8
	adds r4, #2
	b _08015EEA
_08015EE8:
	movs r4, #6
_08015EEA:
	ldr r5, _08015EFC @ =0x0202BBF8
	ldrb r0, [r5, #0xf]
	cmp r0, #0x40
	beq _08015F16
	cmp r0, #0x40
	bgt _08015F00
	cmp r0, #0
	beq _08015F28
	b _08015F78
	.align 2, 0
_08015EFC: .4byte 0x0202BBF8
_08015F00:
	cmp r0, #0x80
	bne _08015F78
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	lsls r1, r6, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _08015F78
_08015F16:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	lsls r1, r4, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _08015F78
_08015F28:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08015F64
	ldr r1, _08015F60 @ =0x0001000C
	movs r0, #0x80
	bl CountFactionUnitsWithoutFlags
	adds r4, r0, #0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bgt _08015F64
	movs r0, #9
	b _08015F78
	.align 2, 0
_08015F60: .4byte 0x0001000C
_08015F64:
	ldr r0, _08015F80 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
_08015F78:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015F80: .4byte 0x0202BBF8

	thumb_func_start StartMapSongBgm
StartMapSongBgm: @ 0x08015F84
	push {lr}
	bl GetActiveMapSong
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0

	thumb_func_start sub_08015F94
sub_08015F94: @ 0x08015F94
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r6, #0x2e
	ldrsh r2, [r5, r6]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r1, _08015FEC @ =0x0202BBB8
	strh r4, [r1, #0xc]
	strh r0, [r1, #0xe]
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _08015FE2
	adds r0, r5, #0
	bl Proc_End
_08015FE2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015FEC: .4byte 0x0202BBB8

	thumb_func_start sub_08015FF0
sub_08015FF0: @ 0x08015FF0
	bx lr
	.align 2, 0

	thumb_func_start sub_08015FF4
sub_08015FF4: @ 0x08015FF4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	beq _08016010
	ldr r0, _0801600C @ =0x08B92E70
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08016018
	.align 2, 0
_0801600C: .4byte 0x08B92E70
_08016010:
	ldr r0, _08016038 @ =0x08B92E70
	movs r1, #3
	bl Proc_Start
_08016018:
	adds r3, r0, #0
	ldr r1, _0801603C @ =0x0202BBB8
	ldrh r0, [r1, #0xc]
	movs r2, #0
	strh r0, [r3, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r3, #0x32]
	lsls r0, r5, #4
	strh r0, [r3, #0x2c]
	lsls r0, r6, #4
	strh r0, [r3, #0x2e]
	strh r7, [r3, #0x3a]
	str r2, [r3, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016038: .4byte 0x08B92E70
_0801603C: .4byte 0x0202BBB8

	thumb_func_start GetItemHpBonus
GetItemHpBonus: @ 0x08016040
	adds r1, r0, #0
	cmp r1, #0
	beq _0801605A
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016060 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016064
_0801605A:
	movs r0, #0
	b _0801606A
	.align 2, 0
_08016060: .4byte 0x08BE222C
_08016064:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801606A:
	bx lr

	thumb_func_start GetItemPowBonus
GetItemPowBonus: @ 0x0801606C
	adds r1, r0, #0
	cmp r1, #0
	beq _08016086
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801608C @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016090
_08016086:
	movs r0, #0
	b _08016096
	.align 2, 0
_0801608C: .4byte 0x08BE222C
_08016090:
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016096:
	bx lr

	thumb_func_start GetItemSklBonus
GetItemSklBonus: @ 0x08016098
	adds r1, r0, #0
	cmp r1, #0
	beq _080160B2
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080160B8 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080160BC
_080160B2:
	movs r0, #0
	b _080160C2
	.align 2, 0
_080160B8: .4byte 0x08BE222C
_080160BC:
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080160C2:
	bx lr

	thumb_func_start GetItemSpdBonus
GetItemSpdBonus: @ 0x080160C4
	adds r1, r0, #0
	cmp r1, #0
	beq _080160DE
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080160E4 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080160E8
_080160DE:
	movs r0, #0
	b _080160EE
	.align 2, 0
_080160E4: .4byte 0x08BE222C
_080160E8:
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080160EE:
	bx lr

	thumb_func_start GetItemDefBonus
GetItemDefBonus: @ 0x080160F0
	adds r1, r0, #0
	cmp r1, #0
	beq _0801610A
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016110 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016114
_0801610A:
	movs r0, #0
	b _0801611A
	.align 2, 0
_08016110: .4byte 0x08BE222C
_08016114:
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801611A:
	bx lr

	thumb_func_start GetItemResBonus
GetItemResBonus: @ 0x0801611C
	adds r1, r0, #0
	cmp r1, #0
	beq _08016136
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801613C @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016140
_08016136:
	movs r0, #0
	b _08016146
	.align 2, 0
_0801613C: .4byte 0x08BE222C
_08016140:
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016146:
	bx lr

	thumb_func_start GetItemLckBonus
GetItemLckBonus: @ 0x08016148
	adds r1, r0, #0
	cmp r1, #0
	beq _08016162
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016168 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _0801616C
_08016162:
	movs r0, #0
	b _08016172
	.align 2, 0
_08016168: .4byte 0x08BE222C
_0801616C:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016172:
	bx lr

	thumb_func_start MakeNewItem
MakeNewItem: @ 0x08016174
	adds r2, r0, #0
	movs r0, #0xff
	ands r2, r0
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080161A0 @ =0x08BE222C
	adds r3, r0, r1
	ldr r1, [r3, #8]
	movs r0, #8
	ands r1, r0
	movs r0, #0xff
	cmp r1, #0
	bne _08016192
	ldrb r0, [r3, #0x14]
_08016192:
	cmp r1, #0
	beq _08016198
	movs r0, #0
_08016198:
	lsls r0, r0, #8
	adds r0, r0, r2
	bx lr
	.align 2, 0
_080161A0: .4byte 0x08BE222C

	thumb_func_start CanUnitUseWeapon
CanUnitUseWeapon: @ 0x080161A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	bne _080161B0
	b _08016346
_080161B0:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016300 @ =0x08BE222C
	adds r0, r0, r1
	ldr r2, [r0, #8]
	movs r0, #1
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	bne _080161CC
	b _08016346
_080161CC:
	ldr r0, _08016304 @ =0x003D3C00
	ands r0, r2
	cmp r0, #0
	bne _080161D6
	b _08016320
_080161D6:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _080161F6
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _080161F6
	b _08016346
_080161F6:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08016224
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08016224
	b _08016346
_08016224:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08016250
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	beq _08016346
_08016250:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _0801627C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x17
	ands r0, r1
	cmp r0, #0
	beq _08016346
_0801627C:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _080162A2
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	cmp r0, #0
	bge _08016346
_080162A2:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _080162CE
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08016346
_080162CE:
	movs r0, #0xff
	ands r0, r5
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08016308
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08016346
	movs r0, #1
	b _08016378
	.align 2, 0
_08016300: .4byte 0x08BE222C
_08016304: .4byte 0x003D3C00
_08016308:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r1, r0
	cmp r1, #0
	beq _08016320
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08017178
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016346
_08016320:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	ldr r3, _0801634C @ =0x08BE222C
	cmp r0, #3
	bne _08016350
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08016350
_08016346:
	movs r0, #0
	b _08016378
	.align 2, 0
_0801634C: .4byte 0x08BE222C
_08016350:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #0x1c]
	movs r1, #0xff
	cmp r5, #0
	beq _08016366
	ldrb r1, [r0, #7]
_08016366:
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	movs r1, #0
	ldrb r0, [r0]
	cmp r0, r2
	blt _08016376
	movs r1, #1
_08016376:
	adds r0, r1, #0
_08016378:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CanUnitUseWeaponNow
CanUnitUseWeaponNow: @ 0x08016380
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _080163B6
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080163BC @ =0x08BE222C
	adds r0, r0, r1
	ldr r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080163B6
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080163C0
	adds r0, r5, #0
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080163C0
_080163B6:
	movs r0, #0
	b _080163CC
	.align 2, 0
_080163BC: .4byte 0x08BE222C
_080163C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080163CC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CanUnitUseStaff
CanUnitUseStaff: @ 0x080163D4
	adds r3, r0, #0
	cmp r1, #0
	beq _08016408
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801640C @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016408
	adds r0, r3, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08016408
	cmp r1, #4
	beq _08016408
	cmp r1, #3
	bne _08016410
_08016408:
	movs r0, #0
	b _08016426
	.align 2, 0
_0801640C: .4byte 0x08BE222C
_08016410:
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r1, [r2, #7]
	adds r0, r1, r0
	movs r1, #0
	ldrb r0, [r0]
	ldrb r2, [r2, #0x1c]
	cmp r0, r2
	blt _08016424
	movs r1, #1
_08016424:
	adds r0, r1, #0
_08016426:
	bx lr

