	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepGetLatestUnitIndex
PrepGetLatestUnitIndex: @ 0x0808E110
	push {r4, r5, lr}
	movs r5, #0
	b _0808E12E
_0808E116:
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl PrepGetLatestCharId
	cmp r4, r0
	bne _0808E12C
	adds r0, r5, #0
	b _0808E138
_0808E12C:
	adds r5, #1
_0808E12E:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808E116
	movs r0, #0
_0808E138:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
