	.include "macro.inc"

	.syntax unified

	thumb_func_start BitfileToIndex
BitfileToIndex: @ 0x080A33E0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	movs r3, #1
_080A33E8:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _080A33F8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _080A3400
_080A33F8:
	adds r1, #1
	cmp r1, #7
	ble _080A33E8
	movs r0, #0xff
_080A3400:
	bx lr
	.align 2, 0
