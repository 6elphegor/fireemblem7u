	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08086C10
sub_08086C10: @ 0x08086C10
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08086CA0 @ =0x020040CC
	ldr r0, _08086CA4 @ =0x02022F12
	movs r1, #3
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	adds r0, #8
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	cmp r4, #0
	bne _08086C40
	b _08086D78
_08086C40:
	ldr r0, [r4, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08086CAC
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x80
	bl Text_SetCursor
	ldr r4, _08086CA8 @ =0x0000127C
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #1
	bl UpdateUnitSpritePal
	b _08086DC4
	.align 2, 0
_08086CA0: .4byte 0x020040CC
_08086CA4: .4byte 0x02022F12
_08086CA8: .4byte 0x0000127C
_08086CAC:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x88
	bl Text_SetCursor
	movs r1, #8
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _08086D04
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	ldr r0, _08086D00 @ =0x0000127C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b _08086D1A
	.align 2, 0
_08086D00: .4byte 0x0000127C
_08086D04:
	adds r0, r5, #0
	movs r1, #0xa8
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
_08086D1A:
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _08086D40
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	ldr r0, _08086D3C @ =0x0000127C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b _08086D56
	.align 2, 0
_08086D3C: .4byte 0x0000127C
_08086D40:
	adds r0, r5, #0
	movs r1, #0xc0
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
_08086D56:
	adds r0, r4, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08086D74 @ =0x02022F12
	movs r2, #0xa0
	lsls r2, r2, #2
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl PutFaceChibi
	movs r0, #0
	bl UpdateUnitSpritePal
	b _08086DC4
	.align 2, 0
_08086D74: .4byte 0x02022F12
_08086D78:
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x80
	bl Text_SetCursor
	ldr r4, _08086E2C @ =0x0000127C
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
_08086DC4:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0xb1
	bl Text_SetCursor
	ldr r0, _08086E30 @ =0x000012B0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	ldr r2, _08086E34 @ =0x030028AC
	ldr r0, _08086E38 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _08086E3C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x3f
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #0x40
	orrs r1, r0
	movs r3, #0
	movs r0, #7
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r3, [r2, #0xa]
	subs r0, #0x28
	ands r1, r0
	strb r1, [r2]
	ldrb r1, [r2, #1]
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086E2C: .4byte 0x0000127C
_08086E30: .4byte 0x000012B0
_08086E34: .4byte 0x030028AC
_08086E38: .4byte 0x0000FFE0
_08086E3C: .4byte 0x0000E0FF
