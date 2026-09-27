	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044D2C
sub_08044D2C: @ 0x08044D2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
_08044D3A:
	ldr r0, _08044DB8 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _08044DBC @ =0x081D5470
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq _08044DA2
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _08044DC0 @ =0x081D5490
	mov sl, r0
_08044D6C:
	adds r0, r3, r7
	adds r5, r0, r6
	ldr r0, _08044DC4 @ =0x081D54FC
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r3, [sp]
	cmp r0, #0
	beq _08044D9C
	ldr r0, _08044DC8 @ =0x03001400
	adds r0, r5, r0
	strb r4, [r0]
	lsls r1, r5, #2
	add r1, sl
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
_08044D9C:
	adds r6, #1
	cmp r6, #4
	ble _08044D6C
_08044DA2:
	mov r7, sb
	cmp r7, #3
	ble _08044D3A
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044DB8: .4byte 0x08B98AEC
_08044DBC: .4byte 0x081D5470
_08044DC0: .4byte 0x081D5490
_08044DC4: .4byte 0x081D54FC
_08044DC8: .4byte 0x03001400
