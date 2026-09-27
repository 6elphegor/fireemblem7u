	.include "macro.inc"

	.syntax unified

	thumb_func_start GetStatIncrease
GetStatIncrease: @ 0x080295E0
	push {r4, lr}
	movs r4, #0
	cmp r0, #0x64
	ble _080295F0
_080295E8:
	adds r4, #1
	subs r0, #0x64
	cmp r0, #0x64
	bgt _080295E8
_080295F0:
	bl RandRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080295FC
	adds r4, #1
_080295FC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
