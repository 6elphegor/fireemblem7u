	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADFA0
sub_080ADFA0: @ 0x080ADFA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r5, #0
	ldr r0, _080AE1B0 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _080ADFBE
	movs r5, #1
	cmp r0, #2
	beq _080ADFBE
	movs r5, #2
_080ADFBE:
	ldr r1, _080AE1B4 @ =0x08CE583C
	ldr r0, [r1]
	movs r2, #0
	mov sb, r2
	movs r4, #0
	strh r5, [r0, #0x32]
	bl GetOptionMenuLayoutId
	ldr r2, _080AE1B4 @ =0x08CE583C
	ldr r1, [r2]
	ldr r2, _080AE1B8 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x34]
	strh r4, [r1, #0x2a]
	strh r4, [r1, #0x2c]
	mov r0, sl
	strh r4, [r0, #0x2e]
	strh r4, [r0, #0x30]
	adds r0, #0x36
	mov r1, sb
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bl UnpackUiWindowFrameGraphics
	ldr r7, _080AE1BC @ =0x03002870
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r2, #2
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	movs r2, #4
	orrs r0, r2
	movs r6, #8
	orrs r0, r6
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sl
	ldrh r2, [r0, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x20
	ldrb r1, [r7, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	mov r2, sb
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x20
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	orrs r0, r4
	mov r2, r8
	orrs r0, r2
	movs r2, #4
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r4, r0
	mov r2, r8
	orrs r4, r2
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r6
	orrs r4, r5
	strb r4, [r1]
	ldr r0, _080AE1C0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r5, _080AE1C4 @ =0x02023460
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080AE1C8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080AE1CC @ =0x02024460
	movs r1, #0
	bl TmFill
	ldr r4, _080AE1D0 @ =0x0841E338
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AE1D4 @ =0x0841DA40
	ldr r1, _080AE1D8 @ =0x06011800
	bl Decompress
	ldr r0, _080AE1DC @ =0x0841DCA4
	ldr r1, _080AE1E0 @ =0x06004000
	bl Decompress
	ldr r4, _080AE1E4 @ =0x0841DC90
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _080AE1E8 @ =0x06005000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080AE1EC @ =0x0841E180
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
	ldr r1, _080AE1F0 @ =0x00000404
	adds r5, r5, r1
	ldr r1, _080AE1F4 @ =0x0841E204
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
	bl ResetTextFont
	ldr r2, _080AE1B4 @ =0x08CE583C
	ldr r0, [r2]
	adds r0, #0xa8
	movs r1, #0x16
	bl InitText
	bl sub_080ADCC4
	ldr r1, _080AE1B4 @ =0x08CE583C
	ldr r0, [r1]
	adds r0, #0x68
	movs r1, #9
	bl InitText
	ldr r2, _080AE1B4 @ =0x08CE583C
	ldr r0, [r2]
	adds r0, #0xa0
	movs r1, #0xe
	bl InitText
	movs r5, #0
	ldr r0, _080AE1B4 @ =0x08CE583C
	mov r8, r0
	movs r7, #0x70
	movs r6, #0x38
	movs r4, #4
_080AE148:
	adds r0, r5, #0
	movs r1, #4
	bl sub_080ADC24
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	movs r1, #9
	bl InitText
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r7
	movs r1, #0xe
	bl InitText
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080ADD34
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080ADDB4
	adds r7, #8
	adds r6, #8
	adds r4, #2
	adds r5, #1
	cmp r5, #5
	ble _080AE148
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sl
	movs r1, #0
	bl sub_080ADB8C
	ldr r0, _080AE1F8 @ =0x08CE5BB8
	mov r1, sl
	bl Proc_Start
	movs r0, #0xf
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE1B0: .4byte 0x0202BBF8
_080AE1B4: .4byte 0x08CE583C
_080AE1B8: .4byte 0x08CE5868
_080AE1BC: .4byte 0x03002870
_080AE1C0: .4byte 0x02022C60
_080AE1C4: .4byte 0x02023460
_080AE1C8: .4byte 0x02023C60
_080AE1CC: .4byte 0x02024460
_080AE1D0: .4byte 0x0841E338
_080AE1D4: .4byte 0x0841DA40
_080AE1D8: .4byte 0x06011800
_080AE1DC: .4byte 0x0841DCA4
_080AE1E0: .4byte 0x06004000
_080AE1E4: .4byte 0x0841DC90
_080AE1E8: .4byte 0x06005000
_080AE1EC: .4byte 0x0841E180
_080AE1F0: .4byte 0x00000404
_080AE1F4: .4byte 0x0841E204
_080AE1F8: .4byte 0x08CE5BB8
