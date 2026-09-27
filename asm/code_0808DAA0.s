	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPrepOptionCount
GetPrepOptionCount: @ 0x0808DAA0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	movs r4, #1
_0808DAAA:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _0808DAB6
	adds r2, #1
_0808DAB6:
	adds r1, #1
	cmp r1, #3
	ble _0808DAAA
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
