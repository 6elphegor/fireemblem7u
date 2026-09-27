	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F0A4
sub_0808F0A4: @ 0x0808F0A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	str r5, [r6, #0x58]
	ldr r4, _0808F0C8 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x11
	beq _0808F0E0
	cmp r0, #0x11
	bgt _0808F0CC
	cmp r0, #9
	beq _0808F0D2
	b _0808F12C
	.align 2, 0
_0808F0C8: .4byte 0x0202BBF8
_0808F0CC:
	cmp r0, #0x14
	beq _0808F118
	b _0808F12C
_0808F0D2:
	bl sub_0808EFFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F12C
	movs r0, #8
	b _0808F12A
_0808F0E0:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F106
	ldr r1, [r6, #0x58]
	movs r0, #4
	orrs r1, r0
	str r1, [r6, #0x58]
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808F12C
	movs r0, #1
	orrs r1, r0
	str r1, [r6, #0x58]
	b _0808F12C
_0808F106:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808F12C
	ldr r0, [r6, #0x58]
	movs r1, #2
	orrs r0, r1
	b _0808F12A
_0808F118:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F128
	str r5, [r6, #0x58]
	b _0808F12C
_0808F128:
	movs r0, #4
_0808F12A:
	str r0, [r6, #0x58]
_0808F12C:
	bl sub_0808F034
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F13A
	movs r0, #0x10
	str r0, [r6, #0x58]
_0808F13A:
	ldr r0, [r6, #0x58]
	cmp r0, #0
	bne _0808F14A
	adds r0, r6, #0
	movs r1, #0xc8
	bl Proc_Goto
	b _0808F35C
_0808F14A:
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r3, _0808F2F4 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r4, _0808F2F8 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F1A0
	movs r1, #1
_0808F1A0:
	adds r0, #0x84
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r6, #0x5c]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0xa
	movs r3, #0xc
	bl DrawUiFrame2
	ldr r0, _0808F2FC @ =0x0000113D
	bl DecodeMsg
	ldr r5, _0808F300 @ =0x02023DA6
	movs r4, #8
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F304 @ =0x0000113E
	bl DecodeMsg
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F308 @ =0x00001146
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F30C @ =0x00001141
	bl DecodeMsg
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #0x8a
	lsls r0, r0, #5
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808F310 @ =0x08404BBC
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808F314 @ =0x08404BDC
	ldr r1, _0808F318 @ =0x06005800
	bl Decompress
	ldr r0, _0808F31C @ =0x02023578
	ldr r1, _0808F320 @ =0x084050D8
	ldr r2, _0808F324 @ =0x0000F2C0
	bl sub_080AACD8
	adds r7, r6, #0
	adds r7, #0x4c
	movs r0, #0x64
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0808F328 @ =0x020106B4
	movs r4, #4
_0808F266:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808F266
	ldr r0, _0808F32C @ =0x08405EC4
	ldr r1, _0808F330 @ =0x06011000
	bl Decompress
	ldr r0, _0808F334 @ =0x0840624C
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	movs r1, #8
	bl StartPrepMuralBackground
	ldr r0, _0808F338 @ =0x084062AC
	movs r2, #0x83
	lsls r2, r2, #3
	ldr r3, _0808F33C @ =0x0000EC80
	movs r4, #0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	strh r4, [r7]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	adds r0, r6, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl DrawAtMenuUpfx
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #4
	bl Prep_DrawChapterGoal
	ldr r0, _0808F2F8 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _0808F344
	ldr r0, _0808F340 @ =0x000003E3
	adds r1, r6, #0
	bl StartPrepMenuDescHandler
	b _0808F34E
	.align 2, 0
_0808F2F4: .4byte 0x03002870
_0808F2F8: .4byte 0x0202BBF8
_0808F2FC: .4byte 0x0000113D
_0808F300: .4byte 0x02023DA6
_0808F304: .4byte 0x0000113E
_0808F308: .4byte 0x00001146
_0808F30C: .4byte 0x00001141
_0808F310: .4byte 0x08404BBC
_0808F314: .4byte 0x08404BDC
_0808F318: .4byte 0x06005800
_0808F31C: .4byte 0x02023578
_0808F320: .4byte 0x084050D8
_0808F324: .4byte 0x0000F2C0
_0808F328: .4byte 0x020106B4
_0808F32C: .4byte 0x08405EC4
_0808F330: .4byte 0x06011000
_0808F334: .4byte 0x0840624C
_0808F338: .4byte 0x084062AC
_0808F33C: .4byte 0x0000EC80
_0808F340: .4byte 0x000003E3
_0808F344:
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r1, r6, #0
	bl StartPrepMenuDescHandler
_0808F34E:
	movs r0, #0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _0808F368 @ =sub_0808EF94
	adds r1, r6, #0
	bl StartParallelWorker
_0808F35C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F368: .4byte sub_0808EF94
