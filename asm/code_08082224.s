	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082224
sub_08082224: @ 0x08082224
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r4, #0
	b _08082288
_0808222E:
	adds r0, r6, #0
	bl sub_080820E8
	cmp r0, #0x80
	bne _08082250
	cmp r4, r5
	bls _08082246
	adds r0, r4, #3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	b _08082286
_08082246:
	adds r0, r5, #3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, r5, #0
	b _08082286
_08082250:
	lsls r1, r0, #3
	ldr r0, _08082268 @ =0x08CC2784
	adds r2, r1, r0
	ldrb r0, [r2]
	subs r1, r4, r0
	ldrb r3, [r2, #1]
	subs r0, r5, r3
	cmp r1, r0
	ble _0808226C
	adds r5, r4, #0
	b _0808226E
	.align 2, 0
_08082268: .4byte 0x08CC2784
_0808226C:
	adds r4, r5, #0
_0808226E:
	adds r0, r4, #0
	adds r0, #0xff
	ldrb r1, [r2, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xff
	ldrb r2, [r2, #3]
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08082286:
	adds r6, #1
_08082288:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08082292
	cmp r0, #0x1f
	bne _0808222E
_08082292:
	adds r1, r4, r5
	asrs r1, r1, #1
	movs r0, #0xc0
	subs r0, r0, r1
	asrs r0, r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
