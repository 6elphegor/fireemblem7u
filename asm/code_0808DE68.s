	.include "macro.inc"

	.syntax unified

	thumb_func_start CalcForceDeployedUnitCounts
CalcForceDeployedUnitCounts: @ 0x0808DE68
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0808DE6E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808DE96
	ldr r2, [r0]
	cmp r2, #0
	beq _0808DE96
	ldr r0, [r0, #0xc]
	ldr r1, _0808DEA4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808DE96
	ldrb r0, [r2, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DE96
	adds r5, #1
_0808DE96:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808DE6E
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808DEA4: .4byte 0x00010004
