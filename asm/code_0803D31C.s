	.include "macro.inc"

	.syntax unified

	thumb_func_start SioReceiveData
SioReceiveData: @ 0x0803D31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	str r1, [sp]
	mov sl, r2
_0803D32E:
	ldr r0, _0803D35C @ =0x08B98AEC
	mov r8, r0
	ldr r2, [r0]
	ldr r7, _0803D360 @ =0x00001B76
	adds r1, r2, r7
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, _0803D364 @ =0x000012B4
	adds r0, r0, r1
	adds r5, r2, r0
	adds r6, r5, #4
	ldrb r3, [r5, #4]
	cmp r3, #0xdf
	bne _0803D356
	ldrb r0, [r6, #1]
	ldrb r1, [r6, #1]
	ldrb r3, [r2, #6]
	cmp r1, r3
	bne _0803D368
_0803D356:
	movs r0, #0
	b _0803D490
	.align 2, 0
_0803D35C: .4byte 0x08B98AEC
_0803D360: .4byte 0x00001B76
_0803D364: .4byte 0x000012B4
_0803D368:
	lsls r0, r0, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r1, [r6, #2]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0803D3B4
	ldr r0, _0803D3B0 @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldrb r2, [r2, #6]
	lsls r1, r2, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r6, [r6, #1]
	lsls r1, r6, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	strb r4, [r5, #4]
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r3]
	adds r1, r1, r7
	b _0803D422
	.align 2, 0
_0803D3B0: .4byte 0x0300479C
_0803D3B4:
	movs r2, #0
	ldrh r3, [r6, #4]
	cmp r2, r3
	bhs _0803D3D6
	adds r3, r5, #0
	adds r3, #0xa
_0803D3C0:
	mov r0, sb
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r6, #4]
	cmp r2, r1
	blo _0803D3C0
_0803D3D6:
	mov r2, sl
	cmp r2, #0
	beq _0803D438
	mov r0, sb
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D438
	ldr r0, _0803D42C @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldr r4, _0803D430 @ =0x08B98AEC
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r5, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	strb r5, [r6]
	ldr r0, [r4]
	ldr r2, _0803D434 @ =0x00001B76
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, r1, r2
_0803D422:
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	b _0803D32E
	.align 2, 0
_0803D42C: .4byte 0x0300479C
_0803D430: .4byte 0x08B98AEC
_0803D434: .4byte 0x00001B76
_0803D438:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, _0803D4A0 @ =0x08B98AEC
	ldr r2, [r4]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x26
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldr r3, _0803D4A4 @ =0x00001B76
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0xf
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	ldr r0, [sp]
	strb r5, [r0]
	ldr r0, _0803D4A8 @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	ldrh r0, [r6, #4]
_0803D490:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D4A0: .4byte 0x08B98AEC
_0803D4A4: .4byte 0x00001B76
_0803D4A8: .4byte 0x0300479C
