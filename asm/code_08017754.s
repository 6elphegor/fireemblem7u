	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08017754
sub_08017754: @ 0x08017754
	adds r2, r0, #0
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017766
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x14]
_08017766:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017776
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x17]
_08017776:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017786
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x18]
_08017786:
	bx lr
