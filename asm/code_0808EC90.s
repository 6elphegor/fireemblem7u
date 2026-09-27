	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenuSetUnitStateAndEndFlag
AtMenuSetUnitStateAndEndFlag: @ 0x0808EC90
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0808EC96:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808ECB0
	ldr r0, [r2]
	cmp r0, #0
	beq _0808ECB0
	ldr r0, [r2, #0xc]
	ldr r1, _0808ECC4 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0808ECB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EC96
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECC4: .4byte 0xFDFFFFFF
