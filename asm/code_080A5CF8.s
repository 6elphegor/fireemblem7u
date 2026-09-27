	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveDrawCursor_Init
SaveDrawCursor_Init: @ 0x080A5CF8
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	adds r0, r2, #0
	adds r0, #0x2d
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start SaveDrawCursor_Loop
SaveDrawCursor_Loop: @ 0x080A5D2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _080A5DA4 @ =0x08418DA0
	add r0, sp, #4
	movs r2, #8
	bl memcpy
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	cmp r0, #3
	bhi _080A5D58
	adds r0, #1
	strb r0, [r2]
_080A5D58:
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0
	beq _080A5E34
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	mov sb, r1
	mov ip, r0
	adds r4, r7, #0
	adds r4, #0x30
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r2, [r2]
	cmp r2, #3
	bhi _080A5D92
	ldrb r0, [r4]
	add r0, r8
	lsrs r0, r0, #1
	mov r8, r0
	ldrb r1, [r5]
	adds r0, r1, r3
	lsrs r3, r0, #1
_080A5D92:
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A5DA8
	adds r0, r3, #0
	adds r0, #0x86
	b _080A5DAC
	.align 2, 0
_080A5DA4: .4byte 0x08418DA0
_080A5DA8:
	adds r0, r3, #0
	adds r0, #0xb0
_080A5DAC:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	strb r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	strb r0, [r5]
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A5E08
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r5, #7
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r0, _080A5E04 @ =0x08CE41AC
	mov sb, r0
	movs r4, #0x80
	lsls r4, r4, #5
	str r4, [sp]
	movs r0, #4
	adds r1, r3, #0
	mov r3, sb
	bl PutSpriteExt
	orrs r6, r4
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #3
	ands r0, r5
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r3, sb
	bl PutSpriteExt
	b _080A5E28
	.align 2, 0
_080A5E04: .4byte 0x08CE41AC
_080A5E08:
	ldrh r2, [r7, #0x2a]
	lsrs r0, r2, #3
	movs r1, #7
	ands r0, r1
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	add r2, r8
	ldr r3, _080A5E30 @ =0x08CE41AC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	bl PutSpriteExt
_080A5E28:
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	b _080A5E3E
	.align 2, 0
_080A5E30: .4byte 0x08CE41AC
_080A5E34:
	ldrb r2, [r2]
	cmp r2, #4
	bne _080A5E40
	movs r0, #0
	mov r1, sl
_080A5E3E:
	strb r0, [r1]
_080A5E40:
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A5E60
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r2, [r0]
	ldr r3, _080A5E88 @ =0x08CE41AC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	bl PutSpriteExt
_080A5E60:
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A5E6E
	movs r0, #0
	strb r0, [r4]
_080A5E6E:
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	movs r0, #1
	strb r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E88: .4byte 0x08CE41AC

	thumb_func_start sub_080A5E8C
sub_080A5E8C: @ 0x080A5E8C
	push {r4, lr}
	ldr r3, [r3, #0x34]
	movs r4, #0x2f
	strb r2, [r4, r3]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	adds r2, #4
	movs r1, #1
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A5EAC
sub_080A5EAC: @ 0x080A5EAC
	push {r4, lr}
	ldr r3, [r2, #0x34]
	movs r2, #0x32
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r4, ip
	strb r1, [r4]
	movs r1, #0x33
	adds r1, r1, r3
	mov ip, r1
	movs r1, #1
	mov r4, ip
	strb r1, [r4]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSaveDrawCursor
StartSaveDrawCursor: @ 0x080A5EDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5EEC @ =0x08CE433C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A5EEC: .4byte 0x08CE433C

	thumb_func_start sub_080A5EF0
sub_080A5EF0: @ 0x080A5EF0
	push {lr}
	ldr r0, _080A5F0C @ =0x02000044
	ldr r1, _080A5F10 @ =0x0600C020
	movs r2, #1
	movs r3, #4
	bl InitTextFont
	ldr r0, _080A5F14 @ =0x0200005C
	movs r1, #0xa
	bl InitText
	pop {r0}
	bx r0
	.align 2, 0
_080A5F0C: .4byte 0x02000044
_080A5F10: .4byte 0x0600C020
_080A5F14: .4byte 0x0200005C

	thumb_func_start SaveMenuDrawSubSelBoxExt
SaveMenuDrawSubSelBoxExt: @ 0x080A5F18
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080A5F7C
	bl DecodeMsg
	adds r5, r0, #0
	ldr r0, _080A5F6C @ =0x02000044
	bl SetTextFont
	ldr r4, _080A5F70 @ =0x0200005C
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x28
	bl Text_SetCursor
	ldr r0, _080A5F74 @ =0x00001265
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _080A5F78 @ =0x020238AE
	adds r0, r4, #0
	bl PutText
	b _080A5F88
	.align 2, 0
_080A5F6C: .4byte 0x02000044
_080A5F70: .4byte 0x0200005C
_080A5F74: .4byte 0x00001265
_080A5F78: .4byte 0x020238AE
_080A5F7C:
	ldr r0, _080A5F94 @ =0x020238AE
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
_080A5F88:
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5F94: .4byte 0x020238AE

	thumb_func_start SaveMenuDrawSubSelBox
SaveMenuDrawSubSelBox: @ 0x080A5F98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080A5FCC @ =0x08CE435C
	adds r0, #0x42
	ldrb r0, [r0]
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r4, #0
	bl SaveMenuDrawSubSelBoxExt
	cmp r4, #0
	bne _080A5FC6
	adds r0, r6, #0
	adds r0, #0x36
	strb r4, [r0]
_080A5FC6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FCC: .4byte 0x08CE435C

	thumb_func_start sub_080A5FD0
sub_080A5FD0: @ 0x080A5FD0
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r1, _080A5FF8 @ =0x06008000
	ldr r5, _080A5FFC @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080A6000 @ =0x0600C000
	adds r2, r5, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FF8: .4byte 0x06008000
_080A5FFC: .4byte 0x01000200
_080A6000: .4byte 0x0600C000

	thumb_func_start sub_080A6004
sub_080A6004: @ 0x080A6004
	adds r2, r0, #0
	adds r2, #0x30
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x31
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080A6018
sub_080A6018: @ 0x080A6018
	adds r2, r0, #0
	adds r2, #0x32
	ldrb r3, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r0, #0x33
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080A602C
sub_080A602C: @ 0x080A602C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x31
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	adds r6, r4, #0
	adds r6, #0x32
	strb r5, [r6]
	adds r0, #3
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080A605A
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A6004
_080A605A:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x37
_080A6060:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A606A
	adds r5, #1
_080A606A:
	adds r1, #1
	cmp r1, #2
	ble _080A6060
	cmp r5, #0
	ble _080A6090
	adds r0, r4, #0
	movs r1, #2
	bl sub_080A6004
	cmp r5, #2
	bgt _080A6088
	adds r0, r4, #0
	movs r1, #4
	bl sub_080A6004
_080A6088:
	adds r0, r4, #0
	movs r1, #8
	bl sub_080A6004
_080A6090:
	cmp r5, #2
	bgt _080A609C
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_080A6004
_080A609C:
	bl IsExtraLinkArenaEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60AE
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A6018
_080A60AE:
	bl sub_0809EAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60C0
	adds r0, r4, #0
	movs r1, #2
	bl sub_080A6018
_080A60C0:
	bl IsExtraSupportViewerEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60D2
	adds r0, r4, #0
	movs r1, #4
	bl sub_080A6018
_080A60D2:
	bl GetRankDataValidBitMap
	cmp r0, #0
	beq _080A60E2
	adds r0, r4, #0
	movs r1, #8
	bl sub_080A6018
_080A60E2:
	bl sub_0809EB78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60F4
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_080A6018
_080A60F4:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080A610E
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A610E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SaveMenuModifySaveSlot
SaveMenuModifySaveSlot: @ 0x080A6114
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	cmp r2, #0
	ble _080A6152
	movs r5, #0
	lsls r6, r1, #0x18
_080A6128:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A614E
	cmp r4, #2
	bne _080A613C
	movs r4, #0
	b _080A6142
_080A613C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6142:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6128
	b _080A617A
_080A614E:
	adds r0, r4, #0
	b _080A617C
_080A6152:
	movs r5, #0
	lsls r6, r1, #0x18
_080A6156:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A614E
	cmp r4, #0
	bne _080A616A
	movs r4, #2
	b _080A6170
_080A616A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6170:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6156
_080A617A:
	movs r0, #0xff
_080A617C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaveMenuTryMoveSaveSlotCursor
SaveMenuTryMoveSaveSlotCursor: @ 0x080A6184
	push {r4, r5, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	adds r0, #0x16
	ldrh r0, [r0]
	cmp r0, #4
	beq _080A61BC
	cmp r0, #4
	bgt _080A61A8
	cmp r0, #1
	beq _080A6218
	cmp r0, #2
	beq _080A61C6
	b _080A61C8
_080A61A8:
	cmp r0, #0x10
	beq _080A61C8
	cmp r0, #0x10
	bgt _080A61B6
	cmp r0, #8
	beq _080A61C6
	b _080A61C8
_080A61B6:
	cmp r0, #0x80
	bne _080A61C8
	b _080A61C6
_080A61BC:
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A61C8
_080A61C6:
	movs r1, #1
_080A61C8:
	lsls r0, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	ble _080A61E4
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #2
	bne _080A61E0
	movs r0, #0
	b _080A61F6
_080A61E0:
	adds r0, r3, #1
	b _080A61F6
_080A61E4:
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #0
	bne _080A61F4
	movs r0, #2
	b _080A61F6
_080A61F4:
	subs r0, r3, #1
_080A61F6:
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A6214
	ldrb r0, [r4]
	asrs r2, r2, #0x18
	bl SaveMenuModifySaveSlot
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080A6218
_080A6214:
	movs r0, #1
	b _080A621A
_080A6218:
	movs r0, #0
_080A621A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080A6220
sub_080A6220: @ 0x080A6220
	adds r1, r0, #0
	adds r1, #0x42
	adds r0, #0x30
	ldrb r0, [r0]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A6234
	movs r0, #0
	b _080A6236
_080A6234:
	movs r0, #1
_080A6236:
	bx lr

	thumb_func_start sub_080A6238
sub_080A6238: @ 0x080A6238
	push {r4, lr}
	mov ip, r0
	mov r2, ip
	adds r2, #0x29
	adds r0, #0x2b
	ldrb r1, [r2]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r2]
	ldr r3, _080A62A8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080A62AC
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r1, #4
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r1, r4, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldrb r2, [r2]
	lsls r1, r2, #1
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x32
	b _080A62E0
	.align 2, 0
_080A62A8: .4byte 0x03002870
_080A62AC:
	ldrb r4, [r2]
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r1, #0x78
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r1, r0, #1
	movs r0, #0x50
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x33
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x78
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, #0x50
	adds r1, #4
_080A62E0:
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r4, [r2]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _080A632C
	mov r0, ip
	bl Proc_Break
_080A632C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSqMask
StartSqMask: @ 0x080A6334
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080A6364 @ =0x08CE4378
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x2a
	movs r1, #0
	strb r4, [r2]
	adds r2, #1
	strb r5, [r2]
	adds r0, #0x29
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6364: .4byte 0x08CE4378

	thumb_func_start SaveBgUp_Loop
SaveBgUp_Loop: @ 0x080A6368
	push {lr}
	ldr r0, _080A637C @ =0x02023C60
	ldr r1, _080A6380 @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	pop {r0}
	bx r0
	.align 2, 0
_080A637C: .4byte 0x02023C60
_080A6380: .4byte 0x06007000

	thumb_func_start sub_080A6384
sub_080A6384: @ 0x080A6384
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6394 @ =0x08CE4398
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A6394: .4byte 0x08CE4398

	thumb_func_start sub_080A6398
sub_080A6398: @ 0x080A6398
	push {r4, r5, r6, lr}
	sub sp, #0x48
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #2
	bhi _080A645C
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080A6428
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl GetChapterTitle
	adds r1, r5, #0
	adds r1, #0x37
	adds r1, r1, r4
	movs r2, #0
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r1, [sp]
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r5, r0, r4
	strb r2, [r5]
	adds r0, r4, #0
	bl sub_080A0A10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A63F6
	movs r0, #1
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A63F6:
	mov r0, sp
	bl sub_080A09FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A640A
	movs r0, #2
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A640A:
	ldr r0, _080A6420 @ =0x02000064
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x14]
	strb r1, [r0]
	ldr r0, _080A6424 @ =0x02000068
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x1b]
	strb r1, [r0]
	b _080A6492
	.align 2, 0
_080A6420: .4byte 0x02000064
_080A6424: .4byte 0x02000068
_080A6428:
	adds r0, r5, #0
	adds r0, #0x37
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r0, r0, r6
	strb r2, [r0]
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	str r2, [r0]
	ldr r0, _080A6454 @ =0x02000064
	adds r0, r6, r0
	strb r2, [r0]
	ldr r0, _080A6458 @ =0x02000068
	adds r0, r6, r0
	strb r2, [r0]
	b _080A6492
	.align 2, 0
_080A6454: .4byte 0x02000064
_080A6458: .4byte 0x02000068
_080A645C:
	adds r4, r5, #0
	adds r4, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r4]
	cmp r1, r0
	bne _080A6492
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A648E
	movs r0, #3
	mov r1, sp
	bl ReadSuspendSavePlaySt
	mov r0, sp
	ldrb r0, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r0, [sp]
	str r0, [r5, #0x54]
	b _080A6492
_080A648E:
	movs r0, #0xf0
	strh r0, [r4]
_080A6492:
	add sp, #0x48
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A649C
sub_080A649C: @ 0x080A649C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	movs r7, #0x1b
	movs r6, #0x1a
_080A64AE:
	ldr r1, _080A6524 @ =0x02000064
	adds r1, r5, r1
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldr r0, _080A6528 @ =0x02000068
	adds r0, r5, r0
	ldrb r1, [r0]
	cmp r1, #1
	bne _080A64D2
	movs r0, #0x10
	orrs r4, r0
_080A64D2:
	cmp r1, #2
	bne _080A64DE
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64DE:
	cmp r1, #3
	bne _080A64EA
	movs r0, #0x40
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64EA:
	cmp r5, r8
	beq _080A64F6
	movs r0, #2
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64F6:
	movs r1, #1
	adds r0, r4, #0
	orrs r0, r1
	adds r1, r6, #0
	bl PutChapterTitlePalette
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutChapterTitlePalette
	adds r7, #2
	adds r6, #2
	adds r5, #1
	cmp r5, #2
	ble _080A64AE
	bl EnablePalSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6524: .4byte 0x02000064
_080A6528: .4byte 0x02000068

	thumb_func_start sub_080A652C
sub_080A652C: @ 0x080A652C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0x10
	ble _080A654E
	movs r0, #0xf
	ands r0, r5
	movs r1, #0x10
	subs r5, r1, r0
_080A654E:
	movs r2, #0
_080A6550:
	ldr r0, _080A6580 @ =0x02000064
	adds r1, r2, r0
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	adds r1, r2, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _080A6612
	lsls r0, r2, #6
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080A6584 @ =0x02022A72
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [sp]
	cmp r2, r0
	bne _080A6590
	ldr r1, _080A6588 @ =0x083FE30A
	mov ip, r1
	ldr r6, _080A658C @ =0x083FE40A
	b _080A6596
	.align 2, 0
_080A6580: .4byte 0x02000064
_080A6584: .4byte 0x02022A72
_080A6588: .4byte 0x083FE30A
_080A658C: .4byte 0x083FE40A
_080A6590:
	ldr r0, _080A662C @ =0x083FE32A
	mov ip, r0
	ldr r6, _080A6630 @ =0x083FE42A
_080A6596:
	adds r2, #1
	str r2, [sp, #4]
	movs r0, #0x10
	subs r7, r0, r5
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	movs r0, #6
	mov sb, r0
_080A65A8:
	mov r1, ip
	ldrh r4, [r1]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r6]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r6, #2
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r0, sb
	cmp r0, #0
	bge _080A65A8
_080A6612:
	ldr r2, [sp, #4]
	cmp r2, #2
	ble _080A6550
	bl EnablePalSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A662C: .4byte 0x083FE32A
_080A6630: .4byte 0x083FE42A

	thumb_func_start SaveMenuGetValidMenuAmt
SaveMenuGetValidMenuAmt: @ 0x080A6634
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	movs r2, #1
	cmp r2, r3
	bge _080A665A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
_080A664A:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A6654
	adds r1, #1
_080A6654:
	lsls r2, r2, #1
	cmp r2, r3
	blt _080A664A
_080A665A:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080A6664
sub_080A6664: @ 0x080A6664
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A6680
	ldr r0, _080A66A4 @ =0x06016000
	movs r1, #0xd
	bl LoadHelpBoxGfx
	movs r0, #1
	strb r0, [r4]
_080A6680:
	ldr r0, _080A66A8 @ =0x08CE45C0
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #3
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	movs r3, #2
	ldrsh r1, [r1, r3]
	ldr r3, _080A66AC @ =0x08CE45D8
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A66A4: .4byte 0x06016000
_080A66A8: .4byte 0x08CE45C0
_080A66AC: .4byte 0x08CE45D8

	thumb_func_start TactInfo_CloseHelpbox
TactInfo_CloseHelpbox: @ 0x080A66B0
	push {r4, lr}
	adds r4, r0, #0
	bl CloseHelpBox
	adds r4, #0x30
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A66C4
sub_080A66C4: @ 0x080A66C4
	push {lr}
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A66D4
	bl EndSubtitleHelp
_080A66D4:
	pop {r0}
	bx r0

	thumb_func_start sub_080A66D8
sub_080A66D8: @ 0x080A66D8
	push {r4, lr}
	adds r4, r0, #0
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A66F4
	ldr r0, _080A66FC @ =0x0000078F
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080327C4
_080A66F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A66FC: .4byte 0x0000078F

	thumb_func_start UpdateTactMainHandShadow
UpdateTactMainHandShadow: @ 0x080A6700
	push {r4, lr}
	ldr r1, _080A6724 @ =0x08CE45C0
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0
	ldrsh r4, [r0, r1]
	movs r2, #2
	ldrsh r1, [r0, r2]
	ldrb r2, [r0, #4]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r0, r4, #0
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6724: .4byte 0x08CE45C0

	thumb_func_start sub_080A6728
sub_080A6728: @ 0x080A6728
	push {lr}
	ldr r1, _080A6744 @ =0x08CE45C0
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0
	movs r3, #0
	bl SetUiCursorHandConfig
	pop {r0}
	bx r0
	.align 2, 0
_080A6744: .4byte 0x08CE45C0

	thumb_func_start sub_080A6748
sub_080A6748: @ 0x080A6748
	push {r4, r5, r6, r7, lr}
	ldr r4, _080A6810 @ =0x0200006C
	ldr r1, _080A6814 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xf
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	movs r5, #2
_080A6766:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A6766
	ldr r0, _080A6818 @ =0x08194714
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _080A681C @ =0x02000084
	bl GetTacticianName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl Text_InsertDrawString
	ldr r4, _080A6820 @ =0x0202BBF8
	adds r7, r4, #0
	adds r7, #0x2b
	ldrb r1, [r7]
	lsrs r0, r1, #4
	bl sub_080A6DB0
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x40
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x40
	adds r0, r5, #0
	movs r2, #4
	adds r3, r6, #0
	bl Text_InsertDrawString
	adds r4, #0x2c
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x40
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x80
	adds r0, r5, #0
	movs r2, #4
	adds r3, r6, #0
	bl Text_InsertDrawString
	ldr r0, _080A6824 @ =0x02022DBC
	ldr r2, _080A6828 @ =0x081C3AC0
	ldrb r7, [r7]
	lsrs r1, r7, #4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6810: .4byte 0x0200006C
_080A6814: .4byte 0x06011000
_080A6818: .4byte 0x08194714
_080A681C: .4byte 0x02000084
_080A6820: .4byte 0x0202BBF8
_080A6824: .4byte 0x02022DBC
_080A6828: .4byte 0x081C3AC0

	thumb_func_start TactInfoFx_Thread
TactInfoFx_Thread: @ 0x080A682C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080A6894 @ =0x0000F880
	movs r5, #0x80
	movs r4, #1
_080A6836:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x28
	ldr r3, _080A6898 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6836
	ldr r6, _080A689C @ =0x0000F888
	movs r5, #0x38
	movs r4, #1
_080A6854:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x48
	ldr r3, _080A6898 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6854
	ldr r6, _080A68A0 @ =0x0000F890
	movs r5, #0x90
	movs r4, #1
_080A6872:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x48
	ldr r3, _080A6898 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A6872
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6894: .4byte 0x0000F880
_080A6898: .4byte 0x08B905F8
_080A689C: .4byte 0x0000F888
_080A68A0: .4byte 0x0000F890

	thumb_func_start sub_080A68A4
sub_080A68A4: @ 0x080A68A4
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0xf2
	lsls r0, r0, #3
	bl DecodeMsg
	bl SetTacticianName
	ldr r1, _080A68D8 @ =0x0202BBF8
	adds r2, r1, #0
	adds r2, #0x2b
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r1, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A68D8: .4byte 0x0202BBF8

	thumb_func_start TactInfo_SetupGfx
TactInfo_SetupGfx: @ 0x080A68DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r7, _080A69B8 @ =0x03002870
	adds r6, r7, #0
	adds r6, #0x3c
	movs r4, #0x3f
	adds r0, r4, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	movs r5, #0
	movs r0, #0x10
	ldr r2, _080A69BC @ =0x030028B4
	strb r0, [r2]
	movs r1, #0x45
	adds r1, r1, r7
	mov r8, r1
	strb r5, [r1]
	movs r2, #0x46
	adds r2, r2, r7
	mov sl, r2
	strb r5, [r2]
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldrb r2, [r6]
	ands r4, r2
	strb r4, [r6]
	movs r1, #0x10
	ldr r0, _080A69BC @ =0x030028B4
	strb r1, [r0]
	mov r2, r8
	strb r5, [r2]
	mov r0, sl
	strb r5, [r0]
	ldr r0, _080A69C0 @ =0x0841629C
	ldr r1, _080A69C4 @ =0x06001000
	bl Decompress
	ldr r0, _080A69C8 @ =0x0841627C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A69CC @ =0x02023C60
	ldr r1, _080A69D0 @ =0x08418818
	ldr r2, _080A69D4 @ =0x0000F080
	bl TmApplyTsa_thm
	mov r0, sb
	bl StartUiCursorHand
	ldr r1, _080A69D8 @ =0x06008000
	movs r0, #0
	movs r2, #0xa
	movs r3, #1
	bl StartMuralBackgroundExt
	bl sub_080A6748
	ldr r0, _080A69DC @ =TactInfoFx_Thread
	mov r1, sb
	bl StartParallelWorker
	movs r0, #0xb4
	movs r1, #0x10
	mov r2, sb
	bl StartHelpPromptSprite
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A69B8: .4byte 0x03002870
_080A69BC: .4byte 0x030028B4
_080A69C0: .4byte 0x0841629C
_080A69C4: .4byte 0x06001000
_080A69C8: .4byte 0x0841627C
_080A69CC: .4byte 0x02023C60
_080A69D0: .4byte 0x08418818
_080A69D4: .4byte 0x0000F080
_080A69D8: .4byte 0x06008000
_080A69DC: .4byte TactInfoFx_Thread

	thumb_func_start sub_080A69E0
sub_080A69E0: @ 0x080A69E0
	push {r4, lr}
	adds r4, r0, #0
	bl EndSysHandCursor
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r4, #0
	bl sub_080A66D8
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl UpdateTactMainHandShadow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TactInfo_IntroDialogue1
TactInfo_IntroDialogue1: @ 0x080A6A14
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6A44
	bl EndSysHandCursor
	bl sub_080A66C4
	ldr r2, _080A6A4C @ =0x00000791
	ldr r3, _080A6A50 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x30
	movs r1, #0x5a
	bl StartBoxDialogueExt
	movs r0, #0x70
	bl SetDialogueBoxConfig
_080A6A44:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A4C: .4byte 0x00000791
_080A6A50: .4byte 0x06016000

	thumb_func_start TactInfo_IntroDialogue2
TactInfo_IntroDialogue2: @ 0x080A6A54
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl EndSysHandCursor
	bl sub_080A66C4
	ldr r2, _080A6A88 @ =0x00000792
	ldr r3, _080A6A8C @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x70
	movs r1, #0x5a
	bl StartBoxDialogueExt
	movs r0, #0x70
	bl SetDialogueBoxConfig
	movs r0, #1
	bl SetTalkChoiceResult
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A88: .4byte 0x00000792
_080A6A8C: .4byte 0x06016000

	thumb_func_start TactInfo_HandleIntroDialoguePrompt
TactInfo_HandleIntroDialoguePrompt: @ 0x080A6A90
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _080A6AA4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A6AA4:
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A6AB4
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A6ABC
_080A6AB4:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A6ABC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A6AC4
sub_080A6AC4: @ 0x080A6AC4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl EndSysHandCursor
	bl sub_080A66C4
	ldr r2, _080A6AF8 @ =0x00000793
	ldr r3, _080A6AFC @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x60
	movs r1, #0x5a
	bl StartBoxDialogueExt
	movs r0, #0xf0
	bl SetDialogueBoxConfig
	movs r0, #1
	bl SetTalkChoiceResult
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AF8: .4byte 0x00000793
_080A6AFC: .4byte 0x06016000

	thumb_func_start sub_080A6B00
sub_080A6B00: @ 0x080A6B00
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A6B14
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A6B1C
_080A6B14:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A6B1C:
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _080A6B2C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A6B2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A6B34
sub_080A6B34: @ 0x080A6B34
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	bl EndMuralBackground_
	adds r0, r4, #0
	bl EndAllProcChildren
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080A6B4C
sub_080A6B4C: @ 0x080A6B4C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A6C0A
	ldr r0, _080A6B90 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6BCA
	ldr r0, _080A6B94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6B7E
	ldr r0, _080A6B98 @ =0x0000038A
	bl m4aSongNumStart
_080A6B7E:
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	beq _080A6BAC
	cmp r0, #1
	bgt _080A6B9C
	cmp r0, #0
	beq _080A6BA2
	b _080A6CAE
	.align 2, 0
_080A6B90: .4byte 0x08B857F8
_080A6B94: .4byte 0x0202BBF8
_080A6B98: .4byte 0x0000038A
_080A6B9C:
	cmp r0, #2
	beq _080A6BB4
	b _080A6CAE
_080A6BA2:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080A6CAE
_080A6BAC:
	adds r0, r4, #0
	bl sub_080A7194
	b _080A6BBA
_080A6BB4:
	adds r0, r4, #0
	bl sub_080A73E4
_080A6BBA:
	ldr r0, [r4, #0x2c]
	bl sub_080A6728
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080A6CAE
_080A6BCA:
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080A6BF8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A6BF0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6CAE
	ldr r0, _080A6BF4 @ =0x0000038A
	bl m4aSongNumStart
	b _080A6CAE
	.align 2, 0
_080A6BF0: .4byte 0x0202BBF8
_080A6BF4: .4byte 0x0000038A
_080A6BF8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6C20
	adds r0, r4, #0
	bl sub_080A6664
	b _080A6CAE
_080A6C0A:
	ldr r0, _080A6CB4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A6C20
	adds r0, r4, #0
	bl TactInfo_CloseHelpbox
_080A6C20:
	ldr r2, _080A6CB4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C38
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080A6C38
	movs r0, #1
	str r0, [r4, #0x2c]
_080A6C38:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C4E
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080A6C4E
	movs r0, #0
	str r0, [r4, #0x2c]
_080A6C4E:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C64
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	ble _080A6C64
	subs r0, #1
	str r0, [r4, #0x2c]
_080A6C64:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C7A
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	bne _080A6C7A
	movs r0, #2
	str r0, [r4, #0x2c]
_080A6C7A:
	ldr r0, [r4, #0x2c]
	cmp r5, r0
	beq _080A6CAE
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A6C94
	adds r0, r4, #0
	bl sub_080A6664
_080A6C94:
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl UpdateTactMainHandShadow
	ldr r0, _080A6CB8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6CAE
	ldr r0, _080A6CBC @ =0x00000385
	bl m4aSongNumStart
_080A6CAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6CB4: .4byte 0x08B857F8
_080A6CB8: .4byte 0x0202BBF8
_080A6CBC: .4byte 0x00000385

	thumb_func_start sub_080A6CC0
sub_080A6CC0: @ 0x080A6CC0
	push {lr}
	bl ReadLastGameSaveId
	bl WriteGameSave
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TactInfo_CheckParticipantDialogue
TactInfo_CheckParticipantDialogue: @ 0x080A6CD0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _080A6CE8 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080A6CEC
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080A6D52
	.align 2, 0
_080A6CE8: .4byte 0x0202BBF8
_080A6CEC:
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r0, _080A6D5C @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r3, #0x10
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #1
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r3
	mov r2, ip
	strb r0, [r2, #1]
	ldr r2, _080A6D60 @ =0x00000794
	ldr r3, _080A6D64 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x38
	movs r1, #0x20
	bl StartBoxDialogueExt
	movs r0, #0xf0
	bl SetDialogueBoxConfig
	movs r0, #2
	bl SetTalkChoiceResult
_080A6D52:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D5C: .4byte 0x03002870
_080A6D60: .4byte 0x00000794
_080A6D64: .4byte 0x06016000

	thumb_func_start TactInfo_HandleCheckParticipantPrompt
TactInfo_HandleCheckParticipantPrompt: @ 0x080A6D68
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A6D7C
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A6D92
_080A6D7C:
	ldr r1, _080A6D98 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080A6D92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D98: .4byte 0x0202BBF8

	thumb_func_start sub_080A6D9C
sub_080A6D9C: @ 0x080A6D9C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6DAC @ =0x08CE45E4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A6DAC: .4byte 0x08CE45E4

	thumb_func_start sub_080A6DB0
sub_080A6DB0: @ 0x080A6DB0
	ldr r1, _080A6DBC @ =0x08CE4724
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A6DBC: .4byte 0x08CE4724

	thumb_func_start sub_080A6DC0
sub_080A6DC0: @ 0x080A6DC0
	ldr r1, _080A6DCC @ =0x08CE4754
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A6DCC: .4byte 0x08CE4754

	thumb_func_start sub_080A6DD0
sub_080A6DD0: @ 0x080A6DD0
	ldr r1, _080A6DDC @ =0x08CE475C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A6DDC: .4byte 0x08CE475C

	thumb_func_start Tact_ClearNrVrams
Tact_ClearNrVrams: @ 0x080A6DE0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	movs r6, #0
	str r6, [sp]
	lsls r1, r1, #5
	adds r5, r5, r1
	lsls r4, r4, #3
	ldr r0, _080A6E20 @ =0x001FFFFF
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r4, r0
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	str r6, [sp, #4]
	add r0, sp, #4
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r5, r1
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E20: .4byte 0x001FFFFF

	thumb_func_start sub_080A6E24
sub_080A6E24: @ 0x080A6E24
	bx lr
	.align 2, 0

	thumb_func_start sub_080A6E28
sub_080A6E28: @ 0x080A6E28
	bx lr
	.align 2, 0

	thumb_func_start sub_080A6E2C
sub_080A6E2C: @ 0x080A6E2C
	push {r4, lr}
	ldr r0, _080A6E5C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r4, _080A6E60 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6E5C: .4byte 0x02023460
_080A6E60: .4byte 0x0200006C

	thumb_func_start sub_080A6E64
sub_080A6E64: @ 0x080A6E64
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6E74 @ =0x08CE477C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A6E74: .4byte 0x08CE477C

	thumb_func_start sub_080A6E78
sub_080A6E78: @ 0x080A6E78
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A6F2C @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	lsrs r0, r0, #4
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #0x1a
	movs r3, #6
	bl DrawUiFrame2
	movs r0, #2
	bl EnableBgSync
	ldr r5, [r4, #0x2c]
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
	ldr r4, _080A6F30 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r5, #0
	movs r7, #0
	adds r6, r4, #0
	adds r6, #0x20
_080A6EDE:
	adds r0, r5, #0
	bl sub_080A6DB0
	bl DecodeMsg
	adds r3, r0, #0
	strb r7, [r3, #3]
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #6
	bl sub_080A6DB0
	bl DecodeMsg
	adds r3, r0, #0
	strb r7, [r3, #3]
	adds r0, r6, #0
	adds r0, #8
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #1
	cmp r5, #5
	ble _080A6EDE
	movs r0, #0
	bl DecodeMsg
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6F2C: .4byte 0x0202BBF8
_080A6F30: .4byte 0x0200006C

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
	bl sub_080A6DB0
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

	thumb_func_start sub_080A715C
sub_080A715C: @ 0x080A715C
	push {r4, lr}
	ldr r0, _080A718C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r4, _080A7190 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A718C: .4byte 0x02023460
_080A7190: .4byte 0x0200006C

	thumb_func_start sub_080A7194
sub_080A7194: @ 0x080A7194
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A71A4 @ =0x08CE47AC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A71A4: .4byte 0x08CE47AC

	thumb_func_start sub_080A71A8
sub_080A71A8: @ 0x080A71A8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A7220 @ =0x0202BBF8
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #4
	bl DrawUiFrame2
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #5
	adds r0, #0x88
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #3
	bl ShowSysHandCursor
	ldr r0, _080A7224 @ =0x0200006C
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A71F2:
	adds r0, r4, #0
	bl sub_080A6DC0
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080A7228 @ =0x0200008C
	adds r1, r5, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #0x1f
	adds r4, #1
	cmp r4, #1
	ble _080A71F2
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7220: .4byte 0x0202BBF8
_080A7224: .4byte 0x0200006C
_080A7228: .4byte 0x0200008C

	thumb_func_start sub_080A722C
sub_080A722C: @ 0x080A722C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r6, _080A72E0 @ =0x0000F4C0
	movs r5, #0x8c
	movs r4, #2
_080A7240:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A72E4 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A7240
	ldr r1, _080A72E8 @ =0x08B857F8
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _080A72FC
	ldr r4, _080A72EC @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A727C
	ldr r0, _080A72F0 @ =0x0000038A
	bl m4aSongNumStart
_080A727C:
	ldr r1, [r7, #0x2c]
	adds r4, #0x2c
	movs r0, #1
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldr r5, _080A72F4 @ =0x0200006C
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A72F8 @ =0x06011000
	movs r1, #0x10
	movs r2, #8
	bl Tact_ClearNrVrams
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl DecodeMsg
	adds r4, r0, #0
	adds r5, #0x18
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x80
	adds r0, r5, #0
	movs r2, #4
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A7316
	.align 2, 0
_080A72E0: .4byte 0x0000F4C0
_080A72E4: .4byte 0x08B905F8
_080A72E8: .4byte 0x08B857F8
_080A72EC: .4byte 0x0202BBF8
_080A72F0: .4byte 0x0000038A
_080A72F4: .4byte 0x0200006C
_080A72F8: .4byte 0x06011000
_080A72FC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A7328
	ldr r0, _080A7320 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7316
	ldr r0, _080A7324 @ =0x0000038B
	bl m4aSongNumStart
_080A7316:
	adds r0, r7, #0
	bl Proc_Break
	b _080A7398
	.align 2, 0
_080A7320: .4byte 0x0202BBF8
_080A7324: .4byte 0x0000038B
_080A7328:
	movs r4, #0x20
	adds r0, r4, #0
	ldrh r3, [r3, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A734A
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	ble _080A7340
	subs r0, #1
	str r0, [r7, #0x2c]
	b _080A734A
_080A7340:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A734A
	str r5, [r7, #0x2c]
_080A734A:
	ldr r1, [r1]
	movs r2, #0x10
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A7370
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	bgt _080A7362
	adds r0, #1
	b _080A736E
_080A7362:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A7370
	movs r0, #0
_080A736E:
	str r0, [r7, #0x2c]
_080A7370:
	ldr r0, [r7, #0x2c]
	cmp r0, r8
	beq _080A7398
	lsls r0, r0, #5
	adds r0, #0x88
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #3
	bl ShowSysHandCursor
	ldr r0, _080A73A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7398
	ldr r0, _080A73A8 @ =0x00000385
	bl m4aSongNumStart
_080A7398:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A73A4: .4byte 0x0202BBF8
_080A73A8: .4byte 0x00000385

	thumb_func_start sub_080A73AC
sub_080A73AC: @ 0x080A73AC
	push {r4, lr}
	ldr r0, _080A73DC @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r4, _080A73E0 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A73DC: .4byte 0x02023460
_080A73E0: .4byte 0x0200006C

	thumb_func_start sub_080A73E4
sub_080A73E4: @ 0x080A73E4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A73F4 @ =0x08CE47DC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A73F4: .4byte 0x08CE47DC

	thumb_func_start sub_080A73F8
sub_080A73F8: @ 0x080A73F8
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _080A7418 @ =0x02022BDA
	mov ip, r0
	ldr r0, _080A741C @ =0x084150D8
	ldrh r4, [r0]
	ldrh r7, [r0, #2]
	movs r0, #0x3f
	ands r2, r0
	cmp r2, #0x1f
	bgt _080A7420
	movs r0, #0x20
	subs r5, r0, r2
	adds r6, r2, #0
	b _080A7428
	.align 2, 0
_080A7418: .4byte 0x02022BDA
_080A741C: .4byte 0x084150D8
_080A7420:
	adds r5, r2, #0
	subs r5, #0x20
	movs r0, #0x40
	subs r6, r0, r2
_080A7428:
	movs r3, #0x1f
	movs r1, #0x1f
	adds r0, r4, #0
	ands r0, r1
	adds r2, r0, #0
	muls r2, r5, r2
	adds r0, r7, #0
	ands r0, r1
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r4, #0
	ands r0, r3
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r7, #0
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	ands r1, r3
	adds r2, r2, r1
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r4, r3
	adds r0, r4, #0
	muls r0, r5, r0
	ands r7, r3
	adds r1, r7, #0
	muls r1, r6, r1
	adds r0, r0, r1
	asrs r0, r0, #5
	ands r0, r3
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0]
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start InitModeSelectAnims
InitModeSelectAnims: @ 0x080A7480
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, sp
	ldr r0, _080A75AC @ =0x08418DA8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #0
	mov sb, r0
	ldr r1, [sp, #0xc]
	cmp sb, r1
	bge _080A759C
	ldr r2, _080A75B0 @ =0x0201E8D4
	mov r8, r2
	movs r5, #0
	mov sl, r5
	mov r6, r8
	adds r6, #4
	mov r3, r8
	movs r4, #0
	str r4, [sp, #0x14]
	ldr r7, _080A75B4 @ =0x0201E97C
	adds r4, r7, #0
_080A74B8:
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r3, #2]
	movs r0, #0x58
	strh r0, [r6]
	ldr r0, [sp, #0x10]
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r6, #2]
	movs r0, #6
	strh r0, [r6, #6]
	movs r0, #0
	strb r0, [r3, #1]
	movs r0, #1
	strh r0, [r6, #8]
	mov r1, sb
	lsls r0, r1, #0xd
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r0, r2
	asrs r0, r0, #5
	strh r0, [r6, #0xa]
	mov r0, sb
	adds r0, #0xd
	strh r0, [r6, #0xc]
	mov r1, r8
	adds r1, #0x1c
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, _080A75B8 @ =0x08CE480C
	mov r1, sb
	lsls r2, r1, #2
	adds r0, r2, r0
	ldr r0, [r0]
	mov r1, ip
	str r0, [r1]
	mov r1, r8
	adds r1, #0x24
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A75BC @ =0x08CE4818
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r8
	adds r1, #0x20
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A75C0 @ =0x08CE4824
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r1]
	mov r1, r8
	adds r1, #0x28
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _080A75C4 @ =0x08CE4830
	adds r2, r2, r0
	ldr r0, [r2]
	str r0, [r1]
	ldr r0, _080A75C8 @ =0x0000FFFF
	strh r0, [r6, #4]
	mov r1, sl
	adds r0, r1, r7
	str r0, [r6, #0x2c]
	strh r5, [r4]
	strh r5, [r4, #2]
	strh r5, [r4, #4]
	strh r5, [r4, #6]
	strh r5, [r4, #8]
	strh r5, [r4, #0xe]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0xa]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0x12]
	adds r0, r7, #0
	adds r0, #0x14
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x18
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x1c
	add r0, sl
	str r5, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	add r0, sl
	str r5, [r0]
	str r5, [r4, #0x24]
	adds r0, r3, #0
	str r3, [sp, #0x18]
	bl NewEkrUnitMainMini
	adds r4, #0x28
	movs r2, #0x28
	add sl, r2
	adds r6, #0x38
	ldr r3, [sp, #0x18]
	adds r3, #0x38
	ldr r0, [sp, #0x14]
	adds r0, #0x38
	str r0, [sp, #0x14]
	movs r1, #1
	add sb, r1
	ldr r2, [sp, #0xc]
	cmp sb, r2
	blt _080A74B8
_080A759C:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A75AC: .4byte 0x08418DA8
_080A75B0: .4byte 0x0201E8D4
_080A75B4: .4byte 0x0201E97C
_080A75B8: .4byte 0x08CE480C
_080A75BC: .4byte 0x08CE4818
_080A75C0: .4byte 0x08CE4824
_080A75C4: .4byte 0x08CE4830
_080A75C8: .4byte 0x0000FFFF

	thumb_func_start EndModeSelectAnims
EndModeSelectAnims: @ 0x080A75CC
	push {r4, r5, lr}
	cmp r0, #0
	ble _080A75E4
	ldr r5, _080A75EC @ =0x0201E8D4
	adds r4, r0, #0
_080A75D6:
	adds r0, r5, #0
	bl sub_08054EF0
	adds r5, #0x38
	subs r4, #1
	cmp r4, #0
	bne _080A75D6
_080A75E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A75EC: .4byte 0x0201E8D4

	thumb_func_start sub_080A75F0
sub_080A75F0: @ 0x080A75F0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	ldr r5, _080A765C @ =0x020000E4
	adds r0, r5, #0
	bl ClearText
	movs r0, #8
	adds r0, r0, r5
	mov sb, r0
	bl ClearText
	ldr r1, _080A7660 @ =0x08CE48C0
	mov r8, r1
	ldr r0, [r1, #0x24]
	bl DecodeMsg
	ldr r4, _080A7664 @ =0x020235FC
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl DecodeMsg
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A765C: .4byte 0x020000E4
_080A7660: .4byte 0x08CE48C0
_080A7664: .4byte 0x020235FC

	thumb_func_start PutModeSelectCharacterText
PutModeSelectCharacterText: @ 0x080A7668
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _080A76EC @ =0x020000CC
	mov r8, r0
	bl ClearText
	mov r0, r8
	adds r0, #8
	bl ClearText
	movs r1, #0x10
	add r1, r8
	mov sl, r1
	mov r0, sl
	bl ClearText
	ldr r5, _080A76F0 @ =0x08CE48C0
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r0, [r0]
	bl DecodeMsg
	ldr r6, _080A76F4 @ =0x0202367C
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	bl DecodeMsg
	adds r6, #0x8a
	mov r1, sb
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, sl
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A76EC: .4byte 0x020000CC
_080A76F0: .4byte 0x08CE48C0
_080A76F4: .4byte 0x0202367C

	thumb_func_start PutModeSelectDifficultyText
PutModeSelectDifficultyText: @ 0x080A76F8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x41
	adds r0, #0x43
	ldrb r1, [r6]
	adds r0, r1, r0
	ldrb r7, [r0]
	ldr r5, _080A7758 @ =0x020000BC
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #8
	bl ClearText
	ldr r0, _080A775C @ =0x000012BA
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, _080A7760 @ =0x0202377E
	movs r2, #1
	cmp r7, #0
	bne _080A772C
	movs r2, #3
_080A772C:
	movs r0, #0
	str r0, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x49
	ldrb r6, [r6]
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A7772
	cmp r0, #1
	bgt _080A7764
	cmp r0, #0
	beq _080A776A
	b _080A7788
	.align 2, 0
_080A7758: .4byte 0x020000BC
_080A775C: .4byte 0x000012BA
_080A7760: .4byte 0x0202377E
_080A7764:
	cmp r0, #2
	beq _080A777A
	b _080A7788
_080A776A:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	b _080A7780
_080A7772:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	b _080A7780
_080A777A:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
_080A7780:
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A77AA
_080A7788:
	ldr r0, _080A77B4 @ =0x000012BB
	bl DecodeMsg
	adds r3, r0, #0
	ldr r4, _080A77B8 @ =0x020000C4
	ldr r1, _080A77BC @ =0x020237FE
	movs r2, #1
	cmp r7, #1
	bne _080A779C
	movs r2, #3
_080A779C:
	movs r0, #0
	str r0, [sp]
	str r3, [sp, #4]
	adds r0, r4, #0
	movs r3, #0
	bl PutDrawText
_080A77AA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A77B4: .4byte 0x000012BB
_080A77B8: .4byte 0x020000C4
_080A77BC: .4byte 0x020237FE

	thumb_func_start StartModeSelectFace
StartModeSelectFace: @ 0x080A77C0
	push {r4, r5, lr}
	sub sp, #0x10
	add r2, sp, #4
	ldr r1, _080A77F4 @ =0x08418DB4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r1, [r0]
	movs r0, #0x42
	str r0, [sp]
	movs r0, #0
	movs r2, #0xcc
	movs r3, #0x48
	bl StartBmFace
	adds r4, r0, #0
	bl StartFaceFadeIn
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A77F4: .4byte 0x08418DB4

	thumb_func_start LoadModeSelectChapterGfx
LoadModeSelectChapterGfx: @ 0x080A77F8
	push {r4, r5, lr}
	sub sp, #0x30
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _080A784C @ =0x08418DC0
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	lsls r4, r4, #4
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r1, _080A7850 @ =0x060102C0
	bl Decompress
	add r0, sp, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A7854 @ =0x060106C0
	bl Decompress
	add r0, sp, #8
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A7858 @ =0x06010AC0
	bl Decompress
	add r0, sp, #0xc
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080A785C @ =0x06010EC0
	bl Decompress
	add sp, #0x30
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A784C: .4byte 0x08418DC0
_080A7850: .4byte 0x060102C0
_080A7854: .4byte 0x060106C0
_080A7858: .4byte 0x06010AC0
_080A785C: .4byte 0x06010EC0

	thumb_func_start sub_080A7860
sub_080A7860: @ 0x080A7860
	adds r1, r0, #0
	adds r1, #0xd
	lsls r1, r1, #5
	ldr r2, _080A7888 @ =0x02022A62
	adds r3, r1, r2
	ldr r2, _080A788C @ =0x0201E9F4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0xe
_080A7876:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080A7876
	bx lr
	.align 2, 0
_080A7888: .4byte 0x02022A62
_080A788C: .4byte 0x0201E9F4

	thumb_func_start sub_080A7890
sub_080A7890: @ 0x080A7890
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r0, #0xd
	lsls r0, r0, #5
	ldr r1, _080A78D8 @ =0x02022A62
	adds r5, r0, r1
	cmp r4, #0x40
	ble _080A78A4
	movs r4, #0x40
_080A78A4:
	ldr r0, _080A78DC @ =0x02000001
	ldrb r0, [r0]
	subs r0, #0xa
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r0, r2, #4
	ldr r1, _080A78E0 @ =0x0201E9F4
	subs r0, r0, r2
	movs r2, #0x1f
	mov ip, r2
	lsls r0, r0, #1
	adds r3, r0, r1
	movs r6, #0xe
_080A78BE:
	mov r0, ip
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, #0x1f
	bgt _080A78E4
	cmp r0, #0
	bge _080A78D2
	movs r0, #0
_080A78D2:
	mov r1, ip
	ands r1, r0
	b _080A78E6
	.align 2, 0
_080A78D8: .4byte 0x02022A62
_080A78DC: .4byte 0x02000001
_080A78E0: .4byte 0x0201E9F4
_080A78E4:
	movs r1, #0x1f
_080A78E6:
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A7904
	cmp r0, #0
	bge _080A78FE
	movs r0, #0
_080A78FE:
	ands r0, r2
	adds r1, r1, r0
	b _080A7906
_080A7904:
	adds r1, r1, r2
_080A7906:
	movs r2, #0xf8
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A7924
	cmp r0, #0
	bge _080A791E
	movs r0, #0
_080A791E:
	ands r0, r2
	adds r0, r1, r0
	b _080A7926
_080A7924:
	adds r0, r1, r2
_080A7926:
	strh r0, [r5]
	adds r5, #2
	adds r3, #2
	subs r6, #1
	cmp r6, #0
	bge _080A78BE
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080A793C
sub_080A793C: @ 0x080A793C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0xff
	ands r2, r0
	cmp r2, #0x80
	ble _080A7950
	adds r1, r2, #0
	subs r1, #0x80
	b _080A7954
_080A7950:
	movs r1, #0x80
	subs r1, r1, r2
_080A7954:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	asrs r0, r0, #7
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r3, #0
	bl sub_080A7890
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ModeSelectSpriteDraw_Init
ModeSelectSpriteDraw_Init: @ 0x080A796C
	push {r4, lr}
	mov ip, r0
	movs r1, #0
	str r1, [r0, #0x30]
	movs r2, #0
	strh r1, [r0, #0x3e]
	mov r3, ip
	adds r3, #0x3c
	strb r2, [r3]
	movs r0, #0x78
	mov r4, ip
	str r0, [r4, #0x34]
	movs r0, #0xa0
	str r0, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	strb r2, [r3]
	str r1, [r4, #0x48]
	mov r0, ip
	adds r0, #0x4c
	strb r2, [r0]
	str r1, [r4, #0x2c]
	adds r0, #2
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A79A4
sub_080A79A4: @ 0x080A79A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A7A2A
	movs r4, #0
	ldr r0, [r5, #0x40]
	cmp r4, r0
	bge _080A7A2A
	ldr r0, _080A7A90 @ =0x080C5A48
	mov r8, r0
	movs r6, #0
_080A79C4:
	ldrh r7, [r5, #0x3e]
	lsrs r3, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r3, r3, r0
	adds r3, #0x28
	ldr r1, [r5, #0x34]
	lsls r1, r1, #0xc
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #1
	add r0, r8
	movs r7, #0
	ldrsh r2, [r0, r7]
	movs r0, #0x46
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r2, [r5, #0x38]
	lsls r2, r2, #0xc
	adds r3, #0x40
	lsls r3, r3, #1
	add r3, r8
	movs r0, #0
	ldrsh r3, [r3, r0]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r2, r2, r0
	asrs r2, r2, #0xc
	subs r2, #0x10
	ldr r0, _080A7A94 @ =0x0201E8D4
	adds r0, r6, r0
	lsls r1, r1, #4
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_08054E10
	ldrh r7, [r5, #0x3e]
	lsrs r1, r7, #4
	ldr r0, [r5, #0x44]
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_080A793C
	adds r6, #0x38
	adds r4, #1
	ldr r0, [r5, #0x40]
	cmp r4, r0
	blt _080A79C4
_080A7A2A:
	movs r0, #0x3e
	ldrsh r1, [r5, r0]
	movs r0, #0xb0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl BgAffinRotScaling
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	bl BgAffinScaling
	movs r7, #0x34
	ldrsh r1, [r5, r7]
	movs r0, #0x38
	ldrsh r2, [r5, r0]
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r3, #0x4c
	bl BgAffinAnchoring
	ldr r4, _080A7A98 @ =0x02000001
	ldr r0, [r5, #0x48]
	str r0, [sp]
	movs r0, #8
	movs r1, #8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_080A86A0
	strb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4c
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A7AA0
	ldr r0, [r5, #0x48]
	adds r0, #8
	str r0, [r5, #0x48]
	ldr r1, _080A7A9C @ =0x000003FF
	cmp r0, r1
	ble _080A7AAE
	movs r0, #1
	b _080A7AAC
	.align 2, 0
_080A7A90: .4byte 0x080C5A48
_080A7A94: .4byte 0x0201E8D4
_080A7A98: .4byte 0x02000001
_080A7A9C: .4byte 0x000003FF
_080A7AA0:
	ldr r0, [r5, #0x48]
	subs r0, #8
	str r0, [r5, #0x48]
	cmp r0, #0
	bgt _080A7AAE
	movs r0, #0
_080A7AAC:
	strb r0, [r2]
_080A7AAE:
	adds r1, r5, #0
	adds r1, #0x4e
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A7AD6
	adds r0, r5, #0
	adds r0, #0x4d
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	lsls r1, r1, #4
	adds r1, #0x68
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl DisplayFrozenUiHandExt
	b _080A7AEA
_080A7AD6:
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x68
	movs r2, #0xbc
	lsls r2, r2, #4
	movs r0, #0x6c
	bl DisplayUiHandExt
_080A7AEA:
	ldr r3, _080A7B68 @ =0x08CE483C
	movs r4, #0xb0
	lsls r4, r4, #8
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0
	movs r2, #8
	bl PutSpriteExt
	ldr r3, _080A7B6C @ =0x08CE4856
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x14
	movs r2, #0x1c
	bl PutSpriteExt
	ldr r3, _080A7B70 @ =0x08CE489C
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0x28
	movs r2, #0x40
	bl PutSpriteExt
	ldr r0, [r5, #0x2c]
	asrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A7B32
	ldr r3, _080A7B74 @ =0x08CE487C
	str r4, [sp]
	movs r0, #0xd
	movs r1, #8
	movs r2, #0x82
	bl PutSpriteExt
_080A7B32:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _080A7B3C
	adds r0, #1
	str r0, [r5, #0x2c]
_080A7B3C:
	ldr r3, _080A7B78 @ =0x08CE48A4
	movs r0, #0xa0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xd
	movs r1, #0x6c
	movs r2, #0x18
	bl PutSpriteExt
	ldr r0, [r5, #0x30]
	bl sub_080A73F8
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B68: .4byte 0x08CE483C
_080A7B6C: .4byte 0x08CE4856
_080A7B70: .4byte 0x08CE489C
_080A7B74: .4byte 0x08CE487C
_080A7B78: .4byte 0x08CE48A4

	thumb_func_start sub_080A7B7C
sub_080A7B7C: @ 0x080A7B7C
	push {lr}
	ldr r0, _080A7B94 @ =0x08CE48F0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A7B8E
	movs r0, #1
	str r0, [r1, #0x2c]
_080A7B8E:
	pop {r0}
	bx r0
	.align 2, 0
_080A7B94: .4byte 0x08CE48F0

	thumb_func_start sub_080A7B98
sub_080A7B98: @ 0x080A7B98
	push {lr}
	ldr r0, _080A7BB0 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7BAC
	adds r1, r0, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
_080A7BAC:
	pop {r0}
	bx r0
	.align 2, 0
_080A7BB0: .4byte 0x08CE48F0

	thumb_func_start sub_080A7BB4
sub_080A7BB4: @ 0x080A7BB4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080A7BD8 @ =0x08CE48F0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A7BD2
	str r5, [r4, #0x40]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r5, #0
	bl __divsi3
	str r0, [r4, #0x44]
_080A7BD2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BD8: .4byte 0x08CE48F0

	thumb_func_start sub_080A7BDC
sub_080A7BDC: @ 0x080A7BDC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080A7C00 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7BF0
	str r5, [r0, #0x34]
	str r4, [r0, #0x38]
_080A7BF0:
	ldr r1, _080A7C04 @ =0x02000000
	adds r0, r4, #0
	subs r0, #0x3c
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C00: .4byte 0x08CE48F0
_080A7C04: .4byte 0x02000000

	thumb_func_start sub_080A7C08
sub_080A7C08: @ 0x080A7C08
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080A7C20 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7C1A
	strh r4, [r0, #0x3e]
_080A7C1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C20: .4byte 0x08CE48F0

	thumb_func_start sub_080A7C24
sub_080A7C24: @ 0x080A7C24
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080A7C48 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7C42
	adds r1, r0, #0
	adds r1, #0x4d
	strb r4, [r1]
	adds r0, #0x4e
	strb r5, [r0]
_080A7C42:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C48: .4byte 0x08CE48F0

	thumb_func_start sub_080A7C4C
sub_080A7C4C: @ 0x080A7C4C
	push {lr}
	ldr r0, _080A7C5C @ =0x08CE48F0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	pop {r1}
	bx r1
	.align 2, 0
_080A7C5C: .4byte 0x08CE48F0

	thumb_func_start sub_080A7C60
sub_080A7C60: @ 0x080A7C60
	cmp r0, #0
	beq _080A7C68
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
_080A7C68:
	bx lr
	.align 2, 0

	thumb_func_start ModeSelect_InitGfxMaybe
ModeSelect_InitGfxMaybe: @ 0x080A7C6C
	push {lr}
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080A7C7E
	bl sub_080A4E58
_080A7C7E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A7C84
sub_080A7C84: @ 0x080A7C84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	bl ApplySystemObjectsGraphics
	ldr r2, _080A7DB4 @ =0x0000FFF8
	movs r0, #1
	movs r1, #8
	bl SetBgOffset
	movs r0, #0xc
	bl Proc_BlockEachMarked
	movs r0, #0xd
	bl Proc_BlockEachMarked
	ldr r1, _080A7DB8 @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _080A7DBC @ =0x08CE4910
	bl SetFaceConfig
	ldr r0, _080A7DC0 @ =0x08415AA0
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080A7DC4 @ =0x08415594
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A7DC8 @ =0x02022C60
	ldr r1, _080A7DCC @ =0x084150E0
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _080A7DD0 @ =0x02023460
	ldr r1, _080A7DD4 @ =0x08415AC0
	movs r2, #0xf0
	lsls r2, r2, #8
	bl sub_080AACD8
	ldr r0, _080A7DD8 @ =0x084150C0
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A7DDC @ =0x08414940
	ldr r1, _080A7DE0 @ =0x06010000
	bl Decompress
	ldr r0, _080A7DE4 @ =0x0841625C
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl NewEfxAnimeDrvProc
	bl ResetClassReelSpell
	ldr r0, _080A7DE8 @ =0x08CE48F0
	adds r1, r6, #0
	bl Proc_Start
	str r0, [r6, #0x38]
	movs r0, #0
	movs r1, #0x70
	bl sub_080A7BDC
	movs r1, #0x41
	adds r1, r1, r6
	mov sl, r1
	movs r0, #0
	strb r0, [r1]
	adds r5, r6, #0
	adds r5, #0x4c
	strb r0, [r5]
	bl sub_0809E9FC
	adds r2, r6, #0
	adds r2, #0x40
	strb r0, [r2]
	adds r3, r6, #0
	adds r3, #0x42
	movs r4, #1
	adds r0, r4, #0
	ldrb r7, [r3]
	ands r0, r7
	cmp r0, #0
	beq _080A7DF4
	ldr r0, _080A7DEC @ =0x08418DF0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #2
	strb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x49
	strb r4, [r1]
	adds r2, #0xa
	strb r0, [r2]
	movs r4, #0
	str r3, [sp, #0xc]
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r0, [r5]
	cmp r4, r0
	bge _080A7E54
	adds r2, r7, #0
_080A7D7E:
	ldr r1, _080A7DF0 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080A7DA4
	adds r1, r6, #0
	adds r1, #0x40
	lsls r0, r4, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A7DA4
	movs r0, #1
_080A7DA4:
	strb r0, [r2]
	adds r2, #1
	adds r4, #1
	ldrb r1, [r5]
	cmp r4, r1
	blt _080A7D7E
	b _080A7E54
	.align 2, 0
_080A7DB4: .4byte 0x0000FFF8
_080A7DB8: .4byte 0x02000000
_080A7DBC: .4byte 0x08CE4910
_080A7DC0: .4byte 0x08415AA0
_080A7DC4: .4byte 0x08415594
_080A7DC8: .4byte 0x02022C60
_080A7DCC: .4byte 0x084150E0
_080A7DD0: .4byte 0x02023460
_080A7DD4: .4byte 0x08415AC0
_080A7DD8: .4byte 0x084150C0
_080A7DDC: .4byte 0x08414940
_080A7DE0: .4byte 0x06010000
_080A7DE4: .4byte 0x0841625C
_080A7DE8: .4byte 0x08CE48F0
_080A7DEC: .4byte 0x08418DF0
_080A7DF0: .4byte 0x0202BBF8
_080A7DF4:
	adds r1, r6, #0
	adds r1, #0x49
	strb r0, [r1]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r7, #2
	mov sb, r7
	mov r0, sb
	ldrb r7, [r2]
	ands r0, r7
	mov r8, r1
	cmp r0, #0
	beq _080A7E1C
	ldrb r0, [r5]
	add r0, r8
	strb r4, [r0]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080A7E1C:
	movs r0, #8
	ldrb r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080A7E34
	ldrb r0, [r5]
	add r0, r8
	mov r1, sb
	strb r1, [r0]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080A7E34:
	movs r4, #0
	str r3, [sp, #0xc]
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r2, [r5]
	cmp r4, r2
	bge _080A7E54
	adds r2, r7, #0
	movs r3, #0
	adds r1, r5, #0
_080A7E48:
	adds r0, r2, r4
	strb r3, [r0]
	adds r4, #1
	ldrb r0, [r1]
	cmp r4, r0
	blt _080A7E48
_080A7E54:
	ldrb r0, [r5]
	bl sub_080A7BB4
	ldrb r0, [r5]
	mov r1, r8
	bl InitModeSelectAnims
	movs r4, #0
	ldrb r1, [r5]
	cmp r4, r1
	bge _080A7E78
_080A7E6A:
	adds r0, r4, #0
	bl sub_080A7860
	adds r4, #1
	ldrb r2, [r5]
	cmp r4, r2
	blt _080A7E6A
_080A7E78:
	bl sub_080A7B98
	adds r0, r6, #0
	bl StartUiSpinningArrows
	movs r4, #0xd2
	lsls r4, r4, #4
	movs r0, #0
	adds r1, r4, #0
	movs r2, #9
	bl LoadUiSpinningArrowGfx
	movs r0, #0
	adds r1, r4, #0
	movs r2, #9
	bl LoadUiSpinningArrowGfx
	movs r0, #0x1e
	movs r1, #0x3d
	movs r2, #0x44
	movs r3, #0x3d
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r4, _080A8044 @ =0x020000A4
	ldr r1, _080A8048 @ =0x0600E000
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	adds r0, r4, #0
	mov r2, sb
	movs r3, #0xe
	bl InitTextFont
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #9
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #8
	bl InitText
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #0xa
	bl InitText
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #5
	bl InitText
	bl sub_080A7C4C
	mov r1, sl
	ldrb r1, [r1]
	muls r0, r1, r0
	lsls r0, r0, #4
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x30]
	mov r2, sl
	ldrb r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	bl StartModeSelectFace
	str r0, [r6, #0x3c]
	bl sub_080A75F0
	mov r1, sl
	ldrb r0, [r1]
	add r0, r8
	ldrb r0, [r0]
	bl PutModeSelectCharacterText
	adds r0, r6, #0
	bl PutModeSelectDifficultyText
	mov r2, sl
	ldrb r2, [r2]
	adds r0, r2, r7
	ldrb r0, [r0]
	ldr r7, [sp, #0xc]
	ldrb r1, [r7]
	bl sub_080A7C24
	ldrh r0, [r6, #0x30]
	bl sub_080A7C08
	movs r0, #3
	bl EnableBgSync
	str r4, [r6, #0x2c]
	str r4, [r6, #0x50]
	ldr r3, _080A804C @ =0x03002870
	movs r0, #0x20
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #1
	ldrb r7, [r2]
	orrs r0, r7
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	movs r2, #0x50
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	mov r2, sl
	ldrb r0, [r2]
	add r0, r8
	ldrb r0, [r0]
	bl LoadModeSelectChapterGfx
	ldr r4, _080A8050 @ =0x080C5A48
	movs r7, #0x80
	adds r7, r7, r4
	mov r8, r7
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r7, #0
	ldrsh r0, [r4, r7]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8044: .4byte 0x020000A4
_080A8048: .4byte 0x0600E000
_080A804C: .4byte 0x03002870
_080A8050: .4byte 0x080C5A48

	thumb_func_start ModeSelect_TransitionSplitOpen
ModeSelect_TransitionSplitOpen: @ 0x080A8054
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	ldr r3, _080A80C0 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080A808A
	adds r0, #0xff
_080A808A:
	asrs r0, r0, #8
	movs r1, #0x48
	subs r1, r1, r0
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x50
	subs r0, r0, r1
	adds r2, #4
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	cmp r4, #0x10
	bne _080A80B8
	adds r0, r5, #0
	bl Proc_Break
_080A80B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A80C0: .4byte 0x03002870

	thumb_func_start ModeSelect_TransitionSplitClose
ModeSelect_TransitionSplitClose: @ 0x080A80C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080A80E0
	adds r0, #0xff
_080A80E0:
	asrs r0, r0, #8
	movs r2, #0x48
	subs r2, r2, r0
	ldr r3, _080A811C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #8
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x68
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	cmp r4, #0x10
	bne _080A8116
	adds r0, r5, #0
	bl Proc_Break
_080A8116:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A811C: .4byte 0x03002870

	thumb_func_start sub_080A8120
sub_080A8120: @ 0x080A8120
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A8142
	ldr r5, _080A814C @ =0x0201E8D4
	adds r6, r0, #0
_080A8132:
	adds r0, r5, #0
	bl sub_08054E5C
	adds r5, #0x38
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A8132
_080A8142:
	movs r0, #0
	str r0, [r7, #0x50]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A814C: .4byte 0x0201E8D4

	thumb_func_start sub_080A8150
sub_080A8150: @ 0x080A8150
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r5, [r0]
	adds r0, r4, #0
	bl PutModeSelectDifficultyText
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r4, #0x42
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_080A7C24
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ModeSelect_Loop_KeyHandler
ModeSelect_Loop_KeyHandler: @ 0x080A817C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, _080A81BC @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A81C8
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A81C8
	ldr r0, _080A81C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A81B2
	ldr r0, _080A81C4 @ =0x00000386
	bl m4aSongNumStart
_080A81B2:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080A8150
	b _080A840E
	.align 2, 0
_080A81BC: .4byte 0x08B857F8
_080A81C0: .4byte 0x0202BBF8
_080A81C4: .4byte 0x00000386
_080A81C8:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A8274
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x43
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _080A8274
	adds r0, #8
	adds r1, r0, r3
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080A8202
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A8232
_080A8202:
	ldrb r1, [r5]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A821A
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A8232
_080A821A:
	ldrb r5, [r5]
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _080A8250
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A8250
_080A8232:
	ldr r0, _080A824C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A8240
	b _080A840E
_080A8240:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A840E
	.align 2, 0
_080A824C: .4byte 0x0202BBF8
_080A8250:
	ldr r0, _080A826C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8262
	ldr r0, _080A8270 @ =0x00000386
	bl m4aSongNumStart
_080A8262:
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A8150
	b _080A840E
	.align 2, 0
_080A826C: .4byte 0x0202BBF8
_080A8270: .4byte 0x00000386
_080A8274:
	ldr r1, [r2]
	ldrh r3, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A828E
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _080A82A2
_080A828E:
	movs r7, #0x88
	lsls r7, r7, #1
	ands r7, r3
	cmp r7, #0
	beq _080A82C8
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #1
_080A82A2:
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080A82C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82B8
	ldr r0, _080A82C4 @ =0x00000387
	bl m4aSongNumStart
_080A82B8:
	adds r0, r4, #0
	bl sub_080A8120
	b _080A840E
	.align 2, 0
_080A82C0: .4byte 0x0202BBF8
_080A82C4: .4byte 0x00000387
_080A82C8:
	ldrh r1, [r1, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080A8388
	str r7, [r4, #0x2c]
	ldr r6, _080A8348 @ =0x0202BBF8
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82E8
	ldr r0, _080A834C @ =0x0000038A
	bl m4aSongNumStart
_080A82E8:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r1, _080A8350 @ =0x0201E8D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r7, [r0, #0xa]
	ldrb r2, [r5]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	bl sub_08054C8C
	adds r7, r4, #0
	adds r7, #0x42
	movs r0, #1
	ldrb r1, [r7]
	ands r0, r1
	cmp r0, #0
	beq _080A835E
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A8328
	movs r0, #2
	strb r0, [r6, #0x1b]
_080A8328:
	cmp r1, #1
	bne _080A8330
	movs r0, #3
	strb r0, [r6, #0x1b]
_080A8330:
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r5, [r5]
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A8354
	movs r0, #0x40
	ldrb r2, [r6, #0x14]
	orrs r0, r2
	strb r0, [r6, #0x14]
	b _080A8382
	.align 2, 0
_080A8348: .4byte 0x0202BBF8
_080A834C: .4byte 0x0000038A
_080A8350: .4byte 0x0201E8D4
_080A8354:
	movs r0, #0xbf
	ldrb r1, [r6, #0x14]
	ands r0, r1
	strb r0, [r6, #0x14]
	b _080A8382
_080A835E:
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x49
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, #0x43
	adds r1, r4, r1
	ldrb r1, [r1]
	bl SaveMenu_SetDifficultyChoice
	ldrb r5, [r5]
	adds r4, r5, r4
	ldrb r0, [r4]
	movs r1, #2
	ldrb r7, [r7]
	orrs r1, r7
	bl sub_080A7C24
_080A8382:
	bl sub_080A7B7C
	b _080A840E
_080A8388:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A83C2
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080A83C2
	str r1, [r4, #0x2c]
	ldr r0, _080A8414 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A83B2
	ldr r0, _080A8418 @ =0x0000038B
	bl m4aSongNumStart
_080A83B2:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	movs r0, #3
	movs r1, #0
	bl SaveMenu_SetDifficultyChoice
_080A83C2:
	ldr r0, [r4, #0x50]
	adds r0, #1
	str r0, [r4, #0x50]
	ldr r5, _080A841C @ =0x000001FF
	ands r0, r5
	cmp r0, #0x20
	bne _080A83F2
	ldr r2, _080A8420 @ =0x0201E8D4
	adds r3, r4, #0
	adds r3, #0x41
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #2
	strh r1, [r0, #0xa]
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	bl sub_08054C8C
_080A83F2:
	ldr r0, [r4, #0x50]
	ands r0, r5
	cmp r0, #0x80
	bne _080A840E
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _080A8420 @ =0x0201E8D4
	adds r0, r0, r1
	bl sub_08054E5C
_080A840E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8414: .4byte 0x0202BBF8
_080A8418: .4byte 0x0000038B
_080A841C: .4byte 0x000001FF
_080A8420: .4byte 0x0201E8D4

	thumb_func_start ModeSelect_RotateRight
ModeSelect_RotateRight: @ 0x080A8424
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A8448
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
_080A8448:
	subs r0, #1
	strb r0, [r1]
	bl sub_080A7C4C
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r3, [r2]
	adds r1, r3, #0
	muls r1, r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080A8150
	ldrh r0, [r4, #0x32]
	ldrh r1, [r4, #0x30]
	cmp r0, r1
	bhs _080A8486
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x32]
_080A8486:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ModeSelect_RotateLeft
ModeSelect_RotateLeft: @ 0x080A848C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	str r0, [r4, #0x34]
	movs r5, #0
	str r5, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	bl StartFaceFadeOut
	adds r1, r4, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080A84B6
	adds r0, r2, #1
	strb r0, [r1]
	b _080A84B8
_080A84B6:
	strb r5, [r1]
_080A84B8:
	bl sub_080A7C4C
	adds r2, r4, #0
	adds r2, #0x41
	ldrb r3, [r2]
	adds r1, r3, #0
	muls r1, r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080A8150
	ldrh r0, [r4, #0x30]
	ldrh r1, [r4, #0x32]
	cmp r1, r0
	bls _080A84F2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	strh r0, [r4, #0x30]
_080A84F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ModeSelect_Loop_RotateCarousel
ModeSelect_Loop_RotateCarousel: @ 0x080A84F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x30]
	subs r0, r1, r2
	mov r3, r8
	ldr r6, [r3, #0x34]
	adds r4, r0, #0
	muls r4, r6, r4
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldr r5, [r3, #0x2c]
	adds r5, #1
	str r5, [r3, #0x2c]
	asrs r4, r4, #2
	movs r0, #0x1e
	subs r0, r0, r5
	adds r1, r4, #0
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xe1
	lsls r1, r1, #2
	bl __divsi3
	subs r4, r4, r0
	lsls r4, r4, #2
	adds r0, r6, #0
	muls r0, r4, r0
	mov r1, r8
	ldrh r1, [r1, #0x30]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r5, #0xd
	bne _080A855A
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl LoadModeSelectChapterGfx
_080A855A:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0xe
	bne _080A8578
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl StartModeSelectFace
	mov r3, r8
	str r0, [r3, #0x3c]
_080A8578:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	cmp r0, #0x14
	bne _080A8590
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl PutModeSelectCharacterText
_080A8590:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0x1e
	bne _080A85A8
	ldr r0, _080A861C @ =0x00000FFF
	ldrh r3, [r2, #0x32]
	ands r0, r3
	adds r7, r0, #0
	strh r7, [r2, #0x30]
	mov r0, r8
	bl Proc_Break
_080A85A8:
	ldr r4, _080A8620 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r0, r7, #0
	bl sub_080A7C08
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A861C: .4byte 0x00000FFF
_080A8620: .4byte 0x080C5A48

	thumb_func_start ModeSelect_End
ModeSelect_End: @ 0x080A8624
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	bl EndModeSelectAnims
	bl EndEfxAnimeDrvProc
	movs r0, #0
	bl EndFaceById
	adds r4, #0x42
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080A8656
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A865C
_080A8656:
	movs r0, #0
	bl SetOnHBlankA
_080A865C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A8664
sub_080A8664: @ 0x080A8664
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8678 @ =0x08CE4930
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A8678: .4byte 0x08CE4930

	thumb_func_start StartModeSelect
StartModeSelect: @ 0x080A867C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0809E9FC
	cmp r0, #7
	ble _080A8696
	ldr r0, _080A869C @ =0x08CE4930
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
_080A8696:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A869C: .4byte 0x08CE4930
