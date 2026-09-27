	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4F74
sub_080A4F74: @ 0x080A4F74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080A5018 @ =0x08CE40F4
	ldr r1, [r4]
	ldr r2, _080A501C @ =0x01000142
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A500C
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov sb, r0
	movs r7, #0x1f
_080A4FAE:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	movs r4, #3
	ldrb r2, [r1]
	ands r4, r2
	cmp r4, #1
	bne _080A4FF8
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _080A4FD8
	str r4, [r5, #0x58]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x75
	bl UnlockSoundRoomSong
_080A4FD8:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	ldrb r2, [r1, #1]
	cmp r2, #4
	bne _080A4FF8
	str r4, [r5, #0x5c]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x76
	bl UnlockSoundRoomSong
_080A4FF8:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080A4FAE
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080A5020
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080A5020
_080A500C:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080A5028
	.align 2, 0
_080A5018: .4byte 0x08CE40F4
_080A501C: .4byte 0x01000142
_080A5020:
	ldr r0, _080A5038 @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
_080A5028:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5038: .4byte 0x06013800

	thumb_func_start sub_080A503C
sub_080A503C: @ 0x080A503C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080A5078
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A506C @ =0x00000765
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A5070 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A5080
	ldr r0, _080A5074 @ =0x0000037B
	bl m4aSongNumStart
	b _080A5080
	.align 2, 0
_080A506C: .4byte 0x00000765
_080A5070: .4byte 0x0202BBF8
_080A5074: .4byte 0x0000037B
_080A5078:
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_080A5080:
	pop {r0}
	bx r0

	thumb_func_start sub_080A5084
sub_080A5084: @ 0x080A5084
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080A50C0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A50B4 @ =0x00000766
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080A50B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A50C8
	ldr r0, _080A50BC @ =0x0000037B
	bl m4aSongNumStart
	b _080A50C8
	.align 2, 0
_080A50B4: .4byte 0x00000766
_080A50B8: .4byte 0x0202BBF8
_080A50BC: .4byte 0x0000037B
_080A50C0:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A50C8:
	pop {r0}
	bx r0

	thumb_func_start sub_080A50CC
sub_080A50CC: @ 0x080A50CC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080A50FC
	ldr r0, _080A50F8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A5100
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _080A5100
	.align 2, 0
_080A50F8: .4byte 0x08B857F8
_080A50FC:
	adds r0, r2, #1
	strh r0, [r1]
_080A5100:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A5108
sub_080A5108: @ 0x080A5108
	push {lr}
	ldr r0, _080A5118 @ =0x08CE40F4
	ldr r0, [r0]
	bl SaveBonusContentData
	pop {r0}
	bx r0
	.align 2, 0
_080A5118: .4byte 0x08CE40F4

	thumb_func_start sub_080A511C
sub_080A511C: @ 0x080A511C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A512C @ =0x08CE40F8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A512C: .4byte 0x08CE40F8

	thumb_func_start sub_080A5130
sub_080A5130: @ 0x080A5130
	lsls r2, r2, #4
	cmp r2, #0
	ble _080A5146
	adds r3, r0, #0
_080A5138:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080A5138
_080A5146:
	bx lr

	thumb_func_start sub_080A5148
sub_080A5148: @ 0x080A5148
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	movs r0, #0x3f
	ands r5, r0
	movs r1, #0x20
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080A5168
	movs r0, #0x1f
	ands r0, r5
	subs r5, r1, r0
_080A5168:
	movs r0, #1
	mov ip, r0
	ldr r0, _080A520C @ =0x02000004
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	subs r6, r1, r5
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r0, #0x22
	mov r8, r0
	movs r4, #0x1f
	mov sl, r4
_080A5182:
	mov r0, ip
	subs r0, #8
	cmp r0, #2
	bls _080A51EC
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _080A5210 @ =0x02022860
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r2, r8
	ldrh r4, [r2]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	adds r3, r0, #0
	muls r3, r6, r3
	adds r0, r4, #0
	ands r0, r2
	muls r0, r5, r0
	adds r3, r3, r0
	asrs r3, r3, #5
	ands r3, r2
	adds r0, r1, #0
	ands r0, r7
	adds r2, r0, #0
	muls r2, r6, r2
	adds r0, r4, #0
	ands r0, r7
	muls r0, r5, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r7
	mov r0, sl
	ands r1, r0
	muls r1, r6, r1
	ands r4, r0
	adds r0, r4, #0
	muls r0, r5, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	movs r4, #0x1f
	ands r1, r4
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r4, _080A5210 @ =0x02022860
	adds r0, r0, r4
	orrs r3, r2
	orrs r1, r3
	strh r1, [r0]
_080A51EC:
	movs r0, #2
	add r8, r0
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #0xf
	ble _080A5182
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A520C: .4byte 0x02000004
_080A5210: .4byte 0x02022860

	thumb_func_start sub_080A5214
sub_080A5214: @ 0x080A5214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r7, r1, #0x18
	movs r1, #0x8f
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5260
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	b _080A5280
_080A5260:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
_080A5280:
	mov r1, sb
	adds r1, #8
	adds r2, r7, #0
	subs r2, #0xe
	ldr r3, _080A5410 @ =0x08CE41BC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x10
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _080A5414 @ =0x08CE4286
	movs r0, #0xc0
	lsls r0, r0, #7
	mov r8, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	add r0, sp, #4
	adds r6, r7, #0
	subs r6, #8
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _080A52FE
	mov r5, sb
	adds r5, #0x12
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0x64
	mov sl, r1
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	subs r4, r4, r0
	strh r4, [r5]
_080A52FE:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080A532C
	mov r5, sb
	adds r5, #0x1a
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
_080A532C:
	mov r5, sb
	adds r5, #0x22
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r1, r8
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x2a
	subs r2, r7, #7
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x42
	adds r2, r7, #1
	ldr r4, _080A541C @ =0x08CE4294
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5410: .4byte 0x08CE41BC
_080A5414: .4byte 0x08CE4286
_080A5418: .4byte 0x08CE42C0
_080A541C: .4byte 0x08CE4294

	thumb_func_start SaveDraw_Init
SaveDraw_Init: @ 0x080A5420
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	movs r7, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x3b
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl StartSaveDrawCursor
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080A5490
	str r7, [r1, #0x60]
	b _080A54AE
_080A5490:
	ldr r0, _080A54C4 @ =0x08413A50
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xb0
	lsls r3, r3, #1
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080A54AE:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	strb r1, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A54C4: .4byte 0x08413A50

	thumb_func_start sub_080A54C8
sub_080A54C8: @ 0x080A54C8
	push {lr}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A54F4
	ldr r2, _080A54F0 @ =0x02022860
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080A5502
	.align 2, 0
_080A54F0: .4byte 0x02022860
_080A54F4:
	ldr r0, _080A550C @ =0x02022860
	ldr r2, _080A5510 @ =0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080A5502:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080A550C: .4byte 0x02022860
_080A5510: .4byte 0x0000033A

	thumb_func_start sub_080A5514
sub_080A5514: @ 0x080A5514
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A5584 @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A5588 @ =0x08CE4158
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #9
	add r8, r1
	ldr r0, _080A558C @ =0x08CE4584
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5584: .4byte 0x000001FF
_080A5588: .4byte 0x08CE4158
_080A558C: .4byte 0x08CE4584

	thumb_func_start sub_080A5590
sub_080A5590: @ 0x080A5590
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080A5600 @ =0x000001FF
	mov sb, r1
	adds r1, r6, #0
	mov r2, sb
	ands r1, r2
	ldr r3, _080A5604 @ =0x08CE4158
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, sb
	ands r6, r0
	movs r1, #9
	add r8, r1
	ldr r0, _080A5608 @ =0x08CE456C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5600: .4byte 0x000001FF
_080A5604: .4byte 0x08CE4158
_080A5608: .4byte 0x08CE456C

	thumb_func_start sub_080A560C
sub_080A560C: @ 0x080A560C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x3c
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r1, [r4]
	ldrb r2, [r0]
	cmp r1, r2
	beq _080A5636
	ldrb r0, [r0]
	bl sub_080A649C
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4]
_080A5636:
	ldrh r0, [r7, #0x2a]
	ldrb r1, [r4]
	bl sub_080A652C
	ldr r2, _080A5684 @ =0x02022860
	ldr r3, _080A5688 @ =0x02000004
	ldrh r1, [r7, #0x2a]
	lsrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r7, #0x14]
	adds r4, r1, #0
	adds r4, #0x3f
	ldrb r3, [r4]
	adds r0, r3, #0
	cmp r0, #0xff
	beq _080A572A
	adds r5, r1, #0
	adds r5, #0x44
	ldrh r2, [r5]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080A572A
	cmp r1, #0xf
	bhi _080A568C
	movs r0, #0xff
	strb r0, [r4]
	b _080A5720
	.align 2, 0
_080A5684: .4byte 0x02022860
_080A5688: .4byte 0x02000004
_080A568C:
	ldr r0, _080A5744 @ =0x080C5A48
	mov sb, r0
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r5]
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r2, [r1]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	ands r4, r0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
_080A5720:
	ldr r0, [r7, #0x14]
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #0x10
	strh r1, [r0]
_080A572A:
	ldrh r0, [r7, #0x2a]
	bl sub_080A5148
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5744: .4byte 0x080C5A48

	thumb_func_start sub_080A5748
sub_080A5748: @ 0x080A5748
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	adds r1, #0x2f
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r5, r0, r1
	ldr r2, _080A57AC @ =0x000001FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _080A57B0 @ =0x08CE4158
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	adds r2, r5, #0
	bl PutSpriteExt
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A57DC
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _080A57B8
	adds r2, r5, #0
	adds r2, #9
	ldr r0, _080A57AC @ =0x000001FF
	ands r2, r0
	ldr r0, _080A57B4 @ =0x08CE4584
	ldr r3, [r0, #0x24]
	b _080A57C4
	.align 2, 0
_080A57AC: .4byte 0x000001FF
_080A57B0: .4byte 0x08CE4158
_080A57B4: .4byte 0x08CE4584
_080A57B8:
	adds r2, r5, #0
	adds r2, #9
	ldr r0, _080A57D4 @ =0x000001FF
	ands r2, r0
	ldr r0, _080A57D8 @ =0x08CE4584
	ldr r3, [r0, #0x20]
_080A57C4:
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
	b _080A5806
	.align 2, 0
_080A57D4: .4byte 0x000001FF
_080A57D8: .4byte 0x08CE4584
_080A57DC:
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	bl BitfileToIndex
	lsls r0, r0, #0x18
	adds r2, r5, #0
	adds r2, #9
	ldr r1, _080A5810 @ =0x000001FF
	ands r2, r1
	ldr r1, _080A5814 @ =0x08CE4584
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	bl PutSpriteExt
_080A5806:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5810: .4byte 0x000001FF
_080A5814: .4byte 0x08CE4584

	thumb_func_start sub_080A5818
sub_080A5818: @ 0x080A5818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080A584A
	cmp r1, #0x20
	bne _080A5844
	adds r0, #0x35
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x33
	strb r0, [r1]
	b _080A584A
_080A5844:
	mov r0, r8
	adds r0, #0x33
	strb r2, [r0]
_080A584A:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x2f
	adds r1, r2, #0
	adds r1, #0x46
	ldrh r1, [r1]
	ldrb r0, [r0]
	adds r5, r1, r0
	cmp r5, #0xdb
	bgt _080A590A
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	movs r1, #0x44
	subs r6, r1, r0
	cmp r6, #1
	bgt _080A5876
	movs r6, #2
_080A5876:
	movs r7, #0
	cmp r7, r3
	bge _080A58E2
	adds r4, r6, #0
	movs r1, #0x38
	mov sb, r1
_080A5882:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A58BE
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_080A5514
	b _080A58D2
_080A58BE:
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_080A5514
_080A58D2:
	adds r4, #0x18
	adds r7, #1
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r7, r0
	blt _080A5882
_080A58E2:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #2
	bne _080A590A
	adds r0, #0x2b
	ldrb r3, [r0]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r2, r6, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_080A5E8C
_080A590A:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x46
	ldrh r1, [r1]
	subs r1, #1
	lsls r1, r1, #0x10
	movs r2, #0xdb
	lsls r2, r2, #0x11
	adds r3, r0, #0
	cmp r1, r2
	bhi _080A59EC
	adds r1, r3, #0
	adds r1, #0x33
	ldrb r2, [r1]
	cmp r2, #7
	bne _080A5932
	movs r5, #2
	movs r6, #0x15
	b _080A5946
_080A5932:
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	movs r1, #0x44
	subs r5, r1, r0
	cmp r5, #1
	bgt _080A5944
	movs r5, #2
_080A5944:
	movs r6, #0x18
_080A5946:
	movs r7, #0
	adds r0, r3, #0
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	bge _080A59C6
	adds r4, r5, #0
_080A5956:
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A5998
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_080A5590
	b _080A59B4
_080A5998:
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_080A5590
_080A59B4:
	adds r4, r4, r6
	adds r7, #1
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	blt _080A5956
_080A59C6:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0xa
	bne _080A59EC
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r5, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_080A5E8C
_080A59EC:
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A59FA
	b _080A5B78
_080A59FA:
	mov r0, r8
	bl sub_080A5214
	mov r0, r8
	bl sub_080A5748
	movs r7, #0
	movs r0, #0xf
	mov sl, r0
_080A5A0C:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	movs r2, #0
	mov sb, r2
	ldrb r1, [r1]
	cmp r1, #6
	bne _080A5A2C
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080A5A2C
	movs r3, #0x80
	lsls r3, r3, #1
	mov sb, r3
_080A5A2C:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xe8
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A5AE8 @ =0x000001FF
	ands r1, r2
	lsls r5, r7, #5
	adds r2, r5, #0
	adds r2, #0x20
	add r2, sb
	ldr r0, _080A5AEC @ =0x08CE45B4
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	mov ip, r0
	lsls r4, r7, #1
	adds r0, r4, #0
	adds r0, #0xa
	mov r3, sl
	ands r0, r3
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r3, ip
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xf4
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A5AE8 @ =0x000001FF
	ands r1, r2
	adds r5, #0x21
	add r5, sb
	adds r5, #8
	ldr r0, _080A5AF0 @ =0x08CE45A8
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r0, sl
	ands r4, r0
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	adds r7, #1
	cmp r7, #2
	ble _080A5A0C
	mov r1, r8
	ldr r2, [r1, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080A5B78
	adds r1, r2, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	beq _080A5B18
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080A5AC6
	bl EndSpriteAnimProc
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080A5AC6:
	mov r3, r8
	ldr r2, [r3, #0x14]
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A5AF8
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5AF4 @ =0x08CE41B4
	movs r0, #0
	b _080A5B08
	.align 2, 0
_080A5AE8: .4byte 0x000001FF
_080A5AEC: .4byte 0x08CE45B4
_080A5AF0: .4byte 0x08CE45A8
_080A5AF4: .4byte 0x08CE41B4
_080A5AF8:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5B14 @ =0x08CE41B4
	movs r0, #0xc0
	lsls r0, r0, #7
_080A5B08:
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl PutSpriteExt
	b _080A5B78
	.align 2, 0
_080A5B14: .4byte 0x08CE41B4
_080A5B18:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5B3E
	ldr r0, [r2, #0x60]
	adds r2, #0x2f
	movs r1, #0xda
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	b _080A5B78
_080A5B3E:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	adds r2, #0x2f
	movs r1, #0xd3
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5BE8 @ =0x08CE41B4
	movs r0, #0xc0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080A5B78:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080A5C30
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A5BF0
	ldr r3, _080A5BEC @ =0x08CE4172
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x80
	bl PutSpriteExt
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x34
	movs r1, #0x88
	bl PutUiHand
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #0x1d
	movs r3, #0x80
	lsls r3, r3, #0x16
	adds r2, r2, r3
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_080A5E8C
	b _080A5C0E
	.align 2, 0
_080A5BE8: .4byte 0x08CE41B4
_080A5BEC: .4byte 0x08CE4172
_080A5BF0:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A5C0E
	ldrb r1, [r1]
	lsls r2, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_080A5E8C
_080A5C0E:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A5C30
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	movs r2, #0x80
	lsls r2, r2, #0x16
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	movs r0, #1
	mov r2, r8
	bl sub_080A5EAC
_080A5C30:
	mov r0, r8
	bl sub_080A560C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSaveDraw
StartSaveDraw: @ 0x080A5C48
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5C58 @ =0x08CE42EC
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A5C58: .4byte 0x08CE42EC
