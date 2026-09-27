	.include "macro.inc"

	.syntax unified

	thumb_func_start ReorderPlayerUnitsBasedOnDeployment
ReorderPlayerUnitsBasedOnDeployment: @ 0x0808E140
	push {r4, lr}
	ldr r0, _0808E1A8 @ =0x020106DC
	bl InitUnitStack
	movs r4, #1
_0808E14A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808E16C
	ldr r0, [r2]
	cmp r0, #0
	beq _0808E16C
	ldr r0, [r2, #0xc]
	ldr r1, _0808E1AC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808E16C
	adds r0, r2, #0
	bl PushUnit
_0808E16C:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E14A
	movs r4, #1
_0808E174:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808E196
	ldr r0, [r2]
	cmp r0, #0
	beq _0808E196
	ldr r0, [r2, #0xc]
	ldr r1, _0808E1AC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0808E196
	adds r0, r2, #0
	bl PushUnit
_0808E196:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E174
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E1A8: .4byte 0x020106DC
_0808E1AC: .4byte 0x0001000C
