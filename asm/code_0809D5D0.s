	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D5D0
sub_0809D5D0: @ 0x0809D5D0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0809D69C @ =0x03002870
	mov ip, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	mov r5, ip
	strb r0, [r5, #0xc]
	movs r2, #3
	ldrb r0, [r5, #0x10]
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r2, r1
	strb r2, [r5, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	mov r3, ip
	adds r3, #0x45
	movs r0, #0xc
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0809D6A0 @ =0x0000FFE0
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	ldr r1, _0809D6A4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r5, ip
	strh r0, [r5, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x3d
	ldrb r5, [r0]
	ands r1, r5
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809D696
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809D696
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_0809D696:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D69C: .4byte 0x03002870
_0809D6A0: .4byte 0x0000FFE0
_0809D6A4: .4byte 0x0000E0FF
