	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A2960
sub_080A2960: @ 0x080A2960
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A2A60 @ =0x02000500
	ldr r2, _080A2A64 @ =0x02000280
	str r2, [r1]
	ldr r3, _080A2A68 @ =0x02000504
	ldr r4, _080A2A6C @ =0xFFFFFD80
	adds r1, r2, r4
	str r1, [r3]
	ldr r1, _080A2A70 @ =0x02000508
	str r2, [r1]
	ldr r7, _080A2A74 @ =0x03002870
	mov ip, r7
	movs r1, #0x20
	mov r8, r1
	mov r1, r8
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r1, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r3, ip
	strb r1, [r3, #1]
	movs r4, #0x34
	add r4, ip
	mov sb, r4
	movs r4, #1
	mov r7, sb
	ldrb r7, [r7]
	orrs r4, r7
	movs r1, #2
	orrs r4, r1
	movs r6, #4
	orrs r4, r6
	movs r5, #8
	orrs r4, r5
	movs r2, #0x10
	orrs r4, r2
	movs r1, #0x36
	add r1, ip
	mov sl, r1
	movs r3, #2
	rsbs r3, r3, #0
	ldrb r7, [r1]
	ands r3, r7
	movs r1, #3
	rsbs r1, r1, #0
	ands r3, r1
	orrs r3, r6
	orrs r3, r5
	orrs r3, r2
	mov r2, ip
	adds r2, #0x2d
	movs r5, #0
	movs r1, #0xf0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x31
	strb r5, [r1]
	subs r1, #5
	strb r5, [r1]
	adds r2, #3
	movs r1, #0xa0
	strb r1, [r2]
	mov r6, ip
	adds r6, #0x3c
	ldr r1, _080A2A78 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r1, r2
	movs r2, #0xc
	orrs r1, r2
	ldr r2, _080A2A7C @ =0x0000E0FF
	ands r1, r2
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r2, r7, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r2, #0x3d
	mov r1, r8
	ldrb r7, [r2]
	orrs r1, r7
	strb r1, [r2]
	movs r1, #0xc0
	ldrb r2, [r6]
	orrs r1, r2
	strb r1, [r6]
	mov r2, ip
	adds r2, #0x44
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x45
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	mov r7, r8
	orrs r4, r7
	mov r1, sb
	strb r4, [r1]
	subs r2, #0xf
	mov r1, r8
	ldrb r4, [r2]
	orrs r1, r4
	strb r1, [r2]
	orrs r3, r7
	mov r1, sl
	strb r3, [r1]
	adds r0, #0x4c
	strh r5, [r0]
	ldr r0, _080A2A80 @ =sub_080A290C
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A60: .4byte 0x02000500
_080A2A64: .4byte 0x02000280
_080A2A68: .4byte 0x02000504
_080A2A6C: .4byte 0xFFFFFD80
_080A2A70: .4byte 0x02000508
_080A2A74: .4byte 0x03002870
_080A2A78: .4byte 0x0000FFE0
_080A2A7C: .4byte 0x0000E0FF
_080A2A80: .4byte sub_080A290C
