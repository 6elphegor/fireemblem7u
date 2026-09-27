	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_Init
ModeSelect_Init: @ 0x080A7C84
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
	bl PutModeSelectLabelText
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
