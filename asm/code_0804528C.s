	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804528C
sub_0804528C: @ 0x0804528C
	push {r4, r5, r6, r7, lr}
	movs r5, #4
	ldr r3, _080452E8 @ =0x0203DC9C
	ldr r0, _080452EC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r2, r3, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r7, [r0]
	ldr r1, _080452F0 @ =0x0203D90C
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080452F8
	movs r4, #0
	adds r5, r3, #0
	adds r5, #0xf
_080452BE:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080452DC
	ldr r0, _080452EC @ =0x08B98AEC
	ldr r0, [r0]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq _080452F4
_080452DC:
	adds r4, #1
	cmp r4, #3
	ble _080452BE
	movs r5, #3
	b _08045328
	.align 2, 0
_080452E8: .4byte 0x0203DC9C
_080452EC: .4byte 0x08B98AEC
_080452F0: .4byte 0x0203D90C
_080452F4:
	adds r0, r4, #0
	b _0804532A
_080452F8:
	movs r4, #0
	adds r6, r2, #0
_080452FC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804531E
	ldr r0, _08045330 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _0804531E
	ldr r0, [r6]
	cmp r7, r0
	bls _08045320
_0804531E:
	subs r5, #1
_08045320:
	adds r6, #4
	adds r4, #1
	cmp r4, #3
	ble _080452FC
_08045328:
	adds r0, r5, #0
_0804532A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045330: .4byte 0x08B98AEC
