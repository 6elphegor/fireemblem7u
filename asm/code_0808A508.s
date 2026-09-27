	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808A508
sub_0808A508: @ 0x0808A508
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	cmp r0, #1
	beq _0808A53E
	cmp r0, #1
	bgt _0808A524
	cmp r0, #0
	beq _0808A52E
	b _0808A5A0
_0808A524:
	cmp r0, #2
	beq _0808A570
	cmp r0, #3
	beq _0808A536
	b _0808A5A0
_0808A52E:
	adds r0, r4, #0
	bl sub_809144C
	b _0808A5A0
_0808A536:
	adds r0, r4, #0
	bl sub_0808A214
	b _0808A5A0
_0808A53E:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	adds r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808A5A0
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8090358
	b _0808A5A0
_0808A570:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	subs r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808A5A0
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8090358
_0808A5A0:
	ldr r0, _0808A60C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	cmp r0, #0
	beq _0808A5D6
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808A5DC
	ldr r0, _0808A610 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A5CA
	ldr r0, _0808A614 @ =0x0000038B
	bl m4aSongNumStart
_0808A5CA:
	movs r0, #0
	bl SetStatScreenLastUnitId
	adds r0, r4, #0
	bl Proc_Break
_0808A5D6:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808A604
_0808A5DC:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r6, r3
	beq _0808A604
	ldr r2, _0808A618 @ =0x08CC3578
	adds r0, #9
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808A604:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A60C: .4byte 0x08B857F8
_0808A610: .4byte 0x0202BBF8
_0808A614: .4byte 0x0000038B
_0808A618: .4byte 0x08CC3578
