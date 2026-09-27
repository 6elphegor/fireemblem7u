	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C8B4
sub_0807C8B4: @ 0x0807C8B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0807C8F4 @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _0807C8F8 @ =0x00000FCC
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetDialogueBoxConfig
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetDialogueBoxConfig
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C8F4: .4byte 0x06013000
_0807C8F8: .4byte 0x00000FCC

	thumb_func_start sub_0807C8FC
sub_0807C8FC: @ 0x0807C8FC
	push {r4, lr}
	ldr r2, _0807C95C @ =0x03002870
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
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0807C966
	movs r4, #1
_0807C92A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807C960
	ldr r1, [r2]
	cmp r1, #0
	beq _0807C960
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0807C960
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	b _0807C966
	.align 2, 0
_0807C95C: .4byte 0x03002870
_0807C960:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807C92A
_0807C966:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807C96C
sub_0807C96C: @ 0x0807C96C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807C984 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x11
	beq _0807C988
	cmp r0, #0x14
	beq _0807C996
	b _0807C9A2
	.align 2, 0
_0807C984: .4byte 0x0202BBF8
_0807C988:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C9AA
	b _0807C9A2
_0807C996:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C9AA
_0807C9A2:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0807C9AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807C9B0
sub_0807C9B0: @ 0x0807C9B0
	push {lr}
	ldr r2, _0807C9FC @ =0x03002870
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
	ldr r0, _0807CA00 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	movs r0, #0x1c
	bl DisplayBackground
	bl ArchiveCurrentPalettes
	movs r3, #0xf0
	lsls r3, r3, #4
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
	pop {r0}
	bx r0
	.align 2, 0
_0807C9FC: .4byte 0x03002870
_0807CA00: .4byte 0x0000FFE0

	thumb_func_start sub_0807CA04
sub_0807CA04: @ 0x0807CA04
	push {r4, lr}
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r4, _0807CA38 @ =0x0202BBF8
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	bne _0807CA22
	ldr r2, _0807CA3C @ =0x00000FC9
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807CA22:
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0807CA32
	ldr r2, _0807CA40 @ =0x00000FCA
	movs r0, #1
	movs r1, #1
	bl StartTalkMsg
_0807CA32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA38: .4byte 0x0202BBF8
_0807CA3C: .4byte 0x00000FC9
_0807CA40: .4byte 0x00000FCA

	thumb_func_start sub_0807CA44
sub_0807CA44: @ 0x0807CA44
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ClearTalk
	movs r0, #0
	bl InitBgs
	ldr r2, _0807CAB4 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
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
	bl ApplySystemObjectsGraphics
	ldr r4, _0807CAB8 @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	ldr r2, _0807CABC @ =0x00000FCB
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetDialogueBoxConfig
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetDialogueBoxConfig
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CAB4: .4byte 0x03002870
_0807CAB8: .4byte 0x06013000
_0807CABC: .4byte 0x00000FCB

	thumb_func_start sub_0807CAC0
sub_0807CAC0: @ 0x0807CAC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _0807CB1C @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
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
	bl ApplySystemObjectsGraphics
	ldr r1, _0807CB20 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0807CB16
	movs r0, #0x90
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CB16
	ldr r0, _0807CB24 @ =0x08CA7994
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0x90
	bl ClearFlag
_0807CB16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CB1C: .4byte 0x03002870
_0807CB20: .4byte 0x0202BBF8
_0807CB24: .4byte 0x08CA7994

	thumb_func_start sub_0807CB28
sub_0807CB28: @ 0x0807CB28
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	thumb_func_start sub_0807CB3C
sub_0807CB3C: @ 0x0807CB3C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r5, r0, #0
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #8
	movs r2, #0x11
	movs r3, #4
	bl DrawUiFrame2
	ldr r0, _0807CBD0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807CB74
	ldr r0, _0807CBD4 @ =0x0000037B
	bl m4aSongNumStart
_0807CB74:
	ldr r0, _0807CBD8 @ =0x000012CE
	bl DecodeMsg
	ldr r4, _0807CBDC @ =0x02022EA2
	adds r1, r4, #0
	adds r1, #0xe
	movs r2, #0x10
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	adds r0, #0x28
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumber
	ldr r0, _0807CBE0 @ =0x000012CF
	bl DecodeMsg
	adds r4, #0x2a
	movs r1, #8
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r1, r6, #0
	adds r1, #0x4c
	movs r0, #0x78
	strh r0, [r1]
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CBD0: .4byte 0x0202BBF8
_0807CBD4: .4byte 0x0000037B
_0807CBD8: .4byte 0x000012CE
_0807CBDC: .4byte 0x02022EA2
_0807CBE0: .4byte 0x000012CF

	thumb_func_start sub_0807CBE4
sub_0807CBE4: @ 0x0807CBE4
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807CC06
	ldr r0, _0807CC10 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0807CC0C
_0807CC06:
	adds r0, r2, #0
	bl Proc_Break
_0807CC0C:
	pop {r0}
	bx r0
	.align 2, 0
_0807CC10: .4byte 0x08B857F8

	thumb_func_start sub_0807CC14
sub_0807CC14: @ 0x0807CC14
	push {lr}
	ldr r0, _0807CC30 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0807CC34 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807CC30: .4byte 0x02023460
_0807CC34: .4byte 0x02022C60

	thumb_func_start sub_0807CC38
sub_0807CC38: @ 0x0807CC38
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl HasConvoyAccess_
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CC50
	ldr r0, _0807CC58 @ =0x08CA78DC
	adds r1, r4, #0
	bl Proc_StartBlocking
_0807CC50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CC58: .4byte 0x08CA78DC

	thumb_func_start sub_0807CC5C
sub_0807CC5C: @ 0x0807CC5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _0807CD38 @ =0x030028AC
	mov ip, r2
	ldr r0, _0807CD3C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	mov r8, r0
	mov r0, r8
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #8
	rsbs r2, r2, #0
	add r2, ip
	mov sb, r2
	mov r1, r8
	ldrb r0, [r2]
	orrs r1, r0
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	mov sl, r2
	mov r0, sl
	ldrb r2, [r7]
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, sl
	ands r0, r1
	strb r0, [r7]
	movs r0, #0x3f
	mov r2, ip
	ldrb r2, [r2]
	ands r0, r2
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _0807CD40 @ =sub_080777E4
	bl SetOnHBlankA
	ldr r0, _0807CD44 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807CD2A
	ldr r0, _0807CD48 @ =0x00000269
	bl m4aSongNumStart
_0807CD2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CD38: .4byte 0x030028AC
_0807CD3C: .4byte 0x0000FFE0
_0807CD40: .4byte sub_080777E4
_0807CD44: .4byte 0x0202BBF8
_0807CD48: .4byte 0x00000269

	thumb_func_start sub_0807CD4C
sub_0807CD4C: @ 0x0807CD4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #4
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x68
	mov r2, r8
	bl sub_0807764C
	ldr r3, _0807CDC0 @ =0x03002870
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
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _0807CDB6
	adds r0, r7, #0
	bl Proc_Break
_0807CDB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CDC0: .4byte 0x03002870

	thumb_func_start WorldFlushReload
WorldFlushReload: @ 0x0807CDC4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl ApplyMapChange
	movs r0, #1
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807CDEC
sub_0807CDEC: @ 0x0807CDEC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x80
	movs r5, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	subs r1, r1, r4
	adds r0, r1, #0
	muls r0, r5, r0
	muls r0, r1, r0
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x30
	adds r2, r5, #0
	bl sub_0807764C
	ldr r3, _0807CE5C @ =0x03002870
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
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x80
	blt _0807CE54
	adds r0, r7, #0
	bl Proc_Break
_0807CE54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE5C: .4byte 0x03002870

	thumb_func_start sub_0807CE60
sub_0807CE60: @ 0x0807CE60
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _0807CEB0 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	subs r0, #0x21
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0807CEB0: .4byte 0x03002870

	thumb_func_start sub_0807CEB4
sub_0807CEB4: @ 0x0807CEB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807CEC4 @ =0x08CA79C4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807CEC4: .4byte 0x08CA79C4

	thumb_func_start sub_0807CEC8
sub_0807CEC8: @ 0x0807CEC8
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #1
	bl UpdateBestGlobalSupportValue
	pop {r0}
	bx r0

	thumb_func_start sub_0807CED8
sub_0807CED8: @ 0x0807CED8
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #2
	bl UpdateBestGlobalSupportValue
	pop {r0}
	bx r0

	thumb_func_start sub_0807CEE8
sub_0807CEE8: @ 0x0807CEE8
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #3
	bl UpdateBestGlobalSupportValue
	pop {r0}
	bx r0

	thumb_func_start sub_0807CEF8
sub_0807CEF8: @ 0x0807CEF8
	bx lr
	.align 2, 0

	thumb_func_start sub_0807CEFC
sub_0807CEFC: @ 0x0807CEFC
	ldr r1, _0807CF0C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807CF0C: .4byte 0x0202BBB8

	thumb_func_start sub_0807CF10
sub_0807CF10: @ 0x0807CF10
	push {lr}
	movs r0, #0x18
	bl GetUnitFromCharId
	movs r1, #0x6b
	bl GetUnitItemSlot
	adds r1, r0, #0
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1

	thumb_func_start sub_0807CF2C
sub_0807CF2C: @ 0x0807CF2C
	push {r4, lr}
	ldr r4, _0807CF5C @ =0x0203A85C
	ldrb r0, [r4, #0x11]
	cmp r0, #0x17
	bne _0807CF60
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	adds r4, r0, #0
	movs r0, #0x6b
	bl GetItemIndex
	cmp r4, r0
	bne _0807CF60
	movs r0, #1
	b _0807CF62
	.align 2, 0
_0807CF5C: .4byte 0x0203A85C
_0807CF60:
	movs r0, #0
_0807CF62:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807CF68
sub_0807CF68: @ 0x0807CF68
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807CF7C
sub_0807CF7C: @ 0x0807CF7C
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r1, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0807CFA0
	ldr r0, _0807CF9C @ =0x00000407
	ldrh r1, [r1, #0x10]
	cmp r1, r0
	bne _0807CFA0
	movs r0, #1
	b _0807CFA2
	.align 2, 0
_0807CF9C: .4byte 0x00000407
_0807CFA0:
	movs r0, #0
_0807CFA2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807CFA8
sub_0807CFA8: @ 0x0807CFA8
	push {lr}
	bl sub_0807A03C
	movs r1, #0
	cmp r0, #1
	bgt _0807CFB6
	movs r1, #1
_0807CFB6:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807CFBC
sub_0807CFBC: @ 0x0807CFBC
	push {lr}
	movs r0, #0x17
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_0807CFC8
sub_0807CFC8: @ 0x0807CFC8
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807CFDE
	movs r2, #1
_0807CFDE:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807CFE4
sub_0807CFE4: @ 0x0807CFE4
	push {lr}
	ldr r0, _0807CFF0 @ =0x00002710
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_0807CFF0: .4byte 0x00002710

	thumb_func_start sub_0807CFF4
sub_0807CFF4: @ 0x0807CFF4
	push {lr}
	movs r0, #8
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D006
	movs r0, #0
	b _0807D018
_0807D006:
	ldr r0, _0807D01C @ =0x0202E3E0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r1, #0x25
	ldrb r0, [r0, #6]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_0807D018:
	pop {r1}
	bx r1
	.align 2, 0
_0807D01C: .4byte 0x0202E3E0

	thumb_func_start sub_0807D020
sub_0807D020: @ 0x0807D020
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0x85
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D042
	movs r0, #0x84
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r5, #0x74
	cmp r0, #0
	beq _0807D050
	movs r5, #0x73
	b _0807D054
_0807D042:
	movs r0, #0x84
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D050
	movs r5, #0x75
_0807D050:
	cmp r5, #0
	beq _0807D06C
_0807D054:
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r0, r5, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	b _0807D08C
_0807D06C:
	bl sub_080A0430
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D08C
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x74
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
_0807D08C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807D094
sub_0807D094: @ 0x0807D094
	ldr r0, _0807D0B0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0x2f
	beq _0807D0B4
	cmp r0, #0x30
	beq _0807D0B4
	cmp r0, #0x31
	beq _0807D0B4
	cmp r0, #0x2e
	beq _0807D0B4
	movs r0, #0
	b _0807D0B6
	.align 2, 0
_0807D0B0: .4byte 0x03004690
_0807D0B4:
	movs r0, #1
_0807D0B6:
	bx lr

	thumb_func_start sub_0807D0B8
sub_0807D0B8: @ 0x0807D0B8
	push {r4, lr}
	movs r0, #0x10
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x3e
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x10
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x1c
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D170
sub_0807D170: @ 0x0807D170
	push {lr}
	movs r0, #0x10
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807D186
	movs r2, #1
_0807D186:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807D18C
sub_0807D18C: @ 0x0807D18C
	push {r4, lr}
	movs r0, #0xe
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xf
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D1AC
	adds r4, #1
_0807D1AC:
	movs r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D1BE
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0807D1BE:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D1C8
sub_0807D1C8: @ 0x0807D1C8
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D1D8
	movs r1, #1
_0807D1D8:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D1E0
sub_0807D1E0: @ 0x0807D1E0
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0807D1F2
	movs r1, #1
_0807D1F2:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807D1F8
sub_0807D1F8: @ 0x0807D1F8
	push {lr}
	bl sub_0807D18C
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807D20A
	movs r1, #1
_0807D20A:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807D210
sub_0807D210: @ 0x0807D210
	push {lr}
	ldr r0, _0807D234 @ =0x0202E3DC
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldrb r0, [r0, #3]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807D238
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0807D238
	movs r0, #1
	b _0807D23A
	.align 2, 0
_0807D234: .4byte 0x0202E3DC
_0807D238:
	movs r0, #0
_0807D23A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D240
sub_0807D240: @ 0x0807D240
	push {lr}
	movs r0, #0x26
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0807D266
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0807D266
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D266
	movs r0, #1
	b _0807D268
_0807D266:
	movs r0, #0
_0807D268:
	pop {r1}
	bx r1

	thumb_func_start sub_0807D26C
sub_0807D26C: @ 0x0807D26C
	ldr r2, _0807D298 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r3, #1
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	bx lr
	.align 2, 0
_0807D298: .4byte 0x03002870

	thumb_func_start sub_0807D29C
sub_0807D29C: @ 0x0807D29C
	push {lr}
	movs r0, #1
	bl GetUnitFromCharId
	movs r1, #6
	movs r2, #2
	bl SetUnitStatusExt
	pop {r0}
	bx r0

	thumb_func_start sub_0807D2B0
sub_0807D2B0: @ 0x0807D2B0
	push {lr}
	ldr r0, _0807D2DC @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807D2D8
	ldr r0, _0807D2E0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	beq _0807D2E4
	cmp r0, #0x3d
	beq _0807D2E4
	bl RandNextB
	movs r1, #0xb
	bl DivRem
	cmp r0, #0
	beq _0807D2E4
_0807D2D8:
	movs r0, #0
	b _0807D2E6
	.align 2, 0
_0807D2DC: .4byte 0x0202BBF8
_0807D2E0: .4byte 0x03004690
_0807D2E4:
	movs r0, #1
_0807D2E6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D2EC
sub_0807D2EC: @ 0x0807D2EC
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D2F2:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807D30E
	ldr r0, [r0]
	cmp r0, #0
	beq _0807D30E
	ldrb r0, [r0, #4]
	bl PidStatsGetExpGain
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807D30E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D2F2
	ldr r0, _0807D320 @ =0x03004ADC
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D320: .4byte 0x03004ADC

	thumb_func_start sub_0807D324
sub_0807D324: @ 0x0807D324
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D32A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807D342
	ldr r0, [r0]
	cmp r0, #0
	beq _0807D342
	ldrb r0, [r0, #4]
	bl PidStatsGetExpGain
	adds r5, r5, r0
_0807D342:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D32A
	ldr r0, _0807D358 @ =0x03004ADC
	ldrh r0, [r0]
	subs r5, r5, r0
	ldr r0, _0807D35C @ =0x000002BB
	cmp r5, r0
	bgt _0807D360
	movs r0, #0
	b _0807D362
	.align 2, 0
_0807D358: .4byte 0x03004ADC
_0807D35C: .4byte 0x000002BB
_0807D360:
	movs r0, #1
_0807D362:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D368
sub_0807D368: @ 0x0807D368
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D36E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807D3A4
	ldr r3, [r2]
	cmp r3, #0
	beq _0807D3A4
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807D3A4
	ldrb r1, [r3, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0807D39A
	cmp r1, #0x2d
	bne _0807D3A4
_0807D39A:
	movs r0, #8
	ldrsb r0, [r2, r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807D3A4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D36E
	cmp r5, #0x31
	bhi _0807D3B2
	movs r0, #0
	b _0807D3B4
_0807D3B2:
	movs r0, #1
_0807D3B4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D3BC
sub_0807D3BC: @ 0x0807D3BC
	push {lr}
	sub sp, #4
	movs r1, #3
	str r1, [sp]
	movs r1, #0x10
	movs r2, #1
	movs r3, #2
	bl StartUnkTrapAnim
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_0807D3D4
sub_0807D3D4: @ 0x0807D3D4
	push {lr}
	movs r0, #0x25
	bl GetUnitFromCharId
	ldrb r1, [r0, #0x11]
	ldrb r0, [r0, #0x10]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807D3F2
	cmp r1, #2
	bhi _0807D3F2
	movs r0, #1
	b _0807D3F4
_0807D3F2:
	movs r0, #0
_0807D3F4:
	pop {r1}
	bx r1

	thumb_func_start sub_0807D3F8
sub_0807D3F8: @ 0x0807D3F8
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807D410 @ =0x00004E1F
	cmp r0, r1
	ble _0807D408
	movs r2, #1
_0807D408:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807D410: .4byte 0x00004E1F

	thumb_func_start sub_0807D414
sub_0807D414: @ 0x0807D414
	push {lr}
	ldr r0, _0807D420 @ =0x00004E20
	bl sub_08079C48
	pop {r0}
	bx r0
	.align 2, 0
_0807D420: .4byte 0x00004E20

	thumb_func_start sub_0807D424
sub_0807D424: @ 0x0807D424
	push {lr}
	movs r0, #7
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D442
	movs r0, #0xd
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D442
	movs r0, #1
	b _0807D444
_0807D442:
	movs r0, #0
_0807D444:
	pop {r1}
	bx r1

	thumb_func_start sub_0807D448
sub_0807D448: @ 0x0807D448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r2, #0
	movs r6, #0
	movs r4, #1
_0807D458:
	adds r0, r4, #0
	str r2, [sp]
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	ldr r2, [sp]
	cmp r5, #0
	beq _0807D4A8
	ldr r0, [r5]
	cmp r0, #0
	beq _0807D4A8
	ldr r0, [r5, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807D4A8
	lsls r0, r2, #1
	mov r2, r8
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0807D4A6
	adds r4, r1, #0
_0807D488:
	ldr r0, [r5]
	ldrh r1, [r4]
	ldrb r0, [r0, #4]
	ldrb r2, [r4]
	cmp r0, r2
	bne _0807D49E
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl PidStatsGetExpGain
	adds r6, r6, r0
_0807D49E:
	adds r4, #2
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807D488
_0807D4A6:
	movs r2, #0
_0807D4A8:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _0807D458
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D4C0
sub_0807D4C0: @ 0x0807D4C0
	push {r4, lr}
	ldr r0, _0807D4DC @ =0x08CB8984
	bl sub_0807D448
	adds r4, r0, #0
	ldr r0, _0807D4E0 @ =0x08CB898E
	bl sub_0807D448
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhi _0807D4E4
	movs r0, #0
	b _0807D4E6
	.align 2, 0
_0807D4DC: .4byte 0x08CB8984
_0807D4E0: .4byte 0x08CB898E
_0807D4E4:
	movs r0, #1
_0807D4E6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D4EC
sub_0807D4EC: @ 0x0807D4EC
	push {r4, lr}
	movs r0, #9
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D50C
	adds r4, #1
_0807D50C:
	movs r0, #0xb
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D51A
	adds r4, #1
_0807D51A:
	movs r0, #0
	cmp r4, #1
	bgt _0807D522
	movs r0, #1
_0807D522:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D528
sub_0807D528: @ 0x0807D528
	push {r4, lr}
	movs r0, #9
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D548
	adds r4, #1
_0807D548:
	movs r0, #0xb
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D556
	adds r4, #1
_0807D556:
	movs r0, #0xc
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D564
	adds r4, #1
_0807D564:
	movs r0, #0xd
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D572
	adds r4, #1
_0807D572:
	movs r0, #0xe
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D580
	adds r4, #1
_0807D580:
	movs r0, #0xf
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D58E
	adds r4, #1
_0807D58E:
	movs r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D59C
	adds r4, #1
_0807D59C:
	movs r0, #0x11
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D5AA
	adds r4, #1
_0807D5AA:
	cmp r4, #3
	ble _0807D5B2
	movs r0, #0
	b _0807D5B4
_0807D5B2:
	movs r0, #1
_0807D5B4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807D5BC
sub_0807D5BC: @ 0x0807D5BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D600
	movs r0, #0x5b
	bl GetUnitFromCharId
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r3, _0807D608 @ =0x0202BBB8
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	lsls r2, r2, #4
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	subs r0, #8
	subs r2, r2, r0
	adds r0, r4, #0
	bl sub_08020D6C
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
_0807D600:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D608: .4byte 0x0202BBB8

	thumb_func_start sub_0807D60C
sub_0807D60C: @ 0x0807D60C
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0807D63E
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0807D634 @ =0x0202BBB8
	ands r0, r2
	cmp r0, #0
	beq _0807D638
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	b _0807D63C
	.align 2, 0
_0807D634: .4byte 0x0202BBB8
_0807D638:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
_0807D63C:
	strh r0, [r1, #0xc]
_0807D63E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D644
sub_0807D644: @ 0x0807D644
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D674
	ldr r0, _0807D678 @ =0x08CBB47C
	movs r1, #0
	bl Proc_Start
	ldr r1, _0807D67C @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x2c]
	ldr r0, _0807D680 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807D674
	ldr r0, _0807D684 @ =0x0000026A
	bl m4aSongNumStart
_0807D674:
	pop {r0}
	bx r0
	.align 2, 0
_0807D678: .4byte 0x08CBB47C
_0807D67C: .4byte 0x0202BBB8
_0807D680: .4byte 0x0202BBF8
_0807D684: .4byte 0x0000026A

	thumb_func_start sub_0807D688
sub_0807D688: @ 0x0807D688
	push {lr}
	ldr r0, _0807D6AC @ =0x08CBB47C
	bl Proc_EndEach
	ldr r2, _0807D6B0 @ =0x0202BBB8
	ldrh r0, [r2, #0xc]
	adds r0, #0xf
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2, #0xc]
	movs r0, #4
	bl Sound_FadeOutSE
	pop {r0}
	bx r0
	.align 2, 0
_0807D6AC: .4byte 0x08CBB47C
_0807D6B0: .4byte 0x0202BBB8

	thumb_func_start sub_0807D6B4
sub_0807D6B4: @ 0x0807D6B4
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807D6D6
	adds r0, r4, #0
	bl Proc_Break
_0807D6D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D6DC
sub_0807D6DC: @ 0x0807D6DC
	bx lr
	.align 2, 0

	thumb_func_start sub_0807D6E0
sub_0807D6E0: @ 0x0807D6E0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_0807D6B4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807D6F4
sub_0807D6F4: @ 0x0807D6F4
	push {lr}
	ldr r2, _0807D70C @ =0x02022240
	movs r1, #0xff
	strb r1, [r2, #0x1b]
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	bl sub_0807D6B4
	pop {r0}
	bx r0
	.align 2, 0
_0807D70C: .4byte 0x02022240

	thumb_func_start sub_0807D710
sub_0807D710: @ 0x0807D710
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D75E
	movs r0, #0x85
	bl GetUnitFromCharId
	adds r4, r0, #0
	ldrb r0, [r4, #0xb]
	adds r0, #0x40
	strb r0, [r4, #0xb]
	bl RefreshUnitSprites
	ldrb r0, [r4, #0xb]
	subs r0, #0x40
	strb r0, [r4, #0xb]
	ldr r0, _0807D764 @ =0x02022C00
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	bl ColorFadeSetupFromColorToWhite
	bl ColorFadeInit
	ldr r1, _0807D768 @ =0x02022240
	movs r0, #1
	strb r0, [r1, #0x1b]
	ldr r0, _0807D76C @ =0x08CBB48C
	adds r1, r5, #0
	bl Proc_Start
_0807D75E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D764: .4byte 0x02022C00
_0807D768: .4byte 0x02022240
_0807D76C: .4byte 0x08CBB48C

	thumb_func_start sub_0807D770
sub_0807D770: @ 0x0807D770
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D784
	ldr r0, _0807D788 @ =0x08CBB48C
	bl Proc_BreakEach
_0807D784:
	pop {r0}
	bx r0
	.align 2, 0
_0807D788: .4byte 0x08CBB48C

	thumb_func_start sub_0807D78C
sub_0807D78C: @ 0x0807D78C
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D7AE
	movs r0, #0x84
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x56
	bl GetClassData
	str r0, [r4, #4]
	bl RefreshUnitSprites
_0807D7AE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807D7B4
sub_0807D7B4: @ 0x0807D7B4
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D7D8
	movs r0, #0x84
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	bl StartMuDeathFade
_0807D7D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807D7E0
sub_0807D7E0: @ 0x0807D7E0
	push {lr}
	movs r0, #0x70
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D7FC
	ldr r0, _0807D7F8 @ =0x08CDB3C8
	bl LoadUnit
	b _0807D802
	.align 2, 0
_0807D7F8: .4byte 0x08CDB3C8
_0807D7FC:
	ldr r0, _0807D808 @ =0x08CDB3E8
	bl LoadUnit
_0807D802:
	pop {r0}
	bx r0
	.align 2, 0
_0807D808: .4byte 0x08CDB3E8

	thumb_func_start sub_0807D80C
sub_0807D80C: @ 0x0807D80C
	push {r4, lr}
	ldr r0, _0807D830 @ =0x0203A3F0
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetPlayerLeaderUnitId
	cmp r4, r0
	beq _0807D838
	ldr r0, _0807D834 @ =0x0203A470
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetPlayerLeaderUnitId
	cmp r4, r0
	beq _0807D838
	movs r0, #0
	b _0807D83A
	.align 2, 0
_0807D830: .4byte 0x0203A3F0
_0807D834: .4byte 0x0203A470
_0807D838:
	movs r0, #1
_0807D83A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807D840
sub_0807D840: @ 0x0807D840
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D884
	movs r0, #0x44
	bl GetUnitFromCharId
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r3, _0807D88C @ =0x0202BBB8
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	lsls r2, r2, #4
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	subs r0, #8
	subs r2, r2, r0
	adds r0, r4, #0
	bl sub_08020D6C
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
_0807D884:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D88C: .4byte 0x0202BBB8

	thumb_func_start sub_0807D890
sub_0807D890: @ 0x0807D890
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D8C6
	ldr r0, _0807D8D0 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r5, [r0, r1]
	movs r1, #0x7f
	subs r1, r1, r5
	movs r2, #0xe
	ldrsh r4, [r0, r2]
	movs r2, #0x18
	subs r2, r2, r4
	movs r3, #0x87
	subs r3, r3, r5
	movs r0, #0x30
	subs r0, r0, r4
	str r0, [sp]
	adds r0, r6, #0
	bl StartEmitStarsAnim
_0807D8C6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D8D0: .4byte 0x0202BBB8

	thumb_func_start sub_0807D8D4
sub_0807D8D4: @ 0x0807D8D4
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D8E6
	bl ClearEmitedStars
_0807D8E6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EventCall_SwingSwordfx
EventCall_SwingSwordfx: @ 0x0807D8EC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D904
	adds r0, r2, #0
	bl StartSwingSwordfx
_0807D904:
	pop {r0}
	bx r0

	thumb_func_start EventCall_NinianReturnToHuman
EventCall_NinianReturnToHuman: @ 0x0807D908
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D93E
	movs r0, #0xda
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl NinianStartTransformToHunman
	adds r0, r4, #0
	bl ClearUnit
	bl RefreshUnitSprites
	bl RefreshEntityMaps
_0807D93E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventCall_HideNinianDragonSMS
EventCall_HideNinianDragonSMS: @ 0x0807D944
	push {lr}
	movs r0, #0xda
	bl GetUnitFromCharId
	bl HideUnitSprite
	pop {r0}
	bx r0

	thumb_func_start EventCall_NinianDragonTrembling
EventCall_NinianDragonTrembling: @ 0x0807D954
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	cmp r6, #0
	bne _0807D9AA
	movs r0, #0xda
	bl GetUnitFromCharId
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #4
	ldr r2, _0807D9B4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	adds r4, #8
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	lsls r5, r5, #4
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	subs r5, r5, r0
	ldr r0, _0807D9B8 @ =0x081BE108
	ldr r1, _0807D9BC @ =0x06013000
	bl Decompress
	ldr r0, _0807D9C0 @ =0x081BE4D8
	ldr r3, _0807D9C4 @ =0x0000C180
	str r6, [sp]
	str r6, [sp, #4]
	adds r1, r4, #0
	adds r2, r5, #0
	bl StartSpriteAnimProc
	ldr r0, _0807D9C8 @ =EventCall_HideNinianDragonSMS
	movs r1, #1
	bl CallDelayed
_0807D9AA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9B4: .4byte 0x0202BBB8
_0807D9B8: .4byte 0x081BE108
_0807D9BC: .4byte 0x06013000
_0807D9C0: .4byte 0x081BE4D8
_0807D9C4: .4byte 0x0000C180
_0807D9C8: .4byte EventCall_HideNinianDragonSMS

	thumb_func_start EventCall_PutFallNinian
EventCall_PutFallNinian: @ 0x0807D9CC
	push {lr}
	movs r0, #0xda
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0807D9E0
	bl ShowUnitSprite
	bl EndEachSpriteAnimProc
_0807D9E0:
	pop {r0}
	bx r0

	thumb_func_start sub_0807D9E4
sub_0807D9E4: @ 0x0807D9E4
	push {r4, lr}
	movs r0, #9
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl sub_08079D20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DA0C
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x13
	bne _0807DA0C
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _0807DA0C
	movs r0, #1
	b _0807DA0E
_0807DA0C:
	movs r0, #0
_0807DA0E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0807DA14
sub_0807DA14: @ 0x0807DA14
	push {r4, r5, r6, lr}
	movs r0, #9
	bl GetUnitFromCharId
	adds r6, r0, #0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0807DA5E
_0807DA26:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807DA46
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DA46
	movs r0, #1
	b _0807DA60
_0807DA46:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bhi _0807DA5E
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0807DA26
_0807DA5E:
	movs r0, #0
_0807DA60:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DA68
sub_0807DA68: @ 0x0807DA68
	push {lr}
	movs r0, #0x37
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807DA86
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807DA86
	movs r0, #1
	b _0807DA88
_0807DA86:
	movs r0, #0
_0807DA88:
	pop {r1}
	bx r1

	thumb_func_start sub_0807DA8C
sub_0807DA8C: @ 0x0807DA8C
	push {lr}
	movs r0, #9
	bl GetUnitFromCharId
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807DAA0
	movs r1, #1
_0807DAA0:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DAA8
sub_0807DAA8: @ 0x0807DAA8
	push {lr}
	movs r0, #0x37
	bl GetUnitFromCharId
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807DABC
	movs r1, #1
_0807DABC:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DAC4
sub_0807DAC4: @ 0x0807DAC4
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r6, #9
	movs r5, #1
_0807DACC:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DB64
	ldr r0, [r4]
	cmp r0, #0
	beq _0807DB64
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _0807DB64
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #6
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl UnitKill
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _0807DB5C @ =0x0203A3F0
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807DB10
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807DB10:
	ldr r0, _0807DB60 @ =0x0203A470
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _0807DB22
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_0807DB22:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807DB3A
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_0807DB3A:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807DB6A
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _0807DB6A
	.align 2, 0
_0807DB5C: .4byte 0x0203A3F0
_0807DB60: .4byte 0x0203A470
_0807DB64:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807DACC
_0807DB6A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807DB74
sub_0807DB74: @ 0x0807DB74
	push {lr}
	bl sub_0807A304
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DB98
	movs r1, #0
	ldr r0, _0807DB94 @ =0x0202E3E0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #5]
	cmp r0, #0x25
	bne _0807DB90
	movs r1, #1
_0807DB90:
	adds r0, r1, #0
	b _0807DB9A
	.align 2, 0
_0807DB94: .4byte 0x0202E3E0
_0807DB98:
	movs r0, #0
_0807DB9A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DBA0
sub_0807DBA0: @ 0x0807DBA0
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r1, _0807DBD8 @ =0x083FC924
	mov r0, sp
	movs r2, #0x14
	bl memcpy
	movs r3, #0
	ldr r0, _0807DBDC @ =0x0202E3DC
	ldr r4, [r0]
	mov r2, sp
	movs r5, #0xc0
_0807DBB8:
	movs r0, #1
	ldrsb r0, [r2, r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807DBE0
	ands r0, r5
	cmp r0, #0
	bne _0807DBE0
	movs r0, #1
	b _0807DBEA
	.align 2, 0
_0807DBD8: .4byte 0x083FC924
_0807DBDC: .4byte 0x0202E3DC
_0807DBE0:
	adds r2, #2
	adds r3, #1
	cmp r3, #8
	ble _0807DBB8
	movs r0, #0
_0807DBEA:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DBF4
sub_0807DBF4: @ 0x0807DBF4
	push {r4, lr}
	movs r0, #0x27
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x8c
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807DC14
sub_0807DC14: @ 0x0807DC14
	push {lr}
	adds r0, #0x60
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strh r1, [r0, #4]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	pop {r0}
	bx r0

	thumb_func_start sub_0807DC30
sub_0807DC30: @ 0x0807DC30
	adds r3, r0, #0
	ldr r1, _0807DC48 @ =0x08CBF3AC
	ldr r0, [r1]
	cmp r0, #0
	beq _0807DC56
	adds r2, r1, #0
_0807DC3C:
	ldr r0, [r2]
	cmp r3, r0
	bne _0807DC4C
	ldr r0, [r1, #4]
	b _0807DC58
	.align 2, 0
_0807DC48: .4byte 0x08CBF3AC
_0807DC4C:
	adds r1, #8
	adds r2, #8
	ldr r0, [r1]
	cmp r0, #0
	bne _0807DC3C
_0807DC56:
	movs r0, #0
_0807DC58:
	bx lr
	.align 2, 0

	thumb_func_start sub_0807DC5C
sub_0807DC5C: @ 0x0807DC5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x60
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807DC7A
	bl EndTalk
	movs r0, #0
	b _0807DD8E
_0807DC7A:
	bl IsTalkActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0807DC88
	b _0807DD8C
_0807DC88:
	ldrb r0, [r5]
	cmp r0, #1
	beq _0807DCF0
	cmp r0, #1
	bgt _0807DC98
	cmp r0, #0
	beq _0807DCA2
	b _0807DD8C
_0807DC98:
	cmp r0, #2
	beq _0807DD18
	cmp r0, #3
	beq _0807DD56
	b _0807DD8C
_0807DCA2:
	movs r6, #1
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0807DCE4
	adds r6, r0, #0
	b _0807DCE4
_0807DCAE:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DCE2
	ldr r2, [r4]
	cmp r2, #0
	beq _0807DCE2
	ldr r0, [r4, #0xc]
	ldr r1, _0807DCEC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807DCE2
	ldrb r0, [r2, #4]
	strb r0, [r5, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0807DCE2
	cmp r0, #2
	beq _0807DCE2
	cmp r0, #0x2d
	beq _0807DCE2
	cmp r0, #0x26
	bne _0807DD48
_0807DCE2:
	adds r6, #1
_0807DCE4:
	cmp r6, #0x3f
	ble _0807DCAE
	movs r0, #0
	b _0807DD8E
	.align 2, 0
_0807DCEC: .4byte 0x0001000C
_0807DCF0:
	ldrb r0, [r5, #2]
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DD38
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r6, #0
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	b _0807DD38
_0807DD18:
	ldr r4, _0807DD40 @ =0x08B907C0
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0807DD38
	bl ClearTalkBubble
	ldr r1, _0807DD44 @ =StartFaceFadeOut
	adds r0, r4, #0
	bl Proc_ForEach
	adds r0, r6, #0
	movs r1, #8
	bl StartTemporaryLock
_0807DD38:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0807DD8C
	.align 2, 0
_0807DD40: .4byte 0x08B907C0
_0807DD44: .4byte StartFaceFadeOut
_0807DD48:
	ldrb r0, [r5, #2]
	bl sub_0807DC30
	strh r0, [r5, #4]
	adds r0, r6, #1
	strb r0, [r5, #1]
	b _0807DD38
_0807DD56:
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _0807DD8A
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl ClearPutTalkText
	bl ClearTalk
	ldrh r0, [r5, #4]
	bl DecodeMsg
	adds r2, r0, #0
	movs r0, #0xa
	movs r1, #0xe
	movs r3, #0
	bl StartTalkExt
	movs r0, #1
	bl SetTalkPrintColor
	movs r0, #1
	bl SetActiveTalkFace
_0807DD8A:
	strb r4, [r5]
_0807DD8C:
	movs r0, #1
_0807DD8E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0807DD94
sub_0807DD94: @ 0x0807DD94
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0807DDC4 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0807DDC8 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0807DDCC @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807DDC4: .4byte 0x01000008
_0807DDC8: .4byte 0x02022C60
_0807DDCC: .4byte 0x02023460

	thumb_func_start sub_0807DDD0
sub_0807DDD0: @ 0x0807DDD0
	push {lr}
	bl sub_0800F0C8
	bl SyncUnitDeploymentState
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807DDEC
sub_0807DDEC: @ 0x0807DDEC
	push {lr}
	ldr r0, _0807DE10 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807DE14
	bl sub_0807A1F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DE14
	movs r0, #7
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DE14
	movs r0, #1
	b _0807DE16
	.align 2, 0
_0807DE10: .4byte 0x0202BBF8
_0807DE14:
	movs r0, #0
_0807DE16:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807DE1C
sub_0807DE1C: @ 0x0807DE1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r0, sp, #0x10
	ldr r1, _0807DEA0 @ =0x083FC938
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
	movs r7, #0
	movs r6, #1
	add r5, sp, #0x10
_0807DE36:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807DE8C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807DE8C
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807DE8C
	cmp r4, #2
	beq _0807DE8C
	cmp r4, #0x2d
	beq _0807DE8C
	cmp r4, #0x26
	beq _0807DE8C
	cmp r4, #0x27
	beq _0807DE8C
	ldr r1, [r1, #0xc]
	ldr r0, _0807DEA4 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807DE8C
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	str r2, [sp]
	movs r0, #1
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807DE92
_0807DE8C:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807DE36
_0807DE92:
	bl RefreshUnitSprites
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DEA0: .4byte 0x083FC938
_0807DEA4: .4byte 0x0001000C

	thumb_func_start sub_0807DEA8
sub_0807DEA8: @ 0x0807DEA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	add r2, sp, #0x1c
	adds r1, r2, #0
	ldr r0, _0807DECC @ =0x083FC954
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, _0807DED0 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807DED4
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #1
	b _0807DEDE
	.align 2, 0
_0807DECC: .4byte 0x083FC954
_0807DED0: .4byte 0x0202BBF8
_0807DED4:
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #2
_0807DEDE:
	str r0, [sp, #0x18]
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807DF1C
	adds r4, r2, #0
	add r7, sp, #0x10
	movs r5, #2
_0807DEF4:
	ldm r7!, {r0}
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #1
	ldrsb r3, [r4, r3]
	movs r1, #2
	ldrsb r1, [r4, r1]
	str r1, [sp]
	movs r1, #3
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	bl EventLoadUnit
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807DEF4
_0807DF1C:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Finial_EventLoadAllies1
Finial_EventLoadAllies1: @ 0x0807DF24
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	add r0, sp, #0x10
	ldr r1, _0807DFD4 @ =0x083FC960
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807DFCC
	add r0, sp, #0x10
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r3, #1
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x27
	movs r1, #0
	bl EventLoadUnit
	add r0, sp, #0x10
	movs r2, #4
	ldrsb r2, [r0, r2]
	movs r3, #5
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	bl EventLoadUnit
	ldr r1, _0807DFD8 @ =0x0202BBF8
	adds r1, #0x2b
	movs r4, #1
	adds r0, r4, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807DFCC
	add r0, sp, #0x10
	movs r2, #8
	ldrsb r2, [r0, r2]
	movs r3, #9
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xcd
	movs r1, #0x51
	bl EventLoadUnit
_0807DFCC:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DFD4: .4byte 0x083FC960
_0807DFD8: .4byte 0x0202BBF8

	thumb_func_start Finial_EventLoadAllies2
Finial_EventLoadAllies2: @ 0x0807DFDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	add r1, sp, #0x10
	ldr r0, _0807E07C @ =0x083FC96C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E070
	movs r6, #1
	add r5, sp, #0x10
_0807E008:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807E066
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E066
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807E066
	cmp r4, #2
	beq _0807E066
	cmp r4, #0x2d
	beq _0807E066
	cmp r4, #0x26
	beq _0807E066
	cmp r4, #0x27
	beq _0807E066
	ldr r1, [r1, #0xc]
	ldr r0, _0807E080 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807E066
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	movs r0, #2
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #3
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r7, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	movs r0, #1
	add r8, r0
	mov r2, r8
	cmp r2, #3
	bgt _0807E06C
_0807E066:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807E008
_0807E06C:
	bl RefreshUnitSprites
_0807E070:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E07C: .4byte 0x083FC96C
_0807E080: .4byte 0x0001000C

	thumb_func_start Finial_EventLoadAllies3
Finial_EventLoadAllies3: @ 0x0807E084
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	mov r8, r0
	movs r7, #0
	add r0, sp, #0x10
	ldr r1, _0807E120 @ =0x083FC97C
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	mov r1, r8
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E114
	movs r6, #1
	mov r5, sp
_0807E0AA:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807E10A
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E10A
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807E10A
	cmp r4, #2
	beq _0807E10A
	cmp r4, #0x2d
	beq _0807E10A
	cmp r4, #0x26
	beq _0807E10A
	cmp r4, #0x27
	beq _0807E10A
	ldr r1, [r1, #0xc]
	ldr r0, _0807E124 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807E10A
	cmp r7, #3
	ble _0807E102
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	movs r0, #2
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #3
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
_0807E102:
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807E110
_0807E10A:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807E0AA
_0807E110:
	bl RefreshUnitSprites
_0807E114:
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E120: .4byte 0x083FC97C
_0807E124: .4byte 0x0001000C

	thumb_func_start Finial_EventLoadAllies4
Finial_EventLoadAllies4: @ 0x0807E128
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	add r2, sp, #0x1c
	adds r1, r2, #0
	ldr r0, _0807E15C @ =0x083FC988
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E1A2
	ldr r0, _0807E160 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807E164
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #1
	b _0807E16E
	.align 2, 0
_0807E15C: .4byte 0x083FC988
_0807E160: .4byte 0x0202BBF8
_0807E164:
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #2
_0807E16E:
	str r0, [sp, #0x18]
	adds r4, r2, #0
	add r7, sp, #0x10
	movs r5, #2
_0807E176:
	ldm r7!, {r0}
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #1
	ldrsb r3, [r4, r3]
	movs r1, #2
	ldrsb r1, [r4, r1]
	str r1, [sp]
	movs r1, #3
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	bl EventLoadUnit
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807E176
	bl RefreshUnitSprites
_0807E1A2:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E1AC
sub_0807E1AC: @ 0x0807E1AC
	push {lr}
	movs r0, #0x27
	bl GetUnitFromCharId
	movs r1, #0
	bl StartStatusHealEffect
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E1C0
sub_0807E1C0: @ 0x0807E1C0
	push {r4, r5, lr}
	ldr r5, _0807E240 @ =0x08CE08F8
	ldr r0, _0807E244 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r0, #0x27
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E248 @ =0x08CE0978
	bl FakeLoadUnit
	movs r0, #1
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E24C @ =0x08CE0998
	bl FakeLoadUnit
	movs r0, #1
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E250 @ =0x08CE0898
	bl FakeLoadUnit
	movs r0, #2
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E254 @ =0x08CE08B8
	bl FakeLoadUnit
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r0, _0807E258 @ =0x08CE08D8
	bl FakeLoadUnit
	movs r4, #1
_0807E216:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	bne _0807E224
	b _0807E32E
_0807E224:
	ldr r0, [r2]
	cmp r0, #0
	bne _0807E22C
	b _0807E32E
_0807E22C:
	ldrb r0, [r0, #4]
	subs r0, #1
	cmp r0, #0x2c
	bhi _0807E314
	lsls r0, r0, #2
	ldr r1, _0807E25C @ =_0807E260
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E240: .4byte 0x08CE08F8
_0807E244: .4byte 0x0202E3F4
_0807E248: .4byte 0x08CE0978
_0807E24C: .4byte 0x08CE0998
_0807E250: .4byte 0x08CE0898
_0807E254: .4byte 0x08CE08B8
_0807E258: .4byte 0x08CE08D8
_0807E25C: .4byte _0807E260
_0807E260: @ jump table
	.4byte _0807E32E @ case 0
	.4byte _0807E32E @ case 1
	.4byte _0807E314 @ case 2
	.4byte _0807E314 @ case 3
	.4byte _0807E314 @ case 4
	.4byte _0807E314 @ case 5
	.4byte _0807E314 @ case 6
	.4byte _0807E314 @ case 7
	.4byte _0807E314 @ case 8
	.4byte _0807E314 @ case 9
	.4byte _0807E314 @ case 10
	.4byte _0807E314 @ case 11
	.4byte _0807E314 @ case 12
	.4byte _0807E314 @ case 13
	.4byte _0807E314 @ case 14
	.4byte _0807E314 @ case 15
	.4byte _0807E314 @ case 16
	.4byte _0807E314 @ case 17
	.4byte _0807E314 @ case 18
	.4byte _0807E314 @ case 19
	.4byte _0807E314 @ case 20
	.4byte _0807E314 @ case 21
	.4byte _0807E314 @ case 22
	.4byte _0807E314 @ case 23
	.4byte _0807E314 @ case 24
	.4byte _0807E314 @ case 25
	.4byte _0807E314 @ case 26
	.4byte _0807E314 @ case 27
	.4byte _0807E314 @ case 28
	.4byte _0807E314 @ case 29
	.4byte _0807E314 @ case 30
	.4byte _0807E314 @ case 31
	.4byte _0807E314 @ case 32
	.4byte _0807E314 @ case 33
	.4byte _0807E314 @ case 34
	.4byte _0807E314 @ case 35
	.4byte _0807E314 @ case 36
	.4byte _0807E32E @ case 37
	.4byte _0807E32E @ case 38
	.4byte _0807E314 @ case 39
	.4byte _0807E314 @ case 40
	.4byte _0807E314 @ case 41
	.4byte _0807E314 @ case 42
	.4byte _0807E314 @ case 43
	.4byte _0807E32E @ case 44
_0807E314:
	ldr r0, [r2, #0xc]
	ldr r1, _0807E344 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807E32E
	adds r0, r5, #0
	adds r1, r2, #0
	bl FakeLoadUnit
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807E336
_0807E32E:
	adds r4, #1
	cmp r4, #0x3f
	bgt _0807E336
	b _0807E216
_0807E336:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E344: .4byte 0x0001000C

	thumb_func_start sub_0807E348
sub_0807E348: @ 0x0807E348
	push {r4, r5, lr}
	ldr r5, _0807E3A4 @ =0x08CE09B8
	ldr r0, _0807E3A8 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #1
_0807E358:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E38E
	ldr r0, [r2]
	cmp r0, #0
	beq _0807E38E
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	beq _0807E38E
	cmp r0, #0x27
	beq _0807E38E
	ldr r0, [r2, #0xc]
	ldr r1, _0807E3AC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807E38E
	adds r0, r5, #0
	adds r1, r2, #0
	bl FakeLoadUnit
	adds r5, #0x10
	ldrb r0, [r5]
	cmp r0, #0
	beq _0807E394
_0807E38E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807E358
_0807E394:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3A4: .4byte 0x08CE09B8
_0807E3A8: .4byte 0x0202E3F4
_0807E3AC: .4byte 0x0001000C

	thumb_func_start sub_0807E3B0
sub_0807E3B0: @ 0x0807E3B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807E3D0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08011DAC
	b _0807E3D6
_0807E3D0:
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807E3D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807E3DC
sub_0807E3DC: @ 0x0807E3DC
	push {lr}
	ldr r0, _0807E3F4 @ =0x08CE0B18
	movs r1, #0x27
	bl sub_0807E3B0
	ldr r0, _0807E3F8 @ =0x08CE0B38
	movs r1, #0x26
	bl sub_0807E3B0
	pop {r0}
	bx r0
	.align 2, 0
_0807E3F4: .4byte 0x08CE0B18
_0807E3F8: .4byte 0x08CE0B38

	thumb_func_start sub_0807E3FC
sub_0807E3FC: @ 0x0807E3FC
	push {lr}
	sub sp, #0x10
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0x12
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x12
	bl EventLoadUnit
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start ForceDisplayDragonSprite
ForceDisplayDragonSprite: @ 0x0807E420
	push {lr}
	movs r0, #0x25
	bl GetUnitFromCharId
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E436
	ldr r0, [r2, #0xc]
	ldr r1, _0807E43C @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0807E436:
	pop {r0}
	bx r0
	.align 2, 0
_0807E43C: .4byte 0xFFFEFFFF

	thumb_func_start EventDragonsSpritefx_Init
EventDragonsSpritefx_Init: @ 0x0807E440
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x6b
	movs r0, #0
	strb r0, [r1]
	movs r3, #0
	movs r4, #0
	subs r1, #0x33
	adds r5, r2, #0
	adds r5, #0x2c
	ldr r0, _0807E478 @ =0x0000FFFF
	adds r6, r0, #0
	adds r2, #0x5c
_0807E45C:
	stm r5!, {r4}
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	strh r4, [r2]
	adds r1, #2
	adds r2, #2
	adds r3, #1
	cmp r3, #2
	ble _0807E45C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E478: .4byte 0x0000FFFF

	thumb_func_start EventDragonsSpritefx_End
EventDragonsSpritefx_End: @ 0x0807E47C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r4, #0x2c
	movs r5, #2
_0807E484:
	ldr r0, [r4]
	cmp r0, #0
	beq _0807E48E
	bl EndSpriteAnimProc
_0807E48E:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807E484
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventDragonsSpritefx_Loop
EventDragonsSpritefx_Loop: @ 0x0807E49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	movs r5, #0
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	mov r1, r8
	adds r1, #0x2c
	str r1, [sp, #0xc]
_0807E4B8:
	ldr r2, [sp, #0xc]
	ldr r0, [r2]
	cmp r0, #0
	bne _0807E4C2
	b _0807E5DA
_0807E4C2:
	mov r0, r8
	adds r0, #0x38
	add r0, sl
	mov sb, r0
	mov r0, r8
	adds r0, #0x44
	add r0, sl
	str r0, [sp, #4]
	mov r4, r8
	adds r4, #0x3e
	mov r3, r8
	adds r3, #0x4a
	str r3, [sp, #8]
	mov r6, sb
	ldrh r6, [r6]
	ldrh r7, [r0]
	cmp r6, r7
	bne _0807E4F6
	mov r0, sl
	adds r1, r4, r0
	adds r0, r3, #0
	add r0, sl
	ldrh r2, [r1]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0807E598
_0807E4F6:
	mov r0, r8
	adds r0, #0x56
	mov r3, sl
	adds r5, r0, r3
	subs r0, #6
	adds r1, r0, r3
	ldrh r6, [r5]
	ldrh r7, [r1]
	adds r0, r6, r7
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	mov ip, r2
	cmp r0, ip
	ble _0807E51C
	mov r3, ip
	strh r3, [r5]
_0807E51C:
	movs r6, #0
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bne _0807E528
	mov r7, ip
	strh r7, [r5]
_0807E528:
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	mov r6, ip
	subs r3, r6, r2
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r7, [sp, #4]
	movs r6, #0
	ldrsh r0, [r7, r6]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0807E54A
	adds r1, #0xff
_0807E54A:
	asrs r6, r1, #8
	mov r0, sl
	adds r7, r4, r0
	movs r1, #0
	ldrsh r0, [r7, r1]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r3, [sp, #8]
	add r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0807E56A
	adds r1, #0xff
_0807E56A:
	asrs r4, r1, #8
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, ip
	bne _0807E594
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	mov r1, sb
	strh r0, [r1]
	ldrh r0, [r3]
	strh r0, [r7]
	ldr r2, [sp, #0xc]
	ldr r0, [r2]
	ldr r0, [r0, #0x50]
	mov r1, r8
	adds r1, #0x62
	ldr r3, [sp]
	adds r1, r1, r3
	ldrb r1, [r1]
	bl SetSpriteAnimId
_0807E594:
	movs r5, #1
	b _0807E5A2
_0807E598:
	mov r4, sb
	movs r7, #0
	ldrsh r6, [r4, r7]
	movs r0, #0
	ldrsh r4, [r1, r0]
_0807E5A2:
	ldr r1, _0807E634 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r6, r6, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r4, r4, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r4, r0
	bge _0807E5BA
	movs r4, #0xcc
_0807E5BA:
	ldr r0, _0807E638 @ =0x000001FF
	ands r6, r0
	movs r0, #0xff
	ands r4, r0
	ldr r7, [sp, #0xc]
	ldr r0, [r7]
	mov r1, r8
	adds r1, #0x5c
	add r1, sl
	ldrh r1, [r1]
	adds r2, r1, r4
	adds r1, r6, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl SetSpriteAnimProcParameters
_0807E5DA:
	movs r0, #2
	add sl, r0
	ldr r1, [sp, #0xc]
	adds r1, #4
	str r1, [sp, #0xc]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp]
	cmp r2, #2
	bgt _0807E5F0
	b _0807E4B8
_0807E5F0:
	cmp r5, #0
	beq _0807E622
	mov r2, r8
	adds r2, #0x6b
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x18
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807E622
	ldr r0, _0807E63C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E622
	movs r0, #0xb8
	lsls r0, r0, #2
	bl m4aSongNumStart
_0807E622:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E634: .4byte 0x0202BBB8
_0807E638: .4byte 0x000001FF
_0807E63C: .4byte 0x0202BBF8

	thumb_func_start StartEventDragonsSpriteDeamon
StartEventDragonsSpriteDeamon: @ 0x0807E640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E66C @ =0x08CBFC74
	bl Proc_Start
	adds r0, #0x6a
	strb r4, [r0]
	cmp r4, #0
	bne _0807E65A
	ldr r0, _0807E670 @ =0x081BEFE4
	ldr r1, _0807E674 @ =0x06013000
	bl Decompress
_0807E65A:
	cmp r4, #1
	bne _0807E666
	ldr r0, _0807E678 @ =0x081C0DE0
	ldr r1, _0807E674 @ =0x06013000
	bl Decompress
_0807E666:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E66C: .4byte 0x08CBFC74
_0807E670: .4byte 0x081BEFE4
_0807E674: .4byte 0x06013000
_0807E678: .4byte 0x081C0DE0

	thumb_func_start sub_0807E67C
sub_0807E67C: @ 0x0807E67C
	push {lr}
	ldr r0, _0807E688 @ =0x08CBFC74
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807E688: .4byte 0x08CBFC74

	thumb_func_start PutFireDragonSpritefx
PutFireDragonSpritefx: @ 0x0807E68C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	mov sb, r3
	ldr r5, [sp, #0x2c]
	ldr r0, _0807E71C @ =0x083FC994
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0807E720 @ =0x08CBFC74
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807E786
	adds r0, #0x62
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
	lsls r0, r5, #1
	mov r2, r8
	adds r5, r0, r2
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _0807E728
	adds r0, r4, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	adds r0, #8
	ldr r0, [r0]
	ldr r3, _0807E724 @ =0x0000A980
	str r5, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	adds r1, r7, #0
	mov r2, sb
	bl StartSpriteAnimProc
	mov r3, r8
	str r0, [r3]
	lsls r2, r6, #1
	adds r1, r4, #0
	adds r1, #0x38
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	strh r7, [r1]
	adds r1, r4, #0
	adds r1, #0x3e
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
	strh r2, [r1]
	b _0807E786
	.align 2, 0
_0807E71C: .4byte 0x083FC994
_0807E720: .4byte 0x08CBFC74
_0807E724: .4byte 0x0000A980
_0807E728:
	ldr r3, [sp, #0x30]
	cmp r3, #0
	bne _0807E738
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	b _0807E786
_0807E738:
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	lsls r2, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0807E75E
	adds r0, r4, #0
	adds r0, #0x3e
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, sb
	beq _0807E786
_0807E75E:
	adds r0, r4, #0
	adds r0, #0x56
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r0, r2
	mov r1, sp
	ldrh r1, [r1, #0x30]
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
_0807E786:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start RemoveFireDragonSpritefx
RemoveFireDragonSpritefx: @ 0x0807E794
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0807E7CC @ =0x08CBFC74
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807E7C4
	lsls r1, r6, #2
	adds r0, #0x2c
	adds r5, r0, r1
	ldr r0, [r5]
	cmp r0, #0
	beq _0807E7C4
	bl EndSpriteAnimProc
	lsls r1, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r1, _0807E7D0 @ =0x0000FFFF
	strh r1, [r0]
	movs r0, #0
	str r0, [r5]
_0807E7C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E7CC: .4byte 0x08CBFC74
_0807E7D0: .4byte 0x0000FFFF

	thumb_func_start sub_0807E7D4
sub_0807E7D4: @ 0x0807E7D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E808 @ =0x08CBFC74
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E800
	lsls r0, r4, #2
	adds r1, r2, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E800
	lsls r0, r4, #1
	adds r1, r2, #0
	adds r1, #0x5c
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
_0807E800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E808: .4byte 0x08CBFC74

	thumb_func_start EventCall_PutFireDragonSprite
EventCall_PutFireDragonSprite: @ 0x0807E80C
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	bl StartEventDragonsSpriteDeamon
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0x98
	movs r3, #0x58
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xf8
	movs r3, #0x58
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Move2ndFireDragon
Move2ndFireDragon: @ 0x0807E854
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0

	thumb_func_start Move3rdFireDragon
Move3rdFireDragon: @ 0x0807E870
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ReputFireDragonSprite
ReputFireDragonSprite: @ 0x0807E88C
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	bl StartEventDragonsSpriteDeamon
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FireDragonSpriteRetreated
FireDragonSpriteRetreated: @ 0x0807E8D4
	push {lr}
	sub sp, #8
	movs r0, #3
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x68
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E8F4
sub_0807E8F4: @ 0x0807E8F4
	push {lr}
	sub sp, #8
	movs r0, #3
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x68
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E914
sub_0807E914: @ 0x0807E914
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #1
	bl StartEventDragonsSpriteDeamon
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x70
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x70
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E95C
sub_0807E95C: @ 0x0807E95C
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E97C
sub_0807E97C: @ 0x0807E97C
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807E99C
sub_0807E99C: @ 0x0807E99C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E9C8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E9B2
	ldr r0, _0807E9CC @ =0x000002FB
	bl m4aSongNumStart
_0807E9B2:
	movs r1, #6
	rsbs r1, r1, #0
	movs r0, #0
	movs r2, #8
	adds r3, r4, #0
	bl StartFlameBreathfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9C8: .4byte 0x0202BBF8
_0807E9CC: .4byte 0x000002FB

	thumb_func_start sub_0807E9D0
sub_0807E9D0: @ 0x0807E9D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E9FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E9E8
	movs r0, #0xbf
	lsls r0, r0, #2
	bl m4aSongNumStart
_0807E9E8:
	movs r0, #1
	movs r1, #2
	movs r2, #8
	adds r3, r4, #0
	bl StartFlameBreathfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9FC: .4byte 0x0202BBF8

	thumb_func_start StartEventDragonsSpriteMovefx
StartEventDragonsSpriteMovefx: @ 0x0807EA00
	push {r4, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DragonFlameImpact_Init
DragonFlameImpact_Init: @ 0x0807EA30
	push {r4, r5, lr}
	movs r1, #0xc0
	str r1, [r0, #0x2c]
	movs r1, #0x98
	str r1, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0807EAC8 @ =0x081C2340
	ldr r1, _0807EACC @ =0x06005000
	bl Decompress
	ldr r0, _0807EAD0 @ =0x081C23C8
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807EAD4 @ =0x02023C60
	ldr r1, _0807EAD8 @ =0x081C25C8
	movs r2, #0x85
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0807EADC @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r2, #0x36
	adds r2, r2, r3
	mov ip, r2
	movs r1, #1
	ldrb r0, [r2]
	orrs r0, r1
	movs r5, #2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	movs r4, #8
	orrs r0, r4
	movs r2, #0x10
	orrs r0, r2
	mov r2, ip
	strb r0, [r2]
	adds r3, #0x37
	ldrb r0, [r3]
	orrs r1, r0
	orrs r1, r5
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAC8: .4byte 0x081C2340
_0807EACC: .4byte 0x06005000
_0807EAD0: .4byte 0x081C23C8
_0807EAD4: .4byte 0x02023C60
_0807EAD8: .4byte 0x081C25C8
_0807EADC: .4byte 0x03002870

	thumb_func_start DragonFlameImpact_Loop
DragonFlameImpact_Loop: @ 0x0807EAE0
	push {r4, r5, lr}
	ldr r2, _0807EB1C @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	ldr r5, [r0, #0x2c]
	subs r5, r5, r1
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	ldr r4, [r0, #0x30]
	subs r4, r4, r1
	adds r4, #8
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	ldrh r2, [r0]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x42
	bl sub_08026250
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB1C: .4byte 0x0202BBB8

	thumb_func_start DragonFlameImpact_End
DragonFlameImpact_End: @ 0x0807EB20
	push {lr}
	ldr r0, _0807EB34 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807EB34: .4byte 0x02023C60

	thumb_func_start sub_0807EB38
sub_0807EB38: @ 0x0807EB38
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807EB48 @ =0x08CBFC94
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807EB48: .4byte 0x08CBFC94

	thumb_func_start sub_0807EB4C
sub_0807EB4C: @ 0x0807EB4C
	push {lr}
	ldr r0, _0807EB58 @ =0x08CBFC94
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807EB58: .4byte 0x08CBFC94

	thumb_func_start EventCall_FireDragonScreamingInPain
EventCall_FireDragonScreamingInPain: @ 0x0807EB5C
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #1
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventCall_FireDragonFellWeakly
EventCall_FireDragonFellWeakly: @ 0x0807EB9C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #2
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	adds r0, r6, #0
	bl StartEventQuakefx
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EventCall_FireDragonFadeOut
EventCall_FireDragonFadeOut: @ 0x0807EBE4
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #3
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventCall_FinalFireDragonReStandUp
EventCall_FinalFireDragonReStandUp: @ 0x0807EC14
	push {lr}
	sub sp, #8
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0

	thumb_func_start sub_0807EC30
sub_0807EC30: @ 0x0807EC30
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0807EC98 @ =0x03002870
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
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _0807EC9C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0807ECA0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	bl sub_0807E7D4
	movs r0, #2
	bl sub_0807E7D4
	adds r5, #0x4c
	strh r4, [r5]
	ldr r0, _0807ECA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807EC90
	movs r0, #0xe5
	bl m4aSongNumStart
_0807EC90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC98: .4byte 0x03002870
_0807EC9C: .4byte 0x0000FFE0
_0807ECA0: .4byte 0x0000E0FF
_0807ECA4: .4byte 0x0202BBF8

	thumb_func_start sub_0807ECA8
sub_0807ECA8: @ 0x0807ECA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x12
	lsls r3, r1, #1
	cmp r3, #0x10
	ble _0807ECC8
	movs r3, #0x10
_0807ECC8:
	ldr r2, _0807ED28 @ =0x03002870
	adds r5, r2, #0
	adds r5, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r4, [r5]
	ands r0, r4
	strb r0, [r5]
	movs r0, #0x10
	subs r0, r0, r1
	movs r6, #0x44
	adds r6, r6, r2
	mov r8, r6
	movs r4, #0
	strb r0, [r6]
	adds r7, r2, #0
	adds r7, #0x45
	strb r3, [r7]
	adds r6, r2, #0
	adds r6, #0x46
	strb r4, [r6]
	cmp r1, #0x10
	bne _0807ED18
	movs r0, #1
	bl RemoveFireDragonSpritefx
	movs r0, #2
	bl RemoveFireDragonSpritefx
	mov r0, sl
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	mov r0, r8
	strb r4, [r0]
	strb r4, [r7]
	strb r4, [r6]
	mov r0, sb
	bl Proc_Break
_0807ED18:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED28: .4byte 0x03002870

	thumb_func_start sub_0807ED2C
sub_0807ED2C: @ 0x0807ED2C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807ED3C @ =0x08CBFCB4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807ED3C: .4byte 0x08CBFCB4

	thumb_func_start ForceCenteredDragon
ForceCenteredDragon: @ 0x0807ED40
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x91
	bl SetFlag
	adds r0, r4, #0
	movs r1, #1
	bl SetUnitHp
	ldr r0, [r4, #0xc]
	movs r1, #7
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoCenteredPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start IsStartButtonHeld
IsStartButtonHeld: @ 0x0807ED78
	ldr r0, _0807ED88 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807ED88: .4byte 0x08B857F8

	thumb_func_start IsSelectButtonHeld
IsSelectButtonHeld: @ 0x0807ED8C
	ldr r0, _0807ED9C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #4
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807ED9C: .4byte 0x08B857F8

	thumb_func_start sub_0807EDA0
sub_0807EDA0: @ 0x0807EDA0
	movs r0, #0
	bx lr

	thumb_func_start IsBButtonHeld
IsBButtonHeld: @ 0x0807EDA4
	ldr r0, _0807EDB4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807EDB4: .4byte 0x08B857F8

	thumb_func_start sub_0807EDB8
sub_0807EDB8: @ 0x0807EDB8
	push {lr}
	ldr r0, _0807EDC8 @ =0x03005B10
	ldr r1, _0807EDCC @ =0x0000FFFF
	movs r2, #0x20
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDC8: .4byte 0x03005B10
_0807EDCC: .4byte 0x0000FFFF

	thumb_func_start sub_0807EDD0
sub_0807EDD0: @ 0x0807EDD0
	push {lr}
	ldr r0, _0807EDE0 @ =0x03005DA0
	ldr r1, _0807EDE4 @ =0x0000FFFF
	movs r2, #0x20
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDE0: .4byte 0x03005DA0
_0807EDE4: .4byte 0x0000FFFF

	thumb_func_start sub_0807EDE8
sub_0807EDE8: @ 0x0807EDE8
	push {lr}
	ldr r0, _0807EDFC @ =0x03005B10
	ldr r1, _0807EE00 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDFC: .4byte 0x03005B10
_0807EE00: .4byte 0x0000FFFF

	thumb_func_start sub_0807EE04
sub_0807EE04: @ 0x0807EE04
	push {lr}
	ldr r0, _0807EE18 @ =0x03005DA0
	ldr r1, _0807EE1C @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EE18: .4byte 0x03005DA0
_0807EE1C: .4byte 0x0000FFFF

	thumb_func_start sub_0807EE20
sub_0807EE20: @ 0x0807EE20
	ldr r0, _0807EE34 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807EE38
	movs r0, #1
	b _0807EE3A
	.align 2, 0
_0807EE34: .4byte 0x08B857F8
_0807EE38:
	movs r0, #0
_0807EE3A:
	bx lr

	thumb_func_start GetLynModeDeathFlag
GetLynModeDeathFlag: @ 0x0807EE3C
	push {lr}
	movs r0, #0x9d
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start SetLynModeDeathFlag
SetLynModeDeathFlag: @ 0x0807EE4C
	push {lr}
	movs r0, #0x9d
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_0807EE58
sub_0807EE58: @ 0x0807EE58
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EE6E
	movs r2, #1
_0807EE6E:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start IsSerraRecruited
IsSerraRecruited: @ 0x0807EE74
	push {lr}
	movs r0, #0x11
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EE8A
	movs r2, #1
_0807EE8A:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start IsErkRecruited
IsErkRecruited: @ 0x0807EE90
	push {lr}
	movs r0, #0x13
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EEA6
	movs r2, #1
_0807EEA6:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start IsChapterInOccupationsShadow
IsChapterInOccupationsShadow: @ 0x0807EEAC
	movs r1, #0
	ldr r0, _0807EEBC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #4
	bne _0807EEB8
	movs r1, #1
_0807EEB8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEBC: .4byte 0x0202BBF8

	thumb_func_start IsChapterBeyondTheBorders
IsChapterBeyondTheBorders: @ 0x0807EEC0
	movs r1, #0
	ldr r0, _0807EED0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #5
	bne _0807EECC
	movs r1, #1
_0807EECC:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EED0: .4byte 0x0202BBF8

	thumb_func_start IsChapterBloodOfPride
IsChapterBloodOfPride: @ 0x0807EED4
	movs r1, #0
	ldr r0, _0807EEE4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #6
	bne _0807EEE0
	movs r1, #1
_0807EEE0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEE4: .4byte 0x0202BBF8

	thumb_func_start IsChapterNightOfFarewells
IsChapterNightOfFarewells: @ 0x0807EEE8
	movs r1, #0
	ldr r0, _0807EEF8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x26
	bne _0807EEF4
	movs r1, #1
_0807EEF4:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807EEF8: .4byte 0x0202BBF8

	thumb_func_start IsAnyLordInCombat
IsAnyLordInCombat: @ 0x0807EEFC
	ldr r0, _0807EF28 @ =0x0203A3F0
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	ldr r0, _0807EF2C @ =0x0203A470
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807EF24
	cmp r1, #0x2d
	beq _0807EF24
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807EF24
	cmp r2, #0x2d
	bne _0807EF30
_0807EF24:
	movs r0, #1
	b _0807EF32
	.align 2, 0
_0807EF28: .4byte 0x0203A3F0
_0807EF2C: .4byte 0x0203A470
_0807EF30:
	movs r0, #0
_0807EF32:
	bx lr

	thumb_func_start IsNinoRecruited
IsNinoRecruited: @ 0x0807EF34
	push {lr}
	movs r0, #0x14
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EF4A
	movs r2, #1
_0807EF4A:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start IsRathRecruited
IsRathRecruited: @ 0x0807EF50
	push {lr}
	movs r0, #0x32
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EF66
	movs r2, #1
_0807EF66:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start IsHectorInCombat
IsHectorInCombat: @ 0x0807EF6C
	ldr r0, _0807EF84 @ =0x0203A3F0
	ldr r1, [r0]
	ldr r0, _0807EF88 @ =0x0203A470
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #2
	beq _0807EF80
	cmp r0, #2
	bne _0807EF8C
_0807EF80:
	movs r0, #1
	b _0807EF8E
	.align 2, 0
_0807EF84: .4byte 0x0203A3F0
_0807EF88: .4byte 0x0203A470
_0807EF8C:
	movs r0, #0
_0807EF8E:
	bx lr

	thumb_func_start sub_0807EF90
sub_0807EF90: @ 0x0807EF90
	push {r4, lr}
	bl GetPartyTotalGoldValue
	adds r4, r0, #0
	ldr r0, _0807EFB4 @ =0x0000752F
	cmp r4, r0
	ble _0807EFBC
	movs r0, #0x85
	bl SetFlag
	ldr r0, _0807EFB8 @ =0x000080E7
	cmp r4, r0
	ble _0807EFC8
	movs r0, #0x84
	bl SetFlag
	b _0807EFC8
	.align 2, 0
_0807EFB4: .4byte 0x0000752F
_0807EFB8: .4byte 0x000080E7
_0807EFBC:
	ldr r0, _0807EFD0 @ =0x00004E1F
	cmp r4, r0
	ble _0807EFC8
	movs r0, #0x84
	bl SetFlag
_0807EFC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFD0: .4byte 0x00004E1F

	thumb_func_start TransferLynModeUnits
TransferLynModeUnits: @ 0x0807EFD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	movs r6, #1
	ldr r0, _0807F01C @ =0x0202BBF8
	bl RegisterChapterStats
	bl ComputeChapterRankings
	bl SaveEndgameRankings
	bl sub_0807EF90
	movs r5, #1
_0807EFF2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r5, #1
	mov r8, r5
	cmp r4, #0
	beq _0807F09C
	ldr r0, [r4]
	cmp r0, #0
	beq _0807F09C
	adds r0, r4, #0
	bl UnitLoadSupports
	ldr r5, _0807F020 @ =0x08CA0448
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807F09C
	ldr r0, [r4]
	b _0807F08A
	.align 2, 0
_0807F01C: .4byte 0x0202BBF8
_0807F020: .4byte 0x08CA0448
_0807F024:
	ldrb r0, [r5, #1]
	cmp r0, r2
	beq _0807F032
	ldrb r0, [r5, #1]
	bl GetCharacterData
	str r0, [r4]
_0807F032:
	ldr r0, [r4, #0xc]
	ldr r1, _0807F058 @ =0x00010008
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl UnitClearInventory
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0807F04A
	bl ClearFlag
_0807F04A:
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807F05E
	b _0807F078
	.align 2, 0
_0807F058: .4byte 0x00010008
_0807F05C:
	adds r6, #1
_0807F05E:
	cmp r6, #0x3f
	bgt _0807F070
	adds r0, r6, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r0, [r7]
	cmp r0, #0
	bne _0807F05C
_0807F070:
	adds r0, r4, #0
	adds r1, r7, #0
	bl CopyUnit
_0807F078:
	adds r0, r4, #0
	bl ClearUnit
	b _0807F09C
_0807F080:
	adds r5, #8
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807F09C
_0807F08A:
	ldrb r3, [r0, #4]
	cmp r3, r1
	bne _0807F080
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0807F024
_0807F09C:
	mov r5, r8
	cmp r5, #0x3f
	ble _0807EFF2
	bl ClearPidStats_ret
	ldr r1, _0807F0C0 @ =0x0202BBF8
	movs r0, #0xc
	strb r0, [r1, #0xe]
	bl CleanupUnitsBeforeChapter
	bl SavePlayThroughData
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F0C0: .4byte 0x0202BBF8

	thumb_func_start SetPostLynModeChapter
SetPostLynModeChapter: @ 0x0807F0C4
	push {r4, lr}
	ldr r4, _0807F0D4 @ =0x0202BBF8
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	beq _0807F0D8
	cmp r0, #3
	beq _0807F0E2
	b _0807F0EC
	.align 2, 0
_0807F0D4: .4byte 0x0202BBF8
_0807F0D8:
	movs r0, #0xc
	bl SetNextChapterId
	movs r0, #0xc
	b _0807F0EA
_0807F0E2:
	movs r0, #0xd
	bl SetNextChapterId
	movs r0, #0xd
_0807F0EA:
	strb r0, [r4, #0xe]
_0807F0EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LoadOneYearLaterCg
LoadOneYearLaterCg: @ 0x0807F0F4
	push {lr}
	ldr r3, _0807F164 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807F168 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r0, _0807F16C @ =0x081C3590
	ldr r1, _0807F170 @ =0x06000800
	bl Decompress
	ldr r0, _0807F174 @ =0x081C39A4
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807F178 @ =0x02022C60
	ldr r1, _0807F17C @ =0x081C39C4
	ldr r2, _0807F180 @ =0x00005040
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807F164: .4byte 0x03002870
_0807F168: .4byte 0x0000FFE0
_0807F16C: .4byte 0x081C3590
_0807F170: .4byte 0x06000800
_0807F174: .4byte 0x081C39A4
_0807F178: .4byte 0x02022C60
_0807F17C: .4byte 0x081C39C4
_0807F180: .4byte 0x00005040

	thumb_func_start sub_0807F184
sub_0807F184: @ 0x0807F184
	push {lr}
	ldr r0, _0807F190 @ =0x083FC99C
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F190: .4byte 0x083FC99C

	thumb_func_start sub_0807F194
sub_0807F194: @ 0x0807F194
	push {lr}
	ldr r0, _0807F1A0 @ =0x083FC9B4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1A0: .4byte 0x083FC9B4

	thumb_func_start sub_0807F1A4
sub_0807F1A4: @ 0x0807F1A4
	push {lr}
	ldr r0, _0807F1B0 @ =0x083FC9C4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1B0: .4byte 0x083FC9C4

	thumb_func_start sub_0807F1B4
sub_0807F1B4: @ 0x0807F1B4
	push {lr}
	ldr r0, _0807F1C0 @ =0x083FC9D4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1C0: .4byte 0x083FC9D4

	thumb_func_start sub_0807F1C4
sub_0807F1C4: @ 0x0807F1C4
	push {lr}
	ldr r0, _0807F1D0 @ =0x083FC9EC
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1D0: .4byte 0x083FC9EC

	thumb_func_start sub_0807F1D4
sub_0807F1D4: @ 0x0807F1D4
	push {lr}
	movs r0, #0
	movs r1, #0x74
	bl UnlockSoundRoomSong
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NilsEpilogueIntro_Init
NilsEpilogueIntro_Init: @ 0x0807F1E4
	ldr r3, _0807F228 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r2, [r3, #0x10]
	orrs r2, r0
	strb r2, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	bx lr
	.align 2, 0
_0807F228: .4byte 0x03002870

	thumb_func_start NilsEpilogueIntro_CopyBg3ToBg1
NilsEpilogueIntro_CopyBg3ToBg1: @ 0x0807F22C
	push {r4, r5, r6, r7, lr}
	ldr r7, _0807F2C0 @ =0x03002870
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r6, #4
	orrs r0, r6
	movs r1, #8
	orrs r0, r1
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	ldr r0, _0807F2C4 @ =0x06008000
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _0807F2C8 @ =0x02024460
	ldr r1, _0807F2CC @ =0x02023460
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	ldrb r0, [r7, #1]
	orrs r4, r0
	movs r0, #2
	orrs r4, r0
	orrs r4, r6
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	strb r4, [r7, #1]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0807F2D0 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0807F2D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F2C0: .4byte 0x03002870
_0807F2C4: .4byte 0x06008000
_0807F2C8: .4byte 0x02024460
_0807F2CC: .4byte 0x02023460
_0807F2D0: .4byte 0x0000FFE0
_0807F2D4: .4byte 0x0000E0FF

	thumb_func_start NilsEpilogueIntro_LoadCg
NilsEpilogueIntro_LoadCg: @ 0x0807F2D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0807F320 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl PutCgBackground
	ldr r2, _0807F324 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F320: .4byte 0x02024460
_0807F324: .4byte 0x03002870

	thumb_func_start NilsEpilogueIntro_Loop_BlendCg
NilsEpilogueIntro_Loop_BlendCg: @ 0x0807F328
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807F390 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r4, #0x10
	subs r0, r4, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807F388
	movs r0, #1
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r0, r2
	subs r1, #3
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r5, #0
	bl Proc_Break
_0807F388:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F390: .4byte 0x03002870

	thumb_func_start NilsEpilogueIntro_ClearBg1Bg2
NilsEpilogueIntro_ClearBg1Bg2: @ 0x0807F394
	push {r4, lr}
	ldr r1, _0807F40C @ =0x03002870
	mov ip, r1
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	mov r3, ip
	ldrb r3, [r3, #0xc]
	ands r1, r3
	mov r4, ip
	strb r1, [r4, #0xc]
	adds r1, r2, #0
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r4, #0x10]
	ldrb r4, [r4, #0x14]
	ands r2, r4
	movs r1, #2
	orrs r2, r1
	mov r1, ip
	strb r2, [r1, #0x14]
	movs r1, #3
	mov r2, ip
	ldrb r2, [r2, #0x18]
	orrs r1, r2
	mov r3, ip
	strb r1, [r3, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	bl EndDragonGatefx
	ldr r0, _0807F410 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0807F414 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #6
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F40C: .4byte 0x03002870
_0807F410: .4byte 0x02023460
_0807F414: .4byte 0x02023C60

	thumb_func_start NilsEpilogueIntro_ReloadCg
NilsEpilogueIntro_ReloadCg: @ 0x0807F418
	push {lr}
	sub sp, #4
	ldr r0, _0807F454 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #8
	movs r3, #6
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	ldr r2, _0807F458 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807F454: .4byte 0x02024460
_0807F458: .4byte 0x03002870

	thumb_func_start sub_0807F45C
sub_0807F45C: @ 0x0807F45C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F46C @ =0x08CC1198
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807F46C: .4byte 0x08CC1198

	thumb_func_start NilsEpilogueOutro_Init
NilsEpilogueOutro_Init: @ 0x0807F470
	push {r4, lr}
	sub sp, #4
	ldr r4, _0807F4FC @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r4, #0x18]
	ldr r0, _0807F500 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #4
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl PutCgBackground
	movs r0, #1
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0807F504 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807F508 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4FC: .4byte 0x03002870
_0807F500: .4byte 0x02022C60
_0807F504: .4byte 0x0000FFE0
_0807F508: .4byte 0x0000E0FF

	thumb_func_start NilsEpilogueOutro_LoadNilsInDragonsGate
NilsEpilogueOutro_LoadNilsInDragonsGate: @ 0x0807F50C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807F56C @ =0x081900E4
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807F570 @ =0x0818F8B0
	ldr r1, _0807F574 @ =0x06005800
	bl Decompress
	ldr r0, _0807F578 @ =0x02023C60
	ldr r1, _0807F57C @ =0x0818FC08
	ldr r2, _0807F580 @ =0x000072C0
	bl TmApplyTsa_thm
	ldr r4, _0807F584 @ =0x0818C004
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807F588 @ =0x02024460
	ldr r1, _0807F58C @ =0x0818F2D4
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _0807F590 @ =0x0818F7B0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl ApplyPaletteExt
	movs r0, #0xc
	bl EnableBgSync
	adds r5, #0x4c
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F56C: .4byte 0x081900E4
_0807F570: .4byte 0x0818F8B0
_0807F574: .4byte 0x06005800
_0807F578: .4byte 0x02023C60
_0807F57C: .4byte 0x0818FC08
_0807F580: .4byte 0x000072C0
_0807F584: .4byte 0x0818C004
_0807F588: .4byte 0x02024460
_0807F58C: .4byte 0x0818F2D4
_0807F590: .4byte 0x0818F7B0

	thumb_func_start NilsEpilogueOutro_Loop_BlendCgs
NilsEpilogueOutro_Loop_BlendCgs: @ 0x0807F594
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807F5FC @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r5, #0x10
	subs r1, r5, r2
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807F5F4
	movs r0, #2
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r5
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl Proc_Break
_0807F5F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5FC: .4byte 0x03002870

	thumb_func_start sub_0807F600
sub_0807F600: @ 0x0807F600
	push {lr}
	ldr r0, _0807F614 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807F614: .4byte 0x02022C60

	thumb_func_start NilsEpilogueOutro_FadeNilsToWhite
NilsEpilogueOutro_FadeNilsToWhite: @ 0x0807F618
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r3, _0807F680 @ =0x03002870
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
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F680: .4byte 0x03002870

	thumb_func_start NilsEpilogueOutro_FadeDragonsGateToBlack
NilsEpilogueOutro_FadeDragonsGateToBlack: @ 0x0807F684
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807F6B4
sub_0807F6B4: @ 0x0807F6B4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F6C4 @ =0x08CC1208
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807F6C4: .4byte 0x08CC1208

	thumb_func_start sub_0807F6C8
sub_0807F6C8: @ 0x0807F6C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x98
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F6E4
	movs r0, #0x98
	bl SetFlag
	adds r0, r4, #0
	bl sub_080A4E0C
_0807F6E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawUiGaugeBitmapEdgeColumn
DrawUiGaugeBitmapEdgeColumn: @ 0x0807F6EC
	push {r4, r5, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #4
	strb r4, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	movs r5, #0xe
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r0, r0, r4
	movs r1, #3
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start DrawUiGaugeBitmapBaseColumn
DrawUiGaugeBitmapBaseColumn: @ 0x0807F710
	push {r4, r5, lr}
	adds r4, r0, r2
	movs r3, #4
	strb r3, [r4]
	adds r3, r1, r2
	adds r3, r0, r3
	movs r5, #0xe
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r4, r0, r4
	strb r5, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start DrawUiGaugeBitmapFilledColumn
DrawUiGaugeBitmapFilledColumn: @ 0x0807F740
	push {r4, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #1
	strb r4, [r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawUiGaugeBitmapBonusColumn
DrawUiGaugeBitmapBonusColumn: @ 0x0807F75C
	push {r4, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #0xd
	strb r4, [r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #0xc
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawUiGauge
DrawUiGauge: @ 0x0807F778
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov sb, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x28]
	mov sl, r0
	ldr r1, _0807F840 @ =0x02020140
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	lsls r2, r6, #4
	ldr r0, _0807F844 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	lsls r4, r6, #3
	mov r0, r8
	adds r1, r4, #0
	mov r2, sb
	bl DrawUiGaugeBitmapEdgeColumn
	mov r0, sb
	adds r2, r0, r5
	adds r2, #3
	mov r0, r8
	adds r1, r4, #0
	bl DrawUiGaugeBitmapEdgeColumn
	movs r4, #0
	adds r5, #2
	cmp r4, r5
	bge _0807F7E0
	mov r7, sb
	adds r7, #1
_0807F7D0:
	adds r2, r4, r7
	mov r0, r8
	lsls r1, r6, #3
	bl DrawUiGaugeBitmapBaseColumn
	adds r4, #1
	cmp r4, r5
	blt _0807F7D0
_0807F7E0:
	movs r4, #0
	ldr r1, [sp, #4]
	lsls r7, r1, #5
	cmp r4, sl
	bge _0807F7FE
	mov r5, sb
	adds r5, #2
_0807F7EE:
	adds r2, r4, r5
	mov r0, r8
	lsls r1, r6, #3
	bl DrawUiGaugeBitmapFilledColumn
	adds r4, #1
	cmp r4, sl
	blt _0807F7EE
_0807F7FE:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	ble _0807F820
	mov r0, sb
	adds r0, #2
	mov r1, sl
	adds r5, r1, r0
	ldr r4, [sp, #0x2c]
_0807F80E:
	mov r0, r8
	lsls r1, r6, #3
	adds r2, r5, #0
	bl DrawUiGaugeBitmapBonusColumn
	adds r5, #1
	subs r4, #1
	cmp r4, #0
	bne _0807F80E
_0807F820:
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r7, r0
	mov r0, r8
	adds r2, r6, #0
	movs r3, #1
	bl ApplyBitmap
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F840: .4byte 0x02020140
_0807F844: .4byte 0x001FFFFF

	thumb_func_start PutDrawUiGauge
PutDrawUiGauge: @ 0x0807F848
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl DrawUiGauge
	ldr r0, _0807F88C @ =0x000003FF
	ands r0, r5
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl PutAppliedBitmap
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F88C: .4byte 0x000003FF

	thumb_func_start sub_0807F890
sub_0807F890: @ 0x0807F890
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start BackgroundSlide_Loop
BackgroundSlide_Loop: @ 0x0807F898
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0807F8AE
	adds r1, #3
_0807F8AE:
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0807F8C4
	adds r0, #3
_0807F8C4:
	asrs r1, r0, #2
	ldr r0, _0807F8D0 @ =0x0400001C
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F8D0: .4byte 0x0400001C

	thumb_func_start StartMuralBackgroundAlt
StartMuralBackgroundAlt: @ 0x0807F8D4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, _0807F90C @ =0x02024460
	cmp r4, #0
	bne _0807F8EE
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_0807F8EE:
	cmp r5, #0
	bge _0807F8F4
	movs r5, #0xe
_0807F8F4:
	ldr r1, _0807F910 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0807F918
	ldr r0, _0807F914 @ =0x081C8184
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0807F922
	.align 2, 0
_0807F90C: .4byte 0x02024460
_0807F910: .4byte 0x0202BBB8
_0807F914: .4byte 0x081C8184
_0807F918:
	ldr r0, _0807F95C @ =0x0841E2D8
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
_0807F922:
	ldr r0, _0807F960 @ =0x08418E44
	adds r1, r4, #0
	bl Decompress
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _0807F964 @ =0x0000027F
_0807F942:
	adds r0, r2, r1
	strh r0, [r6]
	adds r6, #2
	adds r2, #1
	cmp r2, r3
	ble _0807F942
	ldr r0, _0807F968 @ =0x08CC1C5C
	adds r1, r7, #0
	bl Proc_Start
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807F95C: .4byte 0x0841E2D8
_0807F960: .4byte 0x08418E44
_0807F964: .4byte 0x0000027F
_0807F968: .4byte 0x08CC1C5C

	thumb_func_start StartMuralBackgroundExt
StartMuralBackgroundExt: @ 0x0807F96C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r7, _0807F9A4 @ =0x02024460
	cmp r4, #0
	bne _0807F98E
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_0807F98E:
	cmp r5, #0
	bge _0807F994
	movs r5, #0xe
_0807F994:
	cmp r6, #0
	beq _0807F9AC
	ldr r0, _0807F9A8 @ =0x081C8184
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0807F9B6
	.align 2, 0
_0807F9A4: .4byte 0x02024460
_0807F9A8: .4byte 0x081C8184
_0807F9AC:
	ldr r0, _0807F9F4 @ =0x0841E2D8
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
_0807F9B6:
	ldr r0, _0807F9F8 @ =0x08418E44
	adds r1, r4, #0
	bl Decompress
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _0807F9FC @ =0x0000027F
_0807F9D6:
	adds r0, r2, r1
	strh r0, [r7]
	adds r7, #2
	adds r2, #1
	cmp r2, r3
	ble _0807F9D6
	ldr r0, _0807FA00 @ =0x08CC1C5C
	mov r1, r8
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807F9F4: .4byte 0x0841E2D8
_0807F9F8: .4byte 0x08418E44
_0807F9FC: .4byte 0x0000027F
_0807FA00: .4byte 0x08CC1C5C

	thumb_func_start EndMuralBackground
EndMuralBackground: @ 0x0807FA04
	push {lr}
	ldr r0, _0807FA10 @ =0x08CC1C5C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807FA10: .4byte 0x08CC1C5C

	thumb_func_start GetLastStatScreenUnitId
GetLastStatScreenUnitId: @ 0x0807FA14
	ldr r0, _0807FA1C @ =0x0203E670
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_0807FA1C: .4byte 0x0203E670

	thumb_func_start SetStatScreenLastUnitId
SetStatScreenLastUnitId: @ 0x0807FA20
	ldr r1, _0807FA28 @ =0x0203E670
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0807FA28: .4byte 0x0203E670

	thumb_func_start SetStatScreenExcludedUnitFlags
SetStatScreenExcludedUnitFlags: @ 0x0807FA2C
	ldr r1, _0807FA34 @ =0x0203E670
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0807FA34: .4byte 0x0203E670

	thumb_func_start InitStatScreenText
InitStatScreenText: @ 0x0807FA38
	push {lr}
	ldr r0, _0807FA44 @ =0x08CC1C74
	bl InitTextList
	pop {r0}
	bx r0
	.align 2, 0
_0807FA44: .4byte 0x08CC1C74

	thumb_func_start DisplayTexts
DisplayTexts: @ 0x0807FA48
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	b _0807FA7C
_0807FA50:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _0807FA72
	ldr r0, [r0]
	bl DecodeMsg
	ldr r5, [r6]
	ldr r1, [r6, #4]
	ldrb r2, [r6, #8]
	ldrb r3, [r6, #9]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	b _0807FA7A
_0807FA72:
	ldr r0, [r6]
	ldr r1, [r6, #4]
	bl PutText
_0807FA7A:
	adds r6, #0x10
_0807FA7C:
	ldr r0, [r6]
	cmp r0, #0
	bne _0807FA50
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutStatScreenLeftPanelInfo
PutStatScreenLeftPanelInfo: @ 0x0807FA8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r7, _0807FB70 @ =0x0200310C
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, _0807FB74 @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r4, [r7, #0xc]
	adds r0, r4, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl BattleGenerateUiStats
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0xa2
	lsls r1, r1, #2
	add r1, r8
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	ldr r0, [r7, #0xc]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r7, #0
	adds r2, #0x20
	ldr r1, _0807FB78 @ =0x00000342
	add r1, r8
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0807FB7C @ =0x000003C2
	add r0, r8
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	ldr r0, _0807FB80 @ =0x000003CA
	add r0, r8
	movs r1, #3
	movs r2, #0x1f
	bl PutSpecialChar
	ldr r0, _0807FB84 @ =0x00000442
	add r0, r8
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r0, _0807FB88 @ =0x0000044A
	add r0, r8
	movs r1, #3
	movs r2, #0x16
	bl PutSpecialChar
	movs r0, #0xf2
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r7, #0xc]
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, _0807FB8C @ =0x000003CE
	add r0, r8
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, [r7, #0xc]
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _0807FB94
	ldr r0, _0807FB90 @ =0x00000446
	add r0, r8
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0807FBAA
	.align 2, 0
_0807FB70: .4byte 0x0200310C
_0807FB74: .4byte 0x02022C60
_0807FB78: .4byte 0x00000342
_0807FB7C: .4byte 0x000003C2
_0807FB80: .4byte 0x000003CA
_0807FB84: .4byte 0x00000442
_0807FB88: .4byte 0x0000044A
_0807FB8C: .4byte 0x000003CE
_0807FB90: .4byte 0x00000446
_0807FB94:
	movs r4, #0x89
	lsls r4, r4, #3
	add r4, r8
	ldr r0, [r7, #0xc]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_0807FBAA:
	ldr r5, _0807FBC4 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _0807FBCC
	ldr r0, _0807FBC8 @ =0x020230AC
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0807FBDE
	.align 2, 0
_0807FBC4: .4byte 0x0200310C
_0807FBC8: .4byte 0x020230AC
_0807FBCC:
	ldr r4, _0807FBEC @ =0x020230AE
	ldr r0, [r5, #0xc]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_0807FBDE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBEC: .4byte 0x020230AE

	thumb_func_start sub_0807FBF0
sub_0807FBF0: @ 0x0807FBF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0807FD00 @ =0x0200310C
	ldr r0, [r5, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetPidStats
	adds r4, r0, #0
	cmp r4, #0
	beq _0807FCF6
	ldr r1, _0807FD04 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	ldr r0, _0807FD08 @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	bl IsFirstPlaythrough
	cmp r0, #1
	beq _0807FCF6
	ldr r1, [r5, #0xc]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	ldrh r1, [r4, #0xc]
	lsls r0, r1, #0x12
	lsrs r6, r0, #0x14
	ldr r1, _0807FD0C @ =0x000003E7
	cmp r6, r1
	ble _0807FC4A
	adds r6, r1, #0
_0807FC4A:
	movs r0, #3
	ldrb r2, [r4, #0xc]
	ands r0, r2
	lsls r7, r0, #8
	ldrb r0, [r4, #0xb]
	orrs r7, r0
	cmp r7, r1
	ble _0807FC5C
	adds r7, r1, #0
_0807FC5C:
	ldrb r4, [r4]
	mov r8, r4
	movs r1, #0x94
	lsls r1, r1, #1
	adds r5, r5, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0807FD10 @ =0x000012AB
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _0807FD14 @ =0x000012AC
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2e
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _0807FD18 @ =0x000012AD
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x56
	movs r2, #3
	bl Text_InsertDrawString
	ldr r4, _0807FD1C @ =0x020035BE
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	adds r0, r6, #0
	bl CountDigits
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	adds r0, r7, #0
	bl CountDigits
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0xc
	adds r0, r0, r1
	movs r1, #2
	adds r2, r7, #0
	bl PutNumber
	mov r0, r8
	bl CountDigits
	lsls r0, r0, #1
	adds r4, #0x16
	adds r0, r0, r4
	movs r1, #2
	mov r2, r8
	bl PutNumber
	ldr r0, _0807FD20 @ =0x02003FBC
	ldr r1, _0807FD24 @ =0x083FD5C4
	movs r2, #0x83
	lsls r2, r2, #5
	bl TmApplyTsa_thm
_0807FCF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD00: .4byte 0x0200310C
_0807FD04: .4byte 0x0202BBB8
_0807FD08: .4byte 0x0202BBF8
_0807FD0C: .4byte 0x000003E7
_0807FD10: .4byte 0x000012AB
_0807FD14: .4byte 0x000012AC
_0807FD18: .4byte 0x000012AD
_0807FD1C: .4byte 0x020035BE
_0807FD20: .4byte 0x02003FBC
_0807FD24: .4byte 0x083FD5C4

	thumb_func_start PutStatScreenStatWithBar
PutStatScreenStatWithBar: @ 0x0807FD28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r8, r1
	str r2, [sp, #0xc]
	adds r7, r3, #0
	ldr r5, [sp, #0x30]
	subs r0, r5, r7
	mov sb, r0
	lsls r6, r2, #5
	adds r0, r6, r1
	lsls r0, r0, #1
	ldr r4, _0807FDE4 @ =0x0200323C
	adds r0, r0, r4
	movs r1, #2
	ldr r2, [sp, #0x34]
	cmp r7, r2
	bne _0807FD56
	movs r1, #4
_0807FD56:
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r1, r6, #1
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r4
	mov r0, sb
	bl PutNumberBonus
	cmp r5, #0x1e
	ble _0807FD74
	movs r5, #0x1e
	subs r5, r5, r7
	mov sb, r5
_0807FD74:
	mov r0, sl
	lsls r5, r0, #1
	add r5, sl
	lsls r5, r5, #1
	ldr r1, _0807FDE8 @ =0x00000401
	adds r5, r5, r1
	ldr r4, [sp, #0xc]
	adds r4, #1
	lsls r4, r4, #5
	subs r4, #2
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _0807FDEC @ =0x02003C3C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	ldr r2, [sp, #0x34]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #4]
	mov r1, sb
	lsls r0, r1, #2
	add r0, sb
	lsls r0, r0, #3
	add r0, sb
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutDrawUiGauge
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FDE4: .4byte 0x0200323C
_0807FDE8: .4byte 0x00000401
_0807FDEC: .4byte 0x02003C3C

	thumb_func_start sub_0807FDF0
sub_0807FDF0: @ 0x0807FDF0
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _0807FE40 @ =0x083FCA4C
	ldr r4, _0807FE44 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _0807FE48 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _0807FE4C @ =0x084049A0
	bl DisplayTexts
	ldr r5, _0807FE50 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0807FE5C
	ldr r0, _0807FE54 @ =0x000010F9
	bl DecodeMsg
	adds r3, r5, #0
	adds r3, #0x30
	ldr r1, _0807FE58 @ =0x0200327E
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _0807FE76
	.align 2, 0
_0807FE40: .4byte 0x083FCA4C
_0807FE44: .4byte 0x02020140
_0807FE48: .4byte 0x0200373C
_0807FE4C: .4byte 0x084049A0
_0807FE50: .4byte 0x0200310C
_0807FE54: .4byte 0x000010F9
_0807FE58: .4byte 0x0200327E
_0807FE5C:
	ldr r0, _08080048 @ =0x000010F8
	bl DecodeMsg
	adds r2, r5, #0
	adds r2, #0x30
	ldr r1, _0808004C @ =0x0200327E
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
_0807FE76:
	ldr r6, _08080050 @ =0x0200310C
	ldr r0, [r6, #0xc]
	bl GetUnitPower
	ldr r1, [r6, #0xc]
	movs r3, #0x14
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #5
	movs r2, #1
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSkill
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x15]
	ldr r0, [r2, #0xc]
	movs r5, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0807FEBA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FEBA:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x15]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FED6
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FED6:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #5
	movs r2, #3
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSpeed
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FF04
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FF04:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FF20
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FF20:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #5
	movs r2, #5
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitLuck
	ldr r1, [r6, #0xc]
	movs r3, #0x19
	ldrsb r3, [r1, r3]
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #5
	movs r2, #7
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitDefense
	ldr r1, [r6, #0xc]
	movs r3, #0x17
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #5
	movs r2, #9
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitResistance
	ldr r1, [r6, #0xc]
	movs r3, #0x18
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #5
	movs r2, #0xb
	bl PutStatScreenStatWithBar
	ldr r1, [r6, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x12
	ldrsb r3, [r0, r3]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	adds r0, r0, r3
	str r0, [sp]
	movs r5, #0xf
	str r5, [sp, #4]
	movs r0, #6
	movs r1, #0xd
	movs r2, #1
	bl PutStatScreenStatWithBar
	ldr r1, [r6, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r0, r3, r0
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #0xd
	movs r2, #3
	bl PutStatScreenStatWithBar
	ldr r4, _08080054 @ =0x02003396
	ldr r0, [r6, #0xc]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r4, #2
	ldr r0, [r6, #0xc]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	adds r4, r6, #0
	adds r4, #0x78
	ldr r0, [r6, #0xc]
	bl sub_08018CC0
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
	ldr r1, [r6, #0xc]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	ands r5, r0
	cmp r5, #4
	bne _08080058
	adds r4, #0x10
	adds r0, r1, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #2
	bl Text_InsertDrawString
	b _0808006E
	.align 2, 0
_08080048: .4byte 0x000010F8
_0808004C: .4byte 0x0200327E
_08080050: .4byte 0x0200310C
_08080054: .4byte 0x02003396
_08080058:
	adds r4, r6, #0
	adds r4, #0x88
	adds r0, r1, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
_0808006E:
	ldr r5, _080800A8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	adds r0, #0x30
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _08080088
	ldr r0, _080800AC @ =0x0200351C
	lsrs r2, r2, #4
	movs r1, #0
	bl PutNumberSmall
_08080088:
	ldr r4, _080800B0 @ =0x02003496
	ldr r0, [r5, #0xc]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	bl sub_0807FBF0
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800A8: .4byte 0x0200310C
_080800AC: .4byte 0x0200351C
_080800B0: .4byte 0x02003496

	thumb_func_start sub_080800B4
sub_080800B4: @ 0x080800B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08080118 @ =0x083FCAC0
	ldr r4, _0808011C @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080120 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080124 @ =0x083FCE2C
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080128 @ =0x02003EFE
	ldr r2, _0808012C @ =0x00007060
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080130 @ =0x08404A60
	bl DisplayTexts
	movs r4, #0
	ldr r1, _08080134 @ =0x0200310C
	ldr r0, [r1, #0xc]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08080172
	adds r7, r1, #0
	mov r8, r4
	movs r6, #0x40
_080800FA:
	ldr r2, [r7, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08080138
	adds r0, r2, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _08080138
	movs r2, #4
	b _0808014A
	.align 2, 0
_08080118: .4byte 0x083FCAC0
_0808011C: .4byte 0x02020140
_08080120: .4byte 0x0200373C
_08080124: .4byte 0x083FCE2C
_08080128: .4byte 0x02003EFE
_0808012C: .4byte 0x00007060
_08080130: .4byte 0x08404A60
_08080134: .4byte 0x0200310C
_08080138:
	ldr r0, [r7, #0xc]
	adds r1, r5, #0
	bl IsItemDisplayUsable
	movs r2, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808014A
	movs r2, #1
_0808014A:
	lsls r0, r4, #3
	ldr r1, _08080244 @ =0x0200319C
	adds r0, r0, r1
	ldr r3, _08080248 @ =0x0200323E
	adds r3, r6, r3
	adds r1, r5, #0
	bl sub_08016668
	movs r0, #2
	add r8, r0
	adds r6, #0x80
	adds r4, #1
	cmp r4, #4
	bgt _08080172
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	add r0, r8
	ldrh r5, [r0]
	cmp r5, #0
	bne _080800FA
_08080172:
	ldr r7, _0808024C @ =0x0200310C
	ldr r0, [r7, #0xc]
	bl GetUnitEquippedWeaponSlot
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	blt _080801AC
	lsls r4, r4, #1
	adds r0, r4, #1
	lsls r0, r0, #6
	ldr r1, _08080250 @ =0x0200325C
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x1f
	bl PutSpecialChar
	adds r0, r4, #2
	lsls r0, r0, #6
	ldr r1, _08080254 @ =0x02003C3E
	adds r0, r0, r1
	ldr r1, _08080258 @ =0x083FCE68
	ldr r2, _0808025C @ =0x00007060
	bl TmApplyTsa_thm
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
_080801AC:
	ldr r6, _08080260 @ =0x0200358C
	ldr r4, _08080264 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x60
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0xe
	adds r1, r4, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x8e
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r5, #0
	bl GetItemRangeString
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0xb8
	bl GetStringTextLen
	movs r1, #0x2f
	subs r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r4, #0
	ldr r0, _08080268 @ =0x00005278
	adds r5, r0, #0
	adds r2, r6, #0
	subs r2, #0x8c
	ldr r1, _0808026C @ =0x00005270
	adds r3, r1, #0
	adds r1, r6, #0
	subs r1, #0x4c
_08080226:
	adds r0, r4, r5
	strh r0, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #7
	ble _08080226
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080244: .4byte 0x0200319C
_08080248: .4byte 0x0200323E
_0808024C: .4byte 0x0200310C
_08080250: .4byte 0x0200325C
_08080254: .4byte 0x02003C3E
_08080258: .4byte 0x083FCE68
_0808025C: .4byte 0x00007060
_08080260: .4byte 0x0200358C
_08080264: .4byte 0x0203A3F0
_08080268: .4byte 0x00005278
_0808026C: .4byte 0x00005270

	thumb_func_start PutStatScreenSupportList
PutStatScreenSupportList: @ 0x08080270
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #6
	str r0, [sp, #8]
	ldr r4, _08080358 @ =0x0200310C
	ldr r0, [r4, #0xc]
	bl GetUnitTotalSupportLevel
	movs r1, #0
	str r1, [sp, #0xc]
	cmp r0, #5
	bne _08080294
	movs r0, #4
	str r0, [sp, #0xc]
_08080294:
	ldr r0, [r4, #0xc]
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov sb, r1
	movs r0, #0
	cmp r0, sl
	bge _08080348
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, _08080358 @ =0x0200310C
	adds r1, r0, r1
	str r1, [sp, #0x10]
_080802B0:
	ldr r1, _08080358 @ =0x0200310C
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportLevel
	adds r7, r0, #0
	cmp r7, #0
	beq _08080340
	ldr r1, _08080358 @ =0x0200310C
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportPid
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [sp, #8]
	lsls r6, r0, #6
	ldr r1, _0808035C @ =0x02003244
	mov r8, r1
	adds r5, r6, r1
	adds r0, r4, #0
	bl GetAffinityIconByPid
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r4, #0
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	mov r1, r8
	adds r1, #6
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl PutDrawText
	movs r5, #2
	cmp r7, #3
	bne _08080316
	movs r5, #4
_08080316:
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bne _0808031E
	movs r5, #4
_0808031E:
	mov r4, r8
	adds r4, #0x12
	adds r4, r6, r4
	adds r0, r7, #0
	bl GetSupportLevelSpecialChar
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutSpecialChar
	ldr r1, [sp, #8]
	adds r1, #2
	str r1, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r0, #8
	str r0, [sp, #0x10]
_08080340:
	movs r1, #1
	add sb, r1
	cmp sb, sl
	blt _080802B0
_08080348:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080358: .4byte 0x0200310C
_0808035C: .4byte 0x02003244

	thumb_func_start DisplayWeaponExp
DisplayWeaponExp: @ 0x08080360
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	adds r1, r3, #0
	ldr r0, _08080414 @ =0x0200310C
	ldr r0, [r0, #0xc]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r4, r2, #5
	adds r0, r4, r6
	lsls r0, r0, #1
	ldr r2, _08080418 @ =0x0200323C
	mov r8, r2
	add r0, r8
	adds r1, #0x70
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	movs r7, #2
	cmp r5, #0xfa
	ble _0808039C
	movs r7, #4
_0808039C:
	adds r4, #4
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	adds r0, r5, #0
	bl GetWeaponLevelSpecialCharFromExp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutSpecialChar
	add r2, sp, #0x10
	adds r0, r5, #0
	add r1, sp, #0xc
	bl GetWeaponExpProgressState
	mov r0, sb
	lsls r5, r0, #1
	add r5, sb
	lsls r5, r5, #1
	ldr r2, _0808041C @ =0x00000401
	adds r5, r5, r2
	mov r4, sl
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #2
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r0, _08080420 @ =0x02003C3C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	movs r0, #0x22
	str r0, [sp]
	ldr r1, [sp, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, [sp, #0x10]
	subs r1, #1
	bl __divsi3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutDrawUiGauge
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080414: .4byte 0x0200310C
_08080418: .4byte 0x0200323C
_0808041C: .4byte 0x00000401
_08080420: .4byte 0x02003C3C

	thumb_func_start sub_08080424
sub_08080424: @ 0x08080424
	push {r4, lr}
	ldr r0, _0808047C @ =0x083FCB30
	ldr r4, _08080480 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080484 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080488 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808048C
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #5
	bl DisplayWeaponExp
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #6
	bl DisplayWeaponExp
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #7
	bl DisplayWeaponExp
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #4
	bl DisplayWeaponExp
	b _080804BC
	.align 2, 0
_0808047C: .4byte 0x083FCB30
_08080480: .4byte 0x02020140
_08080484: .4byte 0x0200373C
_08080488: .4byte 0x0200310C
_0808048C:
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl DisplayWeaponExp
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #1
	bl DisplayWeaponExp
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #2
	bl DisplayWeaponExp
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #3
	bl DisplayWeaponExp
_080804BC:
	bl PutStatScreenSupportList
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutStatScreenPage
PutStatScreenPage: @ 0x080804C8
	push {r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _08080508 @ =0x08404B60
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r5, #0
	str r5, [sp, #0x10]
	add r0, sp, #0x10
	ldr r1, _0808050C @ =0x0200323C
	ldr r2, _08080510 @ =0x01000140
	bl CpuFastSet
	str r5, [sp, #0x14]
	add r0, sp, #0x14
	ldr r1, _08080514 @ =0x02003C3C
	ldr r2, _08080518 @ =0x01000120
	bl CpuFastSet
	lsls r4, r4, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	bl _call_via_r0
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080508: .4byte 0x08404B60
_0808050C: .4byte 0x0200323C
_08080510: .4byte 0x01000140
_08080514: .4byte 0x02003C3C
_08080518: .4byte 0x01000120
