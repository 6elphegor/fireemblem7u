	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemWeaponEffect
GetItemWeaponEffect: @ 0x08017424
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017438 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x1f]
	bx lr
	.align 2, 0
_08017438: .4byte 0x08BE222C
