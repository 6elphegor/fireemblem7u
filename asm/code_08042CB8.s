	.include "macro.inc"

	.syntax unified

	thumb_func_start XMapTransfer_80482E0
XMapTransfer_80482E0: @ 0x08042CB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _08042CDC @ =0x08B98B38
	bl Proc_Find
	cmp r0, #0
	beq _08042CE4
	ldr r0, _08042CE0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042D88
	adds r0, r6, #0
	movs r1, #4
	b _08042D2E
	.align 2, 0
_08042CDC: .4byte 0x08B98B38
_08042CE0: .4byte 0x08B857F8
_08042CE4:
	ldr r0, _08042D38 @ =0x08B98AEC
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #1
	bgt _08042D2A
	adds r1, r0, #0
	adds r0, r2, #0
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _08042D2A
	movs r1, #0
	adds r2, #0x1a
_08042D02:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08042D0C
	adds r5, #1
_08042D0C:
	adds r1, #1
	cmp r1, #3
	ble _08042D02
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042D2A
	ldr r4, _08042D38 @ =0x08B98AEC
	ldr r2, [r4]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _08042D2A
	cmp r5, #0
	beq _08042D3C
_08042D2A:
	adds r0, r6, #0
	movs r1, #0
_08042D2E:
	bl EventGotoLabel
_08042D32:
	movs r0, #0
	b _08042D8A
	.align 2, 0
_08042D38: .4byte 0x08B98AEC
_08042D3C:
	ldr r0, _08042D84 @ =0x030046C0
	movs r1, #0xdc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl SioSend
	ldr r1, [r4]
	movs r0, #3
	ldrb r2, [r1, #9]
	ands r0, r2
	cmp r0, #3
	bne _08042D88
	strb r0, [r1, #9]
	bl sub_0803D674
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0x1e]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08042D32
	adds r0, r6, #0
	movs r1, #1
	bl EventGotoLabel
	b _08042D32
	.align 2, 0
_08042D84: .4byte 0x030046C0
_08042D88:
	movs r0, #1
_08042D8A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
