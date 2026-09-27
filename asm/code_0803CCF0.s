	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803CCF0
sub_0803CCF0: @ 0x0803CCF0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0803CCF6:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD40
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CD0C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803CD0C:
	adds r4, #1
	cmp r4, #3
	ble _0803CCF6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
