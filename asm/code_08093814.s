	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093814
sub_08093814: @ 0x08093814
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _0809382A
	movs r5, #1
_0809382A:
	adds r0, r4, #5
	cmp r0, r1
	bge _08093834
	movs r0, #2
	orrs r5, r0
_08093834:
	adds r0, r5, #0
	bl SetUiSpinningArrowConfig
	pop {r4, r5}
	pop {r0}
	bx r0
