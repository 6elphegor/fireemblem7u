	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089714
sub_08089714: @ 0x08089714
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08089758 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808975C
	movs r5, #1
_0808972A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08089750
	ldr r0, [r4]
	cmp r0, #0
	beq _08089750
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089750
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0808955C
_08089750:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808972A
	b _08089788
	.align 2, 0
_08089758: .4byte 0x0200E668
_0808975C:
	movs r4, #1
_0808975E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08089782
	ldr r0, [r2]
	cmp r0, #0
	beq _08089782
	ldr r0, [r2, #0xc]
	ldr r1, _08089790 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08089782
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_0808955C
_08089782:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808975E
_08089788:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089790: .4byte 0x0001000C
