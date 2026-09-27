	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803FCC4
sub_0803FCC4: @ 0x0803FCC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	subs r2, #0x10
	ldr r3, _0803FD74 @ =0x08B98EE4
	movs r0, #0x43
	adds r0, r0, r5
	mov r8, r0
	ldrb r4, [r0]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x48
	ldr r2, [r5, #0x34]
	subs r2, #6
	ldr r3, _0803FD78 @ =0x08B98ED4
	adds r6, r5, #0
	adds r6, #0x42
	ldrb r7, [r6]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x60
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _0803FD7C @ =0x081D52DE
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x40
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _0803FD80 @ =0x081D5314
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _0803FD84 @ =0x081D52E6
	movs r0, #0xf
	ldrb r7, [r6]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r5, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r5, #0x34]
	ldr r3, _0803FD88 @ =0x081D5300
	ldrb r0, [r6]
	cmp r0, #3
	beq _0803FD8C
	lsls r0, r0, #3
	ldrb r6, [r6]
	adds r0, r0, r6
	b _0803FD8E
	.align 2, 0
_0803FD74: .4byte 0x08B98EE4
_0803FD78: .4byte 0x08B98ED4
_0803FD7C: .4byte 0x081D52DE
_0803FD80: .4byte 0x081D5314
_0803FD84: .4byte 0x081D52E6
_0803FD88: .4byte 0x081D5300
_0803FD8C:
	movs r0, #0x40
_0803FD8E:
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _0803FDD0 @ =0x081D531C
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FDD0: .4byte 0x081D531C
