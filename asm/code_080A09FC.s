	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A09FC
sub_080A09FC: @ 0x080A09FC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	bgt _080A0A0A
	movs r0, #0
	b _080A0A0C
_080A0A0A:
	movs r0, #1
_080A0A0C:
	bx lr
	.align 2, 0
