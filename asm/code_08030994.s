	.include "macro.inc"

	.syntax unified

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
