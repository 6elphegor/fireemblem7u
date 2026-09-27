	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADCC4
sub_080ADCC4: @ 0x080ADCC4
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _080ADD24 @ =0x08CE583C
	ldr r0, [r5]
	adds r0, #0xa8
	bl ClearText
	ldr r6, _080ADD28 @ =0x08CE58D8
	bl sub_080ADB48
	adds r4, r0, #0
	bl GetOptionMenuLayoutId
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x15
	ldr r1, _080ADD2C @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r5]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #4]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, #0xa8
	ldr r1, _080ADD30 @ =0x020230A8
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD24: .4byte 0x08CE583C
_080ADD28: .4byte 0x08CE58D8
_080ADD2C: .4byte 0x08CE5868
_080ADD30: .4byte 0x020230A8
