	.include "macro.inc"

	.syntax unified

	thumb_func_start SioQueuePendingRecvData
SioQueuePendingRecvData: @ 0x0803D19C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _0803D204 @ =0x08B98AEC
	ldr r2, [r3]
	ldr r0, _0803D208 @ =0x00001B77
	adds r1, r2, r0
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, _0803D20C @ =0x000012B4
	adds r0, r0, r1
	adds r1, r2, r0
	ldrb r0, [r4]
	strb r0, [r1, #4]
	ldrb r0, [r4, #1]
	strb r0, [r1, #5]
	ldrh r0, [r4, #2]
	strh r0, [r1, #6]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	movs r2, #0
	adds r6, r3, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bge _0803D1E4
	adds r5, r1, #0
	adds r5, #0xa
	adds r3, r4, #6
_0803D1D4:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrh r1, [r4, #4]
	cmp r2, r1
	blt _0803D1D4
_0803D1E4:
	ldr r0, [r6]
	ldr r2, _0803D208 @ =0x00001B77
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D204: .4byte 0x08B98AEC
_0803D208: .4byte 0x00001B77
_0803D20C: .4byte 0x000012B4
