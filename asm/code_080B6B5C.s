	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6B5C
sub_080B6B5C: @ 0x080B6B5C
	lsls r0, r0, #4
	ldr r1, _080B6B64 @ =0x08CED888
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080B6B64: .4byte 0x08CED888
