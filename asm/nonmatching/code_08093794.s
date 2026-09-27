	.include "macro.inc"

	.syntax unified

	thumb_func_start ShouldPrepUnitMenuScroll
ShouldPrepUnitMenuScroll: @ 0x08093794
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _080937A8
	ldrh r2, [r4, #0x2e]
	lsrs r0, r2, #1
	cmp r0, r1
	ble _080937BE
_080937A8:
	adds r5, r1, #5
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _080937C2
	ldrh r4, [r4, #0x2e]
	lsrs r0, r4, #1
	cmp r0, r5
	blt _080937C2
_080937BE:
	movs r0, #1
	b _080937C4
_080937C2:
	movs r0, #0
_080937C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
