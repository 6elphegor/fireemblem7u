	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013D88
sub_08013D88: @ 0x08013D88
	push {r4, r5, r6, lr}
	ldr r1, _08013E08 @ =0x03002870
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	movs r5, #0x10
	strb r5, [r1]
	ldr r1, _08013E0C @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	ldr r2, _08013E10 @ =0x0000E0FF
	ands r1, r2
	movs r6, #0xf8
	lsls r6, r6, #5
	adds r2, r6, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r1, r0, #0
	adds r1, #0x64
	strh r5, [r1]
	adds r0, #0x66
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013E08: .4byte 0x03002870
_08013E0C: .4byte 0x0000FFE0
_08013E10: .4byte 0x0000E0FF
