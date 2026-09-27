	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034D30
sub_08034D30: @ 0x08034D30
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
_08034D34:
	ldr r4, _08034D78 @ =0x0203A8EC
	adds r0, r4, #0
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r4, #0x74]
	ldrb r0, [r2]
	cmp r0, #0
	beq _08034E24
	adds r0, r4, #0
	adds r0, #0x7c
	strb r1, [r0]
	ldr r1, _08034D7C @ =0x0202BD48
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r1, r0, #0
	ldr r6, _08034D80 @ =0x03004690
	str r1, [r6]
	ldr r5, [r1, #0xc]
	movs r0, #6
	ands r5, r0
	cmp r5, #0
	bne _08034D6E
	ldr r0, [r1]
	cmp r0, #0
	bne _08034D84
_08034D6E:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	b _08034D34
	.align 2, 0
_08034D78: .4byte 0x0203A8EC
_08034D7C: .4byte 0x0202BD48
_08034D80: .4byte 0x03004690
_08034D84:
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	ldr r0, [r6]
	bl sub_0803C0C8
	ldr r1, [r6]
	adds r1, #0x40
	movs r0, #0xf8
	ldrh r1, [r1]
	ands r0, r1
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x7d
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x7a
	strb r5, [r0]
	bl AiRefreshDangerMap
	bl AiClearDecision
	ldr r0, _08034E00 @ =0x030047A0
	ldr r0, [r0]
	bl _call_via_r0
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r1, _08034E04 @ =0x0203A97C
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08034DEE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _08034E08
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r1, #3]
	cmp r0, r2
	bne _08034E08
	ldrb r0, [r1]
	cmp r0, #0
	bne _08034E08
_08034DEE:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	adds r0, r7, #0
	movs r1, #0
	bl Proc_Goto
	b _08034E2A
	.align 2, 0
_08034E00: .4byte 0x030047A0
_08034E04: .4byte 0x0203A97C
_08034E08:
	ldr r0, _08034E1C @ =0x0203A8EC
	ldr r1, [r0, #0x74]
	adds r1, #1
	str r1, [r0, #0x74]
	ldr r0, _08034E20 @ =0x08B96F9C
	adds r1, r7, #0
	bl Proc_StartBlocking
	b _08034E2A
	.align 2, 0
_08034E1C: .4byte 0x0203A8EC
_08034E20: .4byte 0x08B96F9C
_08034E24:
	adds r0, r7, #0
	bl Proc_End
_08034E2A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
