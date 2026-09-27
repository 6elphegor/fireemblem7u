	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A0A10
sub_080A0A10: @ 0x080A0A10
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	bgt _080A0A22
	cmp r0, #0
	ble _080A0A2A
	movs r0, #1
	b _080A0A2C
_080A0A22:
	cmp r0, #0xd
	ble _080A0A2A
	movs r0, #1
	b _080A0A2C
_080A0A2A:
	movs r0, #0
_080A0A2C:
	bx lr
	.align 2, 0
