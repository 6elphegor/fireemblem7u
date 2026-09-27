	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806CF58
sub_0806CF58: @ 0x0806CF58
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806CF66:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806CF6E
	b _0806CFF0
_0806CF6E:
	ldr r0, _0806CFE0 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806CFE8
	ldr r0, _0806CFE0 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, [r7, #8]
	adds r2, r1, #0
	adds r1, r2, #1
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806CFE0 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r2, _0806CFE4 @ =0x08C9D034
	ldr r3, [r7, #8]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	adds r1, r1, r3
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x4c
	muls r0, r1, r0
	ldr r2, _0806CFE0 @ =0x030014E8
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806CFF4
	.align 2, 0
_0806CFE0: .4byte 0x030014E8
_0806CFE4: .4byte 0x08C9D034
_0806CFE8:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806CF66
_0806CFF0:
	movs r0, #0
	b _0806CFF4
_0806CFF4:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1
