	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A474C
sub_080A474C: @ 0x080A474C
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r4, [r2]
	cmp r4, #2
	bls _080A475E
	movs r0, #0
	strb r0, [r2]
_080A475E:
	cmp r1, #0
	bne _080A4766
_080A4762:
	movs r0, #1
	b _080A47AE
_080A4766:
	cmp r1, #0
	ble _080A4778
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080A4774
	adds r0, #1
	b _080A4784
_080A4774:
	movs r0, #0
	b _080A4784
_080A4778:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A4782
	movs r0, #2
	b _080A4784
_080A4782:
	subs r0, #1
_080A4784:
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r4, r0
	beq _080A47AC
	ldr r0, _080A47A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4762
	ldr r0, _080A47A8 @ =0x00000386
	bl m4aSongNumStart
	b _080A4762
	.align 2, 0
_080A47A4: .4byte 0x0202BBF8
_080A47A8: .4byte 0x00000386
_080A47AC:
	movs r0, #0
_080A47AE:
	pop {r4}
	pop {r1}
	bx r1
