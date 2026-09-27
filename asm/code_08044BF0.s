	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044BF0
sub_08044BF0: @ 0x08044BF0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _08044C04 @ =0x03001400
_08044BF8:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08044C08
	adds r0, r1, #0
	b _08044C0E
	.align 2, 0
_08044C04: .4byte 0x03001400
_08044C08:
	adds r1, #1
	cmp r1, #0x13
	ble _08044BF8
_08044C0E:
	bx lr
