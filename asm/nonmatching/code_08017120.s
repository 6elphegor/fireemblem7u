	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPartyTotalGoldValue
GetPartyTotalGoldValue: @ 0x08017120
	push {r4, lr}
	bl GetConvoyItemCostSum
	adds r4, r0, #0
	bl GetUnitItemCostSum
	adds r4, r4, r0
	bl GetGold
	adds r4, r4, r0
	ldr r0, _08017144 @ =0x0098967F
	cmp r4, r0
	ble _0801713C
	adds r4, r0, #0
_0801713C:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08017144: .4byte 0x0098967F
