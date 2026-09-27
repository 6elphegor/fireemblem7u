	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A5BC
sub_0803A5BC: @ 0x0803A5BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, _0803A5F4 @ =0x0202BD48
	ldrb r0, [r7]
	mov r8, r0
	ldr r4, _0803A5F8 @ =0x03004690
	ldr r6, [r4]
	adds r0, r6, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803A666
	bl GetUnitFromCharId
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne _0803A600
	str r6, [r4]
	ldr r0, _0803A5FC @ =0x0203A8EC
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803A666
	.align 2, 0
_0803A5F4: .4byte 0x0202BD48
_0803A5F8: .4byte 0x03004690
_0803A5FC: .4byte 0x0203A8EC
_0803A600:
	ldrb r0, [r1, #0xb]
	strb r0, [r7]
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, #1
	ldrb r7, [r0]
_0803A60E:
	bl sub_080375B8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A624
	adds r5, #1
	cmp r5, #0xff
	ble _0803A60E
	bl AiExecFallbackScriptA
_0803A624:
	ldr r1, _0803A63C @ =0x0203A97C
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bne _0803A644
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803A644
	ldr r0, _0803A640 @ =0x0203A8EC
	ldrb r1, [r1, #6]
	adds r0, #0x86
	b _0803A64A
	.align 2, 0
_0803A63C: .4byte 0x0203A97C
_0803A640: .4byte 0x0203A8EC
_0803A644:
	ldr r0, _0803A674 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #0
_0803A64A:
	strb r1, [r0]
	bl AiClearDecision
	ldr r1, _0803A678 @ =0x03004690
	ldr r0, [r1]
	adds r0, #0x42
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r7, [r0]
	ldr r0, _0803A67C @ =0x0202BD48
	mov r2, r8
	strb r2, [r0]
	str r6, [r1]
_0803A666:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A674: .4byte 0x0203A8EC
_0803A678: .4byte 0x03004690
_0803A67C: .4byte 0x0202BD48
