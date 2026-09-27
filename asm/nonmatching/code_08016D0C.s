	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitItemSlot
GetUnitItemSlot: @ 0x08016D0C
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0xff
	adds r2, r0, #0
	adds r2, #0x1e
_08016D16:
	adds r0, r4, #0
	ldrh r5, [r2]
	ands r0, r5
	cmp r0, r1
	bne _08016D24
	adds r0, r3, #0
	b _08016D30
_08016D24:
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _08016D16
	movs r0, #1
	rsbs r0, r0, #0
_08016D30:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
