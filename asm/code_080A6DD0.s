	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6DD0
sub_080A6DD0: @ 0x080A6DD0
	ldr r1, _080A6DDC @ =0x08CE475C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A6DDC: .4byte 0x08CE475C
