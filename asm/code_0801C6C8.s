	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801C6C8
sub_0801C6C8: @ 0x0801C6C8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xff
	bl HandlePlayerMapCursor
	ldr r0, _0801C6F0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C744
	ldr r4, _0801C6F4 @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	bne _0801C6F8
	bl GetCombinedEnemyWeaponUsabilityBits
	b _0801C722
	.align 2, 0
_0801C6F0: .4byte 0x08B857F8
_0801C6F4: .4byte 0x03004690
_0801C6F8:
	bl sub_0807905C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C706
	movs r4, #5
	b _0801C78E
_0801C706:
	ldr r0, [r4]
	bl GetPlayerSelectKind
	cmp r0, #2
	beq _0801C72C
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801C72C
	adds r0, r2, #0
	bl GetUnitWeaponUsabilityBits
_0801C722:
	movs r4, #2
	cmp r0, #3
	bne _0801C78E
	movs r4, #6
	b _0801C78E
_0801C72C:
	ldr r1, _0801C768 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_0801CEF4
	lsls r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	beq _0801C78E
	movs r4, #1
_0801C744:
	ldr r0, _0801C76C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C774
	ldr r0, _0801C770 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	movs r4, #2
	cmp r0, #0
	beq _0801C78E
	movs r4, #0
	b _0801C78E
	.align 2, 0
_0801C768: .4byte 0x0202BBB8
_0801C76C: .4byte 0x08B857F8
_0801C770: .4byte 0x03004690
_0801C774:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801C782
	movs r4, #3
	b _0801C78E
_0801C782:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C78E
	movs r4, #4
_0801C78E:
	cmp r4, #6
	bls _0801C794
	b _0801C974
_0801C794:
	lsls r0, r4, #2
	ldr r1, _0801C7A0 @ =_0801C7A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C7A0: .4byte _0801C7A4
_0801C7A4: @ jump table
	.4byte _0801C7C0 @ case 0
	.4byte _0801C7DC @ case 1
	.4byte _0801C7FC @ case 2
	.4byte _0801C880 @ case 3
	.4byte _0801C8FC @ case 4
	.4byte _0801C974 @ case 5
	.4byte _0801C944 @ case 6
_0801C7C0:
	ldr r0, _0801C7D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801C7CE
	b _0801C974
_0801C7CE:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0801C974
	.align 2, 0
_0801C7D8: .4byte 0x0202BBF8
_0801C7DC:
	ldr r0, _0801C7F8 @ =0x0202BD4C
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	bl HideMoveRangeGraphics
	adds r0, r5, #0
	bl Proc_Break
	b _0801C994
	.align 2, 0
_0801C7F8: .4byte 0x0202BD4C
_0801C7FC:
	ldr r4, _0801C86C @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	beq _0801C83A
	bl EndAllMus
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xc0
	ldrb r2, [r2, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0801C83A
	ldr r4, _0801C870 @ =0x0202BD4C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetMapCursorPosition
_0801C83A:
	ldr r1, _0801C874 @ =0x0202BBB8
	movs r0, #0xf7
	ldrb r3, [r1, #4]
	ands r0, r3
	strb r0, [r1, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, _0801C878 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C862
	ldr r0, _0801C87C @ =0x0000038B
	bl m4aSongNumStart
_0801C862:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0801C994
	.align 2, 0
_0801C86C: .4byte 0x03004690
_0801C870: .4byte 0x0202BD4C
_0801C874: .4byte 0x0202BBB8
_0801C878: .4byte 0x0202BBF8
_0801C87C: .4byte 0x0000038B
_0801C880:
	ldr r0, _0801C8E8 @ =0x08B90D88
	bl Proc_Find
	cmp r0, #0
	bne _0801C974
	ldr r2, _0801C8EC @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801C8F0 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _0801C8F4 @ =0x0202BD4C
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _0801C8B2
	ldr r0, _0801C8F8 @ =0x03004690
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_0801C8B2:
	cmp r4, #0
	beq _0801C974
	adds r0, r4, #0
	bl GetUnit
	bl sub_0801C218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C974
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
	b _0801C994
	.align 2, 0
_0801C8E8: .4byte 0x08B90D88
_0801C8EC: .4byte 0x0202BBB8
_0801C8F0: .4byte 0x0202E3DC
_0801C8F4: .4byte 0x0202BD4C
_0801C8F8: .4byte 0x03004690
_0801C8FC:
	ldr r0, _0801C934 @ =0x03004690
	ldr r0, [r0]
	cmp r0, #0
	beq _0801C974
	ldr r4, _0801C938 @ =0x0202BD4C
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetMapCursorPosition
	ldr r0, _0801C93C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C974
	ldr r0, _0801C940 @ =0x0000038B
	bl m4aSongNumStart
	b _0801C974
	.align 2, 0
_0801C934: .4byte 0x03004690
_0801C938: .4byte 0x0202BD4C
_0801C93C: .4byte 0x0202BBF8
_0801C940: .4byte 0x0000038B
_0801C944:
	ldr r4, _0801C968 @ =0x0202BBB8
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl HideMoveRangeGraphics
	movs r0, #8
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	beq _0801C96C
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801C974
	.align 2, 0
_0801C968: .4byte 0x0202BBB8
_0801C96C:
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_0801C974:
	ldr r0, _0801C99C @ =0x03004690
	ldr r0, [r0]
	bl GetPlayerSelectKind
	cmp r0, #2
	bne _0801C984
	bl DrawUpdatedPathArrow
_0801C984:
	ldr r1, _0801C9A0 @ =0x0202BBB8
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl PutMapCursor
_0801C994:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801C99C: .4byte 0x03004690
_0801C9A0: .4byte 0x0202BBB8
