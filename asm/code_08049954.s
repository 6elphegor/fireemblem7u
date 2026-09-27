	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049954
sub_08049954: @ 0x08049954
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _08049970
	cmp r0, #0xe0
	blt _08049980
	cmp r0, #0xe8
	bgt _08049980
	cmp r0, #0xe7
	blt _08049980
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _080499E0
_08049970:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _080499D2
_08049980:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _080499DC @ =0x04000126
_08049988:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _0804999C
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _08049970
_0804999C:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _08049988
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _080499CA
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrb r1, [r1]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r0, #5
	str r0, [r3]
_080499CA:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_080499D0:
	ldrh r1, [r3]
_080499D2:
	adds r0, r3, #0
	bl MultiBootSend
	b _08049A38
	.align 2, 0
_080499DC: .4byte 0x04000126
_080499E0:
	lsls r0, r4, #1
	ldr r1, _08049A28 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080499FC
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _08049A2C
_080499FC:
	subs r4, #1
	cmp r4, #0
	bne _080499E0
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _08049A36
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrb r1, [r1]
	orrs r0, r1
	str r0, [r3]
	str r0, [r3, #4]
	b _080499D0
	.align 2, 0
_08049A28: .4byte 0x04000120
_08049A2C:
	adds r0, r3, #0
	bl MultiBootInit
	movs r0, #0x71
	b _08049A38
_08049A36:
	movs r0, #0
_08049A38:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
