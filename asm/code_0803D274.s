	.include "macro.inc"

	.syntax unified

	thumb_func_start SioEmitData
SioEmitData: @ 0x0803D274
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r6, _0803D310 @ =0x030013D4
	movs r0, #1
	str r0, [r6]
	ldr r4, _0803D314 @ =0x08B98AEC
	ldr r1, [r4]
	ldr r2, _0803D318 @ =0x00001B75
	adds r0, r1, r2
	movs r5, #0x8c
	ldrb r0, [r0]
	muls r0, r5, r0
	adds r1, r1, r0
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r2, [r2]
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r0, r3
	adds r5, r1, r0
	adds r2, r5, #4
	movs r0, #0xdf
	strb r0, [r5, #4]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r4]
	ldrh r0, [r1, #0x22]
	strh r0, [r2, #2]
	strh r7, [r2, #4]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	movs r3, #0
	mov r8, r6
	adds r6, r4, #0
	cmp r3, r7
	bhs _0803D2E8
	adds r2, #6
_0803D2D4:
	adds r1, r2, r3
	mov r4, ip
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	blo _0803D2D4
_0803D2E8:
	ldr r1, [r6]
	ldr r3, _0803D318 @ =0x00001B75
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r2, r0, #1
	movs r4, #0
	strb r2, [r1]
	ldr r2, [r6]
	adds r2, r2, r3
	movs r1, #0x1f
	ldrb r3, [r2]
	ands r1, r3
	strb r1, [r2]
	mov r1, r8
	str r4, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D310: .4byte 0x030013D4
_0803D314: .4byte 0x08B98AEC
_0803D318: .4byte 0x00001B75
