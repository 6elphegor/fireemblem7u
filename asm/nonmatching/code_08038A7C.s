	.include "macro.inc"

	.syntax unified

	thumb_func_start AiAttemptBallistaCombat
AiAttemptBallistaCombat: @ 0x08038A7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	mov r8, r1
	movs r0, #0
	mov sl, r0
	add r4, sp, #0xc
	ldr r1, _08038AF0 @ =0x081D3B64
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	ldr r0, _08038AF4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08038B18
_08038AA8:
	ldr r0, _08038AF4 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r3, r7, #1
	mov sb, r3
	cmp r4, #0
	blt _08038B12
	ldr r2, _08038AF8 @ =0x0202E3E4
	lsls r6, r7, #2
_08038ABC:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038B0C
	adds r0, r4, #0
	adds r1, r7, #0
	str r2, [sp, #0x14]
	bl GetBallistaItemAt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x14]
	cmp r5, #0
	beq _08038AFC
	movs r0, #1
	add sl, r0
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	b _08038B0C
	.align 2, 0
_08038AF0: .4byte 0x081D3B64
_08038AF4: .4byte 0x0202E3D8
_08038AF8: .4byte 0x0202E3E4
_08038AFC:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
_08038B0C:
	subs r4, #1
	cmp r4, #0
	bge _08038ABC
_08038B12:
	mov r7, sb
	cmp r7, #0
	bge _08038AA8
_08038B18:
	mov r0, sl
	cmp r0, #0
	beq _08038BD8
	movs r0, #0
	mov r1, r8
	strb r0, [r1, #2]
	str r0, [r1, #8]
	movs r1, #0
	mov r6, sp
_08038B2A:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r5, [r0]
	ldr r0, _08038BCC @ =0x0000FFFF
	mov r2, r8
	strh r0, [r2, #4]
	movs r7, #1
	adds r1, #1
	mov sb, r1
_08038B3E:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08038BAC
	ldr r0, [r4]
	cmp r0, #0
	beq _08038BAC
	ldr r0, [r4, #0xc]
	ldr r1, _08038BD0 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08038BAC
	adds r0, r4, #0
	ldr r3, [sp, #0x10]
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAC
	ldr r0, _08038BD4 @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAC
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillReversedAttackRangeMap
	ldrb r0, [r4, #0xb]
	strb r0, [r6, #2]
	mov r0, sp
	adds r1, r5, #0
	bl AiSimulateBestBallistaBattleAgainstTarget
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAC
	ldr r1, [sp, #8]
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r1, r0
	blo _08038BAC
	ldrb r0, [r6]
	strb r0, [r2]
	ldrb r0, [r6, #1]
	strb r0, [r2, #1]
	ldrb r0, [r6, #2]
	strb r0, [r2, #2]
	str r1, [r2, #8]
_08038BAC:
	adds r7, #1
	cmp r7, #0xbf
	ble _08038B3E
	mov r1, sb
	cmp r1, #2
	ble _08038B2A
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _08038BC6
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _08038BD8
_08038BC6:
	movs r0, #1
	b _08038BDA
	.align 2, 0
_08038BCC: .4byte 0x0000FFFF
_08038BD0: .4byte 0x00010025
_08038BD4: .4byte 0x03004690
_08038BD8:
	movs r0, #0
_08038BDA:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
