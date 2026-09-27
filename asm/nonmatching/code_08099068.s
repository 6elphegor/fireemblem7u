	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099068
sub_08099068: @ 0x08099068
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0809909C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080990FC
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080990E0
	cmp r1, #1
	beq _080990BC
	cmp r1, #1
	bgt _080990A0
	cmp r1, #0
	beq _080990AA
	b _080990E0
	.align 2, 0
_0809909C: .4byte 0x08B857F8
_080990A0:
	cmp r1, #2
	beq _080990B0
	cmp r1, #3
	beq _080990B6
	b _080990E0
_080990AA:
	adds r0, r4, #0
	movs r1, #2
	b _080990C0
_080990B0:
	adds r0, r4, #0
	movs r1, #3
	b _080990C0
_080990B6:
	adds r0, r4, #0
	movs r1, #4
	b _080990C0
_080990BC:
	adds r0, r4, #0
	movs r1, #5
_080990C0:
	bl Proc_Goto
	ldr r0, _080990D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099168
	ldr r0, _080990DC @ =0x0000038A
	bl m4aSongNumStart
	b _08099168
	.align 2, 0
_080990D8: .4byte 0x0202BBF8
_080990DC: .4byte 0x0000038A
_080990E0:
	ldr r0, _080990F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099168
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08099168
	.align 2, 0
_080990F8: .4byte 0x0202BBF8
_080990FC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099128
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099120 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099168
	ldr r0, _08099124 @ =0x0000038B
	bl m4aSongNumStart
	b _08099168
	.align 2, 0
_08099120: .4byte 0x0202BBF8
_08099124: .4byte 0x0000038B
_08099128:
	adds r0, r4, #0
	bl sub_08098FC4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099168
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r2, r6, #0
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x1c
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x50
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #8
	bl ShowSysHandCursor
	ldr r1, _08099170 @ =0x08CC50C0
	ldrb r5, [r5]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_08098F88
_08099168:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099170: .4byte 0x08CC50C0
