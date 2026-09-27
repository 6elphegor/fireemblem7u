	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808A214
sub_0808A214: @ 0x0808A214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	ldr r2, _0808A248 @ =0x08B857F8
	cmp r0, #0
	beq _0808A24C
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808A24C
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808A4F4
	.align 2, 0
_0808A248: .4byte 0x08B857F8
_0808A24C:
	ldr r1, [r2]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808A338
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808A338
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x2a
	movs r0, #1
	strb r0, [r2]
	ldr r0, _0808A2D4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	mov r8, r1
	cmp r0, #0
	blt _0808A286
	ldr r0, _0808A2D8 @ =0x0000038A
	bl m4aSongNumStart
_0808A286:
	ldr r1, _0808A2DC @ =0x08CC3578
	adds r6, r7, #0
	adds r6, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r2, [r5]
	lsls r0, r2, #3
	adds r0, r0, r2
	ldrb r3, [r6]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r4, r8
	strb r0, [r4]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl SortUnitList
	lsls r0, r0, #0x18
	mov sb, r4
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	adds r3, r7, #0
	adds r3, #0x35
	str r3, [sp, #8]
	cmp r0, #0
	beq _0808A30C
	movs r4, #0
	b _0808A2F8
	.align 2, 0
_0808A2D4: .4byte 0x0202BBF8
_0808A2D8: .4byte 0x0000038A
_0808A2DC: .4byte 0x08CC3578
_0808A2E0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r5]
	movs r0, #1
	str r0, [sp]
	adds r0, r7, #0
	ldr r2, _0808A330 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	cmp r4, #5
	bgt _0808A300
_0808A2F8:
	ldr r0, _0808A334 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A2E0
_0808A300:
	ldrh r0, [r7, #0x3e]
	bl sub_8090358
	movs r0, #1
	bl EnableBgSync
_0808A30C:
	mov r4, sb
	ldrb r0, [r4]
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r6]
	ldr r2, [sp, #8]
	strb r0, [r2]
	mov r3, r8
	ldrb r3, [r3]
	ldr r4, [sp, #4]
	cmp r3, r4
	bne _0808A326
	b _0808A4F4
_0808A326:
	mov r6, r8
	ldrb r0, [r6]
	bl sub_8090238
	b _0808A4F4
	.align 2, 0
_0808A330: .4byte 0x02022C60
_0808A334: .4byte 0x0200E668
_0808A338:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808A378
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r4, [r0]
	cmp r4, #0
	bne _0808A378
	ldr r0, _0808A370 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A360
	ldr r0, _0808A374 @ =0x00000386
	bl m4aSongNumStart
_0808A360:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	strb r4, [r0]
	b _0808A4F4
	.align 2, 0
_0808A370: .4byte 0x0202BBF8
_0808A374: .4byte 0x00000386
_0808A378:
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	movs r0, #0x20
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0808A412
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	subs r1, #6
	ldrb r0, [r1]
	adds r6, r1, #0
	cmp r0, #0
	bne _0808A40C
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0808A3A6
	b _0808A4F4
_0808A3A6:
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A3B2
	b _0808A4F4
_0808A3B2:
	ldr r0, _0808A400 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A3C4
	ldr r0, _0808A404 @ =0x0000038F
	bl m4aSongNumStart
_0808A3C4:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r4, #8
	ldr r2, _0808A408 @ =0x08CC3578
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0808A3FA
	adds r0, r1, r2
	adds r1, r0, #0
	adds r1, #0x80
_0808A3EC:
	subs r1, #0x10
	subs r4, #1
	cmp r4, #0
	ble _0808A3FA
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0808A3EC
_0808A3FA:
	strb r4, [r6]
	b _0808A47C
	.align 2, 0
_0808A400: .4byte 0x0202BBF8
_0808A404: .4byte 0x0000038F
_0808A408: .4byte 0x08CC3578
_0808A40C:
	subs r0, #1
	strb r0, [r1]
	b _0808A496
_0808A412:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0808A4B4
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r0, [r2]
	cmp r0, #8
	beq _0808A448
	ldr r0, _0808A488 @ =0x08CC3578
	ldrb r3, [r2]
	adds r3, #1
	ldrb r6, [r5]
	lsls r1, r6, #3
	adds r1, r1, r6
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _0808A494
_0808A448:
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r5, [r5]
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0808A4F4
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _0808A4F4
	strb r4, [r2]
	ldr r0, _0808A48C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A472
	ldr r0, _0808A490 @ =0x0000038F
	bl m4aSongNumStart
_0808A472:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808A47C:
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0808A4F4
	.align 2, 0
_0808A488: .4byte 0x08CC3578
_0808A48C: .4byte 0x0202BBF8
_0808A490: .4byte 0x0000038F
_0808A494:
	strb r3, [r2]
_0808A496:
	ldr r0, _0808A4AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A4F4
	ldr r0, _0808A4B0 @ =0x00000387
	bl m4aSongNumStart
	b _0808A4F4
	.align 2, 0
_0808A4AC: .4byte 0x0202BBF8
_0808A4B0: .4byte 0x00000387
_0808A4B4:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808A4F4
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808A4F4
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0808A504 @ =0x08CC3578
	adds r3, r7, #0
	adds r3, #0x2d
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808A4F4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A504: .4byte 0x08CC3578
