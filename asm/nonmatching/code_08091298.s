	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091298
sub_08091298: @ 0x08091298
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080912A6:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080912BC
	cmp r3, r5
	bne _080912BA
	adds r0, r1, #0
	lsls r0, r2
	b _080912C4
_080912BA:
	adds r3, #1
_080912BC:
	adds r2, #1
	cmp r2, #0xf
	ble _080912A6
	movs r0, #0
_080912C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
