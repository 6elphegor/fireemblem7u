	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawSupportSubScreenUnitPartnerText
DrawSupportSubScreenUnitPartnerText: @ 0x0809C654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _0809C6E8 @ =0x0840F424
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sb
	adds r0, #0x40
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809C6F0
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _0809C6EC @ =0x02023C60
	lsls r0, r0, #1
	adds r4, r0, r1
_0809C68E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809C68E
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _0809C6EC @ =0x02023C60
	lsls r0, r0, #1
	adds r4, r0, r1
_0809C6B0:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _0809C6B0
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _0809C6EC @ =0x02023C60
	lsls r0, r0, #1
	adds r4, r0, r1
_0809C6D2:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809C6D2
	b _0809C830
	.align 2, 0
_0809C6E8: .4byte 0x0840F424
_0809C6EC: .4byte 0x02023C60
_0809C6F0:
	movs r7, #0
	mov r2, sb
	ldr r0, [r2, #0x2c]
	bl GetSupportScreenCharIdAt
	str r0, [sp, #0x14]
	mov r3, sb
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	str r0, [sp, #0x18]
	ldrb r4, [r4]
	cmp r4, #2
	bne _0809C710
	movs r7, #1
_0809C710:
	mov r4, sb
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _0809C7A0 @ =0x08BDCE4C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _0809C7A4 @ =0x02023C80
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, sb
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _0809C7A0 @ =0x08BDCE4C
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl GetUnitsAverageSupportValue
	cmp r0, #2
	bne _0809C7EC
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov sb, r4
	lsls r4, r0, #1
_0809C792:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _0809C7A8
	movs r7, #4
	b _0809C7B0
	.align 2, 0
_0809C7A0: .4byte 0x08BDCE4C
_0809C7A4: .4byte 0x02023C80
_0809C7A8:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809C7B0
	movs r7, #0
_0809C7B0:
	ldr r3, _0809C7E8 @ =0x02023C60
	adds r0, r4, r3
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _0809C792
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809C830
	.align 2, 0
_0809C7E8: .4byte 0x02023C60
_0809C7EC:
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_0809C800:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _0809C80C
	movs r7, #4
	b _0809C814
_0809C80C:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809C814
	movs r7, #0
_0809C814:
	ldr r0, _0809C840 @ =0x02023C60
	adds r0, r4, r0
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r2}
	adds r1, r7, #0
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809C800
_0809C830:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C840: .4byte 0x02023C60
