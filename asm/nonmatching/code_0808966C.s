	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808966C
sub_0808966C: @ 0x0808966C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _080896C0 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _080896C8
	ldr r0, _080896C4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	adds r0, #0x40
	cmp r5, r0
	bge _08089704
_0808968C:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080896B2
	ldr r0, [r4]
	cmp r0, #0
	beq _080896B2
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080896B2
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0808955C
_080896B2:
	adds r5, #1
	ldr r0, _080896C4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r0, #0x40
	cmp r5, r0
	blt _0808968C
	b _08089704
	.align 2, 0
_080896C0: .4byte 0x0200E668
_080896C4: .4byte 0x0202BBF8
_080896C8:
	ldr r0, _080896D0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _080896FE
	.align 2, 0
_080896D0: .4byte 0x0202BBF8
_080896D4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080896F8
	ldr r0, [r2]
	cmp r0, #0
	beq _080896F8
	ldr r0, [r2, #0xc]
	ldr r1, _0808970C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080896F8
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_0808955C
_080896F8:
	adds r4, #1
	ldr r0, _08089710 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
_080896FE:
	adds r0, #0x40
	cmp r4, r0
	blt _080896D4
_08089704:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808970C: .4byte 0x0001000C
_08089710: .4byte 0x0202BBF8
