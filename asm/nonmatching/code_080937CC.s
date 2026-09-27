	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080937CC
sub_080937CC: @ 0x080937CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809380E
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _08093800
	cmp r4, #0
	bne _080937F6
	strh r4, [r5, #0x30]
	b _080937FC
_080937F6:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_080937FC:
	cmp r4, r6
	ble _0809380E
_08093800:
	cmp r4, r1
	bne _08093808
	subs r0, r4, #5
	b _0809380A
_08093808:
	subs r0, r4, #4
_0809380A:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809380E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
