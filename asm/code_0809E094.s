	.include "macro.inc"

	.syntax unified

	thumb_func_start PrintPassword
PrintPassword: @ 0x0809E094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	str r1, [sp, #0xc]
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	str r0, [sp, #0x10]
	add r1, sp, #8
	mov sl, r1
	movs r0, #0xe0
	lsls r0, r0, #1
	mov r8, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r6, #0
_0809E0C4:
	mov r1, sb
	adds r0, r1, r6
	bl ClearText
	movs r5, #2
	bl InitTalkTextFont
	movs r4, #0
	ldr r7, [sp, #0x14]
_0809E0D6:
	adds r2, r7, r4
	ldr r1, _0809E14C @ =0x020144D8
	ldr r0, _0809E150 @ =0x02014404
	ldr r0, [r0]
	ldrh r1, [r1, #6]
	adds r0, r1, r0
	cmp r2, r0
	beq _0809E13A
	ldr r0, _0809E154 @ =0x02014438
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, sl
	strb r0, [r1]
	movs r0, #0
	str r0, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	mov r1, sb
	adds r0, r1, r6
	ldr r1, _0809E158 @ =0x02023C68
	add r1, r8
	movs r2, #1
	adds r3, r5, #0
	bl PutDrawText
	adds r5, #0xb
	adds r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne _0809E120
	adds r5, #0xb
_0809E120:
	cmp r4, #0xd
	ble _0809E0D6
	movs r0, #0xc0
	add r8, r0
	ldr r1, [sp, #0x14]
	adds r1, #0xe
	str r1, [sp, #0x14]
	adds r6, #8
	ldr r0, [sp, #0x10]
	adds r0, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	ble _0809E0C4
_0809E13A:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E14C: .4byte 0x020144D8
_0809E150: .4byte 0x02014404
_0809E154: .4byte 0x02014438
_0809E158: .4byte 0x02023C68
