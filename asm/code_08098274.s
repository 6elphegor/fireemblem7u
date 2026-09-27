	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098274
sub_08098274: @ 0x08098274
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r7, [r0]
	adds r3, r1, #0
	cmp r3, #5
	bne _08098290
	movs r3, #4
	b _08098298
_08098290:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098298
	subs r3, #1
_08098298:
	cmp r1, #0
	beq _08098318
	ldr r1, _080982BC @ =0x08B857F8
	ldr r5, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r5, #6]
	ands r0, r2
	adds r2, r4, #0
	adds r2, #0x30
	cmp r0, #0
	beq _080982CC
	ldrb r0, [r2]
	cmp r0, #0
	beq _080982C0
	subs r0, #1
	strb r0, [r2]
	b _080982CC
	.align 2, 0
_080982BC: .4byte 0x08B857F8
_080982C0:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080982CC
	strb r3, [r2]
_080982CC:
	ldr r1, [r1]
	movs r4, #0x80
	adds r0, r4, #0
	ldrh r5, [r1, #6]
	ands r0, r5
	cmp r0, #0
	beq _080982F2
	ldrb r0, [r2]
	cmp r0, r3
	bge _080982E4
	adds r0, #1
	b _080982F0
_080982E4:
	adds r0, r4, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080982F2
	movs r0, #0
_080982F0:
	strb r0, [r2]
_080982F2:
	ldrb r2, [r2]
	cmp r7, r2
	beq _08098318
	ldr r0, _08098310 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809830A
	ldr r0, _08098314 @ =0x00000386
	bl m4aSongNumStart
_0809830A:
	movs r0, #1
	b _0809831A
	.align 2, 0
_08098310: .4byte 0x0202BBF8
_08098314: .4byte 0x00000386
_08098318:
	movs r0, #0
_0809831A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
