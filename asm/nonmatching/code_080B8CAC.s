	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8CAC
sub_080B8CAC: @ 0x080B8CAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _080B8D10 @ =0x08CEE868
	ldr r0, [r4]
	str r0, [r6, #0x48]
	movs r1, #4
	str r1, [r6, #0x40]
	str r1, [r6, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r6, #0x48]
	movs r1, #0
	bl Text_SetColor
	movs r5, #0
	mov r8, r4
	movs r7, #0xc0
	lsls r7, r7, #1
_080B8CD6:
	lsls r4, r5, #3
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldr r1, _080B8D14 @ =0x02022C64
	adds r1, r7, r1
	bl PutText
	adds r7, #0x80
	adds r5, #1
	cmp r5, #4
	ble _080B8CD6
	movs r0, #1
	bl EnableBgSync
	ldr r2, [r6, #0x2c]
	ldrb r1, [r2]
	cmp r1, #4
	beq _080B8D48
	cmp r1, #4
	bgt _080B8D18
	cmp r1, #3
	beq _080B8D44
	b _080B8D6A
	.align 2, 0
_080B8D10: .4byte 0x08CEE868
_080B8D14: .4byte 0x02022C64
_080B8D18:
	cmp r1, #5
	bne _080B8D6A
	bl GetGameOverallRank
	adds r5, r0, #0
	cmp r5, #3
	ble _080B8D30
	ldr r0, _080B8D2C @ =0x00001075
	b _080B8D88
	.align 2, 0
_080B8D2C: .4byte 0x00001075
_080B8D30:
	cmp r5, #1
	ble _080B8D3C
	ldr r0, _080B8D38 @ =0x00001077
	b _080B8D88
	.align 2, 0
_080B8D38: .4byte 0x00001077
_080B8D3C:
	ldr r0, _080B8D40 @ =0x00001079
	b _080B8D88
	.align 2, 0
_080B8D40: .4byte 0x00001079
_080B8D44:
	ldr r0, [r2, #4]
	b _080B8D88
_080B8D48:
	ldr r3, [r6, #0x30]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080B8D5C
	ldr r0, [r6, #0x34]
	ldr r0, [r0, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080B8D66
_080B8D5C:
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	bl GetPidDefeatedEndingString
	b _080B8D8C
_080B8D66:
	ldr r0, [r2, #4]
	b _080B8D88
_080B8D6A:
	ldr r2, [r6, #0x30]
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B8D84
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl GetPidDefeatedEndingString
	str r0, [r6, #0x44]
	cmp r0, #0
	bne _080B8D8E
_080B8D84:
	ldr r0, [r6, #0x2c]
	ldr r0, [r0, #4]
_080B8D88:
	bl DecodeMsg
_080B8D8C:
	str r0, [r6, #0x44]
_080B8D8E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
