	.include "macro.inc"

	.syntax unified

	thumb_func_start JudgeGameRankSaveData
JudgeGameRankSaveData: @ 0x0809F2C8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _0809F376
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r1, r0, #0x1d
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	cmp r1, r0
	bgt _0809F376
	cmp r1, r0
	bne _0809F380
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0809F2F4
	ldrb r2, [r5, #0x17]
	cmp r0, r2
	bne _0809F376
_0809F2F4:
	ldrh r0, [r4, #2]
	lsls r1, r0, #0x11
	lsrs r1, r1, #0x18
	ldrh r2, [r5, #2]
	lsls r0, r2, #0x11
	lsrs r0, r0, #0x18
	cmp r1, r0
	bgt _0809F376
	ldrb r0, [r4, #7]
	lsrs r2, r0, #5
	ldr r0, [r4, #8]
	ldr r1, _0809F37C @ =0x001FFFFF
	ands r0, r1
	lsls r3, r0, #3
	orrs r3, r2
	ldrb r0, [r5, #7]
	lsrs r2, r0, #5
	ldr r0, [r5, #8]
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	cmp r3, r0
	bgt _0809F376
	cmp r3, r0
	bne _0809F380
	ldr r0, [r4, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r3, r0, #3
	subs r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r0
	lsls r3, r3, #4
	ldrb r2, [r4, #6]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldrh r4, [r4, #6]
	lsls r0, r4, #0x13
	lsrs r0, r0, #0x1a
	adds r3, r3, r0
	ldr r0, [r5, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r0
	lsls r2, r2, #4
	ldrb r0, [r5, #6]
	lsls r1, r0, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrh r5, [r5, #6]
	lsls r0, r5, #0x13
	lsrs r0, r0, #0x1a
	adds r2, r2, r0
	cmp r3, r2
	bge _0809F380
_0809F376:
	movs r0, #1
	b _0809F382
	.align 2, 0
_0809F37C: .4byte 0x001FFFFF
_0809F380:
	movs r0, #0
_0809F382:
	pop {r4, r5}
	pop {r1}
	bx r1
