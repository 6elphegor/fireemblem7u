	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseStatGainItem
CanUnitUseStatGainItem: @ 0x08027578
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl GetItemBonuses
	adds r4, r0, #0
	ldr r6, _08027648 @ =0x03004440
	adds r0, r6, #0
	bl ClearUnit
	ldr r0, [r5]
	str r0, [r6]
	ldr r0, [r5, #4]
	str r0, [r6, #4]
	ldrb r1, [r5, #0x12]
	ldrb r2, [r4]
	adds r0, r1, r2
	strb r0, [r6, #0x12]
	ldrb r1, [r5, #0x14]
	ldrb r2, [r4, #1]
	adds r0, r1, r2
	strb r0, [r6, #0x14]
	ldrb r1, [r5, #0x15]
	ldrb r2, [r4, #2]
	adds r0, r1, r2
	strb r0, [r6, #0x15]
	ldrb r1, [r5, #0x16]
	ldrb r2, [r4, #3]
	adds r0, r1, r2
	strb r0, [r6, #0x16]
	ldrb r1, [r5, #0x17]
	ldrb r2, [r4, #4]
	adds r0, r1, r2
	strb r0, [r6, #0x17]
	ldrb r1, [r5, #0x18]
	ldrb r2, [r4, #5]
	adds r0, r1, r2
	strb r0, [r6, #0x18]
	ldrb r1, [r5, #0x19]
	ldrb r2, [r4, #6]
	adds r0, r1, r2
	strb r0, [r6, #0x19]
	ldrb r1, [r5, #0x1d]
	ldrb r2, [r4, #7]
	adds r0, r1, r2
	strb r0, [r6, #0x1d]
	ldrb r1, [r5, #0x1a]
	ldrb r4, [r4, #8]
	adds r0, r1, r4
	strb r0, [r6, #0x1a]
	adds r0, r6, #0
	bl UnitCheckStatCaps
	movs r1, #0x12
	ldrsb r1, [r6, r1]
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	ldrb r2, [r6, #0x14]
	ldrb r1, [r5, #0x14]
	cmp r2, r1
	beq _080275FC
	movs r0, #1
_080275FC:
	ldrb r2, [r6, #0x15]
	ldrb r1, [r5, #0x15]
	cmp r2, r1
	beq _08027606
	movs r0, #1
_08027606:
	ldrb r2, [r6, #0x16]
	ldrb r1, [r5, #0x16]
	cmp r2, r1
	beq _08027610
	movs r0, #1
_08027610:
	ldrb r2, [r6, #0x17]
	ldrb r1, [r5, #0x17]
	cmp r2, r1
	beq _0802761A
	movs r0, #1
_0802761A:
	ldrb r2, [r6, #0x18]
	ldrb r1, [r5, #0x18]
	cmp r2, r1
	beq _08027624
	movs r0, #1
_08027624:
	ldrb r2, [r6, #0x19]
	ldrb r1, [r5, #0x19]
	cmp r2, r1
	beq _0802762E
	movs r0, #1
_0802762E:
	ldrb r2, [r6, #0x1d]
	ldrb r1, [r5, #0x1d]
	cmp r2, r1
	beq _08027638
	movs r0, #1
_08027638:
	ldrb r6, [r6, #0x1a]
	ldrb r5, [r5, #0x1a]
	cmp r6, r5
	beq _08027642
	movs r0, #1
_08027642:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027648: .4byte 0x03004440
