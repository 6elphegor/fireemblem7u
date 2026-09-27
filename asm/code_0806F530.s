	.include "macro.inc"

	.syntax unified

	thumb_func_start PutManimWindowNumber
PutManimWindowNumber: @ 0x0806F530
	push {r4, r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x30]
	adds r1, r7, #0
	adds r1, #0x10
	strh r0, [r1]
	movs r0, #7
	str r0, [r7, #0x1c]
_0806F54A:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bge _0806F552
	b _0806F5C6
_0806F552:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x1c]
	adds r4, r0, r1
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r1, [r4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806F5BE
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x20]
_0806F592:
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _0806F59A
	b _0806F5BC
_0806F59A:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x20]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x20]
	subs r1, r0, #1
	str r1, [r7, #0x20]
	b _0806F592
_0806F5BC:
	b _0806F5C6
_0806F5BE:
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806F54A
_0806F5C6:
	adds r0, r7, #0
	adds r0, #0x14
	adds r1, r0, #7
	ldr r2, [r7, #8]
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	bl PutDigits
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
_0806F5DC:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	bgt _0806F5E4
	b _0806F612
_0806F5E4:
	adds r0, r7, #0
	adds r0, #0x14
	movs r1, #7
	ldr r2, [r7, #0x1c]
	subs r1, r1, r2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0x20
	beq _0806F5F8
	b _0806F612
_0806F5F8:
	ldr r0, [r7, #0x1c]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7]
	subs r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #0x1c]
	subs r1, r0, #1
	str r1, [r7, #0x1c]
	b _0806F5DC
_0806F612:
	add sp, #0x24
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
