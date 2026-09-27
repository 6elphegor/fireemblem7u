	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08042298
sub_08042298: @ 0x08042298
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r5, _080423B4 @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080422C2
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, _080423B8 @ =0x0203DA0C
	bl WriteMultiArenaSaveConfig
	adds r0, r6, #0
	bl Proc_Break
_080422C2:
	mov r0, sp
	bl sub_08041FD4
	ldr r1, [r5]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080422E0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	beq _080422E0
	subs r0, #1
	str r0, [r6, #0x30]
	movs r4, #1
_080422E0:
	ldr r2, _080423B4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08042300
	ldr r0, [r6, #0x30]
	cmp r0, #1
	bgt _08042300
	adds r0, #1
	str r0, [r6, #0x30]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08042300:
	ldr r1, [r5]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042328
	ldr r0, [r6, #0x30]
	mov r1, sp
	adds r3, r1, r0
	ldrb r1, [r3]
	subs r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_0804203C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08042328:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042350
	ldr r0, [r6, #0x30]
	mov r2, sp
	adds r3, r2, r0
	ldrb r1, [r3]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_0804203C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08042350:
	mov r0, sp
	bl sub_08041FF8
	cmp r4, #0
	beq _080423AA
	movs r0, #3
	bl SioPlaySoundEffect
	ldr r5, [r6, #0x30]
	cmp r5, #1
	bne _0804236A
	movs r7, #2
	rsbs r7, r7, #0
_0804236A:
	ldr r0, [r6, #0x2c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080423BC @ =0x081D5358
	mov r2, sp
	adds r4, r2, r5
	lsls r2, r5, #2
	adds r2, r2, r5
	ldrb r4, [r4]
	adds r2, r4, r2
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r2, [r2]
	adds r2, r2, r7
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl UpdateRuleSettingSprites
	ldr r0, [r6, #0x30]
	ldr r1, _080423C0 @ =0x000003C3
	adds r0, r0, r1
	movs r1, #1
	bl PutSioText
_080423AA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080423B4: .4byte 0x08B857F8
_080423B8: .4byte 0x0203DA0C
_080423BC: .4byte 0x081D5358
_080423C0: .4byte 0x000003C3
