	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0134
sub_080B0134: @ 0x080B0134
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	movs r0, #0
	mov sb, r0
_080B0146:
	mov r1, sl
	ldr r0, [r1, #0x30]
	adds r0, #0x40
	add r0, sb
	ldrb r5, [r0]
	cmp r5, #0x1d
	bls _080B0156
	movs r5, #0x1e
_080B0156:
	movs r6, #0
	lsrs r0, r5, #2
	mov r3, sb
	adds r3, #1
	str r3, [sp, #0xc]
	mov r1, sl
	adds r1, #0x34
	str r1, [sp, #4]
	mov r3, sl
	adds r3, #0x35
	str r3, [sp, #8]
	cmp r6, r0
	bge _080B019A
	mov r8, r0
	movs r4, #0x31
	mov r0, sb
	lsls r7, r0, #4
	mov r6, r8
_080B017A:
	ldr r1, _080B01F8 @ =0x08CE6078
	ldr r3, [r1, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	adds r2, #0xf
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _080B017A
	mov r6, r8
_080B019A:
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _080B01C2
	lsls r1, r6, #3
	adds r1, #0x31
	mov r3, sb
	lsls r2, r3, #4
	adds r2, #0xf
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, _080B01F8 @ =0x08CE6078
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080B01C2:
	ldr r0, [sp, #0xc]
	mov sb, r0
	cmp r0, #5
	ble _080B0146
	ldr r1, [sp, #4]
	ldrb r2, [r1]
	movs r0, #0x78
	subs r0, r0, r2
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r3, [sp, #8]
	ldrb r3, [r3]
	adds r6, r3, r0
	adds r0, r6, r2
	cmp r0, #0xe8
	ble _080B01E8
	movs r0, #0xe8
	subs r6, r0, r2
_080B01E8:
	movs r0, #0
	mov sb, r0
	mov r3, sl
	ldr r1, [r3, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	b _080B0270
	.align 2, 0
_080B01F8: .4byte 0x08CE6078
_080B01FC:
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	bl sub_080B02E4
	adds r4, r0, #0
	cmp r4, #0
	beq _080B025A
	ldr r3, [r4]
	cmp r3, #0
	beq _080B025C
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r6, r1
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #8
	subs r2, r2, r0
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r6, r1
	subs r1, #2
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #6
	subs r2, r2, r0
	ldr r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	adds r6, r6, r0
	b _080B025C
_080B025A:
	adds r6, #4
_080B025C:
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #0xe
	bgt _080B0276
	mov r3, sl
	ldr r1, [r3, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
_080B0270:
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B01FC
_080B0276:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xfe
	bhi _080B0282
	adds r0, #1
	strh r0, [r1, #0x2a]
_080B0282:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
