	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045354
sub_08045354: @ 0x08045354
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldr r1, _08045384 @ =0x0203DC9C
	ldrb r2, [r1, #2]
	adds r5, r2, #0
	strb r2, [r1, #3]
	movs r0, #0xf0
	ands r0, r3
	adds r7, r1, #0
	cmp r0, #0
	beq _08045442
	lsls r4, r2, #2
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0804538C
	ldr r0, _08045388 @ =0x08B99BC8
	adds r0, r4, r0
	b _080453C2
	.align 2, 0
_08045384: .4byte 0x0203DC9C
_08045388: .4byte 0x08B99BC8
_0804538C:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080453A0
	ldr r1, _0804539C @ =0x08B99BC8
	adds r0, r4, #1
	b _080453C0
	.align 2, 0
_0804539C: .4byte 0x08B99BC8
_080453A0:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080453B4
	ldr r1, _080453B0 @ =0x08B99BC8
	adds r0, r4, #2
	b _080453C0
	.align 2, 0
_080453B0: .4byte 0x08B99BC8
_080453B4:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _080453C4
	ldr r1, _08045420 @ =0x08B99BC8
	adds r0, r4, #3
_080453C0:
	adds r0, r0, r1
_080453C2:
	ldrb r2, [r0]
_080453C4:
	subs r5, r2, r5
	ldrb r0, [r7, #3]
	cmp r0, #0
	bne _080453D8
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080453D8
	movs r5, #1
	rsbs r5, r5, #0
_080453D8:
	ldrb r0, [r7, #3]
	cmp r0, #0x13
	bne _080453E8
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080453E8
	movs r5, #1
_080453E8:
	ldr r6, _08045424 @ =0x03001400
	mov r0, ip
	lsls r4, r0, #0x18
_080453EE:
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	cmp r1, #0
	beq _0804540C
	cmp r4, #0
	beq _08045440
	lsrs r1, r1, #0x1e
	ldr r0, _08045428 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08045440
_0804540C:
	cmp r5, #0
	bge _0804542C
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _080453EE
	movs r2, #0x13
	b _080453EE
	.align 2, 0
_08045420: .4byte 0x08B99BC8
_08045424: .4byte 0x03001400
_08045428: .4byte 0x08B98AEC
_0804542C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _080453EE
_08045440:
	strb r2, [r7, #2]
_08045442:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
