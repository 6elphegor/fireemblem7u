	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044E2C
sub_08044E2C: @ 0x08044E2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r2, #0
	ldr r0, _08044EA4 @ =0x081D5470
	mov sl, r0
_08044E3E:
	ldr r0, _08044EA8 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r2, r0
	add r0, sl
	ldrb r4, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov sb, r1
	cmp r0, #0
	beq _08044EC2
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r2, #2
	ldr r7, _08044EAC @ =0x03001400
_08044E70:
	adds r0, r3, r2
	adds r5, r0, r6
	ldr r0, _08044EB0 @ =0x081D54FC
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, [r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _08044E9C
	ldr r0, [r1, #0xc]
	ldr r1, _08044EB4 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _08044EB8
_08044E9C:
	adds r1, r5, r7
	movs r0, #0
	strb r0, [r1]
	b _08044EBC
	.align 2, 0
_08044EA4: .4byte 0x081D5470
_08044EA8: .4byte 0x08B98AEC
_08044EAC: .4byte 0x03001400
_08044EB0: .4byte 0x081D54FC
_08044EB4: .4byte 0x00010005
_08044EB8:
	adds r0, r5, r7
	strb r4, [r0]
_08044EBC:
	adds r6, #1
	cmp r6, #4
	ble _08044E70
_08044EC2:
	mov r2, sb
	cmp r2, #3
	ble _08044E3E
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
