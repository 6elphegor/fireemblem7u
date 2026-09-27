	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08094350
sub_08094350: @ 0x08094350
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _08094448 @ =0x0840F3C4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0809444C @ =0x08CC3B18
	ldrh r0, [r0]
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	ldr r3, _08094450 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r4, [r3, #0xc]
	ands r0, r4
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r4, [r3, #0x14]
	ands r2, r4
	strb r2, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08094454 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _08094458 @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08094416:
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r0, r6, #0
	movs r1, #7
	bl InitTextDb
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08094416
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x38]
	ldr r1, [r2, #0x40]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0809445C
	adds r0, r1, #0
	adds r0, #8
	str r0, [r2, #0x34]
	b _08094476
	.align 2, 0
_08094448: .4byte 0x0840F3C4
_0809444C: .4byte 0x08CC3B18
_08094450: .4byte 0x03002870
_08094454: .4byte 0x06014000
_08094458: .4byte 0x02012A20
_0809445C:
	mov r3, r8
	ldr r0, [r3, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08094470
	movs r0, #8
	mov r4, r8
	str r0, [r4, #0x34]
	b _08094476
_08094470:
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x34]
_08094476:
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r4, #4
	rsbs r4, r4, #0
	ldr r0, _08094614 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartBmFace
	mov r3, r8
	ldr r0, [r3, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _08094618 @ =0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl StartBmFace
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #7
	bl EnableBgSync
	mov r4, r8
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _0809461C @ =0x02022C60
	mov sb, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, sb
	movs r2, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, sb
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, sb
	ldr r4, _08094620 @ =0x02012A20
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, sb
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	mov r0, r8
	bl StartUiCursorHand
	mov r0, r8
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r5, #0x80
	lsls r5, r5, #4
	movs r2, #0xb
	adds r3, r5, #0
	bl ShowSysHandCursor
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl EnableSysBrownBox
	ldr r3, _08094624 @ =0x03002870
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, _08094628 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0809462C @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r3, #0x3c]
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094614: .4byte 0x00000203
_08094618: .4byte 0x00000202
_0809461C: .4byte 0x02022C60
_08094620: .4byte 0x02012A20
_08094624: .4byte 0x03002870
_08094628: .4byte 0x0000FFE0
_0809462C: .4byte 0x0000E0FF
