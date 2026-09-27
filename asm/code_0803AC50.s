	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803AC50
sub_0803AC50: @ 0x0803AC50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r0, _0803ADA8 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	ldr r0, [sp, #0x18]
	bl GenerateMagicSealMap
	bl sub_0801A0FC
	ldr r0, _0803ADAC @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803AC92
	adds r1, r0, #0
	mov sl, r1
_0803AC92:
	ldr r0, _0803ADB0 @ =0x0202E3D8
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803AD72
_0803AC9E:
	ldr r0, _0803ADB0 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x20]
	cmp r6, #0
	blt _0803AD6C
	lsls r4, r7, #2
	mov r8, r4
_0803ACB2:
	ldr r0, _0803ADB4 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AD66
	ldr r0, _0803ADB8 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803AD66
	ldr r0, _0803ADBC @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803AD66
	adds r0, r1, #0
	bl GetUnit
	adds r5, r0, #0
	movs r0, #4
	ldr r1, _0803ADC0 @ =0x0203A967
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803AD02
	mov r2, sb
	cmp r2, #0
	beq _0803AD02
	adds r0, r5, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803AD66
_0803AD02:
	ldr r4, _0803ADC4 @ =0x0203A968
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803AD14
	movs r0, #1
	ldrb r1, [r5, #0xa]
	ands r0, r1
	cmp r0, #0
	beq _0803AD66
_0803AD14:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sl
	bhi _0803AD66
	add r5, sp, #0xc
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AD66
	mov sl, r4
	add r0, sp, #0xc
	movs r4, #0
	ldrsh r2, [r0, r4]
	str r2, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r5, r1]
	str r0, [sp, #0x18]
	ldr r0, _0803ADB8 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803AD66:
	subs r6, #1
	cmp r6, #0
	bge _0803ACB2
_0803AD6C:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803AC9E
_0803AD72:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x14]
	cmp r2, r0
	beq _0803AD96
	adds r0, r2, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803AD96:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ADA8: .4byte 0x03004690
_0803ADAC: .4byte 0x0203A8EC
_0803ADB0: .4byte 0x0202E3D8
_0803ADB4: .4byte 0x0202E3E4
_0803ADB8: .4byte 0x0202E3DC
_0803ADBC: .4byte 0x0202BD48
_0803ADC0: .4byte 0x0203A967
_0803ADC4: .4byte 0x0203A968
