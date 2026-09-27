	.include "macro.inc"

	.syntax unified

	thumb_func_start GetStatusSceenLeaderUnit
GetStatusSceenLeaderUnit: @ 0x0808681C
	push {r4, lr}
	movs r4, #1
_08086820:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08086836
	ldr r0, [r1]
	cmp r0, #0
	beq _08086836
	adds r0, r1, #0
	b _0808683E
_08086836:
	adds r4, #1
	cmp r4, #0x3f
	ble _08086820
	movs r0, #0
_0808683E:
	pop {r4}
	pop {r1}
	bx r1
