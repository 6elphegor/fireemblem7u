	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803FB64
sub_0803FB64: @ 0x0803FB64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x2c]
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _0803FB88
	ldr r0, [r6, #0x3c]
	cmp r0, #0x20
	ble _0803FB82
	adds r0, r6, #0
	bl Proc_Break
_0803FB82:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _0803FB8E
_0803FB88:
	ldr r0, [r6, #0x34]
	adds r0, #1
	str r0, [r6, #0x34]
_0803FB8E:
	ldr r0, [r6, #0x38]
	subs r0, #1
	str r0, [r6, #0x38]
	cmp r0, #0
	bge _0803FB9C
	movs r0, #0
	str r0, [r6, #0x38]
_0803FB9C:
	ldr r4, [r6, #0x38]
	cmp r4, #0
	beq _0803FBA4
	b _0803FCB4
_0803FBA4:
	ldr r3, [r6, #0x3c]
	cmp r3, #0x20
	bgt _0803FBBC
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r6, #0x30]
_0803FBBC:
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	subs r2, #0x10
	ldr r3, _0803FC68 @ =0x08B98EE4
	movs r0, #0x43
	adds r0, r0, r6
	mov r8, r0
	ldrb r5, [r0]
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x48
	ldr r2, [r6, #0x34]
	subs r2, #6
	ldr r3, _0803FC6C @ =0x08B98ED4
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r7, [r5]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x60
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _0803FC70 @ =0x081D52DE
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x40
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _0803FC74 @ =0x081D5314
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _0803FC78 @ =0x081D52E6
	movs r0, #0xf
	ldrb r7, [r5]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r6, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r6, #0x34]
	ldr r3, _0803FC7C @ =0x081D5300
	ldrb r0, [r5]
	cmp r0, #3
	beq _0803FC80
	lsls r0, r0, #3
	ldrb r4, [r5]
	adds r0, r0, r4
	b _0803FC82
	.align 2, 0
_0803FC68: .4byte 0x08B98EE4
_0803FC6C: .4byte 0x08B98ED4
_0803FC70: .4byte 0x081D52DE
_0803FC74: .4byte 0x081D5314
_0803FC78: .4byte 0x081D52E6
_0803FC7C: .4byte 0x081D5300
_0803FC80:
	movs r0, #0x40
_0803FC82:
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _0803FCC0 @ =0x081D531C
	ldrb r4, [r5]
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
_0803FCB4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FCC0: .4byte 0x081D531C
