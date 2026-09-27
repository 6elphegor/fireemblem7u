	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020F24
sub_08020F24: @ 0x08020F24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08020F40
	b _0802106A
_08020F40:
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0x28
	ble _08020F54
	b _0802106A
_08020F54:
	movs r3, #0x64
	adds r3, r3, r6
	mov sl, r3
	mov r7, sl
_08020F5C:
	ldr r0, _08021020 @ =0x08B93CBC
	adds r1, r6, #0
	bl Proc_Start
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	lsls r1, r1, #0x10
	ldr r4, _08021024 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r4, r5, #0
	adds r4, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	movs r5, #0
	ldrsh r0, [r7, r5]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _08020FA6
	movs r0, #0x80
	lsls r0, r0, #1
_08020FA6:
	str r0, [sp]
	adds r0, r4, #0
	bl Calcs_Interpolate
	mov r2, r8
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r2]
	movs r3, #1
	add sb, r3
	mov r4, sb
	cmp r4, #0
	bgt _08020FC8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08020F5C
_08020FC8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bgt _0802106A
	ldr r0, _08021020 @ =0x08B93CBC
	adds r1, r6, #0
	bl Proc_Start
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	subs r1, #8
	lsls r1, r1, #0x10
	ldr r4, _08021024 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #5
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r7, r5, #0
	adds r7, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	mov r5, sl
	movs r4, #0
	ldrsh r0, [r5, r4]
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r0, r4
	bgt _08021028
	str r0, [sp]
	b _0802102A
	.align 2, 0
_08021020: .4byte 0x08B93CBC
_08021024: .4byte 0x0000FFFF
_08021028:
	str r4, [sp]
_0802102A:
	adds r0, r7, #0
	bl Calcs_Interpolate
	mov r5, r8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	mov r1, sl
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt _0802104A
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1]
_0802104A:
	mov r4, sl
	movs r5, #0
	ldrsh r1, [r4, r5]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0802106A
	adds r0, r6, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x66
	movs r0, #1
	strh r0, [r1]
_0802106A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
