	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08009480
sub_08009480: @ 0x08009480
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080094AC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080094BC
	ldr r0, _080094B0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080094A4
	ldr r0, _080094B4 @ =0x0000038B
	bl m4aSongNumStart
_080094A4:
	ldr r1, _080094B8 @ =0x030000E0
	movs r0, #0
	b _080094DE
	.align 2, 0
_080094AC: .4byte 0x08B857F8
_080094B0: .4byte 0x0202BBF8
_080094B4: .4byte 0x0000038B
_080094B8: .4byte 0x030000E0
_080094BC:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080094F4
	ldr r0, _080094E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080094D8
	ldr r0, _080094EC @ =0x0000038A
	bl m4aSongNumStart
_080094D8:
	ldr r1, _080094F0 @ =0x030000E0
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
_080094DE:
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08009574
	.align 2, 0
_080094E8: .4byte 0x0202BBF8
_080094EC: .4byte 0x0000038A
_080094F0: .4byte 0x030000E0
_080094F4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08009522
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	bne _08009522
	ldr r0, _0800957C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009514
	ldr r0, _08009580 @ =0x00000387
	bl m4aSongNumStart
_08009514:
	strh r5, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08009522
	bl _call_via_r0
_08009522:
	ldr r0, _08009584 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08009558
	ldrh r1, [r4, #0x2a]
	cmp r1, #1
	bne _08009558
	ldr r0, _0800957C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009548
	ldr r0, _08009580 @ =0x00000387
	bl m4aSongNumStart
_08009548:
	movs r0, #2
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _08009558
	bl _call_via_r0
_08009558:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl PutUiHand
_08009574:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800957C: .4byte 0x0202BBF8
_08009580: .4byte 0x00000387
_08009584: .4byte 0x08B857F8
