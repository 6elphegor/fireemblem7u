	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGlobalSupportListFromSave
GetGlobalSupportListFromSave: @ 0x0809ED34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x78
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	ldr r1, _0809ED74 @ =0x08BDCE4C
	mov r7, sb
	subs r7, #1
	movs r0, #0x34
	adds r2, r7, #0
	muls r2, r0, r2
	str r2, [sp, #0x64]
	adds r0, r1, #0
	adds r0, #0x2c
	adds r2, r2, r0
	mov r8, r2
	ldr r0, [r2]
	cmp r0, #0
	bne _0809ED78
	movs r0, #0
	movs r1, #6
_0809ED66:
	strb r0, [r6]
	adds r6, #1
	subs r1, #1
	cmp r1, #0
	bge _0809ED66
	b _0809EE3A
	.align 2, 0
_0809ED74: .4byte 0x08BDCE4C
_0809ED78:
	movs r5, #0
	ldr r4, _0809EE00 @ =0x08C9F9F4
	mov r3, sl
	cmp r3, #0
	bne _0809ED8A
	mov sl, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809ED8A:
	ldrb r0, [r4]
	str r7, [sp, #0x70]
	cmp r0, #0
	beq _0809EE1A
	mov r7, r8
	str r7, [sp, #0x6c]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x68]
_0809ED9A:
	ldrb r0, [r4]
	cmp r0, sb
	beq _0809EDB0
	ldrb r0, [r4, #1]
	adds r1, r5, #1
	mov ip, r1
	adds r2, r4, #0
	adds r2, #0x14
	str r2, [sp, #0x74]
	cmp r0, sb
	bne _0809EE10
_0809EDB0:
	asrs r2, r5, #2
	adds r0, r5, #0
	movs r3, #3
	ands r0, r3
	lsls r0, r0, #1
	mov r8, r0
	movs r1, #0
	ldr r7, [sp, #0x6c]
	ldr r0, [r7]
	adds r5, #1
	mov ip, r5
	adds r3, r4, #0
	adds r3, #0x14
	str r3, [sp, #0x74]
	ldrb r0, [r0, #0x15]
	cmp r1, r0
	bge _0809EE10
	ldr r0, _0809EE04 @ =0x08BDCE78
	ldr r5, [sp, #0x68]
	adds r3, r5, r0
	mov r0, sl
	adds r0, #0x20
	adds r5, r0, r2
_0809EDDE:
	ldr r2, [r3]
	adds r0, r2, r1
	ldrb r0, [r0]
	ldrb r7, [r4]
	cmp r7, r0
	beq _0809EDF0
	ldrb r7, [r4, #1]
	cmp r7, r0
	bne _0809EE08
_0809EDF0:
	adds r1, r6, r1
	ldrb r0, [r5]
	mov r2, r8
	asrs r0, r2
	movs r3, #3
	ands r0, r3
	strb r0, [r1]
	b _0809EE10
	.align 2, 0
_0809EE00: .4byte 0x08C9F9F4
_0809EE04: .4byte 0x08BDCE78
_0809EE08:
	adds r1, #1
	ldrb r2, [r2, #0x15]
	cmp r1, r2
	blt _0809EDDE
_0809EE10:
	mov r5, ip
	ldr r4, [sp, #0x74]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809ED9A
_0809EE1A:
	movs r0, #0x34
	ldr r5, [sp, #0x70]
	muls r0, r5, r0
	ldr r1, _0809EE4C @ =0x08BDCE4C
	adds r1, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r1, [r0, #0x15]
	cmp r1, #6
	bgt _0809EE3A
	movs r2, #0
_0809EE30:
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #6
	ble _0809EE30
_0809EE3A:
	add sp, #0x78
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EE4C: .4byte 0x08BDCE4C
