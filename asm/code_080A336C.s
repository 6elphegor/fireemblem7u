	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuIndexToValidBitfile
SaveMenuIndexToValidBitfile: @ 0x080A336C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A337A:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A3394
	cmp r5, r3
	bne _080A3392
	adds r0, r1, #0
	lsls r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080A339C
_080A3392:
	adds r3, #1
_080A3394:
	adds r2, #1
	cmp r2, #7
	ble _080A337A
	movs r0, #0xff
_080A339C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
