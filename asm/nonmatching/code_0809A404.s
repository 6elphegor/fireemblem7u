	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A404
sub_0809A404: @ 0x0809A404
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0809A4F4 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r4, #0xc]
	ands r1, r3
	movs r3, #1
	mov r8, r3
	mov r3, r8
	orrs r1, r3
	strb r1, [r4, #0xc]
	movs r1, #3
	ldrb r3, [r4, #0x10]
	orrs r1, r3
	strb r1, [r4, #0x10]
	adds r1, r2, #0
	ldrb r3, [r4, #0x14]
	ands r1, r3
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	ands r2, r1
	strb r2, [r4, #0x18]
	movs r5, #0
	str r5, [r0, #0x2c]
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x45
	movs r7, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _0809A4F8 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809A4FC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	ldr r0, _0809A500 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A48E
	movs r0, #0xc8
	bl m4aSongNumStart
_0809A48E:
	movs r0, #0x20
	ldrb r3, [r4, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r2, r4, #0
	adds r2, #0x34
	mov r0, r8
	ldrb r1, [r2]
	orrs r0, r1
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4F4: .4byte 0x03002870
_0809A4F8: .4byte 0x0000FFE0
_0809A4FC: .4byte 0x0000E0FF
_0809A500: .4byte 0x0202BBF8
