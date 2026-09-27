	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6C8C
sub_080B6C8C: @ 0x080B6C8C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _080B6CC0 @ =0x08CEDD48
	ldr r0, _080B6CC4 @ =0x08CEDE00
	ldr r4, [r0]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080B6CC8 @ =0x0100005A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _080B6CCC @ =0x02000888
	movs r0, #0
	str r0, [r1]
	ldr r0, [r5]
	cmp r0, #0
	beq _080B6D3E
	adds r7, r1, #0
_080B6CB4:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B6CD0
	str r5, [r4, #8]
	b _080B6D2E
	.align 2, 0
_080B6CC0: .4byte 0x08CEDD48
_080B6CC4: .4byte 0x08CEDE00
_080B6CC8: .4byte 0x0100005A
_080B6CCC: .4byte 0x02000888
_080B6CD0:
	bl GetUnitFromCharId
	adds r6, r0, #0
	cmp r6, #0
	beq _080B6D36
	ldrb r0, [r5]
	bl GetPidStats
	adds r2, r0, #0
	str r5, [r4, #8]
	movs r1, #3
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	ble _080B6CF8
	movs r0, #0xff
_080B6CF8:
	strb r0, [r4, #2]
	ldrb r0, [r2]
	strb r0, [r4, #3]
	adds r0, r1, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	bgt _080B6D14
	ldrh r1, [r2, #0xc]
	lsrs r0, r1, #2
	b _080B6D16
_080B6D14:
	movs r0, #0xff
_080B6D16:
	strb r0, [r4, #1]
	ldr r0, [r6, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B6D2A
	ldrb r2, [r2, #5]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	b _080B6D2C
_080B6D2A:
	movs r0, #0xff
_080B6D2C:
	strb r0, [r4]
_080B6D2E:
	adds r4, #0xc
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
_080B6D36:
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #0
	bne _080B6CB4
_080B6D3E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
