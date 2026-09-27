	.include "macro.inc"

	.syntax unified

	thumb_func_start EndingCgScroll_Loop
EndingCgScroll_Loop: @ 0x080BA10C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	lsrs r7, r0, #3
	movs r0, #0x1f
	ands r7, r0
	ldr r0, [r4, #0x2c]
	asrs r2, r0, #6
	strh r2, [r4, #0x38]
	lsls r1, r2, #0x10
	ldr r0, _080BA140 @ =0x071F0000
	cmp r1, r0
	bls _080BA144
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
	b _080BA24C
	.align 2, 0
_080BA140: .4byte 0x071F0000
_080BA144:
	subs r2, #0xa0
	movs r0, #0xff
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x34
	mov r8, r0
	ldrb r1, [r0]
	cmp r1, #6
	bhi _080BA1A2
	ldr r0, [r4, #0x30]
	mov r5, r8
	ldrb r2, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r5, [r1]
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #0xb
	lsls r2, r2, #0xb
	ldr r1, _080BA18C @ =0x06008000
	adds r2, r2, r1
	adds r1, r0, r2
	cmp r3, #0
	beq _080BA190
	adds r0, r3, #0
	bl Decompress
	b _080BA19A
	.align 2, 0
_080BA18C: .4byte 0x06008000
_080BA190:
	str r3, [sp]
	ldr r2, _080BA238 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
_080BA19A:
	mov r5, r8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080BA1A2:
	movs r0, #7
	mov sb, r0
	mov r1, sb
	ands r1, r7
	mov sb, r1
	cmp r1, #0
	bne _080BA216
	ldr r0, [r4, #0x30]
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r2, [r6]
	lsls r1, r2, #2
	adds r0, #0x1c
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r7, #0
	asrs r0, r0, #3
	cmp r2, r0
	bne _080BA216
	cmp r3, #0
	beq _080BA24C
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #0x16
	movs r1, #0xa0
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x10
	lsls r0, r7, #6
	ldr r1, _080BA23C @ =0x02024460
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080BA216
	mov r0, sb
	strb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	movs r0, #1
	ldrb r1, [r5]
	subs r0, r0, r1
	strb r0, [r5]
	ldr r0, [r4, #0x30]
	adds r0, #0x2c
	str r0, [r4, #0x30]
_080BA216:
	ldr r0, _080BA240 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BA244
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BA24C
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080BA24C
	.align 2, 0
_080BA238: .4byte 0x01000200
_080BA23C: .4byte 0x02024460
_080BA240: .4byte 0x08B857F8
_080BA244:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #0x2c]
_080BA24C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
