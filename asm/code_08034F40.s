	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034F40
sub_08034F40: @ 0x08034F40
	push {r4, lr}
	sub sp, #8
	ldr r1, _08034F8C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08034FE8
	ldr r4, _08034F90 @ =0x03004690
	ldr r0, [r4]
	bl AiUpdateGetUnitIsHealing
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08034FCC
	bl AiTryHealSelf
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08034FE8
	ldr r1, [r4]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _08034F94
	bl AiTryMoveTowardsEscape
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08034F94
	bl AiTryDanceOrStealAfterMove
	b _08034FE8
	.align 2, 0
_08034F8C: .4byte 0x0203A8EC
_08034F90: .4byte 0x03004690
_08034F94:
	add r4, sp, #4
	adds r0, r4, #0
	bl AiTryGetNearestHealPoint
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08034FE8
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl AiTryMoveTowards
	ldr r0, _08034FC8 @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	cmp r0, #1
	bne _08034FE8
	bl AiTryActionAfterMove
	b _08034FE8
	.align 2, 0
_08034FC8: .4byte 0x0203A97C
_08034FCC:
	ldr r1, [r4]
	movs r0, #8
	ldrb r1, [r1, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _08034FE8
	bl AiTryMoveTowardsEscape
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08034FE8
	bl AiTryDanceOrStealAfterMove
_08034FE8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
