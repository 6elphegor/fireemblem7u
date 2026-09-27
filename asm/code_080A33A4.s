	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuGetBitfileByMask
SaveMenuGetBitfileByMask: @ 0x080A33A4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A33B4:
	adds r0, r5, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A33D0
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A33CE
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	b _080A33D8
_080A33CE:
	adds r3, #1
_080A33D0:
	adds r2, #1
	cmp r2, #7
	ble _080A33B4
	movs r0, #0xff
_080A33D8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
