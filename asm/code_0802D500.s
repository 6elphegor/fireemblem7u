	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxSnow_VSync
WfxSnow_VSync: @ 0x0802D500
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl GetOamSplice
	cmp r0, #0
	beq _0802D5AA
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D5B4 @ =0x020027DC
	adds r4, r1, r0
	mov r2, sp
	ldr r3, _0802D5B8 @ =0x0202BBB8
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _0802D532
	adds r0, #0xf
_0802D532:
	asrs r0, r0, #4
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r3, #0xe]
	strh r2, [r0, #2]
	mov r1, sp
	ldrh r0, [r3, #0xc]
	strh r0, [r1, #4]
	mov r0, sp
	strh r2, [r0, #6]
	mov r5, sp
	movs r7, #0xc
	ldrsh r1, [r3, r7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _0802D558
	adds r0, #0xf
_0802D558:
	asrs r0, r0, #4
	strh r0, [r5, #8]
	mov r0, sp
	strh r2, [r0, #0xa]
	movs r6, #0xff
	movs r5, #0x1f
_0802D564:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r7, [r4, #6]
	adds r1, r3, r7
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrb r3, [r4, #9]
	lsls r2, r3, #2
	mov r7, sp
	adds r3, r7, r2
	movs r7, #0
	ldrsh r2, [r3, r7]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r7, #2
	ldrsh r2, [r3, r7]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r3, r3, r2
	ldr r2, _0802D5BC @ =0x08B905B0
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D564
_0802D5AA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D5B4: .4byte 0x020027DC
_0802D5B8: .4byte 0x0202BBB8
_0802D5BC: .4byte 0x08B905B0
