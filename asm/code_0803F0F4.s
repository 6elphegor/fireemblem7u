	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F0F4
sub_0803F0F4: @ 0x0803F0F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov sb, r1
	movs r0, #0
	str r0, [sp]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F196
_0803F10E:
	movs r1, #0
	mov r8, r1
	mov r3, sb
	adds r3, #1
	str r3, [sp, #8]
_0803F118:
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl GetTacticianTextConf
	str r0, [sp, #4]
	movs r7, #0
	mov r6, r8
	ldr r0, _0803F16C @ =0x00003FFF
	ands r6, r0
	movs r1, #0
	mov ip, r1
_0803F130:
	movs r4, #0
	mov r3, sb
	ldrb r3, [r3]
	str r3, [sp, #0xc]
	ldr r2, [sp, #4]
	add r2, ip
	adds r0, r7, #0
	movs r5, #3
	ands r0, r5
	lsls r1, r0, #0xe
	orrs r1, r6
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, #0x48
	mov r5, sl
	adds r3, r0, r5
_0803F150:
	ldr r0, [r2]
	ldrb r0, [r0]
	ldr r5, [sp, #0xc]
	cmp r0, r5
	bne _0803F170
	strh r1, [r3]
	mov r0, sl
	adds r0, #0x39
	strb r4, [r0]
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	b _0803F18C
	.align 2, 0
_0803F16C: .4byte 0x00003FFF
_0803F170:
	adds r2, #4
	adds r4, #1
	cmp r4, #2
	ble _0803F150
	movs r1, #0xc
	add ip, r1
	adds r7, #1
	cmp r7, #2
	ble _0803F130
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x50
	ble _0803F118
_0803F18C:
	ldr r0, [sp, #8]
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F10E
_0803F196:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
