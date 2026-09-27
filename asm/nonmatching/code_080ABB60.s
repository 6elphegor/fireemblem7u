	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomUi_Loop_MainKeyHandler
SoundRoomUi_Loop_MainKeyHandler: @ 0x080ABB60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ABC54
	ldr r0, _080ABC3C @ =0x08B857F8
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	adds r3, r4, #0
	adds r3, #0x38
	movs r0, #4
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r6, [r1, #4]
	ands r0, r6
	cmp r0, #0
	beq _080ABB92
	ldrh r2, [r1, #4]
	movs r0, #8
	strb r0, [r3]
_080ABB92:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080ABB9E
	movs r5, #4
	rsbs r5, r5, #0
_080ABB9E:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080ABBA8
	movs r5, #4
_080ABBA8:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080ABBC2
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080ABBC2
	movs r5, #1
	rsbs r5, r5, #0
_080ABBC2:
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _080ABBDA
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	bhi _080ABBDA
	movs r5, #1
_080ABBDA:
	cmp r5, #0
	beq _080ABC46
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r1, [r2]
	adds r0, r1, r5
	cmp r0, #0
	bge _080ABBEC
	b _080ABD44
_080ABBEC:
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r1, [r1]
	cmp r0, r1
	blt _080ABBF8
	b _080ABD44
_080ABBF8:
	strb r0, [r2]
	adds r0, r4, #0
	bl TryDrawSoundRoomSongTitle
	adds r0, r4, #0
	bl sub_080AB604
	adds r5, r4, #0
	adds r5, #0x37
	strb r0, [r5]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080ABC40
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080ABC24
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080ABC24:
	ldrb r5, [r5]
	cmp r5, #1
	bne _080ABC32
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
_080ABC32:
	adds r0, r4, #0
	bl sub_080AB654
	b _080ABC46
	.align 2, 0
_080ABC3C: .4byte 0x08B857F8
_080ABC40:
	adds r0, r4, #0
	bl sub_080AB5DC
_080ABC46:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080ABC94
_080ABC54:
	adds r5, r4, #0
	adds r5, #0x37
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r1, r2
	ldrh r6, [r4, #0x2a]
	adds r2, r6, r2
	strh r2, [r4, #0x2a]
	ldr r1, _080ABC90 @ =0x0000FFFC
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x2a]
	ands r0, r1
	cmp r0, #0
	bne _080ABC86
	movs r0, #0
	strb r0, [r5]
_080ABC86:
	adds r0, r4, #0
	bl sub_080AB5AC
	b _080ABD44
	.align 2, 0
_080ABC90: .4byte 0x0000FFFC
_080ABC94:
	ldr r0, _080ABCB0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABCB4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080ABD44
	.align 2, 0
_080ABCB0: .4byte 0x08B857F8
_080ABCB4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ABCC4
	adds r0, r4, #0
	bl StopSoundRoomSong
	b _080ABD44
_080ABCC4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABD18
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	adds r0, r4, #0
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABCFC
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #0x20
	bl StartSoundRoomSong
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABD44
	adds r0, r4, #0
	bl sub_080AB4EC
	adds r1, r4, #0
	bl sub_080AC87C
	b _080ABD44
_080ABCFC:
	ldr r0, _080ABD14 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ABD44
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080ABD44
	.align 2, 0
_080ABD14: .4byte 0x0202BBF8
_080ABD18:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080ABD34
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080ABD44
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080ABD44
_080ABD34:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080ABD44
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080ABD44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
