	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BB40
sub_0803BB40: @ 0x0803BB40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r5, #0
	ldr r6, _0803BB80 @ =0x0203A8EC
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BC12
	ldr r4, _0803BB84 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble _0803BB88
	ldr r2, [r4]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0803BB88
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	adds r0, r6, #0
	adds r0, #0x79
	strb r5, [r0]
	b _0803BC12
	.align 2, 0
_0803BB80: .4byte 0x0203A8EC
_0803BB84: .4byte 0x03004690
_0803BB88:
	ldr r6, _0803BC1C @ =0x03004690
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r4, #4
	ands r0, r4
	cmp r0, #0
	beq _0803BC12
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #4
	ble _0803BBAA
	orrs r5, r4
_0803BBAA:
	ldr r0, [r6]
	add r6, sp, #0xc
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0803BD64
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BC12
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, _0803BC20 @ =0x0203A8EC
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _0803BC24 @ =0x0203A97C
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	bne _0803BC12
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BC12
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_0803BC12:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BC1C: .4byte 0x03004690
_0803BC20: .4byte 0x0203A8EC
_0803BC24: .4byte 0x0203A97C
