	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080912CC
sub_080912CC: @ 0x080912CC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r3, #1
_080912D4:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _080912E2
	adds r0, r1, #0
	b _080912EA
_080912E2:
	adds r1, #1
	cmp r1, #0xf
	ble _080912D4
	movs r0, #0
_080912EA:
	bx lr
