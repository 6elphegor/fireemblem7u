	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080408B8
sub_080408B8: @ 0x080408B8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, _080408F8 @ =0x0203DC24
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl sub_08040640
	ldr r0, _080408FC @ =0x08B98B38
	bl Proc_Find
	cmp r0, #0
	beq _08040904
	ldr r0, _08040900 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _080408EA
	b _08040ACE
_080408EA:
	movs r0, #1
	bl SioPlaySoundEffect
	bl EndLinkArenaButtonSpriteDraw
	b _08040938
	.align 2, 0
_080408F8: .4byte 0x0203DC24
_080408FC: .4byte 0x08B98B38
_08040900: .4byte 0x08B857F8
_08040904:
	bl EndLinkArenaButtonSpriteDraw
	ldr r2, _0804094C @ =0x08B98AEC
	ldr r1, [r2]
	movs r0, #6
	ldrsb r0, [r1, r0]
	str r0, [r5, #0x34]
	movs r3, #0
	adds r1, #0x1a
	adds r5, r2, #0
_08040918:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08040922
	adds r6, #1
_08040922:
	adds r3, #1
	cmp r3, #3
	ble _08040918
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08040950
_08040938:
	bl sub_08040610
	bl sub_08040634
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08040ACE
	.align 2, 0
_0804094C: .4byte 0x08B98AEC
_08040950:
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040966
	ldr r0, [r5]
	ldrb r1, [r0, #0x1e]
	cmp r1, #0x3c
	bhi _08040966
	cmp r6, #0
	beq _08040990
_08040966:
	bl sub_08040610
	bl sub_08040634
	adds r0, r4, #0
	bl sub_08040870
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _0804098C @ =0x000003C6
	movs r1, #1
	bl PutSioText
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl StartLinkArenaButtonSpriteDraw
	b _08040ACE
	.align 2, 0
_0804098C: .4byte 0x000003C6
_08040990:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08040A24
	bl sub_0803CDE8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040A24
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq _080409BA
	movs r0, #2
	str r0, [r4, #0x30]
	movs r0, #0xf2
	lsls r0, r0, #2
	movs r1, #1
	bl PutSioText
_080409BA:
	ldr r0, _08040A18 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08040A36
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_080409D8:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _080409D8
	movs r0, #2
	bl SioPlaySoundEffect
	bl sub_0803CCC4
	ldr r2, _08040A1C @ =0x08B98AEC
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08040A20 @ =0x0203D90C
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_0803D674
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl SioEmitData
	str r0, [r4, #0x34]
	b _08040A94
	.align 2, 0
_08040A18: .4byte 0x08B857F8
_08040A1C: .4byte 0x08B98AEC
_08040A20: .4byte 0x0203D90C
_08040A24:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq _08040A36
	movs r0, #1
	str r0, [r4, #0x30]
	ldr r0, _08040A9C @ =0x000003C7
	movs r1, #1
	bl PutSioText
_08040A36:
	ldr r5, _08040AA0 @ =0x08B98AEC
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08040AA8
	ldrb r0, [r1, #6]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040AA8
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040AA8
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_08040A6E:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _08040A6E
	bl sub_0803CCC4
	ldr r2, _08040AA0 @ =0x08B98AEC
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08040AA4 @ =0x0203D90C
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_0803D674
_08040A94:
	adds r0, r4, #0
	bl Proc_Break
	b _08040ACE
	.align 2, 0
_08040A9C: .4byte 0x000003C7
_08040AA0: .4byte 0x08B98AEC
_08040AA4: .4byte 0x0203D90C
_08040AA8:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _08040ACE
	ldr r0, _08040AD8 @ =0x030046C0
	movs r1, #0xdc
	strb r1, [r0]
	ldr r1, _08040ADC @ =0x08B98AEC
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl SioSend
_08040ACE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040AD8: .4byte 0x030046C0
_08040ADC: .4byte 0x08B98AEC
