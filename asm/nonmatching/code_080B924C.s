	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B924C
sub_080B924C: @ 0x080B924C
	push {r4, r5, r6, lr}
	ldr r2, _080B932C @ =0x0000FF78
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080B9330 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	movs r4, #0
	ldr r6, _080B9334 @ =0x08CEEBA4
	movs r5, #0x48
_080B92C4:
	lsls r1, r4, #3
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	ldr r0, [r6]
	adds r0, r0, r5
	movs r1, #0xe
	bl InitText
	adds r5, #8
	adds r4, #1
	cmp r4, #8
	ble _080B92C4
	ldr r5, _080B9334 @ =0x08CEEBA4
	ldr r0, [r5]
	adds r0, #0x90
	movs r1, #3
	bl InitText
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #2
	bl InitText
	ldr r4, [r5]
	adds r4, #0x90
	ldr r0, _080B9338 @ =0x0000118A
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #3
	bl Text_SetColor
	ldr r4, [r5]
	adds r4, #0x98
	ldr r0, _080B933C @ =0x00001185
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B932C: .4byte 0x0000FF78
_080B9330: .4byte 0x03002870
_080B9334: .4byte 0x08CEEBA4
_080B9338: .4byte 0x0000118A
_080B933C: .4byte 0x00001185
