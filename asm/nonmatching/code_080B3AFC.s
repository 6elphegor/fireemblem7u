	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3AFC
sub_080B3AFC: @ 0x080B3AFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080B3B44 @ =0x08CE7630
	bl Proc_Find
	adds r4, r0, #0
	cmp r5, #3
	bhi _080B3B66
	cmp r4, #0
	beq _080B3B66
	lsls r6, r5, #3
	adds r0, #0x30
	adds r5, r0, r6
	ldr r0, [r5]
	cmp r0, #0
	beq _080B3B66
	bl EndSpriteAnimProc
	movs r0, #0
	str r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080B3B48
	movs r1, #0
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _080B3B66
	.align 2, 0
_080B3B44: .4byte 0x08CE7630
_080B3B48:
	ldrh r3, [r4, #0x2e]
	adds r1, r4, r6
	ldrh r5, [r1, #0x36]
	ldr r2, _080B3B6C @ =0x085E99B4
	adds r1, #0x34
	ldrb r6, [r1]
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0xc]
	adds r0, r0, r5
	cmp r3, r0
	bne _080B3B66
	strh r5, [r4, #0x2e]
_080B3B66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3B6C: .4byte 0x085E99B4
