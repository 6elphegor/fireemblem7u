	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084490
sub_08084490: @ 0x08084490
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08084500 @ =0x0203E6F4
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #1
	bl SetTextFontGlyphs
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08084504
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #6
	bl Text_SetColor
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08084522
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08084522
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #6
	bl Text_SetColor
	b _08084522
	.align 2, 0
_08084500: .4byte 0x0203E6F4
_08084504:
	movs r4, #0
	b _08084516
_08084508:
	lsls r0, r4, #3
	ldr r1, _080845A0 @ =0x0203E70C
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetColor
	adds r4, #1
_08084516:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08084508
_08084522:
	movs r0, #0
	bl SetTextFont
	ldr r4, _080845A4 @ =0x08CC2ACC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, _080845A8 @ =0x0203E6F4
	str r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r4, #0x34]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x40]
	adds r0, #8
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	bl DecodeMsg
	bl MsgExpand
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	bl sub_0808446C
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080845AC
	bl GetTextPrintDelay
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x80
	cmp r0, #0
	beq _08084598
	movs r1, #1
_08084598:
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b _080845BA
	.align 2, 0
_080845A0: .4byte 0x0203E70C
_080845A4: .4byte 0x08CC2ACC
_080845A8: .4byte 0x0203E6F4
_080845AC:
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0x80
	strh r0, [r1]
_080845BA:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
