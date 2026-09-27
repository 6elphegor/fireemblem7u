	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADEA8
sub_080ADEA8: @ 0x080ADEA8
	push {r4, r5, r6, r7, lr}
	bl GetOptionMenuLayoutId
	ldr r1, _080ADF88 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r6, _080ADF8C @ =0x08CE583C
	ldr r1, [r6]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r5, [r0]
	bl GetGameTime
	movs r1, #0xf
	ands r0, r1
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _080ADF90 @ =0x08CE5898
	movs r3, #0x83
	lsls r3, r3, #6
	movs r0, #0x22
	movs r1, #8
	bl PutOamHiRam
	ldr r0, [r6]
	movs r1, #0x2a
	ldrsh r4, [r0, r1]
	movs r2, #0x2c
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #4
	adds r4, #0x20
	movs r0, #0x10
	adds r1, r4, #0
	bl DisplayFrozenUiHand
	adds r0, r5, #0
	bl sub_080AE360
	ldr r2, _080ADF94 @ =0x08CE58D8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	movs r1, #0x2c
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	bl PutUiHand
	ldr r1, [r6]
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #6
	ble _080ADF58
	movs r2, #0x2c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080ADF3A
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x1d
	movs r3, #1
	bl sub_080B1FB0
_080ADF3A:
	ldr r0, [r6]
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	movs r2, #0x34
	ldrsh r0, [r0, r2]
	subs r0, #6
	cmp r1, r0
	bge _080ADF58
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x7d
	movs r3, #0
	bl sub_080B1FB0
_080ADF58:
	bl GetSelectedGameOption
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080ADF80
	bl sub_080ADB48
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080ADF80
	ldr r2, _080ADF98 @ =0x08B905B8
	ldr r3, _080ADF9C @ =0x000020CC
	cmp r7, #0
	beq _080ADF78
	adds r3, #2
_080ADF78:
	movs r0, #0xc0
	movs r1, #0x20
	bl PutOamHiRam
_080ADF80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF88: .4byte 0x08CE5868
_080ADF8C: .4byte 0x08CE583C
_080ADF90: .4byte 0x08CE5898
_080ADF94: .4byte 0x08CE58D8
_080ADF98: .4byte 0x08B905B8
_080ADF9C: .4byte 0x000020CC
