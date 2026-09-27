	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A024
sub_0809A024: @ 0x0809A024
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r0, sp, #0x28
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809A140 @ =0x0100000C
	add r1, sp, #0x10
	bl CpuSet
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	add r0, sp, #0x10
	bl sub_0809F224
	add r0, sp, #0x10
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	cmp r0, #0
	bne _0809A062
	b _0809A1B4
_0809A062:
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	adds r3, r6, #0
	adds r3, #0x34
	strb r0, [r3]
	add r0, sp, #0x10
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	movs r1, #0x35
	adds r1, r1, r6
	mov r8, r1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	movs r2, #0x36
	adds r2, r2, r6
	mov ip, r2
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	adds r7, r6, #0
	adds r7, #0x37
	strb r1, [r7]
	add r0, sp, #0x10
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r6, #0
	adds r4, #0x38
	strb r0, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	movs r0, #0x3e
	adds r0, r0, r6
	mov sb, r0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	lsrs r0, r0, #7
	adds r1, r6, #0
	adds r1, #0x40
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #0x18]
	ldr r1, _0809A144 @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r6, #0x58]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x17]
	adds r5, r6, #0
	adds r5, #0x3f
	strb r0, [r5]
	ldrb r0, [r3]
	mov r2, r8
	ldrb r1, [r2]
	mov r3, ip
	ldrb r2, [r3]
	ldrb r3, [r7]
	ldrb r4, [r4]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r6, #0
	adds r1, #0x39
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	adds r2, r6, #0
	adds r2, #0x4e
	strb r0, [r2]
	add r0, sp, #0x10
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	subs r2, #0x14
	strb r0, [r2]
	mov r2, sb
	ldrb r0, [r2]
	adds r7, r1, #0
	cmp r0, #0
	beq _0809A148
	adds r4, r6, #0
	adds r4, #0x43
	add r1, sp, #0x1c
	adds r0, r4, #0
	bl strcpy
	adds r0, r4, #0
	bl SetTacticianName
	b _0809A152
	.align 2, 0
_0809A140: .4byte 0x0100000C
_0809A144: .4byte 0x001FFFFF
_0809A148:
	ldr r0, _0809A190 @ =0x0000055B
	bl DecodeMsg
	bl SetTacticianName
_0809A152:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809A174
	ldrb r1, [r7]
	bl sub_0809A83C
	cmp r0, #0
	bne _0809A164
	strb r0, [r5]
_0809A164:
	ldrb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r3, _0809A194 @ =0x02023460
	mov r8, r3
	ldr r7, _0809A198 @ =0x0840EAF0
	cmp r0, #0
	bne _0809A1D2
_0809A174:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A19C
	movs r0, #0x2d
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r0, _0809A194 @ =0x02023460
	mov r8, r0
	ldr r7, _0809A198 @ =0x0840EAF0
	b _0809A1D2
	.align 2, 0
_0809A190: .4byte 0x0000055B
_0809A194: .4byte 0x02023460
_0809A198: .4byte 0x0840EAF0
_0809A19C:
	movs r0, #0x28
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r1, _0809A1AC @ =0x02023460
	mov r8, r1
	ldr r7, _0809A1B0 @ =0x0840EAF0
	b _0809A1D2
	.align 2, 0
_0809A1AC: .4byte 0x02023460
_0809A1B0: .4byte 0x0840EAF0
_0809A1B4:
	movs r2, #0
	adds r4, r1, #0
	ldr r3, _0809A26C @ =0x02023460
	mov r8, r3
	ldr r7, _0809A270 @ =0x0840EAF0
	adds r3, r6, #0
	adds r3, #0x34
	movs r5, #0xff
_0809A1C4:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809A1C4
_0809A1D2:
	movs r2, #0xa5
	lsls r2, r2, #7
	mov r0, r8
	adds r1, r7, #0
	bl sub_080AACD8
	adds r0, r6, #0
	bl sub_08099BA4
	adds r0, r6, #0
	bl sub_08099A48
	movs r0, #7
	bl EnableBgSync
	movs r0, #0
	bl EndFaceById
	bl EndCgText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809A25E
	adds r4, r6, #0
	adds r4, #0x3f
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809A25E
	ldr r2, _0809A274 @ =0x08BDCE4C
	ldrb r1, [r4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	movs r3, #0x81
	lsls r3, r3, #1
	movs r5, #0
	str r5, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r1, [r1]
	bl sub_0809A83C
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r4, [sp]
	ldr r0, _0809A278 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl StartCgText
	ldr r0, _0809A27C @ =0x000809FE
	bl SetCgTextFlags
_0809A25E:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A26C: .4byte 0x02023460
_0809A270: .4byte 0x0840EAF0
_0809A274: .4byte 0x08BDCE4C
_0809A278: .4byte 0x06011000
_0809A27C: .4byte 0x000809FE
