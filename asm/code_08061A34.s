	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061A34
sub_08061A34: @ 0x08061A34
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r4, _08061ADC @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _08061A62
	ldr r0, _08061AE0 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_08061A62:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08061A88
	ldr r0, [r5, #0x4c]
	ldr r1, _08061AE4 @ =0x02022862
	movs r2, #0xf
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_0805067C
_08061A88:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08061B58
	ldr r1, _08061AE8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, _08061AEC @ =0x02000000
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _08061AF4
	ldr r3, _08061AF0 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	b _08061B20
	.align 2, 0
_08061ADC: .4byte 0x02000010
_08061AE0: .4byte 0x0000F3FF
_08061AE4: .4byte 0x02022862
_08061AE8: .4byte 0x0201774C
_08061AEC: .4byte 0x02000000
_08061AF0: .4byte 0x03002870
_08061AF4:
	ldr r3, _08061B60 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
_08061B20:
	ldr r1, [r5, #0x5c]
	ldr r3, _08061B64 @ =0x0000F3FF
	adds r0, r3, #0
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	ldr r1, [r5, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	adds r0, r3, #0
	ldrh r1, [r6, #8]
	ands r0, r1
	orrs r0, r2
	strh r0, [r6, #8]
	cmp r4, #0
	beq _08061B52
	adds r0, r3, #0
	ldrh r1, [r4, #8]
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #8]
_08061B52:
	adds r0, r5, #0
	bl Proc_Break
_08061B58:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061B60: .4byte 0x03002870
_08061B64: .4byte 0x0000F3FF
