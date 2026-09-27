	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitApplyWorkingMovementScript
UnitApplyWorkingMovementScript: @ 0x0801A044
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r3, r1, #0
	adds r4, r2, #0
	ldr r5, _0801A058 @ =0x02033E00
	ldr r6, _0801A05C @ =0x0203A85C
	ldr r0, _0801A060 @ =0x0202E3F0
	mov ip, r0
	b _0801A066
	.align 2, 0
_0801A058: .4byte 0x02033E00
_0801A05C: .4byte 0x0203A85C
_0801A060: .4byte 0x0202E3F0
_0801A064:
	adds r5, #1
_0801A066:
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	ldrb r0, [r5]
	cmp r0, #1
	beq _0801A08E
	cmp r0, #1
	bgt _0801A07A
	cmp r0, #0
	beq _0801A08A
	b _0801A090
_0801A07A:
	cmp r0, #2
	beq _0801A086
	cmp r0, #3
	bne _0801A090
	subs r4, #1
	b _0801A090
_0801A086:
	adds r4, #1
	b _0801A090
_0801A08A:
	subs r3, #1
	b _0801A090
_0801A08E:
	adds r3, #1
_0801A090:
	ldr r0, [r7]
	ldr r2, [r7, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	ldr r0, _0801A0C8 @ =0x02001808
	ands r1, r0
	lsls r2, r4, #2
	cmp r1, #0
	bne _0801A0CC
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A0CC
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1b
	strb r0, [r6, #0x11]
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	b _0801A0F4
	.align 2, 0
_0801A0C8: .4byte 0x02001808
_0801A0CC:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A0EE
	movs r0, #0xa
	strb r0, [r5]
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1b
	strb r0, [r6, #0x11]
	b _0801A0F4
_0801A0EE:
	ldrb r0, [r5]
	cmp r0, #4
	bne _0801A064
_0801A0F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
