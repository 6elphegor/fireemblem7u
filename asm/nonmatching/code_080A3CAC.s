	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A3CAC
sub_080A3CAC: @ 0x080A3CAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A3D5C
	ldr r0, _080A3CE4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3CCC
	ldr r0, _080A3CE8 @ =0x0000038A
	bl m4aSongNumStart
_080A3CCC:
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A3D32
	cmp r0, #8
	bgt _080A3CEC
	cmp r0, #2
	beq _080A3D44
	cmp r0, #4
	beq _080A3D00
	b _080A3D54
	.align 2, 0
_080A3CE4: .4byte 0x0202BBF8
_080A3CE8: .4byte 0x0000038A
_080A3CEC:
	cmp r0, #0x20
	beq _080A3D44
	cmp r0, #0x20
	bgt _080A3CFA
	cmp r0, #0x10
	beq _080A3D44
	b _080A3D54
_080A3CFA:
	cmp r0, #0x40
	beq _080A3D36
	b _080A3D54
_080A3D00:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080A3D1C
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl SaveMenuTryMoveSaveSlotCursor
	b _080A3E88
_080A3D1C:
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	bl CopyGameSave
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080A3E88
_080A3D32:
	movs r0, #2
	b _080A3D38
_080A3D36:
	movs r0, #1
_080A3D38:
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl SaveMenuDrawSubSelBox
	b _080A3D54
_080A3D44:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl SaveMenuDrawSubSelBox
_080A3D54:
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
	b _080A3E88
_080A3D5C:
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r0, [r5]
	cmp r0, #0x10
	beq _080A3DC8
	cmp r0, #0x10
	bgt _080A3D74
	cmp r0, #2
	beq _080A3D9A
	cmp r0, #8
	beq _080A3DD4
	b _080A3E7A
_080A3D74:
	cmp r0, #0x20
	beq _080A3D7E
	cmp r0, #0x40
	beq _080A3E24
	b _080A3E7A
_080A3D7E:
	cmp r1, #1
	bne _080A3E08
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl ReadGameSave
	adds r0, r4, #0
	movs r1, #0xe
	b _080A3DE6
_080A3D9A:
	cmp r1, #1
	bne _080A3E08
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _080A3DC0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3DB8
	ldr r0, _080A3DC4 @ =0x0000038A
	bl m4aSongNumStart
_080A3DB8:
	adds r0, r4, #0
	bl SaveMenu_HandleExtraMiscOption
	b _080A3E7A
	.align 2, 0
_080A3DC0: .4byte 0x0202BBF8
_080A3DC4: .4byte 0x0000038A
_080A3DC8:
	cmp r1, #1
	bne _080A3E08
	adds r0, r4, #0
	bl SaveMenuWriteNewGame
	b _080A3E32
_080A3DD4:
	cmp r1, #1
	bne _080A3E08
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl InvalidateGameSave
	adds r0, r4, #0
	movs r1, #6
_080A3DE6:
	bl Proc_Goto
	ldr r0, _080A3E00 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E04 @ =0x0000038A
	bl m4aSongNumStart
	b _080A3E7A
	.align 2, 0
_080A3E00: .4byte 0x0202BBF8
_080A3E04: .4byte 0x0000038A
_080A3E08:
	ldr r0, _080A3E1C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E20 @ =0x0000038B
	bl m4aSongNumStart
	b _080A3E7A
	.align 2, 0
_080A3E1C: .4byte 0x0202BBF8
_080A3E20: .4byte 0x0000038B
_080A3E24:
	cmp r1, #1
	bne _080A3E54
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl WriteGameSave
_080A3E32:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A3E50 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	movs r0, #0xe0
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A3E7A
	.align 2, 0
_080A3E50: .4byte 0x0202BBF8
_080A3E54:
	adds r0, r4, #0
	movs r1, #0x11
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080A3E90 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3E7A
	ldr r0, _080A3E94 @ =0x0000038B
	bl m4aSongNumStart
_080A3E7A:
	adds r0, r4, #0
	movs r1, #0
	bl SaveMenuDrawSubSelBox
	adds r0, r4, #0
	bl SaveMenu_StartHelpBox
_080A3E88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3E90: .4byte 0x0202BBF8
_080A3E94: .4byte 0x0000038B
