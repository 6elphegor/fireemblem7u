	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepOptionCountToRealIndexByMask
PrepOptionCountToRealIndexByMask: @ 0x0808DA70
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	movs r5, #1
_0808DA7A:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _0808DA8E
	cmp r4, r3
	bne _0808DA8C
	adds r0, r2, #0
	b _0808DA98
_0808DA8C:
	adds r3, #1
_0808DA8E:
	adds r2, #1
	cmp r2, #3
	ble _0808DA7A
	movs r0, #1
	rsbs r0, r0, #0
_0808DA98:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
