	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitASupporterPid
GetUnitASupporterPid: @ 0x080B8324
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r5, #0
	bne _080B833C
	b _080B8350
_080B832E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B8352
_080B833C:
	movs r4, #0
_080B833E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportLevel
	cmp r0, #3
	beq _080B832E
	adds r4, #1
	cmp r4, #6
	ble _080B833E
_080B8350:
	movs r0, #0
_080B8352:
	pop {r4, r5}
	pop {r1}
	bx r1
