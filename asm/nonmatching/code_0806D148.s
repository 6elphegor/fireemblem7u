	.include "macro.inc"

	.syntax unified

	thumb_func_start PutMuSMS
PutMuSMS: @ 0x0806D148
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D15E
	b _0806D244
_0806D15E:
	adds r1, r7, #4
	ldr r0, [r7]
	bl GetMuDisplayPosition
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806D170
	b _0806D244
_0806D170:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806D1CC
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D1CC:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl sub_080255E0
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	ldrh r0, [r1, #0x1e]
	adds r1, r7, #4
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	subs r1, #8
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, [r7]
	ldr r4, [r3, #0x38]
	ldr r5, _0806D24C @ =0xF9FF0000
	adds r3, r4, r5
	lsls r5, r3, #0xf
	lsrs r4, r5, #0xf
	lsrs r3, r4, #5
	ldr r4, [r7]
	ldr r5, [r4, #0x34]
	ldrb r4, [r5, #1]
	movs r5, #0xf
	ands r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x18
	lsrs r4, r5, #0x18
	adds r5, r4, #0
	lsls r4, r5, #0xc
	adds r3, r3, r4
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x46
	ldrh r4, [r5]
	adds r3, r3, r4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x41
	ldrb r4, [r5]
	str r4, [sp]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x3c
	ldrb r4, [r5]
	str r4, [sp, #4]
	bl sub_08026308
_0806D244:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D24C: .4byte 0xF9FF0000
