	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4D94
sub_080A4D94: @ 0x080A4D94
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #0x20
	bne _080A4DA4
	bl sub_080A511C
_080A4DA4:
	pop {r0}
	bx r0
