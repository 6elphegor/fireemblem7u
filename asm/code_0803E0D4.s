	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E0D4
sub_0803E0D4: @ 0x0803E0D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, _0803E118 @ =0x08B98C9C
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov sb, r1
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge _0803E168
	ldr r0, _0803E11C @ =0x0203D90C
	adds r5, r0, #0
	adds r5, #0xc
	mov r8, r5
	ldr r3, _0803E120 @ =0x0203DA78
	movs r2, #0
_0803E100:
	ldr r0, _0803E120 @ =0x0203DA78
	adds r1, r2, r0
	movs r0, #0x80
	ldrb r7, [r1, #0x13]
	ands r0, r7
	cmp r0, #0
	bne _0803E124
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, sb
	ldrb r0, [r0, #4]
	b _0803E12C
	.align 2, 0
_0803E118: .4byte 0x08B98C9C
_0803E11C: .4byte 0x0203D90C
_0803E120: .4byte 0x0203DA78
_0803E124:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, sb
	ldrb r0, [r0, #5]
_0803E12C:
	strb r0, [r1, #0x14]
	ldr r0, _0803E17C @ =0x00000FFF
	adds r1, r0, #0
	ldrh r7, [r5]
	ands r1, r7
	movs r0, #0xf
	ldrb r7, [r3, #0x14]
	ands r0, r7
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, _0803E180 @ =0x02023476
	adds r1, r1, r0
	mov r0, r8
	str r2, [sp]
	str r3, [sp, #4]
	bl PutText
	movs r0, #8
	add r8, r0
	adds r5, #8
	ldr r3, [sp, #4]
	adds r3, #0x18
	ldr r2, [sp]
	adds r2, #0x18
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt _0803E100
_0803E168:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E17C: .4byte 0x00000FFF
_0803E180: .4byte 0x02023476
