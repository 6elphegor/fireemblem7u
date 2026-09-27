	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryMoveToSpecificPosition
AiTryMoveToSpecificPosition: @ 0x0803A450
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0803A484 @ =0x03004690
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xfe
	lsls r0, r0, #5
	ldrh r1, [r1]
	ands r0, r1
	lsrs r3, r0, #8
	adds r5, r2, #0
	adds r5, #0x46
	ldrb r4, [r5]
	ldr r0, _0803A488 @ =0x08B972E8
	ldr r1, [r0]
	cmp r1, #0
	beq _0803A47E
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	bne _0803A48C
_0803A47E:
	movs r0, #0
	b _0803A4CE
	.align 2, 0
_0803A484: .4byte 0x03004690
_0803A488: .4byte 0x08B972E8
_0803A48C:
	lsls r0, r4, #2
	adds r3, r2, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0803A4A2
	movs r4, #0
	strb r4, [r5]
	adds r3, r2, #0
_0803A4A2:
	ldrh r0, [r3]
	strh r0, [r6]
	ldrh r0, [r3, #2]
	strh r0, [r6, #2]
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _0803A4D4 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803A4CC
	adds r4, #1
	ldr r0, [r7]
	adds r0, #0x46
	strb r4, [r0]
_0803A4CC:
	movs r0, #1
_0803A4CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A4D4: .4byte 0x0202E3E4
