	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5214
sub_080A5214: @ 0x080A5214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r7, r1, #0x18
	movs r1, #0x8f
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5260
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	b _080A5280
_080A5260:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
_080A5280:
	mov r1, sb
	adds r1, #8
	adds r2, r7, #0
	subs r2, #0xe
	ldr r3, _080A5410 @ =0x08CE41BC
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x10
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _080A5414 @ =0x08CE4286
	movs r0, #0xc0
	lsls r0, r0, #7
	mov r8, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	add r0, sp, #4
	adds r6, r7, #0
	subs r6, #8
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _080A52FE
	mov r5, sb
	adds r5, #0x12
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0x64
	mov sl, r1
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	subs r4, r4, r0
	strh r4, [r5]
_080A52FE:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080A532C
	mov r5, sb
	adds r5, #0x1a
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
_080A532C:
	mov r5, sb
	adds r5, #0x22
	ldr r4, _080A5418 @ =0x08CE42C0
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r1, r8
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x2a
	subs r2, r7, #7
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #6]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpriteExt
	mov r1, sb
	adds r1, #0x42
	adds r2, r7, #1
	ldr r4, _080A541C @ =0x08CE4294
	ldr r3, [r4, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r5, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r5, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5410: .4byte 0x08CE41BC
_080A5414: .4byte 0x08CE4286
_080A5418: .4byte 0x08CE42C0
_080A541C: .4byte 0x08CE4294
