	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuPostChapterHandleHelpBox
SaveMenuPostChapterHandleHelpBox: @ 0x080A351C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	movs r6, #8
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A35C6
	adds r0, r2, #0
	adds r0, #0x40
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r0, #8
	bne _080A3554
	ldr r0, _080A3550 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf9
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A35B0
	bl CloseHelpBox
	movs r0, #7
	strb r0, [r5]
	b _080A35B0
	.align 2, 0
_080A3550: .4byte 0x08B857F8
_080A3554:
	ldr r0, _080A3588 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A35B0
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	bl sub_080A3474
	cmp r0, #0
	bne _080A3590
	ldr r0, _080A358C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A35B0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080A35B0
	.align 2, 0
_080A3588: .4byte 0x08B857F8
_080A358C: .4byte 0x0202BBF8
_080A3590:
	cmp r0, #0
	blt _080A35B0
	cmp r0, #2
	bgt _080A35B0
	ldr r0, _080A35CC @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldrb r4, [r4]
	lsls r1, r4, #5
	adds r1, #0x2c
	ldr r2, _080A35D0 @ =0x0000FFFF
	movs r0, #0x48
	bl StartItemHelpBox
	strb r6, [r5]
_080A35B0:
	adds r1, r5, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A35C6
	cmp r0, r6
	bge _080A35C0
	subs r0, #1
	strb r0, [r1]
_080A35C0:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A35D4
_080A35C6:
	movs r0, #0
	b _080A35D6
	.align 2, 0
_080A35CC: .4byte 0x06013800
_080A35D0: .4byte 0x0000FFFF
_080A35D4:
	movs r0, #1
_080A35D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
