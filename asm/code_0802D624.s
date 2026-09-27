	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxRain_VSync
WfxRain_VSync: @ 0x0802D624
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetOamSplice
	cmp r0, #0
	beq _0802D68C
	bl GetGameTime
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _0802D698 @ =0x020027DC
	adds r4, r1, r0
	ldr r7, _0802D69C @ =0x0202BBB8
	movs r6, #0xff
	movs r5, #0x1f
	ldr r0, _0802D6A0 @ =0x08B96208
	mov r8, r0
_0802D64E:
	ldrh r1, [r4]
	ldrh r2, [r4, #4]
	adds r0, r1, r2
	strh r0, [r4]
	ldrh r3, [r4, #2]
	ldrh r2, [r4, #6]
	adds r1, r3, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	lsls r2, r3, #2
	add r2, r8
	ldr r2, [r2]
	movs r3, #0
	bl PutOamLoRam
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D64E
_0802D68C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D698: .4byte 0x020027DC
_0802D69C: .4byte 0x0202BBB8
_0802D6A0: .4byte 0x08B96208
