	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5420
sub_080B5420: @ 0x080B5420
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x54
	movs r1, #1
	strb r1, [r0]
	bx lr
