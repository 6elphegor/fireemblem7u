	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095324
sub_08095324: @ 0x08095324
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809534C
	ldr r0, _08095348 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08095404
	bl CloseHelpBox
	movs r0, #0xff
	b _0809544C
	.align 2, 0
_08095348: .4byte 0x08B857F8
_0809534C:
	ldr r0, _080953B0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08095430
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080953D8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CanUnitUseItemPrepScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080953BC
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl SetUiCursorHandConfig
	str r5, [r4, #0x3c]
	ldr r0, _080953B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080953A4
	ldr r0, _080953B8 @ =0x0000038A
	bl m4aSongNumStart
_080953A4:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0809544E
	.align 2, 0
_080953B0: .4byte 0x08B857F8
_080953B4: .4byte 0x0202BBF8
_080953B8: .4byte 0x0000038A
_080953BC:
	ldr r0, _080953D4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809544E
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809544E
	.align 2, 0
_080953D4: .4byte 0x0202BBF8
_080953D8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095404
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	ldr r0, _080953FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809544E
	ldr r0, _08095400 @ =0x0000038B
	bl m4aSongNumStart
	b _0809544E
	.align 2, 0
_080953FC: .4byte 0x0202BBF8
_08095400: .4byte 0x0000038B
_08095404:
	adds r0, r4, #0
	bl PrepItemUseTryMoveHand
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809544E
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_08094EF4
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809544E
_08095430:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809544E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_0809544C:
	str r0, [r4, #0x38]
_0809544E:
	pop {r4, r5}
	pop {r0}
	bx r0
