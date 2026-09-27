	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807BA1C
sub_0807BA1C: @ 0x0807BA1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	ldr r0, _0807BB00 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807BB04 @ =0x03002870
	mov ip, r0
	mov r5, ip
	adds r5, #0x3c
	movs r3, #0x3f
	ldrb r1, [r5]
	ands r3, r1
	mov r6, ip
	adds r6, #0x44
	movs r2, #0
	mov r8, r2
	movs r7, #0x45
	add r7, ip
	mov sl, r7
	movs r4, #0x10
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r7, ip
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r7, [r7, #0x14]
	ands r1, r7
	movs r0, #2
	orrs r1, r0
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	movs r0, #0x40
	orrs r3, r0
	strb r3, [r5]
	strb r4, [r6]
	mov r7, sl
	strb r4, [r7]
	mov r1, r8
	ldr r0, _0807BB08 @ =0x030028B6
	strb r1, [r0]
	ldr r0, _0807BB0C @ =0x0000FFE0
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807BB10 @ =0x0000E0FF
	ands r0, r1
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x70
	movs r1, #0x20
	bl PutDragonGateFlame
	bl sub_0807B9F0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _0807BB14 @ =0xFFDFFFFE
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	mov r7, sb
	str r7, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB00: .4byte 0x02023C60
_0807BB04: .4byte 0x03002870
_0807BB08: .4byte 0x030028B6
_0807BB0C: .4byte 0x0000FFE0
_0807BB10: .4byte 0x0000E0FF
_0807BB14: .4byte 0xFFDFFFFE
