	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_DrawSMSAndObjs
PrepUnit_DrawSMSAndObjs: @ 0x0809303C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r6, #0
	b _08093078
_08093046:
	asrs r0, r6, #1
	lsls r0, r0, #4
	ldrh r1, [r7, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _08093076
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutUnitSprite
_08093076:
	adds r6, #1
_08093078:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _08093046
	movs r0, #0xf
	ldrh r2, [r7, #0x30]
	ands r0, r2
	cmp r0, #0
	beq _08093120
	ldr r0, _0809311C @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r2, #1
	ldrb r0, [r6]
	orrs r0, r2
	movs r4, #2
	orrs r0, r4
	movs r5, #5
	rsbs r5, r5, #0
	ands r0, r5
	movs r3, #8
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r2
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r2, r0
	orrs r2, r4
	movs r0, #4
	orrs r2, r0
	orrs r2, r3
	orrs r2, r5
	strb r2, [r1]
	b _08093136
	.align 2, 0
_0809311C: .4byte 0x03002870
_08093120:
	ldr r2, _0809317C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
_08093136:
	ldr r3, _08093180 @ =0x08CC4818
	movs r4, #0x40
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8e
	bl PutSpriteExt
	adds r1, r7, #0
	adds r1, #0x37
	ldrb r0, [r1]
	cmp r0, #0
	beq _08093154
	adds r0, #1
	strb r0, [r1]
_08093154:
	ldrb r1, [r1]
	lsrs r0, r1, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08093196
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093188
	ldr r3, _08093184 @ =0x08CC4840
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
	b _08093196
	.align 2, 0
_0809317C: .4byte 0x03002870
_08093180: .4byte 0x08CC4818
_08093184: .4byte 0x08CC4840
_08093188:
	ldr r3, _080931A4 @ =0x08CC482C
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
_08093196:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080931A4: .4byte 0x08CC482C
