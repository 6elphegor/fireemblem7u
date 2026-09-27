	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSupportBonuses
GetUnitSupportBonuses: @ 0x08026A18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	bl InitBonuses
	adds r0, r7, #0
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov r8, r1
	cmp sb, sl
	bge _08026AE4
	subs r0, #1
	str r0, [sp]
_08026A46:
	mov r1, sb
	asrs r1, r1, #1
	mov sb, r1
	adds r0, r7, #0
	mov r1, r8
	bl GetUnitSupportUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08026ADC
	ldr r1, _08026B1C @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08026A8C
	movs r2, #0x10
	ldrsb r2, [r7, r2]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026A76
	subs r1, r0, r2
_08026A76:
	movs r3, #0x11
	ldrsb r3, [r7, r3]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _08026A86
	subs r0, r2, r3
_08026A86:
	adds r0, r1, r0
	cmp r0, #3
	bgt _08026ADC
_08026A8C:
	ldr r0, [r5, #0xc]
	ldr r1, _08026B20 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08026ADC
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl GetUnitSupportNumByPid
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetUnitSupportLevel
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r4, #0
	bl ApplyAffinityBonuses
	adds r0, r7, #0
	mov r1, r8
	bl GetUnitSupportLevel
	adds r5, r0, #0
	ldr r0, [r7]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r5, #0
	bl ApplyAffinityBonuses
	cmp r4, #0
	beq _08026ADC
	cmp r5, #0
	beq _08026ADC
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r1
	add sb, r0
_08026ADC:
	movs r0, #1
	add r8, r0
	cmp r8, sl
	blt _08026A46
_08026AE4:
	ldrb r1, [r6, #1]
	lsrs r0, r1, #1
	strb r0, [r6, #1]
	ldrb r1, [r6, #2]
	lsrs r0, r1, #1
	strb r0, [r6, #2]
	ldrb r1, [r6, #3]
	lsrs r0, r1, #1
	strb r0, [r6, #3]
	ldrb r1, [r6, #4]
	lsrs r0, r1, #1
	strb r0, [r6, #4]
	ldrb r1, [r6, #5]
	lsrs r0, r1, #1
	strb r0, [r6, #5]
	ldrb r1, [r6, #6]
	lsrs r0, r1, #1
	strb r0, [r6, #6]
	mov r0, sb
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026B1C: .4byte 0x0202BBB8
_08026B20: .4byte 0x0001002C
