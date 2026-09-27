	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSupportLevel
GetUnitSupportLevel: @ 0x08026694
	adds r0, #0x32
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xf0
	ble _080266A2
	movs r0, #3
	b _080266B4
_080266A2:
	cmp r0, #0xa0
	ble _080266AA
	movs r0, #2
	b _080266B4
_080266AA:
	cmp r0, #0x50
	bgt _080266B2
	movs r0, #0
	b _080266B4
_080266B2:
	movs r0, #1
_080266B4:
	bx lr
	.align 2, 0
