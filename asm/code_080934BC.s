	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_DrawPickLeftBar
PrepUnit_DrawPickLeftBar: @ 0x080934BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r5, _08093594 @ =0x02012B48
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	cmp r4, #0
	bne _080934E8
	adds r0, r5, #0
	bl ClearText
	ldr r0, _08093598 @ =0x00001272
	bl DecodeMsg
	ldr r1, _0809359C @ =0x02022CBC
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0x28
	bl PutDrawText
_080934E8:
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl ClearTextPart
	ldr r0, _080935A0 @ =0x00001271
	bl DecodeMsg
	ldr r7, _0809359C @ =0x02022CBC
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r4, r6, #0
	adds r4, #0x29
	adds r6, #0x2a
	movs r1, #2
	ldrb r0, [r4]
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809351E
	movs r1, #1
_0809351E:
	adds r0, r5, #0
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x1c
	bl Text_SetCursor
	ldrb r3, [r6]
	ldrb r0, [r4]
	subs r1, r3, r0
	adds r0, r5, #0
	bl Text_DrawNumber
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #2
	ldrb r2, [r4]
	ldrb r3, [r6]
	cmp r2, r3
	bne _0809355E
	movs r1, #4
_0809355E:
	ldrb r2, [r4]
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x1a
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x1e
	movs r1, #2
	ldrb r4, [r4]
	ldrb r2, [r6]
	cmp r4, r2
	bne _08093580
	movs r1, #4
_08093580:
	ldrb r2, [r6]
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093594: .4byte 0x02012B48
_08093598: .4byte 0x00001272
_0809359C: .4byte 0x02022CBC
_080935A0: .4byte 0x00001271
