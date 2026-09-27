	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6F34
sub_080A6F34: @ 0x080A6F34
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sb, r0
	ldr r6, _080A6FFC @ =0x0000F4C0
	movs r5, #0x1e
	movs r4, #2
_080A6F4A:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A7000 @ =0x08B90600
	bl PutSpriteExt
	adds r6, #8
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A6F4A
	ldr r1, _080A7004 @ =0x08B857F8
	ldr r2, [r1]
	ldrh r5, [r2, #8]
	movs r0, #1
	ands r0, r5
	mov r8, r1
	cmp r0, #0
	beq _080A7020
	ldr r5, _080A7008 @ =0x0202BBF8
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6F86
	ldr r0, _080A700C @ =0x0000038A
	bl m4aSongNumStart
_080A6F86:
	ldr r0, [r7, #0x2c]
	adds r5, #0x2b
	lsls r0, r0, #4
	movs r1, #0xf
	ldrb r2, [r5]
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	ldr r0, _080A7010 @ =0x02022DBC
	ldr r2, _080A7014 @ =0x081C3AC0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	ldr r4, _080A7018 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A701C @ =0x06011000
	movs r1, #8
	movs r2, #8
	bl Tact_ClearNrVrams
	ldrb r5, [r5]
	lsrs r0, r5, #4
	bl TactGetMsg_Birth
	bl DecodeMsg
	adds r5, r0, #0
	adds r4, #0x18
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x40
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A703A
	.align 2, 0
_080A6FFC: .4byte 0x0000F4C0
_080A7000: .4byte 0x08B90600
_080A7004: .4byte 0x08B857F8
_080A7008: .4byte 0x0202BBF8
_080A700C: .4byte 0x0000038A
_080A7010: .4byte 0x02022DBC
_080A7014: .4byte 0x081C3AC0
_080A7018: .4byte 0x0200006C
_080A701C: .4byte 0x06011000
_080A7020:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080A704C
	ldr r0, _080A7044 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A703A
	ldr r0, _080A7048 @ =0x0000038B
	bl m4aSongNumStart
_080A703A:
	adds r0, r7, #0
	bl Proc_Break
	b _080A7144
	.align 2, 0
_080A7044: .4byte 0x0202BBF8
_080A7048: .4byte 0x0000038B
_080A704C:
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r2, #6]
	ands r0, r2
	cmp r0, #0
	beq _080A7076
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	ble _080A706A
	subs r0, r4, #6
	b _080A7074
_080A706A:
	adds r0, r6, #0
	ands r0, r5
	cmp r0, #0
	beq _080A7076
	adds r0, r4, #6
_080A7074:
	str r0, [r7, #0x2c]
_080A7076:
	mov r0, r8
	ldr r5, [r0]
	movs r0, #0x80
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A70A4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	bgt _080A7096
	adds r0, r4, #6
	b _080A70A2
_080A7096:
	movs r0, #0x40
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A70A4
	subs r0, r4, #6
_080A70A2:
	str r0, [r7, #0x2c]
_080A70A4:
	mov r2, r8
	ldr r5, [r2]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A70D4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #0
	ble _080A70C6
	subs r0, r4, #1
	b _080A70D2
_080A70C6:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A70D4
	adds r0, r4, #5
_080A70D2:
	str r0, [r7, #0x2c]
_080A70D4:
	mov r2, r8
	ldr r5, [r2]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7104
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #4
	bgt _080A70F6
	adds r0, r4, #1
	b _080A7102
_080A70F6:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A7104
	subs r0, r4, #5
_080A7102:
	str r0, [r7, #0x2c]
_080A7104:
	ldr r5, [r7, #0x2c]
	cmp r5, sb
	beq _080A7144
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #2
	bl ShowSysHandCursor
	ldr r0, _080A7154 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7144
	ldr r0, _080A7158 @ =0x00000385
	bl m4aSongNumStart
_080A7144:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7154: .4byte 0x0202BBF8
_080A7158: .4byte 0x00000385
