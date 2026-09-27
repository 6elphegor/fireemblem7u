	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLatestUnitIndexInPrepListByUId
GetLatestUnitIndexInPrepListByUId: @ 0x0808E0DC
	push {r4, r5, lr}
	movs r5, #0
	b _0808E0FE
_0808E0E2:
	bl GetLastStatScreenUnitId
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _0808E0FC
	adds r0, r5, #0
	b _0808E108
_0808E0FC:
	adds r5, #1
_0808E0FE:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808E0E2
	movs r0, #0
_0808E108:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
