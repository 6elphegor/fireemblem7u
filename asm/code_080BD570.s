	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD570
sub_080BD570: @ 0x080BD570
	movs r2, #0
	adds r1, r0, #0
_080BD574:
	ldr r0, [r1]
	cmp r0, #0
	beq _080BD582
	adds r1, #4
	adds r2, #1
	cmp r2, #1
	ble _080BD574
_080BD582:
	adds r0, r2, #0
	bx lr
	.align 2, 0
