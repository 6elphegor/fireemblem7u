	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC5E0
sub_080BC5E0: @ 0x080BC5E0
	adds r1, r0, #0
	movs r2, #0
	b _080BC5EA
_080BC5E6:
	adds r2, #1
	adds r1, #0xc
_080BC5EA:
	ldr r0, [r1]
	cmp r0, #0
	bne _080BC5E6
	adds r0, r2, #0
	bx lr
